Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8676D38A9A6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385271; cv=none; b=BxI0bfpD1oMbbWM/z6x/Feb/MEuUlqHDCpZlslMZfL7XUTWzYwVApORBcWaDPqTOGeMkvYs98F78qeWKJyzqQP863xEJ1an4kvj/a49rjyJehKCLXmu6ovoDyiEpRCUKbbugmz5Vb+lEkO7sV+KSFxoDc+X1T0u9qndWgF0KUwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385271; c=relaxed/simple;
	bh=RdIq/BVmV8hzqLxdX5d18w4fAVjGQsrhP3Kn/qccScA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VfVzWX+nMhTmgH5NtWaoFJ8ZIPeeXZX9SWQOe8FmfE68zOqACpSpeHRioe4/rhaLEN8cUxAzkCAPYtrbxYHMGncOPu5obrb/DVvNTMJQLTXrehlwQOJKRB64sTxlnWxbhMpq4MHDB1SAHO+JHqDFcI1Ydq04WTx+eGMzs52hzTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=ss8LmLLQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="ss8LmLLQ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso51053975e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 02:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1768385267; x=1768990067; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/Z0fmvqWsCnRnKPKt0QOH8rpFv1SlCdBRhOC+pQhwI=;
        b=ss8LmLLQvadWW4oZunJwhJYqNtDv+RP2DP/u6NF0xSrqi+SjP3S43Px/xWMrnlmrG7
         xNwLZZW+mIyKGXdxyRPNFaOrG9kTGJVEC5kQCOrtSm73gaPdWwLctbrVemECunOuBSk8
         weLWgN7I7bidciCGXwuO2OHUY94q2z5K736nf40Ahm6K+rH7ubrwk6czSrk9jtszG/6m
         Y17QL74eMFE458tAvp/WtiZshyiuBnLe1YbiiLdnCU7RME0Xj5pepOewJzaX0JT66Hys
         +/Nr5jcTSzE9AzzxJsveMp5wBzfk5N5uVRWx61M/jvmJn4tUVtDwkiqChQi/W1Tzotve
         aR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385267; x=1768990067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/Z0fmvqWsCnRnKPKt0QOH8rpFv1SlCdBRhOC+pQhwI=;
        b=dTC7suSh7LVGfImJgrhUJB3qGwzDcuvAoh0KBx7oRsj2SDLS+3IMNKuM+QhbO2PxJ3
         Dr+HWYw912uIjyubJroSIv3SaGJKa3FbvFplCgHgb06HA9SMEMGjP08eXGA9JBRthpqX
         DShhLjS+f4VWVJcxpOOPPzI93oHpd6TaXingZ2v5RcxejFKvuXWzA+EO8uFdYNp6akYR
         QfVZDT9lG2KvAfckC6TmrgU6tkg5QBcWuVjxWFvJFKNfw9FypmmUwZzqKw1ZizBGEquT
         9zWd4+/AaZi8bs+MzUAYir26GE8zAFL1hGGp7T7ATQSttCsqwXgwdGWM5VxkpxRkKDjm
         eMTQ==
X-Gm-Message-State: AOJu0YyZpe1pX6jELWz9oVhVsUKxnmtIf6EhY3fDUrsYNhcXqJGtXWII
	z3fPbpXTLFWMjEfs/6T44r+BSDXeKj51hkazGsHgSpO2WvrkHiuhKZqU1gp59xTU66M=
X-Gm-Gg: AY/fxX7gcp4PNzOahiLLpAH4zJxalS02qxpHJAG9goqSniU9bj7K48zNjCeNaCYIo2H
	4IR4KCpsy6w3R0ktJVZA47WV3fqYQPmqTzWY42PHbwb2PerAQRa57lHI+RN/3/6sJf5a7N1Smvv
	QecdpUm7IYWRigjA/id1tW5cWSkALjfUYzd/0+7yQ1SPUMUwCi6etWFPZ69DXu86/91xjC2XNr/
	FG5eNwfPHZVzD8rDRQ8aii/kX4ua2mPahSPrewsjT5rWnEVXWYmWQEfR8CEYGLsTs91dBezHsln
	Wm72V0xf2tGx4jw6Kl5y+ri+U6SDk3NJU43WM7I2eJnP725MlDkSt742RltbhzOXaCW53XryXZG
	QTA+0+MQZDKiWTXIrR9DalKW/RYzg+LMvHbjVnmdF3PQo21qqVAhGvCujFsODpz0Kvmvf0zkOey
	uHdSkpO911rLqB964FlhwOyl9yZKHJQX9T
