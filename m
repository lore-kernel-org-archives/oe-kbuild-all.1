Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3BD652
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 22:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691015856; x=1722551856;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4S3IF0RAhW42ZjBIxofsaWIMpjQYbrQax1eqiAvEwZw=;
  b=I9rPj9/nvODy+h/2MB5WlbsNCiaiSTqCo9b3K60sN+zDuWaJ0edC+nOg
   Khi2Soet+QkN08VP5vZ2EqPvJsI31emRmv47HjaWwnbGazuBsMhgSxUBH
   ckyFqie0bMSBWleSeewK7jAodwFvoSRTwckFEdCDWhY+tKhijOfNu0gm5
   XLDCziCuRx5Ftp/5zA/lUYRV6FGPVOfPQkZb/M99+INkllqoZa+46s0i7
   XAjScPwGTAbYNBmISm7Z3rD+SzKdzUO2A1ET5mm4S2Fseg4f33A4yg57y
   mGe9oJ7ytwSNxUx45eM3bO6lba90Fr/hla4v581Jgv06Fd2VzV4z9EtSj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="433557740"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="433557740"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 15:37:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="794763659"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="794763659"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Aug 2023 15:37:31 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRKTD-0001XQ-07
	for oe-kbuild-all@lists.linux.dev;
	Wed, 02 Aug 2023 22:37:31 +0000
Date: Thu, 3 Aug 2023 06:36:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 13446/30000]
 drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected declaration specifiers
 or '...' before string constant
Message-ID: <202308030607.vJmdsaU7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   7f46da99d47faba52b98b09371755ba4821a116d
commit: 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5 [13446/30000] ANDROID: GKI: drivers: qcom: rpmh-rsc: Add tristate support for qcom,rpmh-rsc driver
config: sparc-randconfig-r033-20230801 (https://download.01.org/0day-ci/archive/20230803/202308030607.vJmdsaU7-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030607.vJmdsaU7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308030607.vJmdsaU7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected declaration specifiers or '...' before string constant
     697 | MODULE_LICENSE("GPL v2");
         |                ^~~~~~~~
   drivers/soc/qcom/rpmh-rsc.c:698:20: error: expected declaration specifiers or '...' before string constant
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +697 drivers/soc/qcom/rpmh-rsc.c

   696	
 > 697	MODULE_LICENSE("GPL v2");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
