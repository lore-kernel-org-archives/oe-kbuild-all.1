Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026F1282F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 00:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757551826; cv=none; b=FkraK3UGkF7LT3dfhyyiGK0mz88bLGAu3HbNni1rPuiYqm9iE6+TJoFdDilzXz8o/xs1N1DCHTmRWl0prrW4hD/mkMP0FtSIo3TxKA4p0umhbDoycm4dZsjslgYqWbjKyybfVXYvr7JzNdP0bhBO7OGfprCofWpYHJYcEFcxNnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757551826; c=relaxed/simple;
	bh=UTSGIVH6CQC3R0hcJP8H/hGItHpqrXfVkDbL9YqbCms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BXi0zguURtDb5JRAHZt4oKJ36FP/dZG2tpnEaiglzDUMJmWTl+ghxnlHp96ZcGbB1UY2c8YKnVTD/VIzUsIC061evdZ01+cAJnm8FoKIHcB9Ty+ShHs3XSDkX4kv+gDhmwHrARoUbrVGz0ulmBYL/6NMyJPELZ0QGhZ5mvtRue0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCQqAXPh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCQqAXPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757551824; x=1789087824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UTSGIVH6CQC3R0hcJP8H/hGItHpqrXfVkDbL9YqbCms=;
  b=FCQqAXPhKNxhCNaCEqWqy701NwA3kmw0tpjSPfaDwQZ3CXyxzAR+I4G+
   V9LwvsZLs6PeJO+G1fa46MXRBmjuGIBGp5t7QJMHh6PuA0Gkbl6whQ+l3
   xvMAfXSYdOuXicrsEzLWg9iv0WwAsRTUu+I2GrWQfQm0q+BJ9wHBqQ2oY
   cwYodDyhcG0IsAoYTgHNOM1t+mzMoY+srxNCSM9cOJDE54gcGEwpwHOLY
   yJ+NTszj3PZ5dw/eJsULfEeXo4Pe5JpcJX+pzbiz5Z0VMyWP9eZh94bah
   U4YDWSwBkK77XrcMh+Jbty4n8nZVeB4Jfu4Vi7goNmIv8qP9vAyykWw0y
   g==;
X-CSE-ConnectionGUID: 0XMiuYXoRqCQ7fPgaglyGg==
X-CSE-MsgGUID: Qe/642YaSUOFYkuVeT3juQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63510119"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="63510119"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 17:50:23 -0700
X-CSE-ConnectionGUID: sC6K4m5LSnetS/ioiTCvFA==
X-CSE-MsgGUID: md2T7Bl3TsGLeoCuNKQoWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="204534545"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Sep 2025 17:50:22 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwVVz-0006OL-2V;
	Thu, 11 Sep 2025 00:50:19 +0000
Date: Thu, 11 Sep 2025 08:49:37 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 33/34] crypto/scompress.c:251:3: warning:
 releasing spinlock 'scratch->lock' that was not held
