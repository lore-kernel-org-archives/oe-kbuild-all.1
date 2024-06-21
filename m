Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CC916D4FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 08:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718959918; cv=none; b=Dr0Un2rKbeRuXR7VfawSBUPeaTCMqxrjvivp8tPvGqaMSB1sbpFCxVhK9oxohS4u+0AVIOFYvxAHIk1nUhGf1ka9FwmpOsGj28zN7F01RJaPWOpMGAtKd/fJLblCiPCJE88wuljpvN8MSzFOrj6TqbqjFFUgR3/U8fFK2C8/Qps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718959918; c=relaxed/simple;
	bh=dwuY4Gn9sV3isswhFRY5J36Uv3UysT2RnyLRvdGl3nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gsPpWealXNXyrVT2YEux1YpAH0xM2uME4oLAuZ3PGf9Uo4Tlw6rTFKt09RkKKo4KoQiVhy0yOYtg+WqYo79T68PuGg2H/ERJhBNesvnMQVhwLtgmdHfEU4XFNQ999PzBAJhUF9Bwwj03N8tn38O1ovDoLt9D3Wj3zm9lHVvLGNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8jisj3P; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8jisj3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718959916; x=1750495916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dwuY4Gn9sV3isswhFRY5J36Uv3UysT2RnyLRvdGl3nQ=;
  b=N8jisj3PdFbH4ACoAlOIQbMgewTGjGZ+FyZFeCumVLfqNAN8++5mRdKl
   2EqfqtsXhq30hZlcc6xEBlZaT4yfo/RBxvLbRfAmKgTq8+5WgwIlWi37x
   tFuvu/AGaYFI+LDDPpfseZmFNRVU8geGJzuIEI/kvvc6YIbC3zKZItpOE
   8KFKNXWtsiw0GXFLdhLhgC/4odnEwfvtZC0/vkFrN+igdQeFO2bz9cLem
   xKP8DsvK7wtlbN0sIOubtvsZ/PknsHXFMHhD9DJ/mJ3GzZv2psJbinTfk
   eALwgKiAePn5yTZoawNfuuorqX8MBfQ2b+G/8oMNfnHHibcMmPKOytMIp
   g==;
X-CSE-ConnectionGUID: LOxn84TETkOz7yEVe/6wpA==
X-CSE-MsgGUID: /8Nk4QD8Td2GILIZ5+T8nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="38506825"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="38506825"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 01:51:56 -0700
X-CSE-ConnectionGUID: uc4fGjnLQpmgBhKYtx6VYA==
X-CSE-MsgGUID: gdjMse7kRd+qGL5PIeW5KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="42624668"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Jun 2024 01:51:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKZzs-0008PC-32;
	Fri, 21 Jun 2024 08:51:52 +0000
Date: Fri, 21 Jun 2024 16:51:20 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to-build 2/15]
 ./arch/x86/include/generated/asm/syscalls_32.h:417:undefined reference to
 `__ia32_compat_sys_io_pgetevents_time64'
Message-ID: <202406211657.Z89ja9Dt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to-build
head:   c2dd777003347c510f9fecc965fb3e65d7c79a43
commit: 15153fb4dbea2439f889a2edf580c245559de325 [2/15] syscalls: fix compat_sys_io_pgetevents_time64 usage
config: x86_64-randconfig-001-20240621 (https://download.01.org/0day-ci/archive/20240621/202406211657.Z89ja9Dt-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211657.Z89ja9Dt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211657.Z89ja9Dt-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `ia32_sys_call':
>> ./arch/x86/include/generated/asm/syscalls_32.h:417:(.text+0x8370): undefined reference to `__ia32_compat_sys_io_pgetevents_time64'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
