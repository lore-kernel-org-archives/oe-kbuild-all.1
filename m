Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06E5200DE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 06:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713162310; cv=none; b=VumYH/OWiikiVhBHEa7irtW234p0bpRRYTWOx1v+8v4xVFBqcvLoOX3lFJlvjym3ZAHUSKNZRbMoH40SXCU57qGYwolZ0V7qkeD30wlWQRfgiz1Z8OLsbr5O6+6FNVsaBQoY0MvM7RozjZVsDBjU3gsb+Zc0OUpuVa9NG0+Yu3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713162310; c=relaxed/simple;
	bh=N/WPWmWcuE0QFxCAdGUwjP59M+DJ2cEQV58Tgdk06uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CnGbSnDmfllv5xwasXTYDcPwmatTcCO3XE/PvSV5pj3aHzrfVHZjKOS3/LND6voxlbEtucR8Sev21sgcoyrZME0vfc4fIEkqq51VMK98dblAQORQ/DNUZXh5F+8wQE8hYxLokBgQ2BX3ORg4z8aImewrHLjUnBAZUNFHsenpGQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eijZxK0K; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eijZxK0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713162307; x=1744698307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N/WPWmWcuE0QFxCAdGUwjP59M+DJ2cEQV58Tgdk06uQ=;
  b=eijZxK0KOhBTlWEoUsQ4moanxszZUP4cEkXP67H8ojzWgaJusTRy/CD/
   W0VRZ8Ax4dgVqibafKmTXP7lcd3EZ2e4YUoIVIj23ujS4iMXs3I3q1pA9
   Uo1Mx6O63b34yThiuEseXseHhJQeKNQvmjN3yCKJOR8OygludXw1WSM2G
   TvNLOSVu1Mxqj0ltBiryqzm/9LMCIE8n7NgljJaUSgkFzo4eK0G2Fw/Ly
   7ohGQstcxJ1UK2SYyqlmiFm6R7EdaMWGwsrYzitP9NjGlRuBQC/ziu7u3
   i0kUNzTQKAL9xjvBMPLV4TPCiH8DU64wmLKaBsh1J5hNH8FVXiQPDlxtL
   Q==;
X-CSE-ConnectionGUID: h7TdtJJySOalamEPf2Z/ew==
X-CSE-MsgGUID: Wv6XkqwxQjCH/nCRNc7SMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8703640"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8703640"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 23:25:07 -0700
X-CSE-ConnectionGUID: RFHD4HxtQ+yv/gKyCxKylA==
X-CSE-MsgGUID: qm4Qomv3SNG6bGMSZhkfvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="21902504"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 14 Apr 2024 23:25:05 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwFm3-00040q-1L;
	Mon, 15 Apr 2024 06:25:03 +0000
Date: Mon, 15 Apr 2024 14:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17814/22098]
 drivers/edac/.tmp_skx_common.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202404151440.syDdJhZl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ff773a407598b9c693c9dc10e0dc587828127aa6
commit: e34047f6dc606c123911c6db8fa424bb4a035262 [17814/22098] EDAC, skx_edac: Delete duplicated code
config: x86_64-buildonly-randconfig-005-20240415 (https://download.01.org/0day-ci/archive/20240415/202404151440.syDdJhZl-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404151440.syDdJhZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404151440.syDdJhZl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/edac/skx_common.c: In function 'skx_mce_output_error':
   drivers/edac/skx_common.c:470:15: warning: variable 'type' set but not used [-Wunused-but-set-variable]
     470 |         char *type, *optype;
         |               ^~~~
   drivers/edac/skx_common.c: In function 'skx_get_dimm_info':
   drivers/edac/skx_common.c:309:79: warning: '_DIMM#' directive output may be truncated writing 6 bytes into a region of size between 0 and 9 [-Wformat-truncation=]
     309 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                                               ^~~~~~
   drivers/edac/skx_common.c:309:52: note: using the range [0, 4294967295] for directive argument
     309 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/skx_common.c:309:9: note: 'snprintf' output between 31 and 53 bytes into a destination of size 32
     309 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                  imc->src_id, imc->lmc, chan, dimmno);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/skx_common.c: In function 'skx_get_nvdimm_info':
   drivers/edac/skx_common.c:357:79: warning: '_DIMM#' directive output may be truncated writing 6 bytes into a region of size between 0 and 9 [-Wformat-truncation=]
     357 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                                               ^~~~~~
   drivers/edac/skx_common.c:357:52: note: using the range [0, 4294967295] for directive argument
     357 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/skx_common.c:357:9: note: 'snprintf' output between 31 and 53 bytes into a destination of size 32
     357 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     358 |                  imc->src_id, imc->lmc, chan, dimmno);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/edac/.tmp_skx_common.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
