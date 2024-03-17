Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6774C9A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 06:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710657077; cv=none; b=o/sBfPsnMQq7qumtUrolYuhvN/mFsegVXdBOPs8j5Rz5+ZfbGNuehk6wMErIRG7waBoqrWmW4yMkxijCgzpeHLBMDOtSVzSSuqzF5rvt+LUsbhCt21puXFF63Hbdare3Dj2q+uh5Ue05AWTKDUaGV/bRPgOTO93fo14g6e/VsZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710657077; c=relaxed/simple;
	bh=eNRJH2SeuFQn6Rld4dIc33VYlqenTv4FJ3ag5mw/hIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IRJCttbMl/2bGXqT9JfHz7Jr++GBvuLmIeKyGRUAq8IKfOVPeVXHh0pZAF0qyBBzMv/cCWtPGTU9rbbyB+Q0y0ynQ5uhRevbXpZ2AbF7BQHRasLQ9L6kRGtbZNRrCFiYxHzKINEop01wbMuR9eYQjZPvWoOLTSE9dtZQvEvbfqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KX/4LcaG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KX/4LcaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710657075; x=1742193075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eNRJH2SeuFQn6Rld4dIc33VYlqenTv4FJ3ag5mw/hIA=;
  b=KX/4LcaGg+0B5mOdUOtG7OJG8ZgXgAYGWF2ZnfzBGa24W0wHDOeGyDOo
   mNCetUCtAFvhy+kAeVD3ELQBEsoWB+ueNCqafmB83ZGC4k70CXFI0IZAC
   YSlZR0arfPkZqgp2FivGPC+h+Zwq9r3Uev6trqSHFqQEwv8TJkKgLkOCM
   JctqbCUZd1RGCfz+8+YYJyp9xCotuLIvfH3rIs2wBiAYJOT4fgDqkWyrF
   e5bE3VHXe+Uw+vWzpT05dFjW/qhF3FFFnI84phXevfsWAQGgK+Nu1tL64
   UpE7l5qw4klUHBIKqFvBgwFYCpgP17HjETffgupa/hfH0J3U/Ut9If5iB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="8426909"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="8426909"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 23:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="13211555"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Mar 2024 23:31:13 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlk34-000G4g-2r;
	Sun, 17 Mar 2024 06:31:10 +0000
Date: Sun, 17 Mar 2024 14:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xiaolong Wang <xiaolong.wang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29325/30000]
 drivers/powercap/intel_rapl_tpmi.c:141:41: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202403171427.1vH4xGrU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   32bb7b0a7c87769858fbb9d60574b830383c28f7
