Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAE1382F16
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388848; cv=none; b=SsjrEZffLT4OMj12J82WmLeEXQkwsgT4cvmg7WKK0Hg/7qz7aNUPqmsxjc/3J9Il6F4lhg0xRci3JaCFcGBVBiwbtgqSO8rgLcste7A3kfvMm2xFAjemdxNZS5UHsjDsdvBWBRV5gMA8alWr74Fg45RPaFfMudtL8dqe4N/8hLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388848; c=relaxed/simple;
	bh=B9W62SSO0Qh12Bq8aO+JvSut0n8PoS3oePAwg3bLTwc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RzS870ypundgzaavemD4xpWO/eAEcAmaQnaNrj8oqLBLoa3j7MUrOkYQ30c7zRw/P2bcv0zKQjIy3XhVpfJMm74SfraUzmRb4b++9YrKBXCxfYXYqVEFjrcZOe0KOWPcNp6ULEnedFJGrd9oVB7lyI0K+yolUXZnflFTT0ToO1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyDNppJw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyDNppJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780388847; x=1811924847;
  h=date:from:to:cc:subject:message-id;
  bh=B9W62SSO0Qh12Bq8aO+JvSut0n8PoS3oePAwg3bLTwc=;
  b=VyDNppJwvHfrFo/9CsGbu5AbRwwLrY6vaj29pvyTP4rnbS3tWhTdJOXC
   qp8WL4LoaL03M6YkNAivUhjTAS5b9IKtmtm8nom0UZcctzWkQ6hP10YtJ
   PFNiRnBqizylj70XKhxv9Ec8ZdR8utlDUXgSjXIHIxVXYH+YyVG4VyO6k
   ohzHFB64ruh+bggxNprefw9RuqlyqbxdZyj58BWVw4AvQc8cZOqWAH1Tn
   AEx8i9f6UchOwLu6FSfs0Xwozi9mqXhvl/T3SytFCQZ+OtsxhhrjKU/ve
   7GbAibiPsyRDyAp3ZeXW07PJI68Ka/rRT3psTGHru8WjbF6jAlx1UNGA4
   w==;
X-CSE-ConnectionGUID: M/Xxu4YBTHGGAQSGniMRAA==
X-CSE-MsgGUID: /3GrPDcUQW+Y9jx26OupIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80198578"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="80198578"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:27:26 -0700
X-CSE-ConnectionGUID: 4vKf5PIaQEatpwdJuovYoA==
X-CSE-MsgGUID: 6x1RgOBkTTawGA0+xKR7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="248926438"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Jun 2026 01:27:25 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUKT4-00000000Bik-3KFD;
	Tue, 02 Jun 2026 08:27:22 +0000
Date: Tue, 02 Jun 2026 16:26:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 include/linux/compiler_types.h:610:27: error: expression in static assertion
 is not an integer
