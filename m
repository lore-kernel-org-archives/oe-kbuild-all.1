Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C7D1381
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 08:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674635273; x=1706171273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hXWp3wzItJ7CWmDM9k/GjH3KdF3epTgabV8VTJm7548=;
  b=eGNv3Myp+3XJezt44RK+MjDWjFQgk/9Z9GUqMkrcM8sIIWHECoB9ufA/
   dnGMEjq1bqREua3GQIcoS0yla8+DsNssDhS66aNf27oL3ZtaKI282LJH7
   BWUMJ44rY8bBv0dV56m8rfU/UT/y+ze15mfXKsmNvl9qgQV/lBcNtrbuK
   Wm88nGJXIsc4nRywgYtcCNDerMj9OBtwae9A6LiJKJFi5w0RfPVKmO+2X
   cDUdMPcKf3iYSUmMaitzdN19z0UlomvJkegsFnAIhJzu+4T/mjySbcrCd
   jiPCzKndvYnw5GtZfUTr7f0A5KKczVFzEF4H4LS1ZfcBouHazxojIc/G6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="310083164"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="310083164"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 00:27:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="907802508"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="907802508"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jan 2023 00:27:51 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKb8I-0007BA-1R;
	Wed, 25 Jan 2023 08:27:50 +0000
Date: Wed, 25 Jan 2023 16:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/upstream-f2fs-stable-linux-4.19.y
 289/1172] fs/crypto/hkdf.c:47:9: sparse: sparse: Variable length array is
 used.
Message-ID: <202301251655.rOmI6oR8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/upstream-f2fs-stable-linux-4.19.y
head:   b9aeb147225616494256fcf913c559afd4088a05
commit: 6ad6af5912f72ad8c40baa072c3dabd321695dc1 [289/1172] fscrypt: add an HKDF-SHA512 implementation
config: i386-randconfig-s001-20230123 (https://download.01.org/0day-ci/archive/20230125/202301251655.rOmI6oR8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/6ad6af5912f72ad8c40baa072c3dabd321695dc1
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/upstream-f2fs-stable-linux-4.19.y
        git checkout 6ad6af5912f72ad8c40baa072c3dabd321695dc1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash fs/crypto/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
