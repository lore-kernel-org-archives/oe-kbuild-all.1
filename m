Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE1114EC73
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 01:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769997323; cv=none; b=akXiy1epO91X1OerLSijkIWADFWs2Fo7KwhSjY76A8eIlZAlGI156orPWrTPxtNQBh6i23K+hsYIk/GitcXn8713WhU+0GKjohF29OEsOmdDiPnpUw5WoQQyf7TVA8w2dhE8K2U9v/1drLlvwVnvWjGrekyXgNIuzvzQe6/QQvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769997323; c=relaxed/simple;
	bh=rPqtvmmq3V2nQmN+BwH1W2I17+H0Z3E0/c/KKh0Yvsg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pXusYHkYtk7FRRwUNk7WvXIpJSPdgsEAbqb+tafE84aSeo+iF1kwdBCVZZ+eDwg5HL63zWAtO1RQ57G+1XaJUUG+zrPktBXBjIMknCZ9Wh50m3Ma9IehLcUJFO7IpLAr4rfi+J+TvNYWvMyunp0Iba5kp/3XwwwQQJKm77ldxMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3SFN8Bg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3SFN8Bg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769997321; x=1801533321;
  h=date:from:to:cc:subject:message-id;
  bh=rPqtvmmq3V2nQmN+BwH1W2I17+H0Z3E0/c/KKh0Yvsg=;
  b=e3SFN8Bg+SuNRyNORfSOVxfeB141IqGwUA3zXjGUNmZxdoZMce/Ch/pg
   Azw9CJojqcgsW5j/45oyOXMgj8Uz9iYA4pNzZ50wmJ54joLEbhUeOAEMU
   Xxf/PIMIgXPkpYSoprYq5PtR8MFVPmABX40qMXK4AC//Svuz60VwNc4h5
   ZrnSHUp9fPEqWLh1XwKDMgbNhKvMkuzfx5L68MrGNB5hufX3iKs5CBSVu
   sisl4AmGYekU5syOj4eIkHkzB2g5jkxIVO1JE3dUyksBMXvFsbyye6mz3
   KK1B3tffbFXYyt+RFausDwyKsexeBfZ1u7uasD7if+d79/v9vU4Okc1q5
   w==;
X-CSE-ConnectionGUID: ghGMdRf3Remftb/8Py80Sg==
X-CSE-MsgGUID: aB2dD8hpQ6iy1EBdsA0I9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="70172986"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="70172986"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 17:55:21 -0800
X-CSE-ConnectionGUID: sVdsslCRRYuIAu/c6VUWQQ==
X-CSE-MsgGUID: RfSekD6dRr2G1SuChY/8Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="208923684"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Feb 2026 17:55:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmj9p-00000000fAe-2d8q;
	Mon, 02 Feb 2026 01:55:17 +0000
Date: Mon, 02 Feb 2026 09:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 8/21] vmlinux.o: warning: objtool:
 ___bpf_prog_run+0x2: ignoring unreachables due to jump table quirk
Message-ID: <202602020921.6L06RneQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   f706b38ea2701854b12c604e2b0eb94d229ea8f2
commit: 97e1889365cf61110c72c1d25695e378089c9343 [8/21] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260202/202602020921.6L06RneQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020921.6L06RneQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020921.6L06RneQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ___bpf_prog_run+0x2: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
