Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84833299927
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 05:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782795677; cv=none; b=sWuUf9s8E3KCLgt4GCWqpHXEGr04H0vFhy65oxYvvQhtffotBM2UnoFTvdBLWGvr+VGWJz9DhO0PZhVtFNz103a/Uf8vS1Nb//fmxxoN3yLv6Nxb0zHbWfpfQJeXSIxkmANTVvHPD4Hx1OtHOJpdKmhoK/31kAthWrcF0Wft5NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782795677; c=relaxed/simple;
	bh=PxlqGfu9wKBk7SBXMQzy4ahw57Kh2J5Y1OMYSAaUekY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oGMbz6Va7mHzi5rJM1cGkrxUbP3d7Wc9nTQE/3jARwj3/k0wTr8MhayJnrMR8J9WfBXQUqTGGsBIkN6l3zNgA1QcqmcyT6rPDd+WswTFsKtqDSh3q/OvFn3fyKM/73HnzQhIj7WnR8aUDfg4HY4TFFS0X7idzF2diTLxRwbubl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xq9ZcR/G; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xq9ZcR/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782795675; x=1814331675;
  h=date:from:to:cc:subject:message-id;
  bh=PxlqGfu9wKBk7SBXMQzy4ahw57Kh2J5Y1OMYSAaUekY=;
  b=Xq9ZcR/Gc0IhSfwJkm8KFr2vEHt7aKrKGWp9gz+/31OqzveDLzE8973F
   /e4t3MmzauhK/8v4pg4FppzeMl/TrEQjLXEUUo2pD/oinFw5Yg3vg0bv7
   TAZNpzA/nqYMEFmkfp4i0iUPKg7+A3UgA0OecSuvJiJ/Pvx9irEG29L5q
   /mI4qTxFyasF47tZQSRj5JFxuXhJz+6xqgeQh8cqAAoCdbq43CMPziAnz
   7Ugjcdu+3Svoakm9kqfc7FT8+lxl9H9+kVO9ADMazu5ikGRT2f+HbADvo
   Q4RVPQWzssiyEuHSQ+/eBkwlFOBn/laWEzU6+z8DjYSYPkOdAKClidTv3
   A==;
X-CSE-ConnectionGUID: hiqXV6OYT5+xoSa+VNp+sQ==
X-CSE-MsgGUID: 4vo2bXZ2Q4GVbTATJYIhAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="100929078"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="100929078"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 22:01:14 -0700
X-CSE-ConnectionGUID: Tsk7h8PpQaCxTI2TCSohMA==
X-CSE-MsgGUID: N+mQC6LkTK2Utq2M+k4MTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="282224357"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 29 Jun 2026 22:01:12 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weQas-000000000Lt-1VEc;
	Tue, 30 Jun 2026 05:01:10 +0000
Date: Tue, 30 Jun 2026 07:00:35 +0200
From: kernel test robot <lkp@intel.com>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <202606300641.u5PDL60Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Waqar-Hameed/power-supply-Add-sysfs-entry-for-system-load-control/20260629-235714
head:   7f627c0c3f8b6254753610a05254e70cd6a2032d
commit: fad2c985b1a8f0d628768cd211f4afe3cb39e9d2 power: supply: rt9471: Use POWER_SUPPLY_PROP_LOAD_SWITCH
date:   13 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260630/202606300641.u5PDL60Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300641.u5PDL60Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ============  ===========================================
   1             automatic adjustment of input current limit
   0             no adjustment of input current limit. This
   helps for more unusual power sources like
   solar modules. [docutils]
>> Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
   Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2161: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2351: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]


vim +1 Documentation/ABI/testing/sysfs-class-power-rt9471

ab8174bbc39669 ChiYuan Huang 2023-01-13  @1  What:		/sys/class/power_supply/rt9471-*/sysoff_enable
ab8174bbc39669 ChiYuan Huang 2023-01-13   2  Date:		Feb 2023
ab8174bbc39669 ChiYuan Huang 2023-01-13   3  KernelVersion:	6.3
ab8174bbc39669 ChiYuan Huang 2023-01-13   4  Contact:	ChiYuan Huang <cy_huang@richtek.com>
ab8174bbc39669 ChiYuan Huang 2023-01-13   5  Description:
ab8174bbc39669 ChiYuan Huang 2023-01-13   6  		This entry allows enabling the sysoff mode of rt9471 charger devices.
ab8174bbc39669 ChiYuan Huang 2023-01-13   7  		If enabled and the input is removed, the internal battery FET is turned
ab8174bbc39669 ChiYuan Huang 2023-01-13   8  		off to reduce the leakage from the BAT pin. See device datasheet for details.
ab8174bbc39669 ChiYuan Huang 2023-01-13   9  		It's commonly used when the product enter shipping stage. After entering
ab8174bbc39669 ChiYuan Huang 2023-01-13  10  		shipping mode, only 'VBUS' or 'Power key" pressed can make it leave this
ab8174bbc39669 ChiYuan Huang 2023-01-13  11  		mode. 'Disable' also can help to leave it, but it's more like to abort
ab8174bbc39669 ChiYuan Huang 2023-01-13  12  		the action before the device really enter shipping mode.
ab8174bbc39669 ChiYuan Huang 2023-01-13  13  
fad2c985b1a8f0 Waqar Hameed  2026-06-29  14  		Note: use /sys/class/power_supply/rt9471-*/load_switch instead.
fad2c985b1a8f0 Waqar Hameed  2026-06-29  15  
ab8174bbc39669 ChiYuan Huang 2023-01-13  16  		Access: Read, Write
ab8174bbc39669 ChiYuan Huang 2023-01-13  17  		Valid values:
ab8174bbc39669 ChiYuan Huang 2023-01-13  18  		- 1: enabled
ab8174bbc39669 ChiYuan Huang 2023-01-13  19  		- 0: disabled
ab8174bbc39669 ChiYuan Huang 2023-01-13  20  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
