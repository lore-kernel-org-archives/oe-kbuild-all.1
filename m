Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FE3849C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733775607; cv=none; b=c1J8IM6EWqQw8rfeHcEF0Cg9gFdy+r2erHrzi2ZjBFDc8lklPlD68KpsNLCBb5zvRZNP8aE8vb3bqdEuBqEavTTFemxDb4K1E3Ptgf3C0Mw05JUeMkbECe9kwkJ5lPOKoc+KpkqKIeC43nvGRuorZLCUl7OKphl9XiSpTIPdPlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733775607; c=relaxed/simple;
	bh=lKj2lAxWHEYfm+WmPof+yNB4lQ6yUyKU64G4f9nZs9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ieWIl3lBOPp4llJycNC4SIKxz9wHDj45LA6vhcZtohgq3xbeW3uDlihqJkdIIPb0QOIlLqM5fe2yVrG/YDGF2y5ambAQhuvs8JhxRJ7CKhkVgNkcdIQ4j3AuA6Mre/ZD3QQvF+xHUPZPqCOgH1sxBsjVOEH1aQihqfd5hHCMonE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loiiGQtH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loiiGQtH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733775605; x=1765311605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lKj2lAxWHEYfm+WmPof+yNB4lQ6yUyKU64G4f9nZs9g=;
  b=loiiGQtHA5fxPAP/Awy5n3Mrfr384t8bZncdHnBoO0IyJYdwosiR+6H4
   g0w3U7XjyA/gW38wH0pUC6SvqrFaGTv/mwh22U9IccnHIBOp7OFfaXrUT
   ueIGxKawjSX1W0ljXoS8f1QB3k+MlJ4lnn9RHRlGs2zm43kvSUAspCuB8
   xtD5/7jAnqU/50+Fsm0prb7tKfXHxce0Up2COuLVJdKNWlYuzvsATFylM
   22BTNUmqtbBdgHk54FmrAIYK/oHirXg0WOgB4pL31ePrs77u1rmEflMli
   c7ws7UMTfIX/AX+LCBizOnDoK96vccDX75eXVjESqkWB5TirfViTn9rIC
   g==;
X-CSE-ConnectionGUID: RTUBxsq6QVaE+2p28Weidw==
X-CSE-MsgGUID: xuaVaRTVTsWKK2f/S6/Nsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34219128"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34219128"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 12:20:04 -0800
X-CSE-ConnectionGUID: qNCPF9xrS3SWL3bWW4Fo0w==
X-CSE-MsgGUID: wTmXyvhPRduMIiicc01SlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95665181"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Dec 2024 12:20:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKkEb-0004mt-0f;
	Mon, 09 Dec 2024 20:20:01 +0000
Date: Tue, 10 Dec 2024 04:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/ptp/tkntp 19/26] kernel/time/timekeeping.c:1476:
 warning: Function parameter or struct member 'tkd' not described in
 '__timekeeping_inject_offset'
Message-ID: <202412100440.ALr3ltbu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/ptp/tkntp
head:   184d5014d09b27045a7e6a1e9a44122387149e59
commit: 40e2f9c26033f9859246cfbc7bdbefe981c6ee8e [19/26] timekeeping: Make timekeeping_inject_offset() reusable
config: i386-buildonly-randconfig-001-20241210 (https://download.01.org/0day-ci/archive/20241210/202412100440.ALr3ltbu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100440.ALr3ltbu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100440.ALr3ltbu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timekeeping.c:1476: warning: Function parameter or struct member 'tkd' not described in '__timekeeping_inject_offset'


vim +1476 kernel/time/timekeeping.c

8524070b7982d76 John Stultz        2007-05-08  1468  
c528f7c6c208f1f John Stultz        2011-02-01  1469  /**
662df02dfb947e7 Thomas Gleixner    2024-11-09  1470   * __timekeeping_inject_offset - Adds or subtracts from the current time.
6e5a91901c2dff3 Alex Shi           2020-11-13  1471   * @ts:		Pointer to the timespec variable containing the offset
c528f7c6c208f1f John Stultz        2011-02-01  1472   *
c528f7c6c208f1f John Stultz        2011-02-01  1473   * Adds or subtracts an offset value from the current time.
c528f7c6c208f1f John Stultz        2011-02-01  1474   */
40e2f9c26033f98 Thomas Gleixner    2024-08-04  1475  static int __timekeeping_inject_offset(struct tk_data *tkd, const struct timespec64 *ts)
c528f7c6c208f1f John Stultz        2011-02-01 @1476  {
40e2f9c26033f98 Thomas Gleixner    2024-08-04  1477  	struct timekeeper *tks = &tkd->shadow_timekeeper;
662df02dfb947e7 Thomas Gleixner    2024-11-09  1478  	struct timespec64 tmp;
662df02dfb947e7 Thomas Gleixner    2024-11-09  1479  
1572fa03784831b Arnd Bergmann      2017-10-19  1480  	if (ts->tv_nsec < 0 || ts->tv_nsec >= NSEC_PER_SEC)
c528f7c6c208f1f John Stultz        2011-02-01  1481  		return -EINVAL;
c528f7c6c208f1f John Stultz        2011-02-01  1482  
82214756d35f480 Anna-Maria Behnsen 2024-10-09  1483  	timekeeping_forward_now(tks);
c528f7c6c208f1f John Stultz        2011-02-01  1484  
4e8b14526ca7fb0 John Stultz        2012-08-08  1485  	/* Make sure the proposed value is valid */
82214756d35f480 Anna-Maria Behnsen 2024-10-09  1486  	tmp = timespec64_add(tk_xtime(tks), *ts);
82214756d35f480 Anna-Maria Behnsen 2024-10-09  1487  	if (timespec64_compare(&tks->wall_to_monotonic, ts) > 0 ||
7a8e61f84786390 Thomas Gleixner    2019-03-23  1488  	    !timespec64_valid_settod(&tmp)) {
40e2f9c26033f98 Thomas Gleixner    2024-08-04  1489  		timekeeping_restore_shadow(tkd);
82214756d35f480 Anna-Maria Behnsen 2024-10-09  1490  		return -EINVAL;
4e8b14526ca7fb0 John Stultz        2012-08-08  1491  	}
1e75fa8be9fb61e John Stultz        2012-07-13  1492  
82214756d35f480 Anna-Maria Behnsen 2024-10-09  1493  	tk_xtime_add(tks, ts);
82214756d35f480 Anna-Maria Behnsen 2024-10-09  1494  	tk_set_wall_to_mono(tks, timespec64_sub(tks->wall_to_monotonic, *ts));
40e2f9c26033f98 Thomas Gleixner    2024-08-04  1495  	timekeeping_update_from_shadow(tkd, TK_UPDATE_ALL);
662df02dfb947e7 Thomas Gleixner    2024-11-09  1496  	return 0;
82214756d35f480 Anna-Maria Behnsen 2024-10-09  1497  }
c528f7c6c208f1f John Stultz        2011-02-01  1498  

:::::: The code at line 1476 was first introduced by commit
:::::: c528f7c6c208f1fae6b4025957173dec045e5f21 time: Introduce timekeeping_inject_offset

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
