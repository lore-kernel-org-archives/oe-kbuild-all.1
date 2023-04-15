Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DE52F39
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 23:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681602239; x=1713138239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d2yLVlR7qhVVEFLttrxJwzP8s3vf1aTSOcEoQFFIiAM=;
  b=UUy0WZrdswsnWQ7bbtoy0/gaPTdpFiEokry4bxhWUv6gc+cB4mrGT7nQ
   8Z9le/oZT3HYMY1C4jNU/QYHPfjzuTKrr3B6AbwBT7EkhH1MMdb4Jjyux
   d53lwcNZl5IWpiULfTkSBCbl3xgkFA0AlrQoGfTUExgQb4PCDdq8rJSMP
   ahBjzongEdEK6CJ3yhwjql3bYpMazCbrFDBNeSpNHQCquE1nXj7fk45to
   /nzYcYWciJjeAXZot/1cu/Ze0KSvBITJsJUQek+7q21nXFaEAF9t2rtHw
   5GuNALNE7ntxZrMM8U9NeO8eWJgjhEUb1jRC6uoC5ETxL1RNuxiMelHfJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="328843922"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="328843922"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 16:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="779641934"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="779641934"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Apr 2023 16:43:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnpYi-000bPx-0j;
	Sat, 15 Apr 2023 23:43:56 +0000
Date: Sun, 16 Apr 2023 07:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [tip:irq/urgent 1/1] drivers/pci/msi/msi.c:763:25: error: 'nvec'
 undeclared; did you mean 'nvev'?
Message-ID: <202304160752.QJiM8zR3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
head:   84d9651e13fb9820041d19262a55906851524c0f
commit: 84d9651e13fb9820041d19262a55906851524c0f [1/1] PCI/MSI: Remove over-zealous hardware size check in pci_msix_validate_entries()
config: ia64-randconfig-r002-20230416 (https://download.01.org/0day-ci/archive/20230416/202304160752.QJiM8zR3-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=84d9651e13fb9820041d19262a55906851524c0f
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip irq/urgent
        git checkout 84d9651e13fb9820041d19262a55906851524c0f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/pci/msi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160752.QJiM8zR3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/msi/msi.c: In function 'pci_msix_validate_entries':
>> drivers/pci/msi/msi.c:763:25: error: 'nvec' undeclared (first use in this function); did you mean 'nvev'?
     763 |         for (i = 0; i < nvec; i++) {
         |                         ^~~~
         |                         nvev
   drivers/pci/msi/msi.c:763:25: note: each undeclared identifier is reported only once for each function it appears in


vim +763 drivers/pci/msi/msi.c

^1da177e4c3f41 drivers/pci/msi.c     Linus Torvalds    2005-04-16  752  
84d9651e13fb98 drivers/pci/msi/msi.c Thomas Gleixner   2023-04-10  753  static bool pci_msix_validate_entries(struct pci_dev *dev, struct msix_entry *entries, int nvev)
^1da177e4c3f41 drivers/pci/msi.c     Linus Torvalds    2005-04-16  754  {
4644d22eb673f1 drivers/pci/msi/msi.c Thomas Gleixner   2022-11-11  755  	bool nogap;
ded86d8d37736d drivers/pci/msi.c     Eric W. Biederman 2007-01-28  756  	int i, j;
^1da177e4c3f41 drivers/pci/msi.c     Linus Torvalds    2005-04-16  757  
bab65e48cb064d drivers/pci/msi/msi.c Thomas Gleixner   2022-11-11  758  	if (!entries)
bab65e48cb064d drivers/pci/msi/msi.c Thomas Gleixner   2022-11-11  759  		return true;
^1da177e4c3f41 drivers/pci/msi.c     Linus Torvalds    2005-04-16  760  
4644d22eb673f1 drivers/pci/msi/msi.c Thomas Gleixner   2022-11-11  761  	nogap = pci_msi_domain_supports(dev, MSI_FLAG_MSIX_CONTIGUOUS, DENY_LEGACY);
4644d22eb673f1 drivers/pci/msi/msi.c Thomas Gleixner   2022-11-11  762  
^1da177e4c3f41 drivers/pci/msi.c     Linus Torvalds    2005-04-16 @763  	for (i = 0; i < nvec; i++) {
bab65e48cb064d drivers/pci/msi/msi.c Thomas Gleixner   2022-11-11  764  		/* Check for duplicate entries */
^1da177e4c3f41 drivers/pci/msi.c     Linus Torvalds    2005-04-16  765  		for (j = i + 1; j < nvec; j++) {
^1da177e4c3f41 drivers/pci/msi.c     Linus Torvalds    2005-04-16  766  			if (entries[i].entry == entries[j].entry)
bab65e48cb064d drivers/pci/msi/msi.c Thomas Gleixner   2022-11-11  767  				return false;
^1da177e4c3f41 drivers/pci/msi.c     Linus Torvalds    2005-04-16  768  		}
4644d22eb673f1 drivers/pci/msi/msi.c Thomas Gleixner   2022-11-11  769  		/* Check for unsupported gaps */
4644d22eb673f1 drivers/pci/msi/msi.c Thomas Gleixner   2022-11-11  770  		if (nogap && entries[i].entry != i)
4644d22eb673f1 drivers/pci/msi/msi.c Thomas Gleixner   2022-11-11  771  			return false;
^1da177e4c3f41 drivers/pci/msi.c     Linus Torvalds    2005-04-16  772  	}
bab65e48cb064d drivers/pci/msi/msi.c Thomas Gleixner   2022-11-11  773  	return true;
3ac020e0ca8bef drivers/pci/msi.c     Christoph Hellwig 2016-07-12  774  }
7bd007e480672c drivers/pci/msi.c     Eric W. Biederman 2006-10-04  775  

:::::: The code at line 763 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
