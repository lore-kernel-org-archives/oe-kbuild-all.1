Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DB9191F95
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737360696; cv=none; b=HeyiMYnAtQUcdnjYSUPbX9vcZTidIj15gqhDJVrye46x2YY9ZLF49p6yOToKWWKLTK6tnxvkqeoROl5ymeqADLAXhbxJf5fiIoPUGD4CcNSBXSZJBbI7vv1xpzOL1d6YPIDnzkSD2t15SknngF2jYxof3krcYNRzveYTVdgr0mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737360696; c=relaxed/simple;
	bh=tK2iXLw3ZThRiJ38t2TxUZvQanF4q8buaiurqMWdntQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ayKgA2Ksu6W49Bsw8zrYQyW4q5K0WRwn4JxID2kFL5we1iz+mqWmbAbu2zfqMZKJ5wRgBpBr1x44ejx9vzRi6ImbuImokUYVSs5ybLhoqonH+UFgRQDxaCmL31pnNnUk/rJfQ31WPvoXPP9Q64wjJcUnm1TBIp4NL38WDm1tDhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 69815298562;
	Mon, 20 Jan 2025 09:11:30 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id eNJJWlL0oQpn; Mon, 20 Jan 2025 09:11:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 908DF298563;
	Mon, 20 Jan 2025 09:11:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id X_ktKf3Hwj9g; Mon, 20 Jan 2025 09:11:29 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6AFAA298562;
	Mon, 20 Jan 2025 09:11:29 +0100 (CET)
Date: Mon, 20 Jan 2025 09:11:29 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: kernel test robot <lkp@intel.com>, 
	Rickard X Andersson <rickard.andersson@axis.com>, 
	oe-kbuild-all <oe-kbuild-all@lists.linux.dev>
Message-ID: <718606717.252982643.1737360689238.JavaMail.zimbra@nod.at>
In-Reply-To: <dc4471c5-4181-2c0b-1232-b588c962da93@huawei.com>
References: <202501191405.WYnmdL0U-lkp@intel.com> <304509708.249444175.1737297579621.JavaMail.zimbra@nod.at> <dc4471c5-4181-2c0b-1232-b588c962da93@huawei.com>
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
Thread-Index: J9PhhBY2Ktr6pW55wTZOPP5tUK0pyw==

----- Urspr=C3=BCngliche Mail -----
> Von: "chengzhihao1" <chengzhihao1@huawei.com>
> An: "richard" <richard@nod.at>, "kernel test robot" <lkp@intel.com>
> CC: "Rickard X Andersson" <rickard.andersson@axis.com>, "oe-kbuild-all" <=
oe-kbuild-all@lists.linux.dev>
> Gesendet: Montag, 20. Januar 2025 05:55:39
> Betreff: Re: [rw-ubifs:next 7/7] arch/riscv/include/asm/uaccess.h:33:9: e=
rror: cast specifies array type

> =E5=9C=A8 2025/1/19 22:39, Richard Weinberger =E5=86=99=E9=81=93:
>> ----- Urspr=C3=BCngliche Mail -----
>>> Von: "kernel test robot" <lkp@intel.com>
>>> An: "Rickard X Andersson" <rickard.andersson@axis.com>
>>> CC: "oe-kbuild-all" <oe-kbuild-all@lists.linux.dev>, "richard" <richard=
@nod.at>,
>>> "chengzhihao1"
>>> <chengzhihao1@huawei.com>
>>> Gesendet: Sonntag, 19. Januar 2025 07:29:22
>>> Betreff: [rw-ubifs:next 7/7] arch/riscv/include/asm/uaccess.h:33:9: err=
or: cast
>>> specifies array type
>>=20
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git ne=
xt
>>> head:   01099f635a4c68b8574d350a972ba062dd5142e9
>>> commit: 01099f635a4c68b8574d350a972ba062dd5142e9 [7/7] ubi: Implement i=
octl for
>>> detailed erase counters
>>> config: riscv-randconfig-001-20250119
>>> (https://download.01.org/0day-ci/archive/20250119/202501191405.WYnmdL0U=
-lkp@intel.com/config)
>>> compiler: riscv64-linux-gcc (GCC) 14.2.0
>>> reproduce (this is a W=3D1 build):
>>> (https://download.01.org/0day-ci/archive/20250119/202501191405.WYnmdL0U=
-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes:
>>> | https://lore.kernel.org/oe-kbuild-all/202501191405.WYnmdL0U-lkp@intel=
.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>    In file included from include/linux/build_bug.h:5,
>>>                     from include/linux/container_of.h:5,
>>>                     from include/linux/list.h:5,
>>>                     from include/linux/module.h:12,
>>>                     from drivers/mtd/ubi/cdev.c:25:
>>>    drivers/mtd/ubi/cdev.c: In function 'ubi_get_ec_info':
>>>>> arch/riscv/include/asm/uaccess.h:33:9: error: cast specifies array ty=
pe
>>>       33 |         (__force __typeof__(addr))__untagged_addr_remote(cur=
rent->mm,
>>>       __addr);  \
>>>          |         ^
>>>    include/linux/compiler.h:76:45: note: in definition of macro 'likely=
'
>>>       76 | # define likely(x)      __builtin_expect(!!(x), 1)
>>>          |                                             ^
>>>    arch/riscv/include/asm/uaccess.h:42:50: note: in expansion of macro
>>>    'untagged_addr'
>>>       42 | #define access_ok(addr, size) likely(__access_ok(untagged_ad=
dr(addr),
>>>       size))
>>>          |                                                  ^~~~~~~~~~~=
~~
>>>    drivers/mtd/ubi/cdev.c:854:14: note: in expansion of macro 'access_o=
k'
>>>      854 |         if (!access_ok(ureq->erase_counters, (end_peb-req.st=
art) *
>>>      sizeof(int32_t)))
>>=20
>> I think we need a cast to (void __user *) here.
>=20
> Right, the root cause is that return value(unsigned long type) of
> funtion __untagged_addr_remote() is converted to the array type, so
> making a cast for the input parameter in advance is a solution. I sent a
> fix patch in
> https://lore.kernel.org/linux-mtd/20250120043824.128102-1-chengzhihao1@hu=
awei.com/T/#u

Thx for the patch, I have applied it.

Thanks,
//richard
