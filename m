Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26A2175A87
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 22:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781389965; cv=none; b=t1Yqr/VYx8kiMucYCREeev7eMY9ZAvS5a022a86kvSOHf1VZqsEJEFzht5zg7nVW5ipATy2ceRbB32Bmmh14Y85IX/GR8LE5tCEmj8KobpXx2MTGfXdlqWw3x7QwwKOJT4JZBNXfojZgjEi0bGMTZbsacT2Mh42q/fvDdyk993c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781389965; c=relaxed/simple;
	bh=EfuWe/Szv/S1WGNhMFjxgz17WntZMGucpG3PaKbh/6I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KYju1YhVs0Sapk/O0mryBdZfKLgi8VqcGaNLZ7LZvsuFJjP9dyv5uKs3Y/XqWM9kgudruLmc/uSWm3bKHdf6BLA+o/lnz5jhuFFMCWbXqqcOIHnDA1W7JiTGk1vsAxPRI2BZ16D61Pp9lcOzPOXfG0z8wWh7OQbCZaKhcIjry3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=II1a4hep; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="II1a4hep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781389963; x=1812925963;
  h=date:from:to:cc:subject:message-id;
  bh=EfuWe/Szv/S1WGNhMFjxgz17WntZMGucpG3PaKbh/6I=;
  b=II1a4hepNZHvlAqZRgzX4Vu0EG767PsaPkzk0TNExjQiUBRoqx0hQOB6
   ZqSSvho3f+YPki2MlXgtwWUovMGI7BtX/bvSVXbLds/wgXB20JP5TGTex
   JqQrcteRXO5vutiFTfQIpySypgRKHjXoDoD5DPBT1UZH6rNI+OuNCsHvr
   cM4UnXORj8c9eypqs4Q35sq6JY7zKz1vqVpZu6bv0LGY8nWJZqP5x8pYG
   UxlKaS7wJoa/tvhqHJ13bEEY9GCXFaEzthKrfV+zlk1D14bz2V/PMSR5r
   GDq1ae+q0Y6FqbEetWWQx4BYQlE+WTrr3hCBqOZfre9hzD4OpAGeWySi0
   A==;
X-CSE-ConnectionGUID: KvBNrw7vQrCw4CCOe7PLAQ==
X-CSE-MsgGUID: 1QlJiyUSRHmJOnD1F7dgbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="99602343"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="99602343"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 15:32:42 -0700
X-CSE-ConnectionGUID: 8PWjR21kQAugL/3EGJ+oZg==
X-CSE-MsgGUID: i7FvyvoPSq69APkQtGmntA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="247154129"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jun 2026 15:32:41 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYWu6-00000000QKE-0Vt1;
	Sat, 13 Jun 2026 22:32:38 +0000
Date: Sun, 14 Jun 2026 06:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_unified_fs_V4 17/34]
 drivers/firmware/arm_scmi/telemetry.c:842:21: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202606140637.JVSvp6QF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_unified_fs_V4
head:   ed28087005811783e972fe7a788446936878932f
commit: 6f7836f7371988a383a82463ff1e6e1a314dc12d [17/34] firmware: arm_scmi: Add support for boot-on Telemetry
config: arc-randconfig-r132-20260613 (https://download.01.org/0day-ci/archive/20260614/202606140637.JVSvp6QF-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140637.JVSvp6QF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140637.JVSvp6QF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/arm_scmi/telemetry.c:2977:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected struct scmi_telemetry_res_info * @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:2977:16: sparse:     expected struct scmi_telemetry_res_info *
   drivers/firmware/arm_scmi/telemetry.c:2977:16: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:1938:55: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1947:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1947:24: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1947:24: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:552:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:552:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:552:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:644:48: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:645:53: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:646:53: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:647:42: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:648:39: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:686:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:686:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:686:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:709:36: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:714:30: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:715:32: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/arm_scmi/telemetry.c:842:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] grp_id @@     got unsigned int grp_id @@
   drivers/firmware/arm_scmi/telemetry.c:842:21: sparse:     expected restricted __le32 [usertype] grp_id
   drivers/firmware/arm_scmi/telemetry.c:842:21: sparse:     got unsigned int grp_id
   drivers/firmware/arm_scmi/telemetry.c:843:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:843:20: sparse:     expected restricted __le32 [usertype] flags
   drivers/firmware/arm_scmi/telemetry.c:843:20: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:849:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:851:25: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:851:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:851:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:923:38: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:943:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:943:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:943:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
