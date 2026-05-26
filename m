Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABDE3B0AD7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 16:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813397; cv=none; b=P7XtVks+QNgYocEyvQt7kN71DlYG5m4wPgbENLHPbmyWv1ifz8KKQbsVcjh2KC0rHWbfce3eKXUoKxjz4A/WIwhV3XdkRCRjx99zqyRf7OfF8qwoQGXI91xYhrwiv/cmX9sFiDmcE22S10yugMm2f82h4QYHEuALFw6UU2YC9hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813397; c=relaxed/simple;
	bh=sjpI42LjIORYj8igvWA2Fb67B4MfkNT6ano2g7ZLN4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bctw3N7WaTMkOu+cuIRdBfes3U2tLebhl631EaMnT1U/8AD74RZzUNrszkFjF37M5RAQu+OexaEP0y+JO8B3Zpv/7eEMqH0nUJ1Pp9A10zeGo/itcECotwgCOQ6Dx7CfqGVN+Zpsea0HIdO3SrPFpLG6GdSpJcbUBDMW/P8m0oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naKFTwUJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naKFTwUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779813396; x=1811349396;
  h=date:from:to:cc:subject:message-id;
  bh=sjpI42LjIORYj8igvWA2Fb67B4MfkNT6ano2g7ZLN4c=;
  b=naKFTwUJCSzDexLxQgSE8bngEnSwUnIs4Jv+3NwPgmsu5z0QgBW55Wxg
   z8oa7HcyDfZjcFPeKy0Rh4WzqAMX5FnBpWgg2TaMiLWIm8eMuGBLg+HB5
   bzJDWRmP7nDYwEPEYsM+9JXb2p16Q0k8FGyGiUpIHVcXodAO1c5SG5JxJ
   DS3e4Qejg26dAam1FtCBQ883l2ZGJoyHtI3L1r3o0Rv9/GeHI+Ba0CYEr
   Znv8mFdEWZi0t5sZDArMIgNitrK70nRvrXdamqItSRqCl7g0RPfzbu1Bm
   si4kqzDk0Ut3/r1lB2iOy/bddnHDvZ2WjeUrZH58e6KLsUNr6j1pNWYGq
   A==;
X-CSE-ConnectionGUID: L0ErMYOJT7iNDwehAP2/cQ==
X-CSE-MsgGUID: FNB+ILx+SFG1ZW21VRjXwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79668264"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="79668264"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 09:36:35 -0700
X-CSE-ConnectionGUID: k2KvBawzTyO1T0sEgENE5w==
X-CSE-MsgGUID: FDYz/6RcTlijObCM9kK1ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="237802620"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 26 May 2026 09:36:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRulc-00000000CS9-1Euj;
	Tue, 26 May 2026 16:36:32 +0000
Date: Tue, 26 May 2026 18:35:47 +0200
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 15/23] <stdin>:1633:2: warning:
 #warning syscall rootns_wait not implemented
Message-ID: <202605261821.6Nc5v3CP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   e5a6a778f0cd5584723651f07f5e46f765b4b2f5
commit: c33122882bc50e01504936c20aefc86b1dc1bfb5 [15/23] rootns: Implement rootns_wait()
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260526/202605261821.6Nc5v3CP-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261821.6Nc5v3CP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261821.6Nc5v3CP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1630:2: warning: #warning syscall rootns_create not implemented [-Wcpp]
>> <stdin>:1633:2: warning: #warning syscall rootns_wait not implemented [-Wcpp]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
