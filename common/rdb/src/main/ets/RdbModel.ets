import {  relationalStore, ValuesBucket } from "@kit.ArkData"

export class data1{
  date:string=''
  text:string=''
}

export class DatabaseUtil{
  private rdbStore:relationalStore.RdbStore|undefined=undefined
  private tableName:string='journal_data'

  createDB(context:Context){
    const config:relationalStore.StoreConfig={
      name:'journal.db',
      securityLevel:relationalStore.SecurityLevel.S1
    }
    const createTableSQL=`create table journal_data(
                          date date primary key,
                          text text null);`
    relationalStore.getRdbStore(context,config,(err,rdbStore)=>{
      if(err){
        console.log('获取rdbStore失败: errCode:'+err.message)
      }
      rdbStore.executeSql(createTableSQL, (err,) => {
        if (err) {
          console.log('创建表格失败 errCode:' +err.code+'errMessage:'+ err.message)
        }else{
          console.log('成功创建表格journal_data')
        }
      })
      this.rdbStore=rdbStore
    })
  }

  addData(data:data1):number{
    let rowID:number=-1
    const dataBucket:ValuesBucket={
      date:data.date,
      text:data.text
    }
    if(this.rdbStore!=undefined){
      try {
        rowID = (this.rdbStore as relationalStore.RdbStore).insertSync(this.tableName, dataBucket, 4)
        console.log(`添加成功，rowID:${rowID}`)
      }catch (error){
        console.log('添加失败，errCode:'+error.code+error.message)
      } finally {
        return rowID
      }
    }else {
      return rowID
    }
  }

  getAllData():data1[]{
    let predicates=new relationalStore.RdbPredicates(this.tableName)
    predicates.orderByAsc('date')
    predicates.isNotNull('text')
    let data:data1[]=[]
    try {
      let resultSet:relationalStore.ResultSet=(this.rdbStore as relationalStore.RdbStore).querySync(predicates)
      while(resultSet.goToNextRow()){
        const date=resultSet.getString(resultSet.getColumnIndex('date'))
        const text=resultSet.getString(resultSet.getColumnIndex('text'))
        let data_one:data1=new data1()
        data_one.date=date
        data_one.text=text
        data.push(data_one)
      }
      resultSet.close()

    }catch (err){
      console.log('查询失败,errorCode:'+err.message)
    } finally {
      return data
    }
  }

  deleteData(date:string):number{
    console.log('执行了删除操作')
    let rows:number=0
    let predicates=new relationalStore.RdbPredicates(this.tableName)
    predicates.equalTo('date',date)
    if(this.rdbStore!=undefined){
      try {
        rows = (this.rdbStore as relationalStore.RdbStore).deleteSync(predicates)
        console.log('删除行数:'+rows)
      }catch (err){
        console.log('删除失败'+err.message)
      } finally {
        return rows
      }
    }else{
      return rows
    }
  }

  updateData(data:data1):number{
    let rows:number=0
    let predicates=new relationalStore.RdbPredicates(this.tableName)
    predicates.equalTo('date',data.date)
    const dataBucket:ValuesBucket={
      'date':data.date,
      'text':data.text
    }
    if(this.rdbStore!=undefined){
      try {
        rows = (this.rdbStore as relationalStore.RdbStore).updateSync(dataBucket, predicates, 5)
        console.log('更新rows'+rows)
      }catch (err){
        console.log('更新失败'+err.message+err.code)
      } finally {
        return rows
      }
    }else {
      return rows
    }
  }

}


