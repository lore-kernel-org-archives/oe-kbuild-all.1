Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491821BB695
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 05:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722921232; cv=none; b=uJWQjLEydI+f3s3hAqGXKR2L3nwqQdPPR2iZc1+Z8snVPJacDmVIQz91qNqYLcIhlRnnb0GmbiS2gIttwiK1WJWw3tkLbU1QZ6DezUm5TbfW5Drl/rNotF9o0O8XxSlPA/6yL9dZ9MetFXMiDSe5Q48fxp+jXTZb0t0hhkRqD4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722921232; c=relaxed/simple;
	bh=ymOBuxoxm3UpkoPoKnOEe8kIHrVJLbPYFbf0dK1sWIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NNxgUOipUhSnsb9BW0xO672PtmWpcl7NHiNoVCqy01G5Uk9kc7B/yn9pILQNAkQSJ6thmDqE6Xfco4PjFCRvHICPMmctxonA5KBWujUNdz0dEWDEZ/nEr63WnHPzGt4DJApAqW2ZWTltEkkb1Uw17mKtEgYCSR23QFVJbaHC39w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOQmuf7r; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOQmuf7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722921231; x=1754457231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ymOBuxoxm3UpkoPoKnOEe8kIHrVJLbPYFbf0dK1sWIU=;
  b=GOQmuf7rzEU7HwSBKmQaHnP3XZXhADAKm6XPqFPdf55S4fBtKpXR5PkS
   PNJz4fAcgs+9oTvl3kThXoc7sz7c81vdI7joQ7d31d+Hl6ThFnmM5M2/l
   wkhjevjP1SyInr6LC6Gsqw7W/+oNmuNx30xjbbQ95dyp6qH2BQw1UB0xI
   G77j38ibrv+sxMwBUYXZPRbdF/qCAfTIMni8tISGNTZ6YhL8JAQ6gj1lC
   jhC4lS1hhdXwqhQS/9MkXdcZkvftyP43W2/BNXNY0oGIkNww3Uy0TLnLe
   8LaXwGJXs6YxsOBduqWFJ0IqsPoNOobyzaTHqkWHcC4vJq0HgHMcWiI4N
   g==;
X-CSE-ConnectionGUID: +BwkJSM5RU2TY3FM8ccN5w==
X-CSE-MsgGUID: sQDglOd4S+CcP4PEhTwPOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20881486"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="20881486"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 22:13:50 -0700
X-CSE-ConnectionGUID: c5QvL4ctSVS7rXlC+LMkmg==
X-CSE-MsgGUID: s3kc/CWPQxmormQBFQ6Z2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="56320272"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Aug 2024 22:13:48 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbCW2-0004Ak-18;
	Tue, 06 Aug 2024 05:13:46 +0000
Date: Tue, 6 Aug 2024 13:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org
Subject: [arnd-asm-generic:master 5/5] error: scripts/syscall.tbl: syscall
 table is not sorted or duplicates the same syscall number
Message-ID: <202408061327.Ynl7cHnE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
head:   95cca8c0b66557774e5d08d5d0cc28c099938f15
commit: 95cca8c0b66557774e5d08d5d0cc28c099938f15 [5/5] syscalls: add back legacy __NR_nfsservctl macro
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240806/202408061327.Ynl7cHnE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061327.Ynl7cHnE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061327.Ynl7cHnE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: scripts/syscall.tbl: syscall table is not sorted or duplicates the same syscall number
   make[3]: *** [scripts/Makefile.asm-headers:88: arch/loongarch/include/generated/asm/syscall_table_64.h] Error 1
   make[3]: *** Deleting file 'arch/loongarch/include/generated/asm/syscall_table_64.h'
   make[3]: Target 'all' not remade because of errors.
   make[2]: *** [Makefile:1211: asm-generic] Error 2
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
