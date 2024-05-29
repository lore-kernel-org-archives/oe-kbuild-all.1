Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F5C2F37
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 04:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716956236; cv=none; b=FEXuO7VO2GlUHUtjRumA12mV6+HDFdNEBZloOyXZqVppa+WXOUT4H2jZP+KgyEee+F09pl6DFdZ3n69gtmn7VYxPHI+6/gSO2LaqEGLSTyKbEIZYEpgWmwidEsm450BNSslAr5JEMkVM2lhPhNyt8Yrd68zgq8BliO1YQlZfAGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716956236; c=relaxed/simple;
	bh=Xic0N21kMSiu+SRUsA58mU3USYRQuD0NHOJa3KcEL7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SKv4DR+pv6fGEZzVrbuNjbZ2gtY8agZ+fAfSy3li8KZxwCEHxCDpJNVk7rzuy+WBjy6cKthp0ChhbijkOk35mTvtr49kwacavBYomS93rRpRy0RBCZtU1EBSj0U6ssqt+wRkX+FhC9SvY03eCsuQ0fdVJP2KI9N/LoNlrC1ztBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDoXqvuk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDoXqvuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716956234; x=1748492234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xic0N21kMSiu+SRUsA58mU3USYRQuD0NHOJa3KcEL7Q=;
  b=YDoXqvuk4TQI4eg6epBcp9SHdy9ob8XiAvP/1A46Dgrxw+2DN2FzjQz2
   q77uoulTkiIOfg/grcu0qL1qoi8dxpW294iWLz436TO7NcozLUZ+7zQBD
   LcaC3GsPHd0BVJG5bPmlZxt9S0JaOBZXW+xHVo4eVuOkBkAkjvYJ4N9a0
   SIAh5fqr6Er7Oy1AY2OJC1uFKdTQ1P31hDFVWppEttU2M0NHXmEIM3G2D
   ywRsi57crngMebprevYd/4JnKNvw66jRyRuiKJojaad2Vy+GnNMWQsgvl
   gTgiRVsOPw9HrP7uvy5/W8+3fENpHTDNPGuyguKVbYxS4a3OiaDYCF6cW
   w==;
X-CSE-ConnectionGUID: LIdwPJX7QAmeGfXSDwTshA==
X-CSE-MsgGUID: /+IUZqDsQw6pDmA0Yt4M/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30838518"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="30838518"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 21:17:13 -0700
X-CSE-ConnectionGUID: K3wlXKejQkGEoqzrW6j3cg==
X-CSE-MsgGUID: qWEff19oRlaWY1csXCQSiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="58474490"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 May 2024 21:17:00 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCAk9-000D6T-1p;
	Wed, 29 May 2024 04:16:55 +0000
Date: Wed, 29 May 2024 12:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [tip:sched/core 1/2] powerpc-linux-ld: warning: orphan section
 `.bss..Lubsan_data1032' from `kernel/sched/build_policy.o' being placed in
 section `.bss..Lubsan_data1032'
Message-ID: <202405291235.9o2DCsjw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   402de7fc880fef055bc984957454b532987e9ad0
commit: 04746ed80bcf3130951ed4d5c1bc5b0bcabdde22 [1/2] sched/syscalls: Split out kernel/sched/syscalls.c from kernel/sched/core.c
config: powerpc-buildonly-randconfig-r001-20211222 (https://download.01.org/0day-ci/archive/20240529/202405291235.9o2DCsjw-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405291235.9o2DCsjw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291235.9o2DCsjw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data852' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data852'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data1032' from `kernel/sched/build_policy.o' being placed in section `.bss..Lubsan_data1032'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data861' from `drivers/cxl/core/port.o' being placed in section `.bss..Lubsan_data861'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data845' from `drivers/cxl/core/mbox.o' being placed in section `.bss..Lubsan_data845'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data844' from `drivers/cxl/core/mbox.o' being placed in section `.bss..Lubsan_data844'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data852' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data852'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data1032' from `kernel/sched/build_policy.o' being placed in section `.bss..Lubsan_data1032'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data861' from `drivers/cxl/core/port.o' being placed in section `.bss..Lubsan_data861'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data845' from `drivers/cxl/core/mbox.o' being placed in section `.bss..Lubsan_data845'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data844' from `drivers/cxl/core/mbox.o' being placed in section `.bss..Lubsan_data844'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data852' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data852'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data1032' from `kernel/sched/build_policy.o' being placed in section `.bss..Lubsan_data1032'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data861' from `drivers/cxl/core/port.o' being placed in section `.bss..Lubsan_data861'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data845' from `drivers/cxl/core/mbox.o' being placed in section `.bss..Lubsan_data845'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data844' from `drivers/cxl/core/mbox.o' being placed in section `.bss..Lubsan_data844'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data852' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data852'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data1032' from `kernel/sched/build_policy.o' being placed in section `.bss..Lubsan_data1032'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data861' from `drivers/cxl/core/port.o' being placed in section `.bss..Lubsan_data861'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data845' from `drivers/cxl/core/mbox.o' being placed in section `.bss..Lubsan_data845'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data844' from `drivers/cxl/core/mbox.o' being placed in section `.bss..Lubsan_data844'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
