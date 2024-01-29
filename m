Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FEE5B5B0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706526749; cv=none; b=OP2VTuTIHFeQbca2AAOwwstxNqzPa9sKfIK+9PjVjTlP4LeHTPNrDEjTWPp3MUeIaF7pPCFEWGF11zH1yR/swB3BsMqobprU4ejP6727nR69TlJ4WFI2jGmed3ojVBEaBCd2VqtVM6LLu3RVPIILrnW7MCfMDDWvBFrXMl5Rn4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706526749; c=relaxed/simple;
	bh=zPOj4rDaKNNT1Wi+vjgDk+q1M2bmet6/aOVH0cxGw9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fas4/Hh+g53jI+phbsudhN5oDu8Ovbs5iYsGGzU8ici38efDN+3FU+r/fI+4DiEjgbVngfL3t4zQtc+JujJ0PNnQeZrctibaj4VOo8RwPfTROfotcS7wZONzV4480+Gbs2+epUVrwEhFGhXwN5stnvm4BkMjNVjNLUgzHSthbVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9h5AkSV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9h5AkSV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706526749; x=1738062749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zPOj4rDaKNNT1Wi+vjgDk+q1M2bmet6/aOVH0cxGw9g=;
  b=d9h5AkSVfD5pMg1DvBJfMn20P9+B+ym4NQ7d1ak5B9LejP13HEGQ4mLf
   5mEpGR9VVKyYv72MY5Z9PBJVQf9G/Vbglqduqvz4b7ujQYznkfYjdvy4g
   Ml242uVwiFAgghbcKDrcDJE7NuKZyYDgqms+8vHx/LjoQUPMsKUonyigW
   65YoGNTHoFmfA+B99MQ/b6Tcwfue7Q0aqsX9tprmBWQnhWOvYkSH8RNKu
   w52ayIJ3ZhAOiVnZ8NJaiXfIj+vAtjNZHXQf21lXKj6BNuJDxcI7QDVUx
   ehMP/g1JP+tnwB1y7eC0sghTijsxGb3u2+QcKqN4sLTk99unZqSYM8xFC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="16280055"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="16280055"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 03:12:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3269570"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Jan 2024 03:12:25 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUPYs-0004F4-2B;
	Mon, 29 Jan 2024 11:12:22 +0000
Date: Mon, 29 Jan 2024 19:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 3698/26476]
 net/wireguard/crypto/zinc/curve25519/curve25519-x86_64.c:943:6: warning:
 variable 'carry' set but not used
Message-ID: <202401291802.MTQa1FY7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: d822d17e804efcbd5d9f4ebf66d6c2606f2ae96b [3698/26476] added wireguard from master
config: x86_64-randconfig-161-20240129 (https://download.01.org/0day-ci/archive/20240129/202401291802.MTQa1FY7-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291802.MTQa1FY7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291802.MTQa1FY7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/wireguard/crypto/zinc/curve25519/curve25519-x86_64-glue.c:9:0,
                    from net/wireguard/crypto/zinc/curve25519/curve25519.c:24:
   net/wireguard/crypto/zinc/curve25519/curve25519-x86_64.c: In function 'store_felem':
>> net/wireguard/crypto/zinc/curve25519/curve25519-x86_64.c:943:6: warning: variable 'carry' set but not used [-Wunused-but-set-variable]
     u64 carry;
         ^~~~~
>> net/wireguard/crypto/zinc/curve25519/curve25519-x86_64.c:940:6: warning: variable 'carry0' set but not used [-Wunused-but-set-variable]
     u64 carry0;
         ^~~~~~


vim +/carry +943 net/wireguard/crypto/zinc/curve25519/curve25519-x86_64.c

   935	
   936	static void store_felem(u64 *b, u64 *f)
   937	{
   938		u64 f30 = f[3U];
   939		u64 top_bit0 = f30 >> (u32)63U;
 > 940		u64 carry0;
   941		u64 f31;
   942		u64 top_bit;
 > 943		u64 carry;
   944		u64 f0;
   945		u64 f1;
   946		u64 f2;
   947		u64 f3;
   948		u64 m0;
   949		u64 m1;
   950		u64 m2;
   951		u64 m3;
   952		u64 mask;
   953		u64 f0_;
   954		u64 f1_;
   955		u64 f2_;
   956		u64 f3_;
   957		u64 o0;
   958		u64 o1;
   959		u64 o2;
   960		u64 o3;
   961		f[3U] = f30 & (u64)0x7fffffffffffffffU;
   962		carry0 = add_scalar(f, f, (u64)19U * top_bit0);
   963		f31 = f[3U];
   964		top_bit = f31 >> (u32)63U;
   965		f[3U] = f31 & (u64)0x7fffffffffffffffU;
   966		carry = add_scalar(f, f, (u64)19U * top_bit);
   967		f0 = f[0U];
   968		f1 = f[1U];
   969		f2 = f[2U];
   970		f3 = f[3U];
   971		m0 = gte_mask(f0, (u64)0xffffffffffffffedU);
   972		m1 = eq_mask(f1, (u64)0xffffffffffffffffU);
   973		m2 = eq_mask(f2, (u64)0xffffffffffffffffU);
   974		m3 = eq_mask(f3, (u64)0x7fffffffffffffffU);
   975		mask = ((m0 & m1) & m2) & m3;
   976		f0_ = f0 - (mask & (u64)0xffffffffffffffedU);
   977		f1_ = f1 - (mask & (u64)0xffffffffffffffffU);
   978		f2_ = f2 - (mask & (u64)0xffffffffffffffffU);
   979		f3_ = f3 - (mask & (u64)0x7fffffffffffffffU);
   980		o0 = f0_;
   981		o1 = f1_;
   982		o2 = f2_;
   983		o3 = f3_;
   984		b[0U] = o0;
   985		b[1U] = o1;
   986		b[2U] = o2;
   987		b[3U] = o3;
   988	}
   989	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
