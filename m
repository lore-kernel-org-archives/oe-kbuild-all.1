Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018B63C3BED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876473; cv=none; b=qOzMhTQmj4dbMhr0KntknL0FHZMqGaQvMHCX99rjRyXLGwh7FIHRDUhVqdv9KLrZBekUJ95J0KEBHA616PEP1dQykRDXoF6V/+h4d3s1rPPIOnKGVNmgQ16Nh/XBsG93YH6mqF9W85yeYXq40UnsU/FLJSVycgD98m49QkQPNbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876473; c=relaxed/simple;
	bh=fXDXKR6fDJtDGDKZWCOWZ8SF1uywtUagBymBtXlrbfc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ta6zC8P2g2avcJs7RLMJIYjj8nsERER6Tc4Ubz3oRnKLcj8zYbRSsS1cda9P3l1+r2154JD3YNSu69Crkk0qPx0FFaSQP/LLWWsNx0e/TXEFX3K2tXP4gEOm/H4sYU36WKI64lm4JWqP21XcPT1fghHnLNlzj3bpP+i7F+tRBpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxn1ZQnF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxn1ZQnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779876472; x=1811412472;
  h=date:from:to:cc:subject:message-id;
  bh=fXDXKR6fDJtDGDKZWCOWZ8SF1uywtUagBymBtXlrbfc=;
  b=dxn1ZQnFmsQS6BRG3Og+zpCqnOSbyHd4BoqxNOofKITQ3ZVpoQGRg0ZE
   Nd2AiojSEHn41a0XcTGWcWO7Wi9fwcmAWjxTy5uXW2WVQtdENMKLBqx/4
   8EN4ciQFb56jSge7xZspdRCVYV6ftHf37KvXWNiBnnnqI4WdKU5e5kLY3
   qryWiyx5M1qWnn3EdFjNcTOVNN92egugp3jZLUxwbk3r3k4X8djdFjz0a
   wGKR0Zq6vCT548fkPJIoQ3npXbM7iD9Kb1LT9MWdDN4mlk5n84vE7/xNN
   dYRRTjHWIdgeldoZ9JidRdiFKAGOh4dSqUplJTwtAbntFHTW5KUzflRDi
   A==;
X-CSE-ConnectionGUID: VwwaZjvBSoWYvzf8qHahbg==
X-CSE-MsgGUID: joVJZiy/RkmtT4TqwLIjcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80671428"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80671428"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 03:07:51 -0700
X-CSE-ConnectionGUID: IHhi30bnS6GYsVQ5qSO9KQ==
X-CSE-MsgGUID: HV8N5ekFTg6/e4GGkilxhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="247140387"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 May 2026 03:07:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSBAv-000000003nW-3Ldl;
	Wed, 27 May 2026 10:07:45 +0000
Date: Wed, 27 May 2026 18:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Manana <fdmanana@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Boris Burkov <boris@bur.io>
Subject: fs/btrfs/print-tree.o: error: objtool:
 btrfs_print_tree+0x270: can't find jump dest instruction at .text+0x1cfc
Message-ID: <202605271832.n0b66QeC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb3f4b7426cfd2b79d65b7d37155480b32259a11
commit: 90b7d4c415b2992125b8ff8fcd3191b14047fb7f btrfs: remove redundant extent_buffer_uptodate() checks after read_tree_block()
date:   7 weeks ago
config: powerpc-randconfig-r063-20260527 (https://download.01.org/0day-ci/archive/20260527/202605271832.n0b66QeC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271832.n0b66QeC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 90b7d4c415b2 ("btrfs: remove redundant extent_buffer_uptodate() checks after read_tree_block()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271832.n0b66QeC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/print-tree.o: error: objtool: btrfs_print_tree+0x270: can't find jump dest instruction at .text+0x1cfc

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
