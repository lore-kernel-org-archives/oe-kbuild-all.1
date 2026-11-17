Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905012;
	b=2CABfQVCo4JgNZe8y9a+1666AtYt+twDY09sR3c/0NcJsEBMr860hMRzUZ7oZcIovQ/D
	 2GraSOJoZSOms2Vg+tSCF8tvNK2CmhTONXwFEUB5LTT9O0TVArzrEhERu4boDAgzASzOr
	 xbzTm4jh1oOfgC2/0bc39Ff4rwPEgLs/YY41k7x7fkIgeNFwlYAZ6sacb9oR39NsFKTDv
	 6GdFbs7+3Zb4CzYy/doU2r6t51PLADOAchAT8yHYaB7uUPH9z0I+oyVCZ/Kp/MovWee+S
	 bgPUTED3wR618Cfr9zgv2MJ31XXsPcV8n7l55OXI3hZxY9GiBaAkgm71JZes1x0ZEHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905012;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/Avn2J7/Ks9YFUzkTzMySMcGaoO9tUgxjiZP6n65qfg=;
	b=Ks5+7sGhDlEYLUbbaX4bBHd1puVVrYO4sYWrzPmhyFJ2/W4CJsjVLeNXxQyg8FyantwA
	 36Kb5KEgn91cUXu7HQd5q5ThXwzF44iYgV3IbPp0+3YjodaugZtqjXMAe3No9lrE5fbyG
	 QKAtDYdeW1xEYjCHN2Avbr+E6eJOlOJBmdIxPSMOPWd7nzWIz4mUBHdZIj7XzVnzXL18m
	 7Ori1/HS0xSNwV/vn3yerycToeVWc/3AwegMrAhJ+nBxAGpyRfUZp+lY+rlq96cEXKVz0
	 WeAIUrlpIddIri6i8OXHZXJhmJOQnEvQ+iqWzwjELdcdIyVQrL4GCEISMgCy80HYz4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="H7c9h/pW";
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A67606A887
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 08:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A67606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H7c9h/pW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794905011; x=1826441011;
  h=date:from:to:cc:subject:message-id;
  bh=R4XYGooSSFvJwL5nlZCxKKywLt3/iW1IIyfeahiit/E=;
  b=H7c9h/pWt5pLBpRXFhwSZLutjJ+oxiZ0lIqMYU5U1YTtYVS4O/B6kU6Z
   +eepjwXpVE78mlcmJNSZWfrYldsnyTKogxYgK9y9TteB8ROAKvoKL5QQy
   I1Vn54SZafHv1v9ZJuyunrKkgsO17lxW7vlD3mP+tyUBFMvEbrGCF+Dlg
   VwRjRPDPD5qz3dY3dT8PIctjMXEm0qUdRRN0yotenQPbuppyDNbAt8LkS
   iC75DGit/xTQwW1aaFagBgj8v3vdjkK7fg7LAO+QeSJO7A6bdqNIW6Cys
   5iUFc9psUnZeL9SGbw6rNfzpEDridHsrS6PYgJbOitgwz/9dGAMV2Kbp2
   Q==;
X-CSE-ConnectionGUID: +Eizvtp8Rq2c2j0B0RC7HQ==
X-CSE-MsgGUID: IvWhABlvThy2oLp1fj+RtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3520785"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3520785"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 00:43:30 -0800
X-CSE-ConnectionGUID: +H8pz4VESzybGSisS/2dRQ==
X-CSE-MsgGUID: do1r8KTiQr2V+Y11b0Zh4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9682922"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 Nov 2026 00:43:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTEmk-0000000033W-2zqy;
	Tue, 17 Nov 2026 08:43:26 +0000
Date: Tue, 17 Nov 2026 09:42:39 +0100
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/050-nvme 1/2]
 drivers/nvme/host/apple.c:230:14: sparse: sparse: symbol 'flush_interval' was
 not declared. Should it be static?
Message-ID: <20261117093124.AMCjWJbG-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/050-nvme
head:   eff71bce586f1287343ae8f1956d6f516b61cea9
commit: 575076333cf6255daa3f7ed6cc06b0bceff3817a [1/2] apple-nvme: defer cache flushes by a specified amount
config: sparc64-randconfig-r2304-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117093124.AMCjWJbG-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c7014922f5829426952a38d079220c21b0a8ebe8)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117093124.AMCjWJbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117093124.AMCjWJbG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/apple.c:230:14: sparse: sparse: symbol 'flush_interval' was not declared. Should it be static?

vim +/flush_interval +230 drivers/nvme/host/apple.c

   229	
 > 230	unsigned int flush_interval = 1000;
   231	module_param(flush_interval, uint, 0644);
   232	MODULE_PARM_DESC(flush_interval, "Grace period in msecs between flushes");
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
