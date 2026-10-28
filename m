Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188254;
	b=PxFt3k5IaphKlKPcWcUxxHuyVyYyYK98h2371fQuAeh096Hw8qpHnqDhhZpZxchtpH6L
	 YbZ5JvqpCqYhHQx9n76gBqnxWtOjNXSU/h4eUm+WUysSIA66I/s5y3WQAaNl5lAMDzL9/
	 1WFAgLH1QIPTwkqvD1ZRauyJbTY/CKSOfnQiesXSVCNdrmHxXothfMqeGao9vLGJi12LE
	 68Jff11Y7XhHLDINZiDGjV66je/A0YppFF9snyvCrxPcqUhclMwZ4oRIiDRObIMU21fju
	 2FebIFceRKXcvHv26IFauCZnA/1yrD53jdvil6pmOsjwManr0OkM+csiZxSmQhVYfmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188254;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ILmpU58pn4WuCrk5c+ZzrCDkwfHX/pWceOAKGTCwoeg=;
	b=2dwArvCV0w9+3beKK6026VeJ3SzU4FhcUehb2FQsdzV8y8/rdCyhROJCTIaOd2y49pi4
	 jeBuKamCNbj8kKEONlUoJTKsZB/zQGQnuyJb88Dd4gw8m9agvOo19hh4qIATSzwdaIzm7
	 akWOu92f0ANkNDtX1d+/3AbWjQvHXxgkSon77ioAZFMd1zjiDup/4hmFMkPR+hva5ntV7
	 KWJouoRJDOVKAyLOx0ThOc5z8smCfSB4BGvVw1VTSKx2ExTAJNUiXdc8UqQ+/WiSgzqEp
	 BuTs02aDGgylBjfRoPi1WadCOlEsgijC1aDT5CDGTnXfCcYVgH6kE8YT4CZh+/vU8JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iZ+r61mM;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D36606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 11:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D36606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iZ+r61mM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793188253; x=1824724253;
  h=date:from:to:cc:subject:message-id;
  bh=Fap8A0K/pq09M8ngCkU77UUGwSY5wif0sxpAl/bixGs=;
  b=iZ+r61mMQ1fL2HWo3Dzni75jrF25bDURjfo2PG2h2pjPcWDvIodWUXM2
   1hXh4CWMnnyUfIAi019GPG3qBCNGPK+03VfrzfZXg50LeHtU2W07+kiAy
   P0Hum1q9njdmbpno+/pPi0yI+fqJVpY9liMMyTax5BOX8aaEtSI9qVd++
   uepbaktAC+50hlwgbDOgm/Qa7Y436SFPqtEeBE7hBpqct/Ms1ERDeD2Gk
   DgCdl1pGGYWcnl2nFPzVWJqah1MyB7KPnqpqy9PDQRXOLZkCEsYXRczsf
   iXbIgSqODu5tWORBbULQuzO2vIQstrXrA8+KTkeBCOhNdSno7pwa0HMMl
   Q==;
X-CSE-ConnectionGUID: gEidXyptTemci0BCm9umZQ==
X-CSE-MsgGUID: 4MA0DQxHRuSwfHCVFq/Ozg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="2010958"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="2010958"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 04:50:52 -0700
X-CSE-ConnectionGUID: 9QPSfoenRMWbAse+SO7Ejg==
X-CSE-MsgGUID: ldhubrL1TKSF6jHS1lGGyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4829926"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Oct 2026 04:50:51 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM2B6-000000004r5-3WO1;
	Wed, 28 Oct 2026 11:50:48 +0000
Date: Wed, 28 Oct 2026 12:49:50 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 353/353]
 kernel/delayacct.c:282:5: sparse: sparse: symbol 'delayacct_enabled' was not
 declared. Should it be static?
Message-ID: <202610281254.MfZWz7II-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   0951885c34a0e48adda08777b026c61fed9613ea
commit: 35bb2c8c5fd3f623e062757cd943617efa29a172 [353/353] ANDROID: Add vendor_hooks to workaround CONFIG_TASK_DELAY_ACCT
config: arm-randconfig-r2303-20261026 (https://download.01.org/0day-ci/archive/20261028/202610281254.MfZWz7II-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281254.MfZWz7II-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281254.MfZWz7II-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/delayacct.c:282:5: sparse: sparse: symbol 'delayacct_enabled' was not declared. Should it be static?

vim +/delayacct_enabled +282 kernel/delayacct.c

   281	
 > 282	int delayacct_enabled __read_mostly;	/* Delay accounting turned on/off */
   283	bool get_delayacct_enabled(void)
   284	{
   285		return delayacct_enabled;
   286	}
   287	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
