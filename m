Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF33352C4C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770476836; cv=none; b=HZO1y109bLaPPPbF9qQ6n1oMcrodFnmqSHWLDEpEPI2j/UHmqluoqX6gHLM0B2w/6QZSU5XMjqkYjJDvD2112vNfH4pvIa3MsrQmHaZMI88I9OQEvDgE1qGlWb7T1hJ8pyr0tLFEJCwSH4a55FvlUJsl4VdlQ9nzAbXU3dYeuDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770476836; c=relaxed/simple;
	bh=jKmBwlkDaxwwzB/nOoTIDZwJhT0W8MPcTO7RlBdSH+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JgAYWVxgwUFXGFQ+v6MP1h5nnNoKcvkCI6VSJeBk5oLQIpzLNCzV7NNxXfqpbXEm/7mkL4fGvsUS0qErX94MH16x/fyX1WIENoKGXzjAuZm6XOZK3SpfPo0dT0OwSBO+az1IFM+s63zaJthO7TGLe3iB535fN/eaDtRrykH0tz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBHaVDDU; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBHaVDDU"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b71557299dso1563432eec.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 07 Feb 2026 07:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770476835; x=1771081635; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cgG9/wts9QH62ITgMceLtzgD0EV87E5xvGvT+6c40XY=;
        b=RBHaVDDUONzaWLvlF0xf6G0TX8xXXkn10hGU4mmOeAILKBikGpbwxrRzwZefSgd/DJ
         +O/xE9l3B9w+ZKfUAhVYtHU44Ly8ucuPe/Q0/KESHFY808CtAty8ypelJxs7Tpw1zVtL
         XaxWPBVxtj281RuMsS3EjTYwSDBQmZgOazgRbMSyrC2ecr6wFUsTeHBb3QnJBBfYPPiw
         inB5o9EQ0z35IlPTl2qTQD2UWL1gc9r03pGt9ysft3MOuT6wyASCnMW5d+Gjr8wRIqNE
         WYnomhYKE4zImJjZrXv8d7sNXYjOvwX2fOaG2Sre0/waPO41WAvr9uwX+CSnXhERfvrn
         YpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770476835; x=1771081635;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgG9/wts9QH62ITgMceLtzgD0EV87E5xvGvT+6c40XY=;
        b=r2W3lmh3Cx9DkqKVty7sF21uB8jQX38G+o3myNVzEefuhzwqxNrgNTliUjVEsKsoE1
         FPhAv/sf3XqeizEEtkO5sfS1V7jar/LAr7WV4OROCuYcU0T0bLPo930MRFO42kWXJb5x
         ivZLS0amJgvbOebd+dIBIr6/o8LmVWE+lu2HknvOHjWLxYpkx5MZmKeC/pisje7ZP30B
         rFXfF6wBWmT3DiDmb6xeYfVKU+ztQ5O+JYgpePj8xNRsfh9WWZ3Kaka9qFCagJu/hi2a
         jjFOjv/dksbkDE7GMbU69xaISKy1xXULaq7SqLKZBfHr0R7to2m9NmOvGYUtc6BvTN/s
         YirA==
X-Forwarded-Encrypted: i=1; AJvYcCUrMmps/EHFiT/3yUgfa+WTJUGN9kgDk2ee0FM12UoszV4Ggc1gpPl/dqdgdb6KL3XVau5Lj1ZeIWmQpnED@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp5LhEoM/T3oMPegKclwL2QXcCoo2Ltmrpg7ZvrzTmUPujmRtp
	PMJHZaGk5MnVEu8FbrpvKc3o4TcUskbT0oyVBve3z9aFKroT6o9bWlq8
X-Gm-Gg: AZuq6aJLKAz/UISWMuOvOBtT1B6yKEUaWHhR/mHAHY9SALbtTe4fFF7tGr74QTxmx3o
	QrdJjox/TkFc9U1mBPIdkDl3fuzrDBgXK6RGn24Uj/fHNUFN2RFnxi3zGolLdeK8iOCOs+3sd2U
	R3HmKXBDoMr7vO4JjYeE5/Oo6KNPR/jNPwF4QKpdqnKoCOheHTnmmNJ/6C71isQZkHlLP4218Bg
	ITMzPWPksKFfpNWQshtV8Pwe+OCHGAF+WrNy0r6fNJ2qPpXWTmX4hkEBKcaJ0a5MU8167D6lVns
	u8CpFoIVLHwTkJT3faOhQv3ckqEnozAtyWlgzJTun3+1E5EFYTELF/qb+jAq9CHjWadj4ZJELk2
	nuesuFwEklpKpMOzO5FuEtMIZ8OS7YbIndQ1avBr6p+FzFisXhGZ8JcPEJTlxRDGj2M09W9VynI
	v4aE43MRyJ0Xh36pZvbUFyCCGP8QLslbrqZ0sw/CW5CJtX3ViJLB44ToczxlLH
X-Received: by 2002:a05:7300:8c03:b0:2b7:fdb6:ccc2 with SMTP id 5a478bee46e88-2b856484a35mr2869852eec.16.1770476835306;
        Sat, 07 Feb 2026 07:07:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm5143711c88.11.2026.02.07.07.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 07:07:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <957068ee-7368-4fd1-9e55-1449414238be@roeck-us.net>
Date: Sat, 7 Feb 2026 07:07:13 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 10251/12094] drivers/hwmon/cros_ec_hwmon.o:
 error: objtool: cros_ec_hwmon_read+0x6c: can't find jump dest instruction at
 .text+0xd2d
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org
References: <202602071311.Q6tATiyh-lkp@intel.com>
 <4db66fc2-dc8a-4499-bc9d-c1f85e2ba4c1@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <4db66fc2-dc8a-4499-bc9d-c1f85e2ba4c1@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/7/26 02:56, Thomas Weißschuh wrote:
> On 2026-02-07 13:14:53+0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   9845cf73f7db6094c0d8419d6adb848028f4a921
>> commit: 165c14597d53cfa7bc97b4ff8bc85f7bd98262b7 [10251/12094] hwmon: (cros_ec) Add support for temperature thresholds
>> config: x86_64-randconfig-071-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071311.Q6tATiyh-lkp@intel.com/config)
>> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071311.Q6tATiyh-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202602071311.Q6tATiyh-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/hwmon/cros_ec_hwmon.o: error: objtool: cros_ec_hwmon_read+0x6c: can't find jump dest instruction at .text+0xd2d
> 
> This is due to the call to unreachable() in cros_ec_hwmon_attr_to_thres().
> Replacing it with BUG() avoids the issue.
> 
> Guenter, do you want to drop the patches for now and I'll resend them
> next cycle? I can also send an incremental patch. Or you just fix it up
> in your branch.
> 

I strongly dislike BUG() because it means "I don't trust my own code".
The final "else" in the code is not really necessary and should be dropped.

I can do that if you like, but I won't introduce BUG().

Thanks,
Guenter

