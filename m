Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AE818017
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689265255; x=1720801255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hhnAYxHzxKHq9p/Mfm2Bs798Bq3XhKLq7FMW2FjdPtI=;
  b=WmADgoQEY2/B32m5n36icxg2ERqb2e4yt9+keoKleajNDyIWtUBCJTDv
   kf1VDudMwuihhjtwqO2Itnq08L4d9FD4FeK122LsqR5kdv0VOOh3LXeYQ
   vjdvIsHCsUVIHMrwkSiswromgh+HG4NpYmoa6dayrqVN9XZRg9bIQjJTF
   /PCLCBmh029lmNrBxngOO1pothQqjHeJC/AX4XhQZ8k5FLtnIzqhA8dtf
   6Je/gykki7Q82meq15blbHevmZ9KtWv/9VtavwOWnIO3Fl2C8ABsJHYaK
   LN20xkBcTyeJyrCMeff2Dz+7/H/ivxbTT1fVDzbIqsu2bLbgcDVnhi2tE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364109492"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="364109492"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 09:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="672329834"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="672329834"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Jul 2023 09:20:01 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJz2u-0006kD-1s;
	Thu, 13 Jul 2023 16:20:00 +0000
Date: Fri, 14 Jul 2023 00:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: oe-kbuild-all@lists.linux.dev, Hu Haowen <src.res.211@gmail.com>
Subject: [srcres258-doc:next 1/1] fs/overlayfs/params.c:76:20: error: static
 declaration of 'ovl_uuid_mode' follows non-static declaration
Message-ID: <202307140024.szefTCRY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/srcres258/linux-doc next
head:   b4e2d222bd127435b269f412267f06d9f3fce1ba
commit: b4e2d222bd127435b269f412267f06d9f3fce1ba [1/1] Merge commit 'da8103dafcdb78f32900dd6fbe507b16b510edfb' into next
config: microblaze-randconfig-r021-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140024.szefTCRY-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140024.szefTCRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140024.szefTCRY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/overlayfs/params.c:76:20: error: static declaration of 'ovl_uuid_mode' follows non-static declaration
      76 | static const char *ovl_uuid_mode(struct ovl_config *config)
         |                    ^~~~~~~~~~~~~
   In file included from fs/overlayfs/params.c:12:
   fs/overlayfs/params.h:43:13: note: previous declaration of 'ovl_uuid_mode' with type 'const char *(struct ovl_config *)'
      43 | const char *ovl_uuid_mode(struct ovl_config *config);
         |             ^~~~~~~~~~~~~
>> fs/overlayfs/params.c:81:12: error: static declaration of 'ovl_uuid_def' follows non-static declaration
      81 | static int ovl_uuid_def(void)
         |            ^~~~~~~~~~~~
   fs/overlayfs/params.h:44:5: note: previous declaration of 'ovl_uuid_def' with type 'int(void)'
      44 | int ovl_uuid_def(void);
         |     ^~~~~~~~~~~~


vim +/ovl_uuid_mode +76 fs/overlayfs/params.c

4e261f12aa7a13 Amir Goldstein 2023-06-26  75  
4e261f12aa7a13 Amir Goldstein 2023-06-26 @76  static const char *ovl_uuid_mode(struct ovl_config *config)
4e261f12aa7a13 Amir Goldstein 2023-06-26  77  {
4e261f12aa7a13 Amir Goldstein 2023-06-26  78  	return ovl_parameter_uuid[config->uuid].name;
4e261f12aa7a13 Amir Goldstein 2023-06-26  79  }
4e261f12aa7a13 Amir Goldstein 2023-06-26  80  
4e261f12aa7a13 Amir Goldstein 2023-06-26 @81  static int ovl_uuid_def(void)
4e261f12aa7a13 Amir Goldstein 2023-06-26  82  {
0a3bf81dbcb228 Amir Goldstein 2023-07-07  83  	return OVL_UUID_AUTO;
4e261f12aa7a13 Amir Goldstein 2023-06-26  84  }
4e261f12aa7a13 Amir Goldstein 2023-06-26  85  

:::::: The code at line 76 was first introduced by commit
:::::: 4e261f12aa7a13f10cab35b67947a103ccef5e1c ovl: add support for unique fsid per instance

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Amir Goldstein <amir73il@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