Message-ID: <202509110847.6W8wR4NJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   3ef29ea9bb447fcd2164b0d944add4b1757343cb
commit: adcc2d83a6e6700db92855e77108b9be66c875e2 [33/34] crypto: Enable capability analysis
config: hexagon-randconfig-002-20250911 (https://download.01.org/0day-ci/archive/20250911/202509110847.6W8wR4NJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110847.6W8wR4NJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110847.6W8wR4NJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/blowfish_generic.c:15:
   In file included from include/crypto/algapi.h:13:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1513:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:59:
>> include/linux/srcutiny.h:93:2: warning: releasing srcu_struct 'ssp' that was not held [-Wthread-safety-analysis]
      93 |         __srcu_read_unlock(ssp, __srcu_ptr_to_ctr(ssp, scp));
         |         ^
   In file included from crypto/blowfish_generic.c:15:
   In file included from include/crypto/algapi.h:13:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1513:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
>> include/linux/srcu.h:117:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     117 | }
         | ^
   include/linux/srcu.h:113:19: note: srcu_struct acquired here
     113 | static inline int __srcu_read_lock_nmisafe(struct srcu_struct *ssp)
         |                   ^
   include/linux/srcu.h:272:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     272 | }
         | ^
   include/linux/srcu.h:263:19: note: srcu_struct acquired here
     263 | static inline int srcu_read_lock(struct srcu_struct *ssp)
         |                   ^
   include/linux/srcu.h:299:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     299 | }
         | ^
   include/linux/srcu.h:291:41: note: srcu_struct acquired here
     291 | static inline struct srcu_ctr __percpu *srcu_read_lock_fast(struct srcu_struct *ssp) __acquires_shared(ssp)
         |                                         ^
   include/linux/srcu.h:317:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     317 | }
         | ^
   include/linux/srcu.h:312:41: note: srcu_struct acquired here
     312 | static inline struct srcu_ctr __percpu *srcu_down_read_fast(struct srcu_struct *ssp) __acquires_shared(ssp)
         |                                         ^
   include/linux/srcu.h:351:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     351 | }
         | ^
   include/linux/srcu.h:343:1: note: srcu_struct acquired here
     343 | srcu_read_lock_notrace(struct srcu_struct *ssp)
         | ^
   include/linux/srcu.h:381:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     381 | }
         | ^
   include/linux/srcu.h:375:19: note: srcu_struct acquired here
     375 | static inline int srcu_down_read(struct srcu_struct *ssp)
         |                   ^
>> include/linux/srcu.h:412:1: warning: srcu_struct 'ssp' is still held at the end of function [-Wthread-safety-analysis]
     412 | }
         | ^
   include/linux/srcu.h:407:2: note: srcu_struct acquired here
     407 |         __releases_shared(ssp)
         |         ^
   include/linux/compiler-capability-analysis.h:361:32: note: expanded from macro '__releases_shared'
     361 | #define __releases_shared(...)  __releases_shared_cap(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-capability-analysis.h:21:53: note: expanded from macro '__releases_shared_cap'
      21 | # define __releases_shared_cap(...)             __attribute__((release_shared_capability(__VA_ARGS__)))
         |                                                                ^
   In file included from crypto/blowfish_generic.c:15:
   In file included from include/crypto/algapi.h:13:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1513:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:428:1: warning: srcu_struct 'ssp' is still held at the end of function [-Wthread-safety-analysis]
     428 | }
         | ^
   include/linux/srcu.h:423:2: note: srcu_struct acquired here
     423 |         __releases_shared(ssp)
         |         ^
   include/linux/compiler-capability-analysis.h:361:32: note: expanded from macro '__releases_shared'
     361 | #define __releases_shared(...)  __releases_shared_cap(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-capability-analysis.h:21:53: note: expanded from macro '__releases_shared_cap'
      21 | # define __releases_shared_cap(...)             __attribute__((release_shared_capability(__VA_ARGS__)))
         |                                                                ^
   9 warnings generated.
--
   In file included from crypto/scompress.c:10:
   In file included from include/crypto/internal/scompress.h:12:
   In file included from include/crypto/internal/acompress.h:12:
   In file included from include/crypto/acompress.h:16:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1513:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:59:
>> include/linux/srcutiny.h:93:2: warning: releasing srcu_struct 'ssp' that was not held [-Wthread-safety-analysis]
      93 |         __srcu_read_unlock(ssp, __srcu_ptr_to_ctr(ssp, scp));
         |         ^
   In file included from crypto/scompress.c:10:
   In file included from include/crypto/internal/scompress.h:12:
   In file included from include/crypto/internal/acompress.h:12:
   In file included from include/crypto/acompress.h:16:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1513:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
