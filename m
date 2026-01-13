Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6083A363C56
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 06:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768287155; cv=none; b=ImaF9TehsQ4JOxsia1KrGd0oKsSHcD+YEpl6FaKP6HQUYIJHi5GrEtIKCb+HRIblYeZsUVmrXxX2VVJOCYBGU1jNAYN5nOy+Jpzvi2EQxY8TvLB8GiY++teZ3/NpMIJIP/T3EXPj3mybuAUEiWmWyWJCvuwt8hSgNpSf/Dj6+MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768287155; c=relaxed/simple;
	bh=M3sm0mL5nWhPMfX+hAMS1/ofGPtplFcWFpC2Y7ADCOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R823J7ftNrVzeiw20Ti0ZDxm19kZU/wIzRBZNl5dtoyEoWXmraTpFctSw/ArayyaO38MBoLzLVp6QkjMY/uEcRNz7DFWLU0DnbyfXOUFJs/hKfbWhoUe7eS1nx+ZmfxsOPNdOUNOj/G54LLg9w++b+d9xqrthdcpTAkNVgD3mjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKaBWItW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKaBWItW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768287153; x=1799823153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3sm0mL5nWhPMfX+hAMS1/ofGPtplFcWFpC2Y7ADCOw=;
  b=HKaBWItWcy6auaBAv2cpLH4h4V62gYcioV4SwyYajQLvcZy6A6ozHVM+
   6VzuEhasTNb7hDKR0xLcGdrweauaPstB+wgxbR5C4vIXvZAVyD/HYaKV6
   iUOBdgsfvHWAP143305ZB9m31IoLhLSpgZzPUf6cj6ZAZ6FTC3b0sC1+5
   45DhAFmgO2xsZNGf5Ddu4gcJhPq4mCergUQDKt2MC10lcqoPhJYLPOFUi
   t41jqkuI38ho/TGG8bPD7flLVXWCImVjN/ze8aRpcQoQWL4JGYh3SKOs5
   /wr4Gl3H85v4+nWumeCYj5EyhKR86040dHg58s+lV518ZbXsDn6GhVE6n
   A==;
X-CSE-ConnectionGUID: oFI8CnohTrqWMair5JACrg==
X-CSE-MsgGUID: aDWUeXQJQya2OyXBvTxusw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="95041554"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="95041554"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 22:52:32 -0800
X-CSE-ConnectionGUID: 5tpq/Wo1RR+NkUedJmVNWw==
X-CSE-MsgGUID: x/U9Rv0YT3SezTH/ADeFBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204113400"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jan 2026 22:52:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfYGS-00000000ELQ-0oa7;
	Tue, 13 Jan 2026 06:52:28 +0000
Date: Tue, 13 Jan 2026 14:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 8/28]
 drivers/platform/wmi/marshalling.c:24:1: sparse: sparse: static assertion
 failed: "ARCH_KMALLOC_MINALIGN >= 8"
Message-ID: <202601131514.lmN2k3pc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   2511dd4dbb76ef6914c9b45ccba2492da25d772d
commit: bfa284e9f5e77c9e7389116a403b1dc478f2d58e [8/28] platform/wmi: Introduce marshalling support
config: i386-randconfig-062-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131514.lmN2k3pc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131514.lmN2k3pc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131514.lmN2k3pc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/wmi/marshalling.c:24:1: sparse: sparse: static assertion failed: "ARCH_KMALLOC_MINALIGN >= 8"

vim +24 drivers/platform/wmi/marshalling.c

    19	
    20	/*
    21	 * The WMI buffer data needs to be aligned on a 8 byte boundary to properly
    22	 * support 64-bit WMI integers.
    23	 */
  > 24	static_assert(ARCH_KMALLOC_MINALIGN >= 8);
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
