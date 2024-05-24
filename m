Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDF43C47C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716584783; cv=none; b=ndL0QdYlrGNX/N1XgeWkUQl7/pWAXiFZzsgZij52KtDDXLr3A/1IlDfIjM0ZsQM1/+plQEvOL76DlA9t3o80/WR5qwKQh5FAHlGdatEWFCcpxGP5dzeLuVJrnu6EVJG+IGe1srKBQJoscCM1g9S8DKzCsYjKqqcQMQUhDECUxC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716584783; c=relaxed/simple;
	bh=CjGfBB22iphYI1f5ANj9jaGrrd9D1ujwfhyN44NDopE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ihu/+Eg4zBub2ghGjeHwj1foHfpzs/MKNbxp/LYMmxxnFGVvQljY8QZve+B+ZJCK5g39la6XrOebrblIDU4w6rJJf4spLpbzhp2MciLKY5qNeOD6Y+mlkPEfurnn+ssnIm1AHDNJo5FANVjLHfia3JjhpZkTqJSk11yQ2HVVshc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bND0tYQL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bND0tYQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716584782; x=1748120782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CjGfBB22iphYI1f5ANj9jaGrrd9D1ujwfhyN44NDopE=;
  b=bND0tYQLZGl38aKt14rE5bACUdmfX89nwcJX5HWGf9DTfIhzkuM1UL+l
   IRTrqPwJS2yloik6tO1lCpTPAv/3zg9eDvv9e6Q5bpPOJRHhIsA8D5SlU
   XhGL3ugWk5NZh0ePWhUh7GQqDsyAJqpHIlE7te91ZFRL7715+hCkDYZpo
   1qs3ZSrpOea7QuKcxY1EtFVdjwrI5ZzAYMZ0si88R83NBInvkpnTopsbA
   J/aTs7CtUTGFKEVUcma1Mr51o+ap19Z14X3ZWijxJfMMo7SUFh4P6aaQJ
   bcQZAiN+4MGWhpFnDh0n/j2+b5SqQkE3NXTA+Dsk/0tBo+fCvdQAS2xH1
   g==;
X-CSE-ConnectionGUID: 7U9/VjYJSMiex9rruU+IfQ==
X-CSE-MsgGUID: Es3Kv70NQVKVDENjVqvU/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="11686856"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="11686856"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 14:06:22 -0700
X-CSE-ConnectionGUID: go8+cP5ZRXqGVRmEwmy+OQ==
X-CSE-MsgGUID: Kyz3W/pRSeCDDR5roNaDSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34232213"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 May 2024 14:06:20 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAc75-0005un-1V;
	Fri, 24 May 2024 21:06:11 +0000
Date: Sat, 25 May 2024 05:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, David Lechner <dlechner@baylibre.com>
Subject: [dlech:iio-add-ext-scan-type-and-ad3780 12/16]
 drivers/iio/adc/ad7380.c:488: warning: Function parameter or struct member
 'ratio' not described in 'check_osr'
Message-ID: <202405250516.toBHIVrU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dlech/linux iio-add-ext-scan-type-and-ad3780
head:   c0a613b1805b6ef1c8f24ca4ecff9ed854a885f8
commit: 0cb0769301d1d72f72e3bcb4ceb437879aec6c86 [12/16] iio: adc: ad7380: add oversampling support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240525/202405250516.toBHIVrU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250516.toBHIVrU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250516.toBHIVrU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/ad7380.c:488: warning: Function parameter or struct member 'ratio' not described in 'check_osr'


vim +488 drivers/iio/adc/ad7380.c

   476	
   477	/**
   478	 * check_osr - Check the oversampling ratio
   479	 * @available_ratio: available ratios's array
   480	 * @size: size of the available_ratio array
   481	 * ratio: ratio to check
   482	 *
   483	 * Check if ratio is present in @available_ratio. Check for exact match.
   484	 * @available_ratio is an array of the available ratios (depending on the oversampling mode).
   485	 * The indices must correspond with the bit value expected by the chip.
   486	 */
   487	static inline int check_osr(const int *available_ratio, int size, int ratio)
 > 488	{
   489		int i;
   490	
   491		for (i = 0; i < size; i++) {
   492			if (ratio == available_ratio[i])
   493				return i;
   494		}
   495	
   496		return -EINVAL;
   497	}
   498	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
