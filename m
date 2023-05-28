Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6937E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 04:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685247596; x=1716783596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qRNoVT6AcQV+4KosP8PvXLIvyWMmRR0wXrlYoGmiHkY=;
  b=XmC9x+U/XyKp0f4DRWhnwLxAVngMrScoPb+z32WBoyWDOBmPRpvI/qSi
   7NLD2T7vbMJ2x/gBUjFYEdjOszWww5FZHdbFGs+HUtpS79++tJNquUXDp
   otxquT1EQ9PJ2FErXMMTAnN+Ut0lWZ5J2PyBdX+xVZTWx/lDoqj4YyutM
   MkP6H+iDI47ByX0LrAV1JUjkNO0VmFWDIZQmGIogU4Ss+uIz3y324cYYa
   g3aeN9wosxFm+86Wu9L6tWMuTqmCa43yPhRuz3Ho/+JqDS9+OLUS7I0Q1
   2cPYRfSScndDLhosvB8hkE1tfCehBwr7ulhg6XLCG0suaubhAEyNrzJX2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="420241570"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="420241570"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 21:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="683148751"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="683148751"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 May 2023 21:19:54 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q37sn-000KQY-2z;
	Sun, 28 May 2023 04:19:53 +0000
Date: Sun, 28 May 2023 12:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 6/9] drivers/pci/cma.c:123:12: error: void value not
 ignored as it ought to be
Message-ID: <202305281246.57lgDAbA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   4ba2c44577ead603be4857ecda9a948d6935775f
commit: f3340dca6746e53df3171deb88266f6d5175070e [6/9] PCI/CMA: Expose in sysfs whether devices are authenticated
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230528/202305281246.57lgDAbA-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/f3340dca6746e53df3171deb88266f6d5175070e
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout f3340dca6746e53df3171deb88266f6d5175070e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281246.57lgDAbA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/cma.c: In function 'authenticated_store':
>> drivers/pci/cma.c:123:12: error: void value not ignored as it ought to be
     123 |         rc = pci_cma_reauthenticate(pdev);
         |            ^


vim +123 drivers/pci/cma.c

   111	
   112	static ssize_t authenticated_store(struct device *dev,
   113					   struct device_attribute *attr,
   114					   const char *buf, size_t count)
   115	{
   116		struct pci_dev *pdev = to_pci_dev(dev);
   117		ssize_t rc;
   118	
   119		if (!pdev->cma_capable &&
   120		    (pdev->cma_init_failed || pdev->doe_init_failed))
   121			return -ENOTTY;
   122	
 > 123		rc = pci_cma_reauthenticate(pdev);
   124		if (rc)
   125			return rc;
   126	
   127		return count;
   128	}
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
