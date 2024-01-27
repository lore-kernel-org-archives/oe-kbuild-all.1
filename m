Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F5C28DD6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 18:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706378565; cv=none; b=MCZ4uJ3ilP5ijzrbO+JGs5H9Ev+oS7jh3jCWJ7C+I4vsXOq3vvAm38kGpbgJBTLwaQUPSf2wyFnsu3g1Zl8+0l8cCCl3ye/6JSUSt0OFw4WRix+FvpgIF2wqK2f/drgTlFYpkoq3/TWuBqo/ZdH7iz1uYuGgqJbY9tk7lrMByxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706378565; c=relaxed/simple;
	bh=gFwUPi43f9xQgmSoLr64yHzYwtull6gQiYdqYVswprI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Du9ncPwtqhiw64KDJhIQ0jaIXCjwp/2uGqhr4wMiWpTm0UdnNRycIiMhhBwqyTRConBVqALctIzHWKT2Cgtm/256TKUPgkz4kqm1e1dBcbGA3AAuR99VBhZ5KYfI1lZGArO8/1ocwaY6CgnRL56Hc4YxDkSSWaTjleg8fWKg2qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t4ljjMAH; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t4ljjMAH"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-602cab8d7c9so15930547b3.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 10:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706378562; x=1706983362; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhiFcVZmiXVUvji49USxdoSuM/ho0pSL5Ac9zd/G2Qs=;
        b=t4ljjMAH40NZqbdGSyP3osI2BLjRmSKbr8OjFsEF6L9+QqeneaPO2KoBhSGMb/sPyo
         KGZcR3yDFxnhOrnGsVUxSpImGwuUrVrL3qWQs2x/pPczWNkADRf49OPGq8C/iAYSntSM
         Kz6U4u54ZpVWojS/fGgwZPlXKsxkvaPwfJxeTj5dCFW9M5mNQgGuiGtOPTcGh7eD6dLw
         GAS2Tiv9KsvqURYEug5K7KmvXoijIJTMyZ8gW/3MTFgEJgTFnaznTNQGLiZvTvn/WR4+
         pOxbJtK4jyTtVWlDRfwAyomEBKqHYihkA1ZkkgH16wrarWfMtk+mDzLTP1jD3UgsGMon
         6+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706378562; x=1706983362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhiFcVZmiXVUvji49USxdoSuM/ho0pSL5Ac9zd/G2Qs=;
        b=TmXvhbdOSJRkW2ZUceO0F+TKkwRXJ09rCa6xNnDKdGkRTOhdAs9jawV6svQNe0pyf6
         t58SUX/4eGs0nBryK/8m6zNn9JPfEiv3BVfuSoG7PsyKEUUkPElQMSDrP8cmOOsJ9CGH
         WRMEozoriIFmG/goBMNerEzjgAek4kUk88aX9LwTCXNT2C3SBD5hRnaTFZ+jGVTQcg7C
         0Cj6XKd2VPSjQE4FgYGBBRsve6HBgHSfK2B0E/laMgSCOzRQK3jHdeY1HKLhZYVZCbCZ
         aK7BsL4Zn3C5drOTLzJGYSILkgsb5svkgB5VPw/PJi7gciVUMm9hE/WgX7g9XmKFX/aD
         DsPA==
X-Gm-Message-State: AOJu0Yx0QfBNc/Ono1SdmnJY+l3mmUYFa6uEn9gfxxYbLK0Wf3ol5Olw
	ZXqyFzUB7UQKA8av17F8u4015ezux0UXdGR72RbZyMUkBpyDr5ZM/lKAgSE//Ku9FY44WfHFcU/
	0mNDI3Dn8yrnb6w+NnK/xYs0ZjXfcyG74ZuIp
