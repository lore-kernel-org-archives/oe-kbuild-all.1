Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2366F1DF24E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737297586; cv=none; b=DoNczLfLqnbmTgvFmGEPRL6S9ws5Coxu0q5Mt8WdKytmLIZ2atX9QK7X3QMGegu4kEJvCG3CPN8KV+O91q0LavUuC/76skZIhtXV44TkJ/AMiSji/7NCbHsTWbteYNScxrqODulbGOyqJt8XBpLN/7mb+psVtPp84a/KLFNKIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737297586; c=relaxed/simple;
	bh=H7EDahBtclmgnFXBoFOFC9LnY91RRM3qg5v6amedgD0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=DtWLHrepZo6DmoW2rAD23BvyG1R/IdP6ENgey9aB2a5um+BLfv782Rz1snC4jDgRv73kgSW5UW+LskKVqnXJ2EcNDk+arCJWSxy56gMYtMCd/6fUYw7Kb54G95zr4+IrLWFGs5/zc93WyRK2R3DhnRhbtWB6o6ULaUzrWgbwbqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A9EEE2B8740;
	Sun, 19 Jan 2025 15:39:40 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id yV1uUaXW8m9B; Sun, 19 Jan 2025 15:39:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E7FAA2B8741;
	Sun, 19 Jan 2025 15:39:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id al1W2D3tAEzv; Sun, 19 Jan 2025 15:39:39 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C63712B8740;
	Sun, 19 Jan 2025 15:39:39 +0100 (CET)
Date: Sun, 19 Jan 2025 15:39:39 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: kernel test robot <lkp@intel.com>
Cc: Rickard X Andersson <rickard.andersson@axis.com>, 
	oe-kbuild-all <oe-kbuild-all@lists.linux.dev>, 
	chengzhihao1 <chengzhihao1@huawei.com>
Message-ID: <304509708.249444175.1737297579621.JavaMail.zimbra@nod.at>
In-Reply-To: <202501191405.WYnmdL0U-lkp@intel.com>
References: <202501191405.WYnmdL0U-lkp@intel.com>
Subject: Re: [rw-ubifs:next 7/7] arch/riscv/include/asm/uaccess.h:33:9:
 error: cast specifies array type
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133 (Linux)/8.8.12_GA_3809)
Thread-Topic: arch/riscv/include/asm/uaccess.h:33:9: error: cast specifies array type
Thread-Index: D/Tm4YFgN/lr9wjQwz62b3sd4pMqzw==

----- Urspr=C3=BCngliche Mail -----
> Von: "kernel test robot" <lkp@intel.com>
> An: "Rickard X Andersson" <rickard.andersson@axis.com>
> CC: "oe-kbuild-all" <oe-kbuild-all@lists.linux.dev>, "richard" <richard@n=
od.at>, "chengzhihao1"
> <chengzhihao1@huawei.com>
> Gesendet: Sonntag, 19. Januar 2025 07:29:22
> Betreff: [rw-ubifs:next 7/7] arch/riscv/include/asm/uaccess.h:33:9: error=
: cast specifies array type

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git next
> head:   01099f635a4c68b8574d350a972ba062dd5142e9
> commit: 01099f635a4c68b8574d350a972ba062dd5142e9 [7/7] ubi: Implement ioc=
tl for
> detailed erase counters
> config: riscv-randconfig-001-20250119
> (https://download.01.org/0day-ci/archive/20250119/202501191405.WYnmdL0U-l=
kp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20250119/202501191405.WYnmdL0U-l=
kp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes:
>| https://lore.kernel.org/oe-kbuild-all/202501191405.WYnmdL0U-lkp@intel.co=
m/
>=20
> All errors (new ones prefixed by >>):
>=20
>   In file included from include/linux/build_bug.h:5,
>                    from include/linux/container_of.h:5,
>                    from include/linux/list.h:5,
>                    from include/linux/module.h:12,
>                    from drivers/mtd/ubi/cdev.c:25:
>   drivers/mtd/ubi/cdev.c: In function 'ubi_get_ec_info':
>>> arch/riscv/include/asm/uaccess.h:33:9: error: cast specifies array type
>      33 |         (__force __typeof__(addr))__untagged_addr_remote(curren=
t->mm,
>      __addr);  \
>         |         ^
>   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
>      76 | # define likely(x)      __builtin_expect(!!(x), 1)
>         |                                             ^
>   arch/riscv/include/asm/uaccess.h:42:50: note: in expansion of macro
>   'untagged_addr'
>      42 | #define access_ok(addr, size) likely(__access_ok(untagged_addr(=
addr),
>      size))
>         |                                                  ^~~~~~~~~~~~~
>   drivers/mtd/ubi/cdev.c:854:14: note: in expansion of macro 'access_ok'
>     854 |         if (!access_ok(ureq->erase_counters, (end_peb-req.start=
) *
>     sizeof(int32_t)))

I think we need a cast to (void __user *) here.

Thanks,
//richard
