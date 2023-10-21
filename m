Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3D520B1B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 23:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIMtnwFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697930009; x=1729466009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NN2sFMZBAZv+NFJKTpM6iV1KQHSq07hy8v/KihsUGUE=;
  b=dIMtnwFJIKzgT9X14lgoxw1eebKOFvCSGTm9h4uGG5Nkolvy9GOBZgUr
   nV0BbBsOTCfpL3XS4tpEVEm7ORlGafzCFp/beejDcDKFi5w8IogTFps/c
   4DCCEowFAD0Z5FOajhkkEky1b5SDYmLHI6xvf1CBsyGinwBncLGNmiUW3
   B2vFkkfYxzIxzyxdH4F1YRyGZoKURqiV4nE3ZC/7V43wVzVYg/ejvP+kj
   njlPQVQqSGUDg3ucU7OariSkkNOmqjL5BXEK/amUgAoWyMEzgOOlH37nq
   yfVoT9GPRiuf5EQjiz/Cv6wnGlC2f2r7HgklUGkSO8xQMSePbFckyPavu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="389517681"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="389517681"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 16:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="707562588"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="707562588"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Oct 2023 16:13:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quL9p-0005KM-25;
	Sat, 21 Oct 2023 23:13:25 +0000
Date: Sun, 22 Oct 2023 07:12:53 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Stefan Berger <stefanb@linux.ibm.com>
Subject: [robertosassu:ima-evm-lsms-v4-devel-v7 22/25]
 security/integrity/ima/ima_main.c:1139:9: error: too many arguments to
 function 'init_ima_appraise_lsm'
Message-ID: <202310220755.Gks7N77h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-evm-lsms-v4-devel-v7
head:   2976de96a8d924f6048d1723d0834136314cbae1
commit: df77cb3dab888d2e6ae2fd649f57df0aedb13463 [22/25] ima: Move IMA-Appraisal to LSM infrastructure
config: csky-randconfig-001-20231022 (https://download.01.org/0day-ci/archive/20231022/202310220755.Gks7N77h-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220755.Gks7N77h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220755.Gks7N77h-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/integrity/ima/ima_main.c: In function 'init_ima_lsm':
>> security/integrity/ima/ima_main.c:1139:9: error: too many arguments to function 'init_ima_appraise_lsm'
    1139 |         init_ima_appraise_lsm(&ima_lsmid);
         |         ^~~~~~~~~~~~~~~~~~~~~
   In file included from security/integrity/ima/ima_main.c:29:
   security/integrity/ima/ima.h:389:27: note: declared here
     389 | static inline void __init init_ima_appraise_lsm(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~


vim +/init_ima_appraise_lsm +1139 security/integrity/ima/ima_main.c

  1134	
  1135	static int __init init_ima_lsm(void)
  1136	{
  1137		integrity_iintcache_init(&ima_lsmid);
  1138		security_add_hooks(ima_hooks, ARRAY_SIZE(ima_hooks), &ima_lsmid);
> 1139		init_ima_appraise_lsm(&ima_lsmid);
  1140		return 0;
  1141	}
  1142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
