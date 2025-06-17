Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C052BEC53
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750158327; cv=none; b=jQlB13B7MAVwA7TGCMDsLY02U1TAlYiWHgNQZWZbvjIk307wz55Wm3kLYZM/8Qw2dWWp5dGyjG+cQH+ZQ+fZwIQnF2JNMP14hmAz8QC6HZl+jCeQeN35373iuuuhRbNLe7fIDHSS4KRunfxtu+z1bkEbNnYccIy+C8COS+TY6yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750158327; c=relaxed/simple;
	bh=DQEB/99wtPNlgkIO5ufGXXu8h3ZaK2kscFTHOsFOreA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UEa35X8qVtsiS5eLRu5hGZNmyZFDk3/PGIOn01PgQA+F1EjW0lvOdkC6/q77HBmO1WhpxIJztynedzC+j36R6Y687pL215Vq1QwqW3ryvKIYWiipJ9xPdxIRf9nlStftSlJIYMHZ6cv6W9pgJ2bNGAYmj0Utngbiq7dO6ldH2cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bx2D1o7I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bx2D1o7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750158324; x=1781694324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DQEB/99wtPNlgkIO5ufGXXu8h3ZaK2kscFTHOsFOreA=;
  b=Bx2D1o7I31+vWQyoA8CgGJblgQzMLEFYaPAuONWGOUycWnUtYKaDpLdQ
   jfATowbQ0Xki5U/NzuEu5OiO1EhfRTUsN7kF74APVHvcU7hHHKtJJ2bt1
   bwPjO6Jp3M2mULWDBR6ud73Rrdw4A5Ch6ZzIP9YUBH7n8CAOKu/tbOauL
   QPJpPgPgRZUkPGkjV6zEsurFLnECINke1IZj4NwcvYXGQBkXHN21PTWfI
   785LXMeQ+vIau6+m+V9ZZEZ1H3+RXpVjESNp45eQVFbpQdzcwb//Sst0/
   Efsl7Xx+keltv3zrwZc0gA0vGrP9K/EJaV2KRBkLO4TmkEq+SZN54oW8F
   w==;
X-CSE-ConnectionGUID: QdD4fDt2SGOw1SWCRGX5dg==
X-CSE-MsgGUID: lvv8SLuaRqaV/D3CfT1wmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56139504"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="56139504"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 04:05:23 -0700
X-CSE-ConnectionGUID: k6nBZtHYQOipMil5tQrXuQ==
X-CSE-MsgGUID: VMqnPyuBThOMv+XsFU0D+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="153710425"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2025 04:05:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRU7x-000FuY-2O;
	Tue, 17 Jun 2025 11:05:17 +0000
Date: Tue, 17 Jun 2025 19:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2402/2402]
 drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202506171917.ZRsHM8H2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d3579957da63905946df7e8532b8ef9ad53c5d04