Message-ID: <202606021626.y6hPK3ic-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 1ef39bbdce9099b285b9702e22c4defc277e42dd [290/290] ASoC: move struct snd_soc_card/snd_soc_card_driver to soc-card.[hc]
config: i386-randconfig-003-20260602 (https://download.01.org/0day-ci/archive/20260602/202606021626.y6hPK3ic-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021626.y6hPK3ic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021626.y6hPK3ic-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:22,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from arch/x86/include/asm/paravirt.h:19,
                    from arch/x86/include/asm/irqflags.h:100,
                    from include/linux/irqflags.h:18,
                    from arch/x86/include/asm/special_insns.h:10,
                    from arch/x86/include/asm/processor.h:25,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from sound/soc/sof/topology.c:12:
   sound/soc/sof/topology.c: In function 'sof_connect_dai_widget':
   sound/soc/sof/topology.c:1108:39: error: invalid use of undefined type 'struct snd_soc_card'
    1108 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |                                       ^~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:643:9: note: in expansion of macro 'list_entry'
     643 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:819:20: note: in expansion of macro 'list_first_entry'
     819 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1108:9: note: in expansion of macro 'list_for_each_entry'
    1108 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:30,
                    from sound/soc/sof/topology.c:11:
   sound/soc/sof/topology.c:1108:39: error: invalid use of undefined type 'struct snd_soc_card'
    1108 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |                                       ^~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:632:9: note: in expansion of macro 'container_of'
     632 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:643:9: note: in expansion of macro 'list_entry'
     643 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:819:20: note: in expansion of macro 'list_first_entry'
     819 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1108:9: note: in expansion of macro 'list_for_each_entry'
    1108 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1108:39: error: invalid use of undefined type 'struct snd_soc_card'
    1108 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |                                       ^~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:632:9: note: in expansion of macro 'container_of'
     632 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:643:9: note: in expansion of macro 'list_entry'
     643 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:819:20: note: in expansion of macro 'list_first_entry'
     819 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1108:9: note: in expansion of macro 'list_for_each_entry'
    1108 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:632:9: note: in expansion of macro 'container_of'
     632 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:643:9: note: in expansion of macro 'list_entry'
     643 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:819:20: note: in expansion of macro 'list_first_entry'
     819 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1108:9: note: in expansion of macro 'list_for_each_entry'
    1108 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/random.h:8:
   sound/soc/sof/topology.c:1108:39: error: invalid use of undefined type 'struct snd_soc_card'
    1108 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |                                       ^~
   include/linux/list.h:810:37: note: in definition of macro 'list_entry_is_head'
     810 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   sound/soc/sof/topology.c:1108:9: note: in expansion of macro 'list_for_each_entry'
    1108 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c: In function 'sof_disconnect_dai_widget':
   sound/soc/sof/topology.c:1173:39: error: invalid use of undefined type 'struct snd_soc_card'
    1173 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |                                       ^~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:643:9: note: in expansion of macro 'list_entry'
     643 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:819:20: note: in expansion of macro 'list_first_entry'
     819 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1173:9: note: in expansion of macro 'list_for_each_entry'
    1173 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1173:39: error: invalid use of undefined type 'struct snd_soc_card'
    1173 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |                                       ^~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:632:9: note: in expansion of macro 'container_of'
     632 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:643:9: note: in expansion of macro 'list_entry'
     643 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:819:20: note: in expansion of macro 'list_first_entry'
     819 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1173:9: note: in expansion of macro 'list_for_each_entry'
    1173 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1173:39: error: invalid use of undefined type 'struct snd_soc_card'
    1173 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |                                       ^~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:632:9: note: in expansion of macro 'container_of'
     632 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:643:9: note: in expansion of macro 'list_entry'
     643 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:819:20: note: in expansion of macro 'list_first_entry'
     819 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1173:9: note: in expansion of macro 'list_for_each_entry'
    1173 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:632:9: note: in expansion of macro 'container_of'
     632 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:643:9: note: in expansion of macro 'list_entry'
     643 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:819:20: note: in expansion of macro 'list_first_entry'
     819 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1173:9: note: in expansion of macro 'list_for_each_entry'
    1173 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1173:39: error: invalid use of undefined type 'struct snd_soc_card'
    1173 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |                                       ^~
   include/linux/list.h:810:37: note: in definition of macro 'list_entry_is_head'
     810 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   sound/soc/sof/topology.c:1173:9: note: in expansion of macro 'list_for_each_entry'
    1173 |         list_for_each_entry(rtd, &card->rtd_list_head, rtd_list) {
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c: In function 'sof_widget_ready':
   sound/soc/sof/topology.c:1586:47: error: invalid use of undefined type 'struct snd_soc_component'
    1586 |                                 dev_info(scomp->dev,
         |                                               ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/sof/topology.c:1586:33: note: in expansion of macro 'dev_info'
    1586 |                                 dev_info(scomp->dev,
         |                                 ^~~~~~~~
   In file included from include/linux/percpu.h:5,
                    from include/linux/radix-tree.h:16,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16:
   sound/soc/sof/topology.c: In function 'snd_sof_load_topology':
   sound/soc/sof/topology.c:2526:34: error: invalid use of undefined type 'struct snd_soc_card'
    2526 |         tplg_files = kcalloc(card->num_links, sizeof(char *), GFP_KERNEL);
         |                                  ^~
   include/linux/alloc_tag.h:253:16: note: in definition of macro 'alloc_hooks_tag'
     253 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:1099:49: note: in expansion of macro 'alloc_hooks'
    1099 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:1138:41: note: in expansion of macro 'kmalloc_array'
    1138 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   sound/soc/sof/topology.c:2526:22: note: in expansion of macro 'kcalloc'
    2526 |         tplg_files = kcalloc(card->num_links, sizeof(char *), GFP_KERNEL);
         |                      ^~~~~~~
   sound/soc/sof/topology.c:2526:34: error: invalid use of undefined type 'struct snd_soc_card'
    2526 |         tplg_files = kcalloc(card->num_links, sizeof(char *), GFP_KERNEL);
         |                                  ^~
   include/linux/alloc_tag.h:257:24: note: in definition of macro 'alloc_hooks_tag'
     257 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1099:49: note: in expansion of macro 'alloc_hooks'
    1099 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:1138:41: note: in expansion of macro 'kmalloc_array'
    1138 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   sound/soc/sof/topology.c:2526:22: note: in expansion of macro 'kcalloc'
    2526 |         tplg_files = kcalloc(card->num_links, sizeof(char *), GFP_KERNEL);
         |                      ^~~~~~~
   sound/soc/sof/topology.c:2526:34: error: invalid use of undefined type 'struct snd_soc_card'
    2526 |         tplg_files = kcalloc(card->num_links, sizeof(char *), GFP_KERNEL);
         |                                  ^~
   include/linux/alloc_tag.h:260:24: note: in definition of macro 'alloc_hooks_tag'
     260 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1099:49: note: in expansion of macro 'alloc_hooks'
    1099 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:1138:41: note: in expansion of macro 'kmalloc_array'
    1138 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   sound/soc/sof/topology.c:2526:22: note: in expansion of macro 'kcalloc'
    2526 |         tplg_files = kcalloc(card->num_links, sizeof(char *), GFP_KERNEL);
         |                      ^~~~~~~
   sound/soc/sof/topology.c:2526:20: error: assignment to 'const char **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2526 |         tplg_files = kcalloc(card->num_links, sizeof(char *), GFP_KERNEL);
         |                    ^
   sound/soc/sof/topology.c:2606:68: error: invalid use of undefined type 'struct snd_soc_component'


vim +610 include/linux/compiler_types.h

fd69b2f7d5f4e1 Peter Zijlstra 2026-01-16  608  
d15155824c5014 Will Deacon    2017-10-24  609  /* Are two types/vars the same type (ignoring qualifiers)? */
d15155824c5014 Will Deacon    2017-10-24 @610  #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
d15155824c5014 Will Deacon    2017-10-24  611  

:::::: The code at line 610 was first introduced by commit
:::::: d15155824c5014803d91b829736d249c500bdda6 linux/compiler.h: Split into compiler.h and compiler_types.h

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
