Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAC043154
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727275584; cv=none; b=JwyrAnIX1/DtnFz0PM0gbawSBBPUq6ZNgZyv1MEUpEO8OOi6qTjJfmLG/kihCkKGnq3ni0/mAet3eqF8tKaZGhkLaEtWjdPujyjCAaGAaWzw6SrNe7nvhJAQUsqceivDWUu/SUHIeV7biwmkKiX9t6zusgQ4aCPET7j4DHzLmNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727275584; c=relaxed/simple;
	bh=3NeKW+z/ZXpmi8GxPc0kBHJywpLSMlqLDWmSo2Xdizg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XXBT1rwQqatCv+l7WsVABqbUNXMxduhV3H1TYQwbv6Z/ffqJ1y7KXdXtB8lSljHRcsrhNUYRFGDM6mMuHbkmPCFqaoh3FSbOo1rVTGKQ9FUNzrbp8JHLwcasJnqYpBdbpBX1f2DPwm9T23dK0Lmxkpz3J6IZgyk2Em9Uwf4eeYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dN69rvEl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dN69rvEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727275583; x=1758811583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3NeKW+z/ZXpmi8GxPc0kBHJywpLSMlqLDWmSo2Xdizg=;
  b=dN69rvElErYGv9W/kOw3Gj9vfhN12lElWVMBM59oDu82bHQgmbCYLV3u
   ut0MpVv45lSnrgHB6ROettP2foaFDn4NGaglsPIpMAKkZOou7Huq8gSAZ
   /095jxwp0aO9QEv5aFkzQOyHJMWnefFCQFps3xCYOhWaDa/GsRq78lpnx
   zUouBqOvOP5H6TnLh7BMJyw1XJjTtlw7x9WWunf4qJmY1T60DIzBFj3WD
   C5Tw9D4JKLNh7j8fgxlfEr6j8/YqBvDC7pJM6hSkH3pJDKs87+54HeV9K
   lXnL8PlXqkgXzEmazHu0oMZ6zH8xS6fH/mxo8VrfapLh0T/zdimmQsDEL
   Q==;
X-CSE-ConnectionGUID: wfdTZLIySRKRs7RFcrahlA==
X-CSE-MsgGUID: 79BdLmQXQFmWOElx0WHGGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26470781"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="26470781"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 07:46:22 -0700
X-CSE-ConnectionGUID: baSZIOaET4uFzirqXkXZgA==
X-CSE-MsgGUID: yX5pEXGpTkuCdgU8/OXlZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="71941750"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2024 07:46:21 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stTHW-000JcN-34;
	Wed, 25 Sep 2024 14:46:18 +0000
Date: Wed, 25 Sep 2024 22:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 14108/14122]
 arch/arm64/kernel/cpufeature.c:2313:6: error: redefinition of
 'mpam_detect_is_enabled'
Message-ID: <202409252253.TKzwXzes-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   81a41d2ac1de43215c014bc71d907a026042e55b
commit: ab331ac5b797eb3889777f3d8d98a86069c5720e [14108/14122] arm64/mpam: Check mpam_detect_is_enabled() before accessing MPAM registers
config: arm64-randconfig-001-20240925 (https://download.01.org/0day-ci/archive/20240925/202409252253.TKzwXzes-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409252253.TKzwXzes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409252253.TKzwXzes-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature.c:2313:6: error: redefinition of 'mpam_detect_is_enabled'
    2313 | bool mpam_detect_is_enabled(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:17,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/sched/task_stack.h:9,
                    from include/linux/elfcore.h:7,
                    from include/linux/crash_core.h:6,
                    from include/linux/kexec.h:18,
                    from include/linux/crash_dump.h:5,
                    from arch/arm64/kernel/cpufeature.c:67:
   arch/arm64/include/asm/cpufeature.h:864:20: note: previous definition of 'mpam_detect_is_enabled' with type 'bool(void)' {aka '_Bool(void)'}
     864 | static inline bool mpam_detect_is_enabled(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2133:13: warning: 'enable_pseudo_nmi' defined but not used [-Wunused-variable]
    2133 | static bool enable_pseudo_nmi;
         |             ^~~~~~~~~~~~~~~~~


vim +/mpam_detect_is_enabled +2313 arch/arm64/kernel/cpufeature.c

  2311	
  2312	static bool __read_mostly mpam_force_enabled;
> 2313	bool mpam_detect_is_enabled(void)
  2314	{
  2315		return mpam_force_enabled;
  2316	}
  2317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