>> drivers/firmware/arm_scmi/telemetry.c:990:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 [usertype] v @@     got unsigned int active_update_interval @@
   drivers/firmware/arm_scmi/telemetry.c:990:9: sparse:     expected restricted __le32 [usertype] v
   drivers/firmware/arm_scmi/telemetry.c:990:9: sparse:     got unsigned int active_update_interval
   drivers/firmware/arm_scmi/telemetry.c:1019:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:1019:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:1019:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:1136:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:1136:20: sparse:     expected restricted __le32 [usertype] flags
   drivers/firmware/arm_scmi/telemetry.c:1136:20: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:1160:28: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:1190:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 const @@
   drivers/firmware/arm_scmi/telemetry.c:1190:56: sparse:     expected unsigned int
   drivers/firmware/arm_scmi/telemetry.c:1190:56: sparse:     got restricted __le32 const
   drivers/firmware/arm_scmi/telemetry.c:1227:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:1227:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:1227:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:1438:34: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1515:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload [noderef] __iomem *payld @@     got struct payload *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1515:62: sparse:     expected struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1515:62: sparse:     got struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1551:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1551:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1551:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1551:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1551:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1551:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1553:63: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload [noderef] __iomem *payld @@     got struct payload *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1553:63: sparse:     expected struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1553:63: sparse:     got struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1591:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload *payld @@     got struct payload [noderef] __iomem *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1591:50: sparse:     expected struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1591:50: sparse:     got struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1606:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *next @@     got unsigned char [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1606:14: sparse:     expected void *next
   drivers/firmware/arm_scmi/telemetry.c:1606:14: sparse:     got unsigned char [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:1608:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 [usertype] v @@     got unsigned int @@
   drivers/firmware/arm_scmi/telemetry.c:1608:21: sparse:     expected restricted __le32 [usertype] v
   drivers/firmware/arm_scmi/telemetry.c:1608:21: sparse:     got unsigned int
   drivers/firmware/arm_scmi/telemetry.c:1662:65: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload *payld @@     got struct payload [noderef] __iomem *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1662:65: sparse:     expected struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1662:65: sparse:     got struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1799:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1823:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1823:29: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1823:29: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:1823:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg [noderef] __iomem *eplg @@     got struct eplg *_eplg @@
   drivers/firmware/arm_scmi/telemetry.c:1823:27: sparse:     expected struct eplg [noderef] __iomem *eplg
   drivers/firmware/arm_scmi/telemetry.c:1823:27: sparse:     got struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1824:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1824:48: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1858:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1862:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 [usertype] v @@     got unsigned int @@
   drivers/firmware/arm_scmi/telemetry.c:1862:17: sparse:     expected restricted __le32 [usertype] v
   drivers/firmware/arm_scmi/telemetry.c:1862:17: sparse:     got unsigned int
   drivers/firmware/arm_scmi/telemetry.c:1874:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:2012:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:2012:37: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:2012:37: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:2012:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg [noderef] __iomem *eplg @@     got struct eplg *_eplg @@
   drivers/firmware/arm_scmi/telemetry.c:2012:35: sparse:     expected struct eplg [noderef] __iomem *eplg
   drivers/firmware/arm_scmi/telemetry.c:2012:35: sparse:     got struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:2014:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct payload *payld @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:2014:31: sparse:     expected struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:2014:31: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:2020:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct payload *bts_payld @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:2020:43: sparse:     expected struct payload *bts_payld
   drivers/firmware/arm_scmi/telemetry.c:2020:43: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:2100:20: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2100:20: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2100:20: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2107:36: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2107:36: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2107:36: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2110:36: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2110:36: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2110:36: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2233:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:2233:20: sparse:     expected restricted __le32 [usertype] flags
   drivers/firmware/arm_scmi/telemetry.c:2233:20: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2235:28: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2235:28: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2235:28: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2298:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] interval @@     got restricted __le32 [usertype] @@
   drivers/firmware/arm_scmi/telemetry.c:2298:26: sparse:     expected unsigned int [usertype] interval
   drivers/firmware/arm_scmi/telemetry.c:2298:26: sparse:     got restricted __le32 [usertype]
   drivers/firmware/arm_scmi/telemetry.c:2306:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] grp_id @@     got unsigned int res_id @@
   drivers/firmware/arm_scmi/telemetry.c:2306:21: sparse:     expected restricted __le32 [usertype] grp_id
   drivers/firmware/arm_scmi/telemetry.c:2306:21: sparse:     got unsigned int res_id
   drivers/firmware/arm_scmi/telemetry.c:2307:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:2307:22: sparse:     expected restricted __le32 [usertype] control
   drivers/firmware/arm_scmi/telemetry.c:2307:22: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2308:22: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2308:22: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2308:22: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2310:22: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2310:22: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2310:22: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2311:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] sampling_rate @@     got unsigned int [assigned] [usertype] interval @@
   drivers/firmware/arm_scmi/telemetry.c:2311:28: sparse:     expected restricted __le32 [usertype] sampling_rate
   drivers/firmware/arm_scmi/telemetry.c:2311:28: sparse:     got unsigned int [assigned] [usertype] interval
   drivers/firmware/arm_scmi/telemetry.c:2441:39: sparse: sparse: cast removes address space '__iomem' of expression

