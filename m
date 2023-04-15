Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DB81868
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 20:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681589814; x=1713125814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=49B8w2SItDVgx3nw0nlzUnWu97/rW9583EmfgWj+6Ng=;
  b=dbATgTH2LSetwxZ5o3XsvGlqvoOObO3RbcXLrO1bGCk7EG5S18jMBXim
   5ejW4D9sn56XnmIVAT1XPTuE26BEyL1Gp0kAFmcLIe2pvNn1CeezFXoMD
   wnRZW3DfOsWojAW3iDHoK5c5077wWDPxQi0EVNVdydOZykiVnv6TpZc27
   GKUHlZKJq2MEpxxToz+vHEk3wjEMr+/DSsWLRItBERUXZOS41opRnn/zL
   2XL89optigpp+LF4F+9iW0B0MIaKIc3ljsqfDS6lCoXLLPp7ye7OtXV2M
   o4+OSgI/vHFc6hHWTQY5GNQEj0A5tqEBpl4oX4tIrSQTO5O9s3uyWbKKx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="372551635"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="372551635"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 13:16:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="1019964669"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="1019964669"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Apr 2023 13:16:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnmKK-000bKB-1Y;
	Sat, 15 Apr 2023 20:16:52 +0000
Date: Sun, 16 Apr 2023 04:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 3332/9838]
 ./usr/include/linux/imx_vpu.h:22:1: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202304160427.QDhgtJYq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: b82c78d77f16b30cffdd304eb2c6c1a3ab4f68ba [3332/9838] arm64: imx8mx: vpu: add vsi v4l2 decoder and encoder
config: x86_64-randconfig-a014-20230410 (https://download.01.org/0day-ci/archive/20230416/202304160427.QDhgtJYq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/b82c78d77f16b30cffdd304eb2c6c1a3ab4f68ba
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout b82c78d77f16b30cffdd304eb2c6c1a3ab4f68ba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160427.QDhgtJYq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from ./usr/include/linux/imx_vpu.h:17,
                    from <command-line>:
   usr/include/linux/videodev2.h:2437:41: error: field 'timestamp' has incomplete type
    2437 |         struct timespec                 timestamp;
         |                                         ^~~~~~~~~
   In file included from <command-line>:
>> ./usr/include/linux/imx_vpu.h:22:1: error: C++ style comments are not allowed in ISO C90
      22 | //ctrls & extension ctrls definitions
         | ^
   ./usr/include/linux/imx_vpu.h:22:1: note: (this will be reported only once per input file)
>> ./usr/include/linux/imx_vpu.h:111:9: warning: extra tokens at end of #endif directive [-Wendif-labels]
     111 | #endif  //#ifndef __LINUX_IMX_VPU_H
         |         ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
