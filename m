Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AB510A3E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 00:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751243509; cv=none; b=d0ytKUgQ2JWBNX3bkTWwO8G81TbKPrqLZyccNPp+st0mxdBP4D7DukY/7PNIat9kWHwjp3OpEHNJqFqgTdzF7tU8pSKG36AjI4OsvMKKUyVervfFoynojF4int4UoHhB2leJhZD1jhik3oX3wAqnUkpD+8J6mkkqhiHWtwD+h28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751243509; c=relaxed/simple;
	bh=oSeqhUmrhhO0FJQIuAe49rnzhL1nx/mjtlQhIhQO5yo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PlJ/ZcDQGsl9KauPS1A6Am9A+UeF9uqeRSAPy82P7t4t8SmDTjBVI5C3zYRwLQSiRk+Me68a9h5aP1oX6S8n2FETvqvsSceJJ+08rDBSPd4bSo4vx8iz3J8wvZ5KjV77om4iaH/U9ANLLfuE/ieEu5JfQeprX7tm3s8Bu0mS0Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXos16/E; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXos16/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751243508; x=1782779508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oSeqhUmrhhO0FJQIuAe49rnzhL1nx/mjtlQhIhQO5yo=;
  b=SXos16/EfrbCIWLU3mLfTbnW+a6MM8MR6bGZgboxhrjOG69AKZUNsxN0
   V4ue+Xg2iVd8hfQG2sOaqBbqbRypfPVo41T0Tuqe9SHAYpAS9ZEw15mba
   JMdBN7T60YTKq2tr6ROgAyJ6B6SQE7viiEhyEpRVsfCBqLDk3O2gz4OHE
   ErZ7bSTqSvo6AYdA9TPdKb8RX0VjFriqNzxXtRRfI04vlOTbKta82qQup
   11hH3KK08QFwhJTrrfTEzWqjJKmt02tKJfpDezD7ppBCDiiejGiBnNxFG
   w9NsI925Zr+JvrPRtagBzNMDwDrTxPDD+apXRcKiA39hCwH8amlvYGBc5
   A==;
X-CSE-ConnectionGUID: jQvqiOv4SwyttI8/al+Cxw==
X-CSE-MsgGUID: +pT7M7LZRny6zyQYRnbiRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53583642"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="53583642"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 17:31:47 -0700
X-CSE-ConnectionGUID: 8NgnPVblR4ODYaxnrT1ICQ==
X-CSE-MsgGUID: ZvEgI8lQQfmr/Rcafj8wMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="157700164"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Jun 2025 17:31:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW2Qx-000YLe-1l;
	Mon, 30 Jun 2025 00:31:43 +0000
Date: Mon, 30 Jun 2025 08:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1673/1673] fs/btrfs/transaction.o:
 warning: objtool: start_transaction()+0x3bd: unreachable instruction
Message-ID: <202506300834.dp152UeL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Filipe,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a9d08fabefcfd9cb8ebe45f8b79a321c0f349d40
commit: 2582bb7bd5a9278555265a99a94a8416e5eb7d3c [1673/1673] Btrfs: fix deadlock between fiemap and transaction commits
config: x86_64-buildonly-randconfig-002-20250628 (https://download.01.org/0day-ci/archive/20250630/202506300834.dp152UeL-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300834.dp152UeL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300834.dp152UeL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/transaction.o: warning: objtool: start_transaction()+0x3bd: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
