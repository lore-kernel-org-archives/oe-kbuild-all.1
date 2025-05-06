Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00702DCB5F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 01:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746495824; cv=none; b=pm3nQ/g9blogJ3b8UY/KC4VpF+NSxruZ0XgB7Vm5SQ2qTwPbbpv+qVjr5A/xEVuZ4FHtL08hUfWsTWCGASuAfqOyJ4zgYEMcji5aF5ybVS5cXH2qj99Fgfx5A1YCFgpnxPk5HsX33N0KcWdtQPvnoGLs+48u8L28s6SbwzlTR5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746495824; c=relaxed/simple;
	bh=esZI72QeE7XzMg5/fT1QMH6H3Z0/g8/dtrTCeXWGUiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mmo1PL3Kr/PjkbjZELXM6RIJN3WB01PEK0CD27oxhxAyBx52KRTgRFAGgs104pdOUl4c4YkbY/I6AVNoFWvZk5hZVPy9MZPoMpYnEbD0b2qRqSXriTSfiqLJC0AJtyQnvsQZYqaka81a7dhdboh1Vh01AP35JFGyfId6duE9U8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IND6bur7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IND6bur7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746495822; x=1778031822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=esZI72QeE7XzMg5/fT1QMH6H3Z0/g8/dtrTCeXWGUiE=;
  b=IND6bur7LuRDZUNsV1FpvEcmKNv/j5GpPURzQX/wfIEp+fCIXYGwCnAD
   nGOwS+3N9nQsjYVr0af5a+YG0s2C//wkgFxkn4XL7TdTT3BFT/GCaetPA
   GNdCwcpD67Fu0qhJ9ziCX3DNWx6rjHOxzUQFdlqujmZvasBsGSdggrPOk
   MzIC8gEm/xpJc6GrUMUK3+oGPiB4g3bWFGQIr3HtvMvkhDi2Qgs/Yefwv
   d7LwhYq12vTyHKQOM8Fayus5QPAKoGKbHYdguKA7028iZhvP4109OZSM8
   XyeRPXM38+HeI0u5e00KT4+G5iVPEROt29eiuLig32HLS/CQN1Vmylvko
   w==;
X-CSE-ConnectionGUID: PzWJ8gwpSlGZbIXxkaXPtQ==
X-CSE-MsgGUID: m9o0oiRRTFina+1ougzGTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48279006"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="48279006"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 18:43:41 -0700
X-CSE-ConnectionGUID: +YYB/lsbQqSRAKz6IxvUqg==
X-CSE-MsgGUID: 4iG7UOsXQWCJUDPc4g696A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="135942542"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 May 2025 18:43:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uC7LN-0006Bx-2R;
	Tue, 06 May 2025 01:43:37 +0000
Date: Tue, 6 May 2025 09:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 set_high_memory+0x8c (section: .text.unlikely) -> zone_movable_pfn (section:
 .init.data)
Message-ID: <202505060901.Qcs06UoB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   01f95500a162fca88cefab9ed64ceded5afabc12
commit: e120d1bc12da5c1bb871c346f741296610fd6fcb arch, mm: set high_memory in free_area_init()
date:   7 weeks ago
config: arm-randconfig-r062-20250506 (https://download.01.org/0day-ci/archive/20250506/202505060901.Qcs06UoB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505060901.Qcs06UoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505060901.Qcs06UoB-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: set_high_memory+0x8c (section: .text.unlikely) -> zone_movable_pfn (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
