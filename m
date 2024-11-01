Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AE784E1C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 17:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730482795; cv=none; b=ELx4zF6powjWCkJt61Bkjtho05p9dY3NS1qC0iUJ8Zj2XWzHFrfKdQmDk+4IPl5sjGG0wFSsCdxrwwC9PqaJHr7JuMNUtvy6a2+BXfNQzqdZED/gN2B5TDIf4i5N9h6dUuHaebmegbdVJ0R/uAPnAxt5oJ8HTi0bobPiU3TN5qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730482795; c=relaxed/simple;
	bh=gieGHQ4b5BX9fJK20r6WY/PYLtShQ0/6NHX2D+EOFkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yp/IJkan+szMwu1zV4EAy8XaAo30btlFHxmGpsdwYI2fJLcIzNkh8+YKoEaHECmMD3abBRvFvSTZaPhIXvBHlnhS7L9rql0g5v1Tlgl6xufgrGtYNMZkjmxn+pgkQTB/DG6s3abOjCAU/njG7A/4UpEsvWB+32kaQR14i0R4noA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4CCH6Je; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4CCH6Je"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730482793; x=1762018793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gieGHQ4b5BX9fJK20r6WY/PYLtShQ0/6NHX2D+EOFkI=;
  b=M4CCH6JesB2dNfySJDq6aFzisYVox2Mh9wzwQ1yomdsnm7hKXtqF5y1G
   asE1QuxwdI+y2qnXTomRXmCFTUGjuvP0gQ/6KhwRjfHyvdJiB/e8QRyjh
   vEmIk9Ax+ZmNCArP3beLYgbpp31/s64dLyYlfFAcbYR1g8oiFC4kOrtyQ
   5J+oT7EyKlfczwE53pKiqg8OAvp3WF42HJquy5DYiIDInJI5xrOzVLb3h
   uLZM1iuYv79cfqlH6a1vq0KHPQhu5+shbgCC9HIe4sbiWb7XzpZweVw2Q
   R4GeJEb6WTcRGoQErTf/3yIMaOGNYdTwz7DT+9s93iwTf9FyE6mi5q5np
   A==;
X-CSE-ConnectionGUID: 0WsqilDLS4W9kzinYt4gIA==
X-CSE-MsgGUID: y9H2aB2JT2eln8jDy/6EUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="29683398"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="29683398"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 10:39:52 -0700
X-CSE-ConnectionGUID: yQzOC5/4TAu5UfK9A6hr1A==
X-CSE-MsgGUID: 86ZFDhNJQxO0LQXck8UDrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="120487163"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Nov 2024 10:39:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6vcj-000hot-0e;
	Fri, 01 Nov 2024 17:39:49 +0000
Date: Sat, 2 Nov 2024 01:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Xing <cedric.xing@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 1/2] tsm: Add TVM Measurement Register Support
Message-ID: <202411012352.4BJbd8zP-lkp@intel.com>
References: <20241031-tsm-rtmr-v2-1-1a6762795911@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031-tsm-rtmr-v2-1-1a6762795911@intel.com>

