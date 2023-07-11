Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C631DDFD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 23:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689117028; x=1720653028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/tg9SVWwsK/m25W5wKadnd9Bp6Ug6c47oQ8fA91riUU=;
  b=n7ZQRWuel8xuC7gnRxqpBbLouJ4XQ9qSuG6zo9oybFmXALRDvYAAGSIh
   hTkiYbpiZdPSBtkMteBkJMoYAQOejWKLIF3tRA2GlIHgyrbOKpHsEeEp2
   WpUMydBtpq/aIZXwQjNx+2k6XgyN3ZF6RRQoe6a1UV0cGAkxO4Vlbdz01
   JP/HPKsVlAuw0LFKo5J1COMbhU1cPJmZeMAKlGq3Y6eTPlQzaa6Ip5OXC
   I0TOWNosSVTMrLIcTtjAT2P0b6vpcN7r3v0R5EnamIt8lB9VyskNpbZmu
   B0EFqJBVtemDro9qh+JhA30dQfn96joBYJ2eVcPoFe+9Zv1UCsQiw7NwE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344357765"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="344357765"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 16:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="724657223"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="724657223"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jul 2023 16:10:25 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJMUy-0005Az-1z;
	Tue, 11 Jul 2023 23:10:24 +0000
Date: Wed, 12 Jul 2023 07:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Eugene Loh <eugene.loh@oracle.com>,
	David Mc Lean <david.mclean@oracle.com>,
	Vincent Lim <vincent.lim@oracle.com>
Subject: [oracle-dtrace:v2/6.4 10/13] drivers/virt/acrn/irqfd.c:146:39:
 error: passing argument 2 of 'init_poll_funcptr' from incompatible pointer
 type
Message-ID: <202307120710.24AWdH40-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.4
head:   9b6d57638acaddc5e1016dbcfea27771df400611
commit: 19ce4a9705869b25a970a68669e8837cf78b1ead [10/13] waitfd: new syscall implementing waitpid() over fds
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230712/202307120710.24AWdH40-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120710.24AWdH40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120710.24AWdH40-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virt/acrn/irqfd.c: In function 'acrn_irqfd_assign':
>> drivers/virt/acrn/irqfd.c:146:39: error: passing argument 2 of 'init_poll_funcptr' from incompatible pointer type [-Werror=incompatible-pointer-types]
     146 |         init_poll_funcptr(&irqfd->pt, hsm_irqfd_poll_func);
         |                                       ^~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       void (*)(struct file *, wait_queue_head_t *, poll_table *) {aka void (*)(struct file *, struct wait_queue_head *, struct poll_table_struct *)}
   In file included from drivers/virt/acrn/irqfd.c:14:
   include/linux/poll.h:82:70: note: expected 'poll_queue_proc' {aka 'void (*)(struct file *, struct wait_queue_head *, struct poll_table_struct *, long unsigned int)'} but argument is of type 'void (*)(struct file *, wait_queue_head_t *, poll_table *)' {aka 'void (*)(struct file *, struct wait_queue_head *, struct poll_table_struct *)'}
      82 | static inline void init_poll_funcptr(poll_table *pt, poll_queue_proc qproc)
         |                                                      ~~~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +/init_poll_funcptr +146 drivers/virt/acrn/irqfd.c

