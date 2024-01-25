Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D54A12B8A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706224653; cv=none; b=poLmsgSF/CvD/dINS0krouQUI6B1/HuPTXT05ZQ9xK8K1I74NM2wSTtsScI2ucZN1wUbAcCcNfLVVtXNU7+fqL72y+EHhuYpgyhP909whfzOAGmFLkcGgt0BnqIvUgiymRfo48qi2Vsm34kiOPJH18GTZ7IjxETOdbrA68DLLMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706224653; c=relaxed/simple;
	bh=mHR90A2Ycft4obkln2q58XB0e5opHdM3KcoqvPwt/kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZZhADnFpuW2ovk+Rc+73Z45iOwJk2cw4CVdldy20Mdi1AwXF9rVti/xICZAWlcTczsF2W5I6BsCr14n38+++BL+L/HEPA4JCiuoKMVWj03pJahSE9p8uxzR7angV8TPnj/V1YgLpAoEdpogPPJtOjoJyqOAu5tzYja1LwW8zz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CnpcymGg; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CnpcymGg"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6001449a2beso37909237b3.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 15:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706224650; x=1706829450; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfnVGOohXDcV+59QsJtkNm9xelbrtdNZwr+64tiF+f8=;
        b=CnpcymGgLRbL6KTjQ+tCGjp5Gcvrei+zSkK15O0jmlxoBnvfEEPbCGwwtld6wWYcLi
         vWNMxR/O/kVanaFdlr8aAH2y8ot1BJCjFQqxanuFXtbUbrBTRICkPBENbO6nEwlJmt8l
         XoG+MZglqoa8/ZRWWPNf98BXJYbhrBm1pEi1z6FLVRelzXIZlrMB3lP+Jdfl2OWzAl8a
         ia2lDfu1bVZdLAB8ELl6MN84GPGpxh/NKbtdRG1e2R+OagKnsNHZaUjwxbFFtGwL0pau
         tUv23K7mbn9sdMCokj7s1tdG2X3Wsh+YAGS7HhKyWEOqeGdGbItbdA6utkNBo0+p/TAF
         dvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224650; x=1706829450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfnVGOohXDcV+59QsJtkNm9xelbrtdNZwr+64tiF+f8=;
        b=gvPTQXi/ES4JnbV/Yv0+03YxU9dJoRS16oxwBB3FbP+RRQ+AVxRdLLZE9sBEBQpQhH
         w739pQYjy8AYSCErOYWq/hRea0Z6FO7kwDo802xIFq8+LpYxFGHZqau5GqYhi1PC71yJ
         JGcuMbWJXtOjDmZrMDhuLI+u+C9Z3jMYu2wmSKki7Z+cMLtdKKhIgGow/eE7on2P3bbe
         JvqHmXiEw6xNu9fgdlc2Vrh66vd4UVT8s/d4V04tuDaKh0zRkpop7gRK0VhYCsm2gTdb
         kqi29v3z4X/FqxX5H/N72k/ooYIfv3jwUIbDZ96sVMjJeC1DWsDtsbTU8L0nPVwKGSjA
         QFuw==
X-Gm-Message-State: AOJu0YyE20OiklRJT8K7sHcxCZ/hJDCqeBVbF41Eba78i5yeHI3G7wy4
	GGaThGbb/cRiRKIsN66thj0gRWIJq2VAtTYW7mCFw1UX1ROJYKFS/CNfgey0PEjLW1AEKhANe58
	eA9+dASMN8IjSnEJyzVYmyZvNC0xuwrZhiVIY
X-Google-Smtp-Source: AGHT+IHK7AxOxgse4iT4ETu9J+bHsU0DPuQpdovV/6ajzEFWcqKsDafdjuSf3zlh7zNpPfElvxRO6aeZaA7/eU+naGI=
X-Received: by 2002:a81:48cc:0:b0:5fb:16e6:cc01 with SMTP id
 v195-20020a8148cc000000b005fb16e6cc01mr632261ywa.71.1706224650095; Thu, 25
 Jan 2024 15:17:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401251829.0m6Eo4LI-lkp@intel.com> <CAJuCfpHW2=Zu+CHXL+5fjWxGk=CVix=C66ra+DmXgn6r3+fsXg@mail.gmail.com>
 <b82c9479-9331-4b31-9fca-3fa963901fe9@paulmck-laptop>
