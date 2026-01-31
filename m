Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C2E1BC46
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769862072; cv=none; b=PjiuYPCHE9HLbssk8gHiiDd8C4iRB5W2BTK41aSE/coaCmBA9p1pydxCd8yqEr2ZsvVwvQu0JSgQr15kTflex/HCOaHNQYklYY+C7dj1iceNKrgXgWjDSnDy6FRW+kvOr/BHT/Xr9YdssKZ+Vmf3Dd+HWAd1/TnRAd7Wny+IlKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769862072; c=relaxed/simple;
	bh=BbQw1c0OE2SGxa6lSiv57gh67gFywY7WjFPMKvJXkL0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tsmwQT4h2qWX+SF1uiw7Ir6vFCVMJQocKzEfgQ9cOo1YUDmiCOJ0sP7XPpYolaNAkbbMf4zU6TQ3g6SsSlOMBF3yNhgMKk3R131vy9drYoTmj+6GZv3BpithG44SOhNyUJy692EHfnz/vqr0cMhWpMlXv+O4QEmNOFMX4O+xUFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9uudzH/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9uudzH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769862070; x=1801398070;
  h=date:from:to:cc:subject:message-id;
  bh=BbQw1c0OE2SGxa6lSiv57gh67gFywY7WjFPMKvJXkL0=;
  b=H9uudzH/73LcSHvw1BaGmhHYXtFthNbsnNGu0pKmvygjLozxxTvd4Kb2
   heKiY0exEiMyAoBoNTO5ogG9SLZRaDaC6cii85CU25FtsumMZbhZtSpWs
   g1mSTJGrGJlTJ3NvnV+wey7+u54l/k9g6HNsk5rkjAjliYU7E0uoAmPSu
   6O8yA4/0euI9ATo8T157skregn35SdYiyhogb6T+4mS5XMGFhKmOGS+TD
   rBvKB4NIuJ5iCMfO0NjXSTMCTptmy4eePIK6Fgq3RqikuxskTDZrnr7rX
   XaiIcSXQfkQ772qdtI8tW24K99lHCH7OvwFcmXUnMOk0h4kNQ6/a2DEir
   Q==;
X-CSE-ConnectionGUID: 2/sHrEu6TsqddamKVmGgxA==
X-CSE-MsgGUID: HDMwQGBiTM6skSksRm2ZKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="81828385"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="81828385"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 04:21:09 -0800
X-CSE-ConnectionGUID: gFNMb5oaR+e1o1tob98nJg==
X-CSE-MsgGUID: +SovmcrLSZiZk/5n3EzKWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="209431423"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jan 2026 04:21:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm9yM-00000000e0y-1sMQ;
	Sat, 31 Jan 2026 12:21:06 +0000
Date: Sat, 31 Jan 2026 20:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 18/21]
 arch/x86/boot/compressed/misc.c:510:39: error: implicit declaration of
 function 'kaslr_get_random_long'; did you mean 'get_random_long'?
Message-ID: <202601312040.BxTrPB8c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   e9f5aeeb17ad1f5b0b86a198e03718ebae0b30a7
commit: 5712efbf06540fbcfa14b9e26c105a8eb2819739 [18/21] x86/boot: Store virtual KASLR seed in boot_params
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260131/202601312040.BxTrPB8c-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601312040.BxTrPB8c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601312040.BxTrPB8c-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/boot/compressed/misc.c: In function 'extract_kernel':
>> arch/x86/boot/compressed/misc.c:510:39: error: implicit declaration of function 'kaslr_get_random_long'; did you mean 'get_random_long'? [-Wimplicit-function-declaration]
     510 |         boot_params_ptr->kaslr_seed = kaslr_get_random_long("Virtual");
         |                                       ^~~~~~~~~~~~~~~~~~~~~
         |                                       get_random_long


vim +510 arch/x86/boot/compressed/misc.c

   509	
 > 510		boot_params_ptr->kaslr_seed = kaslr_get_random_long("Virtual");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
