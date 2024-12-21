Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56368A32
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 04:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734756056; cv=none; b=cE0DRtlDI+9UCTmYEOMjypm3b4txsv7i2dcsAQK8jbyHMvEofD2SEy0taYlgZqD8cZfRCFc0fnc7NY4N7YXjiaiD3UnNltbj4QBTgkqIi3cmlYUvaJ1+5WXmJ9g+NEfJmTuyUze+cLSSI9rIw2Y5/EiEeqWsxWJThYz9zeP08GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734756056; c=relaxed/simple;
	bh=DFAoV6IX3nIlStyB2MBuzv+Ni7hv6O0F8StyWiXQvS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ihn+GPpbIuvw8HWjIuNgmvem4m43ynTtH0KNCi9/c+nYuIDuTyviBMp1XXAo1YDzhKC9gccJmc2IUmOKnnrc+z/XrI2AwQu22NZtbB6afSQ7qQJsecrmG1nwpcWEKVC8sRRG1UBqZVGXkOTB6edDsahD1oPilEc3twc4UyhBbfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADEGzaTU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADEGzaTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734756054; x=1766292054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DFAoV6IX3nIlStyB2MBuzv+Ni7hv6O0F8StyWiXQvS4=;
  b=ADEGzaTUCGUEpr1zIQ7G10mg4QbmdYQYviqVwx2eupFjPmvVro7Imngf
   72OL+xMOD+usXGHPu6rw9Qc/GVYx02JVyRckjqlV2YOEXkzfEIE2voNZQ
   Q4rM147IXuJhQf566xLDXLcq3VC+vGAk2IQWqj5RgvY/JZZwhEzCTlphS
   eQJ0t44uEYn33IxjoQobzCGzZw/j2gIRS3qIZGq/W2CzJ71KeqHJ2wRwm
   oPdzcxQmEonNUJ7eCFEQOJ8hVCN9VUshbsiag/mOBn7rRE+6/TpP5Sh9T
   ryI/0kEQKnhXNi0baaO2zU2VWxc5iLRLzQLY/fmj0iEX+fTBswa1Z4Be/
   A==;
X-CSE-ConnectionGUID: 3Hebj95aQC++M/7DDYVgRQ==
X-CSE-MsgGUID: ZAK4oiedQQKPFugyQeep+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="22897269"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="22897269"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 20:40:53 -0800
X-CSE-ConnectionGUID: uwyNVlVxRfCzr5CDD22G2w==
X-CSE-MsgGUID: yrZW7Me3SHadqADb0LRS6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99551824"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Dec 2024 20:40:53 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOrII-0001vb-1n;
	Sat, 21 Dec 2024 04:40:50 +0000
Date: Sat, 21 Dec 2024 12:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, sys_oak <sys_oak@intel.com>
Subject: [intel-lts:6.6/linux 14/34] arch/x86/kernel/tsc.c:1338: warning:
 Function parameter or member 'system_counter' not described in
 'convert_tsc_to_art'
Message-ID: <202412211203.eED8So8w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/linux
head:   a4ec5f44dc60164d4e5f12f91b65052ab30accc5
commit: 56378061ec3f6e6ec4b243638798a8d0ad44d108 [14/34] ptp: tgpio: PSE TGPIO crosststamp, counttstamp
config: i386-buildonly-randconfig-001-20241221 (https://download.01.org/0day-ci/archive/20241221/202412211203.eED8So8w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211203.eED8So8w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211203.eED8So8w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/tsc.c:1338: warning: Function parameter or member 'system_counter' not described in 'convert_tsc_to_art'
>> arch/x86/kernel/tsc.c:1338: warning: Function parameter or member 'art' not described in 'convert_tsc_to_art'
   arch/x86/kernel/tsc.c:1527: warning: Excess function parameter 'cycles' description in 'convert_art_ns_to_tsc'
   arch/x86/kernel/tsc.c:1527: warning: Excess function parameter 'cs' description in 'convert_art_ns_to_tsc'
   arch/x86/kernel/tsc.c:1561: warning: Function parameter or member 'work' not described in 'tsc_refine_calibration_work'


vim +1338 arch/x86/kernel/tsc.c

  1326	
  1327	/**
  1328	 * convert_tsc_to_art() - Returns ART value associated with system counter
  1329	 *
  1330	 * Converts input TSC to the corresponding ART value using conversion
  1331	 * factors discovered by detect_art()
  1332	 *
  1333	 * Return:
  1334	 * u64 ART value
  1335	 */
  1336	int convert_tsc_to_art(
  1337		const struct system_counterval_t *system_counter, u64 *art)
> 1338	{
  1339		u64 tmp, res, rem;
  1340	
  1341		if (system_counter->cs != art_related_clocksource)
  1342			return -EINVAL;
  1343	
  1344		res = system_counter->cycles - art_to_tsc_offset;
  1345		rem = do_div(res, art_to_tsc_numerator);
  1346	
  1347		*art = res * art_to_tsc_denominator;
  1348		tmp = rem * art_to_tsc_denominator;
  1349	
  1350		do_div(tmp, art_to_tsc_numerator);
  1351		*art += tmp;
  1352	
  1353		return 0;
  1354	}
  1355	EXPORT_SYMBOL(convert_tsc_to_art);
  1356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
