Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200CE268C40
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 02:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761706391; cv=none; b=M4/mv/m+CYxfDcAvBT9cdCkLP9Pa5f6IItnswKC4ChHWIBO+0tXi1Rd7p9KZxgEF1x0adDg5I+pItaYdA7JiCb+wwP3pqYDEuzjImziAUq/1ycvK7eiUz2yTdOgqtlpbxIyuFWCHFjhuVywmZkT8EZp/9VcRRzjSiSJbgixTwlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761706391; c=relaxed/simple;
	bh=Owbl1Cjjh/0Y5iOYyzu1Gyoiq9FQssYdXUqEs1dS7VI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FfKK7P9CsIY7M6sD1LOYk/SXYNBU473ZvmUI6pukIqif/zlh6phTLSV3GFdzPMyfg+SBn49E113d6YGR5D0vRApKxkRSHr/FyfIxszSINpYMTnS7zFF3ydSafCxd3A/T+PAaXhW++MHLWJKABGrxBcTjq201IQQRQE0JL1ipEjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tq+fuKpG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tq+fuKpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761706390; x=1793242390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Owbl1Cjjh/0Y5iOYyzu1Gyoiq9FQssYdXUqEs1dS7VI=;
  b=Tq+fuKpG47RMhFAhdTqUtWS+jOt6hhfCUze7/5rRxeiH7iZvzzD8OfZ0
   D7JcsZOGa7VadLzCS6l+Mj4O4wStMrv9JgUYCmO2MB+znp8pRNxn12feR
   F4rnqgloD5jkRJvM/6lD6C703Hb63CWow5/NnM3Az3AG088Ttv5rUK624
   AgkCCSejMRYdwBpHZI5i+sQPc7MsSdVt9rE5OHabIGDKQkx3+iYgO51m6
   0khjs4l9rvQXdIppJRPMmiuzdw909ui9cr7PBZN9UaVRCaDZdIlX8oFHm
   pU9EjVVrq9rHjgSuiNnZrKv+ovIsMcuoOKbubCtcXMLpm0gA/I0xBSGRG
   w==;
X-CSE-ConnectionGUID: S6cgxVR7R7eOQ0JLy+Sw5g==
X-CSE-MsgGUID: exBWDRjJRIedJtsWSKo/cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63727015"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="63727015"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 19:53:09 -0700
X-CSE-ConnectionGUID: z9nHqEXzTjyGT5queqzRSA==
X-CSE-MsgGUID: zstFJhtpSnG7UwVcxn/bvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="185162792"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 19:53:09 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDwJ8-000000000rA-1Tfq;
	Wed, 29 Oct 2025 02:53:06 +0000
Date: Wed, 29 Oct 2025 03:52:43 +0100
From: kernel test robot <lkp@intel.com>
To: shanaya-Gupta <shanaya-Gupta@users.noreply.github.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1197 1/1] Kconfig:34: syntax error
Message-ID: <202510290329.FbMptn09-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1197
head:   7773d8bc0eb57a9c6227f90a2792a72c65d08e36
commit: 7773d8bc0eb57a9c6227f90a2792a72c65d08e36 [1/1] fix: Resolve #1196 - Apply PCI rewording suggestions
config: x86_64-rhel-9.4-rust (attached as .config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290329.FbMptn09-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290329.FbMptn09-lkp@intel.com/

All errors (new ones prefixed by >>):

   Kconfig:34:warning: no new line at end of file
>> Kconfig:34: syntax error
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1
   make[2]: *** [Makefile:742: oldconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
   Kconfig:34:warning: no new line at end of file
>> Kconfig:34: syntax error
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1
   make[2]: *** [Makefile:742: olddefconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +34 Kconfig

6f377873cb2390 David Wei          2025-02-14  33  
0d2cdc35e805eb Geert Uytterhoeven 2025-02-19 @34  source "io_uring/Kconfig"

:::::: The code at line 34 was first introduced by commit
:::::: 0d2cdc35e805eb50f4a33b7287995ef590f1b916 io_uring: Rename KConfig to Kconfig

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
