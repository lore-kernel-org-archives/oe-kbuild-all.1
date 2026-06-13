Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452BD3368AB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 20:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781382389; cv=none; b=rAOl06ycUgDfFhpKdDOjYwI9/PF9YYmDW+cpOmEPg4rPetU3wZlk6thF5J1701vRT/UU/hVO8HBayZiPrm4cMcClajBdVF7fAIySjeSbz5rUkHxvTqYcmoDrhmwOnxu8a9jw9vbP+ZJ+FLv4MGOdnhd21Cvx9aQpVmxsmzJPgag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781382389; c=relaxed/simple;
	bh=VtaMtHUF4bwK2vcVL0a1sFA17RxooKbws11OcubfiOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BwA/wHhv+fkY3pDGZT4tsfJxIzuWe/eE/VYk/6yJXudnE4sb42i9o0VoISbM4F08jKTc9fMEOmtU3jyPzjNtMAhmygRyqTbbzoKuspQiV/7LsW3g6gn0N8Lb3Fk7wqX/UoFit2xWugak6cCg7KK1NUiW9a+WSFBlixXlJ8jX86g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGhCQLLH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGhCQLLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781382386; x=1812918386;
  h=date:from:to:cc:subject:message-id;
  bh=VtaMtHUF4bwK2vcVL0a1sFA17RxooKbws11OcubfiOs=;
  b=ZGhCQLLHlSdFkX6YG5XYXnfevm0aO/mfF6Be1GawbK9Aksb61vQOT9GE
   RRpbRErjZpcoDUfOcE3tFoA97RNzhYYUK0sx4vvzZ+QemmhwR321pXVwi
   oUDqIkjC0Msqc26TZT6LAiReMu6FQCMn7S8HiBwTXkb4RbUW8g6Mxlm29
   Ihdby1IDyumpYnyYx1c6X76DUhqKvRzeQ/3hxHKQXQKThyC5VOg+Ds6fs
   HAbkMwzwx9fpLPj3AEitymRiMXqapWYx100GjueGTyB74KXSKgGGT2YOe
   043M6s+qjkTb6APHQO6u77fuxQUKI45FW7gIrdNKz1crTwNRdgJU/e6jK
   w==;
X-CSE-ConnectionGUID: OGu2oThLQbK/ISN3/a3opw==
X-CSE-MsgGUID: zlG5w9X4Qm+k9ssrQKGHYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="84748002"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="84748002"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 13:26:25 -0700
X-CSE-ConnectionGUID: Hd7odzGYSMuyiNi7fwSmfA==
X-CSE-MsgGUID: Gy6ngH3GQxmxc8Q/RQwVzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="251390458"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Jun 2026 13:26:24 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYUvt-00000000QGM-1e9D;
	Sat, 13 Jun 2026 20:26:21 +0000
Date: Sun, 14 Jun 2026 04:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_unified_fs_V4 14/34]
 drivers/firmware/arm_scmi/telemetry.c:2246:31: sparse: sparse: incorrect type
 in return expression (different address spaces)
