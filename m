Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C934301463
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 23:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761522191; cv=none; b=R0YufIfPdcuA70Fa0BM1WVXiMhxFr+OkbhThMlUilz+STfNpSpLukmugcrb/6rm8XllhnB82+HcxMgqDpAHRaHNTXitBI/VkQc/CGpZ+Urf16VohvaiBujaIHZA6DYCMh5CFYrMjGimD8wM2JGXx1v24azxkJjMn2Q1aN12KesQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761522191; c=relaxed/simple;
	bh=qBdWQQSXBmceX5JzV7VqS0SNTwR9MLu15rbhh+Vcl6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dsRDrt/BTSipoeiZhuvmHyFgXkpz6yjexMKWT0jTW6BihcqqdWrH5J/DBe3Cs6pIJXyxu0LMOj5wkSwlAjmN24/cpT2rh3jWl3hpOal7lzB+j9j96v/VX5IIvhdQfVr2qW3KWbZ8rYDQ2XYs4cL9nMJ/2XJHNMYihbHzuF35X20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PeFVuFfU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PeFVuFfU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761522189; x=1793058189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qBdWQQSXBmceX5JzV7VqS0SNTwR9MLu15rbhh+Vcl6E=;
  b=PeFVuFfUBAVN4VJIVpDNPOj1pj1BS9e9KfdGwOG+EbdCH3/DVttcoliz
   A08AvX98CtKKzxkwUlP8rnKO0NvTPDykFmA+4JtOeCPb7mT7DyO1bZ/Nl
   a6s9f+n4s2vee2nAkhAPDQkSjIHa9dDyo3mbCpjp5XdZQc+PjeD205dt2
   HYrSDf9FGMDwI809WgNEEvN8qnh995LUXbf7WWLfqvVvBq7mi1KPw9QIP
   aheTED1e9sHAIc34OE+P+9AYR2HgLlDfYGNNvLVPpR0sAzQis5Rbv0M16
   yB9jQCYAJXhbPMW9Z1KkFIa5rOyBQ5/7PP77RfxdVnGZn7tRWlfU+Z21X
   A==;
X-CSE-ConnectionGUID: ygNLgzb3SIKCFL1kANYk2w==
X-CSE-MsgGUID: JAXgzP49RSyoe0gjydulKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63495029"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="63495029"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 16:43:07 -0700
X-CSE-ConnectionGUID: wSoW3MruTQeNx5J8C+/qXg==
X-CSE-MsgGUID: ePBcOsUBT7i/vHb5A8aqvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="215549221"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Oct 2025 16:43:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDAO5-000GP1-2F;
	Sun, 26 Oct 2025 23:43:02 +0000
Date: Mon, 27 Oct 2025 07:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice 40/75] kernel/entry/common.o: error: objtool:
 .altinstr_replacement+0x8c: redundant UACCESS disable
Message-ID: <202510270724.yJ0KEUW2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   44778ec169878406f8c7822820c9dce29df889ba
commit: 5b3fd8db8fd83f539e5ac3b6738be415f6087114 [40/75] rseq: Switch to fast path processing on exit to user
config: x86_64-randconfig-123-20251026 (https://download.01.org/0day-ci/archive/20251027/202510270724.yJ0KEUW2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270724.yJ0KEUW2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270724.yJ0KEUW2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/entry/common.o: error: objtool: .altinstr_replacement+0x8c: redundant UACCESS disable
   kernel/entry/common.o: error: objtool: .altinstr_replacement+0x8f: redundant UACCESS disable
>> kernel/entry/common.o: error: objtool: irqentry_exit+0x495: call to class_user_rw_access_destructor() with UACCESS enabled

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
