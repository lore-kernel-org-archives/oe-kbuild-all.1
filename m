Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9138E10A0C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Dec 2023 00:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfWqNjZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703982790; x=1735518790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/tnNkID4vDIAILZ1gXo7wmeeF/UFJJXPZvbntwR1XI=;
  b=HfWqNjZrBKLiOasjPMkwF5MH29NYoTXDJzQ1HONRDmyIheg6ofdrvx2Q
   kMbB1eFRHJuYn/OR+KmLAMSGV2RQt4kIRlU7PIZZBR/SaBfydj3yKiODp
   70DH+phqVUqtGCtK+qUiqPZ9KHqjp12sh67r1gZkchs0AF84n8vUrVKoA
   HYflEYp9aMgP62JEV7oWAlozGaZRrzqBcTubi2zWbT6LXW8bjM+RupxcN
   hoGlNVfYis3Oe0L3jNd6Kigf3Ok+MTV4iQ1yFzyubjBoF5NI8if6SVYH+
   PYPh0lj2pV6EWbPnI633B9tFsrHv35sXxffCddC8jfgjxyuj9wrt7gIAm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="396463813"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="396463813"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 16:33:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="1026196487"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="1026196487"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Dec 2023 16:33:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJjlK-000IrX-0B;
	Sun, 31 Dec 2023 00:33:06 +0000
Date: Sun, 31 Dec 2023 08:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5482/10295]
 arch/riscv/kvm/../../../virt/kvm/eventfd.c:335:19: error: implicit
 declaration of function 'eventfd_ctx_fileget'; did you mean
 'eventfd_ctx_fdget'?
Message-ID: <202312310811.Vhbahqnt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 8132d887a7023b212f242a51ae89281c69fde996 [5482/10295] KVM: remove CONFIG_HAVE_KVM_EVENTFD
config: riscv-randconfig-001-20231231 (https://download.01.org/0day-ci/archive/20231231/202312310811.Vhbahqnt-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231231/202312310811.Vhbahqnt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312310811.Vhbahqnt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/riscv/kvm/../../../virt/kvm/eventfd.c: In function 'kvm_irqfd_assign':
>> arch/riscv/kvm/../../../virt/kvm/eventfd.c:335:19: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Werror=implicit-function-declaration]
     335 |         eventfd = eventfd_ctx_fileget(f.file);
         |                   ^~~~~~~~~~~~~~~~~~~
         |                   eventfd_ctx_fdget
>> arch/riscv/kvm/../../../virt/kvm/eventfd.c:335:17: warning: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     335 |         eventfd = eventfd_ctx_fileget(f.file);
         |                 ^
   cc1: some warnings being treated as errors


vim +335 arch/riscv/kvm/../../../virt/kvm/eventfd.c

