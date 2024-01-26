Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455E24404
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 00:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706229337; cv=none; b=YHE8lYx5vNXhniP1zAmpYRpVngnIGMkly7BVQ+QY8CQcdG2oLAqmf1akRWaFiPTNMaS16gVhKNMYgoCLdZZmQVfgbZXfcGBqLQIhtxccg/XDWmk+J+BUQrfLEYTNcOXzktQkpe13HB3gx3jvYRD2HMvEz2a1LwaOJk5HU7CxYGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706229337; c=relaxed/simple;
	bh=aiwzMlQcwKusi2WD5mp/I9f4iHR1B+oJpqL8BoebmQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GT834bgwdvBhA71HO3iguhm5tRaWdxJluRXGE77GsHrepJhDYqrHvdvTJMYcGpRzUb/apVMrKjO+r7p+K1RUom7w/AGVj4zsbowLj407XHiHAqSqaZl33rbm7JERULjFD67rnPVCOQYtM2L5RCoarNhZCcjRDZWE8eaLtrMus5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5yN7LCd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5yN7LCd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDF2C433F1;
	Fri, 26 Jan 2024 00:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706229336;
	bh=aiwzMlQcwKusi2WD5mp/I9f4iHR1B+oJpqL8BoebmQ8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=R5yN7LCdE6du4H1Lv+od9LQxc2y/qNm/Xk1SF1yM0M/fo/STgxQ7qNJhirectSr5Q
	 PEp38quC/2Ufabd8xTE4J7bTrIf5oL9E5RRanPI3aoLQ7yqrFCjrZo0wo8QTdyEQaz
	 g7b/QXMaRNPeKvE8hWPqbcztAjpH79i7r4dLcJNeeCZ1YyU7gJWhfoc6ab/bFkzxGr
	 zfzPbm5f7lgsgKmFp+uQ+WITPIRFvmVgb668yAM+jlWQOPxB1MbELzhWAk5i1xVyJO
	 SqehbQAtHdkt7Ib5Cztdcm+ESwaTC7/T4HZCaGTt48o0VE/5W4/M10jLPAbLw8aNaZ
	 VumfjyTPiISPg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5F702CE1473; Thu, 25 Jan 2024 16:35:36 -0800 (PST)
Date: Thu, 25 Jan 2024 16:35:36 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: kernel test robot <lkp@intel.com>, Matthew Wilcox <willy@infradead.org>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 1589/1892] fs/proc/task_mmu.c:143:45: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <ca479a8e-a8f5-48d7-96f9-27692091d2e9@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202401251829.0m6Eo4LI-lkp@intel.com>
 <CAJuCfpHW2=Zu+CHXL+5fjWxGk=CVix=C66ra+DmXgn6r3+fsXg@mail.gmail.com>
 <b82c9479-9331-4b31-9fca-3fa963901fe9@paulmck-laptop>
 <CAJuCfpGA7ScozuAL71idCRbfgxPaz+zY5jEYZ-FQmikQfXrD5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpGA7ScozuAL71idCRbfgxPaz+zY5jEYZ-FQmikQfXrD5A@mail.gmail.com>

