Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8761B801
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706288153; cv=none; b=iTw7ez6P3yJK7NIq/+5mQbEKzajl7v1D23tySM30v3ntUcUMiDinzHwDUhWLXciLU8JF7xTzcIbNUuJogltb68cDaYtx8R/vsTq9n62ZwoBbP0vW24MSBuzZRc/6XEbSaIhp+yp52GH9hqAGdS0Cx+M08KNRfwyRFNScF1NtvMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706288153; c=relaxed/simple;
	bh=712so7aqeRUws1ZqaGhGzArttdcknB4U8VFIFje4JVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Li5/g6DF9U8YpC16iLeZSRhmlEBU1Yob14IGbNqXLXdq6evsDXo7B85duYiHi5zQenzd4eecMyZZfUf8Veb5BkDyf4DE92Y6Sjy+uCfS7QbwwXOM6HraCsz8yo2lGUO6lYYaO8J56BMVy+KZeGGxBoZRBl8fGVKXotrL+bq/d98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zskubCi+; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zskubCi+"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5f69383e653so10570277b3.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 08:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706288150; x=1706892950; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8rw/iPSfUXc8CrWwX/sJp+21BLZIVLO5m8R/6gbDJg=;
        b=zskubCi+1Oybkv7fkdIqcGarkzuveKcrNxucecoDbEJ4Km66Mgq5gC7WvSkZi/ZapW
         6vmUGeNXfgbGAJpzDf14tg3Vw7LtIM4limFgvCqT8/z7jguKf65CbXgkwfaoXBszre9F
         lPFO4De8G9bIuGT5hicCPQbT03BJYtGPdhoEkRtjXkX/882PlbunSpMA520TEi6TH0lh
         Edi/qHOn/Se46jBrv0UvQJ8reLMJqOln8DhaFdcJf2yXef5lcDz/gUiy74a0r8NIXwC3
         60MGp3FdsTwEnpRKgsEfkVw52tVMKHYwC5RVM87ffaJU20cQfwzxAbJPjn3FI0g4q/HG
         cqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706288150; x=1706892950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8rw/iPSfUXc8CrWwX/sJp+21BLZIVLO5m8R/6gbDJg=;
        b=CHfLu6Qoc0G82Trw7Jx10/lejJBHQeYqUyC9pTUePNAgJLvps7ZnTKdFeHCA1PNrgJ
         alLJ4t6/UpTxHWw3tcJFg9qQQE58d1DivxFmg8VY36p7Dsn+L+QU9P6OV68WSQWn2blF
         +cWze/6fkJuVXe3fNOPSTqw6la9xGHcJjXXcS8DUqReym9ACdeeq4utatvuqap2i8udS
         brqoHkbWKrHrAFwooyYuZgMYucNUPLYAwH2/KR21fg6bRem9rsTyH+uVwqku6ZLMNbHv
         WSdvIAdIU4WABpaU1H74Rvi/21Fg0WoI+8DJRDmDJ6meD7tR+vV9GqQiM2FKyt8rLuUj
         3ilA==
X-Gm-Message-State: AOJu0YwR2v3c6t/Si/A42072hTpl1cK8faABHWrTsOP+qYAI8AkZI8iQ
	RBwHQecfap25eKICcmadqR3XhzzWixvry6LOoIVRjydCxSTPES/MMHCT0RierKNvvEjUdJVfUbf
	9qCgMNszTQYhGsm4Dsykpx4zpPOCXfy+whUBh
