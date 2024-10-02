Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7678E19E98C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 23:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727911606; cv=none; b=C9WqXQRXRlFCG1Odx+jYFnQOEJ/pE5paDmoWByQ9czpuTzfCAGeC+1rlmox2/uyYV04+QfLD33/Hn6UESzCSNFpaqDf2m05uEtBVYwvwF70lWkxizpiTYCR8xpev3FIOb3Kdl3EI320Wq92BF8TEaZYjz2HY37q+IXJwPk+xB5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727911606; c=relaxed/simple;
	bh=CSkiBof32ox8vnwEQR9hkXVmEnkU9IiN6WpJ2tciFpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rIIFkyF04bokHMEeMw1OpldSEVd8V5Jl1qs8D7D60cu1m+95w7f9II8tUUi3zZXgYAYL9sjhoBaDdKX0iqCZ2C5+k0S3vEPZ7iUeR8RiixMb1v+IBST0bv3EkStSCV5H7mq5rYr4awtiusgW7QMPfUijtArRA5LMkw9tn+Mq8Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ck5ho+9Y; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ck5ho+9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727911604; x=1759447604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSkiBof32ox8vnwEQR9hkXVmEnkU9IiN6WpJ2tciFpE=;
  b=Ck5ho+9YIesvhSEGOldNY0rtMs7e3ZnHws/7KROXy9C1Q99TKe52KmOm
   8Sgo5n9Ji+6L53kbheaoGF3ztTJmsAO9i9LKkpSSdKPJGdAcgW2sUtmy8
   LYwri5YSxRsgc/8bJm1NCS7pBO6GR/ODXz85N6DO5075oqM3IbUAqrwUf
   1ftOSHrmqHq55rf8XIOM01EZyffogQS8MT8xaKCEZ4R4BLyhApvbxGiBI
   b514h7YRrOkCaI4cYk73hGfI7cQ7HuO7F+Lz31upbeZY5jm4pIjvCLd8r
   2q6U5wSb5NZR+3rM8DZJtMjN0zOEoZcIwN0EYrACSOWHYri72yuwk3urp
   Q==;
X-CSE-ConnectionGUID: qti0Ij97S2eDDIg2hQbAyg==
X-CSE-MsgGUID: wiupTNNFQO6CgMi5Rv4qMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27188000"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="27188000"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 16:26:44 -0700
X-CSE-ConnectionGUID: vbx3O751QaOYzljnnOHVaA==
X-CSE-MsgGUID: 4u6lwcd3T0KDUa7D+98fTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74475004"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Oct 2024 16:26:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw8jw-000UgX-3A;
	Wed, 02 Oct 2024 23:26:40 +0000
Date: Thu, 3 Oct 2024 07:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:b-4.4-st56-rt51 21/395]
 include/trace/events/latency_hist.h:24:28: warning: comparison between
 signed and unsigned integer expressions
Message-ID: <202410030727.amSIf7p5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git b-4.4-st56-rt51
head:   83b6d202216c6d5a6a328dc895dd1b7005dedd92
commit: 9027e5f1dd0b96384d1661351434911520402768 [21/395] tracing: Add latency histograms
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20241003/202410030727.amSIf7p5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030727.amSIf7p5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030727.amSIf7p5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/ioport.h:12:0,
                    from include/linux/device.h:16,
                    from include/linux/node.h:17,
                    from include/linux/cpu.h:16,
                    from kernel/time/hrtimer.c:34:
   arch/parisc/include/asm/uaccess.h: In function 'copy_from_user':
   arch/parisc/include/asm/uaccess.h:251:63: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
            if (likely(sz == -1 || !__builtin_constant_p(n) || sz >= n))
                                                                  ^
   include/linux/compiler.h:181:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   In file included from include/trace/events/hist.h:7:0,
                    from kernel/time/hrtimer.c:56:
   include/trace/events/latency_hist.h: In function 'getaction':
>> include/trace/events/latency_hist.h:24:28: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (action >= 0 && action <= sizeof(actions)/sizeof(actions[0]))
                               ^~


vim +24 include/trace/events/latency_hist.h

    21	
    22	static inline char *getaction(int action)
    23	{
  > 24		if (action >= 0 && action <= sizeof(actions)/sizeof(actions[0]))
    25			return actions[action];
    26		return "unknown";
    27	}
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