aa3b483ff1d71c Shuo Liu    2021-02-07  104  
aa3b483ff1d71c Shuo Liu    2021-02-07  105  /*
aa3b483ff1d71c Shuo Liu    2021-02-07  106   * Assign an eventfd to a VM and create a HSM irqfd associated with the
aa3b483ff1d71c Shuo Liu    2021-02-07  107   * eventfd. The properties of the HSM irqfd are built from a &struct
aa3b483ff1d71c Shuo Liu    2021-02-07  108   * acrn_irqfd.
aa3b483ff1d71c Shuo Liu    2021-02-07  109   */
aa3b483ff1d71c Shuo Liu    2021-02-07  110  static int acrn_irqfd_assign(struct acrn_vm *vm, struct acrn_irqfd *args)
aa3b483ff1d71c Shuo Liu    2021-02-07  111  {
aa3b483ff1d71c Shuo Liu    2021-02-07  112  	struct eventfd_ctx *eventfd = NULL;
aa3b483ff1d71c Shuo Liu    2021-02-07  113  	struct hsm_irqfd *irqfd, *tmp;
dcf9625f2adf33 Yejune Deng 2021-02-21  114  	__poll_t events;
aa3b483ff1d71c Shuo Liu    2021-02-07  115  	struct fd f;
aa3b483ff1d71c Shuo Liu    2021-02-07  116  	int ret = 0;
aa3b483ff1d71c Shuo Liu    2021-02-07  117  
aa3b483ff1d71c Shuo Liu    2021-02-07  118  	irqfd = kzalloc(sizeof(*irqfd), GFP_KERNEL);
aa3b483ff1d71c Shuo Liu    2021-02-07  119  	if (!irqfd)
aa3b483ff1d71c Shuo Liu    2021-02-07  120  		return -ENOMEM;
aa3b483ff1d71c Shuo Liu    2021-02-07  121  
aa3b483ff1d71c Shuo Liu    2021-02-07  122  	irqfd->vm = vm;
aa3b483ff1d71c Shuo Liu    2021-02-07  123  	memcpy(&irqfd->msi, &args->msi, sizeof(args->msi));
aa3b483ff1d71c Shuo Liu    2021-02-07  124  	INIT_LIST_HEAD(&irqfd->list);
aa3b483ff1d71c Shuo Liu    2021-02-07  125  	INIT_WORK(&irqfd->shutdown, hsm_irqfd_shutdown_work);
aa3b483ff1d71c Shuo Liu    2021-02-07  126  
aa3b483ff1d71c Shuo Liu    2021-02-07  127  	f = fdget(args->fd);
aa3b483ff1d71c Shuo Liu    2021-02-07  128  	if (!f.file) {
aa3b483ff1d71c Shuo Liu    2021-02-07  129  		ret = -EBADF;
aa3b483ff1d71c Shuo Liu    2021-02-07  130  		goto out;
aa3b483ff1d71c Shuo Liu    2021-02-07  131  	}
aa3b483ff1d71c Shuo Liu    2021-02-07  132  
aa3b483ff1d71c Shuo Liu    2021-02-07  133  	eventfd = eventfd_ctx_fileget(f.file);
aa3b483ff1d71c Shuo Liu    2021-02-07  134  	if (IS_ERR(eventfd)) {
aa3b483ff1d71c Shuo Liu    2021-02-07  135  		ret = PTR_ERR(eventfd);
aa3b483ff1d71c Shuo Liu    2021-02-07  136  		goto fail;
aa3b483ff1d71c Shuo Liu    2021-02-07  137  	}
aa3b483ff1d71c Shuo Liu    2021-02-07  138  
aa3b483ff1d71c Shuo Liu    2021-02-07  139  	irqfd->eventfd = eventfd;
aa3b483ff1d71c Shuo Liu    2021-02-07  140  
aa3b483ff1d71c Shuo Liu    2021-02-07  141  	/*
aa3b483ff1d71c Shuo Liu    2021-02-07  142  	 * Install custom wake-up handling to be notified whenever underlying
aa3b483ff1d71c Shuo Liu    2021-02-07  143  	 * eventfd is signaled.
aa3b483ff1d71c Shuo Liu    2021-02-07  144  	 */
aa3b483ff1d71c Shuo Liu    2021-02-07  145  	init_waitqueue_func_entry(&irqfd->wait, hsm_irqfd_wakeup);
aa3b483ff1d71c Shuo Liu    2021-02-07 @146  	init_poll_funcptr(&irqfd->pt, hsm_irqfd_poll_func);
aa3b483ff1d71c Shuo Liu    2021-02-07  147  
aa3b483ff1d71c Shuo Liu    2021-02-07  148  	mutex_lock(&vm->irqfds_lock);
aa3b483ff1d71c Shuo Liu    2021-02-07  149  	list_for_each_entry(tmp, &vm->irqfds, list) {
aa3b483ff1d71c Shuo Liu    2021-02-07  150  		if (irqfd->eventfd != tmp->eventfd)
aa3b483ff1d71c Shuo Liu    2021-02-07  151  			continue;
aa3b483ff1d71c Shuo Liu    2021-02-07  152  		ret = -EBUSY;
aa3b483ff1d71c Shuo Liu    2021-02-07  153  		mutex_unlock(&vm->irqfds_lock);
aa3b483ff1d71c Shuo Liu    2021-02-07  154  		goto fail;
aa3b483ff1d71c Shuo Liu    2021-02-07  155  	}
aa3b483ff1d71c Shuo Liu    2021-02-07  156  	list_add_tail(&irqfd->list, &vm->irqfds);
aa3b483ff1d71c Shuo Liu    2021-02-07  157  	mutex_unlock(&vm->irqfds_lock);
aa3b483ff1d71c Shuo Liu    2021-02-07  158  
aa3b483ff1d71c Shuo Liu    2021-02-07  159  	/* Check the pending event in this stage */
dcf9625f2adf33 Yejune Deng 2021-02-21  160  	events = vfs_poll(f.file, &irqfd->pt);
aa3b483ff1d71c Shuo Liu    2021-02-07  161  
a758b7c4c6f21f Yejune Deng 2021-03-10  162  	if (events & EPOLLIN)
aa3b483ff1d71c Shuo Liu    2021-02-07  163  		acrn_irqfd_inject(irqfd);
aa3b483ff1d71c Shuo Liu    2021-02-07  164  
aa3b483ff1d71c Shuo Liu    2021-02-07  165  	fdput(f);
aa3b483ff1d71c Shuo Liu    2021-02-07  166  	return 0;
aa3b483ff1d71c Shuo Liu    2021-02-07  167  fail:
aa3b483ff1d71c Shuo Liu    2021-02-07  168  	if (eventfd && !IS_ERR(eventfd))
aa3b483ff1d71c Shuo Liu    2021-02-07  169  		eventfd_ctx_put(eventfd);
aa3b483ff1d71c Shuo Liu    2021-02-07  170  
aa3b483ff1d71c Shuo Liu    2021-02-07  171  	fdput(f);
aa3b483ff1d71c Shuo Liu    2021-02-07  172  out:
aa3b483ff1d71c Shuo Liu    2021-02-07  173  	kfree(irqfd);
aa3b483ff1d71c Shuo Liu    2021-02-07  174  	return ret;
aa3b483ff1d71c Shuo Liu    2021-02-07  175  }
aa3b483ff1d71c Shuo Liu    2021-02-07  176  

:::::: The code at line 146 was first introduced by commit
:::::: aa3b483ff1d71c50b33db154048dff9a8f08ac71 virt: acrn: Introduce irqfd

:::::: TO: Shuo Liu <shuo.a.liu@intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
