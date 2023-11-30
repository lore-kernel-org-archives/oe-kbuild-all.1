Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5DC1079A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 02:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYLYYXB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701310744; x=1732846744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1jXK9ZwJ898MiPD+ux/FOyPpI+NqrzgAR1qB3GNWhSc=;
  b=ZYLYYXB8s0oKA4CdJxNTCvf1zeN1OV7hLEKdky0r0OCP1v336zwS37Ti
   Vh7vf+ZsGL7wPVcufBFEXe3Mr1t4GutlgpmTg+pzCP0KNNv5H5/yf2zZn
   n4XAm9KyE8X+4rSyfXXnzc1HAt0pyzCQvm6x6c1PlFVGMZ795O14th292
   xVPS/I1TMtrKeulY5EKD/dMgf2vpu1kX9J9HHLmVL+bKKbBJmFMAslmXG
   2555wrIOZpANuZdVGAVM3RbaEwRC7z1PlG7jcwteUHtkOBICd72O4t3Hg
   5QlZtRaxDMclku/cLRC8mpyfUGIQoT4ewDeOMCZm4SE1Gf+QHuK/Tbrkd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="378281161"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="378281161"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 18:19:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="887069384"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="887069384"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2023 18:19:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Wdn-0001F5-0f;
	Thu, 30 Nov 2023 02:18:59 +0000
Date: Thu, 30 Nov 2023 10:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [char-misc:char-misc-testing 7/7] drivers/misc/nsm.c:492:38: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202311300555.VLoyFgyw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   b9873755a6c8ccfce79094c4dce9efa3ecb1a749
commit: b9873755a6c8ccfce79094c4dce9efa3ecb1a749 [7/7] misc: Add Nitro Secure Module driver
config: x86_64-randconfig-121-20231130 (https://download.01.org/0day-ci/archive/20231130/202311300555.VLoyFgyw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311300555.VLoyFgyw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300555.VLoyFgyw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/nsm.c:492:38: sparse: sparse: Using plain integer as NULL pointer
   drivers/misc/nsm.c:494:38: sparse: sparse: Using plain integer as NULL pointer

vim +492 drivers/misc/nsm.c

   489	
   490	/* NSM device configuration structure */
   491	static struct virtio_driver virtio_nsm_driver = {
 > 492		.feature_table             = 0,
   493		.feature_table_size        = 0,
   494		.feature_table_legacy      = 0,
   495		.feature_table_size_legacy = 0,
   496		.driver.name               = KBUILD_MODNAME,
   497		.driver.owner              = THIS_MODULE,
   498		.id_table                  = id_table,
   499		.probe                     = nsm_device_probe,
   500		.remove                    = nsm_device_remove,
   501	};
   502	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
