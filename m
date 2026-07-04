Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08FE1A6835
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 05:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783143243; cv=none; b=KoxgQhq6WN4NNkcPLM9sXHGiOkhNIcSVVH5eGu6ZSp55OV7HqODjeTNTqIlIW7koO7yYMGPuW6RW5M++zXTVdh1J8tpN6tRV7ABxYwXH/0kfJNNhCavUoPziJ+ST2YcWlF2MR9JbkxdrMv8q6NWSz1Mc9Uzp/m82oClsmGRtgNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783143243; c=relaxed/simple;
	bh=/SftdvHntH0In4Q/D9IE55fNX73RBFU7t+3qDTqapWE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R4+gmtB90ro2oOH4uJrgCync9OGjLxVQro7BI3TFie/ADRlOVkws2xh5bAUl2vQHersebjKIln7k1OAzvr05vl7AQuAC5Maaq6XD9/yiAsZGAocC0nBld9U8AdDsglHecl5M2Lhw5ZuSooTrpgiyf1F+cNs3IypvOUgUo8sCizg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZlpBoRs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZlpBoRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783143241; x=1814679241;
  h=date:from:to:cc:subject:message-id;
  bh=/SftdvHntH0In4Q/D9IE55fNX73RBFU7t+3qDTqapWE=;
  b=dZlpBoRstapgty8jg+TuFk+Sqg2w/bsuKWFOvC1mzhPdNfm/r5BPBds7
   1RiZFWauAY272QsIdhzLq287vkn8TBXdIFCk1TKzXUIecHbhEDbauijit
   1qrHxDvwolwUHQYufh2yHtXjLrzfnnsiCkr+UT3g+4yYHmRpi1Os9Jj2q
   wxSwzSs6hpyFN4Zw8ctyrDwwzwtBEv+Rm8ekqkgPt5N6XWxAL9ISn7zTB
   QEX0+fAJdUXFgGHyJICKY5Z8BJRixXulXwkQS7OF3Ezsd6WLIpInrqQIi
   3emaSzDZ3yjxjCXEHyPki/e83ixl+oFrLAf683sAuwnyeYuvFwxzd3x8+
   A==;
X-CSE-ConnectionGUID: ZnNrlqGkThimPBROA8gPdw==
X-CSE-MsgGUID: BLR7FRBhTaeULBpISdTF4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83854461"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="83854461"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 22:33:56 -0700
X-CSE-ConnectionGUID: YpxHtsAcRgK3oVPD/C+wxw==
X-CSE-MsgGUID: lQvEVo/ORoWbVCib5RCTGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="257581235"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Jul 2026 22:33:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wft0i-00000000Csn-2YyG;
	Sat, 04 Jul 2026 05:33:52 +0000
Date: Sat, 04 Jul 2026 13:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V5 12/27]
 drivers/firmware/arm_scmi/telemetry.c:1345:44: sparse: sparse: dereference of
 noderef expression
Message-ID: <202607041355.ZNxOPVsa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V5
head:   12bf8bf979989adcd25b57e702706658e00cee91
commit: 9d1fa2b0ff4af2334e6ab35bcc4b37d2338d3f6e [12/27] firmware: arm_scmi: Add support to parse SHMTIs areas
config: hexagon-randconfig-r122-20260704 (https://download.01.org/0day-ci/archive/20260704/202607041355.ZNxOPVsa-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041355.ZNxOPVsa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041355.ZNxOPVsa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/arm_scmi/telemetry.c:1314:48: sparse: sparse: non size-preserving pointer to integer cast
>> drivers/firmware/arm_scmi/telemetry.c:1345:44: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1353:48: sparse: sparse: non size-preserving pointer to integer cast

vim +1345 drivers/firmware/arm_scmi/telemetry.c

  1331	
  1332	static struct telemetry_uuid *
  1333	scmi_telemetry_uuid_create(struct device *dev, struct xarray *xa_lines,
  1334				   struct payload __iomem *payld)
  1335	{
  1336		struct telemetry_uuid *uuid;
  1337		struct uuid_line __iomem *uuid_l = &payld->uuid_l;
  1338		int ret;
  1339	
  1340		uuid = kzalloc_obj(*uuid);
  1341		if (!uuid)
  1342			return NULL;
  1343	
  1344		for (int i = 0; i < SCMI_TLM_DE_IMPL_MAX_DWORDS; i++)
> 1345			uuid->de_impl_version[i] = le32_to_cpu(uuid_l->dwords[i]);
  1346	
  1347		ret = scmi_telemetry_line_init(&uuid->line, xa_lines, payld);
  1348		if (ret) {
  1349			kfree(uuid);
  1350			return NULL;
  1351		}
  1352	
  1353		trace_scmi_tlm_collect(0, (__force u64)payld, 0, "SHMTI_NEW_UUID");
  1354	
  1355		return uuid;
  1356	}
  1357	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
