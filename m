Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BE21DF963
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 04:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756873912; cv=none; b=HfAK7JOd+xZQGe5jVl4xrzHHaqe4rOxwjqB18aqGMcdTjhOz6SVKHayzq31FLvdmD0aR64ppHvA1R2Gv3TDHOE+VEfUOJZABRZZ9gtdNVqswyUaTmHsr9pmRSRXSDiFDbqV58aR4fqPP+kg7kwEN7KxbmCVNxlZJUbKO9BjCLsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756873912; c=relaxed/simple;
	bh=yq7aSjWHkQVFwvOqiPiEP+dKfwjVRZpvRGyCMxKbKhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDWtpOxjznGRkYMThfCO2jSSsCMT9jiU+btfDBbFaAxZ/1ZtH8r1eSrJkfJU5BKl9CHUmQDsAp6AVek3nLnqTGsK6t+coa9vk1YQJu7nHiKH/WhJr4xRFAE3G8Gs+EtU1R2w/UsB/iWCHUQ1WhnDPViXraRGsRPwGlqgef1Xj4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNcv4CqD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNcv4CqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756873911; x=1788409911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yq7aSjWHkQVFwvOqiPiEP+dKfwjVRZpvRGyCMxKbKhU=;
  b=jNcv4CqDtO0s2glksFScgBPf5R+Uxmo6mnJeyZwABQGCDPa1v1isq+qu
   2QPZ+oW06smwAzglZneNchCWlilPNeVfUrzRBWs9rz3ub4k+5TqXlZSyc
   g/Kw38QjzeXwJrtFJsXpKvbQBoEYCjL91drcTm73VLfhYgMt3ImMDOuDL
   nNDavjgxN0RhK8U6Ii9AvSDwppcY7bWr2xVgiciGiinnD+nWjPeV5KuRv
   gF3Nj0sl15dkiLZbNb7BSi3xfU3vutUUtAfGs4q1auyarXXF5ivbCdwCK
   0ECvoXFwikUf9nclA+oOhkDFWPG6tsBq/u1krh9L/FYfT+0CS9UvQyEAs
   Q==;
X-CSE-ConnectionGUID: QfXyYzrySyudT2e9GvKdmw==
X-CSE-MsgGUID: lhjszjAlRNaACM3nwG2imQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70274384"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="70274384"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 21:31:51 -0700
X-CSE-ConnectionGUID: 9dp/wJmkTIKsc8f2Hd3nOg==
X-CSE-MsgGUID: udK1GFfrR2SLhCzERG43Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="171631768"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 02 Sep 2025 21:31:49 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utf9u-0003OJ-39;
	Wed, 03 Sep 2025 04:31:47 +0000
Date: Wed, 3 Sep 2025 06:31:25 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] fs/proc/stat.c:64:5: warning: no
 previous prototype for function 'get_iowait_time'
Message-ID: <202509030603.o4VsirtS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xunlei,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   119e72f374248c57f950f0658c1e1099b40e2ffa
commit: 01b3b898ef05c1cdc6774d48c3620483e40cfc1f [1/1] ck: cpuacct: export cpuacct.proc_stat interface
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250903/202509030603.o4VsirtS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030603.o4VsirtS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509030603.o4VsirtS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/stat.c:64:5: warning: no previous prototype for function 'get_iowait_time' [-Wmissing-prototypes]
      64 | u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |     ^
   fs/proc/stat.c:64:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      64 | u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         | ^
         | static 
   1 warning generated.


vim +/get_iowait_time +64 fs/proc/stat.c

    63	
  > 64	u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
    65	{
    66		u64 iowait, iowait_usecs = -1ULL;
    67	
    68		if (cpu_online(cpu))
    69			iowait_usecs = get_cpu_iowait_time_us(cpu, NULL);
    70	
    71		if (iowait_usecs == -1ULL)
    72			/* !NO_HZ or cpu offline so we can rely on cpustat.iowait */
    73			iowait = kcs->cpustat[CPUTIME_IOWAIT];
    74		else
    75			iowait = iowait_usecs * NSEC_PER_USEC;
    76	
    77		return iowait;
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
