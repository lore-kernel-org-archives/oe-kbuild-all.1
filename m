Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659AE3C8717
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 01:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785805725; cv=none; b=Y5NGgkuSjgDUTY+0R4yeIjGF17THBmKLn+YsGzLxtkWDMCv2OxiDRrbw//4EEIRlHLTAnKsLxoZzb1IBU7/CSmOZdPCGgdsODjYGuDAOwrIs3D4dAAPMJQgxBZW2jw9yKJW9Hvj9ukS0B1VuUX7Lq3tkpbwyPB7LGE0afJsDb7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785805725; c=relaxed/simple;
	bh=ir5h9lTNGcaLQrIdPydveOJ36xGXfJkfYeG2cuWAPGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l7hC6OQOTRqH2pIi7IFbEaBpAcAQmysA67DMukHO4Qoa9F2ROopPAeN2jqQW7qMFxnvCyKNEHD/lUSZTZ/7u1yNRiXmnRE5Qh6Bp3gQnb/vRhCeVyuwk13Cy9xw5DkSoxBctO58s33wArColxRGn/jDpMKcvzihwCJ9FZ+fsooI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1mRAk65; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1mRAk65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785805724; x=1817341724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ir5h9lTNGcaLQrIdPydveOJ36xGXfJkfYeG2cuWAPGo=;
  b=I1mRAk65AJ17sW1PtpuEjiboyClhS0oikBFvHcwt4Q8Ph6x/GhjUlDmd
   KcM9eATeTw/2FhOclVBw4oXUdhvGpGhgEGSlW8T3tX2bf5qUpbcragFzJ
   2GIYUYViX5NW5It5VqLu9bNFBZqWBbbtRgTkpmSF6eWCmOpe6/2O9X14P
   h45jYHpVZP6zXz82y+I8J8nAirEzkIklq2wOyJ2Z+nsY53xRX2b/gAUE2
   pZOWuU7fvrEYKzIVltIBAdRsY/yqR+up3NkFUkkzd8wjTrZTfHwVZkbVM
   5q8ncZfMbi5UZRaB2wzcuqxR/qtqiz1RxN0yanq6KI0iAdmRtaft74RiF
   w==;
X-CSE-ConnectionGUID: VLPPhMCZTeuUSXhvLxa3xQ==
X-CSE-MsgGUID: OqVoBsKnSKaXQN75ihcjRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="88877777"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="88877777"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 18:08:44 -0700
X-CSE-ConnectionGUID: wLKpq/DbSMS6fZxwvxrW5Q==
X-CSE-MsgGUID: TFfsF3C4SpuuxgyJJz/wKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="258020331"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Aug 2026 18:08:43 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr3e4-000000008Yv-2s4Z;
	Tue, 04 Aug 2026 01:08:40 +0000
Date: Tue, 04 Aug 2026 09:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 32/55]
 kernel/time/time_test.c:193:undefined reference to `__divdi3'
Message-ID: <202608040944.ACEBO7tC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   60f852175b99dee11b414f69b62ce55ccc72fa20
commit: f9e58884873c10cac3de20f1c51911350553a35e [32/55] timekeeping: time_test: Add a test for auxiliary to monotonic clock conversions
config: m68k-randconfig-r073-20260804 (https://download.01.org/0day-ci/archive/20260804/202608040944.ACEBO7tC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040944.ACEBO7tC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608040944.ACEBO7tC-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/time/time_test.o: in function `aux_mono_conv':
>> kernel/time/time_test.c:193:(.text+0x1d0): undefined reference to `__divdi3'
>> m68k-linux-ld: kernel/time/time_test.c:193:(.text+0x20a): undefined reference to `__moddi3'
>> m68k-linux-ld: kernel/time/time_test.c:193:(.text+0x234): undefined reference to `__divdi3'


vim +193 kernel/time/time_test.c

   168	
   169	static void aux_mono_conv(struct kunit *test)
   170	{
   171		const struct aux_mono_conv_test_case *params = test->param_value;
   172		u32 mono_mult, aux_mult, shift;
   173		struct tk_aux_mono_conv conv;
   174	
   175		if (!IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS)) {
   176			kunit_skip(test, "CONFIG_POSIX_AUX_CLOCKS is not enabled");
   177			return;
   178		}
   179	
   180		clocks_calc_mult_shift(&mono_mult, &shift, 1, 1, 200);
   181		aux_mult = mult_frac(mono_mult, 100 + params->speed_difference_percentage, 100);
   182	
   183		conv = tk_aux_capture_mono_conv(params->mono_base, mono_mult, params->aux_base, aux_mult,
   184						shift);
   185	
   186		for (size_t i = 0; i < ARRAY_SIZE(params->timestamps); i++) {
   187			ktime_t mono, aux, expected_aux, converted_mono, converted_aux;
   188	
   189			mono = params->timestamps[i].mono;
   190			aux = params->timestamps[i].aux;
   191			kunit_info(test, "timestamp mono=%lld aux=%lld\n", mono, aux);
   192	
 > 193			expected_aux = mult_frac(mono - conv.mono_base,
   194						 100 + params->speed_difference_percentage,
   195						 100) + conv.aux_base;
   196	
   197			KUNIT_ASSERT_EQ(test, aux, expected_aux);
   198	
   199			converted_aux = ktime_mono_to_aux(mono, &conv);
   200			kunit_info(test, "converted_aux=%lld\n", converted_aux);
   201			KUNIT_EXPECT_GE(test, converted_aux, aux - 1);
   202			KUNIT_EXPECT_LE(test, converted_aux, aux + 1);
   203	
   204			converted_mono = ktime_aux_to_mono(aux, &conv);
   205			kunit_info(test, "converted_mono=%lld\n", converted_mono);
   206			KUNIT_EXPECT_GE(test, converted_mono, mono - 1);
   207			KUNIT_EXPECT_LE(test, converted_mono, mono + 1);
   208		}
   209	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
