Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B203B4E9C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 22:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777502470; cv=none; b=PQAmHDdEM1nXP50qY/fESdJha4gHLOl9p7rt8tIMfK2hf/fiOxQcoMjOccVQ05a0uTBzgTnp7VpIzIsYQCQP5Bu+GK4D86oOFHP5Ies67iyOr3GvXqHqRrhAH/nP/dAw9r5oBTNqPIH7YWuckyNvZohwJChJc5K4kSFxFiTndDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777502470; c=relaxed/simple;
	bh=Prs6WtnNQmxMJPLEGqnYoBUwbZxxTKXGSO/uuDGHo4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozVKX7yqFt40j5lU0vjPDUVurB6Ey+iQzTuItEz3biio2DSkdkEb2UM+5y8W4JvWC6MXxmZ0wHtxC6EiH65eKuKy8wc67Ih/PbHUjW5jDiqaQC73IwLL8wKWl4FYTCFG+7b/2LCzC+7UT+q849WC3ZCCF/Ho0HRGmINie97Sk3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oq6XE09w; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oq6XE09w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777502469; x=1809038469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Prs6WtnNQmxMJPLEGqnYoBUwbZxxTKXGSO/uuDGHo4k=;
  b=Oq6XE09wvPeXzMWvNhij0Lf3txQp86DWyobupfJ6+yl1kCWyR3dgUdTr
   LIQQGi0IbP8IFi+KhbDa8fsN13VLne0wY7ejq8LMVin+K1LPkBwKRWPEF
   XwYX+41GkBcQj7CBnLE8r0c+gmobP5eiAz2B0CWGh0YZwWPw6IseMwNmJ
   qhplUnxGaYxb4RpnqZK9qytnS16NT3oxJtRfPpFx9Lw56pehQMtRj4PYU
   S1GtAob5xA7/RDXuc/bNkaG+isc6ho4FSu6mkotNQp+w0sP6T3Fp2xX/u
   32rgRZjAEGCaJfUpOIxmu40J5uRaiy6sAAQMvQ0KBJCpXy9vX/eF+DfE7
   g==;
X-CSE-ConnectionGUID: 4Jva2SGGShG2Q5c7+DGD8w==
X-CSE-MsgGUID: bPNnbA+HQ4GLyPF+CLGRtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89818791"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="89818791"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 15:41:09 -0700
X-CSE-ConnectionGUID: 0GI/G0AOTSGrk3HfWQUQBQ==
X-CSE-MsgGUID: N6JkXaW7RJ+Ys3viU5xhYA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2026 15:41:06 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIDaX-00000000Bbi-05kg;
	Wed, 29 Apr 2026 22:41:01 +0000
Date: Thu, 30 Apr 2026 06:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stas Sergeev <stsp@aknet.ru>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] x86/rtc: fix failed fallback RTC device registration
 handling
Message-ID: <202604300638.5ysk7jy1-lkp@intel.com>
References: <20260415193455.3869807-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415193455.3869807-1-lgs201920130244@gmail.com>

Hi Guangshuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on linus/master v7.1-rc1 next-20260429]
[cannot apply to tip/auto-latest tip/x86/core bp/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/x86-rtc-fix-failed-fallback-RTC-device-registration-handling/20260416-130623
base:   tip/master
patch link:    https://lore.kernel.org/r/20260415193455.3869807-1-lgs201920130244%40gmail.com
patch subject: [PATCH] x86/rtc: fix failed fallback RTC device registration handling
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260430/202604300638.5ysk7jy1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300638.5ysk7jy1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300638.5ysk7jy1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/rtc.c: In function 'add_rtc_cmos':
>> arch/x86/kernel/rtc.c:142:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     142 |         ret = platform_device_register(&rtc_device);
         |         ^~~
         |         net
   arch/x86/kernel/rtc.c:142:9: note: each undeclared identifier is reported only once for each function it appears in


vim +142 arch/x86/kernel/rtc.c

   133	
   134	static __init int add_rtc_cmos(void)
   135	{
   136		if (cmos_rtc_platform_device_present)
   137			return 0;
   138	
   139		if (!x86_platform.legacy.rtc)
   140			return -ENODEV;
   141	
 > 142		ret = platform_device_register(&rtc_device);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
