Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65CC1FDD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 04:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745383847; cv=none; b=UAX2IxuTiRa03Sa+VDjX4w2XVFFk9+kdcoYYXkPgWMaKo/j0RMIqz1A917WgaW33Uzz1X5yRDZX/rFfjGD7ug91xHYXpxT07CQFdfAKIvsSzU1f2QTrScaYv/1C5V6Cb3ofBuEHzq4Ol+juxk8aEYCskh0TwT3QF66fkRysKYeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745383847; c=relaxed/simple;
	bh=LQ2nQZnzSjreof+r88jc41WWhLr/TSNnPUoPxRruACQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqL/popRlHwzzlKqnJYF+3sdjHVvTY5o8j2YtfRjFychvdkwfqwPYlfj1nBJ/WMBeM8q7/MPUdYcfL2mHjl296xN+E3F2NLP7CoAUsEPrXQx2nRSPqnRcB0u/5pUXMeEF8Bvp5D1VsbffwV8u82q1WH/XfTn+gBeTQ+ja1opN1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6NOfhDk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6NOfhDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745383846; x=1776919846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LQ2nQZnzSjreof+r88jc41WWhLr/TSNnPUoPxRruACQ=;
  b=n6NOfhDkgVMO0p7r8AjGKvrq40ACfT1oBYEVNvVaEiob6H8QFO25EfRb
   hI54kFZYx9Lj8Xb8f+L2wfu86wT9ZqTpRp7WfJ0Rb5KhfUZ9Mxe0Jlbsh
   HpvAgM5L2X8hcSGMnrtbinNU3x7o70Fv1ej7MBo9cmYdxf8Bm5jCFDJFr
   srDNdfEGh3kAaYMl88+N0Bd2iFeuMshzjDLV8WGo9AaECGkFUBhhm51Nv
   YnGcWzmGB7xV0VDDUrFFB2z0UUeRrH8e3eeIBMO5dsAhYXBsWzAEhqLZL
   7wV2pFa5PU9oxccAaSxEl6rT/kJ9PWxJLHJM4fSBUBOD0Fom1YgS9+SkH
   w==;
X-CSE-ConnectionGUID: QkrXtutkTFukyZ4HFxL/WQ==
X-CSE-MsgGUID: 4brrsqVLRnCq4891cNbwMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47142921"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="47142921"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 21:50:45 -0700
X-CSE-ConnectionGUID: 4hMrYiUHT9SLsdIHTBHgpw==
X-CSE-MsgGUID: vDkI8Iw8TI2/STzi/iUI0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132095592"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Apr 2025 21:50:45 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7S4H-0001cB-35;
	Wed, 23 Apr 2025 04:50:41 +0000
Date: Wed, 23 Apr 2025 12:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Arthur Fabre <arthur@arthurfabre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC bpf-next v2 09/17] trait: Store traits in sk_buff
 extension
Message-ID: <202504231243.flI74qPm-lkp@intel.com>
References: <20250422-afabre-traits-010-rfc2-v2-9-92bcc6b146c9@arthurfabre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-afabre-traits-010-rfc2-v2-9-92bcc6b146c9@arthurfabre.com>

Hi Arthur,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5709be4c35ba760b001733939e20069de033a697]

url:    https://github.com/intel-lab-lkp/linux/commits/Arthur-Fabre/trait-limited-KV-store-for-packet-metadata/20250422-212907
base:   5709be4c35ba760b001733939e20069de033a697
patch link:    https://lore.kernel.org/r/20250422-afabre-traits-010-rfc2-v2-9-92bcc6b146c9%40arthurfabre.com
patch subject: [PATCH RFC bpf-next v2 09/17] trait: Store traits in sk_buff extension
config: i386-buildonly-randconfig-001-20250423 (https://download.01.org/0day-ci/archive/20250423/202504231243.flI74qPm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504231243.flI74qPm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504231243.flI74qPm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/busy_poll.h:19,
                    from io_uring/napi.h:8,
                    from io_uring/io_uring.c:96:
   include/net/xdp.h: In function '__xdp_flags_update_skb':
>> include/net/xdp.h:133:17: error: implicit declaration of function 'skb_ext_from_headroom'; did you mean 'skb_realloc_headroom'? [-Werror=implicit-function-declaration]
     133 |                 skb_ext_from_headroom(skb, SKB_EXT_TRAITS, _XDP_FRAME_SIZE, traits_size(traits));
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 skb_realloc_headroom
>> include/net/xdp.h:133:44: error: 'SKB_EXT_TRAITS' undeclared (first use in this function)
     133 |                 skb_ext_from_headroom(skb, SKB_EXT_TRAITS, _XDP_FRAME_SIZE, traits_size(traits));
         |                                            ^~~~~~~~~~~~~~
   include/net/xdp.h:133:44: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from io_uring/io_uring.c:42:
   include/net/xdp.h: At top level:
   include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct xdp_frame) == _XDP_FRAME_SIZE"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/xdp.h:303:1: note: in expansion of macro 'static_assert'
     303 | static_assert(sizeof(struct xdp_frame) == _XDP_FRAME_SIZE);
         | ^~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics
   cc1: some warnings being treated as errors


vim +133 include/net/xdp.h

   129	
   130	static __always_inline void __xdp_flags_update_skb(u32 flags, struct sk_buff *skb, void *traits)
   131	{
   132		if (flags & XDP_FLAGS_TRAITS_SUPPORTED)
 > 133			skb_ext_from_headroom(skb, SKB_EXT_TRAITS, _XDP_FRAME_SIZE, traits_size(traits));
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
