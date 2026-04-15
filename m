Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A06217704
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 03:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776223112; cv=none; b=epW94SmCkrMnnd+2S1aBWHbb7ezipSzh0xoHv8loBR4Dy+ayLQ71krQaQwtuCPARj4DWt2BKiibiA3sifZNubvHDAxiTIH1UqJ+K1b/ZfBJnM54Zsvgel2hOe8QnGQGtzpsLyIyUWeF4pQAuV5ZVRDN6V49nI4/RZMz1QPLxOp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776223112; c=relaxed/simple;
	bh=pN4vBEp6nfcqXNrQLkmLldYUzKj2XXj7ZHPiuukhJLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlgiCEh+IC/GsY+1teEHYmOy3ZDPncCd4j2go0CmYJLHaGIWZA2OShSrsXJjBY0goBeTTqYMf0xJELyVVsHrI6NMo2knJJ/yqT/ItRDNdu4oGaa3NSbZfktTaAHJYwbqlnHP7mHifkMqEBjH2wWKZ0hD6iZbooYAFcKDV7LQjd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XniyNQmk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XniyNQmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776223110; x=1807759110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pN4vBEp6nfcqXNrQLkmLldYUzKj2XXj7ZHPiuukhJLg=;
  b=XniyNQmkRxLelxn4iRwXUgRicu8LK9W4k4XLtKMgbzeZ4zsqdtQYZWoS
   vT6af2WZwXB1tL3MHcwownmYV34bp9S1a4m7wofkz1+KXxu0pJYp3QulO
   +Ss0Frzhat/SIfKS4FRbKEzqfZR3kdKqqQwQrVXJc7bA5ESFcXs8PQUmD
   uuZLD+79DwU2pu+SVJRtFwBRGE4RK5bciPYP8mqOggjfTx55nxSZvuOb0
   7IdKQq5l003rjPCZ5R63UtbzwuZWSPzo701FPVWtUjBQZ5S5Jq+BYQdeh
   qd2yoMIXVK0ajcVACCth4mbzJM2GDbAAXeoJ66rMJdfx7noj28W5Kcyex
   A==;
X-CSE-ConnectionGUID: S8LQdVlySbCpSvnNnXbeUg==
X-CSE-MsgGUID: Tzs6wOEsSx6XLKd9T8ymOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76224294"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76224294"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 20:18:29 -0700
X-CSE-ConnectionGUID: hRHIx42nTce3zJplxlFpbg==
X-CSE-MsgGUID: 36SwFOnOTKqLOuqoFusQfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="223780958"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Apr 2026 20:18:26 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCqlj-0000000005h-0rLu;
	Wed, 15 Apr 2026 03:18:23 +0000
Date: Wed, 15 Apr 2026 11:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <youling.tang@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: Re: [PATCH] crash: Support high memory reservation for range syntax
Message-ID: <202604151100.7wbci6vo-lkp@intel.com>
References: <20260404074103.506793-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404074103.506793-1-youling.tang@linux.dev>

Hi Youling,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v7.0 next-20260414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youling-Tang/crash-Support-high-memory-reservation-for-range-syntax/20260414-205035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260404074103.506793-1-youling.tang%40linux.dev
patch subject: [PATCH] crash: Support high memory reservation for range syntax
config: mips-randconfig-r061-20260415 (https://download.01.org/0day-ci/archive/20260415/202604151100.7wbci6vo-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604151100.7wbci6vo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604151100.7wbci6vo-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/crash_reserve.c: In function '__parse_crashkernel':
>> kernel/crash_reserve.c:324:37: error: 'DEFAULT_CRASH_KERNEL_LOW_SIZE' undeclared (first use in this function)
     324 |                         *low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/crash_reserve.c:324:37: note: each undeclared identifier is reported only once for each function it appears in


vim +/DEFAULT_CRASH_KERNEL_LOW_SIZE +324 kernel/crash_reserve.c

   282	
   283	static int __init __parse_crashkernel(char *cmdline,
   284				     unsigned long long system_ram,
   285				     unsigned long long *crash_size,
   286				     unsigned long long *crash_base,
   287				     const char *suffix,
   288				     bool *high,
   289				     unsigned long long *low_size)
   290	{
   291		char *first_colon, *first_space;
   292		char *ck_cmdline;
   293		char *name = "crashkernel=";
   294		unsigned long long boundary = 0;
   295		int ret;
   296	
   297		BUG_ON(!crash_size || !crash_base);
   298		*crash_size = 0;
   299		*crash_base = 0;
   300	
   301		ck_cmdline = get_last_crashkernel(cmdline, name, suffix);
   302		if (!ck_cmdline)
   303			return -ENOENT;
   304	
   305		ck_cmdline += strlen(name);
   306	
   307		if (suffix)
   308			return parse_crashkernel_suffix(ck_cmdline, crash_size,
   309					suffix);
   310		/*
   311		 * if the commandline contains a ':', then that's the extended
   312		 * syntax -- if not, it must be the classic syntax
   313		 */
   314		first_colon = strchr(ck_cmdline, ':');
   315		first_space = strchr(ck_cmdline, ' ');
   316		if (first_colon && (!first_space || first_colon < first_space)) {
   317			ret = parse_crashkernel_mem(ck_cmdline, system_ram,
   318					crash_size, crash_base);
   319	
   320			/* Handle optional ',>boundary' condition for range ':' syntax only. */
   321			parse_crashkernel_boundary(ck_cmdline, &boundary);
   322			if (!ret && *crash_size > boundary) {
   323				*high = true;
 > 324				*low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
   325			}
   326	
   327			return ret;
   328		}
   329	
   330		return parse_crashkernel_simple(ck_cmdline, crash_size, crash_base);
   331	}
   332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