Hi Cedric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 81983758430957d9a5cb3333fe324fd70cf63e7e]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Xing/tsm-Add-TVM-Measurement-Register-Support/20241101-005324
base:   81983758430957d9a5cb3333fe324fd70cf63e7e
patch link:    https://lore.kernel.org/r/20241031-tsm-rtmr-v2-1-1a6762795911%40intel.com
patch subject: [PATCH RFC v2 1/2] tsm: Add TVM Measurement Register Support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241101/202411012352.4BJbd8zP-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411012352.4BJbd8zP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411012352.4BJbd8zP-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                  ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/virt/coco/tsm-mr.c:136:9: note: in expansion of macro 'BUG_ON'
     136 |         BUG_ON(mr->mr_size != attr->size);
         |         ^~~~~~
   drivers/virt/coco/tsm-mr.c:143:15: error: invalid use of undefined type 'const struct tsm_measurement_register'
     143 |         if (mr->mr_flags & TSM_MR_F_X)
         |               ^~
   drivers/virt/coco/tsm-mr.c:143:28: error: 'TSM_MR_F_X' undeclared (first use in this function)
     143 |         if (mr->mr_flags & TSM_MR_F_X)
         |                            ^~~~~~~~~~
   drivers/virt/coco/tsm-mr.c:146:26: error: invalid use of undefined type 'const struct tsm_measurement_register'
     146 |                 memcpy(mr->mr_value, page, count);
         |                          ^~
   drivers/virt/coco/tsm-mr.c: In function '_mrdir_create':
   drivers/virt/coco/tsm-mr.c:174:18: error: invalid use of undefined type 'const struct tsm_measurement_register'
     174 |         BUG_ON(mr->mr_flags & TSM_MR_F_F);
         |                  ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/virt/coco/tsm-mr.c:174:9: note: in expansion of macro 'BUG_ON'
     174 |         BUG_ON(mr->mr_flags & TSM_MR_F_F);
         |         ^~~~~~
   drivers/virt/coco/tsm-mr.c:174:31: error: 'TSM_MR_F_F' undeclared (first use in this function)
     174 |         BUG_ON(mr->mr_flags & TSM_MR_F_F);
         |                               ^~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/virt/coco/tsm-mr.c:174:9: note: in expansion of macro 'BUG_ON'
     174 |         BUG_ON(mr->mr_flags & TSM_MR_F_F);
         |         ^~~~~~
   drivers/virt/coco/tsm-mr.c:181:15: error: invalid use of undefined type 'const struct tsm_measurement_register'
     181 |         if (mr->mr_flags & TSM_MR_F_W)
         |               ^~
   drivers/virt/coco/tsm-mr.c:181:28: error: 'TSM_MR_F_W' undeclared (first use in this function)
     181 |         if (mr->mr_flags & TSM_MR_F_W)
         |                            ^~~~~~~~~~
   drivers/virt/coco/tsm-mr.c:183:15: error: invalid use of undefined type 'const struct tsm_measurement_register'
     183 |         if (mr->mr_flags & TSM_MR_F_R)
         |               ^~
   drivers/virt/coco/tsm-mr.c:183:28: error: 'TSM_MR_F_R' undeclared (first use in this function)
     183 |         if (mr->mr_flags & TSM_MR_F_R)
         |                            ^~~~~~~~~~
   drivers/virt/coco/tsm-mr.c:186:48: error: invalid use of undefined type 'const struct tsm_measurement_register'
     186 |         mrd->battrs[_MRDIR_BA_DIGEST].size = mr->mr_size;
         |                                                ^~
   drivers/virt/coco/tsm-mr.c:193:37: error: invalid use of undefined type 'const struct tsm_measurement_register'
     193 |                                   mr->mr_name);
         |                                     ^~
   drivers/virt/coco/tsm-mr.c: In function '_mr_provider_create':
   drivers/virt/coco/tsm-mr.c:226:17: error: invalid use of undefined type 'struct tsm_measurement'
     226 |         if (!tmr->name || !tmr->mrs || !tmr->refresh || !tmr->extend)
         |                 ^~
   drivers/virt/coco/tsm-mr.c:226:31: error: invalid use of undefined type 'struct tsm_measurement'
     226 |         if (!tmr->name || !tmr->mrs || !tmr->refresh || !tmr->extend)
         |                               ^~
   drivers/virt/coco/tsm-mr.c:226:44: error: invalid use of undefined type 'struct tsm_measurement'
     226 |         if (!tmr->name || !tmr->mrs || !tmr->refresh || !tmr->extend)
         |                                            ^~
   drivers/virt/coco/tsm-mr.c:226:61: error: invalid use of undefined type 'struct tsm_measurement'
     226 |         if (!tmr->name || !tmr->mrs || !tmr->refresh || !tmr->extend)
         |                                                             ^~
   drivers/virt/coco/tsm-mr.c:229:57: error: invalid use of undefined type 'struct tsm_measurement'
     229 |         rc = kobject_set_name(&pvd->kset.kobj, "%s", tmr->name);
         |                                                         ^~
   In file included from include/linux/file.h:13,
                    from include/linux/shmem_fs.h:5:
   drivers/virt/coco/tsm-mr.c: In function '__free__unregister_measurement':
   drivers/virt/coco/tsm-mr.c:247:38: error: implicit declaration of function 'tsm_unregister_measurement' [-Wimplicit-function-declaration]
     247 |             if (!IS_ERR_OR_NULL(_T)) tsm_unregister_measurement(_T->tmr));
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:198:78: note: in definition of macro 'DEFINE_FREE'
     198 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                                              ^~~~~
   drivers/virt/coco/tsm-mr.c: At top level:
   drivers/virt/coco/tsm-mr.c:249:5: warning: no previous prototype for 'tsm_register_measurement' [-Wmissing-prototypes]
     249 | int tsm_register_measurement(struct tsm_measurement *tmr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virt/coco/tsm-mr.c: In function 'tsm_register_measurement':
   drivers/virt/coco/tsm-mr.c:261:28: error: invalid use of undefined type 'struct tsm_measurement'
     261 |         for (int i = 0; tmr->mrs[i].mr_name; ++i) {
         |                            ^~
   drivers/virt/coco/tsm-mr.c:263:24: error: invalid use of undefined type 'struct tsm_measurement'
     263 |                 if (tmr->mrs[i].mr_flags & TSM_MR_F_F) {
         |                        ^~
   drivers/virt/coco/tsm-mr.c:263:44: error: 'TSM_MR_F_F' undeclared (first use in this function)
     263 |                 if (tmr->mrs[i].mr_flags & TSM_MR_F_F) {
         |                                            ^~~~~~~~~~
   drivers/virt/coco/tsm-mr.c:268:56: error: invalid use of undefined type 'struct tsm_measurement'
     268 |                 struct _mrdir *mrd = _mrdir_create(&tmr->mrs[i], pvd);
         |                                                        ^~
   In file included from include/linux/percpu.h:5,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from include/linux/mmzone.h:22,
                    from include/linux/swap.h:7:
>> drivers/virt/coco/tsm-mr.c:292:41: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
     292 |                 mrfiles = kcalloc(sizeof(*mrfiles), nr, GFP_KERNEL);
         |                                         ^
   include/linux/alloc_tag.h:202:16: note: in definition of macro 'alloc_hooks_tag'
     202 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/slab.h:925:49: note: in expansion of macro 'alloc_hooks'
     925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:964:41: note: in expansion of macro 'kmalloc_array'
     964 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/virt/coco/tsm-mr.c:292:27: note: in expansion of macro 'kcalloc'
     292 |                 mrfiles = kcalloc(sizeof(*mrfiles), nr, GFP_KERNEL);
         |                           ^~~~~~~
   drivers/virt/coco/tsm-mr.c:292:41: note: earlier argument should specify number of elements, later size of each element
     292 |                 mrfiles = kcalloc(sizeof(*mrfiles), nr, GFP_KERNEL);
         |                                         ^
   include/linux/alloc_tag.h:202:16: note: in definition of macro 'alloc_hooks_tag'
     202 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/slab.h:925:49: note: in expansion of macro 'alloc_hooks'
     925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:964:41: note: in expansion of macro 'kmalloc_array'
     964 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/virt/coco/tsm-mr.c:292:27: note: in expansion of macro 'kcalloc'
     292 |                 mrfiles = kcalloc(sizeof(*mrfiles), nr, GFP_KERNEL);
         |                           ^~~~~~~
>> drivers/virt/coco/tsm-mr.c:292:41: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
     292 |                 mrfiles = kcalloc(sizeof(*mrfiles), nr, GFP_KERNEL);
         |                                         ^
   include/linux/alloc_tag.h:202:34: note: in definition of macro 'alloc_hooks_tag'
     202 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   include/linux/slab.h:925:49: note: in expansion of macro 'alloc_hooks'
     925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:964:41: note: in expansion of macro 'kmalloc_array'
     964 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/virt/coco/tsm-mr.c:292:27: note: in expansion of macro 'kcalloc'
     292 |                 mrfiles = kcalloc(sizeof(*mrfiles), nr, GFP_KERNEL);
         |                           ^~~~~~~
   drivers/virt/coco/tsm-mr.c:292:41: note: earlier argument should specify number of elements, later size of each element
     292 |                 mrfiles = kcalloc(sizeof(*mrfiles), nr, GFP_KERNEL);
         |                                         ^
   include/linux/alloc_tag.h:202:34: note: in definition of macro 'alloc_hooks_tag'
     202 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   include/linux/slab.h:925:49: note: in expansion of macro 'alloc_hooks'
     925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:964:41: note: in expansion of macro 'kmalloc_array'
     964 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/virt/coco/tsm-mr.c:292:27: note: in expansion of macro 'kcalloc'
     292 |                 mrfiles = kcalloc(sizeof(*mrfiles), nr, GFP_KERNEL);
         |                           ^~~~~~~
   drivers/virt/coco/tsm-mr.c:293:40: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
     293 |                 battrs = kcalloc(sizeof(*battrs), nr + 1, GFP_KERNEL);
         |                                        ^
   include/linux/alloc_tag.h:202:16: note: in definition of macro 'alloc_hooks_tag'
     202 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/slab.h:925:49: note: in expansion of macro 'alloc_hooks'
     925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:964:41: note: in expansion of macro 'kmalloc_array'
     964 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/virt/coco/tsm-mr.c:293:26: note: in expansion of macro 'kcalloc'
     293 |                 battrs = kcalloc(sizeof(*battrs), nr + 1, GFP_KERNEL);
         |                          ^~~~~~~
   drivers/virt/coco/tsm-mr.c:293:40: note: earlier argument should specify number of elements, later size of each element
     293 |                 battrs = kcalloc(sizeof(*battrs), nr + 1, GFP_KERNEL);
         |                                        ^
   include/linux/alloc_tag.h:202:16: note: in definition of macro 'alloc_hooks_tag'
     202 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/slab.h:925:49: note: in expansion of macro 'alloc_hooks'
     925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:964:41: note: in expansion of macro 'kmalloc_array'
     964 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/virt/coco/tsm-mr.c:293:26: note: in expansion of macro 'kcalloc'
     293 |                 battrs = kcalloc(sizeof(*battrs), nr + 1, GFP_KERNEL);
         |                          ^~~~~~~
   drivers/virt/coco/tsm-mr.c:293:40: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
     293 |                 battrs = kcalloc(sizeof(*battrs), nr + 1, GFP_KERNEL);
         |                                        ^
   include/linux/alloc_tag.h:202:34: note: in definition of macro 'alloc_hooks_tag'
     202 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   include/linux/slab.h:925:49: note: in expansion of macro 'alloc_hooks'
     925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:964:41: note: in expansion of macro 'kmalloc_array'
     964 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/virt/coco/tsm-mr.c:293:26: note: in expansion of macro 'kcalloc'
     293 |                 battrs = kcalloc(sizeof(*battrs), nr + 1, GFP_KERNEL);
         |                          ^~~~~~~
   drivers/virt/coco/tsm-mr.c:293:40: note: earlier argument should specify number of elements, later size of each element
     293 |                 battrs = kcalloc(sizeof(*battrs), nr + 1, GFP_KERNEL);
         |                                        ^
   include/linux/alloc_tag.h:202:34: note: in definition of macro 'alloc_hooks_tag'
     202 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   include/linux/slab.h:925:49: note: in expansion of macro 'alloc_hooks'
     925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:964:41: note: in expansion of macro 'kmalloc_array'
     964 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/virt/coco/tsm-mr.c:293:26: note: in expansion of macro 'kcalloc'
     293 |                 battrs = kcalloc(sizeof(*battrs), nr + 1, GFP_KERNEL);
         |                          ^~~~~~~
   drivers/virt/coco/tsm-mr.c:297:43: error: invalid use of undefined type 'struct tsm_measurement'
     297 |                 for (int i = 0, j = 0; tmr->mrs[i].mr_name; ++i) {
         |                                           ^~
   drivers/virt/coco/tsm-mr.c:298:34: error: invalid use of undefined type 'struct tsm_measurement'
     298 |                         if (!(tmr->mrs[i].mr_flags & TSM_MR_F_F))
         |                                  ^~
   drivers/virt/coco/tsm-mr.c:301:51: error: invalid use of undefined type 'struct tsm_measurement'
     301 |                         mrfiles[j].attr.name = tmr->mrs[i].mr_name;
         |                                                   ^~
   drivers/virt/coco/tsm-mr.c:304:46: error: invalid use of undefined type 'struct tsm_measurement'
     304 |                         mrfiles[j].size = tmr->mrs[i].mr_size;


vim +292 drivers/virt/coco/tsm-mr.c

   245	
   246	DEFINE_FREE(_unregister_measurement, struct _mr_provider *,
   247		    if (!IS_ERR_OR_NULL(_T)) tsm_unregister_measurement(_T->tmr));
   248	
   249	int tsm_register_measurement(struct tsm_measurement *tmr)
   250	{
   251		static struct kobj_attribute _attr_hash = __ATTR_RO(hash_algo);
   252	
   253		struct _mr_provider *pvd __free(_unregister_measurement);
   254		int rc, nr;
   255	
   256		pvd = _mr_provider_create(tmr);
   257		if (IS_ERR(pvd))
   258			return PTR_ERR(pvd);
   259	
   260		nr = 0;
   261		for (int i = 0; tmr->mrs[i].mr_name; ++i) {
   262			// flat files are counted and skipped
   263			if (tmr->mrs[i].mr_flags & TSM_MR_F_F) {
   264				++nr;
   265				continue;
   266			}
   267	
 > 268			struct _mrdir *mrd = _mrdir_create(&tmr->mrs[i], pvd);
   269			if (IS_ERR(mrd))
   270				return PTR_ERR(mrd);
   271	
   272			struct attribute *attrs[] = {
   273				&_attr_hash.attr,
   274				NULL,
   275			};
   276			struct bin_attribute *battrs[_MRDIR_BA__COUNT + 1] = {};
   277			for (int j = 0; j < _MRDIR_BA__COUNT; ++j)
   278				battrs[j] = &mrd->battrs[j];
   279			struct attribute_group agrp = {
   280				.attrs = attrs,
   281				.bin_attrs = battrs,
   282			};
   283			rc = sysfs_create_group(&mrd->kobj, &agrp);
   284			if (rc)
   285				return rc;
   286		}
   287	
   288		if (nr > 0) {
   289			struct bin_attribute *mrfiles __free(kfree);
   290			struct bin_attribute **battrs __free(kfree);
   291	
 > 292			mrfiles = kcalloc(sizeof(*mrfiles), nr, GFP_KERNEL);
   293			battrs = kcalloc(sizeof(*battrs), nr + 1, GFP_KERNEL);
   294			if (!battrs || !mrfiles)
   295				return -ENOMEM;
   296	
   297			for (int i = 0, j = 0; tmr->mrs[i].mr_name; ++i) {
   298				if (!(tmr->mrs[i].mr_flags & TSM_MR_F_F))
   299					continue;
   300	
   301				mrfiles[j].attr.name = tmr->mrs[i].mr_name;
   302				mrfiles[j].read = _mr_read;
   303				mrfiles[j].write = _mr_write;
   304				mrfiles[j].size = tmr->mrs[i].mr_size;
   305				mrfiles[j].private = (void *)&tmr->mrs[i];
   306				if (tmr->mrs[i].mr_flags & TSM_MR_F_R)
   307					mrfiles[j].attr.mode |= S_IRUGO;
   308				if (tmr->mrs[i].mr_flags & TSM_MR_F_W)
   309					mrfiles[j].attr.mode |= S_IWUSR | S_IWGRP;
   310	
   311				battrs[j] = &mrfiles[j];
   312				++j;
   313	
   314				BUG_ON(j > nr);
   315			}
   316	
   317			struct attribute_group agrp = {
   318				.bin_attrs = battrs,
   319			};
   320			rc = sysfs_create_group(&pvd->kset.kobj, &agrp);
   321			if (rc)
   322				return rc;
   323	
   324			pvd->mrfiles = no_free_ptr(mrfiles);
   325		}
   326	
   327		pvd = NULL;
   328		return 0;
   329	}
   330	EXPORT_SYMBOL_GPL(tsm_register_measurement);
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
