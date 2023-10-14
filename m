Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2F77E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 04:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJI4l/iW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697258938; x=1728794938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cZUgZ12rQEm8kQ/Nb0svTHzlnfxWqig7AFtHb6su7xI=;
  b=VJI4l/iWxWLSnXsbS+S3DjuMWLVzr1zpTT1vlN7nKPTyfmxmwMcLdzHD
   Xd+bkzHZE/rbLNyBaFjliWKhuFGuFVwyVesuTJZ4HLQ18NJE60n5PPM+Q
   yVe2/sLM4eTGS3Pr5BDTKcS1Rsze3GFVMdJm3LEs0V1Y87AOVQCIHVtaf
   1LC1pdFvvgFrdQaJ2QQ3q9QTHldWLlunPJ2R4PkEmHjlaUx/uB1IKANtZ
   KyJM4VgcUaKcBoizWzD1Udml7RRstIL+mNFWRfOsH+GwB8mFYp5RMacw3
   y9DAXGX0/Xz/LBAVq2gJh9ojQSY7fvSQ9i0srAYiely1OJmQIxhrWc4xZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="6865803"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="6865803"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 21:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086393568"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1086393568"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2023 21:48:55 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrWa5-0005iH-1r;
	Sat, 14 Oct 2023 04:48:53 +0000
Date: Sat, 14 Oct 2023 12:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liu-song-6:bpf-fsverity-kfunc 2/5] measure.c:undefined reference to
 `__bpf_dynptr_size'
Message-ID: <202310141223.nPxIr8Bb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/liu-song-6/linux.git bpf-fsverity-kfunc
head:   1dc94c536fe6c5f3da4712d746698a38fdce474e
commit: 985728b637a47855dbf4c23c3e346fc51b647fbf [2/5] bpf, fsverity: Add kfunc bpf_get_fsverity_digest
config: csky-randconfig-002-20231014 (https://download.01.org/0day-ci/archive/20231014/202310141223.nPxIr8Bb-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141223.nPxIr8Bb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141223.nPxIr8Bb-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: fs/verity/measure.o: in function `bpf_get_fsverity_digest':
>> measure.c:(.text+0xfe): undefined reference to `__bpf_dynptr_size'
>> csky-linux-ld: measure.c:(.text+0x124): undefined reference to `__bpf_dynptr_size'
   csky-linux-ld: measure.c:(.text+0x178): undefined reference to `__bpf_dynptr_size'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
