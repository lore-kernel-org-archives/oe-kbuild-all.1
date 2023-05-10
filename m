Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B021CC4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 20:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683751068; x=1715287068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vYJdDe0E4RuzRAxvPIZVAQ0AL/ALtRU3lQV2Sq6Cb2A=;
  b=jIp5Dk/SNuMyyOjpBdD5FogL38W9dwuvhXVDSrKtVL0zGY1u7uFYaciI
   QjtKBXqhvK+dkFQ6Qvdb1R8LhC+C+VOcPR0hs/CJphXkVgp5kztclWKpE
   rWP+JF9sXQFQf5KBrS0QYPnHvEfoZQtxjGvYaNffbMZzNY8LP5iTY9XT/
   TKG8LmgKhcfwA48FSOniC1J09l91MtOxSBomPZ4oXHVdqEol3s9dQEmr6
   PyzHnCYq8B+D35dzXsN153Djbsp/4LYaFLiZWdTszlalxv35DuVV1dbX9
   QQlc2oQJ7G6rEskSpR3FCGbK1av5l3z3c6q9XgFHFE8HZkLzCmQroSsyA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436639980"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="436639980"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 13:37:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="676975741"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="676975741"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 May 2023 13:37:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwqZF-0003Ye-0l;
	Wed, 10 May 2023 20:37:45 +0000
Date: Thu, 11 May 2023 04:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 36/41] drivers/usb/host/pci-quirks.c:289:5:
 warning: no previous prototype for 'usb_hcd_amd_remote_wakeup_quirk'
Message-ID: <202305110408.voVEYYmT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   b873f53aa1a6487f4a450747bd5ee38afad6dfe4
commit: 216a01adc35d677e5b2db113a4df427faae01e75 [36/41] usb: pci-quirks: handle HAS_IOPORT dependencies
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230511/202305110408.voVEYYmT-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=216a01adc35d677e5b2db113a4df427faae01e75
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout 216a01adc35d677e5b2db113a4df427faae01e75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110408.voVEYYmT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/pci-quirks.c:289:5: warning: no previous prototype for 'usb_hcd_amd_remote_wakeup_quirk' [-Wmissing-prototypes]
     289 | int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/usb_hcd_amd_remote_wakeup_quirk +289 drivers/usb/host/pci-quirks.c

ad93562bdeecdd Andiry Xu     2011-03-01  288  
7868943db1668f Huang Rui     2013-09-16 @289  int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
7868943db1668f Huang Rui     2013-09-16  290  {
7868943db1668f Huang Rui     2013-09-16  291  	/* Make sure amd chipset type has already been initialized */
7868943db1668f Huang Rui     2013-09-16  292  	usb_amd_find_chipset_info();
e788787ef4f9c2 Sandeep Singh 2017-08-04  293  	if (amd_chipset.sb_type.gen == AMD_CHIPSET_YANGTZE ||
e788787ef4f9c2 Sandeep Singh 2017-08-04  294  	    amd_chipset.sb_type.gen == AMD_CHIPSET_TAISHAN) {
7868943db1668f Huang Rui     2013-09-16  295  		dev_dbg(&pdev->dev, "QUIRK: Enable AMD remote wakeup fix\n");
7868943db1668f Huang Rui     2013-09-16  296  		return 1;
7868943db1668f Huang Rui     2013-09-16  297  	}
e788787ef4f9c2 Sandeep Singh 2017-08-04  298  	return 0;
e788787ef4f9c2 Sandeep Singh 2017-08-04  299  }
7868943db1668f Huang Rui     2013-09-16  300  EXPORT_SYMBOL_GPL(usb_hcd_amd_remote_wakeup_quirk);
7868943db1668f Huang Rui     2013-09-16  301  

:::::: The code at line 289 was first introduced by commit
:::::: 7868943db1668fba898cf71bed1506c19d6958aa usb: core: implement AMD remote wakeup quirk

:::::: TO: Huang Rui <ray.huang@amd.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
