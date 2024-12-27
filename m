Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473761F708D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 17:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735319415; cv=none; b=ROMOA7sgxMhl4Vl3ChJLLn/wgkikCG/BwoyPJoGjtGo+7fEIsg+amSZPnLvmUqWXNDvm5XOA38wSXsEfy9QYalIi9a0DkBCKUcnIjuoH/bJHq+ugVSc2bAzmmHrMSW/4UXUFtTP9SEzO5FcCXijSnYv/SD+ucVeSE1Hr2xrBjiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735319415; c=relaxed/simple;
	bh=WUICMS/O3ZiSOTvQUUJVpAHSi7Y1Mw3L1B1CxWxkOxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F87XCg4sEA/MwhwRBujCoY2/W0EsmTy5LpJ9J6dDlQr43HTSLtgBh5HKZxkvmRa8CzmSntzWrauZlUk0X7R5GExnOLio6+cRPsHR/zYoh6KThU0g0YNmojZW4xpXFVpkgvOLUjeSegR05BQWUk30oz/VvkotCFoR/g/HxFVqUjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=VeSyoGmg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="VeSyoGmg"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2163b0c09afso88802745ad.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 09:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1735319411; x=1735924211; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZajf1nX3X4NF+NzKk9sToMunaOSvGSLlh6FSR3/DNE=;
        b=VeSyoGmg3FbRe5yp12I1Dlyt0WI/5euy1ScZ4sczYzMbb06lIRFcxkuWD2afwbc/M7
         3bjTM7JGi0jA6AMfFGhNmF9Bx1DHiZZEcCE08GK/rp2LfPT6qX87Wz4pYsiTzbjEju62
         lti3tqc9WuY/1M+IgoOvG0+hoHQnCoLZAjGPMUVBV6IKGJJuhq/ex95xZktm1fjGUABJ
         NPHLKZjf2ESNvkzb85mvDTPJtGQxbICu/aHeci+Zm/1m9b0jBe0FFfSpVEyoF+ShQZCE
         TJ3it39X3TdRTDaokFzsX5FaotCCucmtq9Iql98E5WTHqQqvOW9JndPoLAqfe0ntzpyN
         WXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735319411; x=1735924211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZajf1nX3X4NF+NzKk9sToMunaOSvGSLlh6FSR3/DNE=;
        b=SFqYu2uuzt45GFsB7rGtE/2ArjP/P61j/3IedsjwMd20QxwYoqTG39Z80Oe3NbalY1
         BJ86plUmsFMGLXAYEVgpqvLhUSRrMPNPTKnzhHai28Sp0zi+kV9ThUdLzxnPMPBAQtWl
         WIGm9Xm890FcaZMFo4+zGVtPuuST43LMe9DGzj2XSX/6W03xHB2hxq6KGlEVi726Gl4/
         8kzZoAJ63c8DxPijKuxx62/3kwC+McqGJuHV0F3uGmmYQ22iJ7WBU048ZEgwQd1TmOH8
         eim0nwpAMbSpy3+nRtHiIkoIHTXr80L9PyyciiUUugkWjHiyxNE3IGKwYo+gL5pJXT9C
         5wpw==
X-Gm-Message-State: AOJu0YwZtGfsApwFJ9fKoSCH0PqrrAnEB4CKHGcwabrPuYDwk5h4qVLT
	baL34DyD0PwuN/qCCjLnnnQabK77e3lnBC/Ko3UQZePOJnsiIdWKn08g1Jm6mBXtVSUWR9AWNFM
	o
X-Gm-Gg: ASbGncvHfqW2nFcAVEaJFHh8SVKCuvomCjbHOgV2+XOeKcUJONK1Qo9h1TN7ALcY4ND
	ofoP9gUwv9wCpIofAwUj0kGQLJ8+RQHglmPBoZRtVTiWOdWW3VCBQ7aozfIXqxEbSIZhm3KTYxE
	CRmOzZBouGJuDdisVkyM8cvx63Cjj18v3Dyxg6ixPFYeCblYSIRTGd8GReY095hNyv4Qfmdi4wm
	aQqdt6/FecGUMKSXOi5AJ3T/NDyYHorSVl2Cr5rc5FBfI+OIrITjA==
