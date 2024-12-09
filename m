Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8375A199239
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 22:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733782998; cv=none; b=kaEjXG2hWPLCA0ErBz1ktEl5IiCQN9i9bFYA6dbhZd6L4P1i+Izibn2Zsd3z529TcNDFcBIwYAFUcoR7FNOcUzkIci+xhLpIxCtCOjcsQDWAas8b/Oo9Ete022phEbdLulTgVPhWVtZXoOLMNQ7FB2SZdTSdPENnwhqPZxnpovA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733782998; c=relaxed/simple;
	bh=ph19Qo7BwapuLQMCNzY+eHPzxYoNtk91RODTebipa94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QM+ISKUAAJjVFPUvOW5jNjsFMDZtkZO1+Y6lKDwvriXF1neuWQDN96LEeQ2gtF7P/Jn4IWTSRs+fc90kWR8XGDoomxKlr1VHWGC/zzT1P4GPlVzsbujDpKYnF+YBekoB6z2Q8K5PwPWX+OkcpIBPNhJNCmybNz5AkRsYBywYUfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uercwnmi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uercwnmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733782996; x=1765318996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ph19Qo7BwapuLQMCNzY+eHPzxYoNtk91RODTebipa94=;
  b=UercwnmieuUYQoeCfBenkI2UvXBLEsUMHwaWyX0KnMGrhdZMBjiyTQAx
   vMm3bIrdR70PWbhevGm2ANafvsdulbmCwRklS0zzI3LXUMLEo1cFBa5we
   +A+U7l7Zs5nAIkZNojFzNBbSdSMS8sb+vrx7eFhaN5tyVtYeMNe6fCW8R
   g/jk0F42i/NPbnETb7I5zRrVpn4esnqnZ7OUe0H/1GkAp6dthXv8t33NS
   66me+JN+l/3igtvjibnAl0nvQD+lPoygLvnnVXdudFuAfu3eyHMcS2feo
   1iCIxYVKlpAwZ0MrCLZoXzulaVpeXsG1Ze91aBV5gZ5IZnvJZQDGU0P+z
   w==;
X-CSE-ConnectionGUID: ra48w1wsReWkBtWbJ8Wqkg==
X-CSE-MsgGUID: eQCCtkD5TmSr8XHl8jMg9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34247946"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34247946"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 14:23:15 -0800
X-CSE-ConnectionGUID: 4KvihrXRRWKLJkArrUDUlQ==
X-CSE-MsgGUID: zXvHPzirRGuSvMQnzHUcrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95044561"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Dec 2024 14:23:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKm9o-0004re-2i;
	Mon, 09 Dec 2024 22:23:12 +0000
Date: Tue, 10 Dec 2024 06:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/ptp/tkntp 26/26]
 kernel/time/timekeeping_debug.c:47: undefined reference to `ktime_get_ptp'
Message-ID: <202412100605.aFGq4eec-lkp@intel.com>
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
commit: 184d5014d09b27045a7e6a1e9a44122387149e59 [26/26] timekeeping: Hack to test PTP clocks
config: i386-buildonly-randconfig-003-20241210 (https://download.01.org/0day-ci/archive/20241210/202412100605.aFGq4eec-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100605.aFGq4eec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100605.aFGq4eec-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/time/timekeeping_debug.o: in function `tk_debug_ptp_show':
>> kernel/time/timekeeping_debug.c:47: undefined reference to `ktime_get_ptp'
   ld: kernel/time/timekeeping_debug.o: in function `tk_debug_ptp_write':
>> kernel/time/timekeeping_debug.c:65: undefined reference to `timekeeping_unregister_ptp_clock'
>> ld: kernel/time/timekeeping_debug.c:63: undefined reference to `timekeeping_register_ptp_clock'


vim +47 kernel/time/timekeeping_debug.c

    41	
    42	static int tk_debug_ptp_show(struct seq_file *s, void *data)
    43	{
    44		for (unsigned int id = CLOCK_PTP; id <= CLOCK_PTP_LAST; id++) {
    45			ktime_t now;
    46	
  > 47			if (ktime_get_ptp(id, &now))
    48				seq_printf(s, "%2u: %16lld\n", id, now);
    49		}
    50		return 0;
    51	}
    52	
    53	static ssize_t tk_debug_ptp_write(struct file *file, const char __user *userbuf,
    54					  size_t count, loff_t *ppos)
    55	{
    56		int ret, id;
    57	
    58		ret = kstrtoint_from_user(userbuf, count, 10, &id);
    59		if (ret)
    60			return ret;
    61	
    62		if (id >= CLOCK_PTP && id <= CLOCK_PTP_LAST)
  > 63			ret = timekeeping_register_ptp_clock(id, 0);
    64		else if (id <= -CLOCK_PTP && id >= -CLOCK_PTP_LAST)
  > 65			timekeeping_unregister_ptp_clock(-id);
    66		else
    67			ret = -EINVAL;
    68		return ret ? : count;
    69	}
    70	DEFINE_SHOW_STORE_ATTRIBUTE(tk_debug_ptp);
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
