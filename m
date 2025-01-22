Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FD9215048
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 16:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564850; cv=none; b=Gi6G6V+kVp/dQ2cs0NFbrFHliiV1jpc8JOZH05S4UB5jHjdS3sgVBI9u9+jtlKbx/cjiUYcOLFiGp+BT/7ojY6IBQCx/bX6IhfsNE3scOAg/YNn2R7Sj/Vb4iUqYnWzEj7KxtFjOY7cQMAdjCZmLXqZBhXjAJQy3J0lw3iu2eww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564850; c=relaxed/simple;
	bh=YuUqBXFwxJR+NzY8T6Fja35g1/jWJVAvocoIsfKf2E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIagJm5rq4rJQjzfNbIVmbHVXYLF/BkdSa04mPV1KobHELgEL+JTvwFyxZIx/GBkFY1aTTGN2OkW6efLK38sReTlEAXKv0/nbF5ysCVxkDnLDFQXAucQxR1ewhAdhoLlyGgldgsBZnYARZO6IyRvB4VetndkQO8H0zDuutr0Fpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZj61RBN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZj61RBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737564848; x=1769100848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YuUqBXFwxJR+NzY8T6Fja35g1/jWJVAvocoIsfKf2E8=;
  b=nZj61RBNK9uI4EbKAiSBisSTV5OrkpiyMnYvWZmX8bGg5n7XmvqPy9SY
   UGWjyR0AOpWtMbcWjuVeAxCDqM+SOCqrMMZDyRQVGfIfU0cD1BG14ApO4
   47jntKdA8JFQoUxONJFQJGQWls/Smn5R3ZPykSh81pPC6xLKmFv2C8MEZ
   Q4NVcD56fGH2aJd1n+KaWcp3Eg6CSe4r5Wkwl5QdNr3BCbvvabN8aj1zO
   O6ip3YfsNbzZZQV6kPjgtumzL6t7gv1wfpTbn2bJVPLOgTgSF0AzhOY+v
   vjqQ3ZVS0RRl0q5QTJykOLfZPKxtyXMvS80rhch2i9C+mSAT5IJl73Aux
   g==;
X-CSE-ConnectionGUID: A0LkXL/BQtObYYMtVWEOjg==
X-CSE-MsgGUID: RJe8uv4kQfm8bXkKS432BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="25632196"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="25632196"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:54:07 -0800
X-CSE-ConnectionGUID: k5KJ2rIkS0iD21NFb/oc8A==
X-CSE-MsgGUID: 0lOu5m7nRRGqiW0slVFPnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112286242"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jan 2025 08:54:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tadzO-000a83-1u;
	Wed, 22 Jan 2025 16:54:02 +0000
Date: Thu, 23 Jan 2025 00:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>
Cc: oe-kbuild-all@lists.linux.dev, Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] xfrm: fix integer overflow in
 xfrm_replay_state_esn_len()
Message-ID: <202501230035.cFbLTHtZ-lkp@intel.com>
References: <018ecf13-e371-4b39-8946-c7510baf916b@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <018ecf13-e371-4b39-8946-c7510baf916b@stanley.mountain>

Hi Dan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/xfrm-fix-integer-overflow-in-xfrm_replay_state_esn_len/20250121-191827
base:   net/main
patch link:    https://lore.kernel.org/r/018ecf13-e371-4b39-8946-c7510baf916b%40stanley.mountain
patch subject: [PATCH net] xfrm: fix integer overflow in xfrm_replay_state_esn_len()
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250123/202501230035.cFbLTHtZ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230035.cFbLTHtZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230035.cFbLTHtZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:389,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/mips/include/asm/processor.h:15,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/net/xfrm.h:7,
                    from net/xfrm/xfrm_replay.c:10:
   In function 'memcmp',
       inlined from 'xfrm_replay_notify_bmp' at net/xfrm/xfrm_replay.c:336:7:
>> include/linux/fortify-string.h:120:33: warning: '__builtin_memcmp' specified bound 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overread]
     120 | #define __underlying_memcmp     __builtin_memcmp
         |                                 ^
   include/linux/fortify-string.h:727:16: note: in expansion of macro '__underlying_memcmp'
     727 |         return __underlying_memcmp(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~
   net/xfrm/xfrm_replay.c: In function 'xfrm_replay_notify_bmp':
   net/xfrm/xfrm_replay.c:308:53: note: source object allocated here
     308 |         struct xfrm_replay_state_esn *replay_esn = x->replay_esn;
         |                                                    ~^~~~~~~~~~~~
   In function 'memcmp',
       inlined from 'xfrm_replay_notify_esn' at net/xfrm/xfrm_replay.c:402:7:
>> include/linux/fortify-string.h:120:33: warning: '__builtin_memcmp' specified bound 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overread]
     120 | #define __underlying_memcmp     __builtin_memcmp
         |                                 ^
   include/linux/fortify-string.h:727:16: note: in expansion of macro '__underlying_memcmp'
     727 |         return __underlying_memcmp(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~
   net/xfrm/xfrm_replay.c: In function 'xfrm_replay_notify_esn':
   net/xfrm/xfrm_replay.c:360:53: note: source object allocated here
     360 |         struct xfrm_replay_state_esn *replay_esn = x->replay_esn;
         |                                                    ~^~~~~~~~~~~~


vim +/__builtin_memcmp +120 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  118  
78a498c3a227f2 Alexander Potapenko 2022-10-24  119  #define __underlying_memchr	__builtin_memchr
78a498c3a227f2 Alexander Potapenko 2022-10-24 @120  #define __underlying_memcmp	__builtin_memcmp
a28a6e860c6cf2 Francis Laniel      2021-02-25  121  #define __underlying_strcat	__builtin_strcat
a28a6e860c6cf2 Francis Laniel      2021-02-25  122  #define __underlying_strcpy	__builtin_strcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  123  #define __underlying_strlen	__builtin_strlen
a28a6e860c6cf2 Francis Laniel      2021-02-25  124  #define __underlying_strncat	__builtin_strncat
a28a6e860c6cf2 Francis Laniel      2021-02-25  125  #define __underlying_strncpy	__builtin_strncpy
2e577732e8d28b Andrey Konovalov    2024-05-17  126  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
