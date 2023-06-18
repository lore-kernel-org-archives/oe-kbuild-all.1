Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4308764A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 01:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687050540; x=1718586540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AnEujotSLhyEVERG3+zsLm4ZQRsLsK4hBpjNQLardTg=;
  b=Qr91RWl7Pujog3pfotAvXp+xp3faWClQJ0yftK9cF8L6onIcWB9LEkTV
   WMR3xBiAjkxduRNg/JBbYV06iQPTihnNM4xxwQLZPy7tfDfqrWYWWNu27
   yfDbjDE4LW+kK3ItdHNG09rXROGW/qdAHbPZ5HDlk20yMoz0FRBpntLQd
   0fzHK2WKmD1MyEmfwCevMHfiMGXA2ONF+rLHdq3uIKp9dCH1uuLaTs+4O
   BbUp+4RuTYrkMiv32wJzerwzjQlYqrx3KmcTAecu6+iUD9qZzD6bab81o
   JfR3TXQbxXhVrEnD9G+HyRfFGD9GFsWwNS03tZ+zB75ec9AbhbZMBOJ00
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="344178834"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="344178834"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 18:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="803226538"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="803226538"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2023 18:08:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAguX-0003Gu-1y;
	Sun, 18 Jun 2023 01:08:57 +0000
Date: Sun, 18 Jun 2023 09:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-4.19.y 289/1172]
 fs/crypto/hkdf.c:47:9: sparse: sparse: Variable length array is used.
Message-ID: <202306180836.RxjP1fTs-lkp@intel.com>
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
config: i386-randconfig-s002-20230614 (https://download.01.org/0day-ci/archive/20230618/202306180836.RxjP1fTs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180836.RxjP1fTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180836.RxjP1fTs-lkp@intel.com/

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
