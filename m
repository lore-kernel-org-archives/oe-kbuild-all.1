Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16013215F42
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 21:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757972431; cv=none; b=C+nyAgrZCTS0V6l0rWBvJV3KqAve0PUCua7UF12hmk3Hf3tBu/CfsTLjzoN9qHO1jO0VNwpZY4FIYgFDMsLtVbZGs7LZ5LptoUgRaCvNEGOrOSpkC0Nsd6QzrEWiZAeSA3MkLRF+U/25Trpbq5kZgNOq2BoYzvwA0P+rFIpuZG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757972431; c=relaxed/simple;
	bh=pwboYYo+fZ1VgtL6FG2w+ZjaBpmWYx9IPD2qoBBBYqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ROT24eGOezRiT6kZCfoFp6o1QY2Foip1ZD+IoV8kDA8AqQWypk+XlgiMkGfhwYSnp9mSqo03U6lgcA2lA3k3/O/mLCGw5i6g0jnXq7t0/3OQle8nmKiFRSDFFebLqazsqIpyZFBgjBDARP42+HzXwxXgT9RnbVDk0BR2tc7mSZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qd1shNLo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qd1shNLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757972429; x=1789508429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pwboYYo+fZ1VgtL6FG2w+ZjaBpmWYx9IPD2qoBBBYqc=;
  b=Qd1shNLo8LQ72e/aZi8XQO+ZBXlApYyJEXs8vOV0RgHBGQDetkfQ6WHU
   6ie+XoS5rvWS1EXODfGJlL9gTsZzFilPrTNPW6btlNuAczFoFhbp4uKaD
   YcYTTTm09WZ4eQP94r3CE3kVYZgT4YyL/MKxeGkrtfyKARORZ8a+Zi8U/
   tdVVDszm1c8yLZ7A3RjEe4ydfDDqDx8Kx2zt+jSDUa8oakTTVpL5mooaO
   ZkyZvqLv3qT6EWb33iY1HinEq7zgT4jhlnEmcKS6hDcZZ+9Ua003vjtX3
   4duosXb46w2biUrNvUKbH9SQnxxOZoy7RlwcNLm7JCMSMzvyPKjpg+o8m
   w==;
X-CSE-ConnectionGUID: tBNy7P3EQXSJw3+HTnYD7w==
X-CSE-MsgGUID: YkLo/I6/SPqDbhXUtuxWjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59938228"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="59938228"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 14:40:29 -0700
X-CSE-ConnectionGUID: vtvcMhapSVWzpTulcltXPA==
X-CSE-MsgGUID: CYIhmXDeR4i78iIJ0tD6FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="205730806"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Sep 2025 14:40:27 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyGvw-0000iV-2z;
	Mon, 15 Sep 2025 21:40:24 +0000
Date: Tue, 16 Sep 2025 05:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3202/3202] include/linux/blk-mq.h:620:18:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202509160546.iYswCLFR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e1b2b313bb2317d78279ab55c49402841b4ce585
commit: 8a6bee347626968d467aef07453c4547bc23cb64 [3202/3202] blk-mq: fix potential uaf for 'queue_hw_ctx'
config: x86_64-randconfig-122-20250915 (https://download.01.org/0day-ci/archive/20250916/202509160546.iYswCLFR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509160546.iYswCLFR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509160546.iYswCLFR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-mq-sysfs.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-mq-sysfs.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-mq-sysfs.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-mq-sysfs.c: note: in included file:
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
--
   block/blk-mq-tag.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-mq-tag.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-mq-tag.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-mq-tag.c: note: in included file:
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
--
   block/blk-sysfs.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-sysfs.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-sysfs.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-sysfs.c: note: in included file:
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
--
   block/blk-mq-sched.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-mq-sched.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-mq-sched.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-mq-sched.c: note: in included file:
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
--
   block/blk-mq.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-mq.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-mq.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
>> block/blk-mq.c:3284:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   block/blk-mq.c:3284:17: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   block/blk-mq.c:3284:17: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   block/blk-mq.c: note: in included file:
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **

vim +620 include/linux/blk-mq.h

   614	
   615	static inline struct blk_mq_hw_ctx *queue_hctx(struct request_queue *q, int id)
   616	{
   617		struct blk_mq_hw_ctx *hctx;
   618	
   619		rcu_read_lock();
 > 620		hctx = *(rcu_dereference(q->queue_hw_ctx) + id);
   621		rcu_read_unlock();
   622	
   623		return hctx;
   624	}
   625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