X-Received: by 2002:a05:600c:4446:b0:477:76cb:4812 with SMTP id 5b1f17b1804b1-47ee47227cemr16589055e9.0.1768385266659;
        Wed, 14 Jan 2026 02:07:46 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee2829954sm16633155e9.5.2026.01.14.02.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:07:46 -0800 (PST)
Message-ID: <d74dec32-82ef-471f-b04c-2f97971e1f2a@ursulin.net>
Date: Wed, 14 Jan 2026 10:07:44 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] dma-buf: protected fence ops by RCU v5
To: kernel test robot <lkp@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20260113152125.47380-2-christian.koenig@amd.com>
 <202601141704.EpvIhy4M-lkp@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <202601141704.EpvIhy4M-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 14/01/2026 09:52, kernel test robot wrote:
> Hi Christian,
> 
> kernel test robot noticed the following build warnings:

New warnings aside, some of the old ones are caused by my changes last 
year. I sent a fix back then:

https://lore.kernel.org/dri-devel/20250616155952.24259-1-tvrtko.ursulin@igalia.com/

But it seems to have fallen through the cracks.

Maybe pull it to your series Christian to make sure you are getting 
report for only new warnings with any future respins?

Regards,

Tvrtko

> 
> [auto build test WARNING on drm-misc/drm-misc-next]
> [also build test WARNING on drm-xe/drm-xe-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-tip/drm-tip next-20260114]
> [cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.19-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-add-dma_fence_is_initialized-function/20260114-001656
> base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
> patch link:    https://lore.kernel.org/r/20260113152125.47380-2-christian.koenig%40amd.com
> patch subject: [PATCH 01/10] dma-buf: protected fence ops by RCU v5
> config: x86_64-randconfig-122-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141704.EpvIhy4M-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141704.EpvIhy4M-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601141704.EpvIhy4M-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>     drivers/dma-buf/dma-fence-unwrap.c: note: in included file:
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/dma-buf/dma-fence-array.c: note: in included file (through include/linux/dma-fence-array.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/dma-buf/dma-fence-chain.c: note: in included file (through include/linux/dma-fence-chain.h):
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/dma-buf/dma-resv.c: note: in included file (through include/linux/dma-resv.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/dma-buf/dma-fence.c:1042:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *timeline @@     got char * @@
>     drivers/dma-buf/dma-fence.c:1042:38: sparse:     expected char const [noderef] __rcu *timeline
>     drivers/dma-buf/dma-fence.c:1042:38: sparse:     got char *
>     drivers/dma-buf/dma-fence.c:1043:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *driver @@     got char * @@
>     drivers/dma-buf/dma-fence.c:1043:36: sparse:     expected char const [noderef] __rcu *driver
>     drivers/dma-buf/dma-fence.c:1043:36: sparse:     got char *
>     drivers/dma-buf/dma-fence.c:1160:44: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
>     drivers/dma-buf/dma-fence.c:1160:44: sparse:     expected char const [noderef] __rcu *
>     drivers/dma-buf/dma-fence.c:1160:44: sparse:     got char const *
>     drivers/dma-buf/dma-fence.c:1162:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
>     drivers/dma-buf/dma-fence.c:1162:24: sparse:     expected char const [noderef] __rcu *
>     drivers/dma-buf/dma-fence.c:1162:24: sparse:     got char *
>     drivers/dma-buf/dma-fence.c:1193:46: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
>     drivers/dma-buf/dma-fence.c:1193:46: sparse:     expected char const [noderef] __rcu *
>     drivers/dma-buf/dma-fence.c:1193:46: sparse:     got char const *
>     drivers/dma-buf/dma-fence.c:1195:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
>     drivers/dma-buf/dma-fence.c:1195:24: sparse:     expected char const [noderef] __rcu *
>     drivers/dma-buf/dma-fence.c:1195:24: sparse:     got char *
>     drivers/dma-buf/dma-fence.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/dma_fence.h):
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
> --
>>> drivers/gpu/drm/drm_crtc.c:161:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/drm_crtc.c:161:9: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/drm_crtc.c:161:9: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/drm_syncobj.c: note: in included file (through include/linux/sync_file.h):
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/ttm/ttm_bo.c:1203:31: sparse: sparse: symbol 'ttm_swap_ops' was not declared. Should it be static?
>>> drivers/gpu/drm/ttm/ttm_bo.c:226:27: sparse: sparse: dereference of noderef expression
> --
>     drivers/gpu/drm/scheduler/sched_fence.c:241:1: sparse: sparse: bad integer constant expression
>     drivers/gpu/drm/scheduler/sched_fence.c:241:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
>     drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: bad integer constant expression
>     drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>     drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: bad integer constant expression
>     drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
>>> drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/radeon/radeon_fence.c:73:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
>     drivers/gpu/drm/radeon/radeon_fence.c:73:40: sparse:     expected unsigned int volatile [usertype]
>     drivers/gpu/drm/radeon/radeon_fence.c:73:40: sparse:     got restricted __le32 [usertype]
>     drivers/gpu/drm/radeon/radeon_fence.c:95:31: sparse: sparse: cast to restricted __le32
>     drivers/gpu/drm/radeon/radeon_fence.c: note: in included file:
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/radeon/radeon_display.c: note: in included file:
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/radeon/radeon_sync.c: note: in included file:
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
>     drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:499:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>     drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c: note: in included file (through include/linux/dma-fence-chain.h):
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
> --
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:93:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:93:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:93:20: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through include/linux/dma-fence-array.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through include/linux/dma-fence-array.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/i915/gem/i915_gem_wait.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/gem/i915_gem_wait.c: note: in included file (through include/linux/dma-fence-array.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/i915/i915_request.c: note: in included file (through include/linux/dma-fence-array.h):
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/i915_request.c: note: in included file (through drivers/gpu/drm/i915/i915_active.h, drivers/gpu/drm/i915/gt/intel_context.h, ...):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/i915_request.c: note: in included file (through include/linux/dma-fence-array.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/i915_request.c: note: in included file (through drivers/gpu/drm/i915/i915_active.h, drivers/gpu/drm/i915/gt/intel_context.h, ...):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/i915_request.c: note: in included file (through include/linux/dma-fence-array.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/i915_request.c: note: in included file (through drivers/gpu/drm/i915/i915_active.h, drivers/gpu/drm/i915/gt/intel_context.h, ...):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/i915/display/intel_display_rps.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
>     include/linux/pwm.h:13:1: sparse: sparse: bad integer constant expression
>     include/linux/pwm.h:13:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
>     drivers/gpu/drm/i915/display/intel_display_rps.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h, drivers/gpu/drm/i915/i915_drv.h):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
> 
> vim +717 include/linux/dma-fence.h
> 
> 976b6d97c62347 Christian König 2022-01-19  708
> 976b6d97c62347 Christian König 2022-01-19  709  /**
> 976b6d97c62347 Christian König 2022-01-19  710   * dma_fence_is_chain - check if a fence is from the chain subclass
> 976b6d97c62347 Christian König 2022-01-19  711   * @fence: the fence to test
> 976b6d97c62347 Christian König 2022-01-19  712   *
> 976b6d97c62347 Christian König 2022-01-19  713   * Return true if it is a dma_fence_chain and false otherwise.
> 976b6d97c62347 Christian König 2022-01-19  714   */
> 976b6d97c62347 Christian König 2022-01-19  715  static inline bool dma_fence_is_chain(struct dma_fence *fence)
> 976b6d97c62347 Christian König 2022-01-19  716  {
> 976b6d97c62347 Christian König 2022-01-19 @717  	return fence->ops == &dma_fence_chain_ops;
> 976b6d97c62347 Christian König 2022-01-19  718  }
> 976b6d97c62347 Christian König 2022-01-19  719
> 

