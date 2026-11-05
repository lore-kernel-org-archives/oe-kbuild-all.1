Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870466;
	b=ZUE44SFmK2O8bErxiBTiipbOI9Uzl9aOgPkQBOqxvtM7cvgYxDmtwsO9oyKgrNtJkuvf
	 Ksoc0pkfeNtPrbguC28p0TQVQt8oSZrFben3U7IkjlNzA9kFdXgOAflsFfZPqkmTjb/jp
	 EjP2Lht3Q0yJkD+0OGcdtRUhcXTv5O90j0obPdj+hDi57HjrIxp9lTwteEQnKprJuyld2
	 idQbX61HAEZ7wdd3Beq+pQI0IZmZBa7AzJjeT/ka03Qzh4wgkyREWTHU8BDtGdAC7Y8IE
	 UacDfYfDkKlXtKtVmVZcsG0Dudps9UiKjfcqen+KCJrrXOtwud6TOAiUcQS2VriZ8Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870466;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rCKQHBjZhBounF1dl0C2yR+KBRCSrVTo4EeqbVkEGaE=;
	b=3PQf8M7O7+V7X31WnwPe28PGpDonMWTSijQLgbFzfxu/fklH3VMrDCrdLV3h3rUy8+bC
	 99/sPrFH/21HNKN4jO1QneyJOEa0+jeCox7v+ze+M0fHKNtIPLKyRPsENOeiMvhCc6WGp
	 Ye7bDhobfh+d/9hNtP6uk7XqcWFVI+4D5xV1gjc1CX9IGGnIIW9se3niGE07o+nH+yVCB
	 vm1cfUJov/EPjxNDICYzv9aXbi6oMyV7hR7X6hsgWRfulfQzBIrcJhgphI+5yLORqPea5
	 dmkRioiknb0z1nHD7bGy7fC6hzseq/vM0Ezy944PYNO0vxLRWO0edL8VYA8UHqIzz8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vu2ZXkol;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782EA606A328
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 09:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 782EA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vu2ZXkol
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793870466; x=1825406466;
  h=date:from:to:cc:subject:message-id;
  bh=qg8X/qN0rRVu+ja6wPygg0ZcQmUMvzzTs9jlysOzqR4=;
  b=Vu2ZXkolezcNrO1eRJzqxjlA/2LN0YspnX0yIsKZsceT8AR2iHzaZrA4
   md67fh8dPuihxdglHCn1HeazthCbPr/bO1T7muktoMJDkEza1wFsHFYtZ
   JmuNo/EzHTQhpFMsCwL1baY9r07lvoA6e3mK7Tj5kg2gBKF7WKQuq8klD
   YBTkvWrQ1e5ji1uO6lTV4caO8he869bFSnFT++RnGNPATnGvY966V1H5r
   twGUwkhDJMNO3uBaDYfnr3W+DJQbqc6EaNrffOC4iTxAXLZmb/ii5/CuQ
   Y4gVBZS0lpNkFaGKgXY4gwbvCA+ZB20uSAcbt1R9Y5moMCICJRvdjpaXY
   g==;
X-CSE-ConnectionGUID: E07CpyzlS5enK86RqBN/1w==
X-CSE-MsgGUID: 7VeAKPLgRAKdSv2aGCYKhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2535068"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2535068"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:21:05 -0800
X-CSE-ConnectionGUID: X0Z5zB6ITTivWRr7x4v3MQ==
X-CSE-MsgGUID: rV/DU7z/RqmynBrIcxGWHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6973805"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2026 01:21:03 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOteX-000000009bl-1HTn;
	Thu, 05 Nov 2026 09:21:01 +0000
Date: Thu, 05 Nov 2026 10:20:35 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-09 1/1]
 include/trace/hooks/topology.h:19:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202611051028.Hugs6scb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-09
head:   ecdaacc9a0ee87eaf9544e1836d86bd9d590312e
commit: 616412c9b51622dbdedbb6641c857f4044430e1d [1/1] ANDROID: topology: Add restricted vendor hook for cpu_capacity_show
config: x86_64-randconfig-r2309-20261105 (https://download.01.org/0day-ci/archive/20261105/202611051028.Hugs6scb-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051028.Hugs6scb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051028.Hugs6scb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/base/topology.c: note: in included file:
>> include/trace/hooks/topology.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/topology.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/topology.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +19 include/trace/hooks/topology.h

    13	
    14	DECLARE_HOOK(android_vh_arch_set_freq_scale,
    15		TP_PROTO(const struct cpumask *cpus, unsigned long freq, unsigned long max,
    16			unsigned long *scale),
    17		TP_ARGS(cpus, freq, max, scale));
    18	
  > 19	DECLARE_RESTRICTED_HOOK(android_rvh_cpu_capacity_show,
    20		TP_PROTO(unsigned long *capacity, int cpu),
    21		TP_ARGS(capacity, cpu), 1);
    22	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
