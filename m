Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82407343D66
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591303; cv=none; b=j/mu0E61jyfSQ9WAL6MVaYi31BicZFZNEYcRuwyF2j7+2oIZiCYiY80JedVSWhbSRJukbCEnyJRMV5lAm2DHzkhr5tApZLg2i1SPn7m9w3uUA6gPjYwQ1q/GBRUtU82b17drUk9TarpZW0snXhCulVnD0QSu76XwDRLK8I6+oNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591303; c=relaxed/simple;
	bh=WU1PA/7xrYOPqZDJ88P4qR9CdKh8lHRA5NLlEgzx6jY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UZ/nR1MnSHSL9gbX4NSmZwZ7wgNfFKeqZ+HseFooQ7hDsit7gK/m0FG7x/zYIh3UT/TUfvM06rLXDrE5H0zwc/muEMuAGOspUWME+2RZbrzL54BRSAK+d36LNGGbO+Xde63iH7Y51byVf40DGgUQGCB1p/YYQaGLdMxVsxy/MOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvdB/AKm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvdB/AKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778591302; x=1810127302;
  h=date:from:to:cc:subject:message-id;
  bh=WU1PA/7xrYOPqZDJ88P4qR9CdKh8lHRA5NLlEgzx6jY=;
  b=JvdB/AKmslpX0omFu/G/r5TE9IOAySJFcajsusd2klYdIZne2yK3WQcQ
   Yh35PP8x8MXsahuVSc11wKmNrFUSKhK0QEZC1qC0DTXV7tMT8rGKam2K5
   aNhcj6XeJ23jPjKm7xo7RzHqgzCvCG63AsZFkBGSMw53rsWqsDjVuZUQ9
   ew1j0RW2Ncry++wtS/wzsMNk4rrw8k1PPU8vzkO64Zo8OG/ehdFZ71dWY
   kyHspuDieAE4HyGXFQSw+ZT1F1Y4xJ59cC1gBOy74/Uw5TAs/EJVDYSQX
   CVjGnqItU9dlauadP08+X6clF2cHJ6PE5IYAbuj3+w05e9DYjSuA1VMV6
   A==;
X-CSE-ConnectionGUID: t8uVycuPT02N5iBiDJAxGA==
X-CSE-MsgGUID: PLzI4tt7QXmtybe36kmbjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90196869"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="90196869"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 06:08:22 -0700
X-CSE-ConnectionGUID: WMokjpDXSjKVFcWvJZPEzA==
X-CSE-MsgGUID: 06pJO8G+SiyZZkF7LVFZ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="236780163"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 May 2026 06:08:20 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMmqP-000000002B9-3q2A;
	Tue, 12 May 2026 13:08:17 +0000
Date: Tue, 12 May 2026 21:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_tests 11/14] Warning:
 kernel/trace/rv/rv_monitors_test.c:61 function parameter 'suite' not
 described in 'rv_set_testing'
Message-ID: <202605122145.ZWoTGX6B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gabriele,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_tests
head:   2c56034debf1af6ff1539eaf2f3eb6eaf7316944
commit: b900de5c4f82af8039a5a292c0d2a0a70bb97938 [11/14] rv: Add KUnit tests for some DA/HA monitors
config: parisc-randconfig-002-20260512 (https://download.01.org/0day-ci/archive/20260512/202605122145.ZWoTGX6B-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605122145.ZWoTGX6B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605122145.ZWoTGX6B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/trace/rv/rv_monitors_test.c:61 function parameter 'suite' not described in 'rv_set_testing'
>> Warning: kernel/trace/rv/rv_monitors_test.c:80 function parameter 'suite' not described in 'rv_clear_testing'
>> Warning: kernel/trace/rv/rv_monitors_test.c:61 function parameter 'suite' not described in 'rv_set_testing'
>> Warning: kernel/trace/rv/rv_monitors_test.c:80 function parameter 'suite' not described in 'rv_clear_testing'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
