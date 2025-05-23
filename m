Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4004A20C038
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 22:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748037940; cv=none; b=B6879gRf3p/skiFIU5rv1HyLgZ9Xo/77RJsJPgn/1uxud7lNAx4AGDbcDARLFp1i1F9lxZsTCy9tqjJgakQc2PQGyrGyn51hPzEEEwODFPvf4DsFEsRty8Noxop1KTgwvwrZOH+Y1DYBOOojciJ7rG1JIC3zsihaeqqCY/dT6bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748037940; c=relaxed/simple;
	bh=nCYN858OrAv36YXsqsRBvFOzG9FQYRYT/tPerDnkXoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FblTDt3GOczXjC3Rj8oghL3dLSZ4xQ9XhiG7mU3iXmm0TECBR9KtLzNDcsgkdpKEVoFgOxU9MadFmDQTVCYTFjNVLwbcjXqkXxvSLCHmHUrVctdFjMbkUscVDGcycgWDv70+MhB/HrvRJprpE4gOeDgl2OrV39cEpcof5FOj/dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxEIbvMJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxEIbvMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748037938; x=1779573938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nCYN858OrAv36YXsqsRBvFOzG9FQYRYT/tPerDnkXoo=;
  b=OxEIbvMJDv6RDF+9p8TW1gbqnZJNrpJNjHFf8nvdqN1KtVhMgHIjj4oU
   WoKT0QrxmBQvGlsgYt6a7Jb2y6GxDrGCECYp7D2D5Q17psLriE+CJO/4T
   ifJrycIO5QEd20m/TD0L2jmIGt0l6SUPp8BXWkvzzCOFlDKS4wTTC5z1q
   rJCUAkCyAivOGCSs/91OiNtbG5dhcQlu4mROXtMsE3aQweB9dxuLTgrGG
   d2a4CR6zXo3yB1PMQq5xGHGv5GVGQkbf/qaTUR4BYaT7HQ5XpAEqJW9yj
   +uGX1XpjvIlNM89yoXc+JCMRQGhkjwLyWmABDAuwAgIGCdw+1OH60TBS6
   g==;
X-CSE-ConnectionGUID: qE4vTbZhRIiXEnViWnumZg==
X-CSE-MsgGUID: e/HflIAMTLSKQV4TFk1/QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67516354"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="67516354"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 15:05:37 -0700
X-CSE-ConnectionGUID: a8u8DNj0Tn6jxaz/CWLlxw==
X-CSE-MsgGUID: XZMvYn6MQ5WoHxxyXEstBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="141182459"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 May 2025 15:05:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIaWE-000QlA-1m;
	Fri, 23 May 2025 22:05:34 +0000
Date: Sat, 24 May 2025 06:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/next-20250522/clang-kstack-erase 4/15]
 vclock_gettime.c:undefined reference to `__sanitizer_cov_stack_depth'
Message-ID: <202505240535.hGg8I7eH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/next-20250522/clang-kstack-erase
head:   681194c2c1e885a1eeaff640c0b3bcc071fea17d
commit: f32454614318aeb0a1de6f8177bbcacec531bb94 [4/15] stackleak: Split KSTACK_ERASE_CFLAGS from GCC_PLUGINS_CFLAGS
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250524/202505240535.hGg8I7eH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240535.hGg8I7eH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240535.hGg8I7eH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> ld: arch/x86/entry/vdso/vdso32/vclock_gettime.o: warning: relocation against `__sanitizer_cov_stack_depth' in read-only section `.text'
   ld: arch/x86/entry/vdso/vdso32/vclock_gettime.o: in function `__cvdso_clock_gettime_data.constprop.0':
>> vclock_gettime.c:(.text+0x22c): undefined reference to `__sanitizer_cov_stack_depth'
   ld: arch/x86/entry/vdso/vdso32/vclock_gettime.o: in function `__cvdso_gettimeofday_data.constprop.0':
   vclock_gettime.c:(.text+0x8e0): undefined reference to `__sanitizer_cov_stack_depth'
   ld: arch/x86/entry/vdso/vdso32/vclock_gettime.o: in function `__cvdso_clock_gettime32_data.constprop.0':
   vclock_gettime.c:(.text+0xf18): undefined reference to `__sanitizer_cov_stack_depth'
>> ld: warning: creating DT_TEXTREL in a shared object

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