On Thu, Jan 25, 2024 at 03:17:17PM -0800, Suren Baghdasaryan wrote:
> On Thu, Jan 25, 2024 at 2:44 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Thu, Jan 25, 2024 at 01:27:34PM -0800, Suren Baghdasaryan wrote:
> > > On Thu, Jan 25, 2024 at 2:23 AM kernel test robot <lkp@intel.com> wrote:
> > > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > head:   01af33cc9894b4489fb68fa35c40e9fe85df63dc
> > > > commit: 0c30c4cd953025979b7689e49844837f762303ec [1589/1892] mm/maps: read proc/pid/maps under RCU
> > > > config: x86_64-randconfig-121-20240125 (https://download.01.org/0day-ci/archive/20240125/202401251829.0m6Eo4LI-lkp@intel.com/config)
> > > > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251829.0m6Eo4LI-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202401251829.0m6Eo4LI-lkp@intel.com/
> > > >
> > > > sparse warnings: (new ones prefixed by >>)
> > > > >> fs/proc/task_mmu.c:143:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file ** @@
> > >
> > > Uh, this is a problem.
> > > I missed that get_file_rcu() is used only with mm->exe_file and
> > > vma->vm_file is not really RCU-safe. It's freed via a call to fput()
> > > which schedules its freeing using schedule_delayed_work(..., 1) but I
> > > don't think that constitutes RCU grace period. Paul, Matthew, could
> > > you please confirm? In the meantime I'm going to ask Andrew to remove
> > > my patchset from mm-unstable to be safe.
> >
> > Sadly, no, schedule_delayed_work() does not imply an RCU grace period.
> >
> > There is a queue_rcu_work() that schedules work after a grace period,
> > which could be combined with a timer to get the delay.
> >
> > Another approach would be to use get_state_synchronize_rcu() before
> > the schedule_delayed_work() in fput(), then do cond_synchronize_rcu()
> > in delayed_fput().  This would require adding an unsigned long to
> > struct file to keep track of which grace period a given struct file
> > needed to wait for.
> >
> > Perhaps something like this:
> >
> > ------------------------------------------------------------------------
> >
> > void fput(struct file *file)
> > {
> >         if (atomic_long_dec_and_test(&file->f_count)) {
> >                 struct task_struct *task = current;
> >
> >                 if (likely(!in_interrupt() && !(task->flags & PF_KTHREAD))) {
> >                         init_task_work(&file->f_rcuhead, ____fput);
> >                         if (!task_work_add(task, &file->f_rcuhead, TWA_RESUME))
> >                                 return;
> >                         /*
> >                          * After this task has run exit_task_work(),
> >                          * task_work_add() will fail.  Fall through to delayed
> >                          * fput to avoid leaking *file.
> >                          */
> >                 }
> >
> >                 file->f_rcu_seq = get_state_synchronize_rcu();
> >                 if (llist_add(&file->f_llist, &delayed_fput_list))
> >                         schedule_delayed_work(&delayed_fput_work, 1);
> >         }
> > }
> >
> > ------------------------------------------------------------------------
> >
> > And this:
> >
> > ------------------------------------------------------------------------
> >
> > static void delayed_fput(struct work_struct *unused)
> > {
> >         struct llist_node *node = llist_del_all(&delayed_fput_list);
> >         struct file *f, *t;
> >
> >         llist_for_each_entry_safe(f, t, node, f_llist) {
> >                 cond_synchronize_rcu(f->f_rcu_seq);
> >                 __fput(f);
> >         }
> > }
> >
> > ------------------------------------------------------------------------
> >
> > Note that if you called fput() on a long sequence of struct file
> > structures, the cond_synchronize_rcu() would be a near-noop almost all the
> > time, actually blocking at most about every once per every few jiffies.
> > After all, once a grace period has been waited for, it covers all of
> > the struct file structures that were passed to fput() during a given
> > RCU grace period.
> >
> > Still, it would add the occasional delay.  And it would increase the
> > size of struct file, though there are workarounds for that, if size
> > is an issue.
> >
> > Thoughts?
> 
> Thanks for the suggestion, Paul. I'm worried about this occasional
> delay but otherwise this seems like a nice and simple approach.

One potential saving grace is that the more heavily loaded the mechanism,
the smaller a fraction of the cond_synchronize_rcu() calls will do
a delay.

>                                                                 Do you
> guys think that making *all* files RCU-safe with this approach is
> warranted? For my particular case I need only vma->vm_file to be
> RCU-safe but maybe there are other cases which would benefit from
> this?

To this, I can only give an unqualified "I don't know".  :-(

But if there is some condition that can be sampled on a per-file-structure
basis, you could use that to invoke cond_synchronize_rcu() only when
needed.  Or send only those file structures that need the extra delay
through queue_rcu_work(), perhaps by accumulating a list of them.

                                                        Thanx, Paul

> > > >    fs/proc/task_mmu.c:143:45: sparse:     expected struct file [noderef] __rcu **f
> > > >    fs/proc/task_mmu.c:143:45: sparse:     got struct file **
> > > >    fs/proc/task_mmu.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
> > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'get_vma_snapshot' - unexpected unlock
> > > >    fs/proc/task_mmu.c:264:22: sparse: sparse: context imbalance in 'm_start' - different lock contexts for basic block
> > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'm_stop' - unexpected unlock
> > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'smaps_pte_range' - unexpected unlock
> > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'clear_refs_pte_range' - unexpected unlock
> > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'pagemap_pmd_range' - unexpected unlock
> > > >    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'pagemap_scan_pmd_entry' - unexpected unlock
> > > >    fs/proc/task_mmu.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
> > > >    arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
> > > >    arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
> > > >
> > > > vim +143 fs/proc/task_mmu.c
> > > >
> > > >    132
> > > >    133  /*
> > > >    134   * Take VMA snapshot and pin vm_file and anon_name as they are used by
> > > >    135   * show_map_vma.
> > > >    136   */
> > > >    137  static int get_vma_snapshot(struct proc_maps_private *priv, struct vm_area_struct *vma)
> > > >    138  {
> > > >    139          struct vm_area_struct *copy = &priv->vma_copy;
> > > >    140          int ret = -EAGAIN;
> > > >    141
> > > >    142          memcpy(copy, vma, sizeof(*vma));
> > > >  > 143          if (copy->vm_file && !get_file_rcu(&copy->vm_file))
> > > >    144                  goto out;
> > > >    145
> > > >    146          if (!anon_vma_name_get_if_valid(copy))
> > > >    147                  goto put_file;
> > > >    148
> > > >    149          if (priv->mm_wr_seq == mmap_write_seq_read(priv->mm))
> > > >    150                  return 0;
> > > >    151
> > > >    152          /* Address space got modified, vma might be stale. Wait and retry. */
> > > >    153          rcu_read_unlock();
> > > >    154          ret = mmap_read_lock_killable(priv->mm);
> > > >    155          mmap_write_seq_record(priv->mm, &priv->mm_wr_seq);
> > > >    156          mmap_read_unlock(priv->mm);
> > > >    157          rcu_read_lock();
> > > >    158
> > > >    159          if (!ret)
> > > >    160                  ret = -EAGAIN; /* no other errors, ok to retry */
> > > >    161
> > > >    162          anon_vma_name_put_if_valid(copy);
> > > >    163  put_file:
> > > >    164          if (copy->vm_file)
> > > >    165                  fput(copy->vm_file);
> > > >    166  out:
> > > >    167          return ret;
> > > >    168  }
> > > >    169
> > > >
> > > > --
> > > > 0-DAY CI Kernel Test Service
> > > > https://github.com/intel/lkp-tests/wiki
