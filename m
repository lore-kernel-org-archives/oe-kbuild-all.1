Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E51E47A5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 05:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755148397; cv=none; b=bQGvbYU51i8tOG17gHC3XPco7kv7fUIfDGVMpeLj8nhAf7wAnfCn8FHxeyynO346qYwRyvEVS+qn8ZDyK0LilqLfY6ZOaoDe+dv6qcTnkz/9Z5CBqZyVCtpjoiAg33qPBmjvxmAgEhNYznSXmEOAjOCXfxHHo/9ORaYKsW6/3kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755148397; c=relaxed/simple;
	bh=Av0y0TbczPA4bhFK7N/z+roJvjV+xjUbL8RGsVxPHDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f2rj7Z/5XLToKctO6gYAFXqjTwQXTBy0a3V+BPU/HOYnazUlFvAPSaSNN4xlS7fD0OiOzdZwUfgofqARZDGaZ87ueqeXbmuQvmMuTYiBdwIMzVhHrz5xdHyXsy3F2Tm+vPkXBOv2TvaikOa78h++E7/paZKkdPq4bMHStQXT53s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5gEYAlf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5gEYAlf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755148392; x=1786684392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Av0y0TbczPA4bhFK7N/z+roJvjV+xjUbL8RGsVxPHDA=;
  b=V5gEYAlf+UqNoqnPpuQxEDOnIN/HCMNuwopFkVe/of6KF9FlRTsyl14r
   s2TQZVPFsfNraAU2u43JIEcrenEhiD4WTEg04Zh9QsZ9Ntq7n9Qv92TdX
   HqU9XottAORTDxmo/vQmlrKr8UbMGd8emOT7WFDxOhmc5lJIP01mk4RG5
   ghQ4iV3qXs8FJHUzf3SXmuNtqIMbWP4FV447/4Avq79pfH4vwDNQdWZyf
   ZhpxbxqbbPEnHqZRPuX6bxXcal1BFCmetPk15vQoFSz9AW2WvmX4R2KjY
   hDXJKrMlq/7hpwjIM79anpdA/Ktb3s4W8N0+BfYM9oQvHefEPBwHOSnOp
   w==;
X-CSE-ConnectionGUID: kOpAJIfPQhyyUkkBZHCmxg==
X-CSE-MsgGUID: fzdtfpv0Tyu6jud6VDH/UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74907677"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="74907677"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 22:13:11 -0700
X-CSE-ConnectionGUID: M3LEpexBSuCesmH1RakKdQ==
X-CSE-MsgGUID: xySxNTZMQ4K40wHieQc9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="170798558"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2025 22:13:10 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umQGy-0000Ch-1y;
	Thu, 14 Aug 2025 05:13:08 +0000
Date: Thu, 14 Aug 2025 07:12:48 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1755/1755]
 arch/x86/kernel/cpu/mce/inject.o: warning: objtool: missing symbol for
 section .exit.text
Message-ID: <202508140732.YsbP7fHB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Borislav,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8723dc57de6371f9cc8764e15d4cc9e57ae592ee
commit: 9b6ab4a9bac22d947d324eed3f0cfd938dde959d [1755/1755] x86/mce-inject: Reset injection struct after injection
config: x86_64-buildonly-randconfig-2004-20250811 (https://download.01.org/0day-ci/archive/20250814/202508140732.YsbP7fHB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140732.YsbP7fHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140732.YsbP7fHB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/mce/inject.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
