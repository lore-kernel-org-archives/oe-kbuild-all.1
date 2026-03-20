Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C9131F994
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003843; cv=none; b=SoRac2IIJ5NKyI0ylUmLG6iBdyoQSxFgLBLgdnDFT64FS1gI0eO9laHbHHDNzbzydXBr0VkxIC2zsWgSgfpDcSKTIOn/tooWyNdU5iiFLMyxgQIwWcuVvZ5v2dU4BzRWrEI2doIf5iGJK/K3wjS+mMqhDvBOJSxkkpcy+Rb9VYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003843; c=relaxed/simple;
	bh=yQPmf/JlNh3ug3/hohTaeFinQ1mCmRR/dfm1MTvqzng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NvOoeiWJDQHxBk9TkbI+Qs1ux5NDiv4PR7apfNGg7M6yWpTIeOWtfMbyQLSFvAzHfdftmTmBG6xVxR3Snr/3cXkMiuppKjjZuenn5HIToY6fp6x/zwkRJkrJBT3hfH8riwYx9B9IB1tYlXR+5wO6phoUx+BzzB9QUB8xRQ+S/2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OoYJyQbg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OoYJyQbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774003842; x=1805539842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yQPmf/JlNh3ug3/hohTaeFinQ1mCmRR/dfm1MTvqzng=;
  b=OoYJyQbgN6EbP87+AftK0QZek94PfmgO4z9m8csV2DU4dFikOXtMFuNK
   YBfC++7sBkaHv4pCio7b97+o6ORAgYkwNoB/4lTPDZOO3/3XduHGnki3N
   gVKt6jF6H713N2IGQ8najqvPVGAbOQRgso4QOfIG118aCbM5JwUXzN0AV
   T68ry3Xa9qAlg7J+YeVCFTkv5o6HDrUaOexypLnNLYqSeWY/3RvnAYX8D
   PHsvGbkISFEdDJoh86Vcje1f4qDgK2k7FQ0upKakmJJI43XgSl640nW+5
   7bzRIwDumoZDr956ZHU00ACIgBzhrMR940BAzur4FtHpaZYgYnQXjciek
   w==;
X-CSE-ConnectionGUID: IPTRpEI0ROeKeDJOIQ1fzA==
X-CSE-MsgGUID: mdEk8ZhJTnmIsaWeYvyeiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74788144"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74788144"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 03:50:41 -0700
X-CSE-ConnectionGUID: DXCJP8wUSRyuORi6diRCJw==
X-CSE-MsgGUID: gBzp5aybSa+rJ4uLXj6OXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="220167200"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Mar 2026 03:50:40 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3XR7-000000002HR-49CA;
	Fri, 20 Mar 2026 10:50:38 +0000
Date: Fri, 20 Mar 2026 18:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 15/25]
 kernel/time/hrtimer.c:1771:3: error: a label can only be part of a statement
 and a declaration is not a statement
Message-ID: <202603201822.JPNcKDlk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   cc3ea8220bbf2776d1d33ef66bf120fd6c27a801
commit: 7924e77c4adaeb5f81b1d76b80f9255ea214b002 [15/25] hrtimer: Add support for auxiliary clocks
config: sparc-randconfig-001-20260320 (https://download.01.org/0day-ci/archive/20260320/202603201822.JPNcKDlk-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201822.JPNcKDlk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201822.JPNcKDlk-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/hrtimer.c: In function '__hrtimer_cb_get_time':
>> kernel/time/hrtimer.c:1771:3: error: a label can only be part of a statement and a declaration is not a statement
      ktime_t kt;
      ^~~~~~~


vim +1771 kernel/time/hrtimer.c

  1758	
  1759	static ktime_t __hrtimer_cb_get_time(clockid_t clock_id)
  1760	{
  1761		switch (clock_id) {
  1762		case CLOCK_MONOTONIC:
  1763			return ktime_get();
  1764		case CLOCK_REALTIME:
  1765			return ktime_get_real();
  1766		case CLOCK_BOOTTIME:
  1767			return ktime_get_boottime();
  1768		case CLOCK_TAI:
  1769			return ktime_get_clocktai();
  1770		case CLOCK_AUX ... CLOCK_AUX_LAST:
> 1771			ktime_t kt;
  1772	
  1773			if (!IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS))
  1774				break;
  1775	
  1776			if (ktime_get_aux(clock_id, &kt))
  1777				return kt;
  1778			else
  1779				return KTIME_MIN;
  1780		}
  1781	
  1782		WARN(1, "Invalid clockid %d. Using MONOTONIC\n", clock_id);
  1783		return ktime_get();
  1784	}
  1785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
