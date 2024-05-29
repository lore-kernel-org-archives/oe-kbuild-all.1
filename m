Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03610335C7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 19:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717009402; cv=none; b=HVpcRQoyJCf9Beh7hPybK24hXqD5FcIBYfAM1ibpC8vkPMqPg2AcRekRP+gZmNY7GHIhrF4ZD4djBsEwJQDnCMSeBhN0Ff0jcLnTwCzbR4zMyzw0F0IM2YUVInDrJmEcWegJQ2lGW0rWVvjyPyXca3vqvcjQBIAxIYItqbZ+Hhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717009402; c=relaxed/simple;
	bh=nSAH9Un4bXzKh3l9HjiIt9+YQ+TZpDXeEqs4OWNgAZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FESHfGxDVh5Tv0xAkgO6N7BZ86HlRxQCEFrcpLM+2uCSnRMZ55sZvdxDEQbqYF5uFE1Ex6mcHjNu10FOdnfmzBPxhZGUfo4WNmaQRloa4k8BIOFFvFR3GaLQ/dne4IQFghfXRhdzuLTu7Zfwk8Qw9ov1VV35Q5syGYu5BKQvj4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DT6g0OOo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DT6g0OOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717009401; x=1748545401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nSAH9Un4bXzKh3l9HjiIt9+YQ+TZpDXeEqs4OWNgAZQ=;
  b=DT6g0OOomBNtrBjbGFR7yOUTQYIS56BUAfn1unRcy5mb/MsO5ce6uuQA
   afO3p+ymA+rlLSCF7VE687aRGCxRyqBdnRRgd3g5Wv3Khc5Xmv6Ec3QM+
   r9YVbqHmLXeoSir6KiA6gvtoF+q9mx/yD1TjGXmIY0FlBeV/fei7aNYTU
   thBZX2hkj3fyk/t2h8ww4cMS/SBhAp8hC4WVO/BzGpuVbRvVptvrcsdgY
   RYUOsVNzZucgYQijo4aF8PvvWegvz7sb/KUtgpaGz0kRGVwWNSnQFdZHn
   2G5O6SQzggwfHcXoYyHEF30XD5+d5MW47kdYfEc+y0BaWjP2ICEzCwx3R
   g==;
X-CSE-ConnectionGUID: 4Kl1g/TJS0qhhm++CthoNQ==
X-CSE-MsgGUID: 4K1rD/x4TWC0tMEp2WneYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30939209"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="30939209"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 12:03:21 -0700
X-CSE-ConnectionGUID: qZAGOw0LQzCcq+6ITTOilg==
X-CSE-MsgGUID: Jvv03pnKRTuXgW0AScrpeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40394316"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2024 12:03:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCOZx-000E6N-0Z;
	Wed, 29 May 2024 19:03:17 +0000
Date: Thu, 30 May 2024 03:02:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1861/2527] /usr/bin/ld:
 kernel/rcu/tasks.h:1472:undefined reference to `cmpxchg_emu_u8'
Message-ID: <202405300206.tMqF4PfU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d99040b1bc8dbf385a8aa535e9efcdf94466e19
commit: 8046f300501578d516391059d9ded85aa883487d [1861/2527] rcu-tasks: Remove open-coded one-byte cmpxchg() emulation
config: um-randconfig-r033-20230910 (https://download.01.org/0day-ci/archive/20240530/202405300206.tMqF4PfU-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300206.tMqF4PfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300206.tMqF4PfU-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: kernel/rcu/update.o: in function `rcu_trc_cmpxchg_need_qs':
   kernel/rcu/tasks.h:1472:(.text+0x1f67): undefined reference to `cmpxchg_emu_u8'
>> /usr/bin/ld: kernel/rcu/tasks.h:1472:(.text+0x1fdf): undefined reference to `cmpxchg_emu_u8'
   /usr/bin/ld: kernel/rcu/tasks.h:1472:(.text+0x4523): undefined reference to `cmpxchg_emu_u8'
   /usr/bin/ld: kernel/rcu/tasks.h:1472:(.text+0x4573): undefined reference to `cmpxchg_emu_u8'
   /usr/bin/ld: kernel/rcu/tasks.h:1472:(.text+0x49f3): undefined reference to `cmpxchg_emu_u8'
   /usr/bin/ld: kernel/rcu/update.o:kernel/rcu/tasks.h:1472: more undefined references to `cmpxchg_emu_u8' follow
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
