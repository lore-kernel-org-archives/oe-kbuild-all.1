Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3EB3D668C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781355543; cv=none; b=VHOebUKOs+zZnbDogNCZF0g4rnnarHUDMkGn6FiI1Ozxs2R2UHai21OCC/ZdfztJniRHbR7vO9IFQoQE/JRneLbI4xXCdEq7UcvpH8y6iE5jEHgMBhUI4ELoxnA4Qxmx8b++pJgd3nqh68W+XJ3USV3kz8SVvRQmer+cIoxXRG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781355543; c=relaxed/simple;
	bh=sSFmKdcefNGhhhunVL+VwZSUOCVj7QI5frscCtrCUCY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NajtxTkXhSxWL1qOlj6SO8rNnSBeSdK6sXQWbqLy14iqyzK3MYjy7cFxZ4JgskhNEVPoUR2v/GzYprSrhcoe62JBcBqmYChRIf2M6D+whJmteSW8hNitz682Efg2tmyER9udj3NkB27HxX/Zs6GDwIzyebPPQhzhb+uUwDkDsRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLRWNKEq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLRWNKEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781355543; x=1812891543;
  h=date:from:to:cc:subject:message-id;
  bh=sSFmKdcefNGhhhunVL+VwZSUOCVj7QI5frscCtrCUCY=;
  b=MLRWNKEqOamXfX2scyOLucTn5Qf8gQ01HstWYQ9Miks3I6uuUeFE5oQ2
   thrkWCQx8VP78WV30MHI8gumthL8xhsuD3HWu3JkBjdlf2gO5NSqLiS9b
   WYdUr0KX8Pj+UYkLoNcs+E+GXWcqYDayUGb0t9pxKLzI9A5rsdpxOwiJW
   dgSLDnZmZmiOHSFI/DDZW4F7l9xfslpbCSfnM5aTJPA3JA0oGa9beRW9Q
   3WRSeuhHtuPkhpbP9Hfi0Soiyp2Q48c5j9EJ1V8oS8LDGNxpzjdPn1Snc
   cf+Nj23SqvjZPaFQUgBDloL53Dlast0n2QRYk+Lp9XtjoB+FYRriGkWnV
   g==;
X-CSE-ConnectionGUID: B+gBJ6apQVuqBCiPiJigbA==
X-CSE-MsgGUID: XsX3JRXETMiRwC4bW94Caw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86065394"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="86065394"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 05:59:00 -0700
X-CSE-ConnectionGUID: yqia6dUrQwOsughUAPoO6g==
X-CSE-MsgGUID: ZKkvglS4QRup/XtnFU39Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="245937236"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2026 05:58:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYNwu-00000000Puo-0ECR;
	Sat, 13 Jun 2026 12:58:56 +0000
Date: Sat, 13 Jun 2026 20:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_unified_fs_V4 12/34]
 drivers/firmware/arm_scmi/telemetry.c:436:22: warning: variable 'ts' set but
 not used
Message-ID: <202606132047.Y4zGt4ne-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_unified_fs_V4
head:   ed28087005811783e972fe7a788446936878932f
commit: 3c8dd1213221c291f213a119bd82a635a1f390e9 [12/34] firmware: arm_scmi: Add support to parse SHMTIs areas
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260613/202606132047.Y4zGt4ne-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606132047.Y4zGt4ne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606132047.Y4zGt4ne-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/telemetry.c: In function 'scmi_telemetry_tde_cache_update':
>> drivers/firmware/arm_scmi/telemetry.c:436:22: warning: variable 'ts' set but not used [-Wunused-but-set-variable=]
     436 |                 bool ts;                                                \
         |                      ^~
   drivers/firmware/arm_scmi/telemetry.c:586:34: note: in expansion of macro 'TDE_HAS_TSTAMP'
     586 |         tde->last_ts = tstamp && TDE_HAS_TSTAMP(tde) ? *tstamp : 0;
         |                                  ^~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/telemetry.c: In function 'scmi_telemetry_blkts_create':
>> drivers/firmware/arm_scmi/telemetry.c:1303:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1303 |         trace_scmi_tlm_collect(0, (u64)payld, 0, "SHMTI_NEW_BLKTS");
         |                                   ^
   drivers/firmware/arm_scmi/telemetry.c: In function 'scmi_telemetry_uuid_create':
   drivers/firmware/arm_scmi/telemetry.c:1341:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1341 |         trace_scmi_tlm_collect(0, (u64)payld, 0, "SHMTI_NEW_UUID");
         |                                   ^
   drivers/firmware/arm_scmi/telemetry.c: At top level:
   drivers/firmware/arm_scmi/telemetry.c:1673:12: warning: 'scmi_telemetry_shmti_scan' defined but not used [-Wunused-function]
    1673 | static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:1400:1: warning: 'scmi_telemetry_blkts_bind' defined but not used [-Wunused-function]
    1400 | scmi_telemetry_blkts_bind(struct device *dev, struct telemetry_shmti *shmti,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ts +436 drivers/firmware/arm_scmi/telemetry.c

   433	
   434	#define TDE_HAS_TSTAMP(_t)						\
   435		({								\
 > 436			bool ts;						\
   437			struct telemetry_de *t = _t;				\
   438										\
   439			ts = t->de.tstamp_support && t->de.tstamp_enabled;	\
   440		})
   441	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
