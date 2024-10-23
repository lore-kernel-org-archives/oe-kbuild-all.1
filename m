Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A1319AA46
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729696488; cv=none; b=bf+wXfae8rekBQbWToYfHLRJNAGHoj+exsjrNSy6FwfgCAea6ti/QKU/brOhvTlIhlue4Lz0cjamWP9VW5NhYcLk2w2XOQKsims10Rn5p+OTHuSWm3WuTrGufGJ1+ypss6p4+VNN4Es/oa+NrT9xnMgExXB5b8WYgpadK7eZ23A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729696488; c=relaxed/simple;
	bh=Vz5ROpvijPuybFYbC3xAK8ITUkP7FL/FyD5OMb3ODwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d3A2b4YXgovQOUl/bt3PjXYt/Y5+TiiEYx4iziZKtrPP9ZUyQS1rhNW6WoD9E2lcIWS2ppKQs4Ts1n+JHMVwYPKkfawgir2OzMcK218Pl6fzAW4vTEvqP+bqQC2zGBMUPXNphlj4i4su5HVSKN+RIgK6Hm0edlg/otlsPbdqwI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFlxZWN2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFlxZWN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729696487; x=1761232487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vz5ROpvijPuybFYbC3xAK8ITUkP7FL/FyD5OMb3ODwU=;
  b=KFlxZWN2A535SnAl9WhgsNloOZ52MIY0SduRSZqrPmMIXNCwA+NrnMlA
   QN3PKUZ9yEWajuobuQR9H3JnpLkXkOdHnV+eUWx/ESU5aRUAz9zsDFdpu
   SP3HnF+2w5to9txnWuQpwyY5XjSHD9wXLzfygepZyWSY3gCWkbMbWKG73
   AgJuDkaAbmZkbFhNyhoE2BFAOoDLXRHpXDG8DFTUdHdyyYAwl8Lv2hPyD
   s33aAVBMCacT1ZB6T7HJW9X6fBg2q99OLO1scW31tMZTrRS5LrMDbP0w4
   tmwMcTdrlXUqFuZt2SSiwZ6A+O/VQQ83Oi1Gup71GcAvSBdIhQzc5KF4Y
   g==;
X-CSE-ConnectionGUID: R3P0tjcTT2O1sU2tNuCmpw==
X-CSE-MsgGUID: UpGTWoUPSx+2tO5WgKX4Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46756651"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46756651"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 08:14:46 -0700
X-CSE-ConnectionGUID: 1RFloJenQDmE8jF+fYEzzQ==
X-CSE-MsgGUID: Xu+0tmBASzCsmtcKzOuHRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="84856576"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Oct 2024 08:14:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3d4J-000V4M-1O;
	Wed, 23 Oct 2024 15:14:39 +0000
Date: Wed, 23 Oct 2024 23:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 8625/13046] arch/arm64/mm/fault.c:1454:12:
 warning: 'fixup_alignment' defined but not used
Message-ID: <202410232318.hmRbJCRX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: dccb1ce4d7d6038b9bdc2bafbbbff0eff8b15377 [8625/13046] arm64: Add a fixup handler for alignment faults in aarch64 code
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20241023/202410232318.hmRbJCRX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410232318.hmRbJCRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410232318.hmRbJCRX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/fault.c:1454:12: warning: 'fixup_alignment' defined but not used [-Wunused-function]
    1454 | static int fixup_alignment(unsigned long addr, unsigned int esr,
         |            ^~~~~~~~~~~~~~~


vim +/fixup_alignment +1454 arch/arm64/mm/fault.c

  1453	
> 1454	static int fixup_alignment(unsigned long addr, unsigned int esr,
  1455				  struct pt_regs *regs)
  1456	{
  1457		u32 insn;
  1458		int res;
  1459	
  1460		if (user_mode(regs)) {
  1461			__le32 insn_le;
  1462	
  1463			if (!is_ttbr0_addr(addr))
  1464				return 1;
  1465	
  1466			if (get_user(insn_le,
  1467				     (__le32 __user *)instruction_pointer(regs)))
  1468				return 1;
  1469			insn = le32_to_cpu(insn_le);
  1470		} else {
  1471			if (aarch64_insn_read((void *)instruction_pointer(regs), &insn))
  1472				return 1;
  1473		}
  1474	
  1475		switch (aarch64_get_insn_class(insn)) {
  1476		case AARCH64_INSN_CLS_BR_SYS:
  1477			if (aarch64_insn_is_dc_zva(insn))
  1478				res = align_dc_zva(addr, regs);
  1479			else
  1480				res = 1;
  1481			break;
  1482		case AARCH64_INSN_CLS_LDST:
  1483			res = align_ldst(insn, regs);
  1484			break;
  1485		default:
  1486			res = 1;
  1487		}
  1488		if (!res) {
  1489			instruction_pointer_set(regs, instruction_pointer(regs) + 4);
  1490		}
  1491		return res;
  1492	}
  1493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
