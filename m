Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4551DE2CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 05:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752557658; cv=none; b=D9+16WUILITby4Ve+Z6XTQUxOov6fNTo1u4CU4j4Yj7Eaqfj5I2W6OJSX7YvHBGgNKlhQwSKJA+WPKafaVHPHmzFZd2zNyG/mHa3AkzaY2BlvPdGvAHKYMPFvatjZdRBBGEMiMmaSGZ8pITjVf0uNeMaXO2o7H8M3aq+oXqwots=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752557658; c=relaxed/simple;
	bh=KPd/64noN0eZ5IOHvB2AEvhSytkelp0zjr2LkjZRt8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ev3TThoTICqli1s8itQKmbHIv1GxsAlbQKble8o1UrPp0fc4438IcDX9pWVuaFeujneKiY8vtf3Wul/pTd9d4675wHk9XxzcfuxwhhXdRthm+kbOHiK+RM+lLDDO/mQhnsXplfHsnbowdR0g895f6BQWOwSYsCADkRUuxiTxGL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpq5X/oS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpq5X/oS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752557656; x=1784093656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KPd/64noN0eZ5IOHvB2AEvhSytkelp0zjr2LkjZRt8w=;
  b=lpq5X/oSsIzjhT73b3sZnUpATlpGOZcseB6o9TFfMgmyfWVKMnWzIh58
   QLcMm8wVTfUqbCfvxylHj31+H8Reh+TbzbCvZoC/fwwV9CeSghytas6MP
   mgC2troxbbk8GQeccXFzHaD4TFFUPCom38jmk+VY2qj8Y/0ri2MCx7iKI
   tmC+hzqJIfCbGXnD3E+iOhw7yr456izAUysuE/Nv+1xo41RKpL6WzdpYG
   gWBEX1o2hWg/lz6CwJSptyvTJJh7Y875enNChzEfcEv033riTW1ojyBfU
   5QYQ71Mpi+OZe8LMlOvhY74TMsKYuvUSjTeegrkPQQMP5KFaPZv9lExdl
   Q==;
X-CSE-ConnectionGUID: KfMBsgWbRwyItCjjMVJ5qA==
X-CSE-MsgGUID: b06cqp/ZSJS9nABssg5caw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53985015"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="53985015"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 22:34:15 -0700
X-CSE-ConnectionGUID: zQ9nB71pTv643XlHemtrhA==
X-CSE-MsgGUID: KU8g1jSHQoiZet//USLR5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="157483590"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jul 2025 22:34:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubYIt-0009gf-1d;
	Tue, 15 Jul 2025 05:34:11 +0000
Date: Tue, 15 Jul 2025 13:34:00 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] include/net/ip6_fib.h:273:10:
 error: default initialization of an object of type 'typeof (f6i->expires)'
 (aka 'const unsigned long') leaves the object uninitialized
Message-ID: <202507151322.RYo5pnBp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   9117970143cf69ace484f08b1d545a03f57c69ff
commit: f55326b5b36a104711ee86c851bd2a981cae61d0 [1/1] anolis: net: supports linkdata ethernet controllers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250715/202507151322.RYo5pnBp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507151322.RYo5pnBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507151322.RYo5pnBp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/linkdata/sxe/sxepf/sxe_netdev.c:16:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:273:10: error: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
     273 |                 return time_after(jiffies, f6i->expires);
         |                        ^
   include/linux/jiffies.h:106:3: note: expanded from macro 'time_after'
     106 |          typecheck(unsigned long, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   1 error generated.


vim +273 include/net/ip6_fib.h

1716a96101c491 Gao feng         2012-04-06  269  
8d1c802b2815ed David Ahern      2018-04-17  270  static inline bool fib6_check_expired(const struct fib6_info *f6i)
1716a96101c491 Gao feng         2012-04-06  271  {
93c2fb253d177a David Ahern      2018-04-18  272  	if (f6i->fib6_flags & RTF_EXPIRES)
14895687d36805 David Ahern      2018-04-17 @273  		return time_after(jiffies, f6i->expires);
14895687d36805 David Ahern      2018-04-17  274  	return false;
1716a96101c491 Gao feng         2012-04-06  275  }
b197df4f0f3782 Martin KaFai Lau 2015-05-22  276  

:::::: The code at line 273 was first introduced by commit
:::::: 14895687d36805f051bb54014c32e48e5937f7e1 net/ipv6: move expires into rt6_info

:::::: TO: David Ahern <dsahern@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