In-Reply-To: <b82c9479-9331-4b31-9fca-3fa963901fe9@paulmck-laptop>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 25 Jan 2024 15:17:17 -0800
Message-ID: <CAJuCfpGA7ScozuAL71idCRbfgxPaz+zY5jEYZ-FQmikQfXrD5A@mail.gmail.com>
Subject: Re: [linux-next:master 1589/1892] fs/proc/task_mmu.c:143:45: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
To: paulmck@kernel.org
Cc: kernel test robot <lkp@intel.com>, Matthew Wilcox <willy@infradead.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 2:44=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Jan 25, 2024 at 01:27:34PM -0800, Suren Baghdasaryan wrote:
> > On Thu, Jan 25, 2024 at 2:23=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git master
> > > head:   01af33cc9894b4489fb68fa35c40e9fe85df63dc
> > > commit: 0c30c4cd953025979b7689e49844837f762303ec [1589/1892] mm/maps:=
 read proc/pid/maps under RCU
> > > config: x86_64-randconfig-121-20240125 (https://download.01.org/0day-=
ci/archive/20240125/202401251829.0m6Eo4LI-lkp@intel.com/config)
> > > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project =
6009708b4367171ccdbf4b5905cb6a803753fe18)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20240125/202401251829.0m6Eo4LI-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202401251829.0m6Eo4LI=
-lkp@intel.com/
> > >
> > > sparse warnings: (new ones prefixed by >>)
> > > >> fs/proc/task_mmu.c:143:45: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected struct file [noderef] __rc=
u **f @@     got struct file ** @@
> >
> > Uh, this is a problem.
> > I missed that get_file_rcu() is used only with mm->exe_file and
> > vma->vm_file is not really RCU-safe. It's freed via a call to fput()
> > which schedules its freeing using schedule_delayed_work(..., 1) but I
> > don't think that constitutes RCU grace period. Paul, Matthew, could
> > you please confirm? In the meantime I'm going to ask Andrew to remove
> > my patchset from mm-unstable to be safe.
>
> Sadly, no, schedule_delayed_work() does not imply an RCU grace period.
>
> There is a queue_rcu_work() that schedules work after a grace period,
> which could be combined with a timer to get the delay.
>
> Another approach would be to use get_state_synchronize_rcu() before
> the schedule_delayed_work() in fput(), then do cond_synchronize_rcu()
> in delayed_fput().  This would require adding an unsigned long to
> struct file to keep track of which grace period a given struct file
> needed to wait for.
>
> Perhaps something like this:
>
> ------------------------------------------------------------------------
>
> void fput(struct file *file)
> {
>         if (atomic_long_dec_and_test(&file->f_count)) {
>                 struct task_struct *task =3D current;
>
>                 if (likely(!in_interrupt() && !(task->flags & PF_KTHREAD)=
)) {
>                         init_task_work(&file->f_rcuhead, ____fput);
>                         if (!task_work_add(task, &file->f_rcuhead, TWA_RE=
SUME))
>                                 return;
>                         /*
>                          * After this task has run exit_task_work(),
>                          * task_work_add() will fail.  Fall through to de=
layed
>                          * fput to avoid leaking *file.
>                          */
>                 }
>
>                 file->f_rcu_seq =3D get_state_synchronize_rcu();
>                 if (llist_add(&file->f_llist, &delayed_fput_list))
>                         schedule_delayed_work(&delayed_fput_work, 1);
>         }
> }
>
> ------------------------------------------------------------------------
>
> And this:
>
> ------------------------------------------------------------------------
>
> static void delayed_fput(struct work_struct *unused)
> {
>         struct llist_node *node =3D llist_del_all(&delayed_fput_list);
>         struct file *f, *t;
>
>         llist_for_each_entry_safe(f, t, node, f_llist) {
>                 cond_synchronize_rcu(f->f_rcu_seq);
>                 __fput(f);
>         }
> }
>
> ------------------------------------------------------------------------
>
> Note that if you called fput() on a long sequence of struct file
> structures, the cond_synchronize_rcu() would be a near-noop almost all th=
e
> time, actually blocking at most about every once per every few jiffies.
> After all, once a grace period has been waited for, it covers all of
> the struct file structures that were passed to fput() during a given
> RCU grace period.
>
> Still, it would add the occasional delay.  And it would increase the
> size of struct file, though there are workarounds for that, if size
> is an issue.
>
> Thoughts?

