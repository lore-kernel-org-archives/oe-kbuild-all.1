Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073F62837D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 01:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720487566; cv=none; b=nFduz0XuR3hMy1o+kUmBihWGgHUcbsgRYJZHXFIVoSF3GIhh9hhjGuU86aJkj68TTFM7Uw2t8NfWZweKWIrJH8D2GXp4rnE1sfBKhwm+EvJ3JUvhOJ+JmFt8zIycnCvxnXk3eiJDnOk6yrbQSuUSsVCX6c6WlmOTZpQmKQ2auZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720487566; c=relaxed/simple;
	bh=C8kR6DmJPT94DCGLMWvwbPRnhdCp+n4WNa5yRdIpapI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FrYLTCYJeg/zQ8EMHO9iITutpHitotEUQlPlo67hswiXSWtNGb/1I95NkSw5TeDjW0sSRe5QjiDSOSoI5CUe3Na16oDuDw+4norzMJlAPi+F3rD27tWCZJGMALeGwUHWovGm52tZPhGgd4w26W/aEHZkONvFm3w7Q6Jeur7XqJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHoqHK8I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHoqHK8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720487563; x=1752023563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C8kR6DmJPT94DCGLMWvwbPRnhdCp+n4WNa5yRdIpapI=;
  b=WHoqHK8IqWvey5N345mwVjTY+h1YH7wPu2N3JfUeA/glQ6KaHSgQjL6w
   PGTrmOtQbcMHYGGL419uhrJgUlzcJCb/QJulVpkT1pX5IkGA/iqCWb6Vc
   N4jdzYrR3m3vd3DnQ7frWFhYvFJhL2jeZPz48XSFWx+1U4j+HsDVanJ2T
   bHBpnMohM2YaUNCI4AEzc/1yZIqEhGmQ9AkMANZxrZRv3y/CmwcAOajJY
   uaXQGZzDafGCn0fx7hztuJfQ/UW5xifWV488M681L6ZMqgLzLxrpbc2PZ
   i7pVYBTC71zpGtuMnxD2Fpz/jYz7kyIRkLAjuEFspGxK3vUF1Xj6/qq4p
   w==;
X-CSE-ConnectionGUID: 5yj2XDUFSzOZ4QN6SCw5iw==
X-CSE-MsgGUID: ZkVxlOy6Qi+LO4rwdShX1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21528490"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="21528490"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 18:12:41 -0700
X-CSE-ConnectionGUID: kTX1Bn9FSfOExVrWxkIMkw==
X-CSE-MsgGUID: NNd0BRoJQneyLBr847pW+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="48344337"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Jul 2024 18:12:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQzPK-000WBo-0g;
	Tue, 09 Jul 2024 01:12:38 +0000
Date: Tue, 9 Jul 2024 09:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/slab-v6.11/typed-alloc/v1 3/5]
 drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a
 bit-field
