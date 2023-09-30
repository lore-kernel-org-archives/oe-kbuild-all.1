Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFE212B81
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 23:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696115760; x=1727651760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D8RYEKLBe1VgzxYw4teN51VeOyW+aaEgnIh5KLvc10U=;
  b=Dxl5Su6qh473ux1pEM+8Xv8Ue+eom+jaEplePOIjv/YX9H/sJVvU51ah
   advs8SKd6jb+egdC4HtR0i97WWl7Qc3E88BsxSYtigz/3NWm+aQ1h0VIO
   0NcIT2MAVNpZUmyF0UG7BkEZ332tEi3PuN7xmcb8kGPP8JuSjJ3pFIrvs
   NjT2EgwR3v/9/w38BeE0dhSJSeLBC2AGhHk9fj1R2/EWa58StCFuoRdSP
   XAe3CJerBURJ94XYWTm/Vp4a0QUEjGtYDlTz5J0Dumk0KTy0gMGQrd4wR
   w/E15p9xdZpgigs/GCh5zuJXeDUnE2jgDuJH4HC/ZgSoeM634jbShGJLN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="1069355"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="1069355"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 16:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="699972136"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="699972136"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Sep 2023 16:15:57 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmjBi-0004Yz-2k;
	Sat, 30 Sep 2023 23:15:54 +0000
Date: Sun, 1 Oct 2023 07:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-4.19.y 289/1172]
 fs/crypto/hkdf.c:47:9: sparse: sparse: Variable length array is used.
Message-ID: <202310010739.4mStCpOF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-4.19.y
head:   b9aeb147225616494256fcf913c559afd4088a05
commit: 6ad6af5912f72ad8c40baa072c3dabd321695dc1 [289/1172] fscrypt: add an HKDF-SHA512 implementation
config: i386-randconfig-062-20231001 (https://download.01.org/0day-ci/archive/20231001/202310010739.4mStCpOF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010739.4mStCpOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310010739.4mStCpOF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/crypto/hkdf.c:47:9: sparse: sparse: Variable length array is used.
   fs/crypto/hkdf.c:120:9: sparse: sparse: Variable length array is used.

vim +47 fs/crypto/hkdf.c

    25	
    26	/*
    27	 * HKDF consists of two steps:
    28	 *
    29	 * 1. HKDF-Extract: extract a pseudorandom key of length HKDF_HASHLEN bytes from
    30	 *    the input keying material and optional salt.
    31	 * 2. HKDF-Expand: expand the pseudorandom key into output keying material of
    32	 *    any length, parameterized by an application-specific info string.
    33	 *
    34	 * HKDF-Extract can be skipped if the input is already a pseudorandom key of
    35	 * length HKDF_HASHLEN bytes.  However, cipher modes other than AES-256-XTS take
    36	 * shorter keys, and we don't want to force users of those modes to provide
    37	 * unnecessarily long master keys.  Thus fscrypt still does HKDF-Extract.  No
    38	 * salt is used, since fscrypt master keys should already be pseudorandom and
    39	 * there's no way to persist a random salt per master key from kernel mode.
    40	 */
    41	
    42	/* HKDF-Extract (RFC 5869 section 2.2), unsalted */
    43	static int hkdf_extract(struct crypto_shash *hmac_tfm, const u8 *ikm,
    44				unsigned int ikmlen, u8 prk[HKDF_HASHLEN])
    45	{
    46		static const u8 default_salt[HKDF_HASHLEN];
  > 47		SHASH_DESC_ON_STACK(desc, hmac_tfm);
    48		int err;
    49	
    50		err = crypto_shash_setkey(hmac_tfm, default_salt, HKDF_HASHLEN);
    51		if (err)
    52			return err;
    53	
    54		desc->tfm = hmac_tfm;
    55		desc->flags = 0;
    56		err = crypto_shash_digest(desc, ikm, ikmlen, prk);
    57		shash_desc_zero(desc);
    58		return err;
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
