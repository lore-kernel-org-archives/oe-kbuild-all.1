Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B12181B86
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712781108; cv=none; b=p+4PVv4Ej4+BMLaOOwO8th3PyRnMPcv8PwmKewfLf6Riske/hFePPpnoIwdU5sCxqGWfY3cIWWpyH6MNN4eYvR5td8QESaAoZwy62ge8e2ngD4JnQiuj6KE4xfRBUzsC1TAWmP8CxPioWgYl+dFa0NmTxxIGBP4/hjmJBG5FOag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712781108; c=relaxed/simple;
	bh=vN42C8sEg1NsvK0ZaUlfajr3k7+VyFfHLqkQR88vrxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=usPH+7BN9TgFZMNNlWn1aeEunn4sXwSZkUZT79r2Gulq/BOK62JyeyAIn3H4e9/ridCZSZVGkAteYRMAyLBU6KAayRdN6XRhbSLq/g39OwDUlzqnBs6S2AliEYx+sIkJkApZir1rTZuOtrlOetPWg0Kr3E//okw86jrGsZvEPfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFAyAra2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFAyAra2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712781106; x=1744317106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vN42C8sEg1NsvK0ZaUlfajr3k7+VyFfHLqkQR88vrxU=;
  b=ZFAyAra2CAXOIaHG3a9oXBbo7BswgRcQvUyIGsJeat4gLU66Zlq6eH6K
   DrMxqj0/aY2dvYO9jEwCFnxC4QUoqoMMSo1l24jls13700LsFUOaRSOOX
   trLkS8ArxWpIfosxy5fNGvucLOjkYkuEO7bqBcOd4Ku+L6nWRTxsjXeus
   A38lgDPmocaiHBS8UMdusaCF2botV8heo1AS8IJs3Punwl2Ugceqia/9c
   XUBbNhUio9BUvMvkAdduznPhmBxA6viQpmhGuwUJ1q1HgkhBgFEPO3pbC
   2r/IQQfhO6vWlb9ID1xqD9e+u1PicSbOwv682vlgwuvxFXrqIxEBOMoZ3
   w==;
X-CSE-ConnectionGUID: RGPvZTJ7RPmySrjQtk2XsQ==
X-CSE-MsgGUID: Xu0hnrhTQiCz0V6yEO43VA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19319815"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="19319815"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 13:31:45 -0700
X-CSE-ConnectionGUID: le71WKzYQ7OEwBzEx19h4Q==
X-CSE-MsgGUID: yuHdJbFsT3iQQkb0+i3IeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="25337803"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2024 13:31:44 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruebc-0007mK-2v;
	Wed, 10 Apr 2024 20:31:40 +0000
Date: Thu, 11 Apr 2024 04:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 4/5] include/linux/page_counter.h:9:10:
 fatal error: asm/page_types.h: No such file or directory
Message-ID: <202404110442.CTlUDHZz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   dbe528dceca7fe608061c8686e00aa4d53042767
commit: 7fb104a83d94f08496291125374fdf7c49ea7baa [4/5] mm: memcg: merge multiple page_counters into a single structure
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240411/202404110442.CTlUDHZz-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110442.CTlUDHZz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110442.CTlUDHZz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/memcontrol.h:18,
                    from include/linux/bpf.h:31,
                    from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from init/main.c:21:
>> include/linux/page_counter.h:9:10: fatal error: asm/page_types.h: No such file or directory
       9 | #include <asm/page_types.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +9 include/linux/page_counter.h

     4	
     5	#include <linux/atomic.h>
     6	#include <linux/cache.h>
     7	#include <linux/limits.h>
     8	#include <asm/page.h>
   > 9	#include <asm/page_types.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