commit: 5deaf74c4b3edcf88f67f18aa352690deb9dc212 [2402/2402] drivers: initial support for rnpm drivers from Mucse Technology
config: x86_64-randconfig-r123-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171917.ZRsHM8H2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171917.ZRsHM8H2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171917.ZRsHM8H2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:572:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:572:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:572:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:926:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:926:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:926:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1039:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1039:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1039:41: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1039:41: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1046:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1046:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1046:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1046:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1048:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1048:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1048:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1048:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1050:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1050:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1050:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1050:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1067:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1067:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1067:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1067:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1106:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1106:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1106:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1139:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1139:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1139:41: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1139:41: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1149:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1149:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1149:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1149:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1150:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1150:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1150:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1150:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1152:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1152:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1152:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1152:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1154:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1154:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1154:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1154:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1179:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1179:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1179:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1179:16: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1182:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1182:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1182:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1182:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1196:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1196:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1196:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1196:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1200:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1200:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1200:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1200:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1204:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1204:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1204:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1204:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1185:6: sparse: sparse: symbol 'rnpm_setup_layer2_remapping' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse:     expected unsigned int val
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse:     expected unsigned int val
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1233:26: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1233:22: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1233:22: sparse:    left side has type unsigned int
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1233:22: sparse:    right side has type restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1238:26: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1238:26: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1243:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1243:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1243:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1243:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1267:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1267:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1267:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1267:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1272:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1272:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1272:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1272:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1275:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1275:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1275:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1275:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1209:6: sparse: sparse: symbol 'rnpm_setup_tuple5_remapping' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1293:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1293:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1293:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1293:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse:     expected unsigned int val
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse:     expected unsigned int val
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1302:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1302:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1302:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1302:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1303:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1303:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1303:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1303:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse:     expected unsigned int val
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse:     expected unsigned int val
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1311:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1311:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1311:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1311:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1312:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1312:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1312:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1312:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1315:26: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1315:26: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1316:31: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1316:31: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1320:26: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1320:22: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1320:22: sparse:    left side has type unsigned int
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1320:22: sparse:    right side has type restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1321:31: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1321:27: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1321:27: sparse:    left side has type unsigned int
--
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:446:5: sparse: sparse: symbol 'rnpm_reset_pipeline_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:476:26: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:476:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:476:26: sparse:     expected void const [noderef] __iomem *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:476:26: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:478:20: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:478:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:478:20: sparse:     expected void [noderef] __iomem *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:478:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:479:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:479:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:479:26: sparse:     expected void const [noderef] __iomem *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:479:26: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:481:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:481:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:481:20: sparse:     expected void [noderef] __iomem *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:481:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:483:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:483:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:483:26: sparse:     expected void const [noderef] __iomem *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:483:26: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:485:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:485:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:485:20: sparse:     expected void [noderef] __iomem *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:485:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:486:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:486:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:486:26: sparse:     expected void const [noderef] __iomem *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:486:26: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:488:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:488:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:488:20: sparse:     expected void [noderef] __iomem *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:488:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:553:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:553:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:553:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:553:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:555:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:555:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:555:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:555:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:556:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:556:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:556:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:556:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:558:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:558:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:558:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:558:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:561:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:561:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:561:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:561:9: sparse:     got void *
--
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5940:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5940:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5940:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5947:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5947:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5947:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5947:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5948:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5948:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5948:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5948:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5949:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5949:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5949:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5949:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5950:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5950:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5950:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5950:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5954:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5954:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5954:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5954:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5955:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5955:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5955:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5955:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5962:21: sparse: sparse: symbol 'wait_all_port_resetting' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5974:21: sparse: sparse: symbol 'clean_all_port_resetting' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6003:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6003:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6003:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6003:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6185:5: sparse: sparse: symbol 'rnpm_check_mc_addr' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6211:6: sparse: sparse: symbol 'update_pf_vlan' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6262:6: sparse: sparse: symbol 'rnpm_pf_service_task' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6436:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] mac_ip_len @@     got long @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6436:27: sparse:     expected restricted __le32 [usertype] mac_ip_len
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6436:27: sparse:     got long
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6437:27: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6437:27: sparse:    left side has type restricted __le32
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6437:27: sparse:    right side has type long
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6483:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] old @@     got restricted __be16 [usertype] frag_off @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6483:32: sparse:     expected unsigned short [usertype] old
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6483:32: sparse:     got restricted __be16 [usertype] frag_off
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6485:33: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6485:33: sparse:    left side has type restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6485:33: sparse:    right side has type int
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6489:58: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6489:69: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __wsum [usertype] diff @@     got int @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6489:69: sparse:     expected restricted __wsum [usertype] diff
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6489:69: sparse:     got int
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6611:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] mac_ip_len @@     got int @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6611:27: sparse:     expected restricted __le32 [usertype] mac_ip_len
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6611:27: sparse:     got int
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6654:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6766:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6766:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6766:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6766:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6842:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] mac_ip_len @@     got int @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6842:27: sparse:     expected restricted __le32 [usertype] mac_ip_len
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6842:27: sparse:     got int
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7422:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7422:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7422:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7422:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7425:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7425:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7425:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7425:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7437:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7437:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7437:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7437:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7445:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7445:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7445:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7445:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7535:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7535:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7535:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7535:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7528:6: sparse: sparse: symbol 'rnpm_clear_udp_tunnel_port' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be16 [usertype] vxlan_port @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse:     expected unsigned int val
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse:     got restricted __be16 [usertype] vxlan_port
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7667:29: sparse: sparse: symbol 'rnpm_netdev_ops' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7692:6: sparse: sparse: symbol 'rnpm_assign_netdev_ops' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7785:6: sparse: sparse: symbol 'rnpm_fix_queue_number' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7961:36: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8025:36: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8055:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8055:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8055:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8055:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8281:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8281:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8281:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8281:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8451:27: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8451:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8451:27: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8451:27: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8452:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8452:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8452:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8452:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8760:5: sparse: sparse: symbol 'rnpm_can_rpu_start' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:637:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:637:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:637:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:637:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:575:31: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:598:26: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: note: in included file (through drivers/net/ethernet/mucse/rnpm/rnpm.h):
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     got void *

