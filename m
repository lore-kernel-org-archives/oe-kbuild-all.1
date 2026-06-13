Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A89D314A9E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 18:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781375770; cv=none; b=uQ4F9OokhTyUhx8c6LNP1ICuSfDuyE6kP3Z/IiY29djpLbluyW0i4yu2jJ7GtO0X8EeQu2ZU6xYjrISr23W8TDA2hBYC/dLjP19sKd+sFEUg50/O3EGKYpOwRf2NxiFEVZBVFa7uPeinpjK98+Z9Nwc9T1BYBfEu2706/29qNyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781375770; c=relaxed/simple;
	bh=AVs6K8N4Lu6K7xu4qMb3+UEWSX985fF/VQ+4Nc9FCSg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M1oSgGUu0iK400AfRFVik83E4abVj8MP1O9eJ45c1Waj0he1KE8dQw50V7HwBZIjr9nAyVx3nHnRMxFAyBKK3mPI280XYlMfXH8G2+BnK/GrmzdxwjllFxAQAohdV6MJiPgX6+ivsrrn/NBpp5Uayfy95MjZKqaTaG3yGxVtdNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKZ9eKaz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKZ9eKaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781375767; x=1812911767;
  h=date:from:to:cc:subject:message-id;
  bh=AVs6K8N4Lu6K7xu4qMb3+UEWSX985fF/VQ+4Nc9FCSg=;
  b=oKZ9eKazpOlmOepp9/ZDqdqZyDfLM/lwaikLGXowmkjMnv2+ZZHUUY9M
   UD8tx8dbjmj18Obwglc6ziqRJSCqQys8UifQ30uTa8Aft7Uikbr+X95A2
   /In1K6yfrbUbWcQHCLw88Z0lrCjS2+Rw1pNy6rZG4IGjCRrEQnIw5/Tw4
   UfWZK32BR+dRPtqBPS+zYNIUrqBk5UslAGv+7CH9LBowSJL78GqurgdH2
   GeumsL6cNY9VYerioBpXhYFvD8XBogTmy5IaOua+H/gBD//lxA2ro+ryk
   ijlhYphY66Vo3cl4AJ3BHUGHll9iTQg1gyMPIZY13yCH3p/NLu3CUQcNq
   Q==;
X-CSE-ConnectionGUID: 7hZEhQcPT7OOssbvBRczuA==
X-CSE-MsgGUID: I4roFzuXQziZDIqGoBpfKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82024602"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="82024602"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 11:36:06 -0700
X-CSE-ConnectionGUID: gorGPj4QRdeiYqxct+xTiw==
X-CSE-MsgGUID: 7SdorLazRX6T2L8/dHcqSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="247167705"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2026 11:36:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYTD7-00000000QAI-2w1B;
	Sat, 13 Jun 2026 18:36:01 +0000
Date: Sun, 14 Jun 2026 02:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_unified_fs_V4 13/34]
 drivers/firmware/arm_scmi/telemetry.c:1801:31: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202606140235.XvxfkqYg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_unified_fs_V4
