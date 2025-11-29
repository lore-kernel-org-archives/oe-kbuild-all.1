Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878CF8BEC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 01:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764378106; cv=none; b=X2yPJbTDqcAnj4saD7I62wZScscrCB9YzTbrDrmMXovU1JuuCyzajaXOkQjHOQSni/ZjmKi4XTuAX99EsMYoGvS31Kw6Gj1OGUXxwHAgojc/is/ZYc97CDsCUIZTcKpXPomig0bfU70HB9UF/IiXIwctf7GF4WtAcAxubKAJAvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764378106; c=relaxed/simple;
	bh=RXYA+RpN+Qh6YJyU6Z2rbvCIxvrjEp4ibVnORpSjc3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxdDIKnn0AW0HRz//BHeqqZP0JItf2SsHvyYp8e5ldG6ZSmkBO/m1H0wjrYkFWuaO0Zwk36Wf87qC3vGscvDZbRtc8YUAQjkWSimrZsGr0lNkMgLCHDViBpVu4pjax+8X74DXYLW+9KuEyN+7GO55WFa+5H6SKIX4RcCb5v4xgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=daq7VRis; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="daq7VRis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764378105; x=1795914105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RXYA+RpN+Qh6YJyU6Z2rbvCIxvrjEp4ibVnORpSjc3o=;
  b=daq7VRisZnssGxt3lZuTXYVY7ISoRiWvv0iQOg05CR6j0kGQDgVincm9
   X22oX8k4IFX28/6vMcsgeGK8LfDlpfdqWlYx0RQxZV5BfRQFngpnQQtvZ
   N4Vrux62tXH+Ptvy0GmHd37qLrOmCN0F9r605YVCGP5yRqbjX3MKTrIoS
   de0dUXgQraBJqIxcHSGU+n4mfLffEbwfSCQItHUG++dDc4OirZvbzU39c
   wPIqONzGj68rdTfrN4/pXhJ9j23gQTryZ6sThn3VvEVQnsSIUeRpvSN14
   HCT5j9u9pAb7g1QXCE8pGxxMLx3Pg2y4hFvRrZ8QpDbPhF+O1SoYQYNcS
   Q==;
X-CSE-ConnectionGUID: ZCHMFaV4T3inN1ckkkbD/A==
X-CSE-MsgGUID: x96gcJqFRKmmyqkaM9HZ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66115322"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66115322"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 17:01:44 -0800
X-CSE-ConnectionGUID: PgiLiW0ySF+KI8/bG2HCFw==
X-CSE-MsgGUID: qql/RNx4R3qHwgzzBYbZnQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Nov 2025 17:01:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP9LI-000000006rd-1fEJ;
	Sat, 29 Nov 2025 01:01:40 +0000
Date: Sat, 29 Nov 2025 09:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: Li Tian <litian@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] crypto/hkdf: Fix salt length short issue in FIPS mode
Message-ID: <202511290809.8Fr4ja5n-lkp@intel.com>
References: <20251126134222.22083-1-litian@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126134222.22083-1-litian@redhat.com>

