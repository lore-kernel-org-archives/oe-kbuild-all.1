Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4CF12BEA9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 19:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706123489; cv=none; b=KEovbg1t46zzIka6DGIYImo4E5UlMvBIUiPY76uoVz10jqm6h6IKhSQAH3KBy6BB7x/nGB4TKRLJ6+sdIZZWNHjLCcsoUQIVkxlfjEgMH57xmuxYvm6A5DJKRfIrhALEgFrH708E6INZQPxSdCIG1QvAFNmkmecyHpF/cbVcrB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706123489; c=relaxed/simple;
	bh=F3aAigVevGRh8Mpvb14KP5xrG+nRadI0QoqOSLdjpQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZrFrm/givFlLSK3moQusjjeyLvK1/u14YzY1gd5c2lPcH0chcx6wefEw1OLcl9VXDqtpyINk4t+YoetKcFPKRyQUu3osxm5564Wgphms/WY51Y0iQPfwwfXlVQdMuRt6pXFTeGO1gY5E3JShmMKKQoA7QISc0alFDNfJvkXyEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G4tCkMir; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G4tCkMir"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-600094c5703so33117467b3.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 11:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706123486; x=1706728286; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUCedjSfihWWqIDZHt/a1WlKwgC7bA5oxc/kV35rKao=;
        b=G4tCkMirZVLW1WOceSWwBtVMR0hj2Mu1h3725Utj9iAOs63t+W14GoaG7IAKWTPR+t
         NLIYANEtoKWMx4W60Cy85speAc/azIYOGEhOXBjtEXp7KweU31LyxBmjF3gAN9blaK9M
         fAflOHM8ZmE0z1ty/YHyrxRecmwAYwKi8qEEOC+P43Puf+MQuCmW1tdeqhu8v4kj/tiF
         0Q20YryrTTGsBaZo8lYVmEpha6l17ZG/kj+H3fnJ+vLa0fzzZZZmYgNnfvGjHYF3cPCL
         OWCEhfB2bRtUBkNTKG8VvNhM7BulI7Y/mx5dm5wbp/RBOdL/1PVocSvgwQrmAgykAn+j
         GbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706123486; x=1706728286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUCedjSfihWWqIDZHt/a1WlKwgC7bA5oxc/kV35rKao=;
        b=ntHX7AAH6DVRqcUx1K2SUjrzd2SH5xkSVmm0Y+gCbXy/HzWrbI7MiMURW/adfkGgKU
         IEHL3SLYmrmIEv5/nrd1qN5V2mZVAdi5p9o2CzZ2cUDbQ3rcEbkZXFXWzyHz2VNbbjl+
         NEelRsTeU3WWkpSTOpgWNxIIJPSvsEuP+nlP83LCLd7ZUfnuZ8AvBfP2wFG9lTFZ/r9i
         TbRId5aaVN51MM8ayKr4teG+WscdKn55QS3ZioQm8/EP0HaVlxixtgIL7J7dWmkgE3jr
         /iICRgvu9ojDcgGsruD7ZMsvJzG3iEmojZNfDDMOxlmrE96+pBp+MF6CuEko16L+EDY/
         sODg==
X-Gm-Message-State: AOJu0Yze9L0VkrJmKuGPhzb/5bY/EMC0iQjIQE2lt42T4eUl+zAk9chp
	apAJOTL5JDU2nYW2LUBs/syaqBCeAWP4RQQHmv1JNSmYvsGAxRPQXXe4FH/K1wSnjqF4jEwGmWH
	QN/EulJBXSp6cyOlT5vGneb3C4umnovzfxW5j
X-Google-Smtp-Source: AGHT+IFZT9SuJXbK6ZISKs2DXgsTcwoM3p8sXiFgVNFkCIIBGsamZU8A0zg/6cRyHr8vf23kq+isfRMcaFCrHXDdO6w=
X-Received: by 2002:a81:5c06:0:b0:5ff:aa0e:e768 with SMTP id
 q6-20020a815c06000000b005ffaa0ee768mr1109239ywb.31.1706123485972; Wed, 24 Jan
 2024 11:11:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401242108.sR7fhT8J-lkp@intel.com>
