Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C6A1DE8BF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 02:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790908863; cv=none; b=lxlkKuo6zvZ/+r2nRMdiUhjjA8gvhGfRr0wFH5rE4Twxy4rpho9A6REToEKeaRS7fsRknOsva0SQV2aqmSVDpIfIU70ed9iro2S9hUP1AOTXOUJmuPEJw51Iv2hWY3QOv74tTwVzY3gcBLf/hjtgQjvSfGrF9eF5xnxaK9Podf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790908863; c=relaxed/simple;
	bh=9QhSHt11ucAFONL5ofO2F0tMceG1vSAtYJK/G1xs3fg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GEMIW393DuFOMTA1QYTNUuoXzGjJ3GUdSfeUgK/HCaIqA03Vf8j+zhQBNyIZJNyOIBpe+v5jrJa4GD0dSiGsDDsl2F2478G8KQ1MkW2RlWMyZEYA5ayUpaE7s5u8vJ4OZjZxDvoye3p7PDGzgqYcRkglGVEBz1KDJSaS1voYjOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKOziPhz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKOziPhz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790908861; x=1822444861;
  h=date:from:to:cc:subject:message-id;
  bh=9QhSHt11ucAFONL5ofO2F0tMceG1vSAtYJK/G1xs3fg=;
  b=WKOziPhzAdtO/bYvaTorF0O89x9cFGs9p61xvnP6OjHs/RMhMO3nSiO4
   jnwrQNLvZy9j2WZ/vVJ+7A81ds5Z0kffPKrwRG22JiYlhUxjeo74PrFbd
   dNqOgViwWRtw0neg5VtKXVX+vwROXGNYOUZXW3frbB4KmhKmQKmB5+jKn
   rFH+Yspwt49jCgiMbFdpQ+EIY5f6p04B7GDdJq2JpzhUXnWJ1iURgThhY
   PV6ISPZQE9/QRelJZ/xqP29cYiUVMd8MURAt4FvRe7yCjnkQmPW1dguFa
   0vBWvIG0KAcRdVAWqJSOjXdNVdrl81nh6GKAtNITsiALflC1CTHa91B8h
   A==;
X-CSE-ConnectionGUID: 6WN5wboNQPKdALJAc4RRxQ==
X-CSE-MsgGUID: z9lpTIVTRJO1MwJBrVLt3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90735670"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90735670"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 19:41:01 -0700
X-CSE-ConnectionGUID: FrywCjFzROGinqjGykRJRg==
X-CSE-MsgGUID: R26ggflsSVei8oFONLft2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="272562325"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 01 Oct 2026 19:41:00 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCTCj-000000000MS-1kxb;
	Fri, 02 Oct 2026 02:40:57 +0000
Date: Fri, 02 Oct 2026 04:40:28 +0200
From: kernel test robot <lkp@intel.com>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, "Bryan O'Donoghue" <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [linux-next:master 10928/13246] ERROR: modpost:
 drivers/media/platform/qcom/iris/qcom-iris.ko: symbol '__divdi3' undefined!
Message-ID: <202610020426.oUzBZ3mH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sachin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f24d789f03b22941b905ded43cb5ff8eea9ce62
commit: 5f21cd9a4ae4a891b273178b40e0e9eb5b9ac650 [10928/13246] media: iris: add support for multi_slice in iris encoder
config: xtensa-randconfig-r2104-20261001 (https://download.01.org/0day-ci/archive/20261002/202610020426.oUzBZ3mH-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020426.oUzBZ3mH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020426.oUzBZ3mH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0xa4 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: trace_define_generic_fields+0xf4 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> ERROR: modpost: drivers/media/platform/qcom/iris/qcom-iris.ko: symbol '__divdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
