Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0659F375ACF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534070; cv=none; b=bKqQMQByJeUyxwbfH1nQsSnNezUwHI6TFooxO6BOR2WCO1kEn8nkujz7KQ6bx6KR2WAmFApdYbw23ieW4cJkpatqemdwEoGAg+EJ0zZZv5f7fusjQot2f0AUx6XV9PDHSVWoF5u71aY36BOEz+UVDur8URc53tzwlSVLpDkF860=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534070; c=relaxed/simple;
	bh=7pJW6AIhxu/7O+qZodmMkX/x2rIw5J1MgkHsL629tqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A8OeSLiLG9sB7V4MTbLUU1k3VIFoKoYy6buMQSsuEFsPrCY8VXBjittKVdMzW2HdFWspW+PBjHumJwi6N1LsFlXlda7JeoytPOu6WWhZFP2+KDku46V0VPFFHFFmrvVWf/UZcXAbeaG2yyILQsbk9QUI+ilK6kW5vFloyZTdyVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G804Rdsr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G804Rdsr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534069; x=1807070069;
  h=date:from:to:cc:subject:message-id;
  bh=7pJW6AIhxu/7O+qZodmMkX/x2rIw5J1MgkHsL629tqs=;
  b=G804RdsrnlpIyDwwnTP2noVV5FSd5nKu1aZELuFo9u20lNrC4Tj4h15J
   A2+/NYRIvG+B4MTlJmk6Fpe1oWKb6vRvFj/evZu9eiYHQWS49RF5kXvJi
   djhwy2RJ4/RiB95gLOVQs8GRnPTAIXrZNlSmIZ248S6AiguAV7Gt4QLBO
   FJmnj2GYh9/TBESpg7i7dJpTqHJ5hH5AtMNCcMt7ui0amAL+OnFj7rdd/
   vzpjfA6YmACySXZm+IhgcN/kUQ56VT+Nyn/+MLFZjWnFCV0yHqhP/PhDr
   cgxCCyRWRmDYgG/C9DJdpAZi2AlRzRCzNiSQelk/Uv93HnuDOUK2mugwr
   g==;
X-CSE-ConnectionGUID: cs6J3VtYT5ubjYhyzXr+Qw==
X-CSE-MsgGUID: wimGObGAQwCc37jV252Heg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87875489"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87875489"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:54:26 -0700
X-CSE-ConnectionGUID: X3YIFYjxRx+x1MYaqFFoEA==
X-CSE-MsgGUID: xuRn93uwS1ONqGmFXdI6sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232090844"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2026 20:54:24 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xWA-0000000003y-0RKz;
	Tue, 07 Apr 2026 03:54:22 +0000
Date: Tue, 07 Apr 2026 11:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, Corey Minyard <corey@minyard.net>
Subject: [cminyard-ipmi:for-next 6/6] ld.lld: error: undefined
 symbol: kunit_kmalloc_array
Message-ID: <202604041301.EnMIguzd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cminyard/linux-ipmi for-next
head:   d4464694f2a409fadbe17a70202242ff6b72ee30
commit: d4464694f2a409fadbe17a70202242ff6b72ee30 [6/6] ipmi: ssif_bmc: add unit test for state machine
config: i386-randconfig-051-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041301.EnMIguzd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041301.EnMIguzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041301.EnMIguzd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kunit_kmalloc_array
   >>> referenced by test.h:501 (include/kunit/test.h:501)
   >>>               drivers/char/ipmi/ssif_bmc.o:(ssif_bmc_test_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: kunit_binary_assert_format
   >>> referenced by ssif_bmc.c:957 (drivers/char/ipmi/ssif_bmc.c:957)
   >>>               drivers/char/ipmi/ssif_bmc.o:(ssif_bmc_test_singlepart_req) in archive vmlinux.a
   >>> referenced by ssif_bmc.c:960 (drivers/char/ipmi/ssif_bmc.c:960)
   >>>               drivers/char/ipmi/ssif_bmc.o:(ssif_bmc_test_singlepart_req) in archive vmlinux.a
   >>> referenced by ssif_bmc.c:964 (drivers/char/ipmi/ssif_bmc.c:964)
   >>>               drivers/char/ipmi/ssif_bmc.o:(ssif_bmc_test_singlepart_req) in archive vmlinux.a
   >>> referenced 71 more times
--
>> ld.lld: error: undefined symbol: __kunit_do_failed_assertion
   >>> referenced by ssif_bmc.c:957 (drivers/char/ipmi/ssif_bmc.c:957)
   >>>               drivers/char/ipmi/ssif_bmc.o:(ssif_bmc_test_singlepart_req) in archive vmlinux.a
   >>> referenced by ssif_bmc.c:960 (drivers/char/ipmi/ssif_bmc.c:960)
   >>>               drivers/char/ipmi/ssif_bmc.o:(ssif_bmc_test_singlepart_req) in archive vmlinux.a
   >>> referenced by ssif_bmc.c:961 (drivers/char/ipmi/ssif_bmc.c:961)
   >>>               drivers/char/ipmi/ssif_bmc.o:(ssif_bmc_test_singlepart_req) in archive vmlinux.a
   >>> referenced 87 more times
--
>> ld.lld: error: undefined symbol: kunit_unary_assert_format
   >>> referenced by ssif_bmc.c:961 (drivers/char/ipmi/ssif_bmc.c:961)
   >>>               drivers/char/ipmi/ssif_bmc.o:(ssif_bmc_test_singlepart_req) in archive vmlinux.a
   >>> referenced by ssif_bmc.c:962 (drivers/char/ipmi/ssif_bmc.c:962)
   >>>               drivers/char/ipmi/ssif_bmc.o:(ssif_bmc_test_singlepart_req) in archive vmlinux.a
   >>> referenced by ssif_bmc.c:963 (drivers/char/ipmi/ssif_bmc.c:963)
   >>>               drivers/char/ipmi/ssif_bmc.o:(ssif_bmc_test_singlepart_req) in archive vmlinux.a
   >>> referenced 13 more times
--
>> ld.lld: error: undefined symbol: __kunit_abort
   >>> referenced by ssif_bmc.c:975 (drivers/char/ipmi/ssif_bmc.c:975)
   >>>               drivers/char/ipmi/ssif_bmc.o:(ssif_bmc_test_restart_write_without_stop) in archive vmlinux.a
   >>> referenced by ssif_bmc.c:978 (drivers/char/ipmi/ssif_bmc.c:978)
   >>>               drivers/char/ipmi/ssif_bmc.o:(ssif_bmc_test_restart_write_without_stop) in archive vmlinux.a
   >>> referenced by ssif_bmc.c:981 (drivers/char/ipmi/ssif_bmc.c:981)
   >>>               drivers/char/ipmi/ssif_bmc.o:(ssif_bmc_test_restart_write_without_stop) in archive vmlinux.a
   >>> referenced 19 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
