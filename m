Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4F1207A27
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 20:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379393; cv=none; b=oGEDOetqm5Zw1r/ODm/ZfI2fq83bSR1IQEokrHbQBE5ZbPRmZ4eF1BoYXV8lscei4LA2dsHa4mCvPn1IB//v+fnT2WZqM2iBN7LsPz5Pm646L9dLl6WtF4yJ8CF/VU/1Sk4VG3ChCHTbHyK8u5ZPYlEV6kCW/5ijY6kQCjHg/qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379393; c=relaxed/simple;
	bh=4yA6er6JbrdqIMwoEokHGNl5imSoygtbsJd5+bDhqzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bPYgDuXugmpW3d5uPw+5OMle2v86Zu21JvpFaSjQHKnKyJG4RDdDytxIS6dwe0JKUtcrV9RAI2PohZLtIueV4heF9TPYjoy0HpCHgEtMtskznhoVFL7L99wKsgAKD9h0+uOQI6CCO9eJ+aKoSKgao2225jd2PCXLMgs+8J1aFD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bP9eMHMH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bP9eMHMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748379392; x=1779915392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4yA6er6JbrdqIMwoEokHGNl5imSoygtbsJd5+bDhqzs=;
  b=bP9eMHMH+MxsmPqju0/YuDT31klhWi8rBm33fj5n8OeZUf3J6o4SXYMO
   4Rb30btABRVy23DChHbr7Kh3d8ruZvo5czpp1N3vvPysI2L/q+pFe8owl
   1Lmm79gTpg3JEXlwNr8FwLWI/5MKCLS3DyeO8u+cJuItii3VPbNvWH3lG
   pWnolWO2fPlkYsRT/rOABjhm6T6aPeJqUVLOvk5MGyA2r5mJnQyT+EjdE
   k2YsA4evVvqTLJKa1ci5cYqDPTKa1cz3T6Ml9zWJJDs6L4GRxU372WxoP
   X6Qll141LRKsJ8/aDxtzYCTJ8WVFjfNkuqCg9h/oQit/cIgWrYcgbK018
   Q==;
X-CSE-ConnectionGUID: 8ktMJ9DgSredSGW7SJsZOw==
X-CSE-MsgGUID: yeFe9YKmQu+kBohbkHnESg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49501952"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="49501952"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 13:56:31 -0700
X-CSE-ConnectionGUID: t3v0DPgqTuq4XPmudbkY2Q==
X-CSE-MsgGUID: ePDKKbawSguEQyXku3nDJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="147844237"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 May 2025 13:56:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK1LY-000V04-01;
	Tue, 27 May 2025 20:56:28 +0000
Date: Wed, 28 May 2025 04:56:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:x86/core 14/16] arch/x86/entry/entry_64_fred.o:
 warning: objtool: asm_fred_entry_from_kvm+0x7b: unknown CFA base reg -1
Message-ID: <202505280410.2qfTQCRt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   ca7a46c23111a8338a10755365abd43b80cc88f5
commit: 3a44a6ce27dc3d9d878c9aa0c46802ed50168c03 [14/16] x86/fred: Play nice with invoking asm_fred_entry_from_kvm() on non-FRED hardware
config: x86_64-buildonly-randconfig-005-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280410.2qfTQCRt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280410.2qfTQCRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280410.2qfTQCRt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/entry/entry_64_fred.o: warning: objtool: asm_fred_entry_from_kvm+0x7b: unknown CFA base reg -1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