head:   ed28087005811783e972fe7a788446936878932f
commit: a56119dddb583b797df765c13f98378d4b88ed41 [13/34] firmware: arm_scmi: Add Telemetry configuration operations
config: arc-randconfig-r132-20260613 (https://download.01.org/0day-ci/archive/20260614/202606140235.XvxfkqYg-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140235.XvxfkqYg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140235.XvxfkqYg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/arm_scmi/telemetry.c:2227:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected struct scmi_telemetry_res_info * @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:2227:16: sparse:     expected struct scmi_telemetry_res_info *
   drivers/firmware/arm_scmi/telemetry.c:2227:16: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:1725:55: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1734:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1734:24: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1734:24: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:548:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:548:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:548:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:622:48: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:623:53: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:624:53: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:625:42: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:626:39: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:664:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:664:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:664:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:687:36: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:692:30: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:693:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:807:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:807:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:807:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:921:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:921:20: sparse:     expected restricted __le32 [usertype] flags
   drivers/firmware/arm_scmi/telemetry.c:921:20: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:945:28: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:975:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 const @@
   drivers/firmware/arm_scmi/telemetry.c:975:56: sparse:     expected unsigned int
   drivers/firmware/arm_scmi/telemetry.c:975:56: sparse:     got restricted __le32 const
   drivers/firmware/arm_scmi/telemetry.c:1012:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:1012:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:1012:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:1223:34: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1300:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload [noderef] __iomem *payld @@     got struct payload *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1300:62: sparse:     expected struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1300:62: sparse:     got struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1336:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1336:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1336:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1336:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1336:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1336:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1338:63: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload [noderef] __iomem *payld @@     got struct payload *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1338:63: sparse:     expected struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1338:63: sparse:     got struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1376:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload *payld @@     got struct payload [noderef] __iomem *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1376:50: sparse:     expected struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1376:50: sparse:     got struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1391:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *next @@     got unsigned char [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1391:14: sparse:     expected void *next
   drivers/firmware/arm_scmi/telemetry.c:1391:14: sparse:     got unsigned char [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:1393:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 [usertype] v @@     got unsigned int @@
   drivers/firmware/arm_scmi/telemetry.c:1393:21: sparse:     expected restricted __le32 [usertype] v
   drivers/firmware/arm_scmi/telemetry.c:1393:21: sparse:     got unsigned int
   drivers/firmware/arm_scmi/telemetry.c:1447:65: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload *payld @@     got struct payload [noderef] __iomem *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1447:65: sparse:     expected struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1447:65: sparse:     got struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1584:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1608:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1608:29: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1608:29: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:1608:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg [noderef] __iomem *eplg @@     got struct eplg *_eplg @@
   drivers/firmware/arm_scmi/telemetry.c:1608:27: sparse:     expected struct eplg [noderef] __iomem *eplg
   drivers/firmware/arm_scmi/telemetry.c:1608:27: sparse:     got struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1609:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1609:48: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1645:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1649:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 [usertype] v @@     got unsigned int @@
   drivers/firmware/arm_scmi/telemetry.c:1649:17: sparse:     expected restricted __le32 [usertype] v
   drivers/firmware/arm_scmi/telemetry.c:1649:17: sparse:     got unsigned int
   drivers/firmware/arm_scmi/telemetry.c:1661:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1799:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1799:37: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1799:37: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:1799:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg [noderef] __iomem *eplg @@     got struct eplg *_eplg @@
   drivers/firmware/arm_scmi/telemetry.c:1799:35: sparse:     expected struct eplg [noderef] __iomem *eplg
   drivers/firmware/arm_scmi/telemetry.c:1799:35: sparse:     got struct eplg *_eplg
>> drivers/firmware/arm_scmi/telemetry.c:1801:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct payload *payld @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1801:31: sparse:     expected struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1801:31: sparse:     got void [noderef] __iomem *
>> drivers/firmware/arm_scmi/telemetry.c:1807:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct payload *bts_payld @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1807:43: sparse:     expected struct payload *bts_payld
   drivers/firmware/arm_scmi/telemetry.c:1807:43: sparse:     got void [noderef] __iomem *
>> drivers/firmware/arm_scmi/telemetry.c:1887:20: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:1887:20: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1887:20: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:1894:36: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:1894:36: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1894:36: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:1897:36: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:1897:36: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1897:36: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2020:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:2020:20: sparse:     expected restricted __le32 [usertype] flags
   drivers/firmware/arm_scmi/telemetry.c:2020:20: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2022:28: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2022:28: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2022:28: sparse:    right side has type unsigned long
>> drivers/firmware/arm_scmi/telemetry.c:2085:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] interval @@     got restricted __le32 [usertype] @@
   drivers/firmware/arm_scmi/telemetry.c:2085:26: sparse:     expected unsigned int [usertype] interval
   drivers/firmware/arm_scmi/telemetry.c:2085:26: sparse:     got restricted __le32 [usertype]
>> drivers/firmware/arm_scmi/telemetry.c:2093:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] grp_id @@     got unsigned int res_id @@
   drivers/firmware/arm_scmi/telemetry.c:2093:21: sparse:     expected restricted __le32 [usertype] grp_id
   drivers/firmware/arm_scmi/telemetry.c:2093:21: sparse:     got unsigned int res_id
>> drivers/firmware/arm_scmi/telemetry.c:2094:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:2094:22: sparse:     expected restricted __le32 [usertype] control
   drivers/firmware/arm_scmi/telemetry.c:2094:22: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2095:22: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2095:22: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2095:22: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2097:22: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2097:22: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2097:22: sparse:    right side has type unsigned long
>> drivers/firmware/arm_scmi/telemetry.c:2098:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] sampling_rate @@     got unsigned int [assigned] [usertype] interval @@
   drivers/firmware/arm_scmi/telemetry.c:2098:28: sparse:     expected restricted __le32 [usertype] sampling_rate
   drivers/firmware/arm_scmi/telemetry.c:2098:28: sparse:     got unsigned int [assigned] [usertype] interval
   drivers/firmware/arm_scmi/telemetry.c:2196:35: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected struct scmi_telemetry_res_info [noderef] * @@     got struct scmi_telemetry_res_info * @@
   drivers/firmware/arm_scmi/telemetry.c:2196:35: sparse:     expected struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:2196:35: sparse:     got struct scmi_telemetry_res_info *
   drivers/firmware/arm_scmi/telemetry.c:2204:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:2204:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:2204:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:2253:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:2253:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:2253:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:1082:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1082:20: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1082:20: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:1306:40: sparse: sparse: non size-preserving pointer to integer cast
   drivers/firmware/arm_scmi/telemetry.c:1344:40: sparse: sparse: non size-preserving pointer to integer cast

