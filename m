Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701F07EEE9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 22:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706654684; cv=none; b=al8Zgx+k+gQGQkJIaKP0XcJYDb6k6BJ6r5pMN1HmYJtMiWAPUdAKNomiTSO6O8CqQCUdVJ2CnxiIQR6qIAk2UEtNtrKbuLFpkSra50tXba+sJnfNfoHETGf9CcT9D2Dj8V01ZwdQZszPzKRGQUa/EeohZ20q2Koflpn3nHNgja0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706654684; c=relaxed/simple;
	bh=gk+spYwgLSc5O6rkmMVSYn9SxAJCXUGEKSAGTvPQIqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nI31Ph/okFfipReaVRisAzAWiJFOuBymsvE6rWTKci1wv0GTaCZtbXgwhTeTIY4lZ5RkcHNy47EM99tilaNufZ0Jde4Sar+4bAz4PjdEJVBUa+5IQAF+6GicbimIXy6rScZmXgqZZ8xcs9+GUkL8Aq4sWWb+Mb5AuySNHhti9bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHWJWWI5; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHWJWWI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706654682; x=1738190682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gk+spYwgLSc5O6rkmMVSYn9SxAJCXUGEKSAGTvPQIqI=;
  b=EHWJWWI5G5S68E4DG4+WTBLlHvVYs3gNxupbZYUxc92YTsoLMc9M6+YD
   XfchRp0Witce643uALfdcIR4uxFCqjfiYDUxWA7t6ZvlBoAl0HX73PJT8
   9LaOKxlyzyb3LKG9l4R78RlXndejAdsKzumN1yBCXsmg+xjVgtgiylwoH
   sCmBvX+ekmXyIByXckSajjdAz05DMzXOuWc8Xg+RbaWp3Gdy4wKGxUhRz
   XEd57fnageuwM/+xwmTLZnKlD71QoO0aI4onD9Gb7lQaackwnKf0QT35F
   9vFG6VmtbLm25U6PLP45Yvh/zhUwGMLkR2vpWV6nEM1nXwjDOccNom8wA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="403045594"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="403045594"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 14:44:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3872820"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2024 14:44:39 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUwqK-0000t4-1l;
	Tue, 30 Jan 2024 22:44:36 +0000
Date: Wed, 31 Jan 2024 06:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/3] riscv: optimized memcpy
Message-ID: <202401310644.bffdWJJb-lkp@intel.com>
References: <20240128111013.2450-2-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240128111013.2450-2-jszhang@kernel.org>

Hi Jisheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.8-rc2 next-20240130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/riscv-optimized-memcpy/20240128-232523
base:   linus/master
patch link:    https://lore.kernel.org/r/20240128111013.2450-2-jszhang%40kernel.org
patch subject: [PATCH 1/3] riscv: optimized memcpy
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240131/202401310644.bffdWJJb-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310644.bffdWJJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310644.bffdWJJb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:292,
                    from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from arch/riscv/lib/string.c:10:
>> include/linux/fortify-string.h:580:63: error: expected identifier or '(' before '{' token
     580 |                              p_size_field, q_size_field, op) ({         \
         |                                                               ^
   include/linux/fortify-string.h:638:26: note: in expansion of macro '__fortify_memcpy_chk'
     638 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/lib/string.c:118:7: note: in expansion of macro 'memcpy'
     118 | void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
         |       ^~~~~~


vim +580 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel  2021-02-25  578  
f68f2ff91512c1 Kees Cook       2021-04-20  579  #define __fortify_memcpy_chk(p, q, size, p_size, q_size,		\
f68f2ff91512c1 Kees Cook       2021-04-20 @580  			     p_size_field, q_size_field, op) ({		\
6f7630b1b5bc67 Kees Cook       2022-10-28  581  	const size_t __fortify_size = (size_t)(size);			\
6f7630b1b5bc67 Kees Cook       2022-10-28  582  	const size_t __p_size = (p_size);				\
6f7630b1b5bc67 Kees Cook       2022-10-28  583  	const size_t __q_size = (q_size);				\
6f7630b1b5bc67 Kees Cook       2022-10-28  584  	const size_t __p_size_field = (p_size_field);			\
6f7630b1b5bc67 Kees Cook       2022-10-28  585  	const size_t __q_size_field = (q_size_field);			\
6f7630b1b5bc67 Kees Cook       2022-10-28  586  	WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,		\
6f7630b1b5bc67 Kees Cook       2022-10-28  587  				     __q_size, __p_size_field,		\
6f7630b1b5bc67 Kees Cook       2022-10-28  588  				     __q_size_field, #op),		\
54d9469bc515dc Kees Cook       2021-06-24  589  		  #op ": detected field-spanning write (size %zu) of single %s (size %zu)\n", \
54d9469bc515dc Kees Cook       2021-06-24  590  		  __fortify_size,					\
5097a69d676f7e Alexey Dobriyan 2023-09-16  591  		  "field \"" #p "\" at " FILE_LINE,			\
6f7630b1b5bc67 Kees Cook       2022-10-28  592  		  __p_size_field);					\
f68f2ff91512c1 Kees Cook       2021-04-20  593  	__underlying_##op(p, q, __fortify_size);			\
f68f2ff91512c1 Kees Cook       2021-04-20  594  })
f68f2ff91512c1 Kees Cook       2021-04-20  595  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
