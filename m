Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DF6A2D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735604030; cv=none; b=TITFRNxemGdrE6KJdOaC08elWivhPQFmthXTzG1HboXsDNLu61qHzyGS4T4tnCSGUp1aa7exMpAvz9g2c8BHzZgMrrucNQGZRyjHsiDxagmqA3MxxdLJXeDWXTUun32r8oQzCWo1tRYq6nGcfAJFeBNukAOJ9qbXpCp6rqj2Tww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735604030; c=relaxed/simple;
	bh=Hn51BKa8KVxJlKXrga7WxYBkfzVkGnmqSGROYPAVLU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwqpLp5InEbtjQkKirnIKIrD1dJPpJcJqXI0zlYrktFyTu3ByGWsANsDkI9HiD44VBEyjPVgW2uygxjkFYxwTM0y0yE7vdUJdGppLFr6aCIJM5uxueUDT+DA67emH3QzJlE7CmSUKfuE8qtTdwh5TaR7X20XlLVthsaose1dQ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=uHifxw9f; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="uHifxw9f"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2166651f752so144779555ad.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 16:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1735604027; x=1736208827; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fqm5vgG4LgjYio7RVlxn+impghgpwYR2iwpOemZ3M4U=;
        b=uHifxw9fjVfPH4odj9+xTxu8kakhZdBL5zKua0E98eoLkXzTR7irhrl/7cOxNdCxfe
         EuXMwYN2zlpynmAxBYnft8BPfuD4sTN7ww3sO0OhD/umSbBLydrG0L/0+IgeXgKEQ5GK
         r1ym3rNqFRvDV6Xa30nARM3GecwgxQXrpc6CSbLmgJG+wZ2sklgaxsr246m+9hnT4S+H
         QndHPLjoUyYHt+8NbTzIpN3o64PyFodS7I7CQYdvpjTy0VbOHRam7UfJpEDRafk2+rh5
         fEcinZqUh6mBcddPenUNBh4nGGXMHiuHCXL9bcFoxtEXs7j2luTZmlxfV6IJGSWS4Ymp
         zYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735604027; x=1736208827;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fqm5vgG4LgjYio7RVlxn+impghgpwYR2iwpOemZ3M4U=;
        b=knNd7KWFf3afYO8QXNXsdCT72HUT1rLOnqyQKQhAgweEcHexna8RlxonfE7uCp003a
         IFo+emEtiYRtbjI1m9zN7uBLczhr0w9HaeaF+S6wPEx2Ezmt480ftue6E6NwsefXcbgt
         GOP6BD5O773JsvnsYeK3GcOEx0hGj2Q9Iny0UsMm3baUDKi3iRVyuCDnkrIzw4BHqUi3
         pxq5xlQh54CKmXp4tqPmIG3yTlGgccfyqRxrIi0xz/ncJI/oNKt3Do2vXx1oVMsvaZbG
         oziQaPI3CVBWI5+To9NzhSL3Ua//mHGkOqKJjwsL5zptMq72ADcNmaoBCAiOJRHE+gjU
         96nw==
X-Forwarded-Encrypted: i=1; AJvYcCVmimROasUBm9ow99kMhVmD4/0LuOWWyyyA+is+RH8eulzXL0ECLgZWDBDxetdDnaLJgYwbbgVmcjJbfMNP@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ7AuYUgqui2RIWLhTB3KHpuoB8Y0G7exKudbXpcfAXtV1W3vE
	/np9dC2AcdI/LJi1uzVD7iHvRIcFQ40ms157Vi1loQ16srURWjtVhBThQONtMmU=
X-Gm-Gg: ASbGnct+FdR0Lkw+qK9vCv+UNhHKdYivHXp5Eg4kYctloKwq/xowBlLL9Qo2vhiOgQP
	lnYiBGJNdXoPX3ejSSDrhzpx9wg6NV29wMQk2LCAXbqla+0NsX8fMO3N00W7VEprJqkjWg/9a7C
	Bj+74XxRxmgysBpDDVGiBgiRer9NtSRgwHGNjd7GGk8IblYJwDwA+3AZOJ3k9O0/nnUpQgOB/XC
	F478SLSdfDM7tOrtbnZ7Ef/PWYr/S+eBtnO6RAb9R2qA87+jv8u/Q==
X-Google-Smtp-Source: AGHT+IG+4MHWsFAh1dj/bqPUpWvRiDdEur3A7ApG0pMskZYb9/GkfpyMBzjR4CVqkM//2xQBBVgThw==
X-Received: by 2002:a17:903:41c8:b0:216:725c:a12c with SMTP id d9443c01a7336-219e6e8bba0mr453290855ad.9.1735604026911;
        Mon, 30 Dec 2024 16:13:46 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde01sm184205145ad.143.2024.12.30.16.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 16:13:46 -0800 (PST)
