Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AAA1E0E14
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 02:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602076; cv=none; b=OPhO4v2vztDqM26KlzY6Ez9oiW6qbgFK+tsY6XAplmQ99oY2MNeTpLj6iIXSPjAsy84hTGGwkxIUuh+NXLhO8ISjuZrphZ9OQ1AXlZgWUO0PWSKXOXoJFqFa4urW5g2XKpv8KtnzCtqHZx+xCMOQGNNtsoX+Vd65Io5R3NOFWiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602076; c=relaxed/simple;
	bh=Q9rpSqqTE9/UEI47tTSxVH9pnhPnaV3BaP0My1vNZTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qiJOolXH1SEw2hwUQzkkyyWKDB8+Al6/xAuaJgxgTyit5NjlLIWVatVkU5pFTW1Bwb63ttPySM/XU4X+E8qeupGN4zJcE65ZH6Snf8Ld91GivmwAVVtvO1CtELMlxJ/uM6EYFoaPmGIkdgmCwL+F64+Gh8HdAe6lDrnym7YEU7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=mgAKaTUR; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="mgAKaTUR"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1dwpzgsCb+vjDqUnQJ22fRfcSgQ6KdYYtDjg5cOV9sQ=;
	b=mgAKaTURu1SV59KowWHwa0Q65nlY+aKaUKKZyNdwo6GquvgmSLl9Tax5jiKNisXIozZvcx/F7
	H9+3nxG0XpSXmTosvZY0IvIBEjoZqJ/OyK9OzlyAQSyLxBrV9nq4dFdhynuy/GUROCnKWZqW7jy
	AQI4ITovzTfo9Mp9kQAL4nU=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h41lj64g5zKm6J;
	Tue, 21 Jul 2026 10:38:25 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3D53F4055B;
	Tue, 21 Jul 2026 10:47:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jul 2026 10:47:49 +0800
Message-ID: <688eda6b-c5bd-4745-b45c-7e40ba3e53aa@huawei.com>
Date: Tue, 21 Jul 2026 10:47:48 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] entry: Provide stub for syscall_enter_audit() when
 auditing is disabled
To: Thomas Gleixner <tglx@kernel.org>, <peterz@infradead.org>,
	<luto@kernel.org>, <linux-kernel@vger.kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, Sven
 Schnelle <svens@linux.ibm.com>
References: <20260720094921.537716-1-ruanjinjie@huawei.com>
 <87cxwhn09i.ffs@fw13>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87cxwhn09i.ffs@fw13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 7/20/2026 11:34 PM, Thomas Gleixner wrote:
> On Mon, Jul 20 2026 at 17:49, Jinjie Ruan wrote:
>> When CONFIG_AUDITSYSCALL is not set, syscall_enter_audit() is not
>> defined, causing following undefined reference warning.  So add an empty
>> inline stub to resolve the missing symbol.
>>
>> 	include/linux/entry-common.h:109:(.noinstr.text+0x2e6): undefined reference to `syscall_enter_audit'
>>
>> Fixes: ff2b9a905930 ("entry: Rework syscall_audit_enter()")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202607181530.2nx8zb3J-lkp@intel.com/
> 
> This does not make any sense at all.
> 
> The call site is:
> 
>     if (audit_context())
>     	syscall_enter_audit(....);
> 
> audit.h has:
> 
> #ifdef CONFIG_AUDITSYSCALL
> ...
> #else
> static inline struct audit_context *audit_context(void) { return NULL; }
> #endif
> 
> which means the call to syscall_enter_audit() should not ever end up in
> the linker phase due to dead code elimination.

I agree with you.

> 
> Such constructs which rely on dead code elimination are not unique. The
> kernel is full of them.
> 
> The .config in the report builds without problems with s390-linux-gcc
> 15.2.0 (I verified that before merging), but fails with the version used
> by the robot:
> 
>    compiler: s390-linux-gcc (GCC) 13.4.0
> 
> So that's a broken compiler and without understanding the actual root
> cause we are not going to paper over it.
> 
> When I disable CONFIG_KASAN in that config the problem goes away....
> 
> I have no idea how that's related especially as the code in question is
> non instrumentable to begin with.
> 
> Looking at the disassembly:
> 
>         if (unlikely(audit_context()))
>  2da:   c0 e5 00 00 00 00       brasl   %r14,2da <__do_syscall+0x2da>
>                   2dc: R_390_PLT32DBL     audit_context+0x2
> 
> So dead code elimination does not work because the compiler puts the
> stub return NULL inline out of line....
> 
> The proper fix is below. The fixes tag wants to be:
> 
> Fixes: s390 cross GCC 13.4.0 brainfart
> 
> Thanks,
> 
>         tglx
> ---
>  include/linux/audit.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -343,7 +343,7 @@ static inline void audit_set_context(str
>  	task->audit_context = ctx;
>  }
>  
> -static inline struct audit_context *audit_context(void)
> +static __always_inline struct audit_context *audit_context(void)
>  {
>  	return current->audit_context;
>  }
> @@ -623,7 +623,7 @@ static inline bool audit_dummy_context(v
>  }
>  static inline void audit_set_context(struct task_struct *task, struct audit_context *ctx)
>  { }
> -static inline struct audit_context *audit_context(void)
> +static __always_inline struct audit_context *audit_context(void)
>  {
>  	return NULL;
>  }

Thank you!

I will revise it according to this.


> 

