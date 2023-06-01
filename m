Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82131390
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 02:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685588163; x=1717124163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=One73oz6ykERaWmd61qmY0vDVcozHVQSqmfa0RosVmY=;
  b=gF7KsKpTwlh4BCsGpzojwXRPBIm0Yp6zAzoE+3OvqD1IRoZk0e5MDreZ
   ip0I8Nl69x+hzxMGdFvYAjY8LRjN4qlLJi4DAQ7vLZzuhz6tN0hj7oJsv
   HKezt3i6NSUBgOwu6bD5wsQ4xJR7fmHiVGR+uNKGSKRGHUky5OsedjEjo
   9cfHz9LPUbLqkCFl/YTVNwEkyoS5ZylQlaJb9sDPCcUdOeKPULWu0wiBa
   pTF4Vzlis+HGqQBlbZM8pAX49EsQkGsaJ+bB/oRWcND/R30RWC+aXRcrP
   yNrmw5AtKGpWKeKSWW/VCu5rmbddxFI3djw4rNOiwuKo17ck2WjAAmzzL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="335783945"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="335783945"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 19:55:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="819568966"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="819568966"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 May 2023 19:55:57 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4YTk-0001p5-0t;
	Thu, 01 Jun 2023 02:55:56 +0000
Date: Thu, 1 Jun 2023 10:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.19.y 7624/9999] drivers/pci/msi.c:727:32: error:
 increment of pointer to an incomplete type 'struct msix_entry'
Message-ID: <202306011039.O9FaB6h1-lkp@intel.com>
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
commit: 3b570884c868c12e3184627ce4b4a167e9d6f018 [7624/9999] PCI/MSI: Mask all unused MSI-X entries
config: powerpc-randconfig-r032-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011039.O9FaB6h1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=3b570884c868c12e3184627ce4b4a167e9d6f018
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 3b570884c868c12e3184627ce4b4a167e9d6f018
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011039.O9FaB6h1-lkp@intel.com/