Hi Li,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v6.18-rc7 next-20251128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Tian/crypto-hkdf-Fix-salt-length-short-issue-in-FIPS-mode/20251126-214458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20251126134222.22083-1-litian%40redhat.com
patch subject: [PATCH RFC] crypto/hkdf: Fix salt length short issue in FIPS mode
config: arc-randconfig-001-20251129 (https://download.01.org/0day-ci/archive/20251129/202511290809.8Fr4ja5n-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511290809.8Fr4ja5n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511290809.8Fr4ja5n-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/crypto/hkdf.c: In function 'fscrypt_init_hkdf':
>> fs/crypto/hkdf.c:40:31: error: 'HKDF_HASHLEN' undeclared (first use in this function); did you mean 'DT_HASH'?
     static const u8 default_salt[HKDF_HASHLEN];
                                  ^~~~~~~~~~~~
                                  DT_HASH
   fs/crypto/hkdf.c:40:31: note: each undeclared identifier is reported only once for each function it appears in
>> fs/crypto/hkdf.c:41:5: warning: unused variable 'prk' [-Wunused-variable]
     u8 prk[HKDF_HASHLEN];
        ^~~
>> fs/crypto/hkdf.c:40:18: warning: unused variable 'default_salt' [-Wunused-variable]
     static const u8 default_salt[HKDF_HASHLEN];
                     ^~~~~~~~~~~~
   fs/crypto/hkdf.c: In function 'fscrypt_hkdf_expand':
   fs/crypto/hkdf.c:65:9: error: 'HKDF_HASHLEN' undeclared (first use in this function); did you mean 'DT_HASH'?
     u8 tmp[HKDF_HASHLEN];
            ^~~~~~~~~~~~
            DT_HASH
>> fs/crypto/hkdf.c:65:5: warning: unused variable 'tmp' [-Wunused-variable]
     u8 tmp[HKDF_HASHLEN];
        ^~~


vim +40 fs/crypto/hkdf.c

c1144c9b8ad94d Eric Biggers    2019-08-04  15  
c1144c9b8ad94d Eric Biggers    2019-08-04  16  /*
c1144c9b8ad94d Eric Biggers    2019-08-04  17   * HKDF consists of two steps:
c1144c9b8ad94d Eric Biggers    2019-08-04  18   *
c1144c9b8ad94d Eric Biggers    2019-08-04  19   * 1. HKDF-Extract: extract a pseudorandom key of length HKDF_HASHLEN bytes from
c1144c9b8ad94d Eric Biggers    2019-08-04  20   *    the input keying material and optional salt.
c1144c9b8ad94d Eric Biggers    2019-08-04  21   * 2. HKDF-Expand: expand the pseudorandom key into output keying material of
c1144c9b8ad94d Eric Biggers    2019-08-04  22   *    any length, parameterized by an application-specific info string.
c1144c9b8ad94d Eric Biggers    2019-08-04  23   *
c1144c9b8ad94d Eric Biggers    2019-08-04  24   * HKDF-Extract can be skipped if the input is already a pseudorandom key of
c1144c9b8ad94d Eric Biggers    2019-08-04  25   * length HKDF_HASHLEN bytes.  However, cipher modes other than AES-256-XTS take
c1144c9b8ad94d Eric Biggers    2019-08-04  26   * shorter keys, and we don't want to force users of those modes to provide
c1144c9b8ad94d Eric Biggers    2019-08-04  27   * unnecessarily long master keys.  Thus fscrypt still does HKDF-Extract.  No
c1144c9b8ad94d Eric Biggers    2019-08-04  28   * salt is used, since fscrypt master keys should already be pseudorandom and
c1144c9b8ad94d Eric Biggers    2019-08-04  29   * there's no way to persist a random salt per master key from kernel mode.
c1144c9b8ad94d Eric Biggers    2019-08-04  30   */
c1144c9b8ad94d Eric Biggers    2019-08-04  31  
c1144c9b8ad94d Eric Biggers    2019-08-04  32  /*
19591f7e781fd1 Eric Biggers    2025-09-05  33   * Compute HKDF-Extract using 'master_key' as the input keying material, and
19591f7e781fd1 Eric Biggers    2025-09-05  34   * prepare the resulting HMAC key in 'hkdf'.  Afterwards, 'hkdf' can be used for
19591f7e781fd1 Eric Biggers    2025-09-05  35   * HKDF-Expand many times without having to recompute HKDF-Extract each time.
c1144c9b8ad94d Eric Biggers    2019-08-04  36   */
19591f7e781fd1 Eric Biggers    2025-09-05  37  void fscrypt_init_hkdf(struct hmac_sha512_key *hkdf, const u8 *master_key,
c1144c9b8ad94d Eric Biggers    2019-08-04  38  		       unsigned int master_key_size)
c1144c9b8ad94d Eric Biggers    2019-08-04  39  {
3241cd0c6c1791 Hannes Reinecke 2025-02-24 @40  	static const u8 default_salt[HKDF_HASHLEN];
c1144c9b8ad94d Eric Biggers    2019-08-04 @41  	u8 prk[HKDF_HASHLEN];
c1144c9b8ad94d Eric Biggers    2019-08-04  42  
19591f7e781fd1 Eric Biggers    2025-09-05  43  	hmac_sha512_usingrawkey(default_salt, sizeof(default_salt),
19591f7e781fd1 Eric Biggers    2025-09-05  44  				master_key, master_key_size, prk);
19591f7e781fd1 Eric Biggers    2025-09-05  45  	hmac_sha512_preparekey(hkdf, prk, sizeof(prk));
c1144c9b8ad94d Eric Biggers    2019-08-04  46  	memzero_explicit(prk, sizeof(prk));
c1144c9b8ad94d Eric Biggers    2019-08-04  47  }
c1144c9b8ad94d Eric Biggers    2019-08-04  48  
c1144c9b8ad94d Eric Biggers    2019-08-04  49  /*
19591f7e781fd1 Eric Biggers    2025-09-05  50   * HKDF-Expand (RFC 5869 section 2.3).  Expand the HMAC key 'hkdf' into 'okmlen'
c1144c9b8ad94d Eric Biggers    2019-08-04  51   * bytes of output keying material parameterized by the application-specific
c1144c9b8ad94d Eric Biggers    2019-08-04  52   * 'info' of length 'infolen' bytes, prefixed by "fscrypt\0" and the 'context'
c1144c9b8ad94d Eric Biggers    2019-08-04  53   * byte.  This is thread-safe and may be called by multiple threads in parallel.
c1144c9b8ad94d Eric Biggers    2019-08-04  54   *
c1144c9b8ad94d Eric Biggers    2019-08-04  55   * ('context' isn't part of the HKDF specification; it's just a prefix fscrypt
c1144c9b8ad94d Eric Biggers    2019-08-04  56   * adds to its application-specific info strings to guarantee that it doesn't
c1144c9b8ad94d Eric Biggers    2019-08-04  57   * accidentally repeat an info string when using HKDF for different purposes.)
c1144c9b8ad94d Eric Biggers    2019-08-04  58   */
19591f7e781fd1 Eric Biggers    2025-09-05  59  void fscrypt_hkdf_expand(const struct hmac_sha512_key *hkdf, u8 context,
c1144c9b8ad94d Eric Biggers    2019-08-04  60  			 const u8 *info, unsigned int infolen,
c1144c9b8ad94d Eric Biggers    2019-08-04  61  			 u8 *okm, unsigned int okmlen)
c1144c9b8ad94d Eric Biggers    2019-08-04  62  {
19591f7e781fd1 Eric Biggers    2025-09-05  63  	struct hmac_sha512_ctx ctx;
19591f7e781fd1 Eric Biggers    2025-09-05  64  	u8 counter = 1;
19591f7e781fd1 Eric Biggers    2025-09-05 @65  	u8 tmp[HKDF_HASHLEN];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
