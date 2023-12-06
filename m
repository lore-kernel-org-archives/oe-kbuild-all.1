Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A185B650
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 00:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWZ7ZGDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701823864; x=1733359864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jv4svasYOF+4scPuaHpqfLM+CS2ySQyj6VLjp/u2baY=;
  b=SWZ7ZGDQ3eOWJs/6WfBqnAUZDJEXemSkrBQEiEakJBCosxgLQJTToUPH
   m/++Up3D6GZi/qY10oRrXCQ8OcOYFmuO8rpGu2LgozD40HF/mGj/hq2/c
   21m7ekDk3JtCjbeBljvHbYelZgqSwTh05+c4Hdb6nsXiwdOtl9RJLgmws
   HSnb43DY5VFm5Jinh9Pj69bo8Cvm2swS57A3EBd/Fj4xjEOD/7Gc4GY4g
   3Y3uw8BWFRQD+KCu+XY9TEgeT0FD7hRhLglETGprCV9aacY66Bi+rV4dd
   unuHBSuh8e8ZzUddrdz+x8mRVDKXUIdNViBw8ZuA2+K5Ub9+OM/4aJrpd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12698968"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="12698968"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 16:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841652270"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="841652270"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 16:51:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAg7v-0009yn-0h;
	Wed, 06 Dec 2023 00:50:59 +0000
Date: Wed, 6 Dec 2023 08:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Casey Schaufler <casey@schaufler-ca.com>
Subject: [robertosassu:ima-evm-lsms-v7-devel-v3 26/26]
 security/integrity/iint.c:36:undefined reference to `integrity_blob_sizes'
Message-ID: <202312060809.cubJh3mA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-evm-lsms-v7-devel-v3
head:   60b26e5290904a6e450fa5a28921b9df6753adc1
commit: 60b26e5290904a6e450fa5a28921b9df6753adc1 [26/26] integrity: Switch from rbtree to LSM-managed blob for integrity_iint_cache
config: arm-omap1_defconfig (https://download.01.org/0day-ci/archive/20231206/202312060809.cubJh3mA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060809.cubJh3mA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060809.cubJh3mA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: security/integrity/iint.o: in function `integrity_iint_find':
>> security/integrity/iint.c:36:(.text+0x38): undefined reference to `integrity_blob_sizes'
   arm-linux-gnueabi-ld: security/integrity/iint.o: in function `integrity_inode_get':
   security/integrity/iint.c:112:(.text+0xfc): undefined reference to `integrity_blob_sizes'
   arm-linux-gnueabi-ld: security/integrity/iint.o: in function `integrity_inode_free':
   security/integrity/iint.c:131:(.text+0x160): undefined reference to `integrity_blob_sizes'


vim +36 security/integrity/iint.c

0c343af8065be5 Matthew Garrett 2018-05-11  26  
f381c272224f5f Mimi Zohar      2011-03-09  27  /*
f381c272224f5f Mimi Zohar      2011-03-09  28   * integrity_iint_find - return the iint associated with an inode
f381c272224f5f Mimi Zohar      2011-03-09  29   */
f381c272224f5f Mimi Zohar      2011-03-09  30  struct integrity_iint_cache *integrity_iint_find(struct inode *inode)
f381c272224f5f Mimi Zohar      2011-03-09  31  {
f381c272224f5f Mimi Zohar      2011-03-09  32  	if (!IS_IMA(inode))
f381c272224f5f Mimi Zohar      2011-03-09  33  		return NULL;
f381c272224f5f Mimi Zohar      2011-03-09  34  
60b26e5290904a Roberto Sassu   2023-11-29  35  	return integrity_inode_get_iint(inode);
f381c272224f5f Mimi Zohar      2011-03-09 @36  }
f381c272224f5f Mimi Zohar      2011-03-09  37  

:::::: The code at line 36 was first introduced by commit
:::::: f381c272224f5f158f5cff64f8f3481fa0eee8b3 integrity: move ima inode integrity data management

:::::: TO: Mimi Zohar <zohar@linux.vnet.ibm.com>
:::::: CC: Mimi Zohar <zohar@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
