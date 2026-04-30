Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA98175A95
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 03:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777521340; cv=none; b=i3NCDegpNyniVc9PwdGPXkLoAQIf5ABOmIix7dxPiZZRDOs2w5piZGFeO/OM0JyREFP/42jM+W5PhAtqsu+rblvL+GbfYfW1Q8YOuCIjSdSxbf9NH+VrPrkWRDg+0IcrFYexUIah7fv1YidG445DxefXwe4VRxSgR21cVorimyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777521340; c=relaxed/simple;
	bh=OZVz1gFRsesLKeT/ZgJRgSjZ9JWnZz+tFiYKwM3dMPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sQsdRXgxxgy9vn/pCQH4kSaHr0n7F5hAWkgQXdDUYAoW5kVGw5RoI3DV22E4EAZTnakf9hM8A3g+1Bq1G4LzBS+ZMakpvO9TaOG4WWZl+quUEjZ3Jkg3mrIhtqgVvIh+l4n+RqMhy5alMIvI1lbESMaQj5XvjdtaaI7qVpD23ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsFqBuVs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsFqBuVs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777521339; x=1809057339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OZVz1gFRsesLKeT/ZgJRgSjZ9JWnZz+tFiYKwM3dMPs=;
  b=TsFqBuVsIXGAIBy8vU/fIKIRnXQalmqxs5TEaEo6jk7WMSfdyTJbNI56
   YPmj1FZQi95TsOvmCLZD7sKhjPOJkslVjqeziASdsGC3S7GZPejR8Q0E6
   ZzFPjbnwDJi4jLbhJvw1qQ0smeQEGv5sXoxx8FKQtezPRK5YG06Yr1CGq
   V7VWaoo/a09yaEk+xqTBzszHnBVEKYG4a+uaU4TfAb5EuUQ8t3aiNldzk
   RjnIJRDBx1GrhuCkFfD5gVhK6cn0QvVGMINGQNJb4l5RdQnKBv0g/eY33
   I1R7ftYXTaS8ReI3IYUvF/QLs0r75ZRGfZ3CajSIZszOC8e28plU3adPL
   A==;
X-CSE-ConnectionGUID: OcqMEXdtR1uzCl76W5jqbA==
X-CSE-MsgGUID: 2V2ILn5NRhaiLU941Zy/Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="88774726"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="88774726"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 20:55:39 -0700
X-CSE-ConnectionGUID: THXJtIAXSXei/tj7QDXhJQ==
X-CSE-MsgGUID: mysLJpmzR0Gi9IAoZvU7Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="257785575"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Apr 2026 20:55:37 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIIUx-00000000BuI-0U6Y;
	Thu, 30 Apr 2026 03:55:35 +0000
Date: Thu, 30 Apr 2026 11:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 17/44]
 kernel/time/benchmarks.c:112:40: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202604301131.MSMUGlNW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   3e5442acb7e21f08c3eff2ecdace624b6647d5b1
commit: 2d4cde60596e5113f58afbb253423ffcabc891ac [17/44] benchmarks
config: i386-randconfig-r131-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301131.MSMUGlNW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301131.MSMUGlNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301131.MSMUGlNW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/benchmarks.c:112:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *buf @@
   kernel/time/benchmarks.c:112:40: sparse:     expected void [noderef] __user *to
   kernel/time/benchmarks.c:112:40: sparse:     got char *buf
>> kernel/time/benchmarks.c:119:20: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *read )( ... ) @@     got int ( * )( ... ) @@
   kernel/time/benchmarks.c:119:20: sparse:     expected int ( *read )( ... )
   kernel/time/benchmarks.c:119:20: sparse:     got int ( * )( ... )

vim +112 kernel/time/benchmarks.c

   107	
   108	static ssize_t benchmark_file_read(struct file *f, char *buf, size_t size, loff_t *ppos)
   109	{
   110		struct benchmark_private *private = f->private_data;
   111	
 > 112		return simple_read_from_buffer(buf, size, ppos, private->samples.d, sizeof(private->samples.d));
   113	}
   114	
   115	static const struct file_operations benchmark_fops = {
   116		.owner	 = THIS_MODULE,
   117		.open	 = benchmark_file_open,
   118		.release = benchmark_file_release,
 > 119		.read	 = benchmark_file_read,
   120	};
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
