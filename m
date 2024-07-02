Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB341BA89E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719934021; cv=none; b=VSo1E4T06kG5lZQkPrxE2qQlIIMDLznDOJV/Wx4TCKiiF2iYvZCdrizclx4qIHf0LGM2aI9EYAepJ3kijolmT6QR1tE5J8+hzjMo9HkmfuNhP5FNkvb1fo3FyACiPmWp0Hue/Il0GmYQUiM6KHazSTUQN3y3ATcZ1gLYPW1tMdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719934021; c=relaxed/simple;
	bh=wMF71KVfH+DeNGUDQf6FGCSGGZ6eJ7U3oeROjekbFHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5fCkZVkPRMAQjo2d0kGaCcYqFxP29x04ry4vkPQdPLiUEk3EMW72qTxj6amYhYSVKCy45mDaJ2XtiKA5OrQzp0Cf1INqSfj/nhpJgk6whz/N7Qig0eOicxuH8NeAwJPyGv/+0GOVLd5PRo70FYDBttA5qPU+3lWZ8OTDW2RYxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QYrOgbxA; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QYrOgbxA"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-64f4f96bbf9so16339837b3.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Jul 2024 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719934017; x=1720538817; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nkgXBWjtdUUmx0Tota4xKQ+3LMwLonLz+236+feBbQ=;
        b=QYrOgbxAaa0MXM5S+o1HC3AF4sGsMoNwlIdKCKFVDAT2Wp4FgW6meomw8R8FBwZgJM
         KOHduHC5Ew7fVGaT0AMtEkOeEFTbvblFXL/8WSXeicjh80ud0p53g0MNpR41nELVmRot
         FTXmNU6MzbxfSBvpViT1PlAAwuf24rx96dfP5YGNl9zUfGYYNp7m2Dq1H4495CZZ5cnO
         iPQ3yfx+4FRcbwgyCKa5zno/DaxxLKsStOxrbuooE2nIgS1BQ6NFfnQjR7CcCNnrWqK9
         twJ6VvyU7nbm2aY8iukiTcwFh49oqX5/2Qab0frNHjFPfU0AJ18rj1W+rQjNHpG3UMTu
         xdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719934017; x=1720538817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nkgXBWjtdUUmx0Tota4xKQ+3LMwLonLz+236+feBbQ=;
        b=TBNyuoJc/DOCoDCa3lmAkfTA3WKGEJLoKchCWuOKIcYP8OpzJ4UUpmIGxtPHlNi+LY
         L6kzJgIWFHxzEPCEKDcI5l2iwNkGAL0mHFj/PfPcaOpdeQFDz65sLh1Wx1OVALdgMvmv
         woEZklLs4afYEbSrIOPlhMYk1zopvD1QLsNf+8E6FlMb7k5kCUWwEsm3rTvyz7cDhoXB
         hTkLtIvSds2EdYUPzcOGWs5EdJqnay9FvgvryMksqTpX+SdnRrsbJwB07bnVSOHgs02u
         mIKe/4J2wHsk5yCWC/YZ78lOPiypGjbFoxIhqoLFakNeXr5QSFHFRHwc2ldQnc1wJzdd
         oh3Q==
X-Gm-Message-State: AOJu0Yw3afP6iYRnZFRJn/2Xecnjd+lZUBm0fQj0Uo1rFcDFneg7l7Id
	DR1rxs+qYc+sYqxsDFuLKmw+g55ThrmD3/YNJ+c9JISBqoujixk0ovMht3+LPuRylxrq+v+WmDn
	Kt8YfrWjRHBgsgPTQ1WubdBL8IsWu02U/l3pa
X-Google-Smtp-Source: AGHT+IHnF+l6NBcvwXeQhYWuP/+x0UjStq/eV2JClBsaqY5nftYdqtNBAdFp4xUNRqwGJyPwezvBJvm5OOTzfcMNEJE=
X-Received: by 2002:a81:431a:0:b0:63c:4140:a0de with SMTP id
 00721157ae682-64c7239dca2mr86790207b3.6.1719934017053; Tue, 02 Jul 2024
 08:26:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407021700.qhDbFwso-lkp@intel.com>
