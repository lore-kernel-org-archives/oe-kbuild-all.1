Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681CB15C8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 18:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675622429; x=1707158429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nyvhh1iuNEJHrayjMEX2qzHFCmFhPxNRqskEuhDqlZY=;
  b=eF1v05jhPEf3hMr4huekhnQuHP09smu7D1Fqymbr7bvvvUovJBfxC/wo
   /MYFsrc+zEO254VjXMd+pssBHrXzlscjRR3xO9UtOEjDOmx8N/TrCRzmt
   tBEahQUW2KDWIF0J7d9AtObCmLzdgyFu7nypo/+Fb+mB/cAEmOoMgZOLh
   zQbOR8Z/cw+XrsJswInWvG+/Jz/uGCUMua85n/5lcfKJLkjJRBtbigbVR
   tbh1lo+FbkCtZ/DywWYfYLBjSIz24I/pUSXXIhLYb0UqgClFm+PUXtqu+
   HUEypxaFeqOysZluseSMZfzfxo5YFHN24lehfvxg78U3+xpJ3UVuQEUBn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="415293148"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="415293148"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 10:40:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="995071109"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="995071109"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Feb 2023 10:40:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOjwA-00029g-1Q;
	Sun, 05 Feb 2023 18:40:26 +0000
Date: Mon, 6 Feb 2023 02:39:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 4378/20208]
 drivers/crypto/caam/sm_test.c:505:6: warning: no previous prototype for
 'caam_sm_example_shutdown'
Message-ID: <202302060257.37fKe8Ep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steve,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: ea4b32b835174e520a45d12de5cdd18f9203658d [4378/20208] MLKU-25-3 crypto: caam - add Secure Memory support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230206/202302060257.37fKe8Ep-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/ea4b32b835174e520a45d12de5cdd18f9203658d
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout ea4b32b835174e520a45d12de5cdd18f9203658d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/ security/keys/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/crypto/caam/sm_test.c:505:6: warning: no previous prototype for 'caam_sm_example_shutdown' [-Wmissing-prototypes]
     505 | void caam_sm_example_shutdown(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


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
https://github.com/intel/lkp-tests
