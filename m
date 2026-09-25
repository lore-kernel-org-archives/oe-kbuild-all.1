Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE67472F6C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334053; cv=none; b=lT2uW9u0Z381w6g0lU79NiAOoDxTviwkjBZAZDNVfogVCfMg23t5v35afjsQIWu9AiRMfZxe99mSZ9r8dzx9FWxhl7soQoL5wskV5z4mSr4MPpp3Nda7Nns+kLvpkt2jg4itmoBaZgIEA6kQZLkNa8BCHnr3AHNas67RsXciIEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334053; c=relaxed/simple;
	bh=HweJlTFp1tvId5tQL68CBapOJnr5PiFUavLLnJx8ZoY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hY4lw8OzHCAkyhn4gQUBXUZ3Gnjk2oBcSakldcF/7pN0HQ9wUaRJ6o1x3WgEcTXHrYJfzeXCDivXiIXK9dpotnb+QlJAigLI1X9cVkJzLxSUQSI6abDGWFDkXPmfxUKA5ZGjKwbY72VuqbDUbZT5XPeiUs/M/7il9+1GrNZwmxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9VXF3lc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9VXF3lc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790334052; x=1821870052;
  h=date:from:to:cc:subject:message-id;
  bh=HweJlTFp1tvId5tQL68CBapOJnr5PiFUavLLnJx8ZoY=;
  b=n9VXF3lcr5dVAoYFQdiGW4B9CshOCa6zxZDRsN8n162vgHl/OHOdmE7W
   Ao+7X3INH55p+E0d7VEGpdAx1sd62ANPgL9mKKaaJ1oWNg9RhrpfBqa79
   jRUcHIV8brkF8DefUKwqEIBcKvKv1D56P2Ew2henap4Qvmh+8xV9dhm3s
   BfWuWtDCu8zfi+6t0Vxvx1adn/hmgml72xBesyaGoMVIiblv5dMEVDMHY
   ugUKEPovETmTrVsel46nOv9n/1Ht+/GD5UCMTVo6NW6P8ChTbkkORKaMJ
   ZUXmu8yc5AfTwB3zTAu/qMKFxPk6JWbcw7n2YUPLewa3UzNHQy14ievlj
   w==;
X-CSE-ConnectionGUID: 8WdxLWCxRJ2JUYIz2KZ72Q==
X-CSE-MsgGUID: RcreBrt0T4CrTfSILPMDGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90024674"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90024674"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:00:51 -0700
X-CSE-ConnectionGUID: mcrqhlh7S66uUw98wJiAzw==
X-CSE-MsgGUID: Yqg7xf7uTkOgDtLhKUqUaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273799286"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 25 Sep 2026 04:00:50 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA3fb-000000000gY-334W;
	Fri, 25 Sep 2026 11:00:47 +0000
Date: Fri, 25 Sep 2026 13:00:05 +0200
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V12 33/51]
 drivers/firmware/arm_scmi/telemetry.c:1531:35: warning: cast from pointer to
 integer of different size
Message-ID: <202609251246.Zh5Zsk6W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V12
head:   efa664d9faf1d413ef8a0adfe04a7ce843478cea
commit: 4b310f0a814e5df0394b74b6539cbc2a917b9a73 [33/51] firmware: arm_scmi: Add support to parse SHMTIs areas
config: sh-randconfig-2001-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251246.Zh5Zsk6W-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251246.Zh5Zsk6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251246.Zh5Zsk6W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/telemetry.c: In function 'scmi_telemetry_blkts_create':
>> drivers/firmware/arm_scmi/telemetry.c:1531:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1531 |         trace_scmi_tlm_collect(0, (__force u64)payld, 0, "SHMTI_NEW_BLKTS");
         |                                   ^
   drivers/firmware/arm_scmi/telemetry.c: In function 'scmi_telemetry_uuid_register':
   drivers/firmware/arm_scmi/telemetry.c:1641:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1641 |         trace_scmi_tlm_collect(0, (__force u64)payld, 0, "SHMTI_NEW_UUID");
         |                                   ^
   drivers/firmware/arm_scmi/telemetry.c: At top level:
   drivers/firmware/arm_scmi/telemetry.c:2008:12: warning: 'scmi_telemetry_shmti_scan' defined but not used [-Wunused-function]
    2008 | static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   Assembler messages:
   {standard input}:1501: Error: offset to unaligned destination
   {standard input}:1951: Error: offset to unaligned destination
   {standard input}:2148: Error: offset to unaligned destination


vim +1531 drivers/firmware/arm_scmi/telemetry.c

  1513	
  1514	static struct telemetry_block_ts *
  1515	scmi_telemetry_blkts_create(struct telemetry_info *ti,
  1516				    struct payload __iomem *payld)
  1517	{
  1518		struct telemetry_block_ts *bts;
  1519		int ret;
  1520	
  1521		bts = kzalloc_obj(*bts);
  1522		if (!bts)
  1523			return NULL;
  1524	
  1525		ret = scmi_telemetry_line_init(ti, &bts->line, payld, TDCF_BLK_TS_LINE);
  1526		if (ret) {
  1527			kfree(bts);
  1528			return NULL;
  1529		}
  1530	
> 1531		trace_scmi_tlm_collect(0, (__force u64)payld, 0, "SHMTI_NEW_BLKTS");
  1532	
  1533		return bts;
  1534	}
  1535	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
