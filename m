Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A513002B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 20:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529021; cv=none; b=H9qFbbrjviyUDhegppnDs1bzg94zOlknYdm3tzTNTQ4CML220ThTg8nQWTFFAgSjP1ZAomk4HLr7GMCkvnlsNJn+OvbelsLp8V9B6dBBVn3pvH5hNEWLBSb+iLiu4rXCc9qVcrNIfSFzBb4INTC2XgMFb+umwqKmHy8rhQ7ySJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529021; c=relaxed/simple;
	bh=/9+3xveCyIJ0MvsYhfsRuz53O2I+bMIX57g5fVWrsps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bBq6d+TO1qG927CFmOja3Mpyd9vulx8Bgnyy1GlD4TamxJb+6xx3VX6pEYAtorYkZ3mjsKKV+nYQ+DWuab8GvQzAWb1iX0NmfASW2o9vElAiCE2opy124K69eYzZqtE3ROAHk3Lc4a2sfdl41l7WYjtj2L+AaZrL+STz481h0dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdHOS7dd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdHOS7dd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785529019; x=1817065019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/9+3xveCyIJ0MvsYhfsRuz53O2I+bMIX57g5fVWrsps=;
  b=AdHOS7ddRAzpHXR3nvIp+S7zJGX7W1XSn+Dx4dF28jaJSzbElHRLgYei
   idylH48XByfecIZmLETzBBHhE2hkwQi1U7yDvL7cASf7XMtZ2MqfQvg5H
   4jfvLBWW+urOrzG9ZU0xZAhim2KRPvQJfw6NkLHbbW1tnglVKO9qHzP+3
   6KEAM9HO0BTjBEedbVzWKjif1hBd2A07XruIDmTgb049JyuCkjxPkdnfY
   yl4zpU6HTYug7ghlYyuvBfjdTkatgN50Thet4m84XQsFEMcOUQ1zrvIAQ
   u76XRkU22nSjgHOOWwjpOJYJHQEXQ2dw5KSZcoknGiuTmSiCCkRCo+fpa
   w==;
X-CSE-ConnectionGUID: V5CCmzNhQZWJC9AW9kLpEw==
X-CSE-MsgGUID: jk0e1AGyRhm/967eglkqOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="96516056"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="96516056"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 13:16:58 -0700
X-CSE-ConnectionGUID: WJZKdYKYQeeOMe5VUEycXQ==
X-CSE-MsgGUID: InUQH28mS7K2gunre7O4iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="285274984"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2026 13:16:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wptf5-000000002Ar-0avk;
	Fri, 31 Jul 2026 20:16:55 +0000
Date: Sat, 01 Aug 2026 04:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 32/55]
 kernel/time/time_test.c:183:16: error: implicit declaration of function
 'tk_aux_capture_mono_conv'
Message-ID: <202608010434.VsbM8KfG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   c2edf72f8ebcec4268393789859f789bb12ea5d0
commit: 56f649dd45f9cd0a5e11c8c45dcae8ac5572c67d [32/55] timekeeping: time_test: Add a test for auxiliary to monotonic clock conversions
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260801/202608010434.VsbM8KfG-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010434.VsbM8KfG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010434.VsbM8KfG-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/time_test.c: In function 'aux_mono_conv':
>> kernel/time/time_test.c:183:16: error: implicit declaration of function 'tk_aux_capture_mono_conv' [-Wimplicit-function-declaration]
     183 |         conv = tk_aux_capture_mono_conv(params->mono_base, mono_mult, params->aux_base, aux_mult, shift);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/time/time_test.c:183:16: error: incompatible types when assigning to type 'struct tk_aux_mono_conv' from type 'int'


vim +/tk_aux_capture_mono_conv +183 kernel/time/time_test.c

   168	
   169	static void aux_mono_conv(struct kunit *test)
   170	{
   171		const struct aux_mono_conv_test_case *params = test->param_value;
   172		u32 mono_mult, aux_mult, shift;
   173		struct tk_aux_mono_conv conv;
   174	
   175		if (__is_defined(MODULE) || !IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS)) {
   176			kunit_skip(test, "CONFIG_POSIX_AUX_CLOCKS is not reachable");
   177			return;
   178		}
   179	
   180		clocks_calc_mult_shift(&mono_mult, &shift, 1, 1, 200);
   181		aux_mult = mult_frac(mono_mult, 100 + params->speed_difference_percentage, 100);
   182	
 > 183		conv = tk_aux_capture_mono_conv(params->mono_base, mono_mult, params->aux_base, aux_mult, shift);
   184	
   185		for (size_t i = 0; i < ARRAY_SIZE(params->timestamps); i++) {
   186			ktime_t mono = params->timestamps[i].mono;
   187			ktime_t aux = params->timestamps[i].aux;
   188			kunit_info(test, "timestamp mono=%lld aux=%lld\n", mono, aux);
   189	
   190			ktime_t expected_aux = mult_frac(mono - conv.mono_base, 100 + params->speed_difference_percentage, 100) + conv.aux_base;
   191	
   192			KUNIT_ASSERT_EQ(test, aux, expected_aux);
   193	
   194			ktime_t converted_aux = ktime_mono_to_aux(mono, &conv);
   195			kunit_info(test, "converted_aux=%lld\n", converted_aux);
   196			KUNIT_EXPECT_GE(test, converted_aux, aux - 1);
   197			KUNIT_EXPECT_LE(test, converted_aux, aux + 1);
   198	
   199			ktime_t converted_mono = ktime_aux_to_mono(aux, &conv);
   200			kunit_info(test, "converted_mono=%lld\n", converted_mono);
   201			KUNIT_EXPECT_GE(test, converted_mono, mono - 1);
   202			KUNIT_EXPECT_LE(test, converted_mono, mono + 1);
   203		}
   204	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