Message-ID: <7857f4bd-b200-46e9-b0fd-df9b862ca928@kernel.dk>
Date: Mon, 30 Dec 2024 17:13:45 -0700
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
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
References: <202412262106.bjOOaZcE-lkp@intel.com>
 <3448d884-c2ec-42c5-bbf0-04a90943d6f7@kernel.dk>
 <87o70s7ovp.fsf@mailhost.krisman.be>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <87o70s7ovp.fsf@mailhost.krisman.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/30/24 4:05 PM, Gabriel Krisman Bertazi wrote:
> Jens Axboe <axboe@kernel.dk> writes:
> 
>> On 12/26/24 6:13 AM, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
>>> commit: 694022b01368387cc1ed8485e279dfe27939ee43 [3610/5236] io_uring: Add generic helper to allocate async data
>>> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241226/202412262106.bjOOaZcE-lkp@intel.com/config)
>>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412262106.bjOOaZcE-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202412262106.bjOOaZcE-lkp@intel.com/
>>>
>>> Note: the linux-next/master HEAD 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2 builds fine.
>>>       It may have been fixed somewhere.
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>    In file included from io_uring/io_uring.c:82:
>>>    io_uring/io_uring.h: In function 'io_uring_alloc_async_data':
>>>>> io_uring/io_uring.h:229:27: error: implicit declaration of function
>>>>> 'io_cache_alloc'; did you mean 'kmem_cache_alloc'?
>>>>> [-Werror=implicit-function-declaration]
>>>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>>>          |                           ^~~~~~~~~~~~~~
>>>          |                           kmem_cache_alloc
>>>    io_uring/io_uring.h:229:25: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>>>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>>>          |                         ^
>>>    In file included from io_uring/io_uring.c:104:
>>>    io_uring/alloc_cache.h: At top level:
>>>>> io_uring/alloc_cache.h:33:21: error: conflicting types for
>>>>> 'io_cache_alloc'; have 'void *(struct io_alloc_cache *, gfp_t, void
>>>>> (*)(void *))' {aka 'void *(struct io_alloc_cache *, unsigned int,
>>>>> void (*)(void *))'}
>>>       33 | static inline void *io_cache_alloc(struct io_alloc_cache *cache, gfp_t gfp,
>>>          |                     ^~~~~~~~~~~~~~
>>>    io_uring/io_uring.h:229:27: note: previous implicit declaration of 'io_cache_alloc' with type 'int()'
>>>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>>>          |                           ^~~~~~~~~~~~~~
>>>    cc1: some warnings being treated as errors
>>> --
>>>    In file included from io_uring/opdef.c:11:
>>>    io_uring/io_uring.h: In function 'io_uring_alloc_async_data':
>>>>> io_uring/io_uring.h:229:27: error: implicit declaration of function
>>>>> 'io_cache_alloc'; did you mean 'kmem_cache_alloc'?
>>>>> [-Werror=implicit-function-declaration]
>>>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>>>          |                           ^~~~~~~~~~~~~~
>>>          |                           kmem_cache_alloc
>>>    io_uring/io_uring.h:229:25: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>>>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>>>          |                         ^
>>>    cc1: some warnings being treated as errors
>>>
>>>
>>> vim +229 io_uring/io_uring.h
>>>
>>>    224	
>>>    225	static inline void *io_uring_alloc_async_data(struct io_alloc_cache *cache,
>>>    226						      struct io_kiocb *req,
>>>    227						      void (*init_once)(void *obj))
>>>    228	{
>>>  > 229		req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>>>    230		if (req->async_data)
>>>    231			req->flags |= REQ_F_ASYNC_DATA;
>>>    232		return req->async_data;
>>>    233	}
>>>    234	
>>
>> Gabriel, you add the alloc_cache.h include 3 patches too late, so biection
>> breaks for the series after this identified commit.
> 
> This is nasty.  What's the best course of action?  Do you want to drop
> the series since it is still in your branch and I can resend with this
> fixed?  Or is it too late since it made into -next?  Sorry for this and
> the other issue. This series was actually less harmless than I expected
> and even though I always do a last minute 'git rebase --exec make'
> before sending, I clearly failed to do it here.

Since it's still a ways off from the merge window, I just rebased from
the offending patch and to the top. So it's all sorted out.

-- 
Jens Axboe
