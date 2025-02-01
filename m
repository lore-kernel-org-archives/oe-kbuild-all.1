Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C7F4690
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 03:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738380186; cv=none; b=T9uKpFVhS3eCmhIU9t/goPfCul1EDcjYYcqKmbvRUqkkNQ4om84rgSuH5Ay9VMi2+8YTLOyMLUkEgyXAoIHYMrXkN1+hj2ZSxjAi5SA/oCHaIt2PxyP11NQMPSYQILUnaqV8z+aLiS5wuVOObi1xOQl7EyD+FPZ3MY8Eupl9aMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738380186; c=relaxed/simple;
	bh=W10lhWzRO8eYhJBHB1rcSyfgSsdTgo5VQiklPeSBOOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eN6jNIiZ5LeVUpORl//+4rKtsyHHmzKy/fG4NlPslUQZAZQf9wHLunYZpLg1p9CdeXktfe8mDAqy1/pNAo+nA8nXPbln7R7pAcMKrV7KXhqeRrhklvERWnXtuOmSItWCzy4DuNLoMnoBzIeQHmk99E5XxbWZMz9fOgksya3BsZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXPvuKUW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXPvuKUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738380185; x=1769916185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W10lhWzRO8eYhJBHB1rcSyfgSsdTgo5VQiklPeSBOOg=;
  b=SXPvuKUWPdpIvAefMGwakSoYld5g+h7UBS8TAcIkYb10gK03yMIC/qd1
   N7W7UkqrdRg1o4w9ggJz78PQy0EC7ZpMW+6n7ZfgJbOnqwl2/fChLjJii
   gxSgQp4gNCmq8UbicUBf1ktoQQ+7xY+PixPAHZ3HCBnF60xvYKKKxzEaB
   WFus7qBUJispCkTPP/g2XQ+6m8pYxJmtcZciAl3sl9HVYFonOrGxqpr86
   SU2k4VV8NKyz+uQMM0WCE9UW+kt9nZRRyWtm+G64+7/a3BS6p1bGh0FPz
   z5RmAN7dld+asWVb0eHZwCo6lwn3I9YMfHiGOpVhNIFunM2e3GqArIAyE
   A==;
X-CSE-ConnectionGUID: goSR+0k0RWK3aqj5JVoE6w==
X-CSE-MsgGUID: BF20UJoEQLSUCUmXH+XNIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38657557"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; 
   d="scan'208";a="38657557"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 19:23:04 -0800
X-CSE-ConnectionGUID: xBbcWnxnT6Gn6UgQM1dzvA==
X-CSE-MsgGUID: NjCSFdXUQsOn/Tfrc7NEwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110668567"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Jan 2025 19:23:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te460-000ngN-0p;
	Sat, 01 Feb 2025 03:23:00 +0000
Date: Sat, 1 Feb 2025 11:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-mk-pte 7/9]
 arch/um/include/asm/pgtable.h:272:17: error: implicit declaration of
 function 'pte_mknewprot'
Message-ID: <202502011131.2xOhvwjl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-mk-pte
head:   44333e58349adcdfcb5b34f6086bf7c01dfd9c9a
commit: a225e946006795d33af26ec560a4f454379959e1 [7/9] um: Remove custom definition of mk_pte()
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250201/202502011131.2xOhvwjl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502011131.2xOhvwjl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502011131.2xOhvwjl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/ring_buffer.h:5,
                    from include/linux/trace_events.h:6,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from init/main.c:21:
   arch/um/include/asm/pgtable.h: In function 'pfn_pte':
