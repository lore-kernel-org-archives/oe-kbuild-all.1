Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB1622638
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 15:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683993074; x=1715529074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdn9/1UUpNNa4wybUF7KGRppehw4lXtEeucjCDhK96A=;
  b=XH6J6tnlrKg+mgVIE0C2gSADZt4SWEZaNQkmxFk3EdP2anREzPhaovf+
   hSt6KQR2M40ZnF0NxxYYFq80jrRgYZECGGgQbZ3N3RW3XHSsBqajMV+7m
   VurIwE09CpVZpUAcjvLD+rwLo3NgPcpdcwRELHgLpxp2EVKsX/z25nIf1
   cOQj82cALeizXeMWyeB1HtFPWVRWmyVpi40goGD5q1HxNR4pXJFNFczjO
   lXsfH64KM2EMK2lNla94iDRgAFqQ/IYzEvY/mNx3KjFVCqz0JZcXBipJi
   06GkfDFTM54J54kYkUAx5br6ykt6OFGv/jFK2tEC1ta4fLuyjMLWU2cEb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="414352497"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="414352497"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 08:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="731144160"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="731144160"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 May 2023 08:51:12 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxrWa-0005Ya-0p;
	Sat, 13 May 2023 15:51:12 +0000
Date: Sat, 13 May 2023 23:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ramesh Babu <ramesh.babu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Guneshwor Singh <guneshwor.o.singh@intel.com>
Subject: [intel-lts:4.19/android_t 4338/30000]
 drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but not
 used
Message-ID: <202305132322.UtZ8S9be-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ramesh,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   180df1199944ebd8928f320a1bd16c8a87dba2ed
commit: 90f1d221943f2adfc6a62813733d6dc0347ab20c [4338/30000] ASoC: mfd: Intel changes for WM8281 integration on K4.0
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230513/202305132322.UtZ8S9be-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/90f1d221943f2adfc6a62813733d6dc0347ab20c
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 4.19/android_t
        git checkout 90f1d221943f2adfc6a62813733d6dc0347ab20c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dma-buf/ drivers/mfd/ drivers/platform/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305132322.UtZ8S9be-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but not used [-Wunused-const-variable=]
     115 | static const struct arizona_micd_range micd_ctp_ranges[] = {
         |                                        ^~~~~~~~~~~~~~~


vim +/micd_ctp_ranges +115 drivers/mfd/arizona-i2c.c

   113	
   114	/***********WM8280 Codec Driver platform data*************/
 > 115	static const struct arizona_micd_range micd_ctp_ranges[] = {
   116		{ .max =  11, .key = BTN_0 },
   117		{ .max =  28, .key = BTN_1 },
   118		{ .max =  54, .key = BTN_2 },
   119		{ .max = 100, .key = BTN_3 },
   120		{ .max = 186, .key = BTN_4 },
   121		{ .max = 430, .key = BTN_5 },
   122	};
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
