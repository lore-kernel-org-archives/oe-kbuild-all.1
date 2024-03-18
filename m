Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91E75A0E5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 17:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710783193; cv=none; b=obL5AstRKgMkI8lkWHoeA14mrZWTLV73bGhNZYfaaOlJE2U9vBh9M7XY7e4oO/kW43jb7RtYK8pIiWERqjakcLhaFtrL5eeaqUY6SY89CLfe0/PR2E6eUv1Ojj76vTK46km/Oc8feX72ehNOnNb4nhAU5CDJS1/uCWLigNQq/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710783193; c=relaxed/simple;
	bh=Y+B42Vd6BxQtwP25xZ8TjlaLc7d7rK69V7ypK9C9O+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EBurBtRHG9kbs+hu3xKKcU4+quED7eJ/O5ZjW2EdSpiV18maluJ1UoUW28RNjQZOaO89v4ivNB1cTH1VzCcghyPUhSzmU4yzO1OjIwTyQ27IzKwrbRfh0OgYawdkzZ2PXnjLw6kD/lSJry7uWYR1WkrefDIjX4LXlaFchpVFvVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UR8oQNr4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UR8oQNr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710783191; x=1742319191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y+B42Vd6BxQtwP25xZ8TjlaLc7d7rK69V7ypK9C9O+k=;
  b=UR8oQNr43cHxC00OF2ZMoMcvydJkWW+wIqG7/P56g08ok2ZVaHbmKJ9A
   hrxBsLRoST2IiMGBrsWylg56C6ECHPpXI1szygQKPkgHeIF30U1J27uNX
   sTZ/+GNsnlEEDHljucx4GZ/3eYuPBfS3JBcA9f3cYY5e8ls8eWU0hPg7E
   dJcEnGL3CaDQHa40fclaAb2t3daGxSjT43uzlrDtmGoEdcPFRDURsau75
   vXl4RI06fMVIuGjJr0HcI/cFJ/CZXb5RfcrWsePiDW4vv/21FVl3WVpFY
   I9FvWPE5YnA/c9K83Lf3XlDLkBKvhluG2W7heAVJPyzTWv+ZQrd9WQRI/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5744436"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5744436"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 10:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="14186056"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Mar 2024 10:33:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmGrC-000H8P-1P;
	Mon, 18 Mar 2024 17:33:06 +0000
Date: Tue, 19 Mar 2024 01:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:b-4.4-st50-rt48 22/395] drivers/misc/hwlat_detector.c:243:12:
 warning: comparison between signed and unsigned integer expressions
Message-ID: <202403190116.VFPv4Sig-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git b-4.4-st50-rt48
head:   9721fc7815f56adca91f657c671845e73f895763
commit: 7100b9238ae2e4b63d6a51400e20bceba8d0effd [22/395] hwlatdetect.patch
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240319/202403190116.VFPv4Sig-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403190116.VFPv4Sig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403190116.VFPv4Sig-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/list.h:4,
                    from include/linux/module.h:9,
                    from drivers/misc/hwlat_detector.c:41:
   arch/parisc/include/asm/uaccess.h: In function 'copy_from_user':
   arch/parisc/include/asm/uaccess.h:251:63: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
            if (likely(sz == -1 || !__builtin_constant_p(n) || sz >= n))
                                                                  ^
   include/linux/compiler.h:181:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   drivers/misc/hwlat_detector.c: In function 'get_sample':
>> drivers/misc/hwlat_detector.c:243:12: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (diff > sample)
               ^
   drivers/misc/hwlat_detector.c:246:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     } while (total <= data.sample_width);
                    ^~
   drivers/misc/hwlat_detector.c: In function 'debug_sample_fread':
   drivers/misc/hwlat_detector.c:748:10: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (len > cnt)
             ^


vim +243 drivers/misc/hwlat_detector.c

   212	
   213	/**
   214	 * get_sample - sample the CPU TSC and look for likely hardware latencies
   215	 * @unused: This is not used but is a part of the stop_machine API
   216	 *
   217	 * Used to repeatedly capture the CPU TSC (or similar), looking for potential
   218	 * hardware-induced latency. Called under stop_machine, with data.lock held.
   219	 */
   220	static int get_sample(void *unused)
   221	{
   222		ktime_t start, t1, t2;
   223		s64 diff, total = 0;
   224		u64 sample = 0;
   225		int ret = 1;
   226	
   227		start = ktime_get(); /* start timestamp */
   228	
   229		do {
   230	
   231			t1 = ktime_get();	/* we'll look for a discontinuity */
   232			t2 = ktime_get();
   233	
   234			total = ktime_to_us(ktime_sub(t2, start)); /* sample width */
   235			diff = ktime_to_us(ktime_sub(t2, t1));     /* current diff */
   236	
   237			/* This shouldn't happen */
   238			if (diff < 0) {
   239				pr_err(BANNER "time running backwards\n");
   240				goto out;
   241			}
   242	
 > 243			if (diff > sample)
   244				sample = diff; /* only want highest value */
   245	
   246		} while (total <= data.sample_width);
   247	
   248		/* If we exceed the threshold value, we have found a hardware latency */
   249		if (sample > data.threshold) {
   250			struct sample s;
   251	
   252			data.count++;
   253			s.seqnum = data.count;
   254			s.duration = sample;
   255			s.timestamp = CURRENT_TIME;
   256			__buffer_add_sample(&s);
   257	
   258			/* Keep a running maximum ever recorded hardware latency */
   259			if (sample > data.max_sample)
   260				data.max_sample = sample;
   261		}
   262	
   263		ret = 0;
   264	out:
   265		return ret;
   266	}
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
