Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E651BD9DB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732811333; cv=none; b=rBumA9BVaHQPTqmtjsAvT1ahErw7IlOZzQNMnsIm+MeaSULaJ0GxlwQanBB0Ti7HHB73n5QqHTyWwNl7Dlf5svywQvTAUWyFZ36esV/rElqEYmJGlWBazeO49ZEAHDz1mhJiQlY1xgOnvrf3RFFvzl4OxOMNFvKa1SiBylxk5kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732811333; c=relaxed/simple;
	bh=1wZ7JRupMcBL2LOULMxPLCzj9/iw5N0ijvUleMaB8UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNLUFzGLMcb0DerzZ1cxC9pxwqKJhVO0487oWAWYbS78AyfPV2tEpGoI250UugqnyQP7T5G3KrvBCdRUo1dW5ZhqXfRHOIQ8B2mX5M5FwG1HOZ/FHl2p263GAbv6t/c6XEF4MUm/HLM6nDFUiMmxWsiBGeSrJi2Sefx0xsKjL/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIvqyRW7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIvqyRW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732811332; x=1764347332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1wZ7JRupMcBL2LOULMxPLCzj9/iw5N0ijvUleMaB8UQ=;
  b=IIvqyRW7uv54G8J6PQNjPNyWPG+XGp6phIvRVjg5Zm9dO96v0+omIYcu
   6jD0ZePSE6T0507NAtZZl5ZIlrG5HlV1ApSXhnyba0VK6hN80NTszTwF3
   7tERPWMeQegGckFzeF6J2L95ezfVIUAVXsSw5km1W80Z1Z7gKyjZCxJ/S
   P2ltnvsz6qbEJOIRXQUX+DGNMTCD0Q2yMjcV02Yomn0XGjFUaTzZXtUR6
   oH3OIx1oPDfGVJuLqjSqgZQSRhhkFYr2NAUHKkT1OvY7yR1jCjF7Uultj
   mFUoR1WEdaQ0QFTZysScu6f6NJFN/6ZDEZOK1c5Q0TDVLhx2/zstHkoFO
   Q==;
X-CSE-ConnectionGUID: DrdXnC4PRIiwXLc6CgFaeg==
X-CSE-MsgGUID: mMRLN3SRQTqhVgIBZ7NfXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44110540"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="44110540"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 08:28:49 -0800
X-CSE-ConnectionGUID: GNCNVffxRp6jsc+9LYrI6g==
X-CSE-MsgGUID: U2eIWwwuTNOTYhJwzpctkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="123237791"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2024 08:28:48 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGhNl-0009np-2Y;
	Thu, 28 Nov 2024 16:28:45 +0000
Date: Fri, 29 Nov 2024 00:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2435/2435] kernel/locking/lockdep.o: warning:
 objtool: lockdep_unregister_key()+0x9a: unreachable instruction
Message-ID: <202411290038.4Q8x22Bi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Waiman,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1a47bbfaad6fcbfb4fe3935cb7408d843caf3760
commit: b91170be2b1f1ef673f5e79c7a4beb5673a8f881 [2435/2435] locking/lockdep: Avoid potential access of invalid memory in lock_class
config: x86_64-randconfig-016-20241115 (https://download.01.org/0day-ci/archive/20241129/202411290038.4Q8x22Bi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290038.4Q8x22Bi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290038.4Q8x22Bi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/lockdep.o: warning: objtool: lockdep_unregister_key()+0x9a: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