vim +842 drivers/firmware/arm_scmi/telemetry.c

   825	
   826	static int scmi_telemetry_config_lookup(struct telemetry_info *ti,
   827						unsigned int grp_id, bool *enabled,
   828						unsigned int *active_update_interval)
   829	{
   830		const struct scmi_protocol_handle *ph = ti->ph;
   831		struct scmi_msg_telemetry_config_get *msg;
   832		struct scmi_msg_resp_telemetry_config_get *resp;
   833		struct scmi_xfer *t;
   834		int ret;
   835	
   836		ret = ph->xops->xfer_get_init(ph, TELEMETRY_CONFIG_GET,
   837					      sizeof(*msg), sizeof(*resp), &t);
   838		if (ret)
   839			return ret;
   840	
   841		msg = t->tx.buf;
 > 842		msg->grp_id = grp_id;
   843		msg->flags = grp_id == SCMI_TLM_GRP_INVALID ?
   844			TELEMETRY_GET_SELECTOR_ORPHANS : TELEMETRY_GET_SELECTOR_GROUP;
   845	
   846		resp = t->rx.buf;
   847		ret = ph->xops->do_xfer(ph, t);
   848		if (!ret) {
   849			*enabled = resp->control & TELEMETRY_ENABLE;
   850			*active_update_interval =
   851				SCMI_TLM_GET_UPDATE_INTERVAL(resp->sampling_rate);
   852		}
   853	
   854		ph->xops->xfer_put(ph, t);
   855	
   856		return 0;
   857	}
   858	
   859	static int scmi_telemetry_group_config_lookup(struct telemetry_info *ti,
   860						      struct scmi_telemetry_group *grp)
   861	{
   862		return scmi_telemetry_config_lookup(ti, grp->info->id, &grp->enabled,
   863						    &grp->active_update_interval);
   864	}
   865	
   866	static void iter_enabled_list_prepare_message(void *message,
   867						      unsigned int desc_index,
   868						      const void *priv)
   869	{
   870		struct scmi_msg_telemetry_de_enabled_list *msg = message;
   871	
   872		msg->index = cpu_to_le32(desc_index);
   873		msg->flags = 0;
   874	}
   875	
   876	static int iter_enabled_list_update_state(struct scmi_iterator_state *st,
   877						  const void *response, void *priv)
   878	{
   879		const struct scmi_msg_resp_telemetry_de_enabled_list *r = response;
   880	
   881		st->num_returned = le32_get_bits(r->flags, GENMASK(15, 0));
   882		st->num_remaining = le32_get_bits(r->flags, GENMASK(31, 16));
   883	
   884		if (st->rx_len < (sizeof(*r) + sizeof(r->entry[0]) * st->num_returned))
   885			return -EINVAL;
   886	
   887		/*
   888		 * total enabled is not declared previously anywhere so we
   889		 * assume it's returned+remaining on first call.
   890		 */
   891		if (!st->max_resources)
   892			st->max_resources = st->num_returned + st->num_remaining;
   893	
   894		return 0;
   895	}
   896	
   897	static int
   898	iter_enabled_list_process_response(const struct scmi_protocol_handle *ph,
   899					   const void *response,
   900					   struct scmi_iterator_state *st, void *priv)
   901	{
   902		const struct scmi_msg_resp_telemetry_de_enabled_list *r = response;
   903		const struct scmi_enabled_de_desc *desc;
   904		struct telemetry_info *ti = priv;
   905		struct telemetry_de *tde;
   906		u32 de_id;
   907		int ret;
   908	
   909		desc = &r->entry[st->loop_idx];
   910		de_id = le32_to_cpu(desc->id);
   911		if (scmi_telemetry_tde_lookup(ti, de_id)) {
   912			dev_err(ph->dev,
   913				"Found INVALID DE with DUPLICATED ID:0x%08X\n", de_id);
   914			return -EINVAL;
   915		}
   916	
   917		tde = scmi_telemetry_tde_get(ti, de_id);
   918		if (IS_ERR(tde))
   919			return PTR_ERR(tde);
   920	
   921		tde->de.info->id = de_id;
   922		tde->de.enabled = true;
   923		tde->de.tstamp_enabled = desc->mode == DE_ENABLED_WITH_TSTAMP;
   924	
   925		ret = scmi_telemetry_tde_register(ti, tde);
   926		if (ret) {
   927			scmi_telemetry_free_tde_put(ti, tde);
   928			return ret;
   929		}
   930	
   931		scmi_telemetry_de_state_update(ti, ENA_STATE, NULL, true);
   932		if (tde->de.tstamp_enabled)
   933			scmi_telemetry_de_state_update(ti, ENA_TSTAMP, NULL, true);
   934	
   935		dev_dbg(ph->dev, "Registered new ENABLED DE with ID:0x%08X\n",
   936			tde->de.info->id);
   937	
   938		return 0;
   939	}
   940	
   941	static int scmi_telemetry_enumerate_des_enabled_list(struct telemetry_info *ti)
   942	{
   943		struct scmi_telemetry_res_info *rinfo = ACCESS_PRIVATE(ti, rinfo);
   944		const struct scmi_protocol_handle *ph = ti->ph;
   945		struct scmi_iterator_ops ops = {
   946			.prepare_message = iter_enabled_list_prepare_message,
   947			.update_state = iter_enabled_list_update_state,
   948			.process_response = iter_enabled_list_process_response,
   949		};
   950		void *iter;
   951		int ret;
   952	
   953		iter = ph->hops->iter_response_init(ph, &ops, 0,
   954						    TELEMETRY_DE_ENABLED_LIST,
   955						    sizeof(u32) * 2, ti);
   956		if (IS_ERR(iter))
   957			return PTR_ERR(iter);
   958	
   959		ret = ph->hops->iter_response_run(iter);
   960		if (ret)
   961			return ret;
   962	
   963		dev_info(ti->ph->dev, "Found %u enabled DEs.\n", rinfo->num_des);
   964	
   965		return 0;
   966	}
   967	
   968	static int scmi_telemetry_initial_state_lookup(struct telemetry_info *ti)
   969	{
   970		struct device *dev = ti->ph->dev;
   971		int ret;
   972	
   973		ret = scmi_telemetry_config_lookup(ti, SCMI_TLM_GRP_INVALID,
   974						   &ti->info.enabled,
   975						   &ti->info.active_update_interval);
   976		if (ret)
   977			return ret;
   978	
   979		if (!ti->info.enabled)
   980			return 0;
   981	
   982		/*
   983		 * When Telemetry is found already enabled on the platform, proceed with
   984		 * passive discovery using DE_ENABLED_LIST and TDCF scanning: note that
   985		 * this CAN only discover DEs exposed via SHMTIs.
   986		 * FastChannel DEs need a proper DE_DESCRIPTION enumeration, while, even
   987		 * though incoming Notifications could be used for passive discovery too,
   988		 * it would carry a considerable risk of assimilating trash as DEs.
   989		 */
 > 990		dev_info(dev,
   991			 "Telemetry found enabled with update interval %ux10^%d\n",
   992			 SCMI_TLM_GET_UPDATE_INTERVAL_SECS(ti->info.active_update_interval),
   993			 SCMI_TLM_GET_UPDATE_INTERVAL_EXP(ti->info.active_update_interval));
   994		/*
   995		 * Query enabled DEs list: collect states. It will include DEs from any
   996		 * interface. Enabled groups still NOT enumerated.
   997		 */
   998		ret = scmi_telemetry_enumerate_des_enabled_list(ti);
   999		if (ret) {
  1000			dev_err(dev, FW_BUG "Cannot query enabled DE list. Abort.\n");
  1001			return ret;
  1002		}
  1003	
  1004		/* Discover DEs on SHMTis: collect states/offsets/values */
  1005		for (int id = 0; id < ti->num_shmti; id++) {
  1006			ret = scmi_telemetry_shmti_scan(ti, id, SCAN_DISCOVERY);
  1007			if (ret)
  1008				dev_warn(dev,
  1009					 "Failed discovery-scan of SHMTI ID:%d - ret:%d\n",
  1010					 id, ret);
  1011		}
  1012	
  1013		return 0;
  1014	}
  1015	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
