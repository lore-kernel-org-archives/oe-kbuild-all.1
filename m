Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2F514F12C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Sep 2024 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725188144; cv=none; b=l6Uu7jlKZE+GxxQXmfpG9fx27nepS9aw4vBy2d4Z+ovz6u+IBTY3RwA4VnxQmWQiGpH9GZKa2Q5h88bJomasacWgcly6Yi2KiHiLaP6gWEP5ZC6ZVGjhsszKtgBJsnb/AP5XV5UWIPBDayt2rrSUppzlKUI/GORsTHCHsDf1XgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725188144; c=relaxed/simple;
	bh=AhygcUJPT2bEWRn0POZna/r5G23MmBx7NZYoOYBBi6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hEopaMw1YveNtVBfh4JcXAHMiguabVj+mwzM5EOFqtBkVdBjOBgQuU5R1r64hFhhFad0U+/70LXWDlVIsLjLDcLtj8jfKMsyLjw09uri+TIpJu+8A+OBlA1TX/5zEcud31DSc97PEpgu0xbVX8gg7xyeUD8Trak3SIiuw5YQsgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ey51TDJq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ey51TDJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725188142; x=1756724142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AhygcUJPT2bEWRn0POZna/r5G23MmBx7NZYoOYBBi6w=;
  b=ey51TDJqrRVDAHMo1SpzfwPMZwJZ/zt92DfPTSYbgRk6jp+9c3c2BWTg
   R7sSMCAddmh1VyOu1tseOBOQ669acKFX4PIgdaFnpksfiOc3bNsGTG/dp
   wxS6jFViefAB+QiNtaVt7mOWSfewwcvEAPUqzUaCn5Jm+TcaFK+myNr04
   gWuMKKe0S0/UBdve2LNseOb+hQKGzsNPuZwXs+jEc0rqD+NPEaVEezGZH
   DFIzptgwqAb/k3xG0ZJkOuL30C+2eN5iB5EzTXRj6wh+C2TAiVNYj4wFO
   uQfSYEe4w6CYmF0R4cCMFgTaYTzmpbZ75RvUl56J++3P19wbYK6j2GMwC
   Q==;
X-CSE-ConnectionGUID: nThOg6RPSOGWC5QZXSWlQA==
X-CSE-MsgGUID: Bv2nIpmnSNyjfFS+ViE4jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="35182587"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="35182587"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 03:55:41 -0700
X-CSE-ConnectionGUID: mVWUffEfT8q40XDaWXUovg==
X-CSE-MsgGUID: 7cPPte8XRBGcj3W3/J1sgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="64510262"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Sep 2024 03:55:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skiF9-0003bK-08;
	Sun, 01 Sep 2024 10:55:39 +0000
Date: Sun, 1 Sep 2024 18:54:43 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:for-next-clocksource 1/1]
 arch/parisc/kernel/time.c:20:5: sparse: sparse: symbol 'cr16_clock_freq' was
 not declared. Should it be static?
Message-ID: <202409011853.PqTaxr30-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next-clocksource
head:   e5bb163b9996359e6ecbe894a87324a842496e37
commit: e5bb163b9996359e6ecbe894a87324a842496e37 [1/1] parisc: Convert to generic clockevents
config: parisc-randconfig-r121-20240901 (https://download.01.org/0day-ci/archive/20240901/202409011853.PqTaxr30-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240901/202409011853.PqTaxr30-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409011853.PqTaxr30-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/parisc/kernel/time.c:20:5: sparse: sparse: symbol 'cr16_clock_freq' was not declared. Should it be static?
   arch/parisc/kernel/time.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +/cr16_clock_freq +20 arch/parisc/kernel/time.c

    19	
  > 20	u64 cr16_clock_freq;
    21	unsigned long clocktick;
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
