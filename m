Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7544579D9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 02:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706235859; cv=none; b=DUoribkuilL7zxc+X3GVEaZmpUJIEP0UNdlzHbg86IdzTKjpmVtrlXahRX3aBAzL1VwJEh1b23gIdb/uPGKoOCzXpAzDwmbzG4mV3CeRZA59dhbpPD3C49kGH7kRmHBUB0QPCFHbiG/NCVIkU+ZaDgNG8hR2yQmBSJCr6bPSjSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706235859; c=relaxed/simple;
	bh=4tC8sAOdp4DHJNbJ22UI92iTTcZWZcg7nH6pC1CIba0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTs6NIew5uXCpJCiTUY2zhJ+6fA8XJVj5p/GWcAY574fTtVrf9bLtXy9+X/bminTiksFTPgj/cklyGzqSmyO3uh5ydz29/Zem9GPpEkearGpAxg/f07nfsqnFUmEaOUNVUErJqcFyg1zoVNSe6tNNzIgM77XWj0Sbd+xoB0oNfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=07G/l1Xg; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="07G/l1Xg"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6002a655d77so41140107b3.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 18:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706235856; x=1706840656; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPs1aBX3lVBfn3SAANt3qn2t+DVZGWgp9ShsyXxUPnM=;
        b=07G/l1Xg9LIkJ++axjhvNMPNYPdsZtwfBURw3OUde/1uN+ZUWh7Rn01/7JW+hJEg2G
         FFSauDONYxDSJnSupmWnPbwBGUPSnnwoedFUFe3+9fruVSrSdGGa6TYGxFTDylIVyi/C
         TLZ8pU5iXTqLgmkyfpxNsNPVjgAe44TbHrgpwnFhpxagY9fXZGUQtjhgsylZ/dUgRmKU
         w217VeTlp7/goiWeCeOOHf1hF0bV2YCRCToDGQZV1wianiLzDKSOy2TaIuIJfU+xKxZ0
         qvhCz0yI2xi+eGQ1ruOoQx7nr1jgITASjKhJHg7+nM9DqRnwadwnj5dt1BuD94r+bFDU
         y6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706235856; x=1706840656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPs1aBX3lVBfn3SAANt3qn2t+DVZGWgp9ShsyXxUPnM=;
        b=dweBhEU8a15D0Y2KmFNcVntj6dR3NF8CJ0bw50Nd7vH49Y+AGn/TVfbAYnyfIF1Tu7
         nIUQSkF3F52gJHDexe3Gyoq3dcsrm2DbPgVBWOWMJERdakHBQP6HTerwyeQ9zwhpj1Xg
         t/Kh/tnW2HSvoZCVXLAX/aKQXZXifCiS0VYbNixXGmiHrzyQ5LqRXwUaadaQe+r8yig4
         jlZfSDPBo1z59hV4wiGRrRZlzkZ6QcCbcMXjI72MT1WU5Y7ZphNiq1hmHF1D/DY4CEzs
         nKR3GDwLhIfPtAfLqhyx9L+VN4OwarT8hAVkGNKKxT54Q/DWebucWpqE4EOInWlK1XDF
         j9yA==
X-Gm-Message-State: AOJu0Yxzc8hh36mLJI3Vu37pKc52nHoGiIsLCLptW5yDGjYz/BgSDZvR
	0V+FCYs5dYlM685YvtLEO1+VTby8HUyoSQY6yb36n3yMjQBKPy6bli9bi/rziBc2+zV+OpkaWqu
	1ablQrekkfq9Q0tH73xCUUVpImhXA2jmDWhLn
X-Google-Smtp-Source: AGHT+IErE5xInKlfhob4haiGG8dYHPZmqVFJJkPiXYmjsN7Ol9aGEdn40DDaYoBrLZfzqUdg8ujTYgJuTQdNCzxu3ys=
X-Received: by 2002:a81:4c56:0:b0:602:cb1e:9894 with SMTP id
 z83-20020a814c56000000b00602cb1e9894mr75057ywa.88.1706235855942; Thu, 25 Jan
 2024 18:24:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401251829.0m6Eo4LI-lkp@intel.com> <CAJuCfpHW2=Zu+CHXL+5fjWxGk=CVix=C66ra+DmXgn6r3+fsXg@mail.gmail.com>
 <b82c9479-9331-4b31-9fca-3fa963901fe9@paulmck-laptop> <CAJuCfpGA7ScozuAL71idCRbfgxPaz+zY5jEYZ-FQmikQfXrD5A@mail.gmail.com>
 <ca479a8e-a8f5-48d7-96f9-27692091d2e9@paulmck-laptop>