commit: 6b9faa4dfe7e99b19081b54504efce5f57b7abe4 [29325/30000] powercap: intel_rapl: Introduce RAPL TPMI interface driver
config: x86_64-randconfig-122-20240317 (https://download.01.org/0day-ci/archive/20240317/202403171427.1vH4xGrU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403171427.1vH4xGrU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403171427.1vH4xGrU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/powercap/intel_rapl_tpmi.c:141:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [usertype] *tpmi_rapl_regs @@     got void [noderef] __iomem * @@
   drivers/powercap/intel_rapl_tpmi.c:141:41: sparse:     expected unsigned long long [usertype] *tpmi_rapl_regs
   drivers/powercap/intel_rapl_tpmi.c:141:41: sparse:     got void [noderef] __iomem *

vim +141 drivers/powercap/intel_rapl_tpmi.c

   132	
   133	static int parse_one_domain(struct tpmi_rapl_package *trp, u32 offset)
   134	{
   135		u8 tpmi_domain_version;
   136		enum rapl_domain_type domain_type;
   137		enum tpmi_rapl_domain_type tpmi_domain_type;
   138		enum tpmi_rapl_register reg_index;
   139		enum rapl_domain_reg_id reg_id;
   140		int tpmi_domain_size, tpmi_domain_flags;
 > 141		u64 *tpmi_rapl_regs = trp->base + offset;
   142		u64 tpmi_domain_header = readq((void __iomem *)tpmi_rapl_regs);
   143	
   144		/* Domain Parent bits are ignored for now */
   145		tpmi_domain_version = tpmi_domain_header & 0xff;
   146		tpmi_domain_type = tpmi_domain_header >> 8 & 0xff;
   147		tpmi_domain_size = tpmi_domain_header >> 16 & 0xff;
   148		tpmi_domain_flags = tpmi_domain_header >> 32 & 0xffff;
   149	
   150		if (tpmi_domain_version != TPMI_RAPL_VERSION) {
   151			pr_warn(FW_BUG "Unsupported version:%d\n", tpmi_domain_version);
   152			return -ENODEV;
   153		}
   154	
   155		/* Domain size: in unit of 128 Bytes */
   156		if (tpmi_domain_size != 1) {
   157			pr_warn(FW_BUG "Invalid Domain size %d\n", tpmi_domain_size);
   158			return -EINVAL;
   159		}
   160	
   161		/* Unit register and Energy Status register are mandatory for each domain */
   162		if (!(tpmi_domain_flags & BIT(TPMI_RAPL_REG_UNIT)) ||
   163		    !(tpmi_domain_flags & BIT(TPMI_RAPL_REG_ENERGY_STATUS))) {
   164			pr_warn(FW_BUG "Invalid Domain flag 0x%x\n", tpmi_domain_flags);
   165			return -EINVAL;
   166		}
   167	
   168		switch (tpmi_domain_type) {
   169		case TPMI_RAPL_DOMAIN_PACKAGE:
   170			domain_type = RAPL_DOMAIN_PACKAGE;
   171			break;
   172		case TPMI_RAPL_DOMAIN_SYSTEM:
   173			domain_type = RAPL_DOMAIN_PLATFORM;
   174			break;
   175		case TPMI_RAPL_DOMAIN_MEMORY:
   176			domain_type = RAPL_DOMAIN_DRAM;
   177			break;
   178		default:
   179			pr_warn(FW_BUG "Unsupported Domain type %d\n", tpmi_domain_type);
   180			return -EINVAL;
   181		}
   182	
   183		if (trp->priv.regs[domain_type][RAPL_DOMAIN_REG_UNIT]) {
   184			pr_warn(FW_BUG "Duplicate Domain type %d\n", tpmi_domain_type);
   185			return -EINVAL;
   186		}
   187	
   188		reg_index = TPMI_RAPL_REG_HEADER;
   189		while (++reg_index != TPMI_RAPL_REG_MAX) {
   190			if (!(tpmi_domain_flags & BIT(reg_index)))
   191				continue;
   192	
   193			switch (reg_index) {
   194			case TPMI_RAPL_REG_UNIT:
   195				reg_id = RAPL_DOMAIN_REG_UNIT;
   196				break;
   197			case TPMI_RAPL_REG_PL1:
   198				reg_id = RAPL_DOMAIN_REG_LIMIT;
   199				trp->priv.limits[domain_type] |= BIT(POWER_LIMIT1);
   200				break;
   201			case TPMI_RAPL_REG_PL2:
   202				reg_id = RAPL_DOMAIN_REG_PL2;
   203				trp->priv.limits[domain_type] |= BIT(POWER_LIMIT2);
   204				break;
   205			case TPMI_RAPL_REG_PL4:
   206				reg_id = RAPL_DOMAIN_REG_PL4;
   207				trp->priv.limits[domain_type] |= BIT(POWER_LIMIT4);
   208				break;
   209			case TPMI_RAPL_REG_ENERGY_STATUS:
   210				reg_id = RAPL_DOMAIN_REG_STATUS;
   211				break;
   212			case TPMI_RAPL_REG_PERF_STATUS:
   213				reg_id = RAPL_DOMAIN_REG_PERF;
   214				break;
   215			case TPMI_RAPL_REG_POWER_INFO:
   216				reg_id = RAPL_DOMAIN_REG_INFO;
   217				break;
   218			default:
   219				continue;
   220			}
   221			trp->priv.regs[domain_type][reg_id] = (u64)&tpmi_rapl_regs[reg_index];
   222		}
   223	
   224		return 0;
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
