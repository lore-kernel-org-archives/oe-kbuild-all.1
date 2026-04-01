Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D5C32D42B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 06:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025460; cv=none; b=YWh33F/uAu1somw/2jtAFBkdFfLGS/1VZuGdys+GZQZ88lPiCUDWydKD+IA/Z95hjoSBAOf5iCSqON84k8yxdj0LUwwNedM46ZbTR4XhA5bUUKJmhmZt22oSP+OMX1fYw1umAoNDdsFo6lSrLRQAIGfebDa2aSY8M5VcJrUm87c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025460; c=relaxed/simple;
	bh=9smWTuGc/lIU1FxPku5mK3O+5C+i/4Bfa4qXPGdS86A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gtiJQN+XTH3eRnBqAnyzAB3P2P4SgIm5kz7j562gUTqEwm/liCXhhXkEpzbLAr+4fP1cewE/AIzs1x7vffBi3Aj5ZDatUAFR9WyzkJ8UmG8LyJmyiVnFlb+ef16i2LyqnX5Q5bzs/Rcd2rvxoMm+RxR0/JupY1H0UnR4R+JGL4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Owmfcwjx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Owmfcwjx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775025460; x=1806561460;
  h=date:from:to:cc:subject:message-id;
  bh=9smWTuGc/lIU1FxPku5mK3O+5C+i/4Bfa4qXPGdS86A=;
  b=OwmfcwjxG5/xsaUyU94GD3qOp5dKmUMqt81VJRv2CNjwXc4HFh1Keha9
   29wLCBwX7Cpwd+0M82uGKT/P40qrqEL9H1UkbfHnJtU0OusQmj390kutB
   U6UqDFfyya0/fuir+cKVKmh8L1yh/N3eoURnfOiFlNHKYVm7E9iEmbb+w
   3YHw/CBQlPqWykxDw0DtbMhS/xaVwjz7MtoOFrEcSLczOk+/8G9QUssiB
   bDbiplmw6wNlP4NYAQN1SylsQJn+YipE/BnNeGAQQFfE3dg4LBzzvxJIC
   WBCOuS0LqcIxkXSK+zI9/UpHwMsNPA2QHOJ+Oh7KUFWcTJILcqwsV2clf
   g==;
X-CSE-ConnectionGUID: IgZuwxK5SuyK88wEqt6jdg==
X-CSE-MsgGUID: 547w4elnScOSTHBOzvKDVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75939339"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75939339"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:37:39 -0700
X-CSE-ConnectionGUID: TEsr8+IdQeOiY4KoNaGRbQ==
X-CSE-MsgGUID: xZWKlIqJTvKiNab31/1WZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="221733299"
Received: from lkp-server01.sh.intel.com (HELO 699e4e600a11) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Mar 2026 23:37:36 -0700
Received: from kbuild by 699e4e600a11 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7pCo-0000000003V-09ll;
	Wed, 01 Apr 2026 06:37:34 +0000
Date: Wed, 01 Apr 2026 14:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 __do_trace_initcall_level+0x38 (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <202604011453.KDrYULQs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9147566d801602c9e7fc7f85e989735735bf38ba
commit: a46023d5616ed3ed781e56ca93400eb9490e3646 tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast
date:   9 weeks ago
config: xtensa-randconfig-r112-20260331 (https://download.01.org/0day-ci/archive/20260401/202604011453.KDrYULQs-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011453.KDrYULQs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011453.KDrYULQs-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: __do_trace_initcall_level+0x38 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
