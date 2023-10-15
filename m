Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C258185E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 10:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpoL763T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697367214; x=1728903214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UPDNJ+vWWzjEuOP4r1otzJH3zRTjcGHXKpQFl1Auhl0=;
  b=DpoL763Te4cgTdiq/tQYLC9GCtO+KkMFUYau76lXHMtEllzfRV4oOjMM
   4yRW5yDMf3K7aIuHon7HtMcKCMXQuCHGxVg2ZF+wgMu8mtWMxwmhCVOG1
   VQ+yBySO6Pez5lsFxui3wRZ8cI+5n/U/f6jDXrjG9t0Kl+dVAWjTYwGi2
   Q3cfy1VMZTJlmF3DbDV/YR/R3k6Z2CZOOYp2T8AP5NIJHrVRXD3NMHfk4
   2AGsY6TONv/mutjlIErGU8iWvvfTB8lDyRaO+Kd/fk6Yw/h3GesYDLVOi
   GWpe1V32+zKhk2JfYcX/HTSXDGLtRCRHZ+EDUjG2jk9P64VnzLoPlJ2PE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382609324"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="382609324"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 03:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790465566"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790465566"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Oct 2023 03:53:29 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrykR-0007LE-1N;
	Sun, 15 Oct 2023 10:53:27 +0000
Date: Sun, 15 Oct 2023 18:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2305/30000]
 drivers/crypto/caam/sm_test.c:505:6: warning: no previous prototype for
 'caam_sm_example_shutdown'
Message-ID: <202310151844.49Imjxxl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: e0f7d41a2eba70ed40228da141c3329d01424cbc [2305/30000] MLKU-25-3 crypto: caam - add Secure Memory support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20231015/202310151844.49Imjxxl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151844.49Imjxxl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151844.49Imjxxl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/caam/sm_test.c:505:6: warning: no previous prototype for 'caam_sm_example_shutdown' [-Wmissing-prototypes]
     505 | void caam_sm_example_shutdown(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:587,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from drivers/crypto/caam/compat.h:18,
                    from drivers/crypto/caam/sm_test.c:26:
   drivers/crypto/caam/intern.h:217:25: warning: 'caam_fops_u64_ro' defined but not used [-Wunused-const-variable=]
     217 | DEFINE_SIMPLE_ATTRIBUTE(caam_fops_u64_ro, caam_debugfs_u64_get, NULL, "%llu\n");
         |                         ^~~~~~~~~~~~~~~~
   include/linux/fs.h:3474:37: note: in definition of macro 'DEFINE_SIMPLE_ATTRIBUTE'
    3474 | static const struct file_operations __fops = {                          \
         |                                     ^~~~~~
   drivers/crypto/caam/intern.h:216:25: warning: 'caam_fops_u32_ro' defined but not used [-Wunused-const-variable=]
     216 | DEFINE_SIMPLE_ATTRIBUTE(caam_fops_u32_ro, caam_debugfs_u32_get, NULL, "%llu\n");
         |                         ^~~~~~~~~~~~~~~~
   include/linux/fs.h:3474:37: note: in definition of macro 'DEFINE_SIMPLE_ATTRIBUTE'
    3474 | static const struct file_operations __fops = {                          \
         |                                     ^~~~~~


vim +/caam_sm_example_shutdown +505 drivers/crypto/caam/sm_test.c

   504	
 > 505	void caam_sm_example_shutdown(void)
   506	{
   507		/* unused in present version */
   508		struct device_node *dev_node;
   509		struct platform_device *pdev;
   510	
   511		/*
   512		 * Do of_find_compatible_node() then of_find_device_by_node()
   513		 * once a functional device tree is available
   514		 */
   515		dev_node = of_find_compatible_node(NULL, NULL, "fsl,sec-v4.0");
   516		if (!dev_node) {
   517			dev_node = of_find_compatible_node(NULL, NULL, "fsl,sec4.0");
   518			if (!dev_node)
   519				return;
   520		}
   521	
   522		pdev = of_find_device_by_node(dev_node);
   523		if (!pdev)
   524			return;
   525	
   526		of_node_get(dev_node);
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
