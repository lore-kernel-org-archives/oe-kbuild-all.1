Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1DA3242D2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 22:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770156717; cv=none; b=bXYPgki27xGpJBneG8q3k6vwsKx+AoK9GiESP1+CXswT9RBjWxEfcF21lfqouyq+gxFDIZktSSGezgLUbZK+GVdtWR9hbwbuGswLesDOlzWSpsuxwYMtUy5pIyiWIcwetTqwmWFA7du2cspyl6cWfYXlNLmd0+sfA2xI1d5T4sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770156717; c=relaxed/simple;
	bh=nyTXJD9m2dzjQ8RSTzIkyAOotwVjMEIZXaTRh3E3qkk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tHtD3o+/ICOUB+GOtoUsiAmuW1TbDjpzS3272rb3xw+wk2HnVFVNKzFJk/noW+hbSjglQ6ky/WnSk0T01QQF1VH/YoTAuPJ8teVJYbk7cAfOZWYAHx0eTELQo8uHQtIzp12+70ZYo9DuoLdhD/Z0H+Ybk/Z7EO5lXNE8fHwKsKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxGp/Jtp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxGp/Jtp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770156716; x=1801692716;
  h=date:from:to:cc:subject:message-id;
  bh=nyTXJD9m2dzjQ8RSTzIkyAOotwVjMEIZXaTRh3E3qkk=;
  b=NxGp/JtpbO2PW19bxiEfS2F4qjLsKB05qhPPPR+qmG8035hBhr0NOUS+
   YfrfU6Cs6W8U58rC2EmJHeQJdF7L6IIDQINoKp1k9x7tcvlE8p3zmY1So
   mGjFcw5TVQUoGHVXh+U71SEWhdqpnzStpWeBNhomPReNKpQKppOlFUk1E
   itQlIqJJfkRh18PgI9vY1zBrdf4wY7ExeHwebmJfFxylw9CHqaNMQdVae
   RYONO9IaHqhy+wap4Ds7F9FRTncr4oJBuZh1hdBAAOZ42lxkAT78QJg7Y
   fyHwBuqWPEAmqPh1MLrI5fgR+QwONaErwp4ev6zYgwozddSuQZrdmp2mQ
   Q==;
X-CSE-ConnectionGUID: 2aY6RZ0qR2+SDSVhuEEqaw==
X-CSE-MsgGUID: 9wwHpR2GSUas6bLvr7Z75w==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82079875"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="82079875"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 14:11:55 -0800
X-CSE-ConnectionGUID: AB73R/jlSBKQ0L+RmDNpuw==
X-CSE-MsgGUID: AM226+iNQOykd9haG9wZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="210013125"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 Feb 2026 14:11:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnOcg-000000003Tl-42Hq;
	Tue, 03 Feb 2026 22:11:50 +0000
Date: Tue, 03 Feb 2026 23:11:32 +0100
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_dbtr_v2 62/62]
 breakpoint_test_riscv.c:126:1: warning: non-void function does not return a
 value in all control paths
Message-ID: <202602032303.tUShEdfv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v2
head:   922a4bdf735544d2054881e7a06eefbeaf243aac
commit: 922a4bdf735544d2054881e7a06eefbeaf243aac [62/62] riscv: Add breakpoint and watchpoint test for riscv
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260203/202602032303.tUShEdfv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602032303.tUShEdfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602032303.tUShEdfv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> breakpoint_test_riscv.c:126:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     126 | }
         | ^
   breakpoint_test_riscv.c:151:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     151 | }
         | ^
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
