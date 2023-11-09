Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87531C3B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 14:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOwjuMHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699540660; x=1731076660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=70xtWhfP9elJMcAkcVnJGfvorqBl5pdIItoToc6r5lA=;
  b=KOwjuMHDOI/9Vzq0UVYZxw53/YhntlhcNlXQFVy6tnCGoXWh9kOscw2O
   z3lPGdgCxs8DpPOD/lr/WS+Q6snsd85AsDVWJQq5dS04h5HFNjGtDXmM8
   /U78zBGq+S2GSGeI7MhmPSjy98Zh8Ax26BpxnQn5Pam5X1An/rZkmL0hB
   fbh6f3IKGtZQfAfhNrNRbB6yixH2xpg415+WIk3HRoRR6tyHCoDpFa2k+
   BPbQTOSX2shvvKkjyDLTfI8/YftacnCcuDYCTcjZMywV/nbDxHd+2Gkpy
   U3aoe3noRUxMF5LRor0u5Hfm0S7YzsmlCULRFkuoMyxBNs4fUc4MkR4/U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="421090507"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="421090507"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 06:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="713313713"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="713313713"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Nov 2023 06:37:38 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r16A4-0008nr-2h;
	Thu, 09 Nov 2023 14:37:36 +0000
Date: Thu, 9 Nov 2023 22:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 2/2] arch/x86/entry/entry_64.o: warning:
 objtool: common_interrupt_return+0x1c: stack state mismatch: cfa1=-1+0
 cfa2=4-120
Message-ID: <202311092240.M0XWsiCk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   ed03ac062608e85cad7072179595ebbeaa1fb9c7
commit: ed03ac062608e85cad7072179595ebbeaa1fb9c7 [2/2] x86/entry: Harder return-to-user
config: x86_64-randconfig-001-20231109 (https://download.01.org/0day-ci/archive/20231109/202311092240.M0XWsiCk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092240.M0XWsiCk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092240.M0XWsiCk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/entry/entry_64.o: warning: objtool: common_interrupt_return+0x1c: stack state mismatch: cfa1=-1+0 cfa2=4-120


objdump-func vmlinux.o common_interrupt_return:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
