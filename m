Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8471121CFF6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754832; cv=none; b=iLwUy/SObAkbiEi7IBI+11joA8g/gsMc7oGba4NJ2E9HlgaCbsbXP0w+g0XGSg4wKqlLiHkj1POCDx6kzFuIxDqb/u1lNh1E8TDvWx/B+MKTjxdQcXnjjqEiSlOZyIERz+pPLKfmSmOz+J6eN8jgyp05/G2CgjgtFFC1AqVE3Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754832; c=relaxed/simple;
	bh=khPqF0XUhh9ykUOfii+c1zVhZkS61+frhNc9imzqtzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q+hLSGmqZig4FC3hU5FjPHEh+zPcFNKVom2bz83U5S8lM0PG/xcbAKraQC57AbZmmd+9ZafItV9Sb6ST9QpvFb6K2aP15jlwVQh9gCG8a6MnUVEp5mNYqqHkECV5J4mL39xHJN2YMDyJ7KorL8XSxo5+oJJJxgOpDua9C7IMZHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vtzkqlvr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vtzkqlvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764754830; x=1796290830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=khPqF0XUhh9ykUOfii+c1zVhZkS61+frhNc9imzqtzI=;
  b=VtzkqlvrI/yN+n+YWs+XtmXxwxiNO0Tjx8V77QTnH/2zBH3jUhRsNnq6
   aXJ1wT3soywB8zIQthoBuac5oXHYJNjxWb7kic0TCOjPHE7XzAX1wDiO4
   7lSG6k3iCNReT200bS2U+9rBoAgLRuVAXm299JCROJjX9z6LMYyXhtpou
   dpx9V4Fi59Yc8lYD5Y9cWdY81Etip7xTIJ0kYopWH2sU451kALExYuQ1a
   oyKbWRGhl+u61yFi4FcH0h++S+yjcZXfsVPaMoDlStiEOqap+u6qbgDwe
   Cz/32+6zCadIHiAEsqw1NxmikC0+SO8De34/RV38UfsGdiN3S4zkLbEdL
   g==;
X-CSE-ConnectionGUID: aDl5MsdCQqOoNsL3Cqwpyw==
X-CSE-MsgGUID: Kt5+xnWgSe2JdY64iIFjoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66701774"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66701774"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 01:40:29 -0800
X-CSE-ConnectionGUID: 63ZUhsJuSQ6bzbIYqfFzow==
X-CSE-MsgGUID: PraEpR1cTvCCAUsS559FXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="194868440"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Dec 2025 01:40:28 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQjLW-00000000AqP-2XNV;
	Wed, 03 Dec 2025 09:40:26 +0000
Date: Wed, 3 Dec 2025 17:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, jpsollie <janpieter.sollie@edpnet.be>
Subject: [koverstreet-bcachefs:pr/992 2/2] lib/crypto/curve25519.c:29:
 undefined reference to `curve25519_generic'
Message-ID: <202512031723.KQBOhJ64-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/992
head:   39aff98c65bacc4dcd96c8ac030646bca1bfb183
commit: 39aff98c65bacc4dcd96c8ac030646bca1bfb183 [2/2] Merge branch 'master' of https://github.com/koverstreet/bcachefs into HEAD
config: arc-randconfig-001-20251203 (https://download.01.org/0day-ci/archive/20251203/202512031723.KQBOhJ64-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031723.KQBOhJ64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031723.KQBOhJ64-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: lib/crypto/curve25519.o: in function `curve25519_arch':
>> lib/crypto/curve25519.c:29: undefined reference to `curve25519_generic'
>> arc-linux-ld: lib/crypto/curve25519.c:29: undefined reference to `curve25519_generic'
   arc-linux-ld: lib/crypto/curve25519.o: in function `curve25519_base_arch':
   lib/crypto/curve25519.c:35: undefined reference to `curve25519_generic'
   arc-linux-ld: lib/crypto/curve25519.c:35: undefined reference to `curve25519_generic'


vim +29 lib/crypto/curve25519.c

68546e5632c0b9 Eric Biggers 2025-09-06  21  
68546e5632c0b9 Eric Biggers 2025-09-06  22  #ifdef CONFIG_CRYPTO_LIB_CURVE25519_ARCH
68546e5632c0b9 Eric Biggers 2025-09-06  23  #include "curve25519.h" /* $(SRCARCH)/curve25519.h */
68546e5632c0b9 Eric Biggers 2025-09-06  24  #else
68546e5632c0b9 Eric Biggers 2025-09-06  25  static void curve25519_arch(u8 mypublic[CURVE25519_KEY_SIZE],
68546e5632c0b9 Eric Biggers 2025-09-06  26  			    const u8 secret[CURVE25519_KEY_SIZE],
68546e5632c0b9 Eric Biggers 2025-09-06  27  			    const u8 basepoint[CURVE25519_KEY_SIZE])
68546e5632c0b9 Eric Biggers 2025-09-06  28  {
68546e5632c0b9 Eric Biggers 2025-09-06 @29  	curve25519_generic(mypublic, secret, basepoint);
68546e5632c0b9 Eric Biggers 2025-09-06  30  }
68546e5632c0b9 Eric Biggers 2025-09-06  31  

:::::: The code at line 29 was first introduced by commit
:::::: 68546e5632c0b982663af575ae12cc5d81facc91 lib/crypto: curve25519: Consolidate into single module

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
