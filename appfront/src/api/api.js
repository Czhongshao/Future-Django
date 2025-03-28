import axiosInstance from './index'

export const getBooks = () => {
    return axiosInstance.get('/api/books/')
}

export const postBook = (bookName, bookAuthor) => {
    return axiosInstance.post('/api/books/', { name: bookName, author: bookAuthor })
}