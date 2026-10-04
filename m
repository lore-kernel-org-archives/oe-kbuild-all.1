Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB60B3515D0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 13:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791120855; cv=none; b=rR3nfz16EbDiFV18bXOUKSMqjCGN75snGNCTkNz4ZKA2RKR4YXO7I652weUUIIcEAP3JKdPKqhWjd4oQrQJ8Ae41W+W1DGIKKZrKBnh/X3nNM83ZAexEYoCc/KUxYz9xTqSXYJuqzwMbn+32E+bBU9YchgyTuLZFNj6staWOAlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791120855; c=relaxed/simple;
	bh=u3Ctah6f0FGH+1vC1h45fvyzHQ59ydgV7/W6G+SQiVg=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6To0HlnCxFadWbMQF6ImQ4jdjLhcxAwIBnOosPVIp8lncOzqxvKQJNbMamRdws1OMctEZvzVdDq1sxz7ADiduIKwNUhumgG4kP/maVefTlKfzbEeMDi+GpK9xmWeeaYaNsF9BjiUSfnrB2MkRDXCqlrmV+Glo+02ZOt5RywrEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRl2gAKw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRl2gAKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791120853; x=1822656853;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=u3Ctah6f0FGH+1vC1h45fvyzHQ59ydgV7/W6G+SQiVg=;
  b=BRl2gAKwUEX9ahstq+9FwVhP+d51wV+Uzn/D1ZEfloKncEI54WWI++mQ
   fyCIddbbBKuY+GaKn6mL1BMkv3m8o0TuR7YN8AASODtAGfo9LP4Or+5W3
   /vHJa9UK5r6MpkjyDt1cvXXnSjJGVqiwQ198EQR6exuDwnC4Gf/wbLb8h
   LTVk3BjkoDzEiaIeykW9S3+M9ABYF9uyZYsy1cSsTKKK2wE56TwUSh7bR
   s0WlNWFDXi1GMc452+yceo6k+r/BCW5Zrw4M1DlEmKluNG5y4Fjr9Lyo1
   W0WxUXG0PcGjaAwIg8/jcNah5ZCuoIHscfpjPtThK/E86pz3guzg8Hw08
   g==;
X-CSE-ConnectionGUID: LIkzXAjST/6FC5x049jboA==
X-CSE-MsgGUID: veJt0tANSzGgBBwB6fzJAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90580311"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="90580311"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 06:34:13 -0700
X-CSE-ConnectionGUID: /4D6kVoGTCmJpdcMRw/RCQ==
X-CSE-MsgGUID: uS4LtThcTMWJvDQX6kSqyw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Oct 2026 06:34:12 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDMLy-00000000UmX-22dy
	for oe-kbuild-all@lists.linux.dev;
	Sun, 04 Oct 2026 13:34:10 +0000
Date: Sun, 4 Oct 2026 21:33:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: remoteproc: core: add KUnit tests for rproc_check_carveout_da()
Message-ID: <202610042130.ObA85SKb-lkp@intel.com>
References: <202610042130.ObA85SKb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610042130.ObA85SKb-lkp@intel.com>

Hi Sailesh,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Sailesh-Nandanavanam/remoteproc-core-add-KUnit-tests-for-rproc_check_carveout_da/20260927-225428
base:   
patch link:    https://lore.kernel.org/r/202610042130.ObA85SKb-lkp%40intel.com
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20261004/202610042130.ObA85SKb-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610042130.ObA85SKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610042130.ObA85SKb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/remoteproc/remoteproc_core.c:2847:
   drivers/remoteproc/tests/remoteproc_core-kunit.h: In function 'rproc_test_check_carveout_len_exceeds':
>> drivers/remoteproc/tests/remoteproc_core-kunit.h:34:1: warning: the frame size of 1728 bytes is larger than 1536 bytes [-Wframe-larger-than=]
      34 | }
         | ^
   drivers/remoteproc/tests/remoteproc_core-kunit.h: In function 'rproc_test_check_carveout_da_exceeds_end':
   drivers/remoteproc/tests/remoteproc_core-kunit.h:76:1: warning: the frame size of 1744 bytes is larger than 1536 bytes [-Wframe-larger-than=]
      76 | }
         | ^
   drivers/remoteproc/tests/remoteproc_core-kunit.h: In function 'rproc_test_check_carveout_da_negative_delta':
   drivers/remoteproc/tests/remoteproc_core-kunit.h:62:1: warning: the frame size of 1744 bytes is larger than 1536 bytes [-Wframe-larger-than=]
      62 | }
         | ^


vim +34 drivers/remoteproc/tests/remoteproc_core-kunit.h

     6	
     7	/*
     8	 * Tests for rproc_check_carveout_da().
     9	 *
    10	 * The function is static, so this header is #include'd directly at the
    11	 * bottom of remoteproc_core.c (see CONFIG_REMOTEPROC_KUNIT_TEST), giving
    12	 * it access to the symbol despite the lack of external linkage.
    13	 *
    14	 * rproc_check_carveout_da() only touches &rproc->dev for dev_err() on
    15	 * its failure paths, so a zeroed struct rproc is sufficient here -- no
    16	 * device registration needed. dev_err()'s formatting chain
    17	 * (dev_driver_string() -> "" on NULL driver/bus/class, dev_name() ->
    18	 * NULL on an unregistered device, and the kernel's own %s NULL guard
    19	 * in lib/vsprintf.c) is safe end-to-end against a bare zeroed device.
    20	 */
    21	
    22	static void rproc_test_check_carveout_len_exceeds(struct kunit *test)
    23	{
    24		struct rproc rproc = { 0 };
    25		struct rproc_mem_entry mem = { 0 };
    26		int ret;
    27	
    28		/* mem->len = 0x100; request len 0x200 with no da constraint */
    29		mem.da = FW_RSC_ADDR_ANY;
    30		mem.len = 0x100;
    31	
    32		ret = rproc_check_carveout_da(&rproc, &mem, FW_RSC_ADDR_ANY, 0x200);
    33		KUNIT_EXPECT_EQ(test, ret, -EINVAL);
  > 34	}
    35	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