Thanks for the suggestion, Paul. I'm worried about this occasional
delay but otherwise this seems like a nice and simple approach. Do you
guys think that making *all* files RCU-safe with this approach is
warranted? For my particular case I need only vma->vm_file to be
RCU-safe but maybe there are other cases which would benefit from
this?

>
>                                                         Thanx, Paul
>
> > >    fs/proc/task_mmu.c:143:45: sparse:     expected struct file [noder=
ef] __rcu **f
> > >    fs/proc/task_mmu.c:143:45: sparse:     got struct file **
> > >    fs/proc/task_mmu.c: note: in included file (through include/linux/=
rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
> > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance =
in 'get_vma_snapshot' - unexpected unlock
> > >    fs/proc/task_mmu.c:264:22: sparse: sparse: context imbalance in 'm=
_start' - different lock contexts for basic block
> > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance =
in 'm_stop' - unexpected unlock
> > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance =
in 'smaps_pte_range' - unexpected unlock
> > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance =
in 'clear_refs_pte_range' - unexpected unlock
> > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance =
in 'pagemap_pmd_range' - unexpected unlock
> > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance =
in 'pagemap_scan_pmd_entry' - unexpected unlock
> > >    fs/proc/task_mmu.c: note: in included file (through arch/x86/inclu=
de/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...)=
:
> > >    arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast remo=
ves address space '__user' of expression
> > >    arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast remo=
ves address space '__user' of expression
> > >
> > > vim +143 fs/proc/task_mmu.c
> > >
> > >    132
> > >    133  /*
> > >    134   * Take VMA snapshot and pin vm_file and anon_name as they ar=
e used by
> > >    135   * show_map_vma.
> > >    136   */
> > >    137  static int get_vma_snapshot(struct proc_maps_private *priv, s=
truct vm_area_struct *vma)
> > >    138  {
> > >    139          struct vm_area_struct *copy =3D &priv->vma_copy;
> > >    140          int ret =3D -EAGAIN;
> > >    141
> > >    142          memcpy(copy, vma, sizeof(*vma));
> > >  > 143          if (copy->vm_file && !get_file_rcu(&copy->vm_file))
> > >    144                  goto out;
> > >    145
> > >    146          if (!anon_vma_name_get_if_valid(copy))
> > >    147                  goto put_file;
> > >    148
> > >    149          if (priv->mm_wr_seq =3D=3D mmap_write_seq_read(priv->=
mm))
> > >    150                  return 0;
> > >    151
> > >    152          /* Address space got modified, vma might be stale. Wa=
it and retry. */
> > >    153          rcu_read_unlock();
> > >    154          ret =3D mmap_read_lock_killable(priv->mm);
> > >    155          mmap_write_seq_record(priv->mm, &priv->mm_wr_seq);
> > >    156          mmap_read_unlock(priv->mm);
> > >    157          rcu_read_lock();
> > >    158
> > >    159          if (!ret)
> > >    160                  ret =3D -EAGAIN; /* no other errors, ok to re=
try */
> > >    161
> > >    162          anon_vma_name_put_if_valid(copy);
> > >    163  put_file:
> > >    164          if (copy->vm_file)
> > >    165                  fput(copy->vm_file);
> > >    166  out:
> > >    167          return ret;
> > >    168  }
> > >    169
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
