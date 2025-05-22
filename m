Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED84424E4C6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 08:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903886; cv=none; b=PPmOqo14kfRNrEZJn6VURxC+QASkDfGMjlPQWAWWF1tLFSNMM8UYHWMrNIH88L/5/JbByH9k4SAdvsm2iB6zcaXqB1cfCwXQQr5SzwE3rQqtNcrs2A6VKsqE+huspMr9EZywxqpF7svRZHyZZL8GFuG2kvFjv3umC0yF7vwRfNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903886; c=relaxed/simple;
	bh=0Du73fDLWsuJht8D9L73AXx7utVVz/rr0O4tyeymNwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lo+6ByIJGVHw8Zir0C0PXR9ilPGLst1BPi2bzPCPeD6GFHyaCy4hizBdVLMYILYVT2kJ8YBDCIkFLCJOirt6h6RanYK2FRAlkFeCZ07Nni0brUXWNzK+Gooe88HxgUXoCcVs84SR3Yl98bw2mJZU6woW2418FbH+oQnvJ6heUJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAqr0/8V; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAqr0/8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747903885; x=1779439885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Du73fDLWsuJht8D9L73AXx7utVVz/rr0O4tyeymNwg=;
  b=TAqr0/8VOetkc4N3EkImddOEWwqYfsFwetXVW14wBiyKHg6i/VYgV9Ct
   mHSzal6oGVwG15RAiAvp4GatOhYYvA0dQg4W+0J3Y9nonc+tJo/3kcCg/
   96TjyvKgDDZd1aMBZYaJ9/jCY7sZK4JOLP6B37QPuPTD2afWP4mZVl8Vs
   cwEAXuBjHCnGMJvAusc3lfBgwfAmM8YA7iLRkg4GrBIE3fDZonoP63X6L
   UAewAhMIl+IhhqKyfjP/P+5DhkLVwg78I2iCiCpmolwLirnrqmnV7wdf9
   NADoZF/eySHfFgYQqGaiNa35OCwzeYZVony6UQp6px3X5WkrbQSTUSrnr
   g==;
X-CSE-ConnectionGUID: tvC6NL5iS6CsBWMh62vusQ==
X-CSE-MsgGUID: FsdpM+EyTVuB+wxjVxJHRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61259227"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="61259227"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 01:51:24 -0700
X-CSE-ConnectionGUID: ig9EVJdhRDGDrBlgh2Qz9g==
X-CSE-MsgGUID: XAq+DqQHS4iN7WCkNc3+6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="145638564"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 May 2025 01:51:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI1e4-000P7a-1l;
	Thu, 22 May 2025 08:51:20 +0000
Date: Thu, 22 May 2025 16:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12611/12618] crypto/scatterwalk.c:257:6: warning:
 variable 'iv' set but not used
Message-ID: <202505221606.UnGKiQ7T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7bac2c97af4078d7a627500c9bcdd5b033f97718
commit: bd8589c92d7f22712f27ff92f45defa2362123b5 [12611/12618] Merge branch 'for-next/kspp' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
config: microblaze-randconfig-r052-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221606.UnGKiQ7T-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221606.UnGKiQ7T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221606.UnGKiQ7T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/highmem.h:5,
                    from include/crypto/scatterwalk.h:15,
                    from crypto/scatterwalk.c:12:
   crypto/scatterwalk.c: In function 'skcipher_copy_iv':
   include/linux/string.h:398:2: error: expected expression before 'do'
     398 |  do {       \
         |  ^~
   crypto/scatterwalk.c:269:13: note: in expansion of macro 'memcpy'
     269 |  walk->iv = memcpy(iv, walk->iv, walk->ivsize);
         |             ^~~~~~
>> crypto/scatterwalk.c:257:6: warning: variable 'iv' set but not used [-Wunused-but-set-variable]
     257 |  u8 *iv;
         |      ^~


vim +/iv +257 crypto/scatterwalk.c

0f8d42bf128d34 Herbert Xu 2025-04-27  250  
0f8d42bf128d34 Herbert Xu 2025-04-27  251  static int skcipher_copy_iv(struct skcipher_walk *walk)
0f8d42bf128d34 Herbert Xu 2025-04-27  252  {
0f8d42bf128d34 Herbert Xu 2025-04-27  253  	unsigned alignmask = walk->alignmask;
0f8d42bf128d34 Herbert Xu 2025-04-27  254  	unsigned ivsize = walk->ivsize;
0f8d42bf128d34 Herbert Xu 2025-04-27  255  	unsigned aligned_stride = ALIGN(walk->stride, alignmask + 1);
0f8d42bf128d34 Herbert Xu 2025-04-27  256  	unsigned size;
0f8d42bf128d34 Herbert Xu 2025-04-27 @257  	u8 *iv;
0f8d42bf128d34 Herbert Xu 2025-04-27  258  
0f8d42bf128d34 Herbert Xu 2025-04-27  259  	/* Min size for a buffer of stride + ivsize, aligned to alignmask */
0f8d42bf128d34 Herbert Xu 2025-04-27  260  	size = aligned_stride + ivsize +
0f8d42bf128d34 Herbert Xu 2025-04-27  261  	       (alignmask & ~(crypto_tfm_ctx_alignment() - 1));
0f8d42bf128d34 Herbert Xu 2025-04-27  262  
0f8d42bf128d34 Herbert Xu 2025-04-27  263  	walk->buffer = kmalloc(size, skcipher_walk_gfp(walk));
0f8d42bf128d34 Herbert Xu 2025-04-27  264  	if (!walk->buffer)
0f8d42bf128d34 Herbert Xu 2025-04-27  265  		return -ENOMEM;
0f8d42bf128d34 Herbert Xu 2025-04-27  266  
0f8d42bf128d34 Herbert Xu 2025-04-27  267  	iv = PTR_ALIGN(walk->buffer, alignmask + 1) + aligned_stride;
0f8d42bf128d34 Herbert Xu 2025-04-27  268  
0f8d42bf128d34 Herbert Xu 2025-04-27  269  	walk->iv = memcpy(iv, walk->iv, walk->ivsize);
0f8d42bf128d34 Herbert Xu 2025-04-27  270  	return 0;
0f8d42bf128d34 Herbert Xu 2025-04-27  271  }
0f8d42bf128d34 Herbert Xu 2025-04-27  272  

:::::: The code at line 257 was first introduced by commit
:::::: 0f8d42bf128d349ad490e87d5574d211245e40f1 crypto: scatterwalk - Move skcipher walk and use it for memcpy_sglist

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
