Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A537465
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 20:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682972148; x=1714508148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6qZHAbbVtZdFNk7fs84XYtIWJpQmfdPqjKSMrRvShV0=;
  b=Tf+Iug95fEW8ULFe3ALTXEIIOAW4nWFUBaDAyepu1OzcoslmoRQ2nWWV
   QKLaqNXBf6WRC30fRTvUV7HqR5cxim34G7Kl8kLOInX0U8zBJCXqPOUFe
   XwpSZoz9AQsafK8yGtaFdNojR3ut14sdIfNxMtT0qQ5gFV6H915XrKr0I
   mcVXDY7eEYEER/nmmebyFU27vkW72S3NyD4Mnk19oNq7lbzq86ppa2AZP
   4QD+GL0ecF8vMCiGFw9MDmCLBB5Gog4hNa/9OkzkgnngM8lKnVnphRKZp
   AlqrGaoHaU19gMUFQsHykUrspEzHGRD4Jj/BfIw5pUje8G8DR9hrQrhEA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="347037108"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="347037108"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 13:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="695896671"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="695896671"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 May 2023 13:15:13 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptZvV-0000c1-0Q;
	Mon, 01 May 2023 20:15:13 +0000
Date: Tue, 2 May 2023 04:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 57/59]
 drivers/char/xilinx_hwicap/xilinx_hwicap.c:798:17: error: 'struct
 platform_device' has no member named 'of_node'
Message-ID: <202305020422.fLphAkKE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   7637af07fc9dd17bd0f6c2df329ea6da853c0e38
commit: 86671662a0e9c3e83897935ceec70d9b7d69d16a [57/59] Use of_device_get_match_data
config: microblaze-randconfig-r013-20230430 (https://download.01.org/0day-ci/archive/20230502/202305020422.fLphAkKE-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=86671662a0e9c3e83897935ceec70d9b7d69d16a
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 86671662a0e9c3e83897935ceec70d9b7d69d16a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/char/xilinx_hwicap/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305020422.fLphAkKE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/char/xilinx_hwicap/xilinx_hwicap.c:74:
   drivers/char/xilinx_hwicap/xilinx_hwicap.c: In function 'hwicap_drv_probe':
>> drivers/char/xilinx_hwicap/xilinx_hwicap.c:798:17: error: 'struct platform_device' has no member named 'of_node'
     798 |         if (pdev->of_node)
         |                 ^~
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/char/xilinx_hwicap/xilinx_hwicap.c:798:9: note: in expansion of macro 'if'
     798 |         if (pdev->of_node)
         |         ^~
>> drivers/char/xilinx_hwicap/xilinx_hwicap.c:798:17: error: 'struct platform_device' has no member named 'of_node'
     798 |         if (pdev->of_node)
         |                 ^~
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   drivers/char/xilinx_hwicap/xilinx_hwicap.c:798:9: note: in expansion of macro 'if'
     798 |         if (pdev->of_node)
         |         ^~
>> drivers/char/xilinx_hwicap/xilinx_hwicap.c:798:17: error: 'struct platform_device' has no member named 'of_node'
     798 |         if (pdev->of_node)
         |                 ^~
   include/linux/compiler.h:69:10: note: in definition of macro '__trace_if_value'
      69 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/char/xilinx_hwicap/xilinx_hwicap.c:798:9: note: in expansion of macro 'if'
     798 |         if (pdev->of_node)
         |         ^~


vim +798 drivers/char/xilinx_hwicap/xilinx_hwicap.c

   790	
   791	static const struct of_device_id hwicap_of_match[];
   792	static int hwicap_drv_probe(struct platform_device *pdev)
   793	{
   794		struct resource *res;
   795		const struct config_registers *regs;
   796		const char *family;
   797	
 > 798		if (pdev->of_node)
   799			return hwicap_of_probe(pdev, of_device_get_match_data(&pdev->dev));
   800	
   801		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   802		if (!res)
   803			return -ENODEV;
   804	
   805		/* It's most likely that we're using V4, if the family is not
   806		 * specified
   807		 */
   808		regs = &v4_config_registers;
   809		family = pdev->dev.platform_data;
   810	
   811		if (family) {
   812			if (!strcmp(family, "virtex2p"))
   813				regs = &v2_config_registers;
   814			else if (!strcmp(family, "virtex4"))
   815				regs = &v4_config_registers;
   816			else if (!strcmp(family, "virtex5"))
   817				regs = &v5_config_registers;
   818			else if (!strcmp(family, "virtex6"))
   819				regs = &v6_config_registers;
   820		}
   821	
   822		return hwicap_setup(&pdev->dev, pdev->id, res,
   823				&buffer_icap_config, regs);
   824	}
   825	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
