class API {
    static async getRequest(__URL: string) {
        try {
            const response = await fetch(__URL, {
                headers: {
                    'Content-type': 'application/json',
                },
                credentials: 'include',
            });
            if (response.status === 401) {
                localStorage.removeItem('loggedIn');
                localStorage.removeItem('firstLogin');
                const data = await response.json();
                throw new Error(data.msg);
            }
            if (!response.ok) {
                const data = await response.json();
                throw new Error(data.msg);
            }
            const data = await response.json();
            return data;
        } catch (error) {
            throw new Error(error.message);
        }
    }

    static async postRequest(__URL: string, __data: object) {
        try {
            const response = await fetch(__URL, {
                method: 'POST',
                body: JSON.stringify(__data),
                headers: {
                    'Content-type': 'application/json',
                },
                credentials: 'include',
            });

            if (response.status === 401) {
                localStorage.removeItem('loggedIn');
                localStorage.removeItem('firstLogin');
                localStorage.removeItem('verified');
                const data = await response.json();
                throw new Error(data.msg);
            }
            if (!response.ok) {
                const data = await response.json();
                throw new Error(data.msg);
            }
            const data = await response.json();
            return data;
        } catch (error) {
            throw new Error(error.message);
        }
    }
}

export default API;
