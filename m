Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5387040DFC1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 00:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777507634; cv=none; b=mpTVBpG1FaQlZoXFsSzE6bPbI9WiQCAdkIyaOzE7YCxja5Gywsglfjh9YMDhe41LA3ys2J/1oMp9PazkLUmF79LlCZWlATAaE1mk3/2v2sF9GeAcwuvU4RWpaQtTAEovt9dv++heP74BYOkJ7BeP3d/Jkvt+RazxqVsvO5oKZZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777507634; c=relaxed/simple;
	bh=Y/TivcemoYAGxg/QPRbv4v9iV3kHJEr5I1tcrc5B8Lw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OR2ncReijo+EevoDYTi9nRClLH81cffHkkFjWc83JREIYF8dTZtaWjC/QMK3BeBN5wCCnbEQps+trzn5R7SYrkHeM0aaERRp5uMMee6bveDBYWBfmM06+m39yRfKI2txN31ieo6nfppEP1mfR1KDDZ9usePrT8weMISczqXqzWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1um5qdA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1um5qdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777507633; x=1809043633;
  h=date:from:to:cc:subject:message-id;
  bh=Y/TivcemoYAGxg/QPRbv4v9iV3kHJEr5I1tcrc5B8Lw=;
  b=Y1um5qdAQHzikeHLiHcw34EtsUlopnQFKSIMvGySm9fI+7zW3yI+EsVv
   gGvWQCiSNoKY3UGvS3lP0Jl5GFQQQeCGbuUv5KwxmamHpBsf4HwVsfZ9i
   sTh14ipmuZFUb6CejwveUTGF/xSxD68eKUYb93e9ekUS1rXe2yHbtZrsm
   k5Tz6J5rb6RBZ6LuXGQ7PtJNrhVZs18/mmAAs+QI2gJ2IDCd4bkxsH4V1
   z6yHT02DNp4iMgYIDAe8KiRkPHn9sy5WIqHnC0RxC5Ebq81daSH603Wdg
   z96cXajJ/j6MH9lIjkpCQZVVpWE+uSGERJcGDg1/oZl25eaUqtRiqVJrr
   A==;
X-CSE-ConnectionGUID: 2bFymSnZQpWl2Ir8zNbo+g==
X-CSE-MsgGUID: q9yzqkSXR3u02Rwac1wF6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="96014446"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="96014446"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 17:07:12 -0700
X-CSE-ConnectionGUID: dDuf9eKiReu+jlLKETYQcw==
X-CSE-MsgGUID: 8n55a7y6RfChO1+oVhUNOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="239402352"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2026 17:07:11 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIEvs-00000000Bge-3IMG;
	Thu, 30 Apr 2026 00:07:08 +0000
Date: Thu, 30 Apr 2026 08:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Nutty Liu <nutty.liu@hotmail.com>
Subject: [avpatel:riscv_iommu_irqbypass_v2 3/18]
 drivers/iommu/riscv/iommu.h:24:42: error: field 'riscvpt' has incomplete type
Message-ID: <202604300724.F7sSxXFs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_iommu_irqbypass_v2
head:   0ba166d111b762ae8f37075ba1266e345ae5ef59
commit: 09919384307f2b09ecee7801e4ef772dc0a52a56 [3/18] iommu/riscv: Move struct riscv_iommu_domain and info to iommu.h
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260430/202604300724.F7sSxXFs-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300724.F7sSxXFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300724.F7sSxXFs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/riscv/iommu-platform.c:22:
>> drivers/iommu/riscv/iommu.h:24:42: error: field 'riscvpt' has incomplete type
      24 |                 struct pt_iommu_riscv_64 riscvpt;
         |                                          ^~~~~~~


vim +/riscvpt +24 drivers/iommu/riscv/iommu.h

    19	
    20	/* This struct contains protection domain specific IOMMU driver data. */
    21	struct riscv_iommu_domain {
    22		union {
    23			struct iommu_domain domain;
  > 24			struct pt_iommu_riscv_64 riscvpt;
    25		};
    26		struct list_head bonds;
    27		spinlock_t lock;		/* protect bonds list updates. */
    28		int pscid;
    29	};
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
