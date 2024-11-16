Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F34B80B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 17:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731777357; cv=none; b=PvqD2DV0A/vbrII9AkoPsdnaxO7koMybCPU78BeoPeqEIzmX2InoPgJ1c/NN6bdzjbSkqvn8YGAswoMxUNT47rMzRBvc/Ljryv+vSLr5xqU12IbrbOfyhWKRlkRMZ9U0UCUJunZoshQI3lhJmqAASuJ6H3L0QGey/qGHv6ncGAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731777357; c=relaxed/simple;
	bh=hMCrvMEJEsQWTcyQ2bDSugxGJ3JWRkadaOTmUZiYPZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MbP5b6tf17hXD2NcAbZu/54K6EmMlA79b2cGuBZvyapzyBW/pDSFVuxtGTFmAc0b7nFdVfuQIPHuyR6o6lebnSqI84w35vI9nHCuJEWDi00osz3mzO1uQgnC5JJ/vCnIECvW2P/Y03o9NaR8gtmSZsGKx1eGZ0o8PblFjzfZvm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BntfduAh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BntfduAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731777356; x=1763313356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hMCrvMEJEsQWTcyQ2bDSugxGJ3JWRkadaOTmUZiYPZU=;
  b=BntfduAh/+0FlmuBYkQzqGFtpphzBz01tgsVNSOhVXxlgxqLqKqGXslU
   clBk4tsHkWyO+uuK/+sFt7REMoC2rB+Yo510a/vEOtLPM+EUw69Gjeixn
   rKMIC+xfnzxBlrvCOO2Pjp0xuedx+GVWi5FoF0aXF2PqQ9nTFJc186907
   +eblST1EuoVYCAgvhu2u+i9OcJHBW1lQtfZxXwFwh/VxRtFOVMgKTXO/9
   VPVqTayRdA0Imln3v643JYGvRAITkQ45lbih2iDMGbYZPyQHZmQWMUicV
   +pdlTgei8WLW1e5y3KVWN9SQKcLaOM4/7laZMQnrIWSPpo0YNT6In5ZAD
   A==;
X-CSE-ConnectionGUID: XqUc9Rf5RbG6ROtmdoQ/vw==
X-CSE-MsgGUID: xBESwK9UQV2Eqsqiwj2nPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="43166977"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="43166977"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 09:15:52 -0800
X-CSE-ConnectionGUID: C+ZkU29qQEuQMnwTkbB8Rg==
X-CSE-MsgGUID: tm2S8140Tl6nnYGTjg2aLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93928615"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2024 09:15:51 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCMOh-000101-2C;
	Sat, 16 Nov 2024 17:15:47 +0000
Date: Sun, 17 Nov 2024 01:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop-pkvm-ia-2024-15-11-v1 128/259]
 drivers/iommu/intel/perfmon.c:118:66: warning: cast from pointer to integer
 of different size
Message-ID: <202411170125.RTviNWLT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop-pkvm-ia-2024-15-11-v1
head:   ab957086535d11209d7d6dd96172900d714fb5fb
commit: c8db8e13a5473ce640ddcbefc6adafa32c41c9dd [128/259] ANDROID: IOMMU: use dmar_read/write wrapper for MMIO accessing
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411170125.RTviNWLT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170125.RTviNWLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170125.RTviNWLT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/intel/perfmon.c:10:
   drivers/iommu/intel/perfmon.c: In function 'iommu_pmu_event_update':
