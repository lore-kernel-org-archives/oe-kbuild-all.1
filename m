Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278206FA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 20:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679343898; x=1710879898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0wWb/ttSnVnJrRVv3LksTgMtdcJCFX+sb8TNJiqig/k=;
  b=PWWfOeQPGPJOeM2Vln4y5sezuThtjoCJio1jlrZ16PVeW4j0G+HHEaPI
   PFIV4/6RNp8tEqUoTJNF+R8SXiyjReMbkBT/uOFJX9o7YvrKooIfrCPdF
   Qu0ws5kTGDcJK7VSDhgfl1aYzQ1eN/YUTqkZi8EWm8CVAAA+AtPM0vMsG
   qnyA42DXtI8q+8QHqSIORjjn0Ha77Pk0SsdSPK/t3Y8qDuHM1Y5jZx+Tu
   22m+BV7uhxolzCXjIJ5RZQOc3HfnZgnZUT+Ey4qL6pO+pWpdU1KjP8K8k
   vg2dZU3aBHLuG2PK++LF/4pfjVU/G+KBlmKqq/hSNHJuCAerWPl79LkI9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="425044672"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="425044672"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 13:24:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="683568976"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="683568976"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Mar 2023 13:24:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peM3r-000BI8-2v;
	Mon, 20 Mar 2023 20:24:55 +0000
Date: Tue, 21 Mar 2023 04:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:master 3/3] drivers/char/tpm/tpm-chip.c:531:15: error:
 too many arguments to function 'tpm_request_locality'
Message-ID: <202303210426.4zyU7h6B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git master
head:   923c8dfa9a3640d4dcedd7df12b53254f7e6e4fc
commit: 923c8dfa9a3640d4dcedd7df12b53254f7e6e4fc [3/3] tpm: fix build break in tpm-chip.c caused by AMD fTPM quirk
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230321/202303210426.4zyU7h6B-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=923c8dfa9a3640d4dcedd7df12b53254f7e6e4fc
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd master
        git checkout 923c8dfa9a3640d4dcedd7df12b53254f7e6e4fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210426.4zyU7h6B-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/tpm/tpm-chip.c: In function 'tpm_amd_is_rng_defective':
>> drivers/char/tpm/tpm-chip.c:531:15: error: too many arguments to function 'tpm_request_locality'
     531 |         ret = tpm_request_locality(chip, 0);
         |               ^~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm-chip.c:35:12: note: declared here
      35 | static int tpm_request_locality(struct tpm_chip *chip)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/tpm_request_locality +531 drivers/char/tpm/tpm-chip.c

   513	
   514	/*
   515	 * Some AMD fTPM versions may cause stutter
   516	 * https://www.amd.com/en/support/kb/faq/pa-410
   517	 *
   518	 * Fixes are available in two series of fTPM firmware:
   519	 * 6.x.y.z series: 6.0.18.6 +
   520	 * 3.x.y.z series: 3.57.y.5 +
   521	 */
   522	static bool tpm_amd_is_rng_defective(struct tpm_chip *chip)
   523	{
   524		u32 val1, val2;
   525		u64 version;
   526		int ret;
   527	
   528		if (!(chip->flags & TPM_CHIP_FLAG_TPM2))
   529			return false;
   530	
 > 531		ret = tpm_request_locality(chip, 0);
   532		if (ret)
   533			return false;
   534	
   535		ret = tpm2_get_tpm_pt(chip, TPM2_PT_MANUFACTURER, &val1, NULL);
   536		if (ret)
   537			goto release;
   538		if (val1 != 0x414D4400U /* AMD */) {
   539			ret = -ENODEV;
   540			goto release;
   541		}
   542		ret = tpm2_get_tpm_pt(chip, TPM2_PT_FIRMWARE_VERSION_1, &val1, NULL);
   543		if (ret)
   544			goto release;
   545		ret = tpm2_get_tpm_pt(chip, TPM2_PT_FIRMWARE_VERSION_2, &val2, NULL);
   546	
   547	release:
   548		tpm_relinquish_locality(chip);
   549	
   550		if (ret)
   551			return false;
   552	
   553		version = ((u64)val1 << 32) | val2;
   554		if ((version >> 48) == 6) {
   555			if (version >= 0x0006000000180006ULL)
   556				return false;
   557		} else if ((version >> 48) == 3) {
   558			if (version >= 0x0003005700000005ULL)
   559				return false;
   560		} else {
   561			return false;
   562		}
   563	
   564		dev_warn(&chip->dev,
   565			 "AMD fTPM version 0x%llx causes system stutter; hwrng disabled\n",
   566			 version);
   567	
   568		return true;
   569	}
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