X-Google-Smtp-Source: AGHT+IFt7D7fcQfZUWWTB7lckMEwB+zTiuLppRMJKogQRIcWErOVAUcur86HZHUuAw5T7y0qoeOFQNXAK9pJ8B0GKjA=
X-Received: by 2002:a81:4cce:0:b0:602:c7e7:4721 with SMTP id
 z197-20020a814cce000000b00602c7e74721mr1341417ywa.98.1706378561680; Sat, 27
 Jan 2024 10:02:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401251829.0m6Eo4LI-lkp@intel.com> <CAJuCfpHW2=Zu+CHXL+5fjWxGk=CVix=C66ra+DmXgn6r3+fsXg@mail.gmail.com>
 <b82c9479-9331-4b31-9fca-3fa963901fe9@paulmck-laptop> <CAJuCfpGA7ScozuAL71idCRbfgxPaz+zY5jEYZ-FQmikQfXrD5A@mail.gmail.com>
 <ca479a8e-a8f5-48d7-96f9-27692091d2e9@paulmck-laptop> <CAJuCfpHYTjmjtZTAAREy1LBzapekvTk-7BiNQyypTcEypsje2A@mail.gmail.com>
 <68dc8592-6a5d-4cbe-bb8c-e0f4b5517684@paulmck-laptop> <CAJuCfpE8eAiP9QEquwFbBdtxVrBQiktadXe40H_Xfn+82Waa6Q@mail.gmail.com>
 <d8eb2dbe-0608-46a7-9e56-30e89c775515@paulmck-laptop>
