Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D1A1C01
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Dec 2023 04:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3+2tVnN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703218614; x=1734754614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mh2twtCdY2udEo/saVWMGfkC5Bh5XWm3JTUH35GAPW4=;
  b=Y3+2tVnNl24KecQZmwg5xkptNcZgwR3YNqCfGu7hOYOXclLbMUmA63DV
   +SXjmFcjMUs+DV1pcplxc9SJtBGYnXd9kPfyUDSt8QXPHUoTNTlOROz4o
   73KGBhvNngJmPXsKoYzp4eT7SZ6khZY8GW+4VrY2huCxkOuhAsWKVxlrp
   NI1R0x5/86ADHlSTZ+DJn/Y9qCZcSIBn1PgkFdXGf8IXnctcWqPWdUj8d
   UqyJss6+cObWfzbyHIkTmZt2WrCi+A/l7mhJWnKS00oC/9TcRm4ShM+Uo
   K8GaJ/ZT++7LUZ9ONht3ataejG7dRA+ZycoOfOB3djDL9ryRDOb5cvTJm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="394968146"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="394968146"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 20:16:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="11346782"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2023 20:16:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGWxr-00094f-0G;
	Fri, 22 Dec 2023 04:16:48 +0000
Date: Fri, 22 Dec 2023 12:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 6/21] crypto/krb5/kdf.c:116:16: warning:
 writing 1 byte into a region of size 0
Message-ID: <202312221221.q2p8tGAD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   ebd44e15422341724b06a3a13590ea80244ebbd6
commit: b468b20c76d24a3eee1e29352769251daae938f9 [6/21] crypto/krb5: Provide infrastructure and key derivation
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231222/202312221221.q2p8tGAD-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231222/202312221221.q2p8tGAD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312221221.q2p8tGAD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/krb5/kdf.c: In function 'crypto_krb5_get_Kc':
>> crypto/krb5/kdf.c:116:16: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     116 |         buf[4] = KEY_USAGE_SEED_CHECKSUM;
   crypto/krb5/kdf.c:112:12: note: at offset 4 into destination object 'buf' of size 4
     112 |         u8 buf[CRYPTO_MINALIGN] __aligned(CRYPTO_MINALIGN);
         |            ^~~
   crypto/krb5/kdf.c: In function 'crypto_krb5_get_Ki':
   crypto/krb5/kdf.c:206:16: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     206 |         buf[4] = KEY_USAGE_SEED_INTEGRITY;
   crypto/krb5/kdf.c:202:12: note: at offset 4 into destination object 'buf' of size 4
     202 |         u8 buf[CRYPTO_MINALIGN] __aligned(CRYPTO_MINALIGN);
         |            ^~~
   crypto/krb5/kdf.c: In function 'crypto_krb5_get_Ke':
   crypto/krb5/kdf.c:161:16: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     161 |         buf[4] = KEY_USAGE_SEED_ENCRYPTION;
   crypto/krb5/kdf.c:157:12: note: at offset 4 into destination object 'buf' of size 4
     157 |         u8 buf[CRYPTO_MINALIGN] __aligned(CRYPTO_MINALIGN);
         |            ^~~


vim +116 crypto/krb5/kdf.c

    89	
    90	/**
    91	 * crypto_krb5_get_Kc - Derive key Kc and install into a hash
    92	 * @krb5: The encryption type to use
    93	 * @TK: The base key
    94	 * @usage: The key usage number
    95	 * @key: Prepped buffer to store the key into
    96	 * @_shash: Where to put the hash (or NULL if not wanted)
    97	 * @gfp: Allocation restrictions
    98	 *
    99	 * Derive the Kerberos Kc checksumming key and, optionally, allocate a hash and
   100	 * install the key into it, returning the hash.  The key is stored into the
   101	 * prepared buffer.
   102	 */
   103	int crypto_krb5_get_Kc(const struct krb5_enctype *krb5,
   104			       const struct krb5_buffer *TK,
   105			       u32 usage,
   106			       struct krb5_buffer *key,
   107			       struct crypto_shash **_shash,
   108			       gfp_t gfp)
   109	{
   110		struct crypto_shash *shash;
   111		int ret;
   112		u8 buf[CRYPTO_MINALIGN] __aligned(CRYPTO_MINALIGN);
   113		struct krb5_buffer usage_constant = { .len = 5, .data = buf };
   114	
   115		*(__be32 *)buf = cpu_to_be32(usage);
 > 116		buf[4] = KEY_USAGE_SEED_CHECKSUM;
   117	
   118		key->len = krb5->Kc_len;
   119		ret = krb5->profile->calc_Kc(krb5, TK, &usage_constant, key, gfp);
   120		if (ret < 0)
   121			return ret;
   122	
   123		if (_shash) {
   124			shash = crypto_alloc_shash(krb5->cksum_name, 0, 0);
   125			if (IS_ERR(shash))
   126				return (PTR_ERR(shash) == -ENOENT) ? -ENOPKG : PTR_ERR(shash);
   127			*_shash = shash;
   128			ret = crypto_shash_setkey(shash, key->data, key->len);
   129		}
   130	
   131		return ret;
   132	}
   133	EXPORT_SYMBOL(crypto_krb5_get_Kc);
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
