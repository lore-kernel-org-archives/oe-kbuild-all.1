Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F70D16A395
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jul 2026 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784988787; cv=none; b=XOyveCVNgE22uhs3BaKomGTaolmvPnxeIZ27QMsqnl08KzH2M9f8u5LPXdkeHPgHFHir3ighxWfxiuPZYAgOW3rQRRYcBQvnfZofpTnYijEMEgENlLvmtwKbThLVI4+hJHfqsFA5Od1jCsXIM5SMXyPcTbWXN1vB7uR4GLVCP64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784988787; c=relaxed/simple;
	bh=ALkhh7x++tzEWUN4N0ONWi0dcxsCL8QcVYlD7ZyP7/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ox3TbvdkV2TPLmU1lLDIrPu/KM6znQYU312gU6Qg6K8zvappjomfuqZTGyLVwdBJUkbRoC3rruyySWZHHhZMCW9HzwokyBtqns7MJMzqcn21RfshwB+l3KvGYkJWEZ/6MV0tp3wij+WqS44NXTBgLkTnFIbJDvCzdwdEeiA/V3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OgJx4hKE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgJx4hKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784988785; x=1816524785;
  h=date:from:to:cc:subject:message-id;
  bh=ALkhh7x++tzEWUN4N0ONWi0dcxsCL8QcVYlD7ZyP7/c=;
  b=OgJx4hKE5Juz7LU6NkhmhnTKK/HuMJ/F2shMt2LjXTSs7B7QrHmWfCNF
   r5Kc+ERsbZKKOzYGGCsafBWhwXVQr4PZ5psUzgm5vRjrqBi1DDdaU2H26
   NMzHuPBzl1zgkxtic4qt33npqftcJZLpwAs4XGQa2Bn3GGpZA0SlYLTnw
   Dv03YG1lZ2DHqkxm0Jdh+x5lAjWDfHVrqGEV5sn03rEZEMGcY6WxcZwsV
   v1ahVArvijaV5mCPiwIZhtrtWf4bbRP7EofTh06hGiv4fdXlcbbhjJxpp
   LN+3eqZ3/hXiFYpjtPf1vt8JItbbmmVnJlFouqpzwkcfnwopjv6RPR7SU
   A==;
X-CSE-ConnectionGUID: 0pb4Edp+Rwif/coVhcEOUQ==
X-CSE-MsgGUID: AYRjl2N/TAaE6hsRMF7ElA==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="89301034"
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="89301034"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 07:13:04 -0700
X-CSE-ConnectionGUID: JHFiPSCoTCeeNgp3MUiv2w==
X-CSE-MsgGUID: 2ft9KMx1TkuZaPNlQgEOTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="258411414"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Jul 2026 07:13:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnd7d-00000000bjS-0m3M;
	Sat, 25 Jul 2026 14:13:01 +0000
Date: Sat, 25 Jul 2026 22:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V6 19/34]
 drivers/firmware/arm_scmi/telemetry.c:1361:35: warning: cast from pointer to
 integer of different size
Message-ID: <202607252112.dpRK8x4I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V6
head:   8116f1f12b7ee5f73b39da4b2b1b694bc1e96a0c
commit: 51f89fbf3fdef12ab7f91df3394a7836f68b7238 [19/34] firmware: arm_scmi: Add support to parse SHMTIs areas
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260725/202607252112.dpRK8x4I-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260725/202607252112.dpRK8x4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607252112.dpRK8x4I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/telemetry.c: In function 'scmi_telemetry_blkts_create':
>> drivers/firmware/arm_scmi/telemetry.c:1361:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1361 |         trace_scmi_tlm_collect(0, (__force u64)payld, 0, "SHMTI_NEW_BLKTS");
         |                                   ^
   drivers/firmware/arm_scmi/telemetry.c: In function 'scmi_telemetry_uuid_create':
   drivers/firmware/arm_scmi/telemetry.c:1404:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1404 |         trace_scmi_tlm_collect(0, (__force u64)payld, 0, "SHMTI_NEW_UUID");
         |                                   ^
   At top level:
   drivers/firmware/arm_scmi/telemetry.c:1736:12: warning: 'scmi_telemetry_shmti_scan' defined but not used [-Wunused-function]
    1736 | static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:1463:1: warning: 'scmi_telemetry_blkts_bind' defined but not used [-Wunused-function]
    1463 | scmi_telemetry_blkts_bind(struct device *dev, struct telemetry_shmti *shmti,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +1361 drivers/firmware/arm_scmi/telemetry.c

  1343	
  1344	static struct telemetry_block_ts *
  1345	scmi_telemetry_blkts_create(struct device *dev, struct xarray *xa_lines,
  1346				    struct payload __iomem *payld)
  1347	{
  1348		struct telemetry_block_ts *bts;
  1349		int ret;
  1350	
  1351		bts = kzalloc_obj(*bts);
  1352		if (!bts)
  1353			return NULL;
  1354	
  1355		ret = scmi_telemetry_line_init(&bts->line, xa_lines, payld);
  1356		if (ret) {
  1357			kfree(bts);
  1358			return NULL;
  1359		}
  1360	
> 1361		trace_scmi_tlm_collect(0, (__force u64)payld, 0, "SHMTI_NEW_BLKTS");
  1362	
  1363		return bts;
  1364	}
  1365	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
