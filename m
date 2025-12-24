Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9549A32D0C9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766561574; cv=none; b=F5lvG+JhxbWqNXVvTPRhem+txyTbWu8QQuXHSKpzf5eg+5Lt0pQn22xuxEPIkza03gLeZZZc26z5NARZkmrH/ww96nXHA92AiFNMZh/RU5T513bkP00YNcUL4qbl8xs3DlMpq7rbsqWWDS1xQDGpp0c2EVEkPzMjn8OT9igv+NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766561574; c=relaxed/simple;
	bh=e5zKvCRmiKFKGGpgr3Rm0+vBTS2dihD2bRWzMZ5weG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=URnAz/dW0REo5vnv0uYX223k0cpcpErGpcV8JhkeI5+5pJMrba3652D+8dPx+pl/0zb4+Itaw+PJ5JkAsG0e2kC/DJhJ6t0HvTyKkxOj/5hnsCi6EDJfGij7c1fOUjQUqksFBeAg0IxNvJqpBPGVGMO9f2tnSlQT5hVrOzTqV2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4i630Uu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4i630Uu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766561573; x=1798097573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e5zKvCRmiKFKGGpgr3Rm0+vBTS2dihD2bRWzMZ5weG8=;
  b=m4i630Uu24hklRpkPEG2fO+t07ZaHincZ3I3iWW5T6UYQMxx2Xk1vh98
   ilE8YL1vo68M+tVjhTD6kSU2cGrlNxElK7MUgkfH+/NvMjmOLFwy49EiO
   8cMU83wU26JH6deY5zYUjmrY36gCYxr5/kj2v4QUkzkrSPASct0s2Vi20
   vdFvcnUEVzTx7hDPBIkJth97zbc64qIFIoGok0vFPcl9Szgp8dXYz8afA
   Rfr3I/Cdj8o6Pj61FCZh4ehB4u7EZiYuNbjiu1ZOe83/K90yWonSlkJy9
   WB/xAx4Mbd8/v/nqCmAaub+t8KaLP9cZyQRJv8uApAGopbf54eFTktiQp
   g==;
X-CSE-ConnectionGUID: tILi6Jl9SdyhYCvBZIfpIQ==
X-CSE-MsgGUID: I2BHderXQIiHYmrwulGisg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="85986951"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="85986951"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 23:32:52 -0800
X-CSE-ConnectionGUID: t9ml+a5hR0anBqkamrPwmQ==
X-CSE-MsgGUID: Kpu6J8JTTQeMeNo506kgPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="204102815"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 23 Dec 2025 23:32:51 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYJMW-000000006AE-3CLG;
	Wed, 24 Dec 2025 07:32:48 +0000
Date: Wed, 24 Dec 2025 08:32:21 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] Warning:
 drivers/dma-buf/dma-buf.c:405 function parameter 'name' not described in
 'dma_buf_set_name'
Message-ID: <202512240848.6VkmZH4a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   6832dd96d0d16d34251480faa62e76d84c661c2d
commit: 341d2ddc74eb2989062a712d7853ed359232f47d [2/2] ANDROID: dma-buf: support users to change dma_buf.name
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251224/202512240848.6VkmZH4a-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240848.6VkmZH4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240848.6VkmZH4a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma-buf/dma-buf.c:405 function parameter 'name' not described in 'dma_buf_set_name'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