All errors (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~
   drivers/pci/msi.c:724:9: note: in expansion of macro 'for_each_pci_msi_entry'
     724 |         for_each_pci_msi_entry(entry, dev) {
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
   drivers/pci/msi.c:724:9: note: in expansion of macro 'for_each_pci_msi_entry'
     724 |         for_each_pci_msi_entry(entry, dev) {
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
     131 |         for_each_msi_entry((desc), &(pdev)->dev)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pci/msi.c:724:9: note: in expansion of macro 'for_each_pci_msi_entry'
     724 |         for_each_pci_msi_entry(entry, dev) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
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
   drivers/pci/msi.c:724:9: note: in expansion of macro 'for_each_pci_msi_entry'
     724 |         for_each_pci_msi_entry(entry, dev) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/msi.c:726:32: error: invalid use of undefined type 'struct msix_entry'
     726 |                         entries->vector = entry->irq;
         |                                ^~
>> drivers/pci/msi.c:727:32: error: increment of pointer to an incomplete type 'struct msix_entry'
     727 |                         entries++;
         |                                ^~
   drivers/pci/msi.c: At top level:
   drivers/pci/msi.c:752:61: warning: 'struct msix_entry' declared inside parameter list will not be visible outside of this definition or declaration
     752 | static int msix_capability_init(struct pci_dev *dev, struct msix_entry *entries,
         |                                                             ^~~~~~~~~~
   drivers/pci/msi.c: In function 'msix_capability_init':
   drivers/pci/msi.c:779:45: error: passing argument 3 of 'msix_setup_entries' from incompatible pointer type [-Werror=incompatible-pointer-types]
     779 |         ret = msix_setup_entries(dev, base, entries, nvec, affd);
         |                                             ^~~~~~~
         |                                             |
         |                                             struct msix_entry *
   drivers/pci/msi.c:673:50: note: expected 'struct msix_entry *' but argument is of type 'struct msix_entry *'
     673 |                               struct msix_entry *entries, int nvec,
         |                               ~~~~~~~~~~~~~~~~~~~^~~~~~~
>> drivers/pci/msi.c:792:34: error: passing argument 2 of 'msix_update_entries' from incompatible pointer type [-Werror=incompatible-pointer-types]
     792 |         msix_update_entries(dev, entries);
         |                                  ^~~~~~~
         |                                  |
         |                                  struct msix_entry *
   drivers/pci/msi.c:720:73: note: expected 'struct msix_entry *' but argument is of type 'struct msix_entry *'
     720 | static void msix_update_entries(struct pci_dev *dev, struct msix_entry *entries)
         |                                                      ~~~~~~~~~~~~~~~~~~~^~~~~~~
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
   drivers/pci/msi.c:815:17: note: in expansion of macro 'for_each_pci_msi_entry'
     815 |                 for_each_pci_msi_entry(entry, dev) {
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
   drivers/pci/msi.c:815:17: note: in expansion of macro 'for_each_pci_msi_entry'
     815 |                 for_each_pci_msi_entry(entry, dev) {
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


vim +727 drivers/pci/msi.c

   719	
   720	static void msix_update_entries(struct pci_dev *dev, struct msix_entry *entries)
   721	{
   722		struct msi_desc *entry;
   723	
   724		for_each_pci_msi_entry(entry, dev) {
   725			if (entries) {
   726				entries->vector = entry->irq;
 > 727				entries++;
   728			}
   729		}
   730	}
   731	
   732	static void msix_mask_all(void __iomem *base, int tsize)
   733	{
   734		u32 ctrl = PCI_MSIX_ENTRY_CTRL_MASKBIT;
   735		int i;
   736	
   737		for (i = 0; i < tsize; i++, base += PCI_MSIX_ENTRY_SIZE)
   738			writel(ctrl, base + PCI_MSIX_ENTRY_VECTOR_CTRL);
   739	}
   740	
   741	/**
   742	 * msix_capability_init - configure device's MSI-X capability
   743	 * @dev: pointer to the pci_dev data structure of MSI-X device function
   744	 * @entries: pointer to an array of struct msix_entry entries
   745	 * @nvec: number of @entries
   746	 * @affd: Optional pointer to enable automatic affinity assignement
   747	 *
   748	 * Setup the MSI-X capability structure of device function with a
   749	 * single MSI-X irq. A return of zero indicates the successful setup of
   750	 * requested MSI-X entries with allocated irqs or non-zero for otherwise.
   751	 **/
   752	static int msix_capability_init(struct pci_dev *dev, struct msix_entry *entries,
   753					int nvec, const struct irq_affinity *affd)
   754	{
   755		void __iomem *base;
   756		int ret, tsize;
   757		u16 control;
   758	
   759		/*
   760		 * Some devices require MSI-X to be enabled before the MSI-X
   761		 * registers can be accessed.  Mask all the vectors to prevent
   762		 * interrupts coming in before they're fully set up.
   763		 */
   764		pci_msix_clear_and_set_ctrl(dev, 0, PCI_MSIX_FLAGS_MASKALL |
   765					    PCI_MSIX_FLAGS_ENABLE);
   766	
   767		pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &control);
   768		/* Request & Map MSI-X table region */
   769		tsize = msix_table_size(control);
   770		base = msix_map_region(dev, tsize);
   771		if (!base) {
   772			ret = -ENOMEM;
   773			goto out_disable;
   774		}
   775	
   776		/* Ensure that all table entries are masked. */
   777		msix_mask_all(base, tsize);
   778	
   779		ret = msix_setup_entries(dev, base, entries, nvec, affd);
   780		if (ret)
   781			goto out_disable;
   782	
   783		ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
   784		if (ret)
   785			goto out_avail;
   786	
   787		/* Check if all MSI entries honor device restrictions */
   788		ret = msi_verify_entries(dev);
   789		if (ret)
   790			goto out_free;
   791	
 > 792		msix_update_entries(dev, entries);
   793	
   794		ret = populate_msi_sysfs(dev);
   795		if (ret)
   796			goto out_free;
   797	
   798		/* Set MSI-X enabled bits and unmask the function */
   799		pci_intx_for_msi(dev, 0);
   800		dev->msix_enabled = 1;
   801		pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
   802	
   803		pcibios_free_irq(dev);
   804		return 0;
   805	
   806	out_avail:
   807		if (ret < 0) {
   808			/*
   809			 * If we had some success, report the number of irqs
   810			 * we succeeded in setting up.
   811			 */
   812			struct msi_desc *entry;
   813			int avail = 0;
   814	
   815			for_each_pci_msi_entry(entry, dev) {
   816				if (entry->irq != 0)
   817					avail++;
   818			}
   819			if (avail != 0)
   820				ret = avail;
   821		}
   822	
   823	out_free:
   824		free_msi_irqs(dev);
   825	
   826	out_disable:
   827		pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_ENABLE, 0);
   828	
   829		return ret;
   830	}
   831	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
