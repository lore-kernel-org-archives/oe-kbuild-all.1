Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7371D5AB9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 03:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740021632; cv=none; b=B8eoCf1UhOxkLPFIR94XIsW3E/YQVZfIHKxRsTiqPzT61czVpoZRHq6kYw9usxv1OHHNpGm79JMP1PEuSezdY+nQVfSJ1cdQ3aBaooYU3XFUnxk06/S2RsHojnT3TdxRlk51h9zmPZ7RwhiS1gfXyif+1x3MEIYdzXQQBXcaARQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740021632; c=relaxed/simple;
	bh=Cd2FfM7qCMjAmPWEDAbbxB5luJxnAKlGopwtVjqAsjk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FmW/Yg6D80OkEnw2FCTqA8/xcy/NiTZB9KD8KbZcJx4Itlmrfp5guU6yG5tD/KnwbAaoMDlzUgcGVouiM+jRyqiyz15INRYQtFTall7Xeujal4XEb/zHiOEVvrjDJNcd2MmbQTJp2jXdTnHU0d8jHcgEjaDeFOIN8sZ/9A/7X14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zlbtxep0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zlbtxep0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740021630; x=1771557630;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Cd2FfM7qCMjAmPWEDAbbxB5luJxnAKlGopwtVjqAsjk=;
  b=Zlbtxep0gDgjajyG1fLmOSBHwsR2OjhhRbPTH2XoPicnIMDZ7ACq4WDI
   YpTR01QAFBxJ49FDHYx6CazwUXslXWxNW9LewuykW8Q/Vi9F5ytWzxQ3Z
   6vF1O8DNkbXAZq21AKM6LMyWAKkzLP1IqWHSj/qqcM8sTD5ylrupZceF/
   eFTQc5YNM6ySalE9IEIkWxFynUraCxOAAm7vx7vmbKY22QQj1AUPVy9bq
   cWQapu4eJ51CSUQhGKXy2vb7WXXT5D0g2/hYvO81Ax2SnZGFR7pxmYB/T
   ac+KX4Rt3Km6qO/5WnhgGaUB8g2abUthHgRjVpHLjTSM3QI7OTlok3uzS
   Q==;
X-CSE-ConnectionGUID: akmke2KgT8Od2cMjVnAnSQ==
X-CSE-MsgGUID: yAb3yaYdRYOK6YvbpOYkQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51767511"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="51767511"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 19:20:30 -0800
X-CSE-ConnectionGUID: cYu8Xn9lSO6hPzFlP7vX1w==
X-CSE-MsgGUID: JkI73AXgSlyIyxR7gpSkMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="115583436"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 19 Feb 2025 19:20:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkx6w-0003od-38
	for oe-kbuild-all@lists.linux.dev;
	Thu, 20 Feb 2025 03:20:26 +0000
Date: Thu, 20 Feb 2025 11:20:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] fs/xfs/xfs_dquot_item.c:153:20: warning:
 variable 'dqp' set but not used
Message-ID: <202502201138.UVTIOQid-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 773a1c5baad243ad30b41700111f0c499f6a259d [1/1] xfs: Properly retry failed dquot items in case of error during buffer writeback
config: sparc-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250220/202502201138.UVTIOQid-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502201138.UVTIOQid-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502201138.UVTIOQid-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/xfs/xfs_dquot_item.c: In function 'xfs_dquot_item_error':
>> fs/xfs/xfs_dquot_item.c:153:20: warning: variable 'dqp' set but not used [-Wunused-but-set-variable]
     struct xfs_dquot *dqp;
                       ^~~
--
   arch/sparc/kernel/head_32.o: in function `current_pc':
>> (.head.text+0x2040): relocation truncated to fit: R_SPARC_WDISP22 against `.init.text'
   arch/sparc/kernel/head_32.o: in function `halt_notsup':
   (.head.text+0x2100): relocation truncated to fit: R_SPARC_WDISP22 against `.init.text'
   arch/sparc/kernel/process_32.o:(.fixup+0x4): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/process_32.o:(.fixup+0xc): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x0): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x8): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x10): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x18): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x20): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x28): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x30): additional relocation overflows omitted from the output


vim +/dqp +153 fs/xfs/xfs_dquot_item.c

   139	
   140	/*
   141	 * Callback used to mark a buffer with XFS_LI_FAILED when items in the buffer
   142	 * have been failed during writeback
   143	 *
   144	 * this informs the AIL that the dquot is already flush locked on the next push,
   145	 * and acquires a hold on the buffer to ensure that it isn't reclaimed before
   146	 * dirty data makes it to disk.
   147	 */
   148	STATIC void
   149	xfs_dquot_item_error(
   150		struct xfs_log_item	*lip,
   151		struct xfs_buf		*bp)
   152	{
 > 153		struct xfs_dquot	*dqp;
   154	
   155		dqp = DQUOT_ITEM(lip)->qli_dquot;
   156		ASSERT(!completion_done(&dqp->q_flush));
   157		xfs_set_li_failed(lip, bp);
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
