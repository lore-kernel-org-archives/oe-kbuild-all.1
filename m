Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E009B1117
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 00:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685580290; x=1717116290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zU4dAr5X2PCUsB7Ee8lhXzcFs6ImAchjFQFJHrVYDdE=;
  b=CcpWL8lxlQOsDWZi4BSm4Nh43GnvcKr66dQLLL/SNPkU6J7a53Qxc5ub
   j8N+ZlFs6L79YUpI261Af/XAjvmUhaoLkBiLsm6fyYqtoBiUhRoPzU1ou
   VkBW10aAjZarYq0/tv1f4mpOIrHllPRpIckwABnNaZkkStYRo4pjD03rn
   19wwB9HarFRQiWbNpNdk2RooR6tH249J4rMsIAxkZ3YlZdBMfiPg/7O+d
   tH/1FMnZwGLg8MuRJMzLBjWiU7xEs5FPwRZUjta1SXbE2LC59uPEXEqU5
   LwvvzpyGC5g79Z3R8AAOZj90IBvZyUolKETD7hzOhlU6hti04QEGyAqpa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="383676437"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="383676437"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 17:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="710273449"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="710273449"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 May 2023 17:44:46 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4WQn-0001in-2z;
	Thu, 01 Jun 2023 00:44:45 +0000
Date: Thu, 1 Jun 2023 08:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.19.y 7623/9999] drivers/pci/msi.c:175:42: error:
 'struct device' has no member named 'msi_lock'
Message-ID: <202306010832.aoPNj3I5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   a8b7a32a3427d592a38cb0ed9c33088d44c82840
commit: 3c9534778d4cc2bd01e20d4dcffc55df0962aa12 [7623/9999] PCI/MSI: Protect msi_desc::masked for multi-MSI
config: powerpc-randconfig-r032-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010832.aoPNj3I5-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=3c9534778d4cc2bd01e20d4dcffc55df0962aa12
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 3c9534778d4cc2bd01e20d4dcffc55df0962aa12
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010832.aoPNj3I5-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/msi.h:131:9: note: in expansion of macro 'for_each_msi_entry'
     131 |         for_each_msi_entry((desc), &(pdev)->dev)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pci/msi.c:142:17: note: in expansion of macro 'for_each_pci_msi_entry'
     142 |                 for_each_pci_msi_entry(entry, dev) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/msi.h:114:48: error: 'struct device' has no member named 'msi_list'
     114 | #define dev_to_msi_list(dev)            (&(dev)->msi_list)
         |                                                ^~
   include/linux/compiler.h:396:23: note: in definition of macro '__compiletime_assert'
     396 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:416:9: note: in expansion of macro '_compiletime_assert'
     416 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:998:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     998 |         BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:998:27: note: in expansion of macro '__same_type'
     998 |         BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
         |                           ^~~~~~~~~~~
   include/linux/list.h:396:9: note: in expansion of macro 'container_of'
     396 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:407:9: note: in expansion of macro 'list_entry'
     407 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:494:20: note: in expansion of macro 'list_first_entry'
     494 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/linux/msi.h:118:9: note: in expansion of macro 'list_for_each_entry'
     118 |         list_for_each_entry((desc), dev_to_msi_list((dev)), list)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/msi.h:118:37: note: in expansion of macro 'dev_to_msi_list'
     118 |         list_for_each_entry((desc), dev_to_msi_list((dev)), list)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/msi.h:131:9: note: in expansion of macro 'for_each_msi_entry'
     131 |         for_each_msi_entry((desc), &(pdev)->dev)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pci/msi.c:142:17: note: in expansion of macro 'for_each_pci_msi_entry'
     142 |                 for_each_pci_msi_entry(entry, dev) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/msi.h:114:48: error: 'struct device' has no member named 'msi_list'
     114 | #define dev_to_msi_list(dev)            (&(dev)->msi_list)
         |                                                ^~
   include/linux/compiler.h:396:23: note: in definition of macro '__compiletime_assert'
     396 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:416:9: note: in expansion of macro '_compiletime_assert'
     416 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:998:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     998 |         BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:999:27: note: in expansion of macro '__same_type'
     999 |                          !__same_type(*(ptr), void),                    \
         |                           ^~~~~~~~~~~
   include/linux/list.h:396:9: note: in expansion of macro 'container_of'
     396 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:407:9: note: in expansion of macro 'list_entry'
     407 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:494:20: note: in expansion of macro 'list_first_entry'
     494 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/linux/msi.h:118:9: note: in expansion of macro 'list_for_each_entry'
     118 |         list_for_each_entry((desc), dev_to_msi_list((dev)), list)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/msi.h:118:37: note: in expansion of macro 'dev_to_msi_list'
     118 |         list_for_each_entry((desc), dev_to_msi_list((dev)), list)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/msi.h:131:9: note: in expansion of macro 'for_each_msi_entry'
     131 |         for_each_msi_entry((desc), &(pdev)->dev)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pci/msi.c:142:17: note: in expansion of macro 'for_each_pci_msi_entry'
     142 |                 for_each_pci_msi_entry(entry, dev) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/msi.h:114:48: error: 'struct device' has no member named 'msi_list'
     114 | #define dev_to_msi_list(dev)            (&(dev)->msi_list)
         |                                                ^~
   include/linux/list.h:495:31: note: in definition of macro 'list_for_each_entry'
     495 |              &pos->member != (head);                                    \
         |                               ^~~~
   include/linux/msi.h:118:37: note: in expansion of macro 'dev_to_msi_list'
     118 |         list_for_each_entry((desc), dev_to_msi_list((dev)), list)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/msi.h:131:9: note: in expansion of macro 'for_each_msi_entry'
     131 |         for_each_msi_entry((desc), &(pdev)->dev)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pci/msi.c:142:17: note: in expansion of macro 'for_each_pci_msi_entry'
     142 |                 for_each_pci_msi_entry(entry, dev) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/msi.c: In function '__pci_msi_desc_mask_irq':