Message-ID: <202407090928.6UaOAZAJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/slab-v6.11/typed-alloc/v1
head:   6e7fe92b1c5b0a4fd99772e8769e8adf7d296bc1
commit: cc4265a19e8f49c42f22458ab1ea9273cf4dfad5 [3/5] slab: Detect negative size values and saturate
config: x86_64-randconfig-002-20240709 (https://download.01.org/0day-ci/archive/20240709/202407090928.6UaOAZAJ-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090928.6UaOAZAJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407090928.6UaOAZAJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from arch/x86/include/asm/msr.h:15,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/usb/gadget/function/f_tcm.c:10:
   drivers/usb/gadget/function/f_tcm.c: In function 'bot_prepare_reqs':
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:9: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |         ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:697:18: note: in expansion of macro 'kmalloc_sized'
     697 |  unsigned char:  kmalloc_sized(__force_integral_expr(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:697:32: note: in expansion of macro '__force_integral_expr'
     697 |  unsigned char:  kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:27: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |                           ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:697:18: note: in expansion of macro 'kmalloc_sized'
     697 |  unsigned char:  kmalloc_sized(__force_integral_expr(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:697:32: note: in expansion of macro '__force_integral_expr'
     697 |  unsigned char:  kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:9: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |         ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:698:18: note: in expansion of macro 'kmalloc_sized'
     698 |  unsigned short: kmalloc_sized(__force_integral_expr(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:698:32: note: in expansion of macro '__force_integral_expr'
     698 |  unsigned short: kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:27: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |                           ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:698:18: note: in expansion of macro 'kmalloc_sized'
     698 |  unsigned short: kmalloc_sized(__force_integral_expr(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:698:32: note: in expansion of macro '__force_integral_expr'
     698 |  unsigned short: kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:9: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |         ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:699:18: note: in expansion of macro 'kmalloc_sized'
     699 |  unsigned int:   kmalloc_sized(__force_integral_expr(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:699:32: note: in expansion of macro '__force_integral_expr'
     699 |  unsigned int:   kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:27: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |                           ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:699:18: note: in expansion of macro 'kmalloc_sized'
     699 |  unsigned int:   kmalloc_sized(__force_integral_expr(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:699:32: note: in expansion of macro '__force_integral_expr'
     699 |  unsigned int:   kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:9: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |         ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:700:18: note: in expansion of macro 'kmalloc_sized'
     700 |  unsigned long:  kmalloc_sized(__force_integral_expr(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:700:32: note: in expansion of macro '__force_integral_expr'
     700 |  unsigned long:  kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:27: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |                           ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:700:18: note: in expansion of macro 'kmalloc_sized'
     700 |  unsigned long:  kmalloc_sized(__force_integral_expr(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:700:32: note: in expansion of macro '__force_integral_expr'
     700 |  unsigned long:  kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:9: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |         ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:701:18: note: in expansion of macro 'kmalloc_sized'
     701 |  signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:691:10: note: in expansion of macro '__force_integral_expr'
     691 |   typeof(__force_integral_expr(x)) __forced_val = \
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:701:32: note: in expansion of macro '__size_force_positive'
     701 |  signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> include/linux/compiler_types.h:466:2: error: 'typeof' applied to a bit-field
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/alloc_tag.h:206:9: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |         ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:701:18: note: in expansion of macro 'kmalloc_sized'
     701 |  signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:691:10: note: in expansion of macro '__force_integral_expr'
     691 |   typeof(__force_integral_expr(x)) __forced_val = \
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:701:32: note: in expansion of macro '__size_force_positive'
     701 |  signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:9: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |         ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:701:18: note: in expansion of macro 'kmalloc_sized'
     701 |  signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:692:4: note: in expansion of macro '__force_integral_expr'
     692 |    __force_integral_expr(x);  \
         |    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:701:32: note: in expansion of macro '__size_force_positive'
     701 |  signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:27: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |                           ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:701:18: note: in expansion of macro 'kmalloc_sized'
     701 |  signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:691:10: note: in expansion of macro '__force_integral_expr'
     691 |   typeof(__force_integral_expr(x)) __forced_val = \
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:701:32: note: in expansion of macro '__size_force_positive'
     701 |  signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> include/linux/compiler_types.h:466:2: error: 'typeof' applied to a bit-field
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/alloc_tag.h:206:27: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |                           ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:701:18: note: in expansion of macro 'kmalloc_sized'
     701 |  signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:691:10: note: in expansion of macro '__force_integral_expr'
     691 |   typeof(__force_integral_expr(x)) __forced_val = \
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:701:32: note: in expansion of macro '__size_force_positive'
     701 |  signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:27: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |                           ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:701:18: note: in expansion of macro 'kmalloc_sized'
     701 |  signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:692:4: note: in expansion of macro '__force_integral_expr'
     692 |    __force_integral_expr(x);  \
         |    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:701:32: note: in expansion of macro '__size_force_positive'
     701 |  signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:9: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |         ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:702:18: note: in expansion of macro 'kmalloc_sized'
     702 |  signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:691:10: note: in expansion of macro '__force_integral_expr'
     691 |   typeof(__force_integral_expr(x)) __forced_val = \
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:702:32: note: in expansion of macro '__size_force_positive'
     702 |  signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> include/linux/compiler_types.h:466:2: error: 'typeof' applied to a bit-field
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/alloc_tag.h:206:9: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |         ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:702:18: note: in expansion of macro 'kmalloc_sized'
     702 |  signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:691:10: note: in expansion of macro '__force_integral_expr'
     691 |   typeof(__force_integral_expr(x)) __forced_val = \
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:702:32: note: in expansion of macro '__size_force_positive'
     702 |  signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:9: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |         ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:702:18: note: in expansion of macro 'kmalloc_sized'
     702 |  signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:692:4: note: in expansion of macro '__force_integral_expr'
     692 |    __force_integral_expr(x);  \
         |    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:702:32: note: in expansion of macro '__size_force_positive'
     702 |  signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:27: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |                           ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:702:18: note: in expansion of macro 'kmalloc_sized'
     702 |  signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:691:10: note: in expansion of macro '__force_integral_expr'
     691 |   typeof(__force_integral_expr(x)) __forced_val = \
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:702:32: note: in expansion of macro '__size_force_positive'
     702 |  signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> include/linux/compiler_types.h:466:2: error: 'typeof' applied to a bit-field
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/alloc_tag.h:206:27: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |                           ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:702:18: note: in expansion of macro 'kmalloc_sized'
     702 |  signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:691:10: note: in expansion of macro '__force_integral_expr'
     691 |   typeof(__force_integral_expr(x)) __forced_val = \
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:702:32: note: in expansion of macro '__size_force_positive'
     702 |  signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:27: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |                           ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:702:18: note: in expansion of macro 'kmalloc_sized'
     702 |  signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:692:4: note: in expansion of macro '__force_integral_expr'
     692 |    __force_integral_expr(x);  \
         |    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:702:32: note: in expansion of macro '__size_force_positive'
     702 |  signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:9: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |         ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:703:18: note: in expansion of macro 'kmalloc_sized'
     703 |  signed int:     kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                         ^~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:691:10: note: in expansion of macro '__force_integral_expr'
     691 |   typeof(__force_integral_expr(x)) __forced_val = \
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:703:32: note: in expansion of macro '__size_force_positive'
     703 |  signed int:     kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
   include/linux/compiler_types.h:466:2: error: 'typeof' applied to a bit-field
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/alloc_tag.h:206:9: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |         ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:703:18: note: in expansion of macro 'kmalloc_sized'
     703 |  signed int:     kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:468:2: note: in expansion of macro '___force_integral_expr'
     468 |  ___force_integral_expr(x, int, 0)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:691:10: note: in expansion of macro '__force_integral_expr'
     691 |   typeof(__force_integral_expr(x)) __forced_val = \
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:703:32: note: in expansion of macro '__size_force_positive'
     703 |  signed int:     kmalloc_sized(__size_force_positive(p), gfp), \
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:16: note: in expansion of macro 'kmalloc'
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                ^~~~~~~
   drivers/usb/gadget/function/f_tcm.c:330:24: error: 'typeof' applied to a bit-field
     330 |  fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                        ^~
   include/linux/alloc_tag.h:206:9: note: in definition of macro 'alloc_hooks_tag'
     206 |  typeof(_do_alloc) _res = _do_alloc;    \
         |         ^~~~~~~~~
   include/linux/slab.h:687:30: note: in expansion of macro 'alloc_hooks'
     687 | #define kmalloc_sized(...)   alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                              ^~~~~~~~~~~
   include/linux/slab.h:703:18: note: in expansion of macro 'kmalloc_sized'
     703 |  signed int:     kmalloc_sized(__size_force_positive(p), gfp), \
         |                  ^~~~~~~~~~~~~
   include/linux/compiler_types.h:462:22: note: in expansion of macro '__same_type'
     462 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                      ^~~~~~~~~~~
   include/linux/compiler_types.h:466:25: note: in expansion of macro '__is_ptr'
     466 |  __builtin_choose_expr(!__is_ptr(x), (x), (type)val)


vim +/typeof +330 drivers/usb/gadget/function/f_tcm.c

08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  304  
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  305  static int bot_prepare_reqs(struct f_uas *fu)
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  306  {
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  307  	int ret;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  308  
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  309  	fu->bot_req_in = usb_ep_alloc_request(fu->ep_in, GFP_KERNEL);
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  310  	if (!fu->bot_req_in)
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  311  		goto err;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  312  
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  313  	fu->bot_req_out = usb_ep_alloc_request(fu->ep_out, GFP_KERNEL);
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  314  	if (!fu->bot_req_out)
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  315  		goto err_out;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  316  
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  317  	fu->cmd.req = usb_ep_alloc_request(fu->ep_out, GFP_KERNEL);
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  318  	if (!fu->cmd.req)
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  319  		goto err_cmd;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  320  
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  321  	fu->bot_status.req = usb_ep_alloc_request(fu->ep_in, GFP_KERNEL);
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  322  	if (!fu->bot_status.req)
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  323  		goto err_sts;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  324  
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  325  	fu->bot_status.req->buf = &fu->bot_status.csw;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  326  	fu->bot_status.req->length = US_BULK_CS_WRAP_LEN;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  327  	fu->bot_status.req->complete = bot_status_complete;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  328  	fu->bot_status.csw.Signature = cpu_to_le32(US_BULK_CS_SIGN);
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  329  
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11 @330  	fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  331  	if (!fu->cmd.buf)
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  332  		goto err_buf;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  333  
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  334  	fu->cmd.req->complete = bot_cmd_complete;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  335  	fu->cmd.req->buf = fu->cmd.buf;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  336  	fu->cmd.req->length = fu->ep_out->maxpacket;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  337  	fu->cmd.req->context = fu;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  338  
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  339  	ret = bot_enqueue_cmd_cbw(fu);
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  340  	if (ret)
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  341  		goto err_queue;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  342  	return 0;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  343  err_queue:
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  344  	kfree(fu->cmd.buf);
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  345  	fu->cmd.buf = NULL;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  346  err_buf:
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  347  	usb_ep_free_request(fu->ep_in, fu->bot_status.req);
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  348  err_sts:
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  349  	usb_ep_free_request(fu->ep_out, fu->cmd.req);
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  350  	fu->cmd.req = NULL;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  351  err_cmd:
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  352  	usb_ep_free_request(fu->ep_out, fu->bot_req_out);
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  353  	fu->bot_req_out = NULL;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  354  err_out:
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  355  	usb_ep_free_request(fu->ep_in, fu->bot_req_in);
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  356  	fu->bot_req_in = NULL;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  357  err:
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  358  	pr_err("BOT: endpoint setup failed\n");
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  359  	return -ENOMEM;
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  360  }
08a1cb0f65fde6 Andrzej Pietrasiewicz 2015-12-11  361  

:::::: The code at line 330 was first introduced by commit
:::::: 08a1cb0f65fde6f0da1db77b847ea78dc3c102cb usb: gadget: tcm: factor out f_tcm

:::::: TO: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
:::::: CC: Nicholas Bellinger <nab@linux-iscsi.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
