Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F3C190485
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 04:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741321348; cv=none; b=i/xNJu60aLZx/rzlXN5jojciml3ttsrD6lcyos8jVbrH0OXVaSysXTqclgte/SsBd0YtnDn5KyquBjA/bRWyHWbiiJkc+IiuOZwji0ztE+Poi4LB7bnx9E5GbLhyULcdLYZHAIVEDf5jPoPsrIkuWO9SNGRvm49E0oC4z2VtkSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741321348; c=relaxed/simple;
	bh=m+ROzqCnsIhNSSEgKIVlT1Q2MkFdsMclfp8A9cDGgck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktJEv9HcQ0nph2LBxtob2G4z024l8U28OVEDiVndBXUqJayCV130xFItW0gRLCcAP5f4A2+6WWdMxB2cVYAF5kreeAYLqyXe+AYAENxtcCrdqrFOkpJHTaAy4OB3u1pCrTjoUpMyX94AJ4W/8jEXoNoTpwcj4F8qM3S0YEeMG08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFc6IkXx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFc6IkXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741321347; x=1772857347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m+ROzqCnsIhNSSEgKIVlT1Q2MkFdsMclfp8A9cDGgck=;
  b=fFc6IkXxeNF92KFl7fmafOp/5fwNwJaf3HPKQ34Qb/NuyH4NBRae7OKq
   vdSWjUgW6Yvw3+hJ8H/fRB19bFB8e5mFitp8+xrWYYFwnpauBEr4aaNw+
   5S4yQ0TJJ+dboxkvksUWoQBvbiZG7mD1OFmjFHijO9vYWGuWd0njnJh4V
   RMYgSydVW5S2yBnDZIhmWgot9Efq0Ad1YRk9of0w13ZirtmLXkFPoN5PK
   7CajyJUW2uIO4Fy+MtGcu9LHFWnTQsGTEzkeZafcCwGzrpRYutn8pNGlD
   5CAsvXIe0o7KoovyAPpp+dSa/OaVYitbtXWEWOqX5iJGZJjqz9siipE0g
   Q==;
X-CSE-ConnectionGUID: cxiKEG7cTrmvBPQRt0mt7A==
X-CSE-MsgGUID: bnfANCuhQYS3pB7S2fGwxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42070765"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="42070765"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 20:22:24 -0800
X-CSE-ConnectionGUID: 0/kVoPrVSYmQSGBzVMYHaw==
X-CSE-MsgGUID: i5xedAAkSOC2yawenDI2NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119046894"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2025 20:22:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqPE4-000ONo-17;
	Fri, 07 Mar 2025 04:22:20 +0000
Date: Fri, 7 Mar 2025 12:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [v3 PATCH] crypto: scatterwalk - Add memcpy_sglist
Message-ID: <202503071259.oCOdlrcI-lkp@intel.com>
References: <Z8kXhLb681E_FLzs@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8kXhLb681E_FLzs@gondor.apana.org.au>