>> drivers/pci/msi.c:175:42: error: 'struct device' has no member named 'msi_lock'
     175 |         raw_spinlock_t *lock = &desc->dev->msi_lock;
         |                                          ^~
   drivers/pci/msi.c: In function 'default_restore_msi_irqs':
   include/linux/msi.h:114:48: error: 'struct device' has no member named 'msi_list'
     114 | #define dev_to_msi_list(dev)            (&(dev)->msi_list)
         |                                                ^~
   include/linux/kernel.h:997:33: note: in definition of macro 'container_of'
     997 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:407:9: note: in expansion of macro 'list_entry'
     407 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:494:20: note: in expansion of macro 'list_first_entry'
     494 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/linux/msi.h:118:9: note: in expansion of macro 'list_for_each_entry'
     118 |         list_for_each_entry((desc), dev_to_msi_list((dev)), list)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/msi.h:118:37: note: in expansion of macro 'dev_to_msi_list'
     118 |         list_for_each_entry((desc), dev_to_msi_list((dev)), list)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/msi.h:131:9: note: in expansion of macro 'for_each_msi_entry'
     131 |         for_each_msi_entry((desc), &(pdev)->dev)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pci/msi.c:264:9: note: in expansion of macro 'for_each_pci_msi_entry'
     264 |         for_each_pci_msi_entry(entry, dev)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/msi.h:114:48: error: 'struct device' has no member named 'msi_list'
     114 | #define dev_to_msi_list(dev)            (&(dev)->msi_list)
         |                                                ^~
   include/linux/compiler.h:396:23: note: in definition of macro '__compiletime_assert'
     396 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:416:9: note: in expansion of macro '_compiletime_assert'
     416 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:998:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     998 |         BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:998:27: note: in expansion of macro '__same_type'
     998 |         BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
         |                           ^~~~~~~~~~~
   include/linux/list.h:396:9: note: in expansion of macro 'container_of'
     396 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:407:9: note: in expansion of macro 'list_entry'
     407 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:494:20: note: in expansion of macro 'list_first_entry'
     494 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/linux/msi.h:118:9: note: in expansion of macro 'list_for_each_entry'
     118 |         list_for_each_entry((desc), dev_to_msi_list((dev)), list)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/msi.h:118:37: note: in expansion of macro 'dev_to_msi_list'
     118 |         list_for_each_entry((desc), dev_to_msi_list((dev)), list)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/msi.h:131:9: note: in expansion of macro 'for_each_msi_entry'
     131 |         for_each_msi_entry((desc), &(pdev)->dev)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pci/msi.c:264:9: note: in expansion of macro 'for_each_pci_msi_entry'
     264 |         for_each_pci_msi_entry(entry, dev)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/msi.h:114:48: error: 'struct device' has no member named 'msi_list'
     114 | #define dev_to_msi_list(dev)            (&(dev)->msi_list)
         |                                                ^~
   include/linux/compiler.h:396:23: note: in definition of macro '__compiletime_assert'
     396 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:416:9: note: in expansion of macro '_compiletime_assert'
     416 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:998:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     998 |         BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:999:27: note: in expansion of macro '__same_type'
     999 |                          !__same_type(*(ptr), void),                    \
         |                           ^~~~~~~~~~~
   include/linux/list.h:396:9: note: in expansion of macro 'container_of'
     396 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:407:9: note: in expansion of macro 'list_entry'
     407 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:494:20: note: in expansion of macro 'list_first_entry'
     494 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/linux/msi.h:118:9: note: in expansion of macro 'list_for_each_entry'
     118 |         list_for_each_entry((desc), dev_to_msi_list((dev)), list)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/msi.h:118:37: note: in expansion of macro 'dev_to_msi_list'
     118 |         list_for_each_entry((desc), dev_to_msi_list((dev)), list)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/msi.h:131:9: note: in expansion of macro 'for_each_msi_entry'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_MSI
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - KILAUEA [=y] && 40x [=y]
   WARNING: unmet direct dependencies detected for PPC4xx_PCI_EXPRESS
   Depends on [n]: PCI [=n] && 4xx [=y]
   Selected by [y]:
   - KILAUEA [=y] && 40x [=y]
   WARNING: unmet direct dependencies detected for PPC4xx_MSI
   Depends on [n]: PCI_MSI [=y] && PCI [=n] && 4xx [=y]
   Selected by [y]:
   - KILAUEA [=y] && 40x [=y]


