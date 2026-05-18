Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC053D091B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 07:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089398; cv=none; b=VbcnJDp0xliuU+Gn9G0QXAIB3bvZhXZjz0zU0UeUr2gdE9S8nkIG6hpUwf119aYako0QGIJdhCru/OUW83NFGzlJJSS86J6CX+um5Ip4EtXzdUyLD9n+TBC3P/URksypthF8yZw6HtBCPkv4Hg6c5lgU4Pnf/NHiaqUdbuSrbUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089398; c=relaxed/simple;
	bh=SS6bU/74mqBd1uSE0HLIpRK+fHuNJL/x0q3APS0wpVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gE0DYg48LcJWrh5DzK0+NhJb4uazLY31wNebTZORtC3Tb9AfgxTwLj/VKdKuzdLQL9cRpJahvPEryZ4jicPyQomGdBSwKVfA9NEvqlhcJpsUfW9FK2q46SPlkhMpV4TVL5ohPCKg7f5gfBgrMHPlLg41VDKCqX8ahV7mjBu8Ujg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWWt5a3B; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWWt5a3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779089396; x=1810625396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SS6bU/74mqBd1uSE0HLIpRK+fHuNJL/x0q3APS0wpVE=;
  b=cWWt5a3BuKmmhbgRMsg6byswLYiuPiu51zUwVxnsEF6cMmtJ2OFZ+R+5
   lh/V3Z2SOy1qU1IP2DJ29xjOjRPXJKK/IAwWzi5t3dB30z6zpSFv8+YYa
   7pmTtDFQeriy4VmU/c34FfgsoDePxuwRVmAYBSAbpUVQBilJIk7macelQ
   WpBMW3wPfw62vfipVocofgMqGdZYM2uRRx1pcTird3UHrCA+9CVKEL0V2
   kr/nCh0MdVr2MIji318Bu1ePcCqayHXIfI9qY2LDkzHTCOr96JZG0WnIW
   c3nz+6DmhlRdNNzszDzr2AhkwD2xxrDToYQrOKy8MDtMP6puKp9lnTZi0
   Q==;
X-CSE-ConnectionGUID: 3W2JQwOgSpitaY7lXnYdbw==
X-CSE-MsgGUID: QO5y5RxHQ967xclLufmdsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="91040290"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="91040290"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:29:55 -0700
X-CSE-ConnectionGUID: knHZvfTXQUyiwj9Y6pMjqg==
X-CSE-MsgGUID: SB2H0ZvUTYG1IECyGdIULQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="243636873"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 18 May 2026 00:29:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOsQB-000000009kj-247X;
	Mon, 18 May 2026 07:29:51 +0000
Date: Mon, 18 May 2026 09:29:16 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Bhupesh <bhupesh@igalia.com>
Subject: include/linux/string.h:116:50: error: passing argument 3 of
 'nla_put_string' makes pointer from integer without a cast
Message-ID: <202605180928.SFimsauK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/sched-Update-get_task_comm-comment/20260518-023906
head:   1b9c135d84ae615e18ef6eeb3d7a0a37b52cd016
commit: f07f318df7d38648966bfebdc5643ba0bcc531b5 treewide: Get rid of get_task_comm()
date:   13 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260518/202605180928.SFimsauK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180928.SFimsauK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180928.SFimsauK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from arch/x86/include/asm/paravirt.h:19,
                    from arch/x86/include/asm/irqflags.h:100,
                    from include/linux/irqflags.h:18,
                    from arch/x86/include/asm/special_insns.h:10,
                    from arch/x86/include/asm/processor.h:25,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/netfilter/nf_tables_api.c:8:
   net/netfilter/nf_tables_api.c: In function 'nf_tables_fill_gen_info':
