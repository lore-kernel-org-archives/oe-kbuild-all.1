Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329EA2777FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760815453; cv=none; b=sEYpJCZxgqcC1ZpbJ1Mn5DAkC9ILxrjtS/eXJg22fC5XwHunE86FGXPQ59M4sxbcrGVg1e52LU4ZUAjPvtzVt6I/dkj2CMOsamx3QlLcyvP7T/BUQXsXI0D2g7P0hbH8yGQXgIVo9616WRabhE1Z7kr+WWCEj8cADj7kIN1rAnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760815453; c=relaxed/simple;
	bh=YMEuOMrttmSCQPUycX59KwD/ISTwdAbYLH63xZzMp7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=baNzjCnoTU3vz2r5zhggVpkXsRnseEfp48YIwiK/OPYWBTPKf5u9cdz1uJz9wHb4tK7u5UG7tc9FTk8ccWcefMUB0A9pLT9ks+QpmB+qzJ7TFXPlGcpcc5UJLo+Opx7OQuQnLq5kJoXMD3E4DPJGEPiEP452VnbyEA39qCKFOn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aM4VYrH/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aM4VYrH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760815452; x=1792351452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YMEuOMrttmSCQPUycX59KwD/ISTwdAbYLH63xZzMp7o=;
  b=aM4VYrH/jr8F2K9aBip+UXJ89Yb7+b+aCj/RAAL68KHAilKSIL1nPMXj
   uOVOHZTbA4JmTtpUkOJT61XKpXbvfiVYkrvf9nN6qTBQl5uP5QRQ3+HlH
   Qqf2038KX1M/luJNWXT9cbTcakzknXbLUHFTgkqpzh30dkoMGwm6EpFBs
   wM/1nB1O8CReQbnNGZoVtExvxox2ubVBtTdn2oin62L478r78MArg3C79
   kYmgPDaTkZJsfhoSLQgDbgNXMPVPrwlafd1gXaFFG0vo9EBbytOEOdcC/
   KfC60firinzPRp+fArKsw5B4S5B5/+CflXFPxIpzjLsffr5vEk0f5kftv
   g==;
X-CSE-ConnectionGUID: TGh/DHHRR0Wumj0+BpLMeg==
X-CSE-MsgGUID: 6OscOuYySqyt3IgaSX9Pcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73280312"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="73280312"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:24:11 -0700
X-CSE-ConnectionGUID: VtO0v45xR0yGmLC5nx8ixg==
X-CSE-MsgGUID: U86TU5zPReWJRUhiesTQZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183485062"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Oct 2025 12:24:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vACXA-0008YL-1Z;
	Sat, 18 Oct 2025 19:24:08 +0000
Date: Sun, 19 Oct 2025 03:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1658/2588] error: objtool: --checksum not
 supported; install xxhash-devel and recompile
Message-ID: <202510190323.CbaGMxWj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   93f3bab4310d4ff73027cc4f87174284d4977acf
commit: 24ebfcd65a871df4555b98c49c9ed9a92f146113 [1658/2588] livepatch/klp-build: Introduce klp-build script for generating livepatch modules
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251019/202510190323.CbaGMxWj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510190323.CbaGMxWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510190323.CbaGMxWj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: objtool: --checksum not supported; install xxhash-devel and recompile
--
   drivers/input/mouse/sermouse.c: In function 'sermouse_connect':
   drivers/input/mouse/sermouse.c:240:61: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     240 |         snprintf(sermouse->phys, sizeof(sermouse->phys), "%s/input0", serio->phys);
         |                                                             ^~~~~~~
   drivers/input/mouse/sermouse.c:240:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     240 |         snprintf(sermouse->phys, sizeof(sermouse->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> error: objtool: --checksum not supported; install xxhash-devel and recompile
--
   drivers/input/mouse/vsxxxaa.c: In function 'vsxxxaa_connect':
   drivers/input/mouse/vsxxxaa.c:468:55: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     468 |         snprintf(mouse->phys, sizeof(mouse->phys), "%s/input0", serio->phys);
         |                                                       ^~~~~~~
   drivers/input/mouse/vsxxxaa.c:468:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     468 |         snprintf(mouse->phys, sizeof(mouse->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> error: objtool: --checksum not supported; install xxhash-devel and recompile
--
   sermouse.c: In function 'sermouse_connect':
   sermouse.c:240:61: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     240 |         snprintf(sermouse->phys, sizeof(sermouse->phys), "%s/input0", serio->phys);
         |                                                             ^~~~~~~
   sermouse.c:240:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     240 |         snprintf(sermouse->phys, sizeof(sermouse->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> error: objtool: --checksum not supported; install xxhash-devel and recompile
--
   vsxxxaa.c: In function 'vsxxxaa_connect':
   vsxxxaa.c:468:55: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     468 |         snprintf(mouse->phys, sizeof(mouse->phys), "%s/input0", serio->phys);
         |                                                       ^~~~~~~
   vsxxxaa.c:468:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     468 |         snprintf(mouse->phys, sizeof(mouse->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> error: objtool: --checksum not supported; install xxhash-devel and recompile

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
