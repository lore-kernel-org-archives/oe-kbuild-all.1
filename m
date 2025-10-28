Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC182147C9B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 17:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761674079; cv=none; b=OKwhLfuQB9RtDZmo8l1OF65Nnsqt8rGL4l/cn5vUcnhvzEvuFN5PrPrMiOqzB5SI21PrdcWXT1yOyu9BgnKB/gtsPuJCM6JA7OWUBLyXXasyhTS7ol5yPGL9vM/8zzfO60dKJH9u5aaleDJyy+XvdNfqXE0ewFv72149wE5LoDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761674079; c=relaxed/simple;
	bh=+XfPjxAiyUR+g9YPk2mdpcDipEBOHQEvOAQhXqwQBec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7KlpEGyCpE7P2NuPyER8/nuaAwVqJJfLuk6TaeAgGEo6J7/HjzBm4noNlXu4dPcvibsyyB7b5KfXg4MbPUoO7+mg5KVVGOfaEYhSgrg1e+DRv6zQW5VoO74ZD3LW7snPMthTZMbfhzfgd4hGQTtKH+F99pwHy+Po5a5/KLMef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kU8cZ8Uz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kU8cZ8Uz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761674078; x=1793210078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+XfPjxAiyUR+g9YPk2mdpcDipEBOHQEvOAQhXqwQBec=;
  b=kU8cZ8Uz7FiF4CphE5uW1srbnpxD2OLKr0jP0ZTK8w/H7P1kooTyw3yo
   Mo3yxCKMEdTelLJq7PeqV066sWQwHQsAuMN3A13On+pJ5lR81wHz9AjdP
   XkIbDBBE5DKzOuzmVOTYi28Ng9SGqasBw1nm1EJKO/uwuIBec67unycEE
   Cc+yrmf3Tx+wM0Vtq4VKxsYh79cX4Nu6+lZelJRoGhnDgoz/6vtjMWFeC
   yJHTIX1nOr3W6oEYlfOu4i8dj6YD6S1Dbz7u9Pan1COMvhEwQM8ueiIxs
   nDMT3KfQvSW6yiA5CYvUS4vnqExJKsSF7iI8DwGGK9gFANljKNpbaUbRj
   Q==;
X-CSE-ConnectionGUID: hAMxP4AITDKUTocG3Kgu2Q==
X-CSE-MsgGUID: FbojMGewTBS5co7AuwCu/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63670064"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63670064"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:54:37 -0700
X-CSE-ConnectionGUID: b0TTWRHeRs6Vk+zd+lxYXQ==
X-CSE-MsgGUID: K4bh8J2QSc6W+KtoK4vhgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="216296424"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Oct 2025 10:54:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDntE-000JYd-34;
	Tue, 28 Oct 2025 17:54:00 +0000
Date: Wed, 29 Oct 2025 01:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: arch/xtensa/boot/boot-elf/bootstrap.S:58: Error: invalid register
 'atomctl' for 'wsr' instruction
Message-ID: <202510290153.vj0S6aHa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lucas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd57572253bc356330dbe5b233c2e1d8426c66fd
commit: b67e7422d229dead0dddaad7e7c05558f24d552f drm/xe: Fix build with CONFIG_MODULES=n
date:   5 weeks ago
config: xtensa-randconfig-r054-20251028 (https://download.01.org/0day-ci/archive/20251029/202510290153.vj0S6aHa-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290153.vj0S6aHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290153.vj0S6aHa-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/xtensa/boot/boot-elf/bootstrap.S: Assembler messages:
>> arch/xtensa/boot/boot-elf/bootstrap.S:58: Error: invalid register 'atomctl' for 'wsr' instruction


vim +58 arch/xtensa/boot/boot-elf/bootstrap.S

e85e335f8ff615 Max Filippov 2012-12-03  42  
e85e335f8ff615 Max Filippov 2012-12-03  43  	.align  4
e85e335f8ff615 Max Filippov 2012-12-03  44  _SetupMMU:
09af39f649dac6 Max Filippov 2021-07-26  45  #if XCHAL_HAVE_WINDOWED
e85e335f8ff615 Max Filippov 2012-12-03  46  	movi	a0, 0
e85e335f8ff615 Max Filippov 2012-12-03  47  	wsr	a0, windowbase
e85e335f8ff615 Max Filippov 2012-12-03  48  	rsync
e85e335f8ff615 Max Filippov 2012-12-03  49  	movi	a0, 1
e85e335f8ff615 Max Filippov 2012-12-03  50  	wsr	a0, windowstart
e85e335f8ff615 Max Filippov 2012-12-03  51  	rsync
09af39f649dac6 Max Filippov 2021-07-26  52  #endif
e85e335f8ff615 Max Filippov 2012-12-03  53  	movi	a0, 0x1F
e85e335f8ff615 Max Filippov 2012-12-03  54  	wsr	a0, ps
e85e335f8ff615 Max Filippov 2012-12-03  55  	rsync
e85e335f8ff615 Max Filippov 2012-12-03  56  
e85e335f8ff615 Max Filippov 2012-12-03  57  #ifndef CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
e85e335f8ff615 Max Filippov 2012-12-03 @58  	initialize_mmu

:::::: The code at line 58 was first introduced by commit
:::::: e85e335f8ff615f74e29e09cc2599f095600114b xtensa: add MMU v3 support

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Chris Zankel <chris@zankel.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