>> include/linux/string.h:116:50: error: passing argument 3 of 'nla_put_string' makes pointer from integer without a cast [-Wint-conversion]
     116 | #define sized_strscpy_pad(dest, src, count)     ({                      \
         |                                                 ~^~~~~~~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  ssize_t {aka long int}
     117 |         char *__dst = (dest);                                           \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     118 |         const char *__src = (src);                                      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     119 |         const size_t __count = (count);                                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     120 |         ssize_t __wrote;                                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     121 |                                                                         \
         |                                                                         ~
     122 |         __wrote = sized_strscpy(__dst, __src, __count);                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     123 |         if (__wrote >= 0 && __wrote < __count)                          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     124 |                 memset(__dst + __wrote + 1, 0, __count - __wrote - 1);  \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     125 |         __wrote;                                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     126 | })
         | ~~                                                
   include/linux/string.h:86:9: note: in expansion of macro 'sized_strscpy_pad'
      86 |         sized_strscpy_pad(dst, src, sizeof(dst) + __must_be_array(dst) +        \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__strscpy_pad0'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/string.h:149:9: note: in expansion of macro 'CONCATENATE'
     149 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~
   net/netfilter/nf_tables_api.c:9714:53: note: in expansion of macro 'strscpy_pad'
    9714 |             nla_put_string(skb, NFTA_GEN_PROC_NAME, strscpy_pad(buf, current->comm)))
         |                                                     ^~~~~~~~~~~
   In file included from include/linux/netfilter/nfnetlink.h:7,
                    from net/netfilter/nf_tables_api.c:18:
   include/net/netlink.h:1655:46: note: expected 'const char *' but argument is of type 'ssize_t' {aka 'long int'}
    1655 |                                  const char *str)
         |                                  ~~~~~~~~~~~~^~~
--
   In file included from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from arch/x86/include/asm/paravirt.h:19,
                    from arch/x86/include/asm/irqflags.h:100,
                    from include/linux/irqflags.h:18,
                    from arch/x86/include/asm/special_insns.h:10,
                    from arch/x86/include/asm/processor.h:25,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from nf_tables_api.c:8:
   nf_tables_api.c: In function 'nf_tables_fill_gen_info':
>> include/linux/string.h:116:50: error: passing argument 3 of 'nla_put_string' makes pointer from integer without a cast [-Wint-conversion]
     116 | #define sized_strscpy_pad(dest, src, count)     ({                      \
         |                                                 ~^~~~~~~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  ssize_t {aka long int}
     117 |         char *__dst = (dest);                                           \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     118 |         const char *__src = (src);                                      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     119 |         const size_t __count = (count);                                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     120 |         ssize_t __wrote;                                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     121 |                                                                         \
         |                                                                         ~
     122 |         __wrote = sized_strscpy(__dst, __src, __count);                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     123 |         if (__wrote >= 0 && __wrote < __count)                          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     124 |                 memset(__dst + __wrote + 1, 0, __count - __wrote - 1);  \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     125 |         __wrote;                                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     126 | })
         | ~~                                                
   include/linux/string.h:86:9: note: in expansion of macro 'sized_strscpy_pad'
      86 |         sized_strscpy_pad(dst, src, sizeof(dst) + __must_be_array(dst) +        \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__strscpy_pad0'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/string.h:149:9: note: in expansion of macro 'CONCATENATE'
     149 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~
   nf_tables_api.c:9714:53: note: in expansion of macro 'strscpy_pad'
    9714 |             nla_put_string(skb, NFTA_GEN_PROC_NAME, strscpy_pad(buf, current->comm)))
         |                                                     ^~~~~~~~~~~
   In file included from include/linux/netfilter/nfnetlink.h:7,
                    from nf_tables_api.c:18:
   include/net/netlink.h:1655:46: note: expected 'const char *' but argument is of type 'ssize_t' {aka 'long int'}
    1655 |                                  const char *str)
         |                                  ~~~~~~~~~~~~^~~


vim +/nla_put_string +116 include/linux/string.h