vim +175 drivers/pci/msi.c

   135	
   136	static void default_restore_msi_irq(struct pci_dev *dev, int irq)
   137	{
   138		struct msi_desc *entry;
   139	
   140		entry = NULL;
   141		if (dev->msix_enabled) {
 > 142			for_each_pci_msi_entry(entry, dev) {
   143				if (irq == entry->irq)
   144					break;
   145			}
   146		} else if (dev->msi_enabled)  {
   147			entry = irq_get_msi_desc(irq);
   148		}
   149	
   150		if (entry)
   151			__pci_write_msi_msg(entry, &entry->msg);
   152	}
   153	
   154	void __weak arch_restore_msi_irqs(struct pci_dev *dev)
   155	{
   156		return default_restore_msi_irqs(dev);
   157	}
   158	
   159	static inline __attribute_const__ u32 msi_mask(unsigned x)
   160	{
   161		/* Don't shift by >= width of type */
   162		if (x >= 5)
   163			return 0xffffffff;
   164		return (1 << (1 << x)) - 1;
   165	}
   166	
   167	/*
   168	 * PCI 2.3 does not specify mask bits for each MSI interrupt.  Attempting to
   169	 * mask all MSI interrupts by clearing the MSI enable bit does not work
   170	 * reliably as devices without an INTx disable bit will then generate a
   171	 * level IRQ which will never be cleared.
   172	 */
   173	void __pci_msi_desc_mask_irq(struct msi_desc *desc, u32 mask, u32 flag)
   174	{
 > 175		raw_spinlock_t *lock = &desc->dev->msi_lock;
   176		unsigned long flags;
   177	
   178		if (pci_msi_ignore_mask || !desc->msi_attrib.maskbit)
   179			return;
   180	
   181		raw_spin_lock_irqsave(lock, flags);
   182		desc->masked &= ~mask;
   183		desc->masked |= flag;
   184		pci_write_config_dword(msi_desc_to_pci_dev(desc), desc->mask_pos,
   185				       desc->masked);
   186		raw_spin_unlock_irqrestore(lock, flags);
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
