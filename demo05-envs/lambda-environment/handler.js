'use strict';

module.exports.scheduler = async (event) => {
  console.log("***evn", process.env)
  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        message: 'Go Serverless v2.0! Your function executed successfully!',
        input: event,
      },
      null,
      2
    ),
  };
};
