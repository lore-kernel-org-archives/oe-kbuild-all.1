Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0FA22EE4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 19:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNqCwB8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698090613; x=1729626613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y9FXNDXGwb/1FJoOkDYbZ/vPGSqw98LSnZFriOAcxp0=;
  b=BNqCwB8IVjEKI6P2ty2IWfkT17C9vhBbXq+fCUWdqaAWEuwgjDUHMLx7
   fZRLfFT70HWFXchmjQQD4ciNh4UC+YWp5FwyK75kTK/N9na4asjFqa1xG
   sEITTYxzP6o27zU/2SSmY8tycxLbj6llJF2zxd62GwQNzbLNvAQ36/cSu
   k1soMfAYnHcDciagC9+eBvRenxWh7/y6TA9PvhVXQlD3k52n/5qWx2h83
   TYKtLeyFDoH6v45N9urty58paxuBFixBVh+bV24t+nEwtzTrJP/kVCviT
   +Dd7peihdAO4Fa6sRlLYkDc2TVWwDxC+3C+gb9BOZ5whWtr75RgW9Bgu1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="389763862"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="389763862"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 12:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="881880910"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="881880910"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Oct 2023 12:50:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv0wB-0007Cu-0f;
	Mon, 23 Oct 2023 19:50:07 +0000
Date: Tue, 24 Oct 2023 03:49:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/lpa2-stage1 13/61] checkpatch: WARNING: externs
 should be avoided in .c files
Message-ID: <202310240323.xwb9mwLR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/lpa2-stage1
head:   aa77c7fe48f8b863ab1c30daf17ed8893850c7eb
commit: 19c3a9f0bbab8e193ca90a365f2b03baebb552cd [13/61] arm64: head: move relocation handling to C code
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240323.xwb9mwLR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240323.xwb9mwLR-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#210: FILE: arch/arm64/kernel/pi/relocate.c:11:
+extern const u64 relr_start[], relr_end[];

ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
#216: FILE: arch/arm64/kernel/pi/relocate.c:17:
+	for (const Elf64_Rela *rela = rela_start; rela < rela_end; rela++) {
 	                      ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
