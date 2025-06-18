Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF19B280027
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252565; cv=none; b=OfQnAKHVvmDYvB36fZHlXrRKTstMaOPYrUhHrxvkZMA9p1z2zNtvgA0ElIOrrW0+OPXiuPoZmBBIXi7GtquPEUebabUJuhkl63Y1GY7pYSocHWhRsqSvrvhcA54ELpuMtp14BPO2PQ2zgylJc8thYc8ICCSHXrmdKB10ChXAvlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252565; c=relaxed/simple;
	bh=q55+vN9yRuKovakP50zIXklVOWM9uT+pOhlSeHfP2qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAK5ROUWA+WC5dlMK9dy5n4RnHI/nPH0HPafSZSj4dwKogVuXVubNJehYN0aHpFMmGhTuPmNiMa1V0YnEw9WkX4gx8kEpc5920CKPZsAFohizEIfFJEpZXKUg5A6kG8SggLP/Bai/Dw9YGMdasxsUQAOii+pMHxBQYc06MfPXdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbdSX6rs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbdSX6rs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750252564; x=1781788564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q55+vN9yRuKovakP50zIXklVOWM9uT+pOhlSeHfP2qU=;
  b=QbdSX6rshpzam/DGjEpM5X3PY8ZDEO/DAuIztd8aeSY7WEQRHyrkhs9w
   MCW2aOno2DdItFiI0GQAar2ttvsbyOeixaiLCh/dU1JvVmM9uKxYzwaxb
   DYucS4awGsbIS4//UhAbSMAEkCBqOAo4mohL6zqlG6gvuDoTfZ2nXYL5H
   p1xTXEQq7OVfaw5aiE9iHz/BD//NYqpXhhWvCZlpX8xVnoP/Oz4QJ1u/t
   IGnep8BJWEr+YIsFqirYChtFXpmnDEgOWDQmnGlU87ENrDhSi63mqtq/l
   e3jEHUxUSWVXs07vaUM3DV9ZpQXQ+f7c79nD6DjMuMYpih58HpUqCJoyx
   w==;
X-CSE-ConnectionGUID: T2hylJr7RhSPvCWGRURAvQ==
X-CSE-MsgGUID: 5NlnGvZNR76FzCIwZKnVvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51694695"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="51694695"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 06:15:48 -0700
X-CSE-ConnectionGUID: YYAD0FbkRwSC8ZHrxK5BPQ==
X-CSE-MsgGUID: xMx/Uqs6Q7afMeS0Qj85Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="150301182"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jun 2025 06:15:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRsdj-000Jny-27;
	Wed, 18 Jun 2025 13:15:43 +0000
Date: Wed, 18 Jun 2025 21:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>, Eric Biggers <ebiggers@google.com>,
	Yuzhuo Jing <yuzhuo@google.com>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Ian Rogers <irogers@google.com>
Subject: Re: [PATCH v2 1/3] vdso: Switch get/put unaligned from packed struct
 to memcpy
Message-ID: <202506182044.OhyWGCSm-lkp@intel.com>
References: <20250617205320.1580946-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617205320.1580946-2-irogers@google.com>

Hi Ian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc2 next-20250618]
[cannot apply to tip/timers/vdso acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/vdso-Switch-get-put-unaligned-from-packed-struct-to-memcpy/20250618-045610
base:   linus/master
patch link:    https://lore.kernel.org/r/20250617205320.1580946-2-irogers%40google.com
patch subject: [PATCH v2 1/3] vdso: Switch get/put unaligned from packed struct to memcpy
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20250618/202506182044.OhyWGCSm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506182044.OhyWGCSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506182044.OhyWGCSm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/parisc/include/uapi/asm/byteorder.h:5,
                    from arch/parisc/include/asm/bitops.h:11,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:9,
                    from arch/parisc/boot/compressed/misc.c:7:
   In function 'get_unaligned_le32',
       inlined from 'decompress_kernel' at arch/parisc/boot/compressed/misc.c:312:16:
>> include/vdso/unaligned.h:30:9: warning: '__builtin_memcpy' reading 4 bytes from a region of size 1 [-Wstringop-overread]
      30 |         __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      31 |                          sizeof(__get_unaligned_val));                  \
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:120:19: note: in definition of macro '__swab32'
     120 |         __fswab32(x))
         |                   ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   include/linux/unaligned.h:23:28: note: in expansion of macro '__get_unaligned_t'
      23 |         return le32_to_cpu(__get_unaligned_t(__le32, p));
         |                            ^~~~~~~~~~~~~~~~~
   arch/parisc/boot/compressed/misc.c: In function 'decompress_kernel':
   arch/parisc/boot/compressed/misc.c:29:13: note: source object 'output_len' of size 1
      29 | extern char output_len;
         |             ^~~~~~~~~~


vim +/__builtin_memcpy +30 include/vdso/unaligned.h

     4	
     5	#define ____get_unaligned_type(type) type: (type)0
     6	/**
     7	 * __get_unaligned_t - read an unaligned value from memory.
     8	 * @ptr:	the pointer to load from.
     9	 * @type:	the type to load from the pointer.
    10	 *
    11	 * Use memcpy to affect an unaligned type sized load avoiding undefined behavior
    12	 * from approaches like type punning that require -fno-strict-aliasing in order
    13	 * to be correct. As type may be const, use _Generic to map to a non-const type
    14	 * - you can't memcpy into a const type. The void* cast silences ubsan warnings.
    15	 */
    16	#define __get_unaligned_t(type, ptr) ({					\
    17		type __get_unaligned_map_ctrl = 0;				\
    18		typeof(_Generic(__get_unaligned_map_ctrl,			\
    19			____get_unaligned_type(short int),			\
    20			____get_unaligned_type(unsigned short int),		\
    21			____get_unaligned_type(int),				\
    22			____get_unaligned_type(unsigned int),			\
    23			____get_unaligned_type(long),				\
    24			____get_unaligned_type(unsigned long),			\
    25			____get_unaligned_type(long long),			\
    26			____get_unaligned_type(unsigned long long),		\
    27			default: (type)0					\
    28			)) __get_unaligned_val;					\
    29		(void)__get_unaligned_map_ctrl;					\
  > 30		__builtin_memcpy(&__get_unaligned_val, (void *)(ptr),		\
    31				 sizeof(__get_unaligned_val));			\
    32		__get_unaligned_val;						\
    33	})
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
