Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7DC2192F9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 00:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786754830; cv=none; b=Gqx7+zZOSMVMUBvdxXa7li+cDo75exm4cGeQneYKULBzYkjJOxR3m5asfbXjN3iQvj7ugUzzWPYX3QTCSqaDs6eh4ApY5rM/TtGpTS5zVluWX0Mm5zrV+GGQIHYl3MMpv8FUiZyhMfNEbOQ1Wg4gcK5bJKB8kqpiGQlhvkSE7P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786754830; c=relaxed/simple;
	bh=etHYRGpiCmuGavxDzFQSiyhQmmDpoZp0Rpvk1+7Lw3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NYx62Xs2+coWeFSfsNgaYpey7ugX6WiL+YOw8Ybobx3akcCdHmscj7oZjHsB3ZVsHozR6vYr7dGxzgfwNxQjjJG0+xLuLqtVptZQn+69oE8a+3XWDGdcAEyV46OB7ckzedeK46xyTEYSt6/oqpOHqyxepyIIe9a4LuPHkAcGNiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgUeykXo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgUeykXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786754829; x=1818290829;
  h=date:from:to:cc:subject:message-id;
  bh=etHYRGpiCmuGavxDzFQSiyhQmmDpoZp0Rpvk1+7Lw3U=;
  b=mgUeykXo9JOToxM5IQyUw3e6fp/1OprfJwppGbqM69LyKyZtRnLy6CMb
   ER3nPPdI3y+8Ymn40NdRGQlN41mjGp4aOKOL2HtCjmapsaKL4sG5O/ER4
   zft1cp0iU+xhRyLLYbens+aCmBq/Po9m/oYVZID1+pFsQoac//yQyqYaa
   uFVycTSVX/dJ7n1sb1yqFvH3e3LNNUHVck69tLjfiFyX5LGKGBmslzFPF
   GkgChB/ulfJ5Fp5W7jpdIq8DXH1rOm3IKfI6BrpNv4AKVWh7y18v/OGqV
   NlwOu0JMKUgWyq/TH3bAFkUQj3lkO+ngRjLlHys1Jf26y8BfewKBrJMHY
   Q==;
X-CSE-ConnectionGUID: m8ZQoKzjTtGRZBvarugxUw==
X-CSE-MsgGUID: F/sGaYalRpaw+7Vqu83/HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98488000"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="98488000"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 17:47:06 -0700
X-CSE-ConnectionGUID: m/53ieOYRSCGMuNFckhJEQ==
X-CSE-MsgGUID: 5Xv7btRAT9C28Rd209XX7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="263030089"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Aug 2026 17:47:04 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv2YA-00000000afq-28NQ;
	Sat, 15 Aug 2026 00:47:02 +0000
Date: Sat, 15 Aug 2026 08:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Jordan R Abrahams-Whitehead" <ajordanr@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Subject: [linux-next:master 14076/14447] WARNING: modpost: vmlinux:
 section mismatch in reference: tracing_gen_ctx+0xb0 (section: .text.unlikely)
 -> initcall_level_names (section: .init.data)
Message-ID: <202608150840.187qzdRz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2697ef8943c9985c14708a6429e21812693857b2
commit: 40fd9c2c1736dfd38593ae259600373dc99d447d [14076/14447] include/linux/list.h: mark list_add and __list_add as __always_inline
config: xtensa-randconfig-002-20260814 (https://download.01.org/0day-ci/archive/20260815/202608150840.187qzdRz-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150840.187qzdRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150840.187qzdRz-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: try_to_run_init_process+0x2c (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: tracing_gen_ctx+0xb0 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