>> include/linux/srcu.h:117:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     117 | }
         | ^
   include/linux/srcu.h:113:19: note: srcu_struct acquired here
     113 | static inline int __srcu_read_lock_nmisafe(struct srcu_struct *ssp)
         |                   ^
   include/linux/srcu.h:272:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     272 | }
         | ^
   include/linux/srcu.h:263:19: note: srcu_struct acquired here
     263 | static inline int srcu_read_lock(struct srcu_struct *ssp)
         |                   ^
   include/linux/srcu.h:299:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     299 | }
         | ^
   include/linux/srcu.h:291:41: note: srcu_struct acquired here
     291 | static inline struct srcu_ctr __percpu *srcu_read_lock_fast(struct srcu_struct *ssp) __acquires_shared(ssp)
         |                                         ^
   include/linux/srcu.h:317:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     317 | }
         | ^
   include/linux/srcu.h:312:41: note: srcu_struct acquired here
     312 | static inline struct srcu_ctr __percpu *srcu_down_read_fast(struct srcu_struct *ssp) __acquires_shared(ssp)
         |                                         ^
   include/linux/srcu.h:351:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     351 | }
         | ^
   include/linux/srcu.h:343:1: note: srcu_struct acquired here
     343 | srcu_read_lock_notrace(struct srcu_struct *ssp)
         | ^
   include/linux/srcu.h:381:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     381 | }
         | ^
   include/linux/srcu.h:375:19: note: srcu_struct acquired here
     375 | static inline int srcu_down_read(struct srcu_struct *ssp)
         |                   ^
>> include/linux/srcu.h:412:1: warning: srcu_struct 'ssp' is still held at the end of function [-Wthread-safety-analysis]
     412 | }
         | ^
   include/linux/srcu.h:407:2: note: srcu_struct acquired here
     407 |         __releases_shared(ssp)
         |         ^
   include/linux/compiler-capability-analysis.h:361:32: note: expanded from macro '__releases_shared'
     361 | #define __releases_shared(...)  __releases_shared_cap(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-capability-analysis.h:21:53: note: expanded from macro '__releases_shared_cap'
      21 | # define __releases_shared_cap(...)             __attribute__((release_shared_capability(__VA_ARGS__)))
         |                                                                ^
   In file included from crypto/scompress.c:10:
   In file included from include/crypto/internal/scompress.h:12:
   In file included from include/crypto/internal/acompress.h:12:
   In file included from include/crypto/acompress.h:16:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1513:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:428:1: warning: srcu_struct 'ssp' is still held at the end of function [-Wthread-safety-analysis]
     428 | }
         | ^
   include/linux/srcu.h:423:2: note: srcu_struct acquired here
     423 |         __releases_shared(ssp)
         |         ^
   include/linux/compiler-capability-analysis.h:361:32: note: expanded from macro '__releases_shared'
     361 | #define __releases_shared(...)  __releases_shared_cap(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-capability-analysis.h:21:53: note: expanded from macro '__releases_shared_cap'
      21 | # define __releases_shared_cap(...)             __attribute__((release_shared_capability(__VA_ARGS__)))
         |                                                                ^
>> crypto/scompress.c:251:3: warning: releasing spinlock 'scratch->lock' that was not held [-Wthread-safety-analysis]
     251 |                 scomp_unlock_scratch(scratch);
         |                 ^
>> crypto/scompress.c:259:2: warning: spinlock '__ret->lock' is not held on every path through here [-Wthread-safety-analysis]
     259 |         crypto_acomp_unlock_stream_bh(stream);
         |         ^
   crypto/scompress.c:239:35: note: spinlock acquired here
     239 |                 struct scomp_scratch *scratch = scomp_lock_scratch();
         |                                                 ^
   crypto/scompress.c:144:33: note: expanded from macro 'scomp_lock_scratch'
     144 | #define scomp_lock_scratch(...) __acquire_ret(_scomp_lock_scratch(__VA_ARGS__), &__ret->lock)
         |                                 ^
   include/linux/compiler-capability-analysis.h:389:3: note: expanded from macro '__acquire_ret'
     389 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:315:23: note: expanded from macro '__acquire'
     315 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