X-Google-Smtp-Source: AGHT+IH0IU9vwcPtiNseWBkpyVDvUe92JB7thEvXdpSsJnzGY2i5ssIzAh+1r52QtqCIrlvs5bqB05jZvP4qOTLDrh0=
X-Received: by 2002:a0d:db4b:0:b0:5ff:842a:cb77 with SMTP id
 d72-20020a0ddb4b000000b005ff842acb77mr71742ywe.90.1706288150026; Fri, 26 Jan
 2024 08:55:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401251829.0m6Eo4LI-lkp@intel.com> <CAJuCfpHW2=Zu+CHXL+5fjWxGk=CVix=C66ra+DmXgn6r3+fsXg@mail.gmail.com>
 <b82c9479-9331-4b31-9fca-3fa963901fe9@paulmck-laptop> <CAJuCfpGA7ScozuAL71idCRbfgxPaz+zY5jEYZ-FQmikQfXrD5A@mail.gmail.com>
 <ca479a8e-a8f5-48d7-96f9-27692091d2e9@paulmck-laptop> <CAJuCfpHYTjmjtZTAAREy1LBzapekvTk-7BiNQyypTcEypsje2A@mail.gmail.com>
 <68dc8592-6a5d-4cbe-bb8c-e0f4b5517684@paulmck-laptop>
In-Reply-To: <68dc8592-6a5d-4cbe-bb8c-e0f4b5517684@paulmck-laptop>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 26 Jan 2024 08:55:38 -0800
Message-ID: <CAJuCfpE8eAiP9QEquwFbBdtxVrBQiktadXe40H_Xfn+82Waa6Q@mail.gmail.com>
Subject: Re: [linux-next:master 1589/1892] fs/proc/task_mmu.c:143:45: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
To: paulmck@kernel.org
Cc: kernel test robot <lkp@intel.com>, Matthew Wilcox <willy@infradead.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 2:22=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Jan 25, 2024 at 06:24:05PM -0800, Suren Baghdasaryan wrote:
> > On Thu, Jan 25, 2024 at 4:35=E2=80=AFPM Paul E. McKenney <paulmck@kerne=
l.org> wrote:
> > >
> > > On Thu, Jan 25, 2024 at 03:17:17PM -0800, Suren Baghdasaryan wrote:
> > > > On Thu, Jan 25, 2024 at 2:44=E2=80=AFPM Paul E. McKenney <paulmck@k=
ernel.org> wrote:
> > > > >
> > > > > On Thu, Jan 25, 2024 at 01:27:34PM -0800, Suren Baghdasaryan wrot=
e:
> > > > > > On Thu, Jan 25, 2024 at 2:23=E2=80=AFAM kernel test robot <lkp@=
intel.com> wrote:
> > > > > > >
> > > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/=
linux-next.git master
> > > > > > > head:   01af33cc9894b4489fb68fa35c40e9fe85df63dc
> > > > > > > commit: 0c30c4cd953025979b7689e49844837f762303ec [1589/1892] =
mm/maps: read proc/pid/maps under RCU
> > > > > > > config: x86_64-randconfig-121-20240125 (https://download.01.o=
rg/0day-ci/archive/20240125/202401251829.0m6Eo4LI-lkp@intel.com/config)
> > > > > > > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-=
project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > > > > > > reproduce (this is a W=3D1 build): (https://download.01.org/0=
day-ci/archive/20240125/202401251829.0m6Eo4LI-lkp@intel.com/reproduce)
> > > > > > >
> > > > > > > If you fix the issue in a separate patch/commit (i.e. not jus=
t a new version of
> > > > > > > the same patch/commit), kindly add following tags
> > > > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202401251829.=
0m6Eo4LI-lkp@intel.com/
> > > > > > >
> > > > > > > sparse warnings: (new ones prefixed by >>)
> > > > > > > >> fs/proc/task_mmu.c:143:45: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct file [noder=
ef] __rcu **f @@     got struct file ** @@
> > > > > >
> > > > > > Uh, this is a problem.
> > > > > > I missed that get_file_rcu() is used only with mm->exe_file and
> > > > > > vma->vm_file is not really RCU-safe. It's freed via a call to f=
put()
> > > > > > which schedules its freeing using schedule_delayed_work(..., 1)=
 but I
