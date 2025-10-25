Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB5D14EC73
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 03:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761364669; cv=none; b=AlvkrhmQhHrQuYH9zGZ43cvexx7LDLhfwMXzkjxib++H/F6RPkrbg1E5S+jsQSRWeCNiUXBslStvhP83JNMm68ch4240LgeE5n5DVVBY5QgYfPIQ0fFTJKOXmoYfbAhh/4CMw4NUS/yS4VpLi7yOY1RcyXyTdKMGBwoXeiBurlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761364669; c=relaxed/simple;
	bh=+S38UXu78bsLPkzk3EJ8m7EJ0/piGsPeJH1dvJKY6lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8/QWMEA5ySHO5V+NSEhdxphYKP7upp1+A/jWMjyU/UvUlJTRzOWvw8Mm6BJFdrZqyq/64aOceqWESd6F8tTeVx987GgRtvyEfdaGIUDSMt4uVjxjM8kUVioDk8nhPvUw1h8QeqRsMxqlMP0qZLHzdJonqg4wXsNYKwARcCiXTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O29psYpw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O29psYpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761364667; x=1792900667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+S38UXu78bsLPkzk3EJ8m7EJ0/piGsPeJH1dvJKY6lo=;
  b=O29psYpwoomhkQovEKqRnq4QC6BMAUWB2P0BuwDY1wgXCaAnY7d0lLyR
   Y4JlsBLKL8cJlW1k+2YFlDnq5HEAF8Rssh/S4i8FB/1xLK3Vfh9Vt5a42
   LXSuvf7FYXyRxe0HnJwNAqljYWS05AK5tusF69osnvBm2pb2VBpmHVZuF
   Eb3uLnEJpuCMu65gDEOopa+JSLMrH6WnFUmhUZhUO3tbtzBLmUxcZyMTM
   fbBk+8fCe0Ftg40lVgYs5KID3gOGhf/KojVhqwMCZdbw8BOBcA2m3CvHW
   cZHabuaw1qCr3jzpVE2FzYZBtFUlXfM+m/eCH/ChIESIeYyXDePVpFTQm
   g==;
X-CSE-ConnectionGUID: OYcbWHnFTHyx/Rus2vXDXw==
X-CSE-MsgGUID: QeckEJ/vQ5+fIcXOdr8z3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67185540"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="67185540"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 20:57:47 -0700
X-CSE-ConnectionGUID: Ew51syi8TNiSwTCY4Vh4Dg==
X-CSE-MsgGUID: YQCbAsZxSP6oci0PcuBIpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="215235669"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Oct 2025 20:57:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCVPT-000F6h-2W;
	Sat, 25 Oct 2025 03:57:43 +0000
Date: Sat, 25 Oct 2025 11:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/5] ceph: Add BLOG debugfs support
Message-ID: <202510251115.DBZzEKsR-lkp@intel.com>
References: <20251024084259.2359693-5-amarkuze@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024084259.2359693-5-amarkuze@redhat.com>

Hi Alex,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on tip/sched/core linus/master v6.18-rc2 next-20251024]
[cannot apply to ceph-client/testing ceph-client/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Markuze/sched-fork-Wire-BLOG-contexts-into-task-lifecycle/20251024-164832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20251024084259.2359693-5-amarkuze%40redhat.com
patch subject: [RFC PATCH 4/5] ceph: Add BLOG debugfs support
config: xtensa-randconfig-002-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251115.DBZzEKsR-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251115.DBZzEKsR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251115.DBZzEKsR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:30,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from fs/ceph/debugfs.c:4:
   include/linux/blog/blog_ser.h: In function 'write_null_str':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "null_str.str size must match unsigned long for proper alignment"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/blog/blog_ser.h:120:9: note: in expansion of macro 'static_assert'
     120 |         static_assert(sizeof(null_str.str) == sizeof(unsigned long),
         |         ^~~~~~~~~~~~~
   fs/ceph/debugfs.c: In function 'ceph_fs_debugfs_cleanup':
   fs/ceph/debugfs.c:407:9: error: implicit declaration of function 'boutc'; did you mean 'doutc'? [-Wimplicit-function-declaration]
     407 |         boutc(fsc->client, "begin\n");
         |         ^~~~~
         |         doutc


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
