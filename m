Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7070138425E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 11:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350967; cv=none; b=FoPoUQwhMw+9zPYGBJ/zADrX94r6aZRKVw2SoxLSPw59ZPeocGb7rBMTSx0sgDQSHWAFeemsivJyZoTsKYgv8vE1Eru6rJeU6T2eSwnJpp8AoORIIulcs3pENNZLf/mjk8E5c218tCFhzsNlqXqDwRjvGCZ5k4kX55cuUoN/c0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350967; c=relaxed/simple;
	bh=W5xG8FsbpYOY+6P8u6mUxrhYnlt5iJRSAfHXu+YRDrM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qwx97Gtx09BdJ7at15Bfn7nmiZ18V9OTY4988cClhmPASv6CsDitRlxUUXRl16GtbTUmme5cdPfNyUMrb5y+4IGpr68STI+hTPePWn33P1EHWGXJdV2nBxUa3dIbONXieQoIpVZ2GCvv1H/dYb9Xh1y0fqjRHUwstA0H5Yyl2Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSwur8g9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSwur8g9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774350966; x=1805886966;
  h=date:from:to:cc:subject:message-id;
  bh=W5xG8FsbpYOY+6P8u6mUxrhYnlt5iJRSAfHXu+YRDrM=;
  b=dSwur8g9sY4vdFWHZ6Lbz7Mnh/Z1QKp1+FRYe68va9cwx9Wt986Ez2iz
   GtiMFVy5twvTXRMzFhjF4DwFbr2fsVEdD9rse/teQL/EmC7J+Ss3F7op4
   RWzQ3DQTzzOIyFyxUEya+SmFjAJPvcDGBh+VVGy5Ihlzs6W+pqd3iJ9n+
   5c7TZDFf8/Zs6NZTjv2S8d2FJzBFXFCk3YiAYRw6uUPDRKqJEH/yYVTkU
   7ycK+0iJkAAPAEIzDtUSz04NqPhVP3sILuh0nkYkSiuh5j+zNj9IWmutA
   o0Y7xKEMB+fhQf0CmwmXiqttmxJ1bUksKOHt9u5t6+XNu4f0+4brkLN5i
   Q==;
X-CSE-ConnectionGUID: Erini36eSsObE4JfZg/p9A==
X-CSE-MsgGUID: QY3UZssLSsqlGljSS/XkOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="77966919"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="77966919"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:16:05 -0700
X-CSE-ConnectionGUID: 6xnkvWuHSW+v5XdQ57Sx3g==
X-CSE-MsgGUID: nbDRILggS3u4ilNB+fwHMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224324875"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 04:16:03 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4zjs-000000004TT-09wk;
	Tue, 24 Mar 2026 11:16:00 +0000
Date: Tue, 24 Mar 2026 19:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Frank Li <Frank.Li@nxp.com>
Subject: [xilinx-xlnx:master 96/176]
 arch/sparc/include/asm/io.h:16:9: warning: 'readw_be' redefined
Message-ID: <202603241944.13w59vcj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: bf04a97202b1b3cf81cfbfcb93ddf253572499ff [96/176] asm-generic/io.h: Add big-endian MMIO accessors
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20260324/202603241944.13w59vcj-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241944.13w59vcj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241944.13w59vcj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sparc/include/asm/hardirq_32.h:11,
                    from arch/sparc/include/asm/hardirq.h:7,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from include/linux/perf_event.h:52,
                    from arch/sparc/mm/fault_32.c:22:
>> arch/sparc/include/asm/io.h:16:9: warning: 'readw_be' redefined
      16 | #define readw_be(__addr)        __raw_readw(__addr)
         |         ^~~~~~~~
   In file included from arch/sparc/include/asm/io_32.h:21,
                    from arch/sparc/include/asm/io.h:7:
   include/asm-generic/io.h:304:9: note: this is the location of the previous definition
     304 | #define readw_be readw_be
         |         ^~~~~~~~
>> arch/sparc/include/asm/io.h:17:9: warning: 'readl_be' redefined
      17 | #define readl_be(__addr)        __raw_readl(__addr)
         |         ^~~~~~~~
   include/asm-generic/io.h:319:9: note: this is the location of the previous definition
     319 | #define readl_be readl_be
         |         ^~~~~~~~