In-Reply-To: <ca479a8e-a8f5-48d7-96f9-27692091d2e9@paulmck-laptop>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 25 Jan 2024 18:24:05 -0800
Message-ID: <CAJuCfpHYTjmjtZTAAREy1LBzapekvTk-7BiNQyypTcEypsje2A@mail.gmail.com>
Subject: Re: [linux-next:master 1589/1892] fs/proc/task_mmu.c:143:45: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
To: paulmck@kernel.org
Cc: kernel test robot <lkp@intel.com>, Matthew Wilcox <willy@infradead.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 4:35=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Jan 25, 2024 at 03:17:17PM -0800, Suren Baghdasaryan wrote:
> > On Thu, Jan 25, 2024 at 2:44=E2=80=AFPM Paul E. McKenney <paulmck@kerne=
l.org> wrote:
> > >
> > > On Thu, Jan 25, 2024 at 01:27:34PM -0800, Suren Baghdasaryan wrote:
> > > > On Thu, Jan 25, 2024 at 2:23=E2=80=AFAM kernel test robot <lkp@inte=
l.com> wrote:
> > > > >
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linu=
x-next.git master
> > > > > head:   01af33cc9894b4489fb68fa35c40e9fe85df63dc
> > > > > commit: 0c30c4cd953025979b7689e49844837f762303ec [1589/1892] mm/m=
aps: read proc/pid/maps under RCU
> > > > > config: x86_64-randconfig-121-20240125 (https://download.01.org/0=
day-ci/archive/20240125/202401251829.0m6Eo4LI-lkp@intel.com/config)
> > > > > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-proj=
ect 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-=
ci/archive/20240125/202401251829.0m6Eo4LI-lkp@intel.com/reproduce)
> > > > >
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a =
new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202401251829.0m6E=
o4LI-lkp@intel.com/
> > > > >
> > > > > sparse warnings: (new ones prefixed by >>)
> > > > > >> fs/proc/task_mmu.c:143:45: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct file [noderef] =
__rcu **f @@     got struct file ** @@
> > > >
> > > > Uh, this is a problem.
> > > > I missed that get_file_rcu() is used only with mm->exe_file and
> > > > vma->vm_file is not really RCU-safe. It's freed via a call to fput(=
)
> > > > which schedules its freeing using schedule_delayed_work(..., 1) but=
 I
