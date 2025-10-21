Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CCE2777FC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 20:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761078147; cv=none; b=GMK/z+fYBtZ/hlZTY4PQfAM2mxvwWmNELzvf/hWyZHGpDJS2vdwt6VwwEcyO8BcZ2VPGZVEBiKmlP8Jkhb1ksa1E74bwpyEyOEF1G2AfiIwe4JXYOgXkWNm46vy7RGOsLYdNKW0jASw/yOvz2XgyiCfI860GfdN+RBFGiKa9uHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761078147; c=relaxed/simple;
	bh=w1X6lzc24ZlIvt/k7AHto/yWF5KXi339XO7Dt3W+UjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NBEghujHapTR0d/D5Pgw33W218d409PSRpqlmnZ38etHE/aLcSF3amV69VnE1WPdY4nDYT/1kqprhXcWkc6S1C4qN48vtK8sigeWyXxlf2eS6CpzjruZM+UbccPFCQliCzpRkeJjDd5aYh6PdTmCRVeVe961CR4JuZr5m2lvUQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlfXYCP8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlfXYCP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761078146; x=1792614146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w1X6lzc24ZlIvt/k7AHto/yWF5KXi339XO7Dt3W+UjU=;
  b=hlfXYCP8cAVhx9noL2pk9GqEc+6pzVjhzl0NiTFHlxK/z+lUYz4lUBjJ
   BlqbmRNTdDMbVuw9lYO00tfZAJX9Lmbw6ITkRBhH5PTOeG87LF2QdtEM8
   TPCCKjo30Q6rvkfClmXSWomtCRTlavSaQcFS+2SWH8GiDfVTsXxZmwkMy
   oUZ0yc3Vmfdb2xuQQJS/kut4c2C9750uOXno5imsVtNSyIJB61ddaxrpF
   wNsCG9cHMlnwCfkIi3YTbP3SNfebYlG1lezR8omuu1EiA7lGaeT86JdD8
   YIh+dQ8ugnAxJwc12oHrPTVkiN4D2pxiZ20DpZdC5Ea5MXDCqQIpDj353
   g==;
X-CSE-ConnectionGUID: yrVhD5zOQpaBkXVGI1eIqA==
X-CSE-MsgGUID: RVxnjggtQrOfCv5g95wFUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63138682"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63138682"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 13:22:25 -0700
X-CSE-ConnectionGUID: g9RV2RmnRoqWZxlpIb/76A==
X-CSE-MsgGUID: JWm1/htIQL+ASWRHyhFfyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="184459635"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Oct 2025 13:22:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBIsA-000Bij-0j;
	Tue, 21 Oct 2025 20:22:22 +0000
Date: Wed, 22 Oct 2025 04:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 3/3] binder.c:undefined
 reference to `event_mutex'
Message-ID: <202510220448.w91bZgNA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   f46f3581ac62d905b79a3eabe27557d6125f3630
commit: 43c26111cafa87d81570c63d96c497e13ec883da [3/3] ANDROID: binder: unload C Binder trace events
config: arm64-randconfig-003-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220448.w91bZgNA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220448.w91bZgNA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220448.w91bZgNA-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/android/binder.o: in function `binder_remove_trace_events':
>> binder.c:(.text+0x308c): undefined reference to `event_mutex'
   aarch64-linux-ld: drivers/android/binder.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `event_mutex' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> binder.c:(.text+0x308c): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: binder.c:(.text+0x3090): undefined reference to `event_mutex'
>> aarch64-linux-ld: binder.c:(.text+0x3098): undefined reference to `ftrace_events'
   aarch64-linux-ld: drivers/android/binder.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `ftrace_events' which may bind externally can not be used when making a shared object; recompile with -fPIC
   binder.c:(.text+0x3098): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: binder.c:(.text+0x30a4): undefined reference to `trace_types_lock'
   aarch64-linux-ld: drivers/android/binder.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `trace_types_lock' which may bind externally can not be used when making a shared object; recompile with -fPIC
   binder.c:(.text+0x30a4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: binder.c:(.text+0x30a8): undefined reference to `trace_types_lock'
>> aarch64-linux-ld: binder.c:(.text+0x30c4): undefined reference to `trace_event_sem'
   aarch64-linux-ld: drivers/android/binder.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `trace_event_sem' which may bind externally can not be used when making a shared object; recompile with -fPIC
   binder.c:(.text+0x30c4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: binder.c:(.text+0x30cc): undefined reference to `trace_event_sem'
   aarch64-linux-ld: binder.c:(.text+0x30d0): undefined reference to `ftrace_events'
   aarch64-linux-ld: binder.c:(.text+0x30e4): undefined reference to `ftrace_events'
>> aarch64-linux-ld: binder.c:(.text+0x3198): undefined reference to `remove_event_from_tracers'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