> > > > > > don't think that constitutes RCU grace period. Paul, Matthew, c=
ould
> > > > > > you please confirm? In the meantime I'm going to ask Andrew to =
remove
> > > > > > my patchset from mm-unstable to be safe.
> > > > >
> > > > > Sadly, no, schedule_delayed_work() does not imply an RCU grace pe=
riod.
> > > > >
> > > > > There is a queue_rcu_work() that schedules work after a grace per=
iod,
> > > > > which could be combined with a timer to get the delay.
> > > > >
> > > > > Another approach would be to use get_state_synchronize_rcu() befo=
re
> > > > > the schedule_delayed_work() in fput(), then do cond_synchronize_r=
cu()
> > > > > in delayed_fput().  This would require adding an unsigned long to
> > > > > struct file to keep track of which grace period a given struct fi=
le
> > > > > needed to wait for.
> > > > >
> > > > > Perhaps something like this:
> > > > >
> > > > > -----------------------------------------------------------------=
-------
> > > > >
> > > > > void fput(struct file *file)
> > > > > {
> > > > >         if (atomic_long_dec_and_test(&file->f_count)) {
> > > > >                 struct task_struct *task =3D current;
> > > > >
> > > > >                 if (likely(!in_interrupt() && !(task->flags & PF_=
KTHREAD))) {
> > > > >                         init_task_work(&file->f_rcuhead, ____fput=
);
> > > > >                         if (!task_work_add(task, &file->f_rcuhead=
, TWA_RESUME))
> > > > >                                 return;
> > > > >                         /*
> > > > >                          * After this task has run exit_task_work=
(),
> > > > >                          * task_work_add() will fail.  Fall throu=
gh to delayed
> > > > >                          * fput to avoid leaking *file.
> > > > >                          */
> > > > >                 }
> > > > >
> > > > >                 file->f_rcu_seq =3D get_state_synchronize_rcu();
> > > > >                 if (llist_add(&file->f_llist, &delayed_fput_list)=
)
> > > > >                         schedule_delayed_work(&delayed_fput_work,=
 1);
> > > > >         }
> > > > > }
> > > > >
> > > > > -----------------------------------------------------------------=
-------
> > > > >
> > > > > And this:
> > > > >
> > > > > -----------------------------------------------------------------=
-------
> > > > >
> > > > > static void delayed_fput(struct work_struct *unused)
> > > > > {
> > > > >         struct llist_node *node =3D llist_del_all(&delayed_fput_l=
ist);
> > > > >         struct file *f, *t;
> > > > >
> > > > >         llist_for_each_entry_safe(f, t, node, f_llist) {
> > > > >                 cond_synchronize_rcu(f->f_rcu_seq);
> > > > >                 __fput(f);
> > > > >         }
> > > > > }
> > > > >
> > > > > -----------------------------------------------------------------=
-------
> > > > >
> > > > > Note that if you called fput() on a long sequence of struct file
> > > > > structures, the cond_synchronize_rcu() would be a near-noop almos=
t all the
> > > > > time, actually blocking at most about every once per every few ji=
ffies.
> > > > > After all, once a grace period has been waited for, it covers all=
 of