vim +1801 drivers/firmware/arm_scmi/telemetry.c

  1768	
  1769	static int
  1770	scmi_telemetry_state_set_resp_process(struct telemetry_info *ti,
  1771					      struct scmi_telemetry_de *de,
  1772					      void *r, bool is_group)
  1773	{
  1774		struct scmi_msg_resp_telemetry_de_configure *resp = r;
  1775		u32 sid = le32_to_cpu(resp->shmti_id);
  1776	
  1777		/* Update DE SHMTI and offset, if applicable */
  1778		if (IS_SHMTI_ID_VALID(sid)) {
  1779			if (sid >= ti->num_shmti)
  1780				return -EPROTO;
  1781	
  1782			/*
  1783			 * Update SHMTI/offset while skipping non-SHMTI-DEs like
  1784			 * FCs and notif-only.
  1785			 */
  1786			if (!is_group) {
  1787				struct telemetry_de *tde;
  1788				struct payload *payld;
  1789				u32 de_offs;
  1790	
  1791				de_offs = le32_to_cpu(resp->shmti_de_offset);
  1792				if (de_offs >= ti->shmti[sid].len - de->info->data_sz)
  1793					return -EPROTO;
  1794	
  1795				tde = to_tde(de);
  1796				tde->base = ti->shmti[sid].base;
  1797				tde->offset = de_offs;
  1798				/* A handy reference to the Epilogue updated */
  1799				tde->eplg = SHMTI_EPLG(&ti->shmti[sid]);
  1800	
> 1801				payld = tde->base + tde->offset;
  1802				if (USE_BLK_TS(payld) && !tde->bts) {
  1803					struct payload *bts_payld;
  1804					u32 bts_offs;
  1805	
  1806					bts_offs = le32_to_cpu(resp->blk_ts_offset);
> 1807					bts_payld = (bts_offs) ? tde->base + bts_offs : NULL;
  1808					tde->bts = scmi_telemetry_blkts_bind(ti->ph->dev,
  1809									     &ti->shmti[sid],
  1810									     payld,
  1811									     &ti->xa_lines,
  1812									     bts_payld);
  1813					if (WARN_ON(!tde->bts))
  1814						return -EPROTO;
  1815				}
  1816			} else {
  1817				int ret;
  1818	
  1819				/*
  1820				 * A full SHMTI scan is needed when enabling a
  1821				 * group or its timestamps in order to retrieve
  1822				 * offsets: note that when group-timestamp is
  1823				 * enabled for composing DEs a re-scan is needed
  1824				 * since some DEs could have been relocated due
  1825				 * to lack of space in the TDCF.
  1826				 */
  1827				ret = scmi_telemetry_shmti_scan(ti, sid, SCAN_UPDATE);
  1828				if (ret)
  1829					dev_warn(ti->ph->dev,
  1830						 "Failed group-scan of SHMTI ID:%d - ret:%d\n",
  1831						 sid, ret);
  1832			}
  1833		} else if (!is_group) {
  1834			/* Unlink the related BLK_TS/UUID lines on disable */
  1835			scmi_telemetry_de_unlink(de);
  1836		}
  1837	
  1838		return 0;
  1839	}
  1840	
  1841	static int __scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
  1842					      bool is_group, bool *enable,
  1843					      bool *enabled_state, bool *tstamp,
  1844					      bool *tstamp_enabled_state, void *obj)
  1845	{
  1846		struct scmi_msg_resp_telemetry_de_configure *resp;
  1847		struct scmi_msg_telemetry_de_configure *msg;
  1848		struct telemetry_info *ti = ph->get_priv(ph);
  1849		struct scmi_telemetry_de *de = !is_group ? obj : NULL;
  1850		struct scmi_telemetry_group *grp = is_group ? obj : NULL;
  1851		unsigned int obj_id = !is_group ? de->info->id : grp->info->id;
  1852		struct scmi_xfer *t;
  1853		int ret;
  1854	
  1855		if (!enabled_state || !tstamp_enabled_state)
  1856			return -EINVAL;
  1857	
  1858		/* Is anything to do at all on this DE ? */
  1859		if (!is_group && (!enable || *enable == *enabled_state) &&
  1860		    (!tstamp || *tstamp == *tstamp_enabled_state))
  1861			return 0;
  1862	
  1863		/*
  1864		 * DE is currently disabled AND no enable state change was requested,
  1865		 * while timestamp is being changed: update only local state...no need
  1866		 * to send a message.
  1867		 */
  1868		if (!is_group && !enable && !*enabled_state) {
  1869			if (de->tstamp_support)
  1870				scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
  1871							       tstamp_enabled_state,
  1872							       *tstamp);
  1873	
  1874			return 0;
  1875		}
  1876	
  1877		ret = ph->xops->xfer_get_init(ph, TELEMETRY_DE_CONFIGURE,
  1878					      sizeof(*msg), sizeof(*resp), &t);
  1879		if (ret)
  1880			return ret;
  1881	
  1882		msg = t->tx.buf;
  1883		/* Note that BOTH DE and GROUPS have a first ID field.. */
  1884		msg->id = cpu_to_le32(obj_id);
  1885		/* Default to disable mode for one DE */
  1886		msg->flags = DE_DISABLE_ONE;
