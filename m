Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6702E1DE885
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 01:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771032478; cv=none; b=Be8E+r8SYlfmor0WcXLwfhXhKg4o5tU2hYKfgJh9Whi7WhaHtF+WEFqSAk8c47oxt4VafKGfY2dD/+bW940HSraahMmEw7Hsna4oMGGN13iROiQBnhUC4Koe6b8OXnxFqmowMfSmKQDkKU19OU6MpJU66Kbu96fCN18I/NlIzN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771032478; c=relaxed/simple;
	bh=qWvuvieV6lE2xUCTjNaFNIRApfeAbvrQx7NY/KxXe4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SsOi51iuzXK43qEpzja5YJeJT3AgrjNnpSGTBjd7ii2CUWoRWWu0T02OzAZHbAa1DYccdVST8B5IjzIpVNrneeXLySiUByyuOSvnfbuIKrHHEvKKth/QcG5etcnrGwg6h3G3QxUwhy+X7DbUiaRvVLDtTKtrpCuPxlm+AAJXSvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvRJB2JI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvRJB2JI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771032476; x=1802568476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qWvuvieV6lE2xUCTjNaFNIRApfeAbvrQx7NY/KxXe4Y=;
  b=NvRJB2JIQJIfygpBLyREtyltNQpF1ikuEQ3eMLbI4ohzA9sIJYXmeFCe
   G8CyeobkQI1JMhd228DqxWGKN0M8r+xW/U+cJ3KnM6Hk5wgUmUG1hEYIs
   ed071mGAtlNTSkJcw9frYaEz0WsnLQUdgDzSfmpznnK4S8dqsH2RifbJ0
   GF/AHZURxzzzTIkPIT8An7wu/AlVk30DKrUpfmuCIqCk7tfl87HU4U/te
   heiQp1awufGTrdid3ipJ0LA7rHH8Umz5B2GkZEinqbaq4OoXX25mcKoq6
   MZkRrcuVdka6rqQAz2dfiesNY7o/Hylv5qKBb7utDOdxhnRPKilIN4xDo
   Q==;
X-CSE-ConnectionGUID: rHut/P5uR7+6NZT1XF81ug==
X-CSE-MsgGUID: hw6CEievSe6NLAvZp5qzqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72393425"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72393425"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 17:27:55 -0800
X-CSE-ConnectionGUID: HuP8rwiOTdy4yZW/b6BSdg==
X-CSE-MsgGUID: RWqSYcEmRYG+XCwHDLvcMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="236058500"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Feb 2026 17:27:52 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr4Rr-000000001jN-0xvp;
	Sat, 14 Feb 2026 01:27:51 +0000
Date: Sat, 14 Feb 2026 02:27:04 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat_32bit_time 3/4]
 lib/vdso/gettimeofday.c:343:9: error: implicit declaration of function
 'BUILD_BUG_ON'
Message-ID: <202602140236.aMbBf0r8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-compat_32bit_time
head:   1a400ee33c91f1c010e4fcbddc3781afdc8ff201
commit: 194ed9d5b6d11d446fde4eaa8724406aa7cd5fe2 [3/4] generic
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260214/202602140236.aMbBf0r8-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140236.aMbBf0r8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140236.aMbBf0r8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   lib/vdso/gettimeofday.c: In function '__cvdso_clock_gettime32_data':
>> lib/vdso/gettimeofday.c:343:9: error: implicit declaration of function 'BUILD_BUG_ON' [-Wimplicit-function-declaration]
     343 |         BUILD_BUG_ON(!IS_ENABLED(CONFIG_VDSO_COMPAT_32BIT_TIME));
         |         ^~~~~~~~~~~~


vim +/BUILD_BUG_ON +343 lib/vdso/gettimeofday.c

   334	
   335	#ifdef BUILD_VDSO32
   336	static __maybe_unused int
   337	__cvdso_clock_gettime32_data(const struct vdso_time_data *vd, clockid_t clock,
   338				     struct old_timespec32 *res)
   339	{
   340		struct __kernel_timespec ts;
   341		bool ok;
   342	
 > 343		BUILD_BUG_ON(!IS_ENABLED(CONFIG_VDSO_COMPAT_32BIT_TIME));
   344	
   345		ok = __cvdso_clock_gettime_common(vd, clock, &ts);
   346	
   347		if (unlikely(!ok))
   348			return clock_gettime32_fallback(clock, res);
   349	
   350		/* For ok == true */
   351		res->tv_sec = ts.tv_sec;
   352		res->tv_nsec = ts.tv_nsec;
   353	
   354		return 0;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
