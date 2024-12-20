Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A0219F104
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 20:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734725594; cv=none; b=bfLd7aUcLjKjGDRyPopQQ2X9bKc00bqKnapJRWCp+nqm1NRkP8droIoWVaIG5WwAgCboYpSwn3ogQKG89VkoXM4mKL8EF2WM71OJfgxBG8ENKuqwyWGwn3ahhfxd+sNKQopsM28hY2qOBXaBpNM512eRC3sQh0T6u1EXZX3BJEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734725594; c=relaxed/simple;
	bh=FxSUs8QpluHV8T1K6UmpPzvr1BPedfzQjQdjehUlS6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zbxz5VYYAXkEpwPFPIlboVp22UMuF/Pjd3krSKGF3ZYtLqGlTNLI9BcZOb2x1tGZFjHVtjcCDkBhvGnawUilzx09P5TdwHGWgj/pq4t3IzGsFph58ZxLCDXu8OdN5dWi27zg4s2Yprs3w4vq8FnIlaW0xARevHXK7pHcWppWEKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTl18fGS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTl18fGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734725593; x=1766261593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FxSUs8QpluHV8T1K6UmpPzvr1BPedfzQjQdjehUlS6k=;
  b=GTl18fGSc3YkQcL5I4HB3FO4E1HTLCQKAU/ARyrE7uy6C9E7emcBISRV
   cGfMRijQa5h8kAWWRy20acLeneLsZJyDRwpvj+ulOu+gLQyeaWJlRFb/R
   DhOW5Vt6RDQNtMImRPJDUbHBkA3fGulMKUOd231dqO1oKZ32lILMQFnig
   dy7hbgOlqVMHcjAkJCxqFF+KB4twIMO7erArFjOMZrzwFDyjaGV2L8muK
   C2bdetb7tq19ql4lfDYYw97OyT1WzjLHAwxFfve5FANs6SWruLcKXv2na
   Ri4VSpQuMV9yexOuqWW92A+C2XOrtSyNahC/sxf/+QvDkp5auT1UbNV2Y
   w==;
X-CSE-ConnectionGUID: 7PqkGkGtTGGxQfr29l2FRg==
X-CSE-MsgGUID: GxrgINJUTCeiY2UeQr+11w==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34998495"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="34998495"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 12:13:12 -0800
X-CSE-ConnectionGUID: RqolsRJDQfKpGSU8yZthzA==
X-CSE-MsgGUID: DS3HO3gPQlSLHgxTi9HhGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="99122469"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2024 12:13:10 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOjMy-0001eL-2W;
	Fri, 20 Dec 2024 20:13:08 +0000
Date: Sat, 21 Dec 2024 04:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug 17/19] vmlinux.o: warning: objtool:
 relocate_kernel+0x5b: unsupported stack register modification
Message-ID: <202412210434.l9wvN0Aa-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-004-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210434.l9wvN0Aa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210434.l9wvN0Aa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210434.l9wvN0Aa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: relocate_kernel+0x5b: unsupported stack register modification

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