In-Reply-To: <d8eb2dbe-0608-46a7-9e56-30e89c775515@paulmck-laptop>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 27 Jan 2024 10:02:29 -0800
Message-ID: <CAJuCfpEabbNre4rsA+VHCfXOszHTUzg48xpDApzpBWfomMU_kQ@mail.gmail.com>
Subject: Re: [linux-next:master 1589/1892] fs/proc/task_mmu.c:143:45: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
To: paulmck@kernel.org
Cc: kernel test robot <lkp@intel.com>, Matthew Wilcox <willy@infradead.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 11:27=E2=80=AFAM Paul E. McKenney <paulmck@kernel.o=
rg> wrote:
>
> On Fri, Jan 26, 2024 at 08:55:38AM -0800, Suren Baghdasaryan wrote:
> > On Fri, Jan 26, 2024 at 2:22=E2=80=AFAM Paul E. McKenney <paulmck@kerne=
l.org> wrote:
> > >
> > > On Thu, Jan 25, 2024 at 06:24:05PM -0800, Suren Baghdasaryan wrote:
> > > > On Thu, Jan 25, 2024 at 4:35=E2=80=AFPM Paul E. McKenney <paulmck@k=
ernel.org> wrote:
> > > > >
> > > > > On Thu, Jan 25, 2024 at 03:17:17PM -0800, Suren Baghdasaryan wrot=
e:
> > > > > > On Thu, Jan 25, 2024 at 2:44=E2=80=AFPM Paul E. McKenney <paulm=
ck@kernel.org> wrote:
> > > > > > >
> > > > > > > On Thu, Jan 25, 2024 at 01:27:34PM -0800, Suren Baghdasaryan =
wrote:
> > > > > > > > On Thu, Jan 25, 2024 at 2:23=E2=80=AFAM kernel test robot <=
lkp@intel.com> wrote:
> > > > > > > > >
> > > > > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git master
> > > > > > > > > head:   01af33cc9894b4489fb68fa35c40e9fe85df63dc
> > > > > > > > > commit: 0c30c4cd953025979b7689e49844837f762303ec [1589/18=
92] mm/maps: read proc/pid/maps under RCU
> > > > > > > > > config: x86_64-randconfig-121-20240125 (https://download.=
01.org/0day-ci/archive/20240125/202401251829.0m6Eo4LI-lkp@intel.com/config)
> > > > > > > > > compiler: clang version 17.0.6 (https://github.com/llvm/l=
lvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > > > > > > > > reproduce (this is a W=3D1 build): (https://download.01.o=
rg/0day-ci/archive/20240125/202401251829.0m6Eo4LI-lkp@intel.com/reproduce)
> > > > > > > > >
> > > > > > > > > If you fix the issue in a separate patch/commit (i.e. not=
 just a new version of
> > > > > > > > > the same patch/commit), kindly add following tags
> > > > > > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202401251=
829.0m6Eo4LI-lkp@intel.com/
> > > > > > > > >
> > > > > > > > > sparse warnings: (new ones prefixed by >>)
> > > > > > > > > >> fs/proc/task_mmu.c:143:45: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected struct file [n=
oderef] __rcu **f @@     got struct file ** @@
> > > > > > > >
> > > > > > > > Uh, this is a problem.
> > > > > > > > I missed that get_file_rcu() is used only with mm->exe_file=
 and
> > > > > > > > vma->vm_file is not really RCU-safe. It's freed via a call =
to fput()
> > > > > > > > which schedules its freeing using schedule_delayed_work(...=
, 1) but I
> > > > > > > > don't think that constitutes RCU grace period. Paul, Matthe=
w, could
> > > > > > > > you please confirm? In the meantime I'm going to ask Andrew=
 to remove
> > > > > > > > my patchset from mm-unstable to be safe.
> > > > > > >
> > > > > > > Sadly, no, schedule_delayed_work() does not imply an RCU grac=
e period.
> > > > > > >
> > > > > > > There is a queue_rcu_work() that schedules work after a grace=
 period,
> > > > > > > which could be combined with a timer to get the delay.
> > > > > > >
> > > > > > > Another approach would be to use get_state_synchronize_rcu() =
before
> > > > > > > the schedule_delayed_work() in fput(), then do cond_synchroni=
ze_rcu()
> > > > > > > in delayed_fput().  This would require adding an unsigned lon=
g to
> > > > > > > struct file to keep track of which grace period a given struc=
t file
> > > > > > > needed to wait for.
> > > > > > >
> > > > > > > Perhaps something like this:
> > > > > > >
> > > > > > > -------------------------------------------------------------=
-----------
> > > > > > >
> > > > > > > void fput(struct file *file)
> > > > > > > {
> > > > > > >         if (atomic_long_dec_and_test(&file->f_count)) {
> > > > > > >                 struct task_struct *task =3D current;
> > > > > > >
> > > > > > >                 if (likely(!in_interrupt() && !(task->flags &=
 PF_KTHREAD))) {
> > > > > > >                         init_task_work(&file->f_rcuhead, ____=
fput);
> > > > > > >                         if (!task_work_add(task, &file->f_rcu=
head, TWA_RESUME))
> > > > > > >                                 return;
> > > > > > >                         /*
> > > > > > >                          * After this task has run exit_task_=
work(),
> > > > > > >                          * task_work_add() will fail.  Fall t=
hrough to delayed
> > > > > > >                          * fput to avoid leaking *file.
> > > > > > >                          */
> > > > > > >                 }
> > > > > > >
> > > > > > >                 file->f_rcu_seq =3D get_state_synchronize_rcu=
();
> > > > > > >                 if (llist_add(&file->f_llist, &delayed_fput_l=
ist))
> > > > > > >                         schedule_delayed_work(&delayed_fput_w=
ork, 1);
> > > > > > >         }
> > > > > > > }
> > > > > > >
> > > > > > > -------------------------------------------------------------=
-----------
> > > > > > >
> > > > > > > And this:
> > > > > > >
> > > > > > > -------------------------------------------------------------=
-----------
> > > > > > >
> > > > > > > static void delayed_fput(struct work_struct *unused)
> > > > > > > {
> > > > > > >         struct llist_node *node =3D llist_del_all(&delayed_fp=
ut_list);
> > > > > > >         struct file *f, *t;
> > > > > > >
> > > > > > >         llist_for_each_entry_safe(f, t, node, f_llist) {
> > > > > > >                 cond_synchronize_rcu(f->f_rcu_seq);
> > > > > > >                 __fput(f);
> > > > > > >         }
> > > > > > > }
> > > > > > >
> > > > > > > -------------------------------------------------------------=
-----------
> > > > > > >
> > > > > > > Note that if you called fput() on a long sequence of struct f=
ile
> > > > > > > structures, the cond_synchronize_rcu() would be a near-noop a=
lmost all the
> > > > > > > time, actually blocking at most about every once per every fe=
w jiffies.
> > > > > > > After all, once a grace period has been waited for, it covers=
 all of
> > > > > > > the struct file structures that were passed to fput() during =
a given
> > > > > > > RCU grace period.
> > > > > > >
> > > > > > > Still, it would add the occasional delay.  And it would incre=
ase the
> > > > > > > size of struct file, though there are workarounds for that, i=
f size
> > > > > > > is an issue.
> > > > > > >
> > > > > > > Thoughts?
> > > > > >
> > > > > > Thanks for the suggestion, Paul. I'm worried about this occasio=
nal
> > > > > > delay but otherwise this seems like a nice and simple approach.
> > > > >
> > > > > One potential saving grace is that the more heavily loaded the me=
chanism,
> > > > > the smaller a fraction of the cond_synchronize_rcu() calls will d=
o
> > > > > a delay.
> > > > >
> > > > > >                                                                =
 Do you
> > > > > > guys think that making *all* files RCU-safe with this approach =
is
> > > > > > warranted? For my particular case I need only vma->vm_file to b=
e
> > > > > > RCU-safe but maybe there are other cases which would benefit fr=
om
> > > > > > this?
> > > > >
> > > > > To this, I can only give an unqualified "I don't know".  :-(
> > > > >
> > > > > But if there is some condition that can be sampled on a per-file-=
structure
> > > > > basis, you could use that to invoke cond_synchronize_rcu() only w=
hen
> > > > > needed.  Or send only those file structures that need the extra d=
elay
> > > > > through queue_rcu_work(), perhaps by accumulating a list of them.
> > > >
> > > > Thanks Paul! You gave me enough food for thought. Let me see if I c=
an
> > > > come up with something usable.
> > >
> > > Do we have the same problem with the task_work_add() path in fput()?
> >
> > Yes, I think so. It's called with TWA_RESUME, so the file will be
> > freed when the task returns to user mode, but that again does not
> > guarantee that RCU grace period is over.
>
> That one is going to be annoying, as there doesn't seem to be a nice plac=
e
> to hide grace-period latency.  The fget() function and friends want an
> FD, so I am not seeing an obvious way of grabbing an explicit reference.

Yeah, the more I'm thinking about this, the more I'm leaning towards
simply write-locking the VMA to stabilize it for the duration of
outputting its data. This would make the code much simpler, we don't
need to make any VMA members RCU-safe, we don't need to take a VMA
snapshot, we don't introduce any regressions in potentially more
important areas and it solves the problem we want to solve. The
problem is: /proc/pid/maps reader blocking a more important writer.
With the VMA locking approach, the only time this can happen is if the
writer tries to modify a VMA while we are printing its information.
And even then it will be blocked only for a short duration because
once we are done printing that VMA's info, we unlock it. I think it's
worth at least trying. WDYT?

>
> Now the fget() code path is protected by RCU.  But maybe that does not
> apply in the case where the file is closed but still mapped?
>
>                                                         Thanx, Paul
>
> > > > Cheers,
> > > > Suren.
> > > >
> > > > >
> > > > >                                                         Thanx, Pa=
ul
> > > > >
> > > > > > > > >    fs/proc/task_mmu.c:143:45: sparse:     expected struct=
 file [noderef] __rcu **f
> > > > > > > > >    fs/proc/task_mmu.c:143:45: sparse:     got struct file=
 **
> > > > > > > > >    fs/proc/task_mmu.c: note: in included file (through in=
clude/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...=
):
> > > > > > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: contex=
t imbalance in 'get_vma_snapshot' - unexpected unlock
> > > > > > > > >    fs/proc/task_mmu.c:264:22: sparse: sparse: context imb=
alance in 'm_start' - different lock contexts for basic block
> > > > > > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: contex=
t imbalance in 'm_stop' - unexpected unlock
> > > > > > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: contex=
t imbalance in 'smaps_pte_range' - unexpected unlock
> > > > > > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: contex=
t imbalance in 'clear_refs_pte_range' - unexpected unlock
> > > > > > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: contex=
t imbalance in 'pagemap_pmd_range' - unexpected unlock
> > > > > > > > >    include/linux/rcupdate.h:781:9: sparse: sparse: contex=
t imbalance in 'pagemap_scan_pmd_entry' - unexpected unlock
> > > > > > > > >    fs/proc/task_mmu.c: note: in included file (through ar=
ch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/=
task.h, ...):
> > > > > > > > >    arch/x86/include/asm/uaccess_64.h:88:24: sparse: spars=
e: cast removes address space '__user' of expression
> > > > > > > > >    arch/x86/include/asm/uaccess_64.h:88:24: sparse: spars=
e: cast removes address space '__user' of expression
> > > > > > > > >
> > > > > > > > > vim +143 fs/proc/task_mmu.c
> > > > > > > > >
> > > > > > > > >    132
> > > > > > > > >    133  /*
> > > > > > > > >    134   * Take VMA snapshot and pin vm_file and anon_nam=
e as they are used by
> > > > > > > > >    135   * show_map_vma.
> > > > > > > > >    136   */
> > > > > > > > >    137  static int get_vma_snapshot(struct proc_maps_priv=
ate *priv, struct vm_area_struct *vma)
> > > > > > > > >    138  {
> > > > > > > > >    139          struct vm_area_struct *copy =3D &priv->vm=
a_copy;
> > > > > > > > >    140          int ret =3D -EAGAIN;
> > > > > > > > >    141
> > > > > > > > >    142          memcpy(copy, vma, sizeof(*vma));
> > > > > > > > >  > 143          if (copy->vm_file && !get_file_rcu(&copy-=
>vm_file))
> > > > > > > > >    144                  goto out;
> > > > > > > > >    145
> > > > > > > > >    146          if (!anon_vma_name_get_if_valid(copy))
> > > > > > > > >    147                  goto put_file;
> > > > > > > > >    148
> > > > > > > > >    149          if (priv->mm_wr_seq =3D=3D mmap_write_seq=
_read(priv->mm))
> > > > > > > > >    150                  return 0;
> > > > > > > > >    151
> > > > > > > > >    152          /* Address space got modified, vma might =
be stale. Wait and retry. */
> > > > > > > > >    153          rcu_read_unlock();
> > > > > > > > >    154          ret =3D mmap_read_lock_killable(priv->mm)=
;
> > > > > > > > >    155          mmap_write_seq_record(priv->mm, &priv->mm=
_wr_seq);
> > > > > > > > >    156          mmap_read_unlock(priv->mm);
> > > > > > > > >    157          rcu_read_lock();
> > > > > > > > >    158
> > > > > > > > >    159          if (!ret)
> > > > > > > > >    160                  ret =3D -EAGAIN; /* no other erro=
rs, ok to retry */
> > > > > > > > >    161
> > > > > > > > >    162          anon_vma_name_put_if_valid(copy);
> > > > > > > > >    163  put_file:
> > > > > > > > >    164          if (copy->vm_file)
> > > > > > > > >    165                  fput(copy->vm_file);
> > > > > > > > >    166  out:
> > > > > > > > >    167          return ret;
> > > > > > > > >    168  }
> > > > > > > > >    169
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > 0-DAY CI Kernel Test Service
> > > > > > > > > https://github.com/intel/lkp-tests/wiki
