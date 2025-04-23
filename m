Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611351A08A6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426009; cv=none; b=r9iaNSsZeuHQ0mhsTb5JyoqguUhNFd+HF8Wf55mSV5fBCdkIU+W0z3m3l+QeOFgA/Xqo7cQRWDLi6Kr+oJPmTetoE9XGeiC8USFiR/MBdaUtUCdVrH6gRgJB3f5Rz2IJpgeN9OSdwKaAC51izeSZAc4xgUvun1OEj+c0k7Xs2nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426009; c=relaxed/simple;
	bh=b9W8D7gIDshKK9HwxzpDRuAH813bzR+1OQDqA2vmSto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mWQrFyyQXTLJ6JcUnWkak5ucha4PFD2S7e/kXENBARndahO4n+SMjpO3luf/DOXyYJMiKRym8BW8IQyWULdtdZ8j3AT2cI4n4BklseAr10AFgPbADXK70ubBH3oYv390HOkNTnV7sACeKIQhGiw8riRuyCiORXuzXpW1C9+EYqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdR3MRim; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdR3MRim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745426007; x=1776962007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b9W8D7gIDshKK9HwxzpDRuAH813bzR+1OQDqA2vmSto=;
  b=BdR3MRimQ62qsaUdlmyCBGpJ5FudGG0j1RC3L7An0b8yHYwxzR4k/+53
   i6ECwPKMCBOrWTAs7ym5bV9smB5ntS0U4GcW2zCEidh/Do0X27iDZ3UUF
   c4+aygkw2knrAA7dI+CLag2lYakv+K6iQjVFFnFWV+B6Pu+FB/QUxgtKs
   sx27w7TPlBQXrjvSeqgr54Ka0kMW5G5ZlbTI12ga84zaUER3Hg0/75S8n
   eGCnGUB+jhMUMfnDFHmbqHGk+c11DEZoerBrHm0iiaNa5mrQAa7UaL0UM
   TZC2L6manQKh2Jy8zzTOIBI4ecXnMiK59IL1Uc2S8Td66+BHaJsqk5Ubl
   w==;
X-CSE-ConnectionGUID: gtTMSN+qS5+X3kdXPL+4RQ==
X-CSE-MsgGUID: Nm5GfH8HSJuFj0Q9l5iF8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58022571"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="58022571"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 09:33:27 -0700
X-CSE-ConnectionGUID: GuaDiKFaRci2HkpYnlEFWg==
X-CSE-MsgGUID: TDCy1b6YSo69BnS7aU+VpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="136439871"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 09:33:26 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7d2J-0003SD-2q;
	Wed, 23 Apr 2025 16:33:23 +0000
Date: Thu, 24 Apr 2025 00:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2153/2153] vmlinux.o: warning: objtool:
 .text.ip5xxx_battery_get_property: unexpected end of section
Message-ID: <202504240012.eaOAGT2d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bb46ff9245f25c71ce2d456156bb2fc39c400aad
commit: 349fde599db65d4827820ef6553e3f9ee75b8c7c [2153/2153] arch: enable HAS_LTO_CLANG with KASAN and KCOV
config: x86_64-randconfig-123-20250423 (https://download.01.org/0day-ci/archive/20250424/202504240012.eaOAGT2d-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240012.eaOAGT2d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240012.eaOAGT2d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .text.ip5xxx_battery_get_property: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
