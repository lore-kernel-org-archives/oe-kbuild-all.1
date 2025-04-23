Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0584A264627
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745380723; cv=none; b=bLG7SFgusbhQ3unpUfk4+sZC3SuXrPj1GS3svZ5DDcGFbkiltN61Scs5O/sngTrMrbJjREX88Gof5JEbxKyah5eJr5Z02/6CC+v40rwPtXQHdQLOt+URJ9d7L/R+k9ksWfXWtHgVSGPGHZh54/xQEWpp/9PlwJXbgfvLlPZwsIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745380723; c=relaxed/simple;
	bh=HNb0znMX4f4z1JlM51kU/F+f9+jkr1yrIedtv0/Y5QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9Hw8ZABkkprlaXOBAMW9Gps4nAFrelKJK6a4oG3XQayTtd2n2NJFRkWRMA/hnt6O2E/5DDce6h2JWWHNdskCP2Y05NNOe0/YXmGoVWdnp4wwYIzZ57hLZgSZsacIzszjfRZXfM/B2g5rW1e8B6jqfizmv4kkkqaI23sw6ucmmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HopSRpW7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HopSRpW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745380722; x=1776916722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HNb0znMX4f4z1JlM51kU/F+f9+jkr1yrIedtv0/Y5QA=;
  b=HopSRpW7eoD75bFFdRGUOho9R+ZKHJ0LTunf0z8kdhNCrD1fLq4WDviG
   Ik3tsUjx4oRoZmRPme9EU+QGAaJlnCDLFpWwy9YzoIb/6WylQxBxw1zhm
   L4yMCKT96lZatPozqqfDUCtsWjohEWX/ijz7Uo/ihpUNQQCFI9tgTaqyP
   kON8jbgAXeLYef9fVePqTm04gaxkaHSruhC3pCxUXc3qWahB8dY9l8BLx
   SJVPTpJss0OY8ajuKda/f9sNJpyOzFF1og+qrVUuDQABFjlPw2ghKV5m6
   EsGTbubjyEr1o3l2VMSbLwJaueSCXc2Iyks+dw8AVaRHoQbU8GFFGCVcD
   A==;
X-CSE-ConnectionGUID: LFZo3I3+Qty7bgkRoYo1yQ==
X-CSE-MsgGUID: OWLnrH9aS72AQ6nTkLsbgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50760618"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="50760618"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 20:58:41 -0700
X-CSE-ConnectionGUID: 7amEojNiRcKuslHXYb1oeA==
X-CSE-MsgGUID: kE6dGeYxRZq3hUl8EtMY9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="136979279"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Apr 2025 20:58:39 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7RFt-0001a7-23;
	Wed, 23 Apr 2025 03:58:37 +0000
Date: Wed, 23 Apr 2025 11:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: Arthur Fabre <arthur@arthurfabre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC bpf-next v2 03/17] trait: XDP support
Message-ID: <202504231100.AE6aQGzS-lkp@intel.com>
References: <20250422-afabre-traits-010-rfc2-v2-3-92bcc6b146c9@arthurfabre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-afabre-traits-010-rfc2-v2-3-92bcc6b146c9@arthurfabre.com>

Hi Arthur,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5709be4c35ba760b001733939e20069de033a697]

url:    https://github.com/intel-lab-lkp/linux/commits/Arthur-Fabre/trait-limited-KV-store-for-packet-metadata/20250422-212907
base:   5709be4c35ba760b001733939e20069de033a697
patch link:    https://lore.kernel.org/r/20250422-afabre-traits-010-rfc2-v2-3-92bcc6b146c9%40arthurfabre.com
patch subject: [PATCH RFC bpf-next v2 03/17] trait: XDP support
config: i386-buildonly-randconfig-001-20250423 (https://download.01.org/0day-ci/archive/20250423/202504231100.AE6aQGzS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504231100.AE6aQGzS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504231100.AE6aQGzS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from io_uring/io_uring.c:42:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct xdp_frame) == _XDP_FRAME_SIZE"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/xdp.h:292:1: note: in expansion of macro 'static_assert'
     292 | static_assert(sizeof(struct xdp_frame) == _XDP_FRAME_SIZE);
         | ^~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics


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