> > > > > the struct file structures that were passed to fput() during a gi=
ven
> > > > > RCU grace period.
> > > > >
> > > > > Still, it would add the occasional delay.  And it would increase =
the
> > > > > size of struct file, though there are workarounds for that, if si=
ze
> > > > > is an issue.
> > > > >
> > > > > Thoughts?
> > > >
> > > > Thanks for the suggestion, Paul. I'm worried about this occasional
> > > > delay but otherwise this seems like a nice and simple approach.
> > >
> > > One potential saving grace is that the more heavily loaded the mechan=
ism,
> > > the smaller a fraction of the cond_synchronize_rcu() calls will do
> > > a delay.
> > >
> > > >                                                                 Do =
you
> > > > guys think that making *all* files RCU-safe with this approach is
> > > > warranted? For my particular case I need only vma->vm_file to be
> > > > RCU-safe but maybe there are other cases which would benefit from
> > > > this?
> > >
> > > To this, I can only give an unqualified "I don't know".  :-(
> > >
> > > But if there is some condition that can be sampled on a per-file-stru=
cture
> > > basis, you could use that to invoke cond_synchronize_rcu() only when
> > > needed.  Or send only those file structures that need the extra delay
> > > through queue_rcu_work(), perhaps by accumulating a list of them.
> >
> > Thanks Paul! You gave me enough food for thought. Let me see if I can
> > come up with something usable.
>
> Do we have the same problem with the task_work_add() path in fput()?

Yes, I think so. It's called with TWA_RESUME, so the file will be
freed when the task returns to user mode, but that again does not
guarantee that RCU grace period is over.

>
>                                                         Thanx, Paul
>
> > Cheers,
> > Suren.
> >
> > >
> > >                                                         Thanx, Paul
> > >
> > > > > > >    fs/proc/task_mmu.c:143:45: sparse:     expected struct fil=
e [noderef] __rcu **f
> > > > > > >    fs/proc/task_mmu.c:143:45: sparse:     got struct file **
> > > > > > >    fs/proc/task_mmu.c: note: in included file (through includ=
e/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
> > > > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context im=
balance in 'get_vma_snapshot' - unexpected unlock
> > > > > > >    fs/proc/task_mmu.c:264:22: sparse: sparse: context imbalan=
ce in 'm_start' - different lock contexts for basic block
> > > > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context im=
balance in 'm_stop' - unexpected unlock
> > > > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context im=
balance in 'smaps_pte_range' - unexpected unlock
> > > > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context im=
balance in 'clear_refs_pte_range' - unexpected unlock
> > > > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context im=
balance in 'pagemap_pmd_range' - unexpected unlock
> > > > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context im=
balance in 'pagemap_scan_pmd_entry' - unexpected unlock
> > > > > > >    fs/proc/task_mmu.c: note: in included file (through arch/x=
86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task=
.h, ...):
> > > > > > >    arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: c=
ast removes address space '__user' of expression
> > > > > > >    arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: c=
ast removes address space '__user' of expression
> > > > > > >
> > > > > > > vim +143 fs/proc/task_mmu.c
> > > > > > >
> > > > > > >    132
> > > > > > >    133  /*
> > > > > > >    134   * Take VMA snapshot and pin vm_file and anon_name as=
 they are used by
> > > > > > >    135   * show_map_vma.
> > > > > > >    136   */
> > > > > > >    137  static int get_vma_snapshot(struct proc_maps_private =
*priv, struct vm_area_struct *vma)
> > > > > > >    138  {
> > > > > > >    139          struct vm_area_struct *copy =3D &priv->vma_co=
py;
> > > > > > >    140          int ret =3D -EAGAIN;
> > > > > > >    141
> > > > > > >    142          memcpy(copy, vma, sizeof(*vma));
> > > > > > >  > 143          if (copy->vm_file && !get_file_rcu(&copy->vm_=
file))
> > > > > > >    144                  goto out;
> > > > > > >    145
> > > > > > >    146          if (!anon_vma_name_get_if_valid(copy))
> > > > > > >    147                  goto put_file;
> > > > > > >    148
> > > > > > >    149          if (priv->mm_wr_seq =3D=3D mmap_write_seq_rea=
d(priv->mm))
> > > > > > >    150                  return 0;
> > > > > > >    151
> > > > > > >    152          /* Address space got modified, vma might be s=
tale. Wait and retry. */
> > > > > > >    153          rcu_read_unlock();
> > > > > > >    154          ret =3D mmap_read_lock_killable(priv->mm);
> > > > > > >    155          mmap_write_seq_record(priv->mm, &priv->mm_wr_=
seq);
> > > > > > >    156          mmap_read_unlock(priv->mm);
> > > > > > >    157          rcu_read_lock();
> > > > > > >    158
> > > > > > >    159          if (!ret)
> > > > > > >    160                  ret =3D -EAGAIN; /* no other errors, =
ok to retry */
> > > > > > >    161
> > > > > > >    162          anon_vma_name_put_if_valid(copy);
> > > > > > >    163  put_file:
> > > > > > >    164          if (copy->vm_file)
> > > > > > >    165                  fput(copy->vm_file);
> > > > > > >    166  out:
> > > > > > >    167          return ret;
> > > > > > >    168  }
> > > > > > >    169
> > > > > > >
> > > > > > > --
> > > > > > > 0-DAY CI Kernel Test Service
> > > > > > > https://github.com/intel/lkp-tests/wiki
