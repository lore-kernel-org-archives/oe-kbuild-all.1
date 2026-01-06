Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3282D2EF67A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 21:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767733866; cv=none; b=fKDCNMX4Yw8O38sWe6ev/5pxq27OqV4ENsh0sACxmNLxohYtNoOAm9L2RKdccEELPYRDsdg72OIHQG6gRHUL46HYZUVW4kjrlih8E9sBGvRmjLmeF65HZpvzXzBvnYvIEnbu14KDHS09f2tnjMMhfSiSNjUmeflHMv52WOP3Jw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767733866; c=relaxed/simple;
	bh=ek/IF4CembdfwXlJ6HkLMXVR++XsKVUGF9GBMBx95yo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OaAvCEvNwYvye9HRVIBrrvkusrxV8pOnWElL7kcHEozQ8AT0CeSP/se6v6HQ2yvWOfRMxjH9jF3cK/fWLwbIEj4TXmcAtT81ZGrxx06C6lLfDBquU9a3w/VWRQU4iopkyCpOe1el+K71KaiVyfA8Jtf12e3vz+D+Quk/kjkQ6ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lb3I+pZR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lb3I+pZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767733864; x=1799269864;
  h=date:from:to:cc:subject:message-id;
  bh=ek/IF4CembdfwXlJ6HkLMXVR++XsKVUGF9GBMBx95yo=;
  b=lb3I+pZRzGhOd+vWHqE34W05Yz04sYtXmGydeBrfAOoNR0cfX3P6dYfG
   /jBmZqEUaLiGTpMJD1pA7KryR9AOn2s32/7zKYHfSKK4QeDzjvCwZyKqH
   oQJ0/mVS44jatYpKLCQ+PjVIldQwDl1bJI/brOlK+Zw2V/zqDofIC3xVC
   Cb1XklhapaH910oaylvmW5BGDW1yZF53J/tgjNqBYT1rNeFNVwLK10deb
   XbHa9+bXK5FoVdsD/uxVn7zynDrHBu49hpYaqvlkmTQV6hW/fqtVxkXVo
   I9sDIuVd5RhlRxHZq5MQAP2afCL4D7gHzyL/0/opKpDgpsxNSIYbs4NW4
   A==;
X-CSE-ConnectionGUID: 6I8LnKUuTsSUOP9RuXMGEQ==
X-CSE-MsgGUID: wIlShFMXSYqf/ThbDzntVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69151328"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69151328"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 13:11:02 -0800
X-CSE-ConnectionGUID: ZFsoATXERbmbO28GT4X4cA==
X-CSE-MsgGUID: yoPjy9GeQ9OUBjxAO6Nwdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206898988"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Jan 2026 13:11:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdEKR-000000003EH-0vxX;
	Tue, 06 Jan 2026 21:10:59 +0000
Date: Wed, 07 Jan 2026 05:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_mon_kunit 26/29] ld.lld: error: undefined
 symbol: __kunit_activate_static_stub
Message-ID: <202601070523.tBfJ7bu4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_mon_kunit
head:   aa87c6b5e8020a853fbc2444ded06a93a7fc1493
commit: 3ee745d478d498ac635a5b08ec641323ddf97615 [26/29] rv: Add KUnit tests for some DA/HA monitors
config: x86_64-randconfig-073-20260106 (https://download.01.org/0day-ci/archive/20260107/202601070523.tBfJ7bu4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601070523.tBfJ7bu4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601070523.tBfJ7bu4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __kunit_activate_static_stub
   >>> referenced by rv_monitors_test.c:41 (kernel/trace/rv/rv_monitors_test.c:41)
   >>>               kernel/trace/rv/rv_monitors_test.o:(rv_trigger_test_init) in archive vmlinux.a
   >>> referenced by rv_monitors_test.c:42 (kernel/trace/rv/rv_monitors_test.c:42)
   >>>               kernel/trace/rv/rv_monitors_test.o:(rv_trigger_test_init) in archive vmlinux.a
   >>> referenced by rv_monitors_test.c:44 (kernel/trace/rv/rv_monitors_test.c:44)
   >>>               kernel/trace/rv/rv_monitors_test.o:(rv_trigger_test_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: kunit_try_catch_throw
   >>> referenced by rv_monitors_test.h:31 (kernel/trace/rv/rv_monitors_test.h:31)
   >>>               kernel/trace/rv/rv_monitors_test.o:(rv_test_sco) in archive vmlinux.a
   >>> referenced by rv_monitors_test.h:40 (kernel/trace/rv/rv_monitors_test.h:40)
   >>>               kernel/trace/rv/rv_monitors_test.o:(rv_test_sssw) in archive vmlinux.a
   >>> referenced by rv_monitors_test.h:49 (kernel/trace/rv/rv_monitors_test.h:49)
   >>>               kernel/trace/rv/rv_monitors_test.o:(rv_test_sts) in archive vmlinux.a
   >>> referenced 2 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
