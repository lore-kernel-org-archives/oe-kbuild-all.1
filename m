Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4393339B3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 19:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h12ji30E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697485455; x=1729021455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=roJRdZju2lSORiG0Y6/6m5o148W9Vu+WvYQPpSLwQGI=;
  b=h12ji30EIk7qN6oiJ9tAo52bpH1FO9wgm3jGarse3hiyejDtAXEA4vkV
   wZeAPW7ZVCDC5xTeFOQ27QXcG98Gyx6jKYZfpDGhwa+RtQn3m2wApLCvf
   wGu/2Jrng5jrAdPwng5/gGvsDawdA49UTxZ0OqT0Cj7paJOA1XeYn8pTD
   etJIRhrWZq0rAYkuv96bGToEU54VCXkWY6g+NBd2HLOoOs+pGeIXRI6x0
   gWsMEJjXMXEsukEjM3iHX+xigIgibrjFqFfsNQeabK5SiSYR2dGITWsW2
   7fKrHYlO0XtdGQ3yZWFCjVjKlco4IXZrTn7G3asQ1MZ62FDawFOoyUYvm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="370698422"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="370698422"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 12:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087207543"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="1087207543"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2023 12:44:12 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsTVb-0008cx-2P;
	Mon, 16 Oct 2023 19:44:11 +0000
Date: Tue, 17 Oct 2023 03:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [efi:urgent 3/3] checkpatch: WARNING: externs should be avoided in
 .c files
Message-ID: <202310170300.WbxHv4Ir-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git urgent
head:   84c3aabfc824f15e8fa11450827ff8d9988f4625
commit: 84c3aabfc824f15e8fa11450827ff8d9988f4625 [3/3] x86/boot: efistub: Assign global boot_params variable
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170300.WbxHv4Ir-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170300.WbxHv4Ir-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#27: FILE: drivers/firmware/efi/libstub/x86-stub.c:846:
+	extern struct boot_params *bpp asm("boot_params");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