e6584c3964f2ff Kees Cook        2023-09-20   74  
e6584c3964f2ff Kees Cook        2023-09-20   75  /*
e6584c3964f2ff Kees Cook        2023-09-20   76   * The 2 argument style can only be used when dst is an array with a
e6584c3964f2ff Kees Cook        2023-09-20   77   * known size.
e6584c3964f2ff Kees Cook        2023-09-20   78   */
e6584c3964f2ff Kees Cook        2023-09-20   79  #define __strscpy0(dst, src, ...)	\
559048d156ff33 Kees Cook        2024-08-05   80  	sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) +	\
559048d156ff33 Kees Cook        2024-08-05   81  				__must_be_cstr(dst) + __must_be_cstr(src))
559048d156ff33 Kees Cook        2024-08-05   82  #define __strscpy1(dst, src, size)	\
559048d156ff33 Kees Cook        2024-08-05   83  	sized_strscpy(dst, src, size + __must_be_cstr(dst) + __must_be_cstr(src))
e6584c3964f2ff Kees Cook        2023-09-20   84  
8366d124ec937c Kees Cook        2024-02-02   85  #define __strscpy_pad0(dst, src, ...)	\
559048d156ff33 Kees Cook        2024-08-05   86  	sized_strscpy_pad(dst, src, sizeof(dst) + __must_be_array(dst) +	\
559048d156ff33 Kees Cook        2024-08-05   87  				    __must_be_cstr(dst) + __must_be_cstr(src))
559048d156ff33 Kees Cook        2024-08-05   88  #define __strscpy_pad1(dst, src, size)	\
559048d156ff33 Kees Cook        2024-08-05   89  	sized_strscpy_pad(dst, src, size + __must_be_cstr(dst) + __must_be_cstr(src))
458a3bf82df4fe Tobin C. Harding 2019-04-05   90  
e6584c3964f2ff Kees Cook        2023-09-20   91  /**
e6584c3964f2ff Kees Cook        2023-09-20   92   * strscpy - Copy a C-string into a sized buffer
e6584c3964f2ff Kees Cook        2023-09-20   93   * @dst: Where to copy the string to
e6584c3964f2ff Kees Cook        2023-09-20   94   * @src: Where to copy the string from
e6584c3964f2ff Kees Cook        2023-09-20   95   * @...: Size of destination buffer (optional)
e6584c3964f2ff Kees Cook        2023-09-20   96   *
e6584c3964f2ff Kees Cook        2023-09-20   97   * Copy the source string @src, or as much of it as fits, into the
e6584c3964f2ff Kees Cook        2023-09-20   98   * destination @dst buffer. The behavior is undefined if the string
e6584c3964f2ff Kees Cook        2023-09-20   99   * buffers overlap. The destination @dst buffer is always NUL terminated,
e6584c3964f2ff Kees Cook        2023-09-20  100   * unless it's zero-sized.
e6584c3964f2ff Kees Cook        2023-09-20  101   *
e6584c3964f2ff Kees Cook        2023-09-20  102   * The size argument @... is only required when @dst is not an array, or
e6584c3964f2ff Kees Cook        2023-09-20  103   * when the copy needs to be smaller than sizeof(@dst).
e6584c3964f2ff Kees Cook        2023-09-20  104   *
e6584c3964f2ff Kees Cook        2023-09-20  105   * Preferred to strncpy() since it always returns a valid string, and
e6584c3964f2ff Kees Cook        2023-09-20  106   * doesn't unnecessarily force the tail of the destination buffer to be
e6584c3964f2ff Kees Cook        2023-09-20  107   * zero padded. If padding is desired please use strscpy_pad().
e6584c3964f2ff Kees Cook        2023-09-20  108   *
e6584c3964f2ff Kees Cook        2023-09-20  109   * Returns the number of characters copied in @dst (not including the
e6584c3964f2ff Kees Cook        2023-09-20  110   * trailing %NUL) or -E2BIG if @size is 0 or the copy from @src was
e6584c3964f2ff Kees Cook        2023-09-20  111   * truncated.
e6584c3964f2ff Kees Cook        2023-09-20  112   */
e6584c3964f2ff Kees Cook        2023-09-20  113  #define strscpy(dst, src, ...)	\
e6584c3964f2ff Kees Cook        2023-09-20  114  	CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
458a3bf82df4fe Tobin C. Harding 2019-04-05  115  
8366d124ec937c Kees Cook        2024-02-02 @116  #define sized_strscpy_pad(dest, src, count)	({			\
8366d124ec937c Kees Cook        2024-02-02  117  	char *__dst = (dest);						\
8366d124ec937c Kees Cook        2024-02-02  118  	const char *__src = (src);					\
8366d124ec937c Kees Cook        2024-02-02  119  	const size_t __count = (count);					\
8366d124ec937c Kees Cook        2024-02-02  120  	ssize_t __wrote;						\
8366d124ec937c Kees Cook        2024-02-02  121  									\
8366d124ec937c Kees Cook        2024-02-02  122  	__wrote = sized_strscpy(__dst, __src, __count);			\
8366d124ec937c Kees Cook        2024-02-02  123  	if (__wrote >= 0 && __wrote < __count)				\
8366d124ec937c Kees Cook        2024-02-02  124  		memset(__dst + __wrote + 1, 0, __count - __wrote - 1);	\
8366d124ec937c Kees Cook        2024-02-02  125  	__wrote;							\
8366d124ec937c Kees Cook        2024-02-02  126  })
8366d124ec937c Kees Cook        2024-02-02  127  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
