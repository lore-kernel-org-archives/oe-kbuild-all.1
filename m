Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3412156257
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717152901; cv=none; b=hdCxzVOL4V2QEmBN61lKlWnWyK5asndNBYW4P9ixJEKBcOSzWE4hiMfA9DZNORAmMzTyA7tIEuURqKl2/et04edTG4DfKhB1vRTt/wAPKI5JYy8KI4q9uFa7RaWZHz1WHqAnlZfzk3dO1Ubo1X5a9HSNuymqnESGzldKo2+wx0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717152901; c=relaxed/simple;
	bh=/KS+CqYZGE35uHp2+cC/gl3rBtC8dtbiMZjJsY1+VIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZJFjj6sFy/elwbc/AhE0gRnewFnx6UKjb1I8a2uhMTC25b8c06FmdrxDZeLGIMP3GdRKHxLDBbXy7pJWMxehtITtMYw8SBB1tTlH5u4tuxutcpGBAo3nGuMjh27hQhQB00bgTPh1R7/TyHF7mZ35OiKaqIQy3gzC/Xb5mL/PFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOMD/kaL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOMD/kaL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717152899; x=1748688899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/KS+CqYZGE35uHp2+cC/gl3rBtC8dtbiMZjJsY1+VIs=;
  b=XOMD/kaLCoU6M7UATbo0S3Ade0stZ/4f0ALfTACailhIGnOLRc6U78Fm
   CWKmV90EMESp8Fl/6Hu3p0QaUAAJ4QneC6PlALtzdLw101sRezbPQ7o8o
   h7s1p6YCKY3WMgNMDng4G0vF5bPVp5U7WzpxuWW5Sy5kF4L4hQIoRtUKW
   YQQ+auD49MwQRBl5+QQJVKlz2IVUySaLohdm6ab5woPaGW+Q1n1Ew4brB
   hpABzMSfBthxXWtf2zTJ6GTBg9anqcTqiIOB9ay8Aw0sgw24vkQvb53lx
   MnM47lDiuK1SKQ523OjnNZXDrVLR5iZPKJVQ1sLzAgc52cdsdPQdD2XYl
   Q==;
X-CSE-ConnectionGUID: 8a57NkXmSd6aziik857ajg==
X-CSE-MsgGUID: 2FCxcexpQACIiviUBdu2Kw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17489924"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="17489924"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 03:54:59 -0700
X-CSE-ConnectionGUID: drNeVaJnTeeFR9smU74O5Q==
X-CSE-MsgGUID: RWyIHljDRnOB5ImILD2oag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="66987348"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 31 May 2024 03:54:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCzuH-000GyL-2P;
	Fri, 31 May 2024 10:54:53 +0000
Date: Fri, 31 May 2024 18:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 3/3] dst_cache: let rt_uncached cope with
 dst_cache cleanup
Message-ID: <202405311808.vqBTwxEf-lkp@intel.com>
References: <cd710487a34149654a5ff73a8c0df9b1d3fc73a9.1717087015.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd710487a34149654a5ff73a8c0df9b1d3fc73a9.1717087015.git.pabeni@redhat.com>

Hi Paolo,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/ipv6-use-a-new-flag-to-indicate-elevated-refcount/20240531-012716
base:   net-next/main
patch link:    https://lore.kernel.org/r/cd710487a34149654a5ff73a8c0df9b1d3fc73a9.1717087015.git.pabeni%40redhat.com
patch subject: [PATCH net-next 3/3] dst_cache: let rt_uncached cope with dst_cache cleanup
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240531/202405311808.vqBTwxEf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311808.vqBTwxEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311808.vqBTwxEf-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: net/core/dst_cache.o: in function `dst_cache_set_ip6':
>> net/core/dst_cache.c:123:(.text+0x240): undefined reference to `rt6_uncached_list_add'


vim +123 net/core/dst_cache.c

   109	
   110	#if IS_ENABLED(CONFIG_IPV6)
   111	void dst_cache_set_ip6(struct dst_cache *dst_cache, struct dst_entry *dst,
   112			       const struct in6_addr *saddr)
   113	{
   114		struct dst_cache_pcpu *idst;
   115	
   116		if (!dst_cache->cache)
   117			return;
   118	
   119		idst = this_cpu_ptr(dst_cache->cache);
   120		dst_cache_per_cpu_dst_set(idst, dst,
   121					  rt6_get_cookie(dst_rt6_info(dst)));
   122		if (dst && list_empty(&dst->rt_uncached))
 > 123			rt6_uncached_list_add(dst_rt6_info(dst));
   124	
   125		idst->in6_saddr = *saddr;
   126	}
   127	EXPORT_SYMBOL_GPL(dst_cache_set_ip6);
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
