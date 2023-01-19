Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89D733FB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 09:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674120706; x=1705656706;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cCRrU41mNSuE2R7OUcUo6WACp2/sQRHkG/grHhckn+E=;
  b=PqD+M1k8r6AhyJ+BTCp6Rp4xBJYx+J3mv2eoTzrirp/iI6Zl45QsQoqj
   /btPUwsVNVAlnPZBSdbK5QMJfGcoYxyns9Y2V3T6jvXpaB4/6AF1Os6SQ
   yX4gID2CW9kM66NW5/CqBI6lNGRGRkeT20wc+Lz5go7Re/sggITj5vB2n
   +TRfy8Hg5+WaZvv+82NQqgsb/MLMmMfPauiDqR2BnUHVAzt4iZC+9zxsn
   DvqetJBubnp1Oq+PO/LVGLNpjyVC2GLFDynn4Ix5KeEa3PRX75sIiu8Fp
   OSE+IYkuj1eH92+zkXMnvXP1GFm7v1rbZ5vmiTpv4UsuyT5q8sF+KF3mH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308797428"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="308797428"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 01:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="690566114"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="690566114"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 01:31:45 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIRGq-0001LY-0f;
	Thu, 19 Jan 2023 09:31:44 +0000
Date: Thu, 19 Jan 2023 17:31:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>
Subject: [intel-lts:5.15/preempt-rt 14437/21928]
 sound/soc/codecs/es8326.c:719:35: warning: unused variable 'es8326_i2c_id'
Message-ID: <202301191714.zpDcYfUT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yangxiaohua,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/preempt-rt
head:   616223323be527ff85db4026f7fcf4a296ad5b16
commit: db5730f660ea0aa791b955cc01eb4c996a27f520 [14437/21928] ASoC: codecs: add support for ES8326
config: hexagon-randconfig-r041-20230118 (https://download.01.org/0day-ci/archive/20230119/202301191714.zpDcYfUT-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/db5730f660ea0aa791b955cc01eb4c996a27f520
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/preempt-rt
        git checkout db5730f660ea0aa791b955cc01eb4c996a27f520
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/es8326.c:719:35: warning: unused variable 'es8326_i2c_id' [-Wunused-const-variable]
   static const struct i2c_device_id es8326_i2c_id[] = {
                                     ^
   1 warning generated.


vim +/es8326_i2c_id +719 sound/soc/codecs/es8326.c

   717	
   718	#ifdef CONFIG_OF
 > 719	static const struct i2c_device_id es8326_i2c_id[] = {
   720		{"es8326", 0 },
   721		{}
   722	};
   723	MODULE_DEVICE_TABLE(i2c, es8326_i2c_id);
   724	#endif
   725	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
