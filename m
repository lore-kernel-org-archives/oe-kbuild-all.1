Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB83E241668
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754295895; cv=none; b=UdpZnJbdQQbiGRANwrXliTOE5d6EN4IOzWBUmKhgzq1M4ea7PqUP3oKAzFNZd39hc73q6Z6x2rWm8OMDip1wwjfa0oRlBljrxKMxIdvCsqS1u2mLNTlDshA96kfV0F/oucAc627yaAaXAkp4gHvSymeSl/iq+AGjV9bli7EftA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754295895; c=relaxed/simple;
	bh=CL4iU7U7wWZMZs0L0uYvNdQ7vhjJkXHnHJGHtlqaLjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L7gy8L29rAVr2OJrXJfL417eKuRF9eaIG6olRqAFxOn2oOLKvfjYOI9kS5nI//ita6thsbbKiWuUEjU+K/sYuZk83rXpw2WkAS6Hc+Loz+n90pCKJSTD41auzGGikVEoE1kwAnuZJnTmayBAA/ylmsFTd91bVbCoRHl+o6wLH3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iP0XAEiC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iP0XAEiC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754295894; x=1785831894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CL4iU7U7wWZMZs0L0uYvNdQ7vhjJkXHnHJGHtlqaLjg=;
  b=iP0XAEiC4j/Jw8mG3wbGsi1Xwl0n+gHaHGNxen2RvY6/x2E8RbhLU5od
   m/I0bCBER5rln1xSLhSOEnIGVGisxCu/u4mCGz5KvLI2okW85NK/1CM32
   dajtbki9Ft2uan9FnQULcwGwfoMk4Kps0E2RF3bszmyVS30MmZz9OArJq
   II1eZLXHgt3sZMRc0J0KN7Sg4mnwLF+KbZbmqFsL14ms1/vClqnWQ0GCw
   7rACeR3vudQem9mjkD1+SAn8XKqOZp50Ugm7vmqaQ6UyvgMaBS/Z6twfr
   S86bomqiKgR6Yw3/zyY2GsfwBJkjtH1ImYg0qklW9oM6Gx898jCfNl48r
   g==;
X-CSE-ConnectionGUID: gHOqVTr0QU20lH9vWT556A==
X-CSE-MsgGUID: wCDzGmtrSR2zLwUCoczBTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56632958"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56632958"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 01:24:54 -0700
X-CSE-ConnectionGUID: N6Q4yeQQTia8IKc0d7/sJw==
X-CSE-MsgGUID: DnRorSzAR8W4XrE69RlpSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="201279922"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 04 Aug 2025 01:24:53 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiqV0-0001kp-21;
	Mon, 04 Aug 2025 08:24:50 +0000
Date: Mon, 4 Aug 2025 10:24:40 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743] arch/x86/kernel/tsc.c:61:1:
 warning: 'inline' is not at beginning of declaration
Message-ID: <202508041025.pObzdAyL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ba07135cf74b1424e2f7f0c60e59c5b206ab320c
commit: 4907c68abd3f60f650f98d5a69d4ec77c0bde44f [1743/1743] x86/tsc: Force inlining of cyc2ns bits
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250804/202508041025.pObzdAyL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041025.pObzdAyL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041025.pObzdAyL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/tsc.c:61:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
      61 | void __always_inline cyc2ns_read_begin(struct cyc2ns_data *data)
         | ^~~~
   arch/x86/kernel/tsc.c:78:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
      78 | void __always_inline cyc2ns_read_end(void)
         | ^~~~
   arch/x86/kernel/tsc.c:1497:15: warning: no previous prototype for 'calibrate_delay_is_known' [-Wmissing-prototypes]
    1497 | unsigned long calibrate_delay_is_known(void)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/tsc.c:1236: warning: Excess function parameter 'cycles' description in 'convert_art_ns_to_tsc'
   arch/x86/kernel/tsc.c:1236: warning: Excess function parameter 'cs' description in 'convert_art_ns_to_tsc'
   arch/x86/kernel/tsc.c:1270: warning: Function parameter or member 'work' not described in 'tsc_refine_calibration_work'


vim +/inline +61 arch/x86/kernel/tsc.c

    60	
  > 61	void __always_inline cyc2ns_read_begin(struct cyc2ns_data *data)
    62	{
    63		int seq, idx;
    64	
    65		preempt_disable_notrace();
    66	
    67		do {
    68			seq = this_cpu_read(cyc2ns.seq.sequence);
    69			idx = seq & 1;
    70	
    71			data->cyc2ns_offset = this_cpu_read(cyc2ns.data[idx].cyc2ns_offset);
    72			data->cyc2ns_mul    = this_cpu_read(cyc2ns.data[idx].cyc2ns_mul);
    73			data->cyc2ns_shift  = this_cpu_read(cyc2ns.data[idx].cyc2ns_shift);
    74	
    75		} while (unlikely(seq != this_cpu_read(cyc2ns.seq.sequence)));
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
