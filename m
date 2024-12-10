Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C58633A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 20:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733861251; cv=none; b=FmtdIJJx2Kakv+DF8YIUDF4e4sGl9EO4EBU7eoERWvaFZztvLjgN5CahiklxD1Yl+d39FqCK3SqKKe9TLTqBLak1DS4hR5wiGVQbqxm+sB5aEtdCg1qoGNwzr8vwJbWLIXsutLIE+bP16oKlhPQ3Fo1X3IEWh51f/qko37carBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733861251; c=relaxed/simple;
	bh=Jv02ebSQ+J6tYXnmrpAzugfVStvKj+5lA7lXy8ZC3sk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BF3CsS7nAYTl4lT4pXpqJDcMgMVr4NIu2hokQSuItCezj8AesFS100iMas42j6blAAvHlEKRlo0TMhKIdAgVjLvhph3OpTHos/JJaN49+1OGqKYOs0grv96KRRXsaibdpx8gXC5mpglGJZmRKvoxozGsnbEjeI98y7xF+lcg5dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G30A+l6L; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G30A+l6L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733861249; x=1765397249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jv02ebSQ+J6tYXnmrpAzugfVStvKj+5lA7lXy8ZC3sk=;
  b=G30A+l6LXijE6QJgQX6iqn/Lhfh6xRVYylRR2cUW59Pr6HVfmvtPGhMs
   KYoxyB1oYO4UgkZJ9lbd2EnTNCTSOrH9+1wcP6s4W2Nf+uB80lmKBIm/L
   yNDMsVtptRHEMFCu3tQQnBxmJwlo0dpIisDB74WKlA/obV4YRuX5I+B/M
   nt5Iws7CGBUWZQ+vPWm6HUkK7DwJIq8ii6HuXl7PFkLCx81S5wMNM+L+5
   NOZXfpQHxICt1aiOD3OaXhlcgRwK3ZV9coRqfWy34YCDRraRrQwJEDJ+B
   o4kzoPXfecvsEUfRGqMO/aG8BT9HBoiSgzL0rmKpawE+btrEra3EvM/xT
   w==;
X-CSE-ConnectionGUID: iG2vgDVsRduml0XY6JgzYg==
X-CSE-MsgGUID: ZTnEMEq7Tj+tglkwm8KsZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33546767"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="33546767"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 12:07:27 -0800
X-CSE-ConnectionGUID: 3sY2FjP7RNKxHJ9nLw4mzw==
X-CSE-MsgGUID: jnraRs9LTGOw7/ay+Ddg5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="118749882"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Dec 2024 12:07:26 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL6Vw-0005uL-0O;
	Tue, 10 Dec 2024 20:07:24 +0000
Date: Wed, 11 Dec 2024 04:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2574/2574]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_timing_generator.o:
 warning: objtool: dce110_timing_generator_set_test_pattern()+0x40d:
 unreachable instruction
Message-ID: <202412110343.SnsYTxbB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5c3dff2dbd96a0929b37a4f5331b76089f8f6285
commit: f2c902d8c653f8021f9761092a27f7b9db42b662 [2574/2574] tracing: Make tracepoint lockdep check actually test something
config: x86_64-buildonly-randconfig-003-20241210 (https://download.01.org/0day-ci/archive/20241211/202412110343.SnsYTxbB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412110343.SnsYTxbB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412110343.SnsYTxbB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_timing_generator.o: warning: objtool: dce110_timing_generator_set_test_pattern()+0x40d: unreachable instruction
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_transform_v.o: warning: objtool: dce110_xfmv_set_scaler()+0x1047: unreachable instruction
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce120/dce120_timing_generator.o: warning: objtool: dce120_timing_generator_set_test_pattern()+0x96d: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