>> crypto/scompress.c:259:2: warning: releasing spinlock 'stream->lock' that was not held [-Wthread-safety-analysis]
     259 |         crypto_acomp_unlock_stream_bh(stream);
         |         ^
   crypto/scompress.c:278:1: warning: spinlock '__ret->lock' is not held on every path through here [-Wthread-safety-analysis]
     278 | }
         | ^
   crypto/scompress.c:236:39: note: spinlock acquired here
     236 |         struct crypto_acomp_stream *stream = crypto_acomp_lock_stream_bh(&crypto_scomp_alg(scomp)->streams);
         |                                              ^
   include/crypto/internal/acompress.h:194:42: note: expanded from macro 'crypto_acomp_lock_stream_bh'
     194 | #define crypto_acomp_lock_stream_bh(...) __acquire_ret(_crypto_acomp_lock_stream_bh(__VA_ARGS__), &__ret->lock);
         |                                          ^
   include/linux/compiler-capability-analysis.h:389:3: note: expanded from macro '__acquire_ret'
     389 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:315:23: note: expanded from macro '__acquire'
     315 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   13 warnings generated.
--
   In file included from crypto/deflate.c:12:
   In file included from include/crypto/internal/acompress.h:12:
   In file included from include/crypto/acompress.h:16:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1513:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:59:
>> include/linux/srcutiny.h:93:2: warning: releasing srcu_struct 'ssp' that was not held [-Wthread-safety-analysis]
      93 |         __srcu_read_unlock(ssp, __srcu_ptr_to_ctr(ssp, scp));
         |         ^
   In file included from crypto/deflate.c:12:
   In file included from include/crypto/internal/acompress.h:12:
   In file included from include/crypto/acompress.h:16:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1513:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
>> include/linux/srcu.h:117:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     117 | }
         | ^
   include/linux/srcu.h:113:19: note: srcu_struct acquired here
     113 | static inline int __srcu_read_lock_nmisafe(struct srcu_struct *ssp)
         |                   ^
   include/linux/srcu.h:272:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     272 | }
         | ^
   include/linux/srcu.h:263:19: note: srcu_struct acquired here
     263 | static inline int srcu_read_lock(struct srcu_struct *ssp)
         |                   ^
   include/linux/srcu.h:299:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     299 | }
         | ^
   include/linux/srcu.h:291:41: note: srcu_struct acquired here
     291 | static inline struct srcu_ctr __percpu *srcu_read_lock_fast(struct srcu_struct *ssp) __acquires_shared(ssp)
         |                                         ^
   include/linux/srcu.h:317:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     317 | }
         | ^
   include/linux/srcu.h:312:41: note: srcu_struct acquired here
     312 | static inline struct srcu_ctr __percpu *srcu_down_read_fast(struct srcu_struct *ssp) __acquires_shared(ssp)
         |                                         ^
   include/linux/srcu.h:351:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     351 | }
         | ^
   include/linux/srcu.h:343:1: note: srcu_struct acquired here
     343 | srcu_read_lock_notrace(struct srcu_struct *ssp)
         | ^
   include/linux/srcu.h:381:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     381 | }
         | ^
   include/linux/srcu.h:375:19: note: srcu_struct acquired here
     375 | static inline int srcu_down_read(struct srcu_struct *ssp)
         |                   ^
