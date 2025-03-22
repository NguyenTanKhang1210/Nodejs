import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello mn!!!';
  }
}

// npm run start:dev <==> nodemon index.js