Hi Herbert,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on next-20250306]
[cannot apply to linus/master v6.14-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Xu/crypto-scatterwalk-Add-memcpy_sglist/20250306-113457
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/Z8kXhLb681E_FLzs%40gondor.apana.org.au
patch subject: [v3 PATCH] crypto: scatterwalk - Add memcpy_sglist
config: i386-buildonly-randconfig-003-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071259.oCOdlrcI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071259.oCOdlrcI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071259.oCOdlrcI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   crypto/scatterwalk.c: In function 'memcpy_sglist':
>> crypto/scatterwalk.c:107:24: error: too few arguments to function 'scatterwalk_next'
     107 |                 slen = scatterwalk_next(&swalk, nbytes);
         |                        ^~~~~~~~~~~~~~~~
   In file included from crypto/scatterwalk.c:12:
   include/crypto/scatterwalk.h:129:21: note: declared here
     129 | static inline void *scatterwalk_next(struct scatter_walk *walk,
         |                     ^~~~~~~~~~~~~~~~
   crypto/scatterwalk.c:108:24: error: too few arguments to function 'scatterwalk_next'
     108 |                 dlen = scatterwalk_next(&dwalk, nbytes);
         |                        ^~~~~~~~~~~~~~~~
   In file included from crypto/scatterwalk.c:12:
   include/crypto/scatterwalk.h:129:21: note: declared here
     129 | static inline void *scatterwalk_next(struct scatter_walk *walk,
         |                     ^~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/string.h:3,
                    from include/linux/string.h:65,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/algapi.h:13,
                    from include/crypto/scatterwalk.h:14,
                    from crypto/scatterwalk.c:12:
>> crypto/scatterwalk.c:110:29: error: 'struct scatter_walk' has no member named 'addr'
     110 |                 memcpy(dwalk.addr, swalk.addr, len);
         |                             ^
   arch/x86/include/asm/string_32.h:150:42: note: in definition of macro 'memcpy'
     150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                          ^
   crypto/scatterwalk.c:110:41: error: 'struct scatter_walk' has no member named 'addr'
     110 |                 memcpy(dwalk.addr, swalk.addr, len);
         |                                         ^
   arch/x86/include/asm/string_32.h:150:45: note: in definition of macro 'memcpy'
     150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                             ^
>> crypto/scatterwalk.c:111:46: warning: passing argument 2 of 'scatterwalk_done_dst' makes pointer from integer without a cast [-Wint-conversion]
     111 |                 scatterwalk_done_dst(&dwalk, len);
         |                                              ^~~
         |                                              |
         |                                              unsigned int
   In file included from crypto/scatterwalk.c:12:
   include/crypto/scatterwalk.h:175:47: note: expected 'void *' but argument is of type 'unsigned int'
     175 |                                         void *vaddr, unsigned int nbytes)
         |                                         ~~~~~~^~~~~
>> crypto/scatterwalk.c:111:17: error: too few arguments to function 'scatterwalk_done_dst'
     111 |                 scatterwalk_done_dst(&dwalk, len);
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from crypto/scatterwalk.c:12:
   include/crypto/scatterwalk.h:174:20: note: declared here
     174 | static inline void scatterwalk_done_dst(struct scatter_walk *walk,
         |                    ^~~~~~~~~~~~~~~~~~~~
>> crypto/scatterwalk.c:112:46: warning: passing argument 2 of 'scatterwalk_done_src' makes pointer from integer without a cast [-Wint-conversion]
     112 |                 scatterwalk_done_src(&swalk, len);
         |                                              ^~~
         |                                              |
         |                                              unsigned int
   In file included from crypto/scatterwalk.c:12:
   include/crypto/scatterwalk.h:159:53: note: expected 'const void *' but argument is of type 'unsigned int'
     159 |                                         const void *vaddr, unsigned int nbytes)
         |                                         ~~~~~~~~~~~~^~~~~
>> crypto/scatterwalk.c:112:17: error: too few arguments to function 'scatterwalk_done_src'
     112 |                 scatterwalk_done_src(&swalk, len);
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from crypto/scatterwalk.c:12:
   include/crypto/scatterwalk.h:158:20: note: declared here
     158 | static inline void scatterwalk_done_src(struct scatter_walk *walk,
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +/scatterwalk_next +107 crypto/scatterwalk.c

  > 12	#include <crypto/scatterwalk.h>
    13	#include <linux/kernel.h>
    14	#include <linux/mm.h>
    15	#include <linux/module.h>
    16	#include <linux/scatterlist.h>
    17	
    18	void scatterwalk_skip(struct scatter_walk *walk, unsigned int nbytes)
    19	{
    20		struct scatterlist *sg = walk->sg;
    21	
    22		nbytes += walk->offset - sg->offset;
    23	
    24		while (nbytes > sg->length) {
    25			nbytes -= sg->length;
    26			sg = sg_next(sg);
    27		}
    28		walk->sg = sg;
    29		walk->offset = sg->offset + nbytes;
    30	}
    31	EXPORT_SYMBOL_GPL(scatterwalk_skip);
    32	
    33	inline void memcpy_from_scatterwalk(void *buf, struct scatter_walk *walk,
    34					    unsigned int nbytes)
    35	{
    36		do {
    37			const void *src_addr;
    38			unsigned int to_copy;
    39	
    40			src_addr = scatterwalk_next(walk, nbytes, &to_copy);
    41			memcpy(buf, src_addr, to_copy);
    42			scatterwalk_done_src(walk, src_addr, to_copy);
    43			buf += to_copy;
    44			nbytes -= to_copy;
    45		} while (nbytes);
    46	}
    47	EXPORT_SYMBOL_GPL(memcpy_from_scatterwalk);
    48	
    49	inline void memcpy_to_scatterwalk(struct scatter_walk *walk, const void *buf,
    50					  unsigned int nbytes)
    51	{
    52		do {
    53			void *dst_addr;
    54			unsigned int to_copy;
    55	
    56			dst_addr = scatterwalk_next(walk, nbytes, &to_copy);
    57			memcpy(dst_addr, buf, to_copy);
    58			scatterwalk_done_dst(walk, dst_addr, to_copy);
    59			buf += to_copy;
    60			nbytes -= to_copy;
    61		} while (nbytes);
    62	}
    63	EXPORT_SYMBOL_GPL(memcpy_to_scatterwalk);
    64	
    65	void memcpy_from_sglist(void *buf, struct scatterlist *sg,
    66				unsigned int start, unsigned int nbytes)
    67	{
    68		struct scatter_walk walk;
    69	
    70		if (unlikely(nbytes == 0)) /* in case sg == NULL */
    71			return;
    72	
    73		scatterwalk_start_at_pos(&walk, sg, start);
    74		memcpy_from_scatterwalk(buf, &walk, nbytes);
    75	}
    76	EXPORT_SYMBOL_GPL(memcpy_from_sglist);
    77	
    78	void memcpy_to_sglist(struct scatterlist *sg, unsigned int start,
    79			      const void *buf, unsigned int nbytes)
    80	{
    81		struct scatter_walk walk;
    82	
    83		if (unlikely(nbytes == 0)) /* in case sg == NULL */
    84			return;
    85	
    86		scatterwalk_start_at_pos(&walk, sg, start);
    87		memcpy_to_scatterwalk(&walk, buf, nbytes);
    88	}
    89	EXPORT_SYMBOL_GPL(memcpy_to_sglist);
    90	
    91	void memcpy_sglist(struct scatterlist *dst, struct scatterlist *src,
    92			   unsigned int nbytes)
    93	{
    94		struct scatter_walk swalk;
    95		struct scatter_walk dwalk;
    96	
    97		if (unlikely(nbytes == 0)) /* in case sg == NULL */
    98			return;
    99	
   100		scatterwalk_start(&swalk, src);
   101		scatterwalk_start(&dwalk, dst);
   102	
   103		do {
   104			unsigned int slen, dlen;
   105			unsigned int len;
   106	
 > 107			slen = scatterwalk_next(&swalk, nbytes);
   108			dlen = scatterwalk_next(&dwalk, nbytes);
   109			len = min(slen, dlen);
 > 110			memcpy(dwalk.addr, swalk.addr, len);
 > 111			scatterwalk_done_dst(&dwalk, len);
 > 112			scatterwalk_done_src(&swalk, len);
   113			nbytes -= len;
   114		} while (nbytes);
   115	}
   116	EXPORT_SYMBOL_GPL(memcpy_sglist);
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