> 1887		msg->flags |= FIELD_PREP(GENMASK(3, 3),
  1888					 is_group ? EVENT_GROUP : EVENT_DE);
  1889	
  1890		if ((!enable && *enabled_state) || (enable && *enable)) {
  1891			/* Already enabled but tstamp_enabled state changed */
  1892			if (tstamp) {
  1893				/* Here, tstamp cannot be NULL too */
  1894				msg->flags |= *tstamp ? DE_ENABLE_WTH_TSTAMP :
  1895					DE_ENABLE_NO_TSTAMP;
  1896			} else {
  1897				msg->flags |= *tstamp_enabled_state ?
  1898					DE_ENABLE_WTH_TSTAMP : DE_ENABLE_NO_TSTAMP;
  1899			}
  1900		}
  1901	
  1902		resp = t->rx.buf;
  1903		ret = ph->xops->do_xfer(ph, t);
  1904		if (!ret) {
  1905			ret = scmi_telemetry_state_set_resp_process(ti, obj, resp, is_group);
  1906			if (!ret) {
  1907				/* Update cached state on success */
  1908				if (enable) {
  1909					if (!is_group)
  1910						scmi_telemetry_de_state_update(ti, ENA_STATE,
  1911									       enabled_state,
  1912									       *enable);
  1913					else
  1914						*enabled_state = *enable;
  1915				}
  1916				if (tstamp) {
  1917					if (!is_group) {
  1918						if (de->tstamp_support)
  1919							scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
  1920										       tstamp_enabled_state,
  1921										       *tstamp);
  1922					} else {
  1923						*tstamp_enabled_state = *tstamp;
  1924					}
  1925				}
  1926	
  1927				if (is_group)
  1928					scmi_telemetry_group_state_update(ti, grp, enable,
  1929									  tstamp);
  1930			}
  1931		}
  1932	
  1933		ph->xops->xfer_put(ph, t);
  1934	
  1935		return ret;
  1936	}
  1937	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