>> arch/sparc/include/asm/io.h:19:9: warning: 'writel_be' redefined
      19 | #define writel_be(__w, __addr)  __raw_writel(__w, __addr)
         |         ^~~~~~~~~
   include/asm-generic/io.h:363:9: note: this is the location of the previous definition
     363 | #define writel_be writel_be
         |         ^~~~~~~~~
>> arch/sparc/include/asm/io.h:20:9: warning: 'writew_be' redefined
      20 | #define writew_be(__l, __addr)  __raw_writew(__l, __addr)
         |         ^~~~~~~~~
   include/asm-generic/io.h:351:9: note: this is the location of the previous definition
     351 | #define writew_be writew_be
         |         ^~~~~~~~~
--
   In file included from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sparc/include/asm/hardirq_32.h:11,
                    from arch/sparc/include/asm/hardirq.h:7,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/pagemap.h:11,
                    from arch/sparc/mm/srmmu.c:15:
>> arch/sparc/include/asm/io.h:16:9: warning: 'readw_be' redefined
      16 | #define readw_be(__addr)        __raw_readw(__addr)
         |         ^~~~~~~~
   In file included from arch/sparc/include/asm/io_32.h:21,
                    from arch/sparc/include/asm/io.h:7:
   include/asm-generic/io.h:304:9: note: this is the location of the previous definition
     304 | #define readw_be readw_be
         |         ^~~~~~~~
>> arch/sparc/include/asm/io.h:17:9: warning: 'readl_be' redefined
      17 | #define readl_be(__addr)        __raw_readl(__addr)
         |         ^~~~~~~~
   include/asm-generic/io.h:319:9: note: this is the location of the previous definition
     319 | #define readl_be readl_be
         |         ^~~~~~~~
>> arch/sparc/include/asm/io.h:19:9: warning: 'writel_be' redefined
      19 | #define writel_be(__w, __addr)  __raw_writel(__w, __addr)
         |         ^~~~~~~~~
   include/asm-generic/io.h:363:9: note: this is the location of the previous definition
     363 | #define writel_be writel_be
         |         ^~~~~~~~~
>> arch/sparc/include/asm/io.h:20:9: warning: 'writew_be' redefined
      20 | #define writew_be(__l, __addr)  __raw_writew(__l, __addr)
         |         ^~~~~~~~~
   include/asm-generic/io.h:351:9: note: this is the location of the previous definition
     351 | #define writew_be writew_be
         |         ^~~~~~~~~
   arch/sparc/mm/srmmu.c: In function 'poke_hypersparc':
   arch/sparc/mm/srmmu.c:1082:32: warning: variable 'clear' set but not used [-Wunused-but-set-variable]
    1082 |         volatile unsigned long clear;
         |                                ^~~~~


vim +/readw_be +16 arch/sparc/include/asm/io.h

21dccddf45aae2 Jan Andersson 2011-05-10   9  
21dccddf45aae2 Jan Andersson 2011-05-10  10  /*
21dccddf45aae2 Jan Andersson 2011-05-10  11   * Defines used for both SPARC32 and SPARC64
21dccddf45aae2 Jan Andersson 2011-05-10  12   */
21dccddf45aae2 Jan Andersson 2011-05-10  13  
21dccddf45aae2 Jan Andersson 2011-05-10  14  /* Big endian versions of memory read/write routines */
21dccddf45aae2 Jan Andersson 2011-05-10  15  #define readb_be(__addr)	__raw_readb(__addr)
21dccddf45aae2 Jan Andersson 2011-05-10 @16  #define readw_be(__addr)	__raw_readw(__addr)
21dccddf45aae2 Jan Andersson 2011-05-10 @17  #define readl_be(__addr)	__raw_readl(__addr)
21dccddf45aae2 Jan Andersson 2011-05-10  18  #define writeb_be(__b, __addr)	__raw_writeb(__b, __addr)
21dccddf45aae2 Jan Andersson 2011-05-10 @19  #define writel_be(__w, __addr)	__raw_writel(__w, __addr)
21dccddf45aae2 Jan Andersson 2011-05-10 @20  #define writew_be(__l, __addr)	__raw_writew(__l, __addr)
21dccddf45aae2 Jan Andersson 2011-05-10  21  

:::::: The code at line 16 was first introduced by commit
:::::: 21dccddf45aae2d9f973696ce06115da0d1012b6 sparc: add {read,write}*_be routines

:::::: TO: Jan Andersson <jan@gaisler.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