1a02b27035f820 Eric Auger            2015-09-18  301  
721eecbf4fe995 Gregory Haskins       2009-05-20  302  static int
d4db2935e4fffe Alex Williamson       2012-06-29  303  kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
721eecbf4fe995 Gregory Haskins       2009-05-20  304  {
166c9775f1f8b8 Eric Auger            2015-09-18  305  	struct kvm_kernel_irqfd *irqfd, *tmp;
cffe78d92c217a Al Viro               2013-08-30  306  	struct fd f;
7a84428af7ca6a Alex Williamson       2012-09-21  307  	struct eventfd_ctx *eventfd = NULL, *resamplefd = NULL;
721eecbf4fe995 Gregory Haskins       2009-05-20  308  	int ret;
e6c8adca20ba45 Al Viro               2017-07-03  309  	__poll_t events;
9957c86d659a4d Paul Mackerras        2014-06-30  310  	int idx;
721eecbf4fe995 Gregory Haskins       2009-05-20  311  
01c94e64f5a6f2 Eric Auger            2015-03-04  312  	if (!kvm_arch_intc_initialized(kvm))
01c94e64f5a6f2 Eric Auger            2015-03-04  313  		return -EAGAIN;
01c94e64f5a6f2 Eric Auger            2015-03-04  314  
654f1f13ea56b9 Peter Xu              2019-05-05  315  	if (!kvm_arch_irqfd_allowed(kvm, args))
654f1f13ea56b9 Peter Xu              2019-05-05  316  		return -EINVAL;
654f1f13ea56b9 Peter Xu              2019-05-05  317  
b12ce36a43f29d Ben Gardon            2019-02-11  318  	irqfd = kzalloc(sizeof(*irqfd), GFP_KERNEL_ACCOUNT);
721eecbf4fe995 Gregory Haskins       2009-05-20  319  	if (!irqfd)
721eecbf4fe995 Gregory Haskins       2009-05-20  320  		return -ENOMEM;
721eecbf4fe995 Gregory Haskins       2009-05-20  321  
721eecbf4fe995 Gregory Haskins       2009-05-20  322  	irqfd->kvm = kvm;
d4db2935e4fffe Alex Williamson       2012-06-29  323  	irqfd->gsi = args->gsi;
721eecbf4fe995 Gregory Haskins       2009-05-20  324  	INIT_LIST_HEAD(&irqfd->list);
721eecbf4fe995 Gregory Haskins       2009-05-20  325  	INIT_WORK(&irqfd->inject, irqfd_inject);
721eecbf4fe995 Gregory Haskins       2009-05-20  326  	INIT_WORK(&irqfd->shutdown, irqfd_shutdown);
5c73b9a2b1b4ec Ahmed S. Darwish      2020-07-20  327  	seqcount_spinlock_init(&irqfd->irq_entry_sc, &kvm->irqfds.lock);
721eecbf4fe995 Gregory Haskins       2009-05-20  328  
cffe78d92c217a Al Viro               2013-08-30  329  	f = fdget(args->fd);
cffe78d92c217a Al Viro               2013-08-30  330  	if (!f.file) {
cffe78d92c217a Al Viro               2013-08-30  331  		ret = -EBADF;
cffe78d92c217a Al Viro               2013-08-30  332  		goto out;
721eecbf4fe995 Gregory Haskins       2009-05-20  333  	}
721eecbf4fe995 Gregory Haskins       2009-05-20  334  
cffe78d92c217a Al Viro               2013-08-30 @335  	eventfd = eventfd_ctx_fileget(f.file);
721eecbf4fe995 Gregory Haskins       2009-05-20  336  	if (IS_ERR(eventfd)) {
721eecbf4fe995 Gregory Haskins       2009-05-20  337  		ret = PTR_ERR(eventfd);
721eecbf4fe995 Gregory Haskins       2009-05-20  338  		goto fail;
721eecbf4fe995 Gregory Haskins       2009-05-20  339  	}
721eecbf4fe995 Gregory Haskins       2009-05-20  340  
721eecbf4fe995 Gregory Haskins       2009-05-20  341  	irqfd->eventfd = eventfd;
721eecbf4fe995 Gregory Haskins       2009-05-20  342  
7a84428af7ca6a Alex Williamson       2012-09-21  343  	if (args->flags & KVM_IRQFD_FLAG_RESAMPLE) {
166c9775f1f8b8 Eric Auger            2015-09-18  344  		struct kvm_kernel_irqfd_resampler *resampler;
7a84428af7ca6a Alex Williamson       2012-09-21  345  
7a84428af7ca6a Alex Williamson       2012-09-21  346  		resamplefd = eventfd_ctx_fdget(args->resamplefd);
7a84428af7ca6a Alex Williamson       2012-09-21  347  		if (IS_ERR(resamplefd)) {
7a84428af7ca6a Alex Williamson       2012-09-21  348  			ret = PTR_ERR(resamplefd);
7a84428af7ca6a Alex Williamson       2012-09-21  349  			goto fail;
7a84428af7ca6a Alex Williamson       2012-09-21  350  		}
7a84428af7ca6a Alex Williamson       2012-09-21  351  
7a84428af7ca6a Alex Williamson       2012-09-21  352  		irqfd->resamplefd = resamplefd;
7a84428af7ca6a Alex Williamson       2012-09-21  353  		INIT_LIST_HEAD(&irqfd->resampler_link);
7a84428af7ca6a Alex Williamson       2012-09-21  354  
7a84428af7ca6a Alex Williamson       2012-09-21  355  		mutex_lock(&kvm->irqfds.resampler_lock);
7a84428af7ca6a Alex Williamson       2012-09-21  356  
7a84428af7ca6a Alex Williamson       2012-09-21  357  		list_for_each_entry(resampler,
49f8a1a5394d8b Alex Williamson       2012-12-06  358  				    &kvm->irqfds.resampler_list, link) {
7a84428af7ca6a Alex Williamson       2012-09-21  359  			if (resampler->notifier.gsi == irqfd->gsi) {
7a84428af7ca6a Alex Williamson       2012-09-21  360  				irqfd->resampler = resampler;
7a84428af7ca6a Alex Williamson       2012-09-21  361  				break;
7a84428af7ca6a Alex Williamson       2012-09-21  362  			}
7a84428af7ca6a Alex Williamson       2012-09-21  363  		}
7a84428af7ca6a Alex Williamson       2012-09-21  364  
7a84428af7ca6a Alex Williamson       2012-09-21  365  		if (!irqfd->resampler) {
b12ce36a43f29d Ben Gardon            2019-02-11  366  			resampler = kzalloc(sizeof(*resampler),
b12ce36a43f29d Ben Gardon            2019-02-11  367  					    GFP_KERNEL_ACCOUNT);
7a84428af7ca6a Alex Williamson       2012-09-21  368  			if (!resampler) {
7a84428af7ca6a Alex Williamson       2012-09-21  369  				ret = -ENOMEM;
7a84428af7ca6a Alex Williamson       2012-09-21  370  				mutex_unlock(&kvm->irqfds.resampler_lock);
7a84428af7ca6a Alex Williamson       2012-09-21  371  				goto fail;
7a84428af7ca6a Alex Williamson       2012-09-21  372  			}
7a84428af7ca6a Alex Williamson       2012-09-21  373  
7a84428af7ca6a Alex Williamson       2012-09-21  374  			resampler->kvm = kvm;
7a84428af7ca6a Alex Williamson       2012-09-21  375  			INIT_LIST_HEAD(&resampler->list);
7a84428af7ca6a Alex Williamson       2012-09-21  376  			resampler->notifier.gsi = irqfd->gsi;
7a84428af7ca6a Alex Williamson       2012-09-21  377  			resampler->notifier.irq_acked = irqfd_resampler_ack;
7a84428af7ca6a Alex Williamson       2012-09-21  378  			INIT_LIST_HEAD(&resampler->link);
7a84428af7ca6a Alex Williamson       2012-09-21  379  
d583fbd7066a2d Dmytro Maluka         2023-03-22  380  			list_add_rcu(&resampler->link, &kvm->irqfds.resampler_list);
7a84428af7ca6a Alex Williamson       2012-09-21  381  			kvm_register_irq_ack_notifier(kvm,
7a84428af7ca6a Alex Williamson       2012-09-21  382  						      &resampler->notifier);
7a84428af7ca6a Alex Williamson       2012-09-21  383  			irqfd->resampler = resampler;
7a84428af7ca6a Alex Williamson       2012-09-21  384  		}
7a84428af7ca6a Alex Williamson       2012-09-21  385  
7a84428af7ca6a Alex Williamson       2012-09-21  386  		list_add_rcu(&irqfd->resampler_link, &irqfd->resampler->list);
719d93cd5f5c5c Christian Borntraeger 2014-01-16  387  		synchronize_srcu(&kvm->irq_srcu);
7a84428af7ca6a Alex Williamson       2012-09-21  388  
7a84428af7ca6a Alex Williamson       2012-09-21  389  		mutex_unlock(&kvm->irqfds.resampler_lock);
7a84428af7ca6a Alex Williamson       2012-09-21  390  	}
7a84428af7ca6a Alex Williamson       2012-09-21  391  
721eecbf4fe995 Gregory Haskins       2009-05-20  392  	/*
721eecbf4fe995 Gregory Haskins       2009-05-20  393  	 * Install our own custom wake-up handling so we are notified via
721eecbf4fe995 Gregory Haskins       2009-05-20  394  	 * a callback whenever someone signals the underlying eventfd
721eecbf4fe995 Gregory Haskins       2009-05-20  395  	 */
721eecbf4fe995 Gregory Haskins       2009-05-20  396  	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
721eecbf4fe995 Gregory Haskins       2009-05-20  397  	init_poll_funcptr(&irqfd->pt, irqfd_ptable_queue_proc);
721eecbf4fe995 Gregory Haskins       2009-05-20  398  
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  399  	spin_lock_irq(&kvm->irqfds.lock);
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  400  
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  401  	ret = 0;
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  402  	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  403  		if (irqfd->eventfd != tmp->eventfd)
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  404  			continue;
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  405  		/* This fd is used for another irq already. */
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  406  		ret = -EBUSY;
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  407  		spin_unlock_irq(&kvm->irqfds.lock);
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  408  		goto fail;
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  409  	}
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  410  
9957c86d659a4d Paul Mackerras        2014-06-30  411  	idx = srcu_read_lock(&kvm->irq_srcu);
9957c86d659a4d Paul Mackerras        2014-06-30  412  	irqfd_update(kvm, irqfd);
bd2b53b20fcd0d Michael S. Tsirkin    2010-11-18  413  
721eecbf4fe995 Gregory Haskins       2009-05-20  414  	list_add_tail(&irqfd->list, &kvm->irqfds.items);
721eecbf4fe995 Gregory Haskins       2009-05-20  415  
684a0b719ddbba Cornelia Huck         2014-03-17  416  	spin_unlock_irq(&kvm->irqfds.lock);
684a0b719ddbba Cornelia Huck         2014-03-17  417  
721eecbf4fe995 Gregory Haskins       2009-05-20  418  	/*
721eecbf4fe995 Gregory Haskins       2009-05-20  419  	 * Check if there was an event already pending on the eventfd
721eecbf4fe995 Gregory Haskins       2009-05-20  420  	 * before we registered, and trigger it as if we didn't miss it.
721eecbf4fe995 Gregory Haskins       2009-05-20  421  	 */
9965ed174e7d38 Christoph Hellwig     2018-03-05  422  	events = vfs_poll(f.file, &irqfd->pt);
684a0b719ddbba Cornelia Huck         2014-03-17  423  
a9a08845e9acbd Linus Torvalds        2018-02-11  424  	if (events & EPOLLIN)
721eecbf4fe995 Gregory Haskins       2009-05-20  425  		schedule_work(&irqfd->inject);
721eecbf4fe995 Gregory Haskins       2009-05-20  426  

:::::: The code at line 335 was first introduced by commit
:::::: cffe78d92c217a57f57ec6743f71adfe39ea543e kvm eventfd: switch to fdget

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