vim +1221 drivers/net/ethernet/mucse/rnpm/rnpm_lib.c

  1208	
  1209	void rnpm_setup_tuple5_remapping(struct rnpm_hw *hw,
  1210					 union rnpm_atr_input *input, u16 hw_id,
  1211					 u8 queue)
  1212	{
  1213		u32 port = 0;
  1214		u8 mask_temp = 0;
  1215		u8 l4_proto_type = 0;
  1216		struct rnpm_adapter *adapter = (struct rnpm_adapter *)hw->back;
  1217		u8 offset = adapter->port;
  1218	
  1219		drection_dbg("try to eable tuple 5 %x\n", hw_id);
  1220		if (input->formatted.src_ip[0] != 0)
> 1221			wr32(hw, RNPM_ETH_TUPLE5_SAQF(hw_id),
  1222			     htonl(input->formatted.src_ip[0]));
  1223		else
  1224			mask_temp |= RNPM_SRC_IP_MASK;
  1225	
  1226		if (input->formatted.dst_ip[0] != 0) {
  1227			wr32(hw, RNPM_ETH_TUPLE5_DAQF(hw_id),
  1228			     htonl(input->formatted.dst_ip[0]));
  1229		} else
  1230			mask_temp |= RNPM_DST_IP_MASK;
  1231	
  1232		if (input->formatted.src_port != 0)
  1233			port |= (htons(input->formatted.src_port));
  1234		else
  1235			mask_temp |= RNPM_SRC_PORT_MASK;
  1236	
  1237		if (input->formatted.dst_port != 0)
  1238			port |= (htons(input->formatted.dst_port) << 16);
  1239		else
  1240			mask_temp |= RNPM_DST_PORT_MASK;
  1241	
  1242		if (port != 0)
  1243			wr32(hw, RNPM_ETH_TUPLE5_SDPQF(hw_id), port);
  1244	
  1245		switch (input->formatted.flow_type) {
  1246		case RNPM_ATR_FLOW_TYPE_TCPV4:
  1247			l4_proto_type = IPPROTO_TCP;
  1248			break;
  1249		case RNPM_ATR_FLOW_TYPE_UDPV4:
  1250			l4_proto_type = IPPROTO_UDP;
  1251			break;
  1252		case RNPM_ATR_FLOW_TYPE_SCTPV4:
  1253			l4_proto_type = IPPROTO_SCTP;
  1254			break;
  1255		case RNPM_ATR_FLOW_TYPE_IPV4:
  1256			l4_proto_type = input->formatted.inner_mac[0];
  1257			break;
  1258		default:
  1259			l4_proto_type = 0;
  1260		}
  1261	
  1262		if (l4_proto_type == 0)
  1263			mask_temp |= RNPM_L4_PROTO_MASK;
  1264	
  1265		/* setup ftqf*/
  1266		/* always set 0x3 */
  1267		wr32(hw, RNPM_ETH_TUPLE5_FTQF(hw_id),
  1268		     (1 << 31) | (mask_temp << 25) | (l4_proto_type << 16) | 0x3);
  1269	
  1270		/* setup action */
  1271		if (queue == RNPM_FDIR_DROP_QUEUE) {
  1272			wr32(hw, RNPM_ETH_TUPLE5_POLICY(hw_id), (0x1 << 31));
  1273		} else {
  1274			/* setup ring_number */
  1275			wr32(hw, RNPM_ETH_TUPLE5_POLICY(hw_id),
  1276			     ((0x1 << 30) | ((queue - offset) << 20)));
  1277		}
  1278	}
  1279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
