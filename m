Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95692218E93
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734708101; cv=none; b=JwJWVylVXPUXbzu/R2N8XqQ6ozLI0vDZTRYZq7Aq8QGk1srixOjxq0fDdY5wQMRUBaV8+w2AkPw1G6S+o4D/P/WZNd1/SFtW43LuMjEvp2/tXrOj/OPAjsjctniYvZ/bfslTRjjyGTbjvRR8cbvTBdS4qqqWi+3XZhkJN6hoaEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734708101; c=relaxed/simple;
	bh=SzcJ8quF8RAMO3mzicVeCIZtW8RgKXEuB5qcTKOPKUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mCw70UVRuOoa+Bq7tnDTDmByerfLgxwaxsFrSfinorOS3DPCokeGhp3onII3pO1JT6Z9VOTGbyyBbeeRup/JhsDAEfVDbsnrMlAkzQUK4ExamKItp0ALvgCqcSxTnWG+8+CxFu87b2vrKf8OV/qZUPECaW59+bTfJYY06SysImA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STDu6dEZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STDu6dEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734708100; x=1766244100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SzcJ8quF8RAMO3mzicVeCIZtW8RgKXEuB5qcTKOPKUk=;
  b=STDu6dEZsgNcoTtwScmFKt8akMUb56kj4LM7T4s0Sfw2g9au2YbunKiX
   GZTo9Sw5EnOpHPKr9NMDTL8tlW/8YwIJi7HmiQVuvp5ithQT283xp7B8O
   vcHch+uV3m5IblfEddVaVxoqUCCHiaLF1gSfqsKiZA5Jn/2W3LmJbMzuU
   r9NHRtlr0vTgnx8dMQW1prhwSzlkFBhykzDMfWUnRBKQQAkcFPyZ1NO+W
   0ZrHZ/e2ISZSW+PtBPH0wOMv7SjMKcP5YU2pvuPTaxVvyp33YmYoWl8Kh
   wQgHmwPFpLp7EeN/fkTSunX4EMMUiSkR8FQQb5PUzg6ZQGqJYfuQiQNEH
   w==;
X-CSE-ConnectionGUID: BuUh6NUjSc+Eap0X4II7jg==
X-CSE-MsgGUID: ZpN5gTI4SnOguztSoegFhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45749767"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="45749767"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 07:21:39 -0800
X-CSE-ConnectionGUID: Q90aJYZoQOaAAbrDRGaCNg==
X-CSE-MsgGUID: jXAG/oQDQ3mxAazCyTnoPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129500165"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Dec 2024 07:21:38 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOeoq-0001KB-01;
	Fri, 20 Dec 2024 15:21:36 +0000
Date: Fri, 20 Dec 2024 23:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug 17/19] arch/x86/kernel/relocate_kernel_64.o:
 warning: objtool: relocate_kernel+0x57: unsupported stack register
 modification
Message-ID: <202412202309.DZCOImtz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug
head:   fb9fab65d35df319f262a75718987d66f83a088d
commit: 4eba036414a6ea25379cfb0de7808e3869b724d5 [17/19] x86/kexec: Add CFI type information to relocate_kernel()
config: x86_64-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241220/202412202309.DZCOImtz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202309.DZCOImtz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202309.DZCOImtz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_kernel+0x57: unsupported stack register modification

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