>> include/linux/srcu.h:412:1: warning: srcu_struct 'ssp' is still held at the end of function [-Wthread-safety-analysis]
     412 | }
         | ^
   include/linux/srcu.h:407:2: note: srcu_struct acquired here
     407 |         __releases_shared(ssp)
         |         ^
   include/linux/compiler-capability-analysis.h:361:32: note: expanded from macro '__releases_shared'
     361 | #define __releases_shared(...)  __releases_shared_cap(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-capability-analysis.h:21:53: note: expanded from macro '__releases_shared_cap'
      21 | # define __releases_shared_cap(...)             __attribute__((release_shared_capability(__VA_ARGS__)))
         |                                                                ^
   In file included from crypto/deflate.c:12:
   In file included from include/crypto/internal/acompress.h:12:
   In file included from include/crypto/acompress.h:16:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1513:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:428:1: warning: srcu_struct 'ssp' is still held at the end of function [-Wthread-safety-analysis]
     428 | }
         | ^
   include/linux/srcu.h:423:2: note: srcu_struct acquired here
     423 |         __releases_shared(ssp)
         |         ^
   include/linux/compiler-capability-analysis.h:361:32: note: expanded from macro '__releases_shared'
     361 | #define __releases_shared(...)  __releases_shared_cap(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-capability-analysis.h:21:53: note: expanded from macro '__releases_shared_cap'
      21 | # define __releases_shared_cap(...)             __attribute__((release_shared_capability(__VA_ARGS__)))
         |                                                                ^
>> crypto/deflate.c:135:2: warning: releasing spinlock 's->lock' that was not held [-Wthread-safety-analysis]
     135 |         crypto_acomp_unlock_stream_bh(s);
         |         ^
>> crypto/deflate.c:138:1: warning: spinlock '__ret->lock' is still held at the end of function [-Wthread-safety-analysis]
     138 | }
         | ^
   crypto/deflate.c:121:6: note: spinlock acquired here
     121 |         s = crypto_acomp_lock_stream_bh(&deflate_streams);
         |             ^
   include/crypto/internal/acompress.h:194:42: note: expanded from macro 'crypto_acomp_lock_stream_bh'
     194 | #define crypto_acomp_lock_stream_bh(...) __acquire_ret(_crypto_acomp_lock_stream_bh(__VA_ARGS__), &__ret->lock);
         |                                          ^
   include/linux/compiler-capability-analysis.h:389:3: note: expanded from macro '__acquire_ret'
     389 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:315:23: note: expanded from macro '__acquire'
     315 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   crypto/deflate.c:214:2: warning: releasing spinlock 's->lock' that was not held [-Wthread-safety-analysis]
     214 |         crypto_acomp_unlock_stream_bh(s);
         |         ^
   crypto/deflate.c:217:1: warning: spinlock '__ret->lock' is still held at the end of function [-Wthread-safety-analysis]
     217 | }
         | ^
   crypto/deflate.c:202:6: note: spinlock acquired here
     202 |         s = crypto_acomp_lock_stream_bh(&deflate_streams);
         |             ^
   include/crypto/internal/acompress.h:194:42: note: expanded from macro 'crypto_acomp_lock_stream_bh'
     194 | #define crypto_acomp_lock_stream_bh(...) __acquire_ret(_crypto_acomp_lock_stream_bh(__VA_ARGS__), &__ret->lock);
         |                                          ^
   include/linux/compiler-capability-analysis.h:389:3: note: expanded from macro '__acquire_ret'
     389 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:315:23: note: expanded from macro '__acquire'
     315 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   13 warnings generated.
..


vim +251 crypto/scompress.c