>> drivers/iommu/intel/perfmon.c:118:66: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     118 | #define dmar_pmu_readq(pmu, o)          dmar_readq((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg)
         |                                                                  ^
   drivers/iommu/intel/iommu.h:149:51: note: in definition of macro 'dmar_readq'
     149 | #define dmar_readq(iommu, o) readq((iommu)->reg + o)
         |                                                   ^
   drivers/iommu/intel/perfmon.c:336:21: note: in expansion of macro 'dmar_pmu_readq'
     336 |         new_count = dmar_pmu_readq(iommu_pmu, iommu_event_base(iommu_pmu, hwc->idx));
         |                     ^~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:118:77: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     118 | #define dmar_pmu_readq(pmu, o)          dmar_readq((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg)
         |                                                                             ^
   drivers/iommu/intel/iommu.h:149:51: note: in definition of macro 'dmar_readq'
     149 | #define dmar_readq(iommu, o) readq((iommu)->reg + o)
         |                                                   ^
   drivers/iommu/intel/perfmon.c:336:21: note: in expansion of macro 'dmar_pmu_readq'
     336 |         new_count = dmar_pmu_readq(iommu_pmu, iommu_event_base(iommu_pmu, hwc->idx));
         |                     ^~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c: In function 'iommu_pmu_start':
