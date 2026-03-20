Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6553E8C6A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 18:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031868; cv=none; b=sLHUG+worISZkMu0c1aUjBxC7cyEpKZXk8pseKay3ozEXxFClbGonpjO2MDlIRXncPQi18zv1RBsf/W7v/ZS0BOtXv48+trRK14F9LED5Kf6M6nleyh/23M8v+Qk8PYqoDG+peCHeXI7IXLeyjquy8WNRY9hacyuoGnEYUzMmLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031868; c=relaxed/simple;
	bh=FAlsCyzeZY7UERpiWP+vy5CB4YzOnb6fd/KynEwZfYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=soQo+yc/4OsZRG+m6wgMFMRCx0Gg+S0vnZwjiwSPU5uU/J2NWRBXPUJyVNnMUdXzrKBB3DFP3J3kodgb7xoyKI+t28DmLCTjSKoqP5/PfNhY6FFuCdQpwEBJgHO83OkmMLNdl+h63A982pgtEc1kslFR2X+8y57a3y0X8NZrZRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sdo6G4hN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sdo6G4hN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774031858; x=1805567858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FAlsCyzeZY7UERpiWP+vy5CB4YzOnb6fd/KynEwZfYE=;
  b=Sdo6G4hNXyQQVRVVqCr/kmQ8fGZMbbkCemnPoujW8dK6Dyi17m3tRAQl
   tPcrcAjGn3EYoT8vRS5teryQ+cHl20WU/G3lRDgXfwsN2MQmtiaSSQZoP
   ef2rbZt+u3ybrjsc5PfRGEmipUPm0eXKKpTo9UUh5JoEzSHxsVQbSa4I5
   soZZ6zMcNy+C/KXwUY/SCP/wYOSsC8yhjswjMI4sdcSo3trWz4pWuAurl
   5V4pjmFg+7GzH7/+a2qdfwEh6Y/de4ZCy+X/SA0MRaKr236cesJSaHitC
   0try/dJsGphF4GggnujB0kgWmjF9bgK5jzYnx0OKBbC5iuuuk0EA98PyP
   g==;
X-CSE-ConnectionGUID: duz4ZNNdTEyzSLn/Mr5KQw==
X-CSE-MsgGUID: 29aoSjgVQmKDkNxDmI2IVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75316758"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75316758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 11:37:36 -0700
X-CSE-ConnectionGUID: wJ1jtZm9QJ6QyZHSWLqS4A==
X-CSE-MsgGUID: Y/3bt+A8SKOdozVTeNxjIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="220257074"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Mar 2026 11:37:35 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3eiz-0000000055p-19Ry;
	Fri, 20 Mar 2026 18:37:33 +0000
Date: Fri, 20 Mar 2026 19:37:09 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 18/44]
 kernel/time/benchmarks.c:38:22: warning: 'count' is used uninitialized
Message-ID: <202603201946.KnD68fEf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   40e3ab4d08362c43874fd99e70d6ef6f57f086ef
commit: 7fe24e0ff2f96db84d1ce465aca76bd42c169ab7 [18/44] benchmarks
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260320/202603201946.KnD68fEf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201946.KnD68fEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201946.KnD68fEf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/benchmarks.c: In function 'benchmark_ktime_get_read':
>> kernel/time/benchmarks.c:38:22: warning: 'count' is used uninitialized [-Wuninitialized]
      38 |                 count++;
         |                 ~~~~~^~
   kernel/time/benchmarks.c:33:13: note: 'count' was declared here
      33 |         u64 count;
         |             ^~~~~


vim +/count +38 kernel/time/benchmarks.c

    29	
    30	static int benchmark_ktime_get_read(void *data, u64 *value)
    31	{
    32		ktime_t end;
    33		u64 count;
    34	
    35		end = ktime_get() + BENCHMARK_TIME;
    36	
    37		do {
  > 38			count++;
    39		} while (ktime_get() < end);
    40	
    41		*value = count;
    42		return 0;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