In-Reply-To: <202401242108.sR7fhT8J-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 24 Jan 2024 11:11:15 -0800
Message-ID: <CAJuCfpHuHkgExn2DxVqe2S86qnxH3-ZSke_nEDVmzk13d72Qfg@mail.gmail.com>
Subject: Re: [linux-next:master 1198/1678] include/linux/mm_inline.h:401:30:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 5:05=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   8bf1262c53f50fa91fe15d01e5ef5629db55313c
> commit: 12600c77ca2b2be6af4e00f83d250f54f9c81496 [1198/1678] mm: make vm_=
area_struct anon_name field RCU-safe
> config: x86_64-randconfig-122-20240124 (https://download.01.org/0day-ci/a=
rchive/20240124/202401242108.sR7fhT8J-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240124/202401242108.sR7fhT8J-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401242108.sR7fhT8J-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    kernel/fork.c:1240:19: sparse: sparse: incorrect type in assignment (d=
ifferent address spaces) @@     expected struct task_struct [noderef] __rcu=
 *owner @@     got struct task_struct *p @@
>    kernel/fork.c:1240:19: sparse:     expected struct task_struct [nodere=
f] __rcu *owner
>    kernel/fork.c:1240:19: sparse:     got struct task_struct *p
>    kernel/fork.c:1803:38: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct refcount_struct [usertype] =
*r @@     got struct refcount_struct [noderef] __rcu * @@
>    kernel/fork.c:1803:38: sparse:     expected struct refcount_struct [us=
ertype] *r
>    kernel/fork.c:1803:38: sparse:     got struct refcount_struct [noderef=
] __rcu *
>    kernel/fork.c:1812:31: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
>    kernel/fork.c:1812:31: sparse:     expected struct spinlock [usertype]=
 *lock
>    kernel/fork.c:1812:31: sparse:     got struct spinlock [noderef] __rcu=
 *
>    kernel/fork.c:1813:9: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const * @@     got struct k_si=
gaction [noderef] __rcu * @@
>    kernel/fork.c:1813:9: sparse:     expected void const *
>    kernel/fork.c:1813:9: sparse:     got struct k_sigaction [noderef] __r=
cu *
>    kernel/fork.c:1813:9: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const * @@     got struct k_si=
gaction [noderef] __rcu * @@
>    kernel/fork.c:1813:9: sparse:     expected void const *
>    kernel/fork.c:1813:9: sparse:     got struct k_sigaction [noderef] __r=
cu *
>    kernel/fork.c:1813:9: sparse: sparse: incorrect type in argument 2 (di=
fferent address spaces) @@     expected void const *q @@     got struct k_s=
igaction [noderef] __rcu * @@
>    kernel/fork.c:1813:9: sparse:     expected void const *q
>    kernel/fork.c:1813:9: sparse:     got struct k_sigaction [noderef] __r=
cu *
>    kernel/fork.c:1814:33: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
>    kernel/fork.c:1814:33: sparse:     expected struct spinlock [usertype]=
 *lock
>    kernel/fork.c:1814:33: sparse:     got struct spinlock [noderef] __rcu=
 *
>    kernel/fork.c:2316:31: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
>    kernel/fork.c:2316:31: sparse:     expected struct spinlock [usertype]=
 *lock
>    kernel/fork.c:2316:31: sparse:     got struct spinlock [noderef] __rcu=
 *
>    kernel/fork.c:2320:33: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
>    kernel/fork.c:2320:33: sparse:     expected struct spinlock [usertype]=
 *lock
>    kernel/fork.c:2320:33: sparse:     got struct spinlock [noderef] __rcu=
 *
>    kernel/fork.c:2631:32: sparse: sparse: incorrect type in assignment (d=
ifferent address spaces) @@     expected struct task_struct [noderef] __rcu=
 *real_parent @@     got struct task_struct * @@
>    kernel/fork.c:2631:32: sparse:     expected struct task_struct [nodere=
f] __rcu *real_parent
>    kernel/fork.c:2631:32: sparse:     got struct task_struct *
>    kernel/fork.c:2640:27: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
>    kernel/fork.c:2640:27: sparse:     expected struct spinlock [usertype]=
 *lock
>    kernel/fork.c:2640:27: sparse:     got struct spinlock [noderef] __rcu=
 *
>    kernel/fork.c:2689:54: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected struct list_head *head @@     got =
struct list_head [noderef] __rcu * @@
>    kernel/fork.c:2689:54: sparse:     expected struct list_head *head
>    kernel/fork.c:2689:54: sparse:     got struct list_head [noderef] __rc=
u *
>    kernel/fork.c:2709:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
>    kernel/fork.c:2709:29: sparse:     expected struct spinlock [usertype]=
 *lock
>    kernel/fork.c:2709:29: sparse:     got struct spinlock [noderef] __rcu=
 *
>    kernel/fork.c:2731:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
>    kernel/fork.c:2731:29: sparse:     expected struct spinlock [usertype]=
 *lock
>    kernel/fork.c:2731:29: sparse:     got struct spinlock [noderef] __rcu=
 *
>    kernel/fork.c:2758:28: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct sighand_struct *sighand @@ =
    got struct sighand_struct [noderef] __rcu *sighand @@
>    kernel/fork.c:2758:28: sparse:     expected struct sighand_struct *sig=
hand
>    kernel/fork.c:2758:28: sparse:     got struct sighand_struct [noderef]=
 __rcu *sighand
>    kernel/fork.c:2787:31: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
>    kernel/fork.c:2787:31: sparse:     expected struct spinlock [usertype]=
 *lock
>    kernel/fork.c:2787:31: sparse:     got struct spinlock [noderef] __rcu=
 *
>    kernel/fork.c:2789:33: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
>    kernel/fork.c:2789:33: sparse:     expected struct spinlock [usertype]=
 *lock
>    kernel/fork.c:2789:33: sparse:     got struct spinlock [noderef] __rcu=
 *
>    kernel/fork.c:3230:24: sparse: sparse: incorrect type in assignment (d=
ifferent address spaces) @@     expected struct task_struct *[assigned] par=
ent @@     got struct task_struct [noderef] __rcu *real_parent @@
>    kernel/fork.c:3230:24: sparse:     expected struct task_struct *[assig=
ned] parent
>    kernel/fork.c:3230:24: sparse:     got struct task_struct [noderef] __=
rcu *real_parent
>    kernel/fork.c:3318:43: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct refcount_struct const [user=
type] *r @@     got struct refcount_struct [noderef] __rcu * @@
>    kernel/fork.c:3318:43: sparse:     expected struct refcount_struct con=
st [usertype] *r
>    kernel/fork.c:3318:43: sparse:     got struct refcount_struct [noderef=
] __rcu *
>    kernel/fork.c: note: in included file:
> >> include/linux/mm_inline.h:401:30: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected struct anon_vma_name *a=
non_name @@     got struct anon_vma_name [noderef] __rcu *anon_name @@
>    include/linux/mm_inline.h:401:30: sparse:     expected struct anon_vma=
_name *anon_name
>    include/linux/mm_inline.h:401:30: sparse:     got struct anon_vma_name=
 [noderef] __rcu *anon_name
>    kernel/fork.c:1908:9: sparse: sparse: dereference of noderef expressio=
n
>    kernel/fork.c:2366:22: sparse: sparse: dereference of noderef expressi=
on
>    kernel/fork.c: note: in included file (through include/uapi/asm-generi=
c/bpf_perf_event.h, arch/x86/include/generated/uapi/asm/bpf_perf_event.h, .=
..):
>    include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argum=
ent 2 (different address spaces) @@     expected struct task_struct *new_pa=
rent @@     got struct task_struct [noderef] __rcu *parent @@
>    include/linux/ptrace.h:210:45: sparse:     expected struct task_struct=
 *new_parent
>    include/linux/ptrace.h:210:45: sparse:     got struct task_struct [nod=
eref] __rcu *parent
>    include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argum=
ent 3 (different address spaces) @@     expected struct cred const *ptracer=
_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
>    include/linux/ptrace.h:210:62: sparse:     expected struct cred const =
*ptracer_cred
>    include/linux/ptrace.h:210:62: sparse:     got struct cred const [node=
ref] __rcu *ptracer_cred
>    kernel/fork.c:2687:59: sparse: sparse: dereference of noderef expressi=
on
>    kernel/fork.c:2688:59: sparse: sparse: dereference of noderef expressi=
on
>    kernel/fork.c:1232:23: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
>    kernel/fork.c:1232:23: sparse:    struct task_struct [noderef] __rcu *
>    kernel/fork.c:1232:23: sparse:    struct task_struct *
> --
> >> mm/madvise.c:133:19: sparse: sparse: incorrect type in assignment (dif=
ferent address spaces) @@     expected struct anon_vma_name [noderef] __rcu=
 *anon_name @@     got struct anon_vma_name * @@
>    mm/madvise.c:133:19: sparse:     expected struct anon_vma_name [nodere=
f] __rcu *anon_name
>    mm/madvise.c:133:19: sparse:     got struct anon_vma_name *
> >> mm/madvise.c:137:13: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct kref *kref @@     got struct =
kref [noderef] __rcu * @@
>    mm/madvise.c:137:13: sparse:     expected struct kref *kref
>    mm/madvise.c:137:13: sparse:     got struct kref [noderef] __rcu *
> >> mm/madvise.c:140:16: sparse: sparse: incorrect type in return expressi=
on (different address spaces) @@     expected struct anon_vma_name * @@    =
 got struct anon_vma_name [noderef] __rcu *anon_name @@

Ah, I should use rcu_assign_pointer/rcu_access_pointer/rcu_dereference
with vma->anon_name now. Will fix it in the next version.

>    mm/madvise.c:140:16: sparse:     expected struct anon_vma_name *
>    mm/madvise.c:140:16: sparse:     got struct anon_vma_name [noderef] __=
rcu *anon_name
>    mm/madvise.c: note: in included file (through include/linux/smp.h, inc=
lude/linux/lockdep.h, include/linux/spinlock.h, ...):
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always eva=
luates to true
>    mm/madvise.c: note: in included file (through include/linux/rbtree.h, =
include/linux/mm_types.h, include/linux/mmzone.h, ...):
>    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in '=
madvise_cold_or_pageout_pte_range' - unexpected unlock
>    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in '=
madvise_free_pte_range' - unexpected unlock
>
> vim +401 include/linux/mm_inline.h
>
> 17fca131cee217 Arnd Bergmann      2022-01-14  394
> 5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  395  static inline void fre=
e_anon_vma_name(struct vm_area_struct *vma)
> 5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  396  {
> 17fca131cee217 Arnd Bergmann      2022-01-14  397       /*
> 5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  398        * Not using anon=
_vma_name because it generates a warning if mmap_lock
> 5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  399        * is not held, w=
hich might be the case here.
> 17fca131cee217 Arnd Bergmann      2022-01-14  400        */
> 5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04 @401       anon_vma_name_put=
(vma->anon_name);
> 5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  402  }
> 17fca131cee217 Arnd Bergmann      2022-01-14  403
>
> :::::: The code at line 401 was first introduced by commit
> :::::: 5c26f6ac9416b63d093e29c30e79b3297e425472 mm: refactor vm_area_stru=
ct::anon_vma_name usage code
>
> :::::: TO: Suren Baghdasaryan <surenb@google.com>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
