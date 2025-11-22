Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E039823D7C8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 21:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763846515; cv=none; b=fX5QhGCDIxkx8gVy4PPkN9vH3XMgNI9jaiYn3keaA1ryxCt9xY1MLPd7/I2DI7yb7iDNYyTQrHV6wYPFYPyzzk9jlLWiNYAj/kr1ifsHyqxQovnr22xdT3m7aaFCDV2swF7J0406GzUARumlUesc013muY/lJAPboXYlJy4z5sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763846515; c=relaxed/simple;
	bh=2qTB9XjC9HaNK66rxpkk5XpoIuNl/sEx+f9+dbVMjYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ANLUs+WHVJkiz6UFbBekTjx8akXGYZbQXc+960c5OOjdybT23TeBSyi6cu2Dh2OJBABK/7vxyD4D8tZuEObNdODb3Rf9+Eu5NC/oUfqSmd5hn6hgd9sCx3B5JsasMvYg1MWEQmkIFYO/83ZyOH89LozPbiklb5NUtnDsk7egCtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BCipLiqZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCipLiqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763846514; x=1795382514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2qTB9XjC9HaNK66rxpkk5XpoIuNl/sEx+f9+dbVMjYE=;
  b=BCipLiqZy6HAPRwaQ2IcksV6K9mOByqK7RA+bRbwwZn5xPAPWvHWsRJU
   PkFUPLApWEjZ7KmYxmLH12j/K7ccxeZHkhGl3ZYzCfgLqcRcngB/jcSB0
   iYdgVbnuDOnwRJIwwCHF//c6or+94VK7+ITve/bHkD4jZh+zexf9056th
   08xwk7zvFA7hS1toWZSfmIMdPsxzddmAB8BpP7miKGJyIPJ+kEu3tYOkS
   ep9dj64+7IeHZzPKclt7EThl+zaVt25SznELBTfm+Qdxa5tThh4x5tFvY
   HvPeKkBQw39G5ZevdPswyGcyqr2T5mX1++WDbaq54/qTfcKDdSvendH48
   w==;
X-CSE-ConnectionGUID: JVjFy35cQTuJeCPfXZsXDA==
X-CSE-MsgGUID: 5rfCtcd9SIWmmIz9RpaptA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="68501486"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="68501486"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 13:21:54 -0800
X-CSE-ConnectionGUID: 8yZZtamKS/ixB7tS2E+kJA==
X-CSE-MsgGUID: DM0kMcOyS7OMKj6yfhUdtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="215341125"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2025 13:21:52 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMv3G-0007q7-1n;
	Sat, 22 Nov 2025 21:21:50 +0000
Date: Sun, 23 Nov 2025 05:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3306/3306] arch/arm64/kernel/xcall/xcall.c:49:24:
 warning: address of array '((struct xcall_info *)task->xinfo)->xcall_enable'
 will always evaluate to 'true'
Message-ID: <202511230550.gjk44kyv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea193ff9f080f6657caa2b5f907d5465ca3147dc
commit: fd83d0fe16f1c0a0b163480a40e424a6d3438612 [3306/3306] xcall: Rework the early exception vector of XCALL and SYNC
config: arm64-randconfig-004-20251123 (https://download.01.org/0day-ci/archive/20251123/202511230550.gjk44kyv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230550.gjk44kyv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230550.gjk44kyv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> arch/arm64/kernel/xcall/xcall.c:49:24: warning: address of array '((struct xcall_info *)task->xinfo)->xcall_enable' will always evaluate to 'true' [-Wpointer-bool-conversion]
      49 |         if (TASK_XINFO(task)->xcall_enable)
         |         ~~  ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   2 warnings generated.


vim +49 arch/arm64/kernel/xcall/xcall.c

    46	
    47	void xcall_info_switch(struct task_struct *task)
    48	{
  > 49		if (TASK_XINFO(task)->xcall_enable)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