X-Google-Smtp-Source: AGHT+IF6qBmgb7UiQg0LRnyEVIwikqkXUb62Xf51SqMipUL4yKm+hTrySLInKAoT4ws/VMy0bPFFsA==
X-Received: by 2002:a05:6a20:6a25:b0:1d9:18af:d150 with SMTP id adf61e73a8af0-1e5e05a9e39mr43321019637.21.1735319411561;
        Fri, 27 Dec 2024 09:10:11 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c13esm14823763b3a.190.2024.12.27.09.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 09:10:10 -0800 (PST)
Message-ID: <3448d884-c2ec-42c5-bbf0-04a90943d6f7@kernel.dk>
Date: Fri, 27 Dec 2024 10:10:09 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3610/5236] io_uring/io_uring.h:229:27: error:
 implicit declaration of function 'io_cache_alloc'; did you mean
 'kmem_cache_alloc'?
To: kernel test robot <lkp@intel.com>,
 Gabriel Krisman Bertazi <krisman@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
References: <202412262106.bjOOaZcE-lkp@intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202412262106.bjOOaZcE-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/26/24 6:13 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> commit: 694022b01368387cc1ed8485e279dfe27939ee43 [3610/5236] io_uring: Add generic helper to allocate async data
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241226/202412262106.bjOOaZcE-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412262106.bjOOaZcE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412262106.bjOOaZcE-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from io_uring/io_uring.c:82:
>    io_uring/io_uring.h: In function 'io_uring_alloc_async_data':
>>> io_uring/io_uring.h:229:27: error: implicit declaration of function 'io_cache_alloc'; did you mean 'kmem_cache_alloc'? [-Werror=implicit-function-declaration]
>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>          |                           ^~~~~~~~~~~~~~
>          |                           kmem_cache_alloc
>    io_uring/io_uring.h:229:25: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>          |                         ^
>    In file included from io_uring/io_uring.c:104:
>    io_uring/alloc_cache.h: At top level:
>>> io_uring/alloc_cache.h:33:21: error: conflicting types for 'io_cache_alloc'; have 'void *(struct io_alloc_cache *, gfp_t,  void (*)(void *))' {aka 'void *(struct io_alloc_cache *, unsigned int,  void (*)(void *))'}
>       33 | static inline void *io_cache_alloc(struct io_alloc_cache *cache, gfp_t gfp,
>          |                     ^~~~~~~~~~~~~~
>    io_uring/io_uring.h:229:27: note: previous implicit declaration of 'io_cache_alloc' with type 'int()'
>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>          |                           ^~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> --
>    In file included from io_uring/opdef.c:11:
>    io_uring/io_uring.h: In function 'io_uring_alloc_async_data':
>>> io_uring/io_uring.h:229:27: error: implicit declaration of function 'io_cache_alloc'; did you mean 'kmem_cache_alloc'? [-Werror=implicit-function-declaration]
>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>          |                           ^~~~~~~~~~~~~~
>          |                           kmem_cache_alloc
>    io_uring/io_uring.h:229:25: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>          |                         ^
>    cc1: some warnings being treated as errors
> 
> 
> vim +229 io_uring/io_uring.h
> 
>    224	
>    225	static inline void *io_uring_alloc_async_data(struct io_alloc_cache *cache,
>    226						      struct io_kiocb *req,
>    227						      void (*init_once)(void *obj))
>    228	{
>  > 229		req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>    230		if (req->async_data)
>    231			req->flags |= REQ_F_ASYNC_DATA;
>    232		return req->async_data;
>    233	}
>    234	

Gabriel, you add the alloc_cache.h include 3 patches too late, so biection
breaks for the series after this identified commit.

-- 
Jens Axboe

