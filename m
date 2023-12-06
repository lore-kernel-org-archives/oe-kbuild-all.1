Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C8430CF0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 11:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iw7gQAWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701861979; x=1733397979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EL8SUdmJMCaW2hk0ifZ3s6ze9++NZFlPrOx39W+8vko=;
  b=Iw7gQAWABwXB6sMFXNVydrTRa0TpR9vDNgB0cYiOgCo/u9Sl1J7Hj1f4
   FBhAeMlsJ2necIWKhsTJRrKJ7En83e5URB4aKEFkGTo0b+JQo/qMGVD2/
   hccJwJmsN7r4k96XZj05AsKI5ItOSg8PCVsBTG4fuhfxK52rdJsGdXiAx
   v79z76IM+LpbMl7Wk+6C9azhJ7f4lWJanIMzCbqrENepTg6FLgU8yO7dM
   9xYkDjCWU24dGlfYGHxb7gXebwa5r7HJ9QLyyMp3wBUa5E2frGJmqia53
   MIyIQRAZMAHCponIYyknaa7ljwu+2XTOGTB4BylkQ0hz1uYZ6VxVd9wJ2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="15595685"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="15595685"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 03:26:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841809762"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="841809762"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 06 Dec 2023 03:26:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAq2e-000Aho-2L;
	Wed, 06 Dec 2023 11:26:12 +0000
Date: Wed, 6 Dec 2023 19:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Casey Schaufler <casey@schaufler-ca.com>
Subject: [robertosassu:ima-evm-lsms-v7-devel-v3 26/26] iint.c:undefined
 reference to `integrity_blob_sizes'
Message-ID: <202312061917.jjCnzHeV-lkp@intel.com>
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
config: i386-defconfig (https://download.01.org/0day-ci/archive/20231206/202312061917.jjCnzHeV-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061917.jjCnzHeV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061917.jjCnzHeV-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: security/integrity/iint.o: in function `integrity_iint_find':
>> iint.c:(.text+0x8d): undefined reference to `integrity_blob_sizes'
   ld: security/integrity/iint.o: in function `integrity_inode_get':
   iint.c:(.text+0xb4): undefined reference to `integrity_blob_sizes'
>> ld: iint.c:(.text+0x126): undefined reference to `integrity_blob_sizes'
   ld: security/integrity/iint.o: in function `integrity_inode_free':
   iint.c:(.text+0x153): undefined reference to `integrity_blob_sizes'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