c47e1f4142a382 Herbert Xu                2025-03-17  169  
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  170  static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  171  {
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  172  	struct crypto_acomp *tfm = crypto_acomp_reqtfm(req);
2d3553ecb4e316 Herbert Xu                2025-03-15  173  	struct crypto_scomp **tfm_ctx = acomp_tfm_ctx(tfm);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  174  	bool src_isvirt = acomp_request_src_isvirt(req);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  175  	bool dst_isvirt = acomp_request_dst_isvirt(req);
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  176  	struct crypto_scomp *scomp = *tfm_ctx;
2d3553ecb4e316 Herbert Xu                2025-03-15  177  	unsigned int slen = req->slen;
2d3553ecb4e316 Herbert Xu                2025-03-15  178  	unsigned int dlen = req->dlen;
2d3553ecb4e316 Herbert Xu                2025-03-15  179  	struct page *spage, *dpage;
2d3553ecb4e316 Herbert Xu                2025-03-15  180  	unsigned int n;
2c1808e5fe5afd Herbert Xu                2025-03-15  181  	const u8 *src;
8a6771cda3f48a Herbert Xu                2025-03-15  182  	size_t soff;
8a6771cda3f48a Herbert Xu                2025-03-15  183  	size_t doff;
2c1808e5fe5afd Herbert Xu                2025-03-15  184  	u8 *dst;
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  185  	int ret;
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  186  
2d3553ecb4e316 Herbert Xu                2025-03-15  187  	if (!req->src || !slen)
71052dcf4be70b Sebastian Andrzej Siewior 2019-03-29  188  		return -EINVAL;
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  189  
2d3553ecb4e316 Herbert Xu                2025-03-15  190  	if (!req->dst || !dlen)
71052dcf4be70b Sebastian Andrzej Siewior 2019-03-29  191  		return -EINVAL;
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  192  
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  193  	if (dst_isvirt)
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  194  		dst = req->dvirt;
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  195  	else {
5f3437e9c89eec Herbert Xu                2025-04-07  196  		if (dlen <= req->dst->length) {
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  197  			dpage = sg_page(req->dst);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  198  			doff = req->dst->offset;
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  199  		} else
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  200  			return -ENOSYS;
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  201  
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  202  		dpage = nth_page(dpage, doff / PAGE_SIZE);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  203  		doff = offset_in_page(doff);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  204  
e3f08b26257318 Herbert Xu                2025-04-23  205  		n = (dlen - 1) / PAGE_SIZE;
e3f08b26257318 Herbert Xu                2025-04-23  206  		n += (offset_in_page(dlen - 1) + doff) / PAGE_SIZE;
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  207  		if (PageHighMem(dpage + n) &&
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  208  		    size_add(doff, dlen) > PAGE_SIZE)
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  209  			return -ENOSYS;
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  210  		dst = kmap_local_page(dpage) + doff;
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  211  	}
c47e1f4142a382 Herbert Xu                2025-03-17  212  
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  213  	if (src_isvirt)
2c1808e5fe5afd Herbert Xu                2025-03-15  214  		src = req->svirt;
2c1808e5fe5afd Herbert Xu                2025-03-15  215  	else {
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  216  		src = NULL;
8a6771cda3f48a Herbert Xu                2025-03-15  217  		do {
5f3437e9c89eec Herbert Xu                2025-04-07  218  			if (slen <= req->src->length) {
8a6771cda3f48a Herbert Xu                2025-03-15  219  				spage = sg_page(req->src);
2d3553ecb4e316 Herbert Xu                2025-03-15  220  				soff = req->src->offset;
8a6771cda3f48a Herbert Xu                2025-03-15  221  			} else
8a6771cda3f48a Herbert Xu                2025-03-15  222  				break;
8a6771cda3f48a Herbert Xu                2025-03-15  223  
8a6771cda3f48a Herbert Xu                2025-03-15  224  			spage = nth_page(spage, soff / PAGE_SIZE);
2d3553ecb4e316 Herbert Xu                2025-03-15  225  			soff = offset_in_page(soff);
744e1885922a99 Chengming Zhou            2023-12-27  226  
002ba346e3d76b Herbert Xu                2025-04-21  227  			n = (slen - 1) / PAGE_SIZE;
002ba346e3d76b Herbert Xu                2025-04-21  228  			n += (offset_in_page(slen - 1) + soff) / PAGE_SIZE;
8a6771cda3f48a Herbert Xu                2025-03-15  229  			if (PageHighMem(nth_page(spage, n)) &&
8a6771cda3f48a Herbert Xu                2025-03-15  230  			    size_add(soff, slen) > PAGE_SIZE)
8a6771cda3f48a Herbert Xu                2025-03-15  231  				break;
2d3553ecb4e316 Herbert Xu                2025-03-15  232  			src = kmap_local_page(spage) + soff;
8a6771cda3f48a Herbert Xu                2025-03-15  233  		} while (0);
2c1808e5fe5afd Herbert Xu                2025-03-15  234  	}
77292bb8ca69c8 Barry Song                2024-03-02  235  
adcc2d83a6e670 Marco Elver               2025-02-19  236  	struct crypto_acomp_stream *stream = crypto_acomp_lock_stream_bh(&crypto_scomp_alg(scomp)->streams);
8a6771cda3f48a Herbert Xu                2025-03-15  237  
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  238  	if (!src_isvirt && !src) {
adcc2d83a6e670 Marco Elver               2025-02-19  239  		struct scomp_scratch *scratch = scomp_lock_scratch();
adcc2d83a6e670 Marco Elver               2025-02-19  240  		const u8 *src = scratch->src;
2d3553ecb4e316 Herbert Xu                2025-03-15  241  
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  242  		memcpy_from_sglist(scratch->src, req->src, 0, slen);
2d3553ecb4e316 Herbert Xu                2025-03-15  243  
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  244  		if (dir)
2d3553ecb4e316 Herbert Xu                2025-03-15  245  			ret = crypto_scomp_compress(scomp, src, slen,
2d3553ecb4e316 Herbert Xu                2025-03-15  246  						    dst, &dlen, stream->ctx);
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  247  		else
2d3553ecb4e316 Herbert Xu                2025-03-15  248  			ret = crypto_scomp_decompress(scomp, src, slen,
2d3553ecb4e316 Herbert Xu                2025-03-15  249  						      dst, &dlen, stream->ctx);
2d3553ecb4e316 Herbert Xu                2025-03-15  250  
42d9f6c774790d Herbert Xu                2025-03-19 @251  		scomp_unlock_scratch(scratch);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  252  	} else if (dir)
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  253  		ret = crypto_scomp_compress(scomp, src, slen,
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  254  					    dst, &dlen, stream->ctx);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  255  	else
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  256  		ret = crypto_scomp_decompress(scomp, src, slen,
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  257  					      dst, &dlen, stream->ctx);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  258  
42d9f6c774790d Herbert Xu                2025-03-19 @259  	crypto_acomp_unlock_stream_bh(stream);
2d3553ecb4e316 Herbert Xu                2025-03-15  260  
2d3553ecb4e316 Herbert Xu                2025-03-15  261  	req->dlen = dlen;
77292bb8ca69c8 Barry Song                2024-03-02  262  
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  263  	if (!src_isvirt && src)
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  264  		kunmap_local(src);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  265  	if (!dst_isvirt) {
2d3553ecb4e316 Herbert Xu                2025-03-15  266  		kunmap_local(dst);
2d3553ecb4e316 Herbert Xu                2025-03-15  267  		dlen += doff;
2d3553ecb4e316 Herbert Xu                2025-03-15  268  		for (;;) {
2d3553ecb4e316 Herbert Xu                2025-03-15  269  			flush_dcache_page(dpage);
2d3553ecb4e316 Herbert Xu                2025-03-15  270  			if (dlen <= PAGE_SIZE)
2d3553ecb4e316 Herbert Xu                2025-03-15  271  				break;
2d3553ecb4e316 Herbert Xu                2025-03-15  272  			dlen -= PAGE_SIZE;
2d3553ecb4e316 Herbert Xu                2025-03-15  273  			dpage = nth_page(dpage, 1);
77292bb8ca69c8 Barry Song                2024-03-02  274  		}
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  275  	}
2d3553ecb4e316 Herbert Xu                2025-03-15  276  
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  277  	return ret;
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  278  }
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  279  

:::::: The code at line 251 was first introduced by commit
:::::: 42d9f6c774790d290c175e8775ce9f1366438098 crypto: acomp - Move scomp stream allocation code into acomp

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