>> drivers/iommu/intel/perfmon.c:118:66: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     118 | #define dmar_pmu_readq(pmu, o)          dmar_readq((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg)
         |                                                                  ^
   drivers/iommu/intel/iommu.h:149:51: note: in definition of macro 'dmar_readq'
     149 | #define dmar_readq(iommu, o) readq((iommu)->reg + o)
         |                                                   ^
   drivers/iommu/intel/perfmon.c:369:17: note: in expansion of macro 'dmar_pmu_readq'
     369 |         count = dmar_pmu_readq(iommu_pmu, iommu_event_base(iommu_pmu, hwc->idx));
         |                 ^~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:118:77: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     118 | #define dmar_pmu_readq(pmu, o)          dmar_readq((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg)
         |                                                                             ^
   drivers/iommu/intel/iommu.h:149:51: note: in definition of macro 'dmar_readq'
     149 | #define dmar_readq(iommu, o) readq((iommu)->reg + o)
         |                                                   ^
   drivers/iommu/intel/perfmon.c:369:17: note: in expansion of macro 'dmar_pmu_readq'
     369 |         count = dmar_pmu_readq(iommu_pmu, iommu_event_base(iommu_pmu, hwc->idx));
         |                 ^~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c: In function 'iommu_pmu_assign_event':
   drivers/iommu/intel/perfmon.c:119:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     119 | #define dmar_pmu_writeq(pmu, o, v)      dmar_writeq((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                   ^
   drivers/iommu/intel/iommu.h:150:59: note: in definition of macro 'dmar_writeq'
     150 | #define dmar_writeq(iommu, o, v) writeq(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:440:9: note: in expansion of macro 'dmar_pmu_writeq'
     440 |         dmar_pmu_writeq(iommu_pmu, iommu_config_base(iommu_pmu, idx), hwc->config);
         |         ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:119:78: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     119 | #define dmar_pmu_writeq(pmu, o, v)      dmar_writeq((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                              ^
   drivers/iommu/intel/iommu.h:150:59: note: in definition of macro 'dmar_writeq'
     150 | #define dmar_writeq(iommu, o, v) writeq(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:440:9: note: in expansion of macro 'dmar_pmu_writeq'
     440 |         dmar_pmu_writeq(iommu_pmu, iommu_config_base(iommu_pmu, idx), hwc->config);
         |         ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                   ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
     152 | #define dmar_writel(iommu, o, v) writel(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:126:17: note: in expansion of macro 'dmar_pmu_writel'
     126 |                 dmar_pmu_writel(iommu_pmu,                                      \
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:442:9: note: in expansion of macro 'iommu_pmu_set_filter'
     442 |         iommu_pmu_set_filter(requester_id, event->attr.config1,
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:78: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                              ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
     152 | #define dmar_writel(iommu, o, v) writel(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:126:17: note: in expansion of macro 'dmar_pmu_writel'
     126 |                 dmar_pmu_writel(iommu_pmu,                                      \
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:442:9: note: in expansion of macro 'iommu_pmu_set_filter'
     442 |         iommu_pmu_set_filter(requester_id, event->attr.config1,
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                   ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
     152 | #define dmar_writel(iommu, o, v) writel(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:126:17: note: in expansion of macro 'dmar_pmu_writel'
     126 |                 dmar_pmu_writel(iommu_pmu,                                      \
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:445:9: note: in expansion of macro 'iommu_pmu_set_filter'
     445 |         iommu_pmu_set_filter(domain, event->attr.config1,
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:78: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                              ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
     152 | #define dmar_writel(iommu, o, v) writel(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:126:17: note: in expansion of macro 'dmar_pmu_writel'
     126 |                 dmar_pmu_writel(iommu_pmu,                                      \
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:445:9: note: in expansion of macro 'iommu_pmu_set_filter'
     445 |         iommu_pmu_set_filter(domain, event->attr.config1,
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                   ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
     152 | #define dmar_writel(iommu, o, v) writel(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:126:17: note: in expansion of macro 'dmar_pmu_writel'
     126 |                 dmar_pmu_writel(iommu_pmu,                                      \
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:448:9: note: in expansion of macro 'iommu_pmu_set_filter'
     448 |         iommu_pmu_set_filter(pasid, event->attr.config2,
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:78: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                              ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
--
   drivers/iommu/intel/perfmon.c:486:9: note: in expansion of macro 'iommu_pmu_clear_filter'
     486 |         iommu_pmu_clear_filter(IOMMU_PMU_FILTER_REQUESTER_ID, idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                   ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
     152 | #define dmar_writel(iommu, o, v) writel(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:137:17: note: in expansion of macro 'dmar_pmu_writel'
     137 |                 dmar_pmu_writel(iommu_pmu,                                      \
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:487:9: note: in expansion of macro 'iommu_pmu_clear_filter'
     487 |         iommu_pmu_clear_filter(IOMMU_PMU_FILTER_DOMAIN, idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:78: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                              ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
     152 | #define dmar_writel(iommu, o, v) writel(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:137:17: note: in expansion of macro 'dmar_pmu_writel'
     137 |                 dmar_pmu_writel(iommu_pmu,                                      \
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:487:9: note: in expansion of macro 'iommu_pmu_clear_filter'
     487 |         iommu_pmu_clear_filter(IOMMU_PMU_FILTER_DOMAIN, idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                   ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
     152 | #define dmar_writel(iommu, o, v) writel(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:137:17: note: in expansion of macro 'dmar_pmu_writel'
     137 |                 dmar_pmu_writel(iommu_pmu,                                      \
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:488:9: note: in expansion of macro 'iommu_pmu_clear_filter'
     488 |         iommu_pmu_clear_filter(IOMMU_PMU_FILTER_PASID, idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:78: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                              ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
     152 | #define dmar_writel(iommu, o, v) writel(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:137:17: note: in expansion of macro 'dmar_pmu_writel'
     137 |                 dmar_pmu_writel(iommu_pmu,                                      \
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:488:9: note: in expansion of macro 'iommu_pmu_clear_filter'
     488 |         iommu_pmu_clear_filter(IOMMU_PMU_FILTER_PASID, idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                   ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
     152 | #define dmar_writel(iommu, o, v) writel(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:137:17: note: in expansion of macro 'dmar_pmu_writel'
     137 |                 dmar_pmu_writel(iommu_pmu,                                      \
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:489:9: note: in expansion of macro 'iommu_pmu_clear_filter'
     489 |         iommu_pmu_clear_filter(IOMMU_PMU_FILTER_ATS, idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:78: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                              ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
     152 | #define dmar_writel(iommu, o, v) writel(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:137:17: note: in expansion of macro 'dmar_pmu_writel'
     137 |                 dmar_pmu_writel(iommu_pmu,                                      \
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:489:9: note: in expansion of macro 'iommu_pmu_clear_filter'
     489 |         iommu_pmu_clear_filter(IOMMU_PMU_FILTER_ATS, idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                   ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
     152 | #define dmar_writel(iommu, o, v) writel(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:137:17: note: in expansion of macro 'dmar_pmu_writel'
     137 |                 dmar_pmu_writel(iommu_pmu,                                      \
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:490:9: note: in expansion of macro 'iommu_pmu_clear_filter'
     490 |         iommu_pmu_clear_filter(IOMMU_PMU_FILTER_PAGE_TABLE, idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:121:78: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     121 | #define dmar_pmu_writel(pmu, o, v)      dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                              ^
   drivers/iommu/intel/iommu.h:152:59: note: in definition of macro 'dmar_writel'
     152 | #define dmar_writel(iommu, o, v) writel(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:137:17: note: in expansion of macro 'dmar_pmu_writel'
     137 |                 dmar_pmu_writel(iommu_pmu,                                      \
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:490:9: note: in expansion of macro 'iommu_pmu_clear_filter'
     490 |         iommu_pmu_clear_filter(IOMMU_PMU_FILTER_PAGE_TABLE, idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c: In function 'iommu_pmu_counter_overflow':
>> drivers/iommu/intel/perfmon.c:118:66: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     118 | #define dmar_pmu_readq(pmu, o)          dmar_readq((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg)
         |                                                                  ^
   drivers/iommu/intel/iommu.h:149:51: note: in definition of macro 'dmar_readq'
     149 | #define dmar_readq(iommu, o) readq((iommu)->reg + o)
         |                                                   ^
   drivers/iommu/intel/perfmon.c:525:26: note: in expansion of macro 'dmar_pmu_readq'
     525 |         while ((status = dmar_pmu_readq(iommu_pmu, iommu_pmu->overflow))) {
         |                          ^~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:118:77: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     118 | #define dmar_pmu_readq(pmu, o)          dmar_readq((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg)
         |                                                                             ^
   drivers/iommu/intel/iommu.h:149:51: note: in definition of macro 'dmar_readq'
     149 | #define dmar_readq(iommu, o) readq((iommu)->reg + o)
         |                                                   ^
   drivers/iommu/intel/perfmon.c:525:26: note: in expansion of macro 'dmar_pmu_readq'
     525 |         while ((status = dmar_pmu_readq(iommu_pmu, iommu_pmu->overflow))) {
         |                          ^~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:119:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     119 | #define dmar_pmu_writeq(pmu, o, v)      dmar_writeq((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                   ^
   drivers/iommu/intel/iommu.h:150:59: note: in definition of macro 'dmar_writeq'
     150 | #define dmar_writeq(iommu, o, v) writeq(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:539:17: note: in expansion of macro 'dmar_pmu_writeq'
     539 |                 dmar_pmu_writeq(iommu_pmu, iommu_pmu->overflow, status);
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:119:78: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     119 | #define dmar_pmu_writeq(pmu, o, v)      dmar_writeq((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
         |                                                                              ^
   drivers/iommu/intel/iommu.h:150:59: note: in definition of macro 'dmar_writeq'
     150 | #define dmar_writeq(iommu, o, v) writeq(v, (iommu)->reg + o)
         |                                                           ^
   drivers/iommu/intel/perfmon.c:539:17: note: in expansion of macro 'dmar_pmu_writeq'
     539 |                 dmar_pmu_writeq(iommu_pmu, iommu_pmu->overflow, status);
         |                 ^~~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c: In function 'alloc_iommu_pmu':
   drivers/iommu/intel/perfmon.c:120:66: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     120 | #define dmar_pmu_readl(pmu, o)          dmar_readl((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg)
         |                                                                  ^
   drivers/iommu/intel/iommu.h:151:51: note: in definition of macro 'dmar_readl'
     151 | #define dmar_readl(iommu, o) readl((iommu)->reg + o)
         |                                                   ^
   drivers/iommu/intel/perfmon.c:679:23: note: in expansion of macro 'dmar_pmu_readl'
     679 |                 cap = dmar_pmu_readl(iommu_pmu, iommu_pmu->cfg_reg +
         |                       ^~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:120:77: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     120 | #define dmar_pmu_readl(pmu, o)          dmar_readl((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg)
         |                                                                             ^
   drivers/iommu/intel/iommu.h:151:51: note: in definition of macro 'dmar_readl'
     151 | #define dmar_readl(iommu, o) readl((iommu)->reg + o)
         |                                                   ^
   drivers/iommu/intel/perfmon.c:679:23: note: in expansion of macro 'dmar_pmu_readl'
     679 |                 cap = dmar_pmu_readl(iommu_pmu, iommu_pmu->cfg_reg +
         |                       ^~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:120:66: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     120 | #define dmar_pmu_readl(pmu, o)          dmar_readl((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg)
         |                                                                  ^
   drivers/iommu/intel/iommu.h:151:51: note: in definition of macro 'dmar_readl'
     151 | #define dmar_readl(iommu, o) readl((iommu)->reg + o)
         |                                                   ^
   drivers/iommu/intel/perfmon.c:703:31: note: in expansion of macro 'dmar_pmu_readl'
     703 |                         cap = dmar_pmu_readl(iommu_pmu, iommu_pmu->cfg_reg + i * IOMMU_PMU_CFG_OFFSET +
         |                               ^~~~~~~~~~~~~~
   drivers/iommu/intel/perfmon.c:120:77: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     120 | #define dmar_pmu_readl(pmu, o)          dmar_readl((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg)
         |                                                                             ^
   drivers/iommu/intel/iommu.h:151:51: note: in definition of macro 'dmar_readl'
     151 | #define dmar_readl(iommu, o) readl((iommu)->reg + o)
         |                                                   ^
   drivers/iommu/intel/perfmon.c:703:31: note: in expansion of macro 'dmar_pmu_readl'
     703 |                         cap = dmar_pmu_readl(iommu_pmu, iommu_pmu->cfg_reg + i * IOMMU_PMU_CFG_OFFSET +
         |                               ^~~~~~~~~~~~~~


vim +118 drivers/iommu/intel/perfmon.c

     8	
     9	#include <linux/dmar.h>
  > 10	#include "iommu.h"
    11	#include "perfmon.h"
    12	
    13	PMU_FORMAT_ATTR(event,		"config:0-27");		/* ES: Events Select */
    14	PMU_FORMAT_ATTR(event_group,	"config:28-31");	/* EGI: Event Group Index */
    15	
    16	static struct attribute *iommu_pmu_format_attrs[] = {
    17		&format_attr_event_group.attr,
    18		&format_attr_event.attr,
    19		NULL
    20	};
    21	
    22	static struct attribute_group iommu_pmu_format_attr_group = {
    23		.name = "format",
    24		.attrs = iommu_pmu_format_attrs,
    25	};
    26	
    27	/* The available events are added in attr_update later */
    28	static struct attribute *attrs_empty[] = {
    29		NULL
    30	};
    31	
    32	static struct attribute_group iommu_pmu_events_attr_group = {
    33		.name = "events",
    34		.attrs = attrs_empty,
    35	};
    36	
    37	static cpumask_t iommu_pmu_cpu_mask;
    38	
    39	static ssize_t
    40	cpumask_show(struct device *dev, struct device_attribute *attr, char *buf)
    41	{
    42		return cpumap_print_to_pagebuf(true, buf, &iommu_pmu_cpu_mask);
    43	}
    44	static DEVICE_ATTR_RO(cpumask);
    45	
    46	static struct attribute *iommu_pmu_cpumask_attrs[] = {
    47		&dev_attr_cpumask.attr,
    48		NULL
    49	};
    50	
    51	static struct attribute_group iommu_pmu_cpumask_attr_group = {
    52		.attrs = iommu_pmu_cpumask_attrs,
    53	};
    54	
    55	static const struct attribute_group *iommu_pmu_attr_groups[] = {
    56		&iommu_pmu_format_attr_group,
    57		&iommu_pmu_events_attr_group,
    58		&iommu_pmu_cpumask_attr_group,
    59		NULL
    60	};
    61	
    62	static inline struct iommu_pmu *dev_to_iommu_pmu(struct device *dev)
    63	{
    64		/*
    65		 * The perf_event creates its own dev for each PMU.
    66		 * See pmu_dev_alloc()
    67		 */
    68		return container_of(dev_get_drvdata(dev), struct iommu_pmu, pmu);
    69	}
    70	
    71	#define IOMMU_PMU_ATTR(_name, _format, _filter)				\
    72		PMU_FORMAT_ATTR(_name, _format);				\
    73										\
    74	static struct attribute *_name##_attr[] = {				\
    75		&format_attr_##_name.attr,					\
    76		NULL								\
    77	};									\
    78										\
    79	static umode_t								\
    80	_name##_is_visible(struct kobject *kobj, struct attribute *attr, int i)	\
    81	{									\
    82		struct device *dev = kobj_to_dev(kobj);				\
    83		struct iommu_pmu *iommu_pmu = dev_to_iommu_pmu(dev);		\
    84										\
    85		if (!iommu_pmu)							\
    86			return 0;						\
    87		return (iommu_pmu->filter & _filter) ? attr->mode : 0;		\
    88	}									\
    89										\
    90	static struct attribute_group _name = {					\
    91		.name		= "format",					\
    92		.attrs		= _name##_attr,					\
    93		.is_visible	= _name##_is_visible,				\
    94	};
    95	
    96	IOMMU_PMU_ATTR(filter_requester_id_en,	"config1:0",		IOMMU_PMU_FILTER_REQUESTER_ID);
    97	IOMMU_PMU_ATTR(filter_domain_en,	"config1:1",		IOMMU_PMU_FILTER_DOMAIN);
    98	IOMMU_PMU_ATTR(filter_pasid_en,		"config1:2",		IOMMU_PMU_FILTER_PASID);
    99	IOMMU_PMU_ATTR(filter_ats_en,		"config1:3",		IOMMU_PMU_FILTER_ATS);
   100	IOMMU_PMU_ATTR(filter_page_table_en,	"config1:4",		IOMMU_PMU_FILTER_PAGE_TABLE);
   101	IOMMU_PMU_ATTR(filter_requester_id,	"config1:16-31",	IOMMU_PMU_FILTER_REQUESTER_ID);
   102	IOMMU_PMU_ATTR(filter_domain,		"config1:32-47",	IOMMU_PMU_FILTER_DOMAIN);
   103	IOMMU_PMU_ATTR(filter_pasid,		"config2:0-21",		IOMMU_PMU_FILTER_PASID);
   104	IOMMU_PMU_ATTR(filter_ats,		"config2:24-28",	IOMMU_PMU_FILTER_ATS);
   105	IOMMU_PMU_ATTR(filter_page_table,	"config2:32-36",	IOMMU_PMU_FILTER_PAGE_TABLE);
   106	
   107	#define iommu_pmu_en_requester_id(e)		((e) & 0x1)
   108	#define iommu_pmu_en_domain(e)			(((e) >> 1) & 0x1)
   109	#define iommu_pmu_en_pasid(e)			(((e) >> 2) & 0x1)
   110	#define iommu_pmu_en_ats(e)			(((e) >> 3) & 0x1)
   111	#define iommu_pmu_en_page_table(e)		(((e) >> 4) & 0x1)
   112	#define iommu_pmu_get_requester_id(filter)	(((filter) >> 16) & 0xffff)
   113	#define iommu_pmu_get_domain(filter)		(((filter) >> 32) & 0xffff)
   114	#define iommu_pmu_get_pasid(filter)		((filter) & 0x3fffff)
   115	#define iommu_pmu_get_ats(filter)		(((filter) >> 24) & 0x1f)
   116	#define iommu_pmu_get_page_table(filter)	(((filter) >> 32) & 0x1f)
   117	
 > 118	#define dmar_pmu_readq(pmu, o)		dmar_readq((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg)
   119	#define dmar_pmu_writeq(pmu, o, v)	dmar_writeq((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
   120	#define dmar_pmu_readl(pmu, o)		dmar_readl((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg)
   121	#define dmar_pmu_writel(pmu, o, v)	dmar_writel((pmu)->iommu, (u64)(o) - (u64)(pmu)->iommu->reg, (v))
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
