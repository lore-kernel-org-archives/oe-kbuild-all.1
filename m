Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F8C19464
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 12:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPO4FdEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696940488; x=1728476488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PLMD3KV4fV+hMbeMp6bRXg3EEJciyyoeGIWdtQdVaSU=;
  b=FPO4FdEZx6fCs5yF+qlkzeOGolz4iO1ekfpLISaycQVEVLzGEDZhh9DZ
   k9XI9wxnIOYB6vP5MtbAWWd3aHiQ8c6+i0ZOhQaCtzPNUO6kC0IDuRtSa
   cR69wEI7Nn+SB+LAMDiC9DxIVph2eJ6ugMG7ckaJQssAVQml6pSMvhR0y
   DlheK16yluXuy1QCV8SjUofru3ih2v4cH2R4IcvHjt1mjRn67cz4oTkwr
   n48Kx9bHW8ECbFt1emYG3Y99iVV3xOykea+j9Du0RKzHKww4gDPv6+4iO
   JH8ap7NdMRQw2FFSN+HAr/GQ8p8QI73sJ1/eBEsscUXHr8gPrHjFUzWaV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="364674773"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="364674773"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 05:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747056948"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="747056948"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Oct 2023 05:21:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqBjS-0000OA-1L;
	Tue, 10 Oct 2023 12:21:02 +0000
Date: Tue, 10 Oct 2023 20:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-4.19.y 289/1172]
 fs/crypto/hkdf.c:47:9: sparse: sparse: Variable length array is used.
Message-ID: <202310102046.sXzDvJtJ-lkp@intel.com>
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
config: i386-randconfig-062-20231001 (https://download.01.org/0day-ci/archive/20231010/202310102046.sXzDvJtJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310102046.sXzDvJtJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102046.sXzDvJtJ-lkp@intel.com/

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