> > > > don't think that constitutes RCU grace period. Paul, Matthew, could
> > > > you please confirm? In the meantime I'm going to ask Andrew to remo=
ve
> > > > my patchset from mm-unstable to be safe.
> > >
> > > Sadly, no, schedule_delayed_work() does not imply an RCU grace period=
.
> > >
> > > There is a queue_rcu_work() that schedules work after a grace period,
> > > which could be combined with a timer to get the delay.
> > >
> > > Another approach would be to use get_state_synchronize_rcu() before
> > > the schedule_delayed_work() in fput(), then do cond_synchronize_rcu()
> > > in delayed_fput().  This would require adding an unsigned long to
> > > struct file to keep track of which grace period a given struct file
> > > needed to wait for.
> > >
> > > Perhaps something like this:
> > >
> > > ---------------------------------------------------------------------=
---
> > >
> > > void fput(struct file *file)
> > > {
> > >         if (atomic_long_dec_and_test(&file->f_count)) {
> > >                 struct task_struct *task =3D current;
> > >
> > >                 if (likely(!in_interrupt() && !(task->flags & PF_KTHR=
EAD))) {
> > >                         init_task_work(&file->f_rcuhead, ____fput);
> > >                         if (!task_work_add(task, &file->f_rcuhead, TW=
A_RESUME))
> > >                                 return;
> > >                         /*
> > >                          * After this task has run exit_task_work(),
> > >                          * task_work_add() will fail.  Fall through t=
o delayed
> > >                          * fput to avoid leaking *file.
> > >                          */
> > >                 }
> > >
> > >                 file->f_rcu_seq =3D get_state_synchronize_rcu();
> > >                 if (llist_add(&file->f_llist, &delayed_fput_list))
> > >                         schedule_delayed_work(&delayed_fput_work, 1);
> > >         }
> > > }
> > >
> > > ---------------------------------------------------------------------=
---
> > >
> > > And this:
> > >
> > > ---------------------------------------------------------------------=
---
> > >
> > > static void delayed_fput(struct work_struct *unused)
> > > {
> > >         struct llist_node *node =3D llist_del_all(&delayed_fput_list)=
;
> > >         struct file *f, *t;
> > >
> > >         llist_for_each_entry_safe(f, t, node, f_llist) {
> > >                 cond_synchronize_rcu(f->f_rcu_seq);
> > >                 __fput(f);
> > >         }
> > > }
> > >
> > > ---------------------------------------------------------------------=
---
> > >
> > > Note that if you called fput() on a long sequence of struct file
> > > structures, the cond_synchronize_rcu() would be a near-noop almost al=
l the
> > > time, actually blocking at most about every once per every few jiffie=
s.
> > > After all, once a grace period has been waited for, it covers all of
> > > the struct file structures that were passed to fput() during a given
> > > RCU grace period.
> > >
> > > Still, it would add the occasional delay.  And it would increase the
> > > size of struct file, though there are workarounds for that, if size
> > > is an issue.
> > >
> > > Thoughts?
> >
> > Thanks for the suggestion, Paul. I'm worried about this occasional
> > delay but otherwise this seems like a nice and simple approach.
>
> One potential saving grace is that the more heavily loaded the mechanism,
> the smaller a fraction of the cond_synchronize_rcu() calls will do
> a delay.
>
> >                                                                 Do you
> > guys think that making *all* files RCU-safe with this approach is
> > warranted? For my particular case I need only vma->vm_file to be
> > RCU-safe but maybe there are other cases which would benefit from
> > this?
>
> To this, I can only give an unqualified "I don't know".  :-(
>
> But if there is some condition that can be sampled on a per-file-structur=
e
> basis, you could use that to invoke cond_synchronize_rcu() only when
> needed.  Or send only those file structures that need the extra delay
> through queue_rcu_work(), perhaps by accumulating a list of them.

Thanks Paul! You gave me enough food for thought. Let me see if I can
come up with something usable.
Cheers,
Suren.

>
>                                                         Thanx, Paul
>
> > > > >    fs/proc/task_mmu.c:143:45: sparse:     expected struct file [n=
oderef] __rcu **f
> > > > >    fs/proc/task_mmu.c:143:45: sparse:     got struct file **
> > > > >    fs/proc/task_mmu.c: note: in included file (through include/li=
nux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
> > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbala=
nce in 'get_vma_snapshot' - unexpected unlock
> > > > >    fs/proc/task_mmu.c:264:22: sparse: sparse: context imbalance i=
n 'm_start' - different lock contexts for basic block
> > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbala=
nce in 'm_stop' - unexpected unlock
> > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbala=
nce in 'smaps_pte_range' - unexpected unlock
> > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbala=
nce in 'clear_refs_pte_range' - unexpected unlock
> > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbala=
nce in 'pagemap_pmd_range' - unexpected unlock
> > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbala=
nce in 'pagemap_scan_pmd_entry' - unexpected unlock
> > > > >    fs/proc/task_mmu.c: note: in included file (through arch/x86/i=
nclude/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, =
...):
> > > > >    arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast =
removes address space '__user' of expression
> > > > >    arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast =
removes address space '__user' of expression
> > > > >
> > > > > vim +143 fs/proc/task_mmu.c
> > > > >
> > > > >    132
> > > > >    133  /*
> > > > >    134   * Take VMA snapshot and pin vm_file and anon_name as the=
y are used by
> > > > >    135   * show_map_vma.
> > > > >    136   */
> > > > >    137  static int get_vma_snapshot(struct proc_maps_private *pri=
v, struct vm_area_struct *vma)
> > > > >    138  {
> > > > >    139          struct vm_area_struct *copy =3D &priv->vma_copy;
> > > > >    140          int ret =3D -EAGAIN;
> > > > >    141
> > > > >    142          memcpy(copy, vma, sizeof(*vma));
> > > > >  > 143          if (copy->vm_file && !get_file_rcu(&copy->vm_file=
))
> > > > >    144                  goto out;
> > > > >    145
> > > > >    146          if (!anon_vma_name_get_if_valid(copy))
> > > > >    147                  goto put_file;
> > > > >    148
> > > > >    149          if (priv->mm_wr_seq =3D=3D mmap_write_seq_read(pr=
iv->mm))
> > > > >    150                  return 0;
> > > > >    151
> > > > >    152          /* Address space got modified, vma might be stale=
. Wait and retry. */
> > > > >    153          rcu_read_unlock();
> > > > >    154          ret =3D mmap_read_lock_killable(priv->mm);
> > > > >    155          mmap_write_seq_record(priv->mm, &priv->mm_wr_seq)=
;
> > > > >    156          mmap_read_unlock(priv->mm);
> > > > >    157          rcu_read_lock();
> > > > >    158
> > > > >    159          if (!ret)
> > > > >    160                  ret =3D -EAGAIN; /* no other errors, ok t=
o retry */
> > > > >    161
> > > > >    162          anon_vma_name_put_if_valid(copy);
> > > > >    163  put_file:
> > > > >    164          if (copy->vm_file)
> > > > >    165                  fput(copy->vm_file);
> > > > >    166  out:
> > > > >    167          return ret;
> > > > >    168  }
> > > > >    169
> > > > >
> > > > > --
> > > > > 0-DAY CI Kernel Test Service
> > > > > https://github.com/intel/lkp-tests/wiki