In-Reply-To: <202407021700.qhDbFwso-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Jul 2024 15:26:44 +0000
Message-ID: <CAJuCfpH-TJyE_Vk2MUBASbPxTQvGyidWPBJj0so50YbbCzfXkA@mail.gmail.com>
Subject: Re: [linux-next:master 9345/10049] kernel/signal.c:2331:39: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Oleg Nesterov <oleg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 9:46=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   82e4255305c554b0bb18b7ccf2db86041b4c8b6e
> commit: ea929eb9121588cec720649ebac3caf75bab2df0 [9345/10049] signal: on =
exit skip waiting for an ack from the tracer if it is frozen
> config: x86_64-randconfig-123-20240702 (https://download.01.org/0day-ci/a=
rchive/20240702/202407021700.qhDbFwso-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240702/202407021700.qhDbFwso-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407021700.qhDbFwso-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    kernel/signal.c: note: in included file (through arch/x86/include/uapi=
/asm/signal.h, arch/x86/include/asm/signal.h, include/uapi/linux/signal.h, =
...):
>    include/uapi/asm-generic/signal-defs.h:83:29: sparse: sparse: multiple=
 address spaces given
>    kernel/signal.c:188:31: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected struct spinlock [usertype] *lock =
@@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:188:31: sparse:     expected struct spinlock [usertype=
] *lock
>    kernel/signal.c:188:31: sparse:     got struct spinlock [noderef] __rc=
u *
>    kernel/signal.c:191:33: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected struct spinlock [usertype] *lock =
@@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:191:33: sparse:     expected struct spinlock [usertype=
] *lock
>    kernel/signal.c:191:33: sparse:     got struct spinlock [noderef] __rc=
u *
>    kernel/signal.c:473:9: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:473:9: sparse:     expected struct spinlock [usertype]=
 *lock
>    kernel/signal.c:473:9: sparse:     got struct spinlock [noderef] __rcu=
 *
>    kernel/signal.c:477:34: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected struct spinlock [usertype] *lock =
@@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:477:34: sparse:     expected struct spinlock [usertype=
] *lock
>    kernel/signal.c:477:34: sparse:     got struct spinlock [noderef] __rc=
u *
>    kernel/signal.c:510:9: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:510:9: sparse:     expected struct spinlock [usertype]=
 *lock
>    kernel/signal.c:510:9: sparse:     got struct spinlock [noderef] __rcu=
 *
>    kernel/signal.c:513:36: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected struct spinlock [usertype] *lock =
@@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:513:36: sparse:     expected struct spinlock [usertype=
] *lock
>    kernel/signal.c:513:36: sparse:     got struct spinlock [noderef] __rc=
u *
>    kernel/signal.c:535:53: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected struct k_sigaction *ka @@     go=
t struct k_sigaction [noderef] __rcu * @@
>    kernel/signal.c:535:53: sparse:     expected struct k_sigaction *ka
>    kernel/signal.c:535:53: sparse:     got struct k_sigaction [noderef] _=
_rcu *
>    include/uapi/asm-generic/signal-defs.h:83:29: sparse: sparse: multiple=
 address spaces given
>    kernel/signal.c:695:33: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected struct spinlock [usertype] *lock =
@@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:695:33: sparse:     expected struct spinlock [usertype=
] *lock
>    kernel/signal.c:695:33: sparse:     got struct spinlock [noderef] __rc=
u *
>    kernel/signal.c:697:31: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected struct spinlock [usertype] *lock =
@@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:697:31: sparse:     expected struct spinlock [usertype=
] *lock
>    kernel/signal.c:697:31: sparse:     got struct spinlock [noderef] __rc=
u *
>    kernel/signal.c:762:9: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct lockdep_map const *lock @@ =
    got struct lockdep_map [noderef] __rcu * @@
>    kernel/signal.c:762:9: sparse:     expected struct lockdep_map const *=
lock
>    kernel/signal.c:762:9: sparse:     got struct lockdep_map [noderef] __=
rcu *
>    kernel/signal.c:887:9: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct lockdep_map const *lock @@ =
    got struct lockdep_map [noderef] __rcu * @@
>    kernel/signal.c:887:9: sparse:     expected struct lockdep_map const *=
lock
>    kernel/signal.c:887:9: sparse:     got struct lockdep_map [noderef] __=
rcu *
>    kernel/signal.c:1082:9: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected struct lockdep_map const *lock @@=
     got struct lockdep_map [noderef] __rcu * @@
>    kernel/signal.c:1082:9: sparse:     expected struct lockdep_map const =
*lock
>    kernel/signal.c:1082:9: sparse:     got struct lockdep_map [noderef] _=
_rcu *
>    kernel/signal.c:1334:9: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected struct spinlock [usertype] *lock =
@@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:1334:9: sparse:     expected struct spinlock [usertype=
] *lock
>    kernel/signal.c:1334:9: sparse:     got struct spinlock [noderef] __rc=
u *
>    kernel/signal.c:1335:16: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected struct k_sigaction *action @@   =
  got struct k_sigaction [noderef] __rcu * @@
>    kernel/signal.c:1335:16: sparse:     expected struct k_sigaction *acti=
on
>    kernel/signal.c:1335:16: sparse:     got struct k_sigaction [noderef] =
__rcu *
>    kernel/signal.c:1356:34: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:1356:34: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:1356:34: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:1944:36: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected struct spinlock [usertype] *loc=
k @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:1944:36: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:1944:36: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:2074:44: sparse: sparse: cast removes address space '_=
_rcu' of expression
>    kernel/signal.c:2093:65: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct *tsk @@     g=
ot struct task_struct [noderef] __rcu *parent @@
>    kernel/signal.c:2093:65: sparse:     expected struct task_struct *tsk
>    kernel/signal.c:2093:65: sparse:     got struct task_struct [noderef] =
__rcu *parent
>    kernel/signal.c:2094:40: sparse: sparse: cast removes address space '_=
_rcu' of expression
>    kernel/signal.c:2112:14: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected struct sighand_struct *psig @@  =
   got struct sighand_struct [noderef] __rcu *[noderef] __rcu sighand @@
>    kernel/signal.c:2112:14: sparse:     expected struct sighand_struct *p=
sig
>    kernel/signal.c:2112:14: sparse:     got struct sighand_struct [nodere=
f] __rcu *[noderef] __rcu sighand
>    kernel/signal.c:2141:53: sparse: sparse: incorrect type in argument 3 =
(different address spaces) @@     expected struct task_struct *t @@     got=
 struct task_struct [noderef] __rcu *parent @@
>    kernel/signal.c:2141:53: sparse:     expected struct task_struct *t
>    kernel/signal.c:2141:53: sparse:     got struct task_struct [noderef] =
__rcu *parent
>    kernel/signal.c:2142:34: sparse: sparse: incorrect type in argument 2 =
(different address spaces) @@     expected struct task_struct *parent @@   =
  got struct task_struct [noderef] __rcu *parent @@
>    kernel/signal.c:2142:34: sparse:     expected struct task_struct *pare=
nt
>    kernel/signal.c:2142:34: sparse:     got struct task_struct [noderef] =
__rcu *parent
>    kernel/signal.c:2171:24: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected struct task_struct *parent @@   =
  got struct task_struct [noderef] __rcu *parent @@
>    kernel/signal.c:2171:24: sparse:     expected struct task_struct *pare=
nt
>    kernel/signal.c:2171:24: sparse:     got struct task_struct [noderef] =
__rcu *parent
>    kernel/signal.c:2174:24: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected struct task_struct *parent @@   =
  got struct task_struct [noderef] __rcu *real_parent @@
>    kernel/signal.c:2174:24: sparse:     expected struct task_struct *pare=
nt
>    kernel/signal.c:2174:24: sparse:     got struct task_struct [noderef] =
__rcu *real_parent
>    kernel/signal.c:2207:17: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected struct sighand_struct *sighand @=
@     got struct sighand_struct [noderef] __rcu *sighand @@
>    kernel/signal.c:2207:17: sparse:     expected struct sighand_struct *s=
ighand
>    kernel/signal.c:2207:17: sparse:     got struct sighand_struct [nodere=
f] __rcu *sighand
>    kernel/signal.c:2247:41: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:2247:41: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:2247:41: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:2249:39: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:2249:39: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:2249:39: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:2306:33: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:2306:33: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:2306:33: sparse:     got struct spinlock [noderef] __r=
cu *
> >> kernel/signal.c:2331:39: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct *task @@     =
got struct task_struct [noderef] __rcu *parent @@
>    kernel/signal.c:2331:39: sparse:     expected struct task_struct *task
>    kernel/signal.c:2331:39: sparse:     got struct task_struct [noderef] =
__rcu *parent
>    kernel/signal.c:2378:31: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:2378:31: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:2378:31: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:2418:31: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:2418:31: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:2418:31: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:2420:33: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:2420:33: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:2420:33: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:2518:41: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:2518:41: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:2518:41: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:2602:41: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:2602:41: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:2602:41: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:2614:33: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:2614:33: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:2614:33: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:2649:52: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct task_struct *tsk @@     g=
ot struct task_struct [noderef] __rcu *parent @@
>    kernel/signal.c:2649:52: sparse:     expected struct task_struct *tsk
>    kernel/signal.c:2649:52: sparse:     got struct task_struct [noderef] =
__rcu *parent
>    kernel/signal.c:2651:49: sparse: sparse: cast removes address space '_=
_rcu' of expression
>    kernel/signal.c:2689:49: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected struct sighand_struct *sighand =
@@     got struct sighand_struct [noderef] __rcu *sighand @@
>    kernel/signal.c:2689:49: sparse:     expected struct sighand_struct *s=
ighand
>    kernel/signal.c:2689:49: sparse:     got struct sighand_struct [nodere=
f] __rcu *sighand
>    kernel/signal.c:3023:27: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:3023:27: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:3023:27: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:3044:29: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:3044:29: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:3044:29: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:3111:27: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:3111:27: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:3111:27: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:3113:29: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:3113:29: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:3113:29: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:3264:31: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:3264:31: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:3264:31: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:3267:33: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:3267:33: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:3267:33: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:3656:27: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:3656:27: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:3656:27: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:3668:37: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:3668:37: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:3668:37: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:3673:35: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:3673:35: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:3673:35: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:3678:29: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:3678:29: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:3678:29: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:4154:31: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:4154:31: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:4154:31: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:4166:33: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:4166:33: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:4166:33: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:4184:11: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected struct k_sigaction *k @@     got=
 struct k_sigaction [noderef] __rcu * @@
>    kernel/signal.c:4184:11: sparse:     expected struct k_sigaction *k
>    kernel/signal.c:4184:11: sparse:     got struct k_sigaction [noderef] =
__rcu *
>    kernel/signal.c:4186:25: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:4186:25: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:4186:25: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:4188:35: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:4188:35: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:4188:35: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:4236:27: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct spinlock [usertype] *lock=
 @@     got struct spinlock [noderef] __rcu * @@
>    kernel/signal.c:4236:27: sparse:     expected struct spinlock [usertyp=
e] *lock
>    kernel/signal.c:4236:27: sparse:     got struct spinlock [noderef] __r=
cu *
>    kernel/signal.c:72:34: sparse: sparse: dereference of noderef expressi=
on
>    kernel/signal.c:522:35: sparse: sparse: dereference of noderef express=
ion
>    kernel/signal.c:550:52: sparse: sparse: dereference of noderef express=
ion
>    kernel/signal.c:1035:13: sparse: sparse: dereference of noderef expres=
sion
>    kernel/signal.c: note: in included file:
>    include/linux/signalfd.h:21:13: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected struct wait_queue_head *w=
q_head @@     got struct wait_queue_head [noderef] __rcu * @@
>    include/linux/signalfd.h:21:13: sparse:     expected struct wait_queue=
_head *wq_head
>    include/linux/signalfd.h:21:13: sparse:     got struct wait_queue_head=
 [noderef] __rcu *
>    include/linux/signalfd.h:22:17: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected struct wait_queue_head *w=
q_head @@     got struct wait_queue_head [noderef] __rcu * @@
>    include/linux/signalfd.h:22:17: sparse:     expected struct wait_queue=
_head *wq_head
>    include/linux/signalfd.h:22:17: sparse:     got struct wait_queue_head=
 [noderef] __rcu *
>    kernel/signal.c: note: in included file (through include/linux/smp.h, =
include/linux/lockdep.h, include/linux/spinlock.h, ...):
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always eva=
luates to true
>    kernel/signal.c: note: in included file (through include/linux/sched/c=
putime.h):
>    include/linux/sched/signal.h:754:37: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected struct spinlock [use=
rtype] *lock @@     got struct spinlock [noderef] __rcu * @@
>    include/linux/sched/signal.h:754:37: sparse:     expected struct spinl=
ock [usertype] *lock
>    include/linux/sched/signal.h:754:37: sparse:     got struct spinlock [=
noderef] __rcu *
>    kernel/signal.c:1305:9: sparse: sparse: context imbalance in 'do_send_=
sig_info' - different lock contexts for basic block
>    kernel/signal.c: note: in included file (through include/linux/rbtree.=
h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
>    include/linux/rcupdate.h:809:9: sparse: sparse: context imbalance in '=
__lock_task_sighand' - different lock contexts for basic block
>    kernel/signal.c: note: in included file (through include/linux/sched/c=
putime.h):
>    include/linux/sched/signal.h:754:37: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected struct spinlock [use=
rtype] *lock @@     got struct spinlock [noderef] __rcu * @@
>    include/linux/sched/signal.h:754:37: sparse:     expected struct spinl=
ock [usertype] *lock
>    include/linux/sched/signal.h:754:37: sparse:     got struct spinlock [=
noderef] __rcu *
>    kernel/signal.c: note: in included file:
>
> vim +2331 kernel/signal.c
>
>   2218
>   2219  /*
>   2220   * This must be called with current->sighand->siglock held.
>   2221   *
>   2222   * This should be the path for all ptrace stops.
>   2223   * We always set current->last_siginfo while stopped here.
>   2224   * That makes it a way to test a stopped process for
>   2225   * being ptrace-stopped vs being job-control-stopped.
>   2226   *
>   2227   * Returns the signal the ptracer requested the code resume
>   2228   * with.  If the code did not stop because the tracer is gone,
>   2229   * the stop signal remains unchanged unless clear_code.
>   2230   */
>   2231  static int ptrace_stop(int exit_code, int why, unsigned long mess=
age,
>   2232                         kernel_siginfo_t *info)
>   2233          __releases(&current->sighand->siglock)
>   2234          __acquires(&current->sighand->siglock)
>   2235  {
>   2236          bool gstop_done =3D false;
>   2237
>   2238          if (arch_ptrace_stop_needed()) {
>   2239                  /*
>   2240                   * The arch code has something special to do befo=
re a
>   2241                   * ptrace stop.  This is allowed to block, e.g. f=
or faults
>   2242                   * on user stack pages.  We can't keep the sigloc=
k while
>   2243                   * calling arch_ptrace_stop, so we must release i=
t now.
>   2244                   * To preserve proper semantics, we must do this =
before
>   2245                   * any signal bookkeeping like checking group_sto=
p_count.
>   2246                   */
>   2247                  spin_unlock_irq(&current->sighand->siglock);
>   2248                  arch_ptrace_stop();
>   2249                  spin_lock_irq(&current->sighand->siglock);
>   2250          }
>   2251
>   2252          /*
>   2253           * After this point ptrace_signal_wake_up or signal_wake_=
up
>   2254           * will clear TASK_TRACED if ptrace_unlink happens or a f=
atal
>   2255           * signal comes in.  Handle previous ptrace_unlinks and f=
atal
>   2256           * signals here to prevent ptrace_stop sleeping in schedu=
le.
>   2257           */
>   2258          if (!current->ptrace || __fatal_signal_pending(current))
>   2259                  return exit_code;
>   2260
>   2261          set_special_state(TASK_TRACED);
>   2262          current->jobctl |=3D JOBCTL_TRACED;
>   2263
>   2264          /*
>   2265           * We're committing to trapping.  TRACED should be visibl=
e before
>   2266           * TRAPPING is cleared; otherwise, the tracer might fail =
do_wait().
>   2267           * Also, transition to TRACED and updates to ->jobctl sho=
uld be
>   2268           * atomic with respect to siglock and should be done afte=
r the arch
>   2269           * hook as siglock is released and regrabbed across it.
>   2270           *
>   2271           *     TRACER                               TRACEE
>   2272           *
>   2273           *     ptrace_attach()
>   2274           * [L]   wait_on_bit(JOBCTL_TRAPPING)   [S] set_special_s=
tate(TRACED)
>   2275           *     do_wait()
>   2276           *       set_current_state()                smp_wmb();
>   2277           *       ptrace_do_wait()
>   2278           *         wait_task_stopped()
>   2279           *           task_stopped_code()
>   2280           * [L]         task_is_traced()         [S] task_clear_jo=
bctl_trapping();
>   2281           */
>   2282          smp_wmb();
>   2283
>   2284          current->ptrace_message =3D message;
>   2285          current->last_siginfo =3D info;
>   2286          current->exit_code =3D exit_code;
>   2287
>   2288          /*
>   2289           * If @why is CLD_STOPPED, we're trapping to participate =
in a group
>   2290           * stop.  Do the bookkeeping.  Note that if SIGCONT was d=
elievered
>   2291           * across siglock relocks since INTERRUPT was scheduled, =
PENDING
>   2292           * could be clear now.  We act as if SIGCONT is received =
after
>   2293           * TASK_TRACED is entered - ignore it.
>   2294           */
>   2295          if (why =3D=3D CLD_STOPPED && (current->jobctl & JOBCTL_S=
TOP_PENDING))
>   2296                  gstop_done =3D task_participate_group_stop(curren=
t);
>   2297
>   2298          /* any trap clears pending STOP trap, STOP trap clears NO=
TIFY */
>   2299          task_clear_jobctl_pending(current, JOBCTL_TRAP_STOP);
>   2300          if (info && info->si_code >> 8 =3D=3D PTRACE_EVENT_STOP)
>   2301                  task_clear_jobctl_pending(current, JOBCTL_TRAP_NO=
TIFY);
>   2302
>   2303          /* entering a trap, clear TRAPPING */
>   2304          task_clear_jobctl_trapping(current);
>   2305
>   2306          spin_unlock_irq(&current->sighand->siglock);
>   2307          read_lock(&tasklist_lock);
>   2308          /*
>   2309           * Notify parents of the stop.
>   2310           *
>   2311           * While ptraced, there are two parents - the ptracer and
>   2312           * the real_parent of the group_leader.  The ptracer shou=
ld
>   2313           * know about every stop while the real parent is only
>   2314           * interested in the completion of group stop.  The state=
s
>   2315           * for the two don't interact with each other.  Notify
>   2316           * separately unless they're gonna be duplicates.
>   2317           */
>   2318          if (current->ptrace)
>   2319                  do_notify_parent_cldstop(current, true, why);
>   2320          if (gstop_done && (!current->ptrace || ptrace_reparented(=
current)))
>   2321                  do_notify_parent_cldstop(current, false, why);
>   2322
>   2323          /*
>   2324           * If tracer is frozen, it won't ack until it gets unfroz=
en and if the
>   2325           * tracee is exiting this means its resources do not get =
freed until
>   2326           * the tracer is thawed. Skip waiting for the tracer. Per=
 ptrace(2)
>   2327           * manual, the tracer cannot assume that the ptrace-stopp=
ed tracee
>   2328           * exists, so exiting now should not be an issue.
>   2329           */
>   2330          if (current->ptrace && (exit_code >> 8) =3D=3D PTRACE_EVE=
NT_EXIT &&
> > 2331              cgroup_task_frozen(current->parent)) {

This patch will be changing based on Oleg's feedback here:
https://lore.kernel.org/all/20240629131247.GA6138@redhat.com/
I'm not yet sure how this issue will be ultimatel fixed (hope I get
some more guidance) but for now Andrew, could you please pull this
patch out?
Thanks!

>   2332                  read_unlock(&tasklist_lock);
>   2333                  goto skip_wait;
>   2334          }
>   2335
>   2336          /*
>   2337           * The previous do_notify_parent_cldstop() invocation wok=
e ptracer.
>   2338           * One a PREEMPTION kernel this can result in preemption =
requirement
>   2339           * which will be fulfilled after read_unlock() and the pt=
racer will be
>   2340           * put on the CPU.
>   2341           * The ptracer is in wait_task_inactive(, __TASK_TRACED) =
waiting for
>   2342           * this task wait in schedule(). If this task gets preemp=
ted then it
>   2343           * remains enqueued on the runqueue. The ptracer will obs=
erve this and
>   2344           * then sleep for a delay of one HZ tick. In the meantime=
 this task
>   2345           * gets scheduled, enters schedule() and will wait for th=
e ptracer.
>   2346           *
>   2347           * This preemption point is not bad from a correctness po=
int of
>   2348           * view but extends the runtime by one HZ tick time due t=
o the
>   2349           * ptracer's sleep.  The preempt-disable section ensures =
that there
>   2350           * will be no preemption between unlock and schedule() an=
d so
>   2351           * improving the performance since the ptracer will obser=
ve that
>   2352           * the tracee is scheduled out once it gets on the CPU.
>   2353           *
>   2354           * On PREEMPT_RT locking tasklist_lock does not disable p=
reemption.
>   2355           * Therefore the task can be preempted after do_notify_pa=
rent_cldstop()
>   2356           * before unlocking tasklist_lock so there is no benefit =
in doing this.
>   2357           *
>   2358           * In fact disabling preemption is harmful on PREEMPT_RT =
because
>   2359           * the spinlock_t in cgroup_enter_frozen() must not be ac=
quired
>   2360           * with preemption disabled due to the 'sleeping' spinloc=
k
>   2361           * substitution of RT.
>   2362           */
>   2363          if (!IS_ENABLED(CONFIG_PREEMPT_RT))
>   2364                  preempt_disable();
>   2365          read_unlock(&tasklist_lock);
>   2366          cgroup_enter_frozen();
>   2367          if (!IS_ENABLED(CONFIG_PREEMPT_RT))
>   2368                  preempt_enable_no_resched();
>   2369          schedule();
>   2370          cgroup_leave_frozen(true);
>   2371
>   2372  skip_wait:
>   2373          /*
>   2374           * We are back.  Now reacquire the siglock before touchin=
g
>   2375           * last_siginfo, so that we are sure to have synchronized=
 with
>   2376           * any signal-sending on another CPU that wants to examin=
e it.
>   2377           */
>   2378          spin_lock_irq(&current->sighand->siglock);
>   2379          exit_code =3D current->exit_code;
>   2380          current->last_siginfo =3D NULL;
>   2381          current->ptrace_message =3D 0;
>   2382          current->exit_code =3D 0;
>   2383
>   2384          /* LISTENING can be set only during STOP traps, clear it =
*/
>   2385          current->jobctl &=3D ~(JOBCTL_LISTENING | JOBCTL_PTRACE_F=
ROZEN);
>   2386
>   2387          /*
>   2388           * Queued signals ignored us while we were stopped for tr=
acing.
>   2389           * So check for any that we should take before resuming u=
ser mode.
>   2390           * This sets TIF_SIGPENDING, but never clears it.
>   2391           */
>   2392          recalc_sigpending_tsk(current);
>   2393          return exit_code;
>   2394  }
>   2395
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