>> arch/um/include/asm/pgtable.h:272:17: error: implicit declaration of function 'pte_mknewprot' [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^~~~~~~~~~~~~
>> arch/um/include/asm/pgtable.h:272:31: error: implicit declaration of function 'pte_mknewpage'; did you mean 'pte_mkread'? [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^~~~~~~~~~~~~
         |                               pte_mkread
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from kernel/kthread.c:11:
   arch/um/include/asm/pgtable.h: In function 'pfn_pte':
>> arch/um/include/asm/pgtable.h:272:17: error: implicit declaration of function 'pte_mknewprot' [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^~~~~~~~~~~~~
>> arch/um/include/asm/pgtable.h:272:31: error: implicit declaration of function 'pte_mknewpage'; did you mean 'pte_mkread'? [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^~~~~~~~~~~~~
         |                               pte_mkread
   kernel/kthread.c: In function 'kthread_affine_preferred':
   kernel/kthread.c:862:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     862 |         int ret;
         |             ^~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from kernel/audit.c:38:
   arch/um/include/asm/pgtable.h: In function 'pfn_pte':
>> arch/um/include/asm/pgtable.h:272:17: error: implicit declaration of function 'pte_mknewprot' [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^~~~~~~~~~~~~
>> arch/um/include/asm/pgtable.h:272:31: error: implicit declaration of function 'pte_mknewpage'; did you mean 'pte_mkread'? [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^~~~~~~~~~~~~
         |                               pte_mkread
   kernel/audit.c: In function 'audit_log_vformat':
   kernel/audit.c:1978:9: warning: function 'audit_log_vformat' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1978 |         len = vsnprintf(skb_tail_pointer(skb), avail, fmt, args);
         |         ^~~
   kernel/audit.c:1987:17: warning: function 'audit_log_vformat' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1987 |                 len = vsnprintf(skb_tail_pointer(skb), avail, fmt, args2);
         |                 ^~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/kallsyms.h:13,
                    from lib/vsprintf.c:30:
   arch/um/include/asm/pgtable.h: In function 'pfn_pte':
>> arch/um/include/asm/pgtable.h:272:17: error: implicit declaration of function 'pte_mknewprot' [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^~~~~~~~~~~~~
>> arch/um/include/asm/pgtable.h:272:31: error: implicit declaration of function 'pte_mknewpage'; did you mean 'pte_mkread'? [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^~~~~~~~~~~~~
         |                               pte_mkread
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1704:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1704 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dmapool.h:14,
                    from include/linux/pci.h:1660,
                    from lib/iomap.c:7:
   arch/um/include/asm/pgtable.h: In function 'pfn_pte':
>> arch/um/include/asm/pgtable.h:272:17: error: implicit declaration of function 'pte_mknewprot' [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^~~~~~~~~~~~~
>> arch/um/include/asm/pgtable.h:272:31: error: implicit declaration of function 'pte_mknewpage'; did you mean 'pte_mkread'? [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^~~~~~~~~~~~~
         |                               pte_mkread
   lib/iomap.c: At top level:
   lib/iomap.c:156:5: warning: no previous prototype for 'ioread64_lo_hi' [-Wmissing-prototypes]
     156 | u64 ioread64_lo_hi(const void __iomem *addr)
         |     ^~~~~~~~~~~~~~
   lib/iomap.c:163:5: warning: no previous prototype for 'ioread64_hi_lo' [-Wmissing-prototypes]
     163 | u64 ioread64_hi_lo(const void __iomem *addr)
         |     ^~~~~~~~~~~~~~
   lib/iomap.c:170:5: warning: no previous prototype for 'ioread64be_lo_hi' [-Wmissing-prototypes]
     170 | u64 ioread64be_lo_hi(const void __iomem *addr)
         |     ^~~~~~~~~~~~~~~~
   lib/iomap.c:178:5: warning: no previous prototype for 'ioread64be_hi_lo' [-Wmissing-prototypes]
     178 | u64 ioread64be_hi_lo(const void __iomem *addr)
         |     ^~~~~~~~~~~~~~~~
   lib/iomap.c:264:6: warning: no previous prototype for 'iowrite64_lo_hi' [-Wmissing-prototypes]
     264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
         |      ^~~~~~~~~~~~~~~
   lib/iomap.c:272:6: warning: no previous prototype for 'iowrite64_hi_lo' [-Wmissing-prototypes]
     272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
         |      ^~~~~~~~~~~~~~~
   lib/iomap.c:280:6: warning: no previous prototype for 'iowrite64be_lo_hi' [-Wmissing-prototypes]
     280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
         |      ^~~~~~~~~~~~~~~~~
   lib/iomap.c:288:6: warning: no previous prototype for 'iowrite64be_hi_lo' [-Wmissing-prototypes]
     288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
         |      ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/ring_buffer.h:5,
                    from include/linux/trace_events.h:6,
                    from include/trace/trace_events.h:21,
                    from include/trace/define_trace.h:113,
                    from samples/trace_events/trace-events-sample.h:636,
                    from samples/trace_events/trace-events-sample.c:12:
   arch/um/include/asm/pgtable.h: In function 'pfn_pte':
>> arch/um/include/asm/pgtable.h:272:17: error: implicit declaration of function 'pte_mknewprot' [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^~~~~~~~~~~~~
>> arch/um/include/asm/pgtable.h:272:31: error: implicit declaration of function 'pte_mknewpage'; did you mean 'pte_mkread'? [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^~~~~~~~~~~~~
         |                               pte_mkread
   samples/trace_events/./trace-events-sample.h: In function 'trace_event_get_offsets_foo_bar':
   include/trace/stages/stage5_get_offsets.h:33:31: warning: function 'trace_event_get_offsets_foo_bar' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      33 |         { (void)sizeof(struct _test_no_array_##item *); }
         |                               ^~~~~~~~~~~~~~~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/trace_events.h:43:30: note: in expansion of macro 'PARAMS'
      43 |                              PARAMS(tstruct),                  \
         |                              ^~~~~~
   samples/trace_events/./trace-events-sample.h:291:1: note: in expansion of macro 'TRACE_EVENT'
     291 | TRACE_EVENT(foo_bar,
         | ^~~~~~~~~~~
   samples/trace_events/./trace-events-sample.h:299:9: note: in expansion of macro 'TP_STRUCT__entry'
     299 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   samples/trace_events/./trace-events-sample.h:301:17: note: in expansion of macro '__field'
     301 |                 __field(        int,    bar                     )
         |                 ^~~~~~~
   samples/trace_events/./trace-events-sample.h: In function 'do_trace_event_raw_event_foo_bar':
   include/linux/compiler.h:237:61: warning: function 'do_trace_event_raw_event_foo_bar' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     237 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                             ^
   include/trace/trace_events.h:427:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
     427 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:435:23: note: in expansion of macro 'PARAMS'
     435 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ^~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   samples/trace_events/./trace-events-sample.h:291:1: note: in expansion of macro 'TRACE_EVENT'
     291 | TRACE_EVENT(foo_bar,
         | ^~~~~~~~~~~
   samples/trace_events/./trace-events-sample.h:310:9: note: in expansion of macro 'TP_fast_assign'
     310 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   include/linux/compiler.h:245:9: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     245 |         __BUILD_BUG_ON_ZERO_MSG(__annotated(p, nonstring), "must be cstr (NUL-terminated)")
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:83:62: note: in expansion of macro '__must_be_cstr'
      83 |         sized_strscpy(dst, src, size + __must_be_cstr(dst) + __must_be_cstr(src))
         |                                                              ^~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__strscpy1'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/string.h:114:9: note: in expansion of macro 'CONCATENATE'
     114 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~
   samples/trace_events/./trace-events-sample.h:311:17: note: in expansion of macro 'strscpy'
     311 |                 strscpy(__entry->foo, foo, 10);
         |                 ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:8,
                    from drivers/rapidio/rio_cm.c:12:
   arch/um/include/asm/pgtable.h: In function 'pfn_pte':
>> arch/um/include/asm/pgtable.h:272:17: error: implicit declaration of function 'pte_mknewprot' [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^~~~~~~~~~~~~
>> arch/um/include/asm/pgtable.h:272:31: error: implicit declaration of function 'pte_mknewpage'; did you mean 'pte_mkread'? [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^~~~~~~~~~~~~
         |                               pte_mkread
   drivers/rapidio/rio_cm.c: In function 'rio_txcq_handler':
   drivers/rapidio/rio_cm.c:675:21: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
     675 |                 int rc;
         |                     ^~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/ring_buffer.h:5,
                    from include/linux/trace_events.h:6,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from kernel/time/hrtimer.c:30:
   arch/um/include/asm/pgtable.h: In function 'pfn_pte':
>> arch/um/include/asm/pgtable.h:272:17: error: implicit declaration of function 'pte_mknewprot' [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^~~~~~~~~~~~~
>> arch/um/include/asm/pgtable.h:272:31: error: implicit declaration of function 'pte_mknewpage'; did you mean 'pte_mkread'? [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^~~~~~~~~~~~~
         |                               pte_mkread
   kernel/time/hrtimer.c: At top level:
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:124:35: warning: initialized field overwritten [-Woverride-init]
     124 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dmapool.h:14,
                    from include/linux/pci.h:1660,
                    from drivers/char/applicom.c:32:
   arch/um/include/asm/pgtable.h: In function 'pfn_pte':
>> arch/um/include/asm/pgtable.h:272:17: error: implicit declaration of function 'pte_mknewprot' [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^~~~~~~~~~~~~
>> arch/um/include/asm/pgtable.h:272:31: error: implicit declaration of function 'pte_mknewpage'; did you mean 'pte_mkread'? [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^~~~~~~~~~~~~
         |                               pte_mkread
   drivers/char/applicom.c: In function 'ac_register_board':
   drivers/char/applicom.c:130:32: warning: variable 'byte_reset_it' set but not used [-Wunused-but-set-variable]
     130 |         volatile unsigned char byte_reset_it;
         |                                ^~~~~~~~~~~~~
   drivers/char/applicom.c: In function 'ac_read':
   drivers/char/applicom.c:542:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     542 |         int ret = 0;
         |             ^~~
   drivers/char/applicom.c: In function 'ac_ioctl':
   drivers/char/applicom.c:705:32: warning: variable 'byte_reset_it' set but not used [-Wunused-but-set-variable]
     705 |         volatile unsigned char byte_reset_it;
         |                                ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from arch/um/include/asm/tlbflush.h:9,
                    from arch/um/include/asm/cacheflush.h:4,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/nfc/pn533/pn533.c:14:
   arch/um/include/asm/pgtable.h: In function 'pfn_pte':
>> arch/um/include/asm/pgtable.h:272:17: error: implicit declaration of function 'pte_mknewprot' [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^~~~~~~~~~~~~
>> arch/um/include/asm/pgtable.h:272:31: error: implicit declaration of function 'pte_mknewpage'; did you mean 'pte_mkread'? [-Werror=implicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^~~~~~~~~~~~~
         |                               pte_mkread
   In file included from include/linux/string.h:392,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:2186,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/nfc/pn533/pn533.c:9:
   In function 'fortify_memcpy_chk',
       inlined from 'pn533_target_found_felica' at drivers/nfc/pn533/pn533.c:781:2:
   include/linux/fortify-string.h:580:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     580 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..


vim +/pte_mknewprot +272 arch/um/include/asm/pgtable.h

   265	
   266	static inline pte_t pfn_pte(unsigned long pfn, pgprot_t pgprot)
   267	{
   268		pte_t pte;
   269	
   270		pte_set_val(pte, pfn_to_phys(pfn), pgprot);
   271		if (pte_present(pte))
 > 272			pte_mknewprot(pte_mknewpage(pte));
   273	
   274		return pte;
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
