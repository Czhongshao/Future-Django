// django-vue/src/api/vuesinfo.js
export function vuesClusterInfo(method, params) {
 
    if (method === 'GET') {
        // 如果是GET请求，将参数拼接到URL上
        //url += '?' + new URLSearchParams(params).toString();
        return fetch('/vues/info/', {
            method: 'GET',  //可以是post请求 根据你后端逻辑判断即可
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok')
                }
                return response.json()
            });
    } else if (method === 'POST') {
        // 如果是POST请求，将参数放在请求体中
        return fetch('/vues/info/', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(params)
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok')
                }
                return response.json()
            });
    } else {
        throw new Error('Unsupported method')
    }
}


