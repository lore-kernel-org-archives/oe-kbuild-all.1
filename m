Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F80C33C1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 17:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675618707; x=1707154707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ATFDumRTC1YefpY4Jy/ElxmKAJUXI4Z6zjalEGnK9CM=;
  b=b6PzahtidOG7oMaycze4/56N1pOdjeYOk5i2cCAA21yYBu6DL0d6zJ1I
   xAmY1TyGBIPdNqE3RtY6TxiiUweQXYAbcQrgSnyZpB67n0ovGZ5AdmgiQ
   5M6fYKmexiuo38GC6XnodrqO32WVWcLSZYkHlmxRXPumAk1qwyg/oII2H
   +LK/MjS/d9G91kIcmwzfOBr4CByiPfa7IFejsO3W+TlvQoLTTWA4Zhlb/
   ymRTl9yoLoo5rXqYztrzu35HBFMhg/reuSkqIwK7zduWxCAJpY1+a4Ht2
   /AvtJ6Vqz7jMVHJFmG/MqJKEc4X8VhG00ltdkCb3LZGfVudPG48U3Ak2q
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="393666785"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="393666785"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 09:38:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="659634527"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="659634527"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Feb 2023 09:38:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOiy9-00027w-0I;
	Sun, 05 Feb 2023 17:38:25 +0000
Date: Mon, 6 Feb 2023 01:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 12/24] drivers/pci/doe.c:695:13: warning: format specifies
 type 'int' but the argument has type 'long'
Message-ID: <202302060106.cCk8YR5a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   7a7fab915bd483188cd656e0dca0e1e6619c190a
commit: 33c3744e3baccbe63b302640bdc1c543b5b20d27 [12/24] PCI/DOE: Create mailboxes on device enumeration
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230206/202302060106.cCk8YR5a-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/33c3744e3baccbe63b302640bdc1c543b5b20d27
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout 33c3744e3baccbe63b302640bdc1c543b5b20d27
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pci/doe.c:695:13: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
                                   offset, PTR_ERR(doe_mb));
                                           ^~~~~~~~~~~~~~~
   include/linux/pci.h:2529:65: note: expanded from macro 'pci_err'
   #define pci_err(pdev, fmt, arg...)      dev_err(&(pdev)->dev, fmt, ##arg)
                                                                 ~~~    ^~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +695 drivers/pci/doe.c

   681	
   682	void pci_doe_init(struct pci_dev *pdev)
   683	{
   684		struct pci_doe_mb *doe_mb;
   685		u16 offset = 0;
   686		int rc;
   687	
   688		xa_init(&pdev->doe_mbs);
   689	
   690		while ((offset = pci_find_next_ext_capability(pdev, offset,
   691							      PCI_EXT_CAP_ID_DOE))) {
   692			doe_mb = pci_doe_create_mb(pdev, offset);
   693			if (IS_ERR(doe_mb)) {
   694				pci_err(pdev, "[%x] failed to create mailbox: %d\n",
 > 695					offset, PTR_ERR(doe_mb));
   696				continue;
   697			}
   698	
   699			rc = xa_insert(&pdev->doe_mbs, offset, doe_mb, GFP_KERNEL);
   700			if (rc) {
   701				pci_err(pdev, "[%x] failed to insert mailbox: %d\n",
   702					offset, rc);
   703				pci_doe_destroy_mb(doe_mb);
   704			}
   705		}
   706	}
   707	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
