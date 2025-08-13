Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262BD322A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 05:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755062282; cv=none; b=X98SgxOo782jpufbixILCUpwnre8el3PKb7Z0yDC5Fl64QQIAUuOKNTsl6+2BkhuLj5AbE3C8sLKFfWrCQTSuVN+VUZRfE9+fPmpb9j02a0UYC9iW6rAoKXBrbU7oLXO8ajqjlBtJXAhL4C8zGAHRhNzHx0MPw0RXvFBTt2TC+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755062282; c=relaxed/simple;
	bh=UM0XmHvczlnP7hkDEy9WYJhn50I7qpodCEibqc/jKNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ik8EgYxmFrGcXi6mqGX0qSExIuYJ2hbQ+BVLwqZ752G0QdtLu/CUG53sPSEElQfTAw0kLjHnNyeOlMz/dKgg9xNwDwGxRhF3ClnQbgEfEnLCZA8qgDLCrkUCIPoj0r0/8MNBzD1cPGizabzuPAWyNxBwavvRe1OAHj8xSwFprLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PL6MPMF5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PL6MPMF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755062282; x=1786598282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UM0XmHvczlnP7hkDEy9WYJhn50I7qpodCEibqc/jKNU=;
  b=PL6MPMF5LYcZw7r4uy3MMfD4ByeqZNt22VF6mW/XSKz4bfkUshuMGfle
   Z+XUcYH75YEoNbuYKdJBpSce4c+xr5gCVZWW9L+laUTDS64Uchlf2Hjx9
   zGtijuWEwY4db6VAaZ9cD0JZ2R+iF9k6bhRvYoXSjeDbknASCLNeOyxdd
   i1T+HlBFIBmidlhP6r2qDSUi7IA8KH91YqOsnbAy9bRNblzpgcMe3MChE
   ayyQvyE5JxvIDVnnK0bAouWple6vIpF4LnRjfKpYw0J4QXStdYabDHPwW
   yMg9dcN/y9kP8kn5oKiIPNwWtRfK5gbKbMLXdlrlhB8VeRRjIM7HEm/Ni
   A==;
X-CSE-ConnectionGUID: JfCwNcDiRK+4aNUFiW55Yg==
X-CSE-MsgGUID: rLHuI3qwRVCQAOnPYqIgiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61192333"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="61192333"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 22:18:01 -0700
X-CSE-ConnectionGUID: yfW2hXHsTK+snPT7GHFqLA==
X-CSE-MsgGUID: +dbWHicnSsm2YpOxCb5GwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="166260391"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2025 22:18:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um3s5-0009YK-2U;
	Wed, 13 Aug 2025 05:17:57 +0000
Date: Wed, 13 Aug 2025 13:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fred_kvm_v6-intel_next 59/60]
 arch/x86/entry/entry_64_fred.o: error: objtool:
 asm_fred_entry_from_kvm+0x4b: call without frame pointer save/setup
Message-ID: <202508131321.5pHhICiY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fred_kvm_v6-intel_next
head:   10aaaf102d71ccc37575cc3e0bd386fc02384a8d
commit: 2724c18085f2a04c6bb7d737f1c9665b4f2b895e [59/60] x86/entry/fred: Add UNWIND_HINT_IRET_REGS to FRED stack frame
config: x86_64-randconfig-004-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131321.5pHhICiY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131321.5pHhICiY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131321.5pHhICiY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/entry/entry_64_fred.o: error: objtool: asm_fred_entry_from_kvm+0x4b: call without frame pointer save/setup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
