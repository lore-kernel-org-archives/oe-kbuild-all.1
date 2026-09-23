Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468F648E0E7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160611; cv=none; b=Yc0/frYbinLt2XGaS9MzFJKkBol/R3rTZsL0ln2LQX7VZ0LOOa3/pfbxzdSiMRBDtdaKp/NXarOg//GJ1MOZm57e9romWYGn9baHFD5HsOu9akM+2jhhPhlllyZoymSvOVpQjwu2AEK+kD1I3Z70Di6kRQh5aA79N0X+S5J1Hyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160611; c=relaxed/simple;
	bh=LbvxngA+HAmDGH3Bedz4WDupnR23pTa1jYax3zz1Y/E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WCoi6kIVigm4ayGKEzZtKxbhEYPaC02FlP4UKEJrYYmlYibHr70cS8UMk9iZxDduhMpELjYF3Izahw+7ncTDDbKVvfADybBVhNU5nQ/+nQs3A/QIKxC3dr9/BZFhAb6kJmiRZIlKn/yugvaSkCZLWUKc7yfwKIDbZH5tPH4XxHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbpUwJye; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbpUwJye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790160599; x=1821696599;
  h=date:from:to:cc:subject:message-id;
  bh=LbvxngA+HAmDGH3Bedz4WDupnR23pTa1jYax3zz1Y/E=;
  b=gbpUwJyeQ22MSTIrcyoW9hxpAy4eFni/snD4hYxVkNx1ssUmqzRao06Z
   xIxSTqS7esY/bCkKW15Bcn3TtjboG1lfpuiO+FmOMyRmuIfXoMI66PWtI
   S/9s945y29mjnmJqOiKSGZXqYS3gb/P+inR1SR6p6hk/BGihwsF1i6VED
   dlMDupYjPGDRbk/w+Y4MdJMed7+GK2Yt4aVNIWU6FEAF9LrQllxl9pwxV
   cYPVsGYhNcReiCN8/p8ddawr0RxtdYsoBpal54hJm8W2Xf3tE/tmx61e6
   AXia1ZUFKtwRTCm8VXqG/ZS4JzqAEnNuL1QcSbbe32gSvLbab/TcxDFM0
   g==;
X-CSE-ConnectionGUID: mEapzLyQQoCkk+JPZGYYbw==
X-CSE-MsgGUID: 6ZHMoDYOR+WX2GLCSfetBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90711146"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90711146"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 03:49:57 -0700
X-CSE-ConnectionGUID: 2cBmb97KQtubsGKlKHrArQ==
X-CSE-MsgGUID: aWfByoZ7Qv6ZMW4uId6lwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="270073613"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 03:49:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9KXx-00000000Gxe-2lWX;
	Wed, 23 Sep 2026 10:49:53 +0000
Date: Wed, 23 Sep 2026 18:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>
Subject: arch/powerpc/boot/decompress.c:132:15: error: implicit
 declaration of function '__decompress'
Message-ID: <202609231858.jAmde6KS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Raju,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: ee9241524b4682a34ed4b66d8c68c33304810b93 amd-xgbe: do not select NET_SELFTESTS when INET is disabled
date:   8 months ago
config: powerpc-randconfig-r1308-20260922 (https://download.01.org/0day-ci/archive/20260923/202609231858.jAmde6KS-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231858.jAmde6KS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ee9241524b46 ("amd-xgbe: do not select NET_SELFTESTS when INET is disabled")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231858.jAmde6KS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/boot/decompress.c: In function 'partial_decompress':
>> arch/powerpc/boot/decompress.c:132:15: error: implicit declaration of function '__decompress' [-Wimplicit-function-declaration]
     132 |         ret = __decompress(inbuf, input_size, NULL, flush, outbuf,
         |               ^~~~~~~~~~~~


vim +/__decompress +132 arch/powerpc/boot/decompress.c

1b7898ee276b39 Oliver O'Halloran 2016-09-22   97  
1b7898ee276b39 Oliver O'Halloran 2016-09-22   98  /**
1b7898ee276b39 Oliver O'Halloran 2016-09-22   99   * partial_decompress - decompresses part or all of a compressed buffer
1b7898ee276b39 Oliver O'Halloran 2016-09-22  100   * @inbuf:       input buffer
1b7898ee276b39 Oliver O'Halloran 2016-09-22  101   * @input_size:  length of the input buffer
930a77c3ad79c3 Zhang Jianhua     2021-05-10  102   * @outbuf:      output buffer
930a77c3ad79c3 Zhang Jianhua     2021-05-10  103   * @output_size: length of the output buffer
6efc2f1a64ef62 Yang Li           2024-04-08  104   * @_skip:       number of output bytes to ignore
1b7898ee276b39 Oliver O'Halloran 2016-09-22  105   *
1b7898ee276b39 Oliver O'Halloran 2016-09-22  106   * This function takes compressed data from inbuf, decompresses and write it to
1b7898ee276b39 Oliver O'Halloran 2016-09-22  107   * outbuf. Once output_size bytes are written to the output buffer, or the
1b7898ee276b39 Oliver O'Halloran 2016-09-22  108   * stream is exhausted the function will return the number of bytes that were
1b7898ee276b39 Oliver O'Halloran 2016-09-22  109   * decompressed. Otherwise it will return whatever error code the decompressor
1b7898ee276b39 Oliver O'Halloran 2016-09-22  110   * reported (NB: This is specific to each decompressor type).
1b7898ee276b39 Oliver O'Halloran 2016-09-22  111   *
1b7898ee276b39 Oliver O'Halloran 2016-09-22  112   * The skip functionality is mainly there so the program and discover
1b7898ee276b39 Oliver O'Halloran 2016-09-22  113   * the size of the compressed image so that it can ask firmware (if present)
1b7898ee276b39 Oliver O'Halloran 2016-09-22  114   * for an appropriately sized buffer.
1b7898ee276b39 Oliver O'Halloran 2016-09-22  115   */
1b7898ee276b39 Oliver O'Halloran 2016-09-22  116  long partial_decompress(void *inbuf, unsigned long input_size,
1b7898ee276b39 Oliver O'Halloran 2016-09-22  117  	void *outbuf, unsigned long output_size, unsigned long _skip)
1b7898ee276b39 Oliver O'Halloran 2016-09-22  118  {
1b7898ee276b39 Oliver O'Halloran 2016-09-22  119  	int ret;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  120  
1b7898ee276b39 Oliver O'Halloran 2016-09-22  121  	/*
1b7898ee276b39 Oliver O'Halloran 2016-09-22  122  	 * The skipped bytes needs to be included in the size of data we want
1b7898ee276b39 Oliver O'Halloran 2016-09-22  123  	 * to decompress.
1b7898ee276b39 Oliver O'Halloran 2016-09-22  124  	 */
1b7898ee276b39 Oliver O'Halloran 2016-09-22  125  	output_size += _skip;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  126  
1b7898ee276b39 Oliver O'Halloran 2016-09-22  127  	decompressed_bytes = 0;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  128  	output_buffer = outbuf;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  129  	limit = output_size;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  130  	skip = _skip;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  131  
1b7898ee276b39 Oliver O'Halloran 2016-09-22 @132  	ret = __decompress(inbuf, input_size, NULL, flush, outbuf,

:::::: The code at line 132 was first introduced by commit
:::::: 1b7898ee276b39e54d870dc4ef3374f663d0b426 powerpc/boot: Use the pre-boot decompression API

:::::: TO: Oliver O'Halloran <oohall@gmail.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
