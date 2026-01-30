Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA4238166
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769763291; cv=none; b=GiIK6WKaREUf9009pjAMhPDyjdnEzPUcLEKa1HJwtv1+agp9TVDlyCw3coqKWcyzREvTLXD1ajPK8C0iBJodb6kjjfxwIdjSAMj/Tx8Z5Va5CfhUlEpfRvVgHtHQbN082jBlgWSFIZEmauO9tt8DfqTVZsS4hAvnoZu7qVl/VqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769763291; c=relaxed/simple;
	bh=BPk/J4qGEQUXnTt/7g/jitlucIMuV5wgF6KFfZtMizc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cSjxWmWKqkS8dszRRn3k118QgV3KOCQTx2aHdF15RgvgYs6THXYgRsDlWbAIuGxZJyI9aXlbvlnQnDVWsymFYgQfrSmYgASp80XmAUDYKpbHgClWJSfQ0/D2OwxAfB8EEklKQBM194ul7aJiSPbW6TZh/vMKORlcDtGCW60nG80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNaSu89F; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNaSu89F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769763289; x=1801299289;
  h=date:from:to:cc:subject:message-id;
  bh=BPk/J4qGEQUXnTt/7g/jitlucIMuV5wgF6KFfZtMizc=;
  b=iNaSu89FlehMPsX/2RZTdIEKxDC3NDMlV5h51e9UFLGnJ59UGrQyyGlT
   YCedpkBfZQDVbRmG1d17G2onRIUbJiJlKEf/cydOD+1MIpQVq6gMuIni9
   eQgTtpJmzZkmehTHeASp1sKv0Ybs84ihLDFxb2hMI5l+ebLgj+ZEX30Hq
   irGtQwvfW/jbs+kTADbPFphrSopRFYFqAZyUYa0zktbiWyFaKmp0uxBbc
   +mp+pM7nUpdjGgc8XLer4+Zitjy8jJEHJVD1lK1E3E4+wzSpWTSAILBFC
   LRQ5mfdMhB/b4iAzjGDc1SbbFCK/1mCDSaIFdFwW5tShFaUMfOkyny+H7
   g==;
X-CSE-ConnectionGUID: /YGwfESOROeCjmHEqo3Hjw==
X-CSE-MsgGUID: gI7yo5pnR8mdiMJnE0A1Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="93670145"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="93670145"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 00:54:45 -0800
X-CSE-ConnectionGUID: yOfrQtKdQGubb5zFKTsNSA==
X-CSE-MsgGUID: b+M0MJAAQv6KUVZieM9Few==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="212885892"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jan 2026 00:54:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlkH3-00000000cPG-1eoW;
	Fri, 30 Jan 2026 08:54:41 +0000
Date: Fri, 30 Jan 2026 16:54:40 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/region_rework_v3 8/9]
 drivers/cxl/core/sysram_region.c:31:7: error: 'MMOP_OFFLINE' undeclared; did
 you mean 'KOBJ_OFFLINE'?
Message-ID: <202601301643.cf8tbZoL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/region_rework_v3
head:   ef956221cc52b1c29b05280fcec99686d744d6b4
commit: f01228503f96ed593825ba00ad03dfa5cd01041f [8/9] cxl/core: Add dax_kmem_region and sysram_region drivers
config: sparc64-randconfig-002-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301643.cf8tbZoL-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301643.cf8tbZoL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301643.cf8tbZoL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/sysram_region.c: In function 'online_type_show':
>> drivers/cxl/core/sysram_region.c:31:7: error: 'MMOP_OFFLINE' undeclared (first use in this function); did you mean 'KOBJ_OFFLINE'?
     case MMOP_OFFLINE:
          ^~~~~~~~~~~~
          KOBJ_OFFLINE
   drivers/cxl/core/sysram_region.c:31:7: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/cxl/core/sysram_region.c:33:7: error: 'MMOP_ONLINE' undeclared (first use in this function); did you mean 'KOBJ_ONLINE'?
     case MMOP_ONLINE:
          ^~~~~~~~~~~
          KOBJ_ONLINE
>> drivers/cxl/core/sysram_region.c:35:7: error: 'MMOP_ONLINE_MOVABLE' undeclared (first use in this function); did you mean 'ZONE_MOVABLE'?
     case MMOP_ONLINE_MOVABLE:
          ^~~~~~~~~~~~~~~~~~~
          ZONE_MOVABLE
   drivers/cxl/core/sysram_region.c: In function 'online_type_store':
   drivers/cxl/core/sysram_region.c:49:30: error: 'MMOP_OFFLINE' undeclared (first use in this function); did you mean 'KOBJ_OFFLINE'?
      cxlr_sysram->online_type = MMOP_OFFLINE;
                                 ^~~~~~~~~~~~
                                 KOBJ_OFFLINE
   drivers/cxl/core/sysram_region.c:51:30: error: 'MMOP_ONLINE' undeclared (first use in this function); did you mean 'KOBJ_ONLINE'?
      cxlr_sysram->online_type = MMOP_ONLINE;
                                 ^~~~~~~~~~~
                                 KOBJ_ONLINE
   drivers/cxl/core/sysram_region.c:53:30: error: 'MMOP_ONLINE_MOVABLE' undeclared (first use in this function); did you mean 'ZONE_MOVABLE'?
      cxlr_sysram->online_type = MMOP_ONLINE_MOVABLE;
                                 ^~~~~~~~~~~~~~~~~~~
                                 ZONE_MOVABLE


vim +31 drivers/cxl/core/sysram_region.c

    24	
    25	static ssize_t online_type_show(struct device *dev,
    26					struct device_attribute *attr, char *buf)
    27	{
    28		struct cxl_sysram_region *cxlr_sysram = to_cxl_sysram_region(dev);
    29	
    30		switch (cxlr_sysram->online_type) {
  > 31		case MMOP_OFFLINE:
    32			return sysfs_emit(buf, "offline\n");
  > 33		case MMOP_ONLINE:
    34			return sysfs_emit(buf, "online\n");
  > 35		case MMOP_ONLINE_MOVABLE:
    36			return sysfs_emit(buf, "online_movable\n");
    37		default:
    38			return sysfs_emit(buf, "invalid\n");
    39		}
    40	}
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