Message-ID: <202606140455.3K8Fziww-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_unified_fs_V4
head:   ed28087005811783e972fe7a788446936878932f
commit: ae63fff933f721d22cd5eec34112097e91df5856 [14/34] firmware: arm_scmi: Add Telemetry DataEvent read capabilities
config: arc-randconfig-r132-20260613 (https://download.01.org/0day-ci/archive/20260614/202606140455.3K8Fziww-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140455.3K8Fziww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140455.3K8Fziww-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/arm_scmi/telemetry.c:710:30: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:711:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:825:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:825:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:825:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:939:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:939:20: sparse:     expected restricted __le32 [usertype] flags
   drivers/firmware/arm_scmi/telemetry.c:939:20: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:963:28: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:993:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 const @@
   drivers/firmware/arm_scmi/telemetry.c:993:56: sparse:     expected unsigned int
   drivers/firmware/arm_scmi/telemetry.c:993:56: sparse:     got restricted __le32 const
   drivers/firmware/arm_scmi/telemetry.c:1030:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:1030:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:1030:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:1241:34: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1318:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload [noderef] __iomem *payld @@     got struct payload *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1318:62: sparse:     expected struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1318:62: sparse:     got struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1354:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1354:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1354:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1354:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1354:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1354:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1356:63: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload [noderef] __iomem *payld @@     got struct payload *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1356:63: sparse:     expected struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1356:63: sparse:     got struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1394:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload *payld @@     got struct payload [noderef] __iomem *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1394:50: sparse:     expected struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1394:50: sparse:     got struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1409:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *next @@     got unsigned char [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1409:14: sparse:     expected void *next
   drivers/firmware/arm_scmi/telemetry.c:1409:14: sparse:     got unsigned char [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:1411:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 [usertype] v @@     got unsigned int @@
   drivers/firmware/arm_scmi/telemetry.c:1411:21: sparse:     expected restricted __le32 [usertype] v
   drivers/firmware/arm_scmi/telemetry.c:1411:21: sparse:     got unsigned int
   drivers/firmware/arm_scmi/telemetry.c:1465:65: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload *payld @@     got struct payload [noderef] __iomem *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1465:65: sparse:     expected struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1465:65: sparse:     got struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1602:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1626:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1626:29: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1626:29: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:1626:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg [noderef] __iomem *eplg @@     got struct eplg *_eplg @@
   drivers/firmware/arm_scmi/telemetry.c:1626:27: sparse:     expected struct eplg [noderef] __iomem *eplg
   drivers/firmware/arm_scmi/telemetry.c:1626:27: sparse:     got struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1627:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1627:48: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1662:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1666:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 [usertype] v @@     got unsigned int @@
   drivers/firmware/arm_scmi/telemetry.c:1666:17: sparse:     expected restricted __le32 [usertype] v
   drivers/firmware/arm_scmi/telemetry.c:1666:17: sparse:     got unsigned int
   drivers/firmware/arm_scmi/telemetry.c:1678:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1816:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1816:37: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1816:37: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:1816:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg [noderef] __iomem *eplg @@     got struct eplg *_eplg @@
   drivers/firmware/arm_scmi/telemetry.c:1816:35: sparse:     expected struct eplg [noderef] __iomem *eplg
   drivers/firmware/arm_scmi/telemetry.c:1816:35: sparse:     got struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1818:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct payload *payld @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1818:31: sparse:     expected struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1818:31: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:1824:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct payload *bts_payld @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1824:43: sparse:     expected struct payload *bts_payld
   drivers/firmware/arm_scmi/telemetry.c:1824:43: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:1904:20: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:1904:20: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1904:20: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:1911:36: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:1911:36: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1911:36: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:1914:36: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:1914:36: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1914:36: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2037:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:2037:20: sparse:     expected restricted __le32 [usertype] flags
   drivers/firmware/arm_scmi/telemetry.c:2037:20: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2039:28: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2039:28: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2039:28: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2102:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] interval @@     got restricted __le32 [usertype] @@
   drivers/firmware/arm_scmi/telemetry.c:2102:26: sparse:     expected unsigned int [usertype] interval
   drivers/firmware/arm_scmi/telemetry.c:2102:26: sparse:     got restricted __le32 [usertype]
   drivers/firmware/arm_scmi/telemetry.c:2110:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] grp_id @@     got unsigned int res_id @@
   drivers/firmware/arm_scmi/telemetry.c:2110:21: sparse:     expected restricted __le32 [usertype] grp_id
   drivers/firmware/arm_scmi/telemetry.c:2110:21: sparse:     got unsigned int res_id
   drivers/firmware/arm_scmi/telemetry.c:2111:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:2111:22: sparse:     expected restricted __le32 [usertype] control
   drivers/firmware/arm_scmi/telemetry.c:2111:22: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2112:22: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2112:22: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2112:22: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2114:22: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2114:22: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2114:22: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2115:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] sampling_rate @@     got unsigned int [assigned] [usertype] interval @@
   drivers/firmware/arm_scmi/telemetry.c:2115:28: sparse:     expected restricted __le32 [usertype] sampling_rate
   drivers/firmware/arm_scmi/telemetry.c:2115:28: sparse:     got unsigned int [assigned] [usertype] interval
   drivers/firmware/arm_scmi/telemetry.c:2245:39: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/firmware/arm_scmi/telemetry.c:2246:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct payload [noderef] __iomem * @@     got void * @@
   drivers/firmware/arm_scmi/telemetry.c:2246:31: sparse:     expected struct payload [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:2246:31: sparse:     got void *
   drivers/firmware/arm_scmi/telemetry.c:2249:13: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 [usertype] v @@     got unsigned int @@
   drivers/firmware/arm_scmi/telemetry.c:2249:13: sparse:     expected restricted __le32 [usertype] v
   drivers/firmware/arm_scmi/telemetry.c:2249:13: sparse:     got unsigned int
   drivers/firmware/arm_scmi/telemetry.c:2251:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct payload [noderef] __iomem * @@     got void * @@
   drivers/firmware/arm_scmi/telemetry.c:2251:31: sparse:     expected struct payload [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:2251:31: sparse:     got void *
   drivers/firmware/arm_scmi/telemetry.c:2254:13: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:2256:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct payload [noderef] __iomem * @@     got void * @@
   drivers/firmware/arm_scmi/telemetry.c:2256:31: sparse:     expected struct payload [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:2256:31: sparse:     got void *
   drivers/firmware/arm_scmi/telemetry.c:2265:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct payload [noderef] __iomem * @@     got void * @@
   drivers/firmware/arm_scmi/telemetry.c:2265:31: sparse:     expected struct payload [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:2265:31: sparse:     got void *
   drivers/firmware/arm_scmi/telemetry.c:2446:25: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2446:25: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2446:25: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2446:25: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2446:25: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2446:25: sparse: sparse: cast to restricted __le32
>> drivers/firmware/arm_scmi/telemetry.c:2491:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] grp_id @@     got int grp_id @@
   drivers/firmware/arm_scmi/telemetry.c:2491:21: sparse:     expected restricted __le32 [usertype] grp_id
   drivers/firmware/arm_scmi/telemetry.c:2491:21: sparse:     got int grp_id
   drivers/firmware/arm_scmi/telemetry.c:2492:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:2492:22: sparse:     expected restricted __le32 [usertype] control
   drivers/firmware/arm_scmi/telemetry.c:2492:22: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2493:22: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2493:22: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2493:22: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:2495:22: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:2495:22: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:2495:22: sparse:    right side has type unsigned long
>> drivers/firmware/arm_scmi/telemetry.c:2504:63: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int num_dwords @@     got restricted __le32 [usertype] num_dwords @@
   drivers/firmware/arm_scmi/telemetry.c:2504:63: sparse:     expected unsigned int num_dwords
   drivers/firmware/arm_scmi/telemetry.c:2504:63: sparse:     got restricted __le32 [usertype] num_dwords
>> drivers/firmware/arm_scmi/telemetry.c:2505:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] *dwords @@     got restricted __le32 * @@
   drivers/firmware/arm_scmi/telemetry.c:2505:58: sparse:     expected unsigned int [usertype] *dwords
   drivers/firmware/arm_scmi/telemetry.c:2505:58: sparse:     got restricted __le32 *
   drivers/firmware/arm_scmi/telemetry.c:2605:35: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected struct scmi_telemetry_res_info [noderef] * @@     got struct scmi_telemetry_res_info * @@
   drivers/firmware/arm_scmi/telemetry.c:2605:35: sparse:     expected struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:2605:35: sparse:     got struct scmi_telemetry_res_info *
   drivers/firmware/arm_scmi/telemetry.c:2613:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:2613:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:2613:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:2662:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:2662:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:2662:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:1100:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1100:20: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1100:20: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:1324:40: sparse: sparse: non size-preserving pointer to integer cast
   drivers/firmware/arm_scmi/telemetry.c:1362:40: sparse: sparse: non size-preserving pointer to integer cast

vim +2246 drivers/firmware/arm_scmi/telemetry.c

  2057	
  2058	static int
  2059	scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
  2060					    unsigned int res_id, bool grp_ignore,
  2061					    bool *enable,
  2062					    unsigned int *update_interval_ms,
  2063					    enum scmi_telemetry_collection *mode)
  2064	{
  2065		enum scmi_telemetry_collection *current_mode, next_mode;
  2066		struct telemetry_info *ti = ph->get_priv(ph);
  2067		struct scmi_msg_telemetry_config_set *msg;
  2068		unsigned int *active_update_interval;
  2069		struct scmi_xfer *t;
  2070		bool tlm_enable;
  2071		u32 interval;
  2072		int ret;
  2073	
  2074		if (mode && *mode == SCMI_TLM_NOTIFICATION &&
  2075		    !ti->info.continuos_update_support)
  2076			return -EINVAL;
  2077	
  2078		if (res_id != SCMI_TLM_GRP_INVALID && res_id >= ti->info.base.num_groups)
  2079			return -EINVAL;
  2080	
  2081		if (res_id == SCMI_TLM_GRP_INVALID || grp_ignore) {
  2082			active_update_interval = &ti->info.active_update_interval;
  2083			current_mode = &ti->info.current_mode;
  2084		} else {
  2085			struct scmi_telemetry_res_info *rinfo;
  2086	
  2087			rinfo = ti->res_get(ti);
  2088			active_update_interval =
  2089				&rinfo->grps[res_id].active_update_interval;
  2090			current_mode = &rinfo->grps[res_id].current_mode;
  2091		}
  2092	
  2093		if (!enable && !update_interval_ms && (!mode || *mode == *current_mode))
  2094			return 0;
  2095	
  2096		ret = ph->xops->xfer_get_init(ph, TELEMETRY_CONFIG_SET,
  2097					      sizeof(*msg), 0, &t);
  2098		if (ret)
  2099			return ret;
  2100	
  2101		if (!update_interval_ms)
  2102			interval = cpu_to_le32(*active_update_interval);
  2103		else
  2104			interval = *update_interval_ms;
  2105	
  2106		tlm_enable = enable ? *enable : ti->info.enabled;
  2107		next_mode = mode ? *mode : *current_mode;
  2108	
  2109		msg = t->tx.buf;
  2110		msg->grp_id = res_id;
  2111		msg->control = tlm_enable ? TELEMETRY_ENABLE : 0;
> 2112		msg->control |= grp_ignore ? TELEMETRY_SET_SELECTOR_ALL :
  2113			TELEMETRY_SET_SELECTOR_GROUP;
  2114		msg->control |= TELEMETRY_MODE_SET(next_mode);
  2115		msg->sampling_rate = interval;
  2116		ret = ph->xops->do_xfer(ph, t);
  2117		if (!ret) {
  2118			ti->info.enabled = tlm_enable;
  2119			*current_mode = next_mode;
  2120			ti->info.notif_enabled = *current_mode == SCMI_TLM_NOTIFICATION;
  2121			if (update_interval_ms)
  2122				*active_update_interval = interval;
  2123		}
  2124	
  2125		ph->xops->xfer_put(ph, t);
  2126	
  2127		return ret;
  2128	}
  2129	
  2130	static inline void
  2131	scmi_telemetry_de_data_fc_read(struct telemetry_de *tde,
  2132				       struct scmi_telemetry_de_sample *sample)
  2133	{
  2134		struct fc_tsline __iomem *fc = tde->base + tde->offset;
  2135	
  2136		sample->val = LINE_DATA_GET(fc);
  2137		sample->tstamp = LINE_TSTAMP_GET(fc);
  2138	
  2139		/* Trace originally read tstamp */
  2140		trace_scmi_tlm_collect(sample->tstamp, tde->de.info->id, sample->val,
  2141				       "FC_READ");
  2142	
  2143		scmi_telemetry_tde_cache_update(tde, sample, NULL);
  2144	}
  2145	
  2146	static void scmi_telemetry_scan_update(struct telemetry_info *ti)
  2147	{
  2148		struct telemetry_de *tde;
  2149	
  2150		/* Scan all SHMTIs ... */
  2151		for (int id = 0; id < ti->num_shmti; id++) {
  2152			int ret;
  2153	
  2154			ret = scmi_telemetry_shmti_scan(ti, id, SCAN_LOOKUP);
  2155			if (ret)
  2156				dev_warn(ti->ph->dev,
  2157					 "Failed update-scan of SHMTI ID:%d - ret:%d\n",
  2158					 id, ret);
  2159		}
  2160	
  2161		if (!ti->info.fc_support)
  2162			return;
  2163	
  2164		/* Need to enumerate resources to access fastchannels */
  2165		ti->res_get(ti);
  2166		list_for_each_entry(tde, &ti->fcs_des, item) {
  2167			struct scmi_telemetry_de_sample sample = {};
  2168	
  2169			if (!tde->de.enabled)
  2170				continue;
  2171	
  2172			/* Only for the sake of updating TDE cache */
  2173			scmi_telemetry_de_data_fc_read(tde, &sample);
  2174		}
  2175	}
  2176	
  2177	/*
  2178	 * TDCF and TS Line Management Notes
  2179	 * ---------------------------------
  2180	 *
  2181	 * TDCF Payload Metadata notable bits:
  2182	 *  - Bit[3]: USE BLK Tstamp
  2183	 *  - Bit[2]: Line-Extension Field present (LineTstamp)
  2184	 *  - Bit[1]: Tstamp VALID
  2185	 *  - Bit[0]: Data INVALID
  2186	 *
  2187	 * CASE_1:
  2188	 * -------
  2189	 *	+ A DE is enabled with timestamp disabled, so the TS fields are
  2190	 *	  NOT present
  2191	 *	  -> BIT[3:0] = 0000b
  2192	 *
  2193	 *	  - 1/A LINE_TSTAMP
  2194	 *	  ------------------
  2195	 *	     + that DE is then 're-enabled' with TS: so it was ON, it remains
  2196	 *	       ON but using DE_CONFIGURE I now enabled also TS, so the
  2197	 *	       platform relocates it at the end of the SHMTI and return the
  2198	 *	       new offset
  2199	 *	       -> BIT[3:0] = 0110b
  2200	 *
  2201	 *	  - 1/B BLK_TSTAMP
  2202	 *	  ------------------
  2203	 *	     + that DE is then 're-enabled' with BLK TS: so it was ON, it
  2204	 *	       remains ON but using DE_CONFIGURE, we now also enabled the TS,
  2205	 *	       so the platform will:
  2206	 *	       - IF a preceding BLK_TS line exist (with same clk rate)
  2207	 *	         it relocates the DE at the end of the SHMTI and return the
  2208	 *	         new offset (if there is enough room, if not in another SHMTI)
  2209	 *	       - IF a preceding BLK_TS line DOES NOT exist (with same clk rate)
  2210	 *	         it creates a new BLK_TS line at the end of the SHMTI and then
  2211	 *	         relocates the DE after the new BLK_TS and return the
  2212	 *	         new offset (if there is enough room, if not in another SHMTI)
  2213	 *	       -> BIT[3:1] = 1010b
  2214	 *
  2215	 *	+ the hole left from the relocated DE can be reused by the platform
  2216	 *	to fit another equally sized DE. (i.e. without shuffling around any
  2217	 *	other enabled DE, since that would cause a change of the known offset)
  2218	 *	anyway it will be marked as:
  2219	 *	-> BIT[3:0] = 0101b iff it was a LINE_TSTAMP
  2220	 *	-> BIT[3:0] = 0001b iff it was a BLK_TSTAMP
  2221	 *
  2222	 * CASE_2:
  2223	 * -------
  2224	 *	+ A DE is enabled with LINE timestamp enabled, so the TS_Line is there
  2225	 *	  -> BIT[3:0] = 0110b
  2226	 *	+ that DE has its timestamp disabled: again, you can do this without
  2227	 *	  disabling it fully but just disabling the TS, so now that TS_line
  2228	 *	  fields are still physically there but NOT valid
  2229	 *	  -> BIT[3:0] = 0100b
  2230	 *	+ the hole from the timestamp remain there unused until
  2231	 *		- you enable again the TS so the hole is used again
  2232	 *		  -> BIT[3:0] = 0110b
  2233	 *			OR
  2234	 *		- you disable fully the DE and then re-enable it with the TS
  2235	 *		  -> potentially CASE_1 the DE is relocated on enable
  2236	 *	+ same kind of dynamic applies if the DE had a BLK_TS line
  2237	 */
  2238	static struct payload __iomem *
  2239	scmi_telemetry_tdcf_de_payld_get(struct telemetry_de *tde)
  2240	{
  2241		struct payload __iomem *payld;
  2242	
  2243		payld = tde->base + tde->offset;
  2244		if (DATA_INVALID(payld)) {
  2245			trace_scmi_tlm_access(PAYLD_ID(payld), "DE_DATA_INVALID", 0, 0);
> 2246			return ERR_PTR(-EINVAL);
  2247		}
  2248	
  2249		if (IS_BLK_TS_LINE(payld)) {
  2250			trace_scmi_tlm_access(tde->de.info->id, "BAD_DE_META", 0, 0);
  2251			return ERR_PTR(-EPROTO);
  2252		}
  2253	
  2254		if (PAYLD_ID(payld) != tde->de.info->id) {
  2255			trace_scmi_tlm_access(tde->de.info->id, "DE_ID_MISMATCH", 0, 0);
  2256			return ERR_PTR(-ENODEV);
  2257		}
  2258	
  2259		/*
  2260		 * A valid line using BLK_TS should have been initialized with the
  2261		 * related BLK_TS when enabled.
  2262		 */
  2263		if (WARN_ON((USE_BLK_TS(payld) && !tde->bts))) {
  2264			trace_scmi_tlm_access(tde->de.info->id, "BAD_USE_BLK_TS", 0, 0);
> 2265			return ERR_PTR(-EPROTO);
  2266		}
  2267	
  2268		return payld;
  2269	}
  2270	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
