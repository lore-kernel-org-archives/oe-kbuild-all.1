Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D845661
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 00:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730680866; cv=none; b=SSPrgFxSrGxevYo0z4DlBIs0cjstTJZrbxpXMmHsd5cElEaOWBMVuc8r1vaYA/Az1svmrGJxK46oVr46XJ2IK2IJ5t9WanW8MNcT0Lb8/qmKWUYexc/9pE/PYeXAu8p+l7DznjP3NCgVD6d/fVijDMoBh5yZWQQma6bLU/HJahM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730680866; c=relaxed/simple;
	bh=zS7nkaCj2i3IzZ40bCgMP82QykV8f+ohh3+P8qumhy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nu8sDnKDFBi5SA+xev/DEvmIhblKmmGWBZXjgeinj6O3nNSb5Ch0Y9bsifIIbpdEoX3LGLp4bOK0wZ3YS4xY0BWF22Ftg1jnijjYqGRqMe3fYBvLNaUy+rklUfEsDcbsjX2ZyI7fLQE2BKrmQbnsbS5DI5Kp6BWphztZFkySEXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFnc0bar; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFnc0bar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730680864; x=1762216864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zS7nkaCj2i3IzZ40bCgMP82QykV8f+ohh3+P8qumhy8=;
  b=mFnc0bargBbp2eSF1sxJ0B0121eBiAdBtiU8i2qSWhSYvJM30OoeUEBl
   zRVIESE3WNuTnPUJ7bzQpq90IsJ0jU6u2/d4lPXBbWehLaSnEIEMKEFme
   vMBDyHaHY3/S1SDaxNRAEAlT+YM/05abVjR/3onKfbF27NE1OgTkBzNXb
   7+IKsJYflnEp+GhSrksj+AgdyX8oIPU8k4bvZ3tEKa6sD3TKl8VSeeiD3
   vfGL0Aq2r3r7sBWgSp9qZ4ocVq2kpEmMJ0qG6PFLldYTBycT7bJsou0ho
   Lu0LqwfS8Emy6jvO2dfi70WDreJP1P0cbuttmqL87GYnacZMY6nboydvG
   g==;
X-CSE-ConnectionGUID: Vdr2q03xQXOR49eVBaFV7A==
X-CSE-MsgGUID: Bv4lS870SGq/CIW3Uj1miw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30543855"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30543855"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 16:41:04 -0800
X-CSE-ConnectionGUID: jX4o8O2fS0GDiKhghd5coQ==
X-CSE-MsgGUID: hxJgbXIjRQuRtetrimrtvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83021130"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Nov 2024 16:41:02 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7l9P-000kJR-2t;
	Mon, 04 Nov 2024 00:40:59 +0000
Date: Mon, 4 Nov 2024 08:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20241028-sa-with-flex 25/26]
 include/linux/compiler.h:189:45: error: '__UNIQUE_ID_y_1103' undeclared; did
 you mean '__UNIQUE_ID_x_1102'?
Message-ID: <202411040816.Mpg0l4R8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20241028-sa-with-flex
head:   0e7c24c783de39e1f965e8c23e96a7de29dfbfca
commit: c8ed0e38de664a505d69f49e390abad734e8fd8a [25/26] Revert "net: dev: Convert sa_data to flexible array in struct sockaddr"
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241104/202411040816.Mpg0l4R8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040816.Mpg0l4R8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040816.Mpg0l4R8-lkp@intel.com/

Note: the gustavoars/testing/wfamnae-next20241028-sa-with-flex HEAD 0e7c24c783de39e1f965e8c23e96a7de29dfbfca builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:390,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/ipv4/arp.c:74:
   net/ipv4/arp.c: In function 'arp_req_get':
   net/ipv4/arp.c:1188:52: error: 'struct sockaddr' has no member named 'sa_data_min'; did you mean 'sa_data'?
    1188 |                min(dev->addr_len, sizeof(r->arp_ha.sa_data_min)));
         |                                                    ^~~~~~~~~~~
   include/linux/fortify-string.h:621:48: note: in definition of macro '__fortify_memcpy_chk'
     621 |         const size_t __fortify_size = (size_t)(size);                   \
         |                                                ^~~~
   net/ipv4/arp.c:1187:9: note: in expansion of macro 'memcpy'
    1187 |         memcpy(r->arp_ha.sa_data, neigh->ha,
         |         ^~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   net/ipv4/arp.c:1188:16: note: in expansion of macro 'min'
    1188 |                min(dev->addr_len, sizeof(r->arp_ha.sa_data_min)));
         |                ^~~
>> include/linux/compiler.h:189:45: error: '__UNIQUE_ID_y_1103' undeclared (first use in this function); did you mean '__UNIQUE_ID_x_1102'?
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/fortify-string.h:621:48: note: in definition of macro '__fortify_memcpy_chk'
     621 |         const size_t __fortify_size = (size_t)(size);                   \
         |                                                ^~~~
   net/ipv4/arp.c:1187:9: note: in expansion of macro 'memcpy'
    1187 |         memcpy(r->arp_ha.sa_data, neigh->ha,
         |         ^~~~~~
   include/linux/compiler_types.h:505:9: note: in expansion of macro '__compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:56:27: note: in expansion of macro 'is_signed_type'
      56 | #define __sign_use(x,ux) (is_signed_type(typeof(ux))? \
         |                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:105:55: note: in expansion of macro '__UNIQUE_ID'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   net/ipv4/arp.c:1188:16: note: in expansion of macro 'min'
    1188 |                min(dev->addr_len, sizeof(r->arp_ha.sa_data_min)));
         |                ^~~
   include/linux/compiler.h:189:45: note: each undeclared identifier is reported only once for each function it appears in
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/fortify-string.h:621:48: note: in definition of macro '__fortify_memcpy_chk'
     621 |         const size_t __fortify_size = (size_t)(size);                   \
         |                                                ^~~~
   net/ipv4/arp.c:1187:9: note: in expansion of macro 'memcpy'
    1187 |         memcpy(r->arp_ha.sa_data, neigh->ha,
         |         ^~~~~~
   include/linux/compiler_types.h:505:9: note: in expansion of macro '__compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:56:27: note: in expansion of macro 'is_signed_type'
      56 | #define __sign_use(x,ux) (is_signed_type(typeof(ux))? \
         |                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:105:55: note: in expansion of macro '__UNIQUE_ID'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))


vim +189 include/linux/compiler.h

fe8c8a126806fe Cesar Eduardo Barros 2013-11-25  188  
a8306f2d4dcea0 Nick Desaulniers     2023-08-31 @189  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
6f33d58794ef4c Rusty Russell        2012-11-22  190  

:::::: The code at line 189 was first introduced by commit
:::::: a8306f2d4dcea03538c70c26d2948483f70254ff compiler.h: unify __UNIQUE_ID

:::::: TO: Nick Desaulniers <ndesaulniers@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
