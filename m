Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600458;
	b=QhEb1dPOKeyQEQGL90LwgUn5W3RCG/7y6iLHT5XjVESBcmYAqj8Q9IGXl1v+UVUTju+H
	 WSLx9IcWkJ446J2bPJ5ggPe0bqEsC38tUaguyQa+q+Uk7DGN4QVoRAHz8bNQ/bYDTzE3L
	 PpDQxfCIGx+BILlZxuyrA78jufN8Xt5w+zdI2h5JlvfV5O8m4tw2StB1XU7efxR6EFVZw
	 y5qUrmCCG+xZgmLU2rmT9UoM7qDMWox2vHN2MSmRzpyL22/knalvxdPcegtVzHxuWCJzF
	 tdrBQMOC6gpr0UcHCpvkWbYDD+ZxusfrdRuYnUviPuOvu/2I4wOyFkCjKBUnLHIV0Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600458;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UTlFNSY9oqZtQieXCf7AI3aaHCr5vHBjPpEIfudmX2g=;
	b=JhZP6EZkTExbHvwd3DTglGITkv/C4I/TtvPl7/JuZxG3cG2wBP4SldZeYllA3OrrapMm
	 UbYXQo0J2NQjznCB8s9eGuMgzusFHm5Rv/jZdboPGVT3gQxw1qubNY8MgKWXUDOs0b8H1
	 ayw1di7haBkHjajrXIwJDz5/1ghXsqOMKW0tPxoXkLPtSlX/b/XTH3NTS8ggiV0bYnnX2
	 QAI/CTI+20sb/SgzbvRxpKEMFo4rvz/U6UMXGIZqn1OoUyuebE85ykwkMEl1SUAtFl9YP
	 475eYA/gbXLnTAZ771eMFwOTIq0WoB+Z1ZZdXw87vPjZKGiEPcvGlYspyglP321DJYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YWjBFMNr;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9CB606A333
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 20:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF9CB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YWjBFMNr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794600458; x=1826136458;
  h=date:from:to:cc:subject:message-id;
  bh=yGvRRy6qrUluNyQPjQQuU8POBOzCC2O/wVKI8tDDmlQ=;
  b=YWjBFMNrszhO6VLjuHi3PN6tnJPUNO09cvIB68tyUY5R2nDa+9YaIz5z
   E5nCt0ZtwEn3P1CxBmgSUjNn6YrRNtvicqgEBD9pGIiBhARMExC5Mp2MG
   hnfZmR9vUHmrCefs/5Ppzc2pyQ7fP1/aQmGix4wznbU4paHjtWfuTxnfH
   s0uVaXigB7mrfr8ss3rOcQgOV/HGW+YG8YAww/rNHlCIll4jN+25dMXnB
   vfahsnk+XM7AYPzznKH7PwOzjjEBEPtinQIBgu5x0wzxYGc6lNo8eQ2yP
   YMx8LBPOfIxh1cfVxNIhVqRy8FWiOReZqF2KIucgXGiAHCbCrKGxflMoN
   Q==;
X-CSE-ConnectionGUID: ZdpYx5ejSRmS5PKSQZqroA==
X-CSE-MsgGUID: botpDsCiSJ26G+qIeaVPIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3493957"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3493957"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 12:07:38 -0800
X-CSE-ConnectionGUID: bQf6pA8NTom90ZVyBLk9FQ==
X-CSE-MsgGUID: 7A3NxWEjR8uSa2vQCiTLzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9347804"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 12:07:36 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRxYb-000000001Kl-3zNY;
	Fri, 13 Nov 2026 20:07:33 +0000
Date: Fri, 13 Nov 2026 21:06:47 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 5/5]
 drivers/scsi/ufs/ufshpb.c:341:27: sparse: sparse: cast from restricted __be64
Message-ID: <202611132103.kLx2p0dj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   1691ede0a60c1fb31b68de026528cd7dda21029e
commit: bd4a84253c5edcd9224af565d9cb0089c63c4d5b [5/5] UPSTREAM:  core: Add L2P entry swap quirk for Micron UFS
config: arm-randconfig-r2301-20261113 (https://download.01.org/0day-ci/archive/20261113/202611132103.kLx2p0dj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611132103.kLx2p0dj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611132103.kLx2p0dj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/ufs/ufshpb.c:341:27: sparse: sparse: cast from restricted __be64
   drivers/scsi/ufs/ufshpb.c:341:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __be64 [usertype] ppn @@
   drivers/scsi/ufs/ufshpb.c:341:27: sparse:     expected unsigned long long [usertype] val
   drivers/scsi/ufs/ufshpb.c:341:27: sparse:     got restricted __be64 [usertype] ppn
>> drivers/scsi/ufs/ufshpb.c:341:27: sparse: sparse: cast from restricted __be64
>> drivers/scsi/ufs/ufshpb.c:341:27: sparse: sparse: cast from restricted __be64
>> drivers/scsi/ufs/ufshpb.c:341:27: sparse: sparse: cast from restricted __be64
>> drivers/scsi/ufs/ufshpb.c:341:27: sparse: sparse: cast from restricted __be64
>> drivers/scsi/ufs/ufshpb.c:341:27: sparse: sparse: cast from restricted __be64
>> drivers/scsi/ufs/ufshpb.c:341:27: sparse: sparse: cast from restricted __be64
>> drivers/scsi/ufs/ufshpb.c:341:27: sparse: sparse: cast from restricted __be64
>> drivers/scsi/ufs/ufshpb.c:341:27: sparse: sparse: cast from restricted __be64
   drivers/scsi/ufs/ufshpb.c:341:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] ppn_tmp @@     got unsigned long long @@
   drivers/scsi/ufs/ufshpb.c:341:25: sparse:     expected restricted __be64 [usertype] ppn_tmp
   drivers/scsi/ufs/ufshpb.c:341:25: sparse:     got unsigned long long

vim +341 drivers/scsi/ufs/ufshpb.c

   330	
   331	static void
   332	ufshpb_set_hpb_read_to_upiu(struct ufs_hba *hba, struct ufshpb_lu *hpb,
   333				    struct ufshcd_lrb *lrbp, u32 lpn, __be64 ppn,
   334				    u8 transfer_len, int read_id)
   335	{
   336		unsigned char *cdb = lrbp->cmd->cmnd;
   337		__be64 ppn_tmp = ppn;
   338		cdb[0] = UFSHPB_READ;
   339	
   340		if (hba->dev_quirks & UFS_DEVICE_QUIRK_SWAP_L2P_ENTRY_FOR_HPB_READ)
 > 341			ppn_tmp = swab64(ppn);
   342	
   343		/* ppn value is stored as big-endian in the host memory */
   344		memcpy(&cdb[6], &ppn_tmp, sizeof(__be64));
   345		cdb[14] = transfer_len;
   346		cdb[15] = read_id;
   347	
   348		lrbp->cmd->cmd_len = UFS_CDB_SIZE;
   349	}
   350	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
