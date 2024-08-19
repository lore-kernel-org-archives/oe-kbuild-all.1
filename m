Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C22AEEA5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 16:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086257; cv=none; b=pcKhMjOi9qo7GWMZNdmXDY2F2Lt1leeK/2OKyvYO02NdNEylVIMnBauicgDH2Y59t6uf4UlPk4FAHI4CaxnDjrQgeCFvbeutYjKRsd8ekTdKNMAu0jQpH6cR4opbIewAyUJuOSR0UHMDOCTmGQOJ47ofJdC2N4tOs/cGa2pBO/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086257; c=relaxed/simple;
	bh=bm6vGgkrFNwSc3L8rUo/Kzec8CqAPmy97GOkVDePkLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jhCqHEkBEJfIbyrrTR3vlls06kGyS9WV4HOiT6Q/X79aKaKYjHXr2b4znQxQclSmhfDSxsyJrfCTkKQhLWUMpjp7iiP8TAh6c2NrLAElk7sUM64GeVfqEt9sPTgvK8EV/rp79GKmG+6uToEEuVzFq5jWG64ko4dRRZVu3YZfbjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCKTcZaT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCKTcZaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724086255; x=1755622255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bm6vGgkrFNwSc3L8rUo/Kzec8CqAPmy97GOkVDePkLU=;
  b=dCKTcZaTsoIKLWdJTZMzCgs/x+pK+z8KxyEe5aRg7UArpVF4AK9pvhBI
   LwylyinkDaYdOyxvIEgiXuwV4s4kcFDKmZMMtrEe1Y7BNsLqCBKzUZV1d
   wHTRcVX+q/jlkIY3eQw/wWtmywbv80xw8B36zydnsV6e+c+PCYhjQzHJC
   guNASdIVIk3JDIRafNZleX/qkzlNjvVIljR0RF4wPkgKETV4W2eb6VjJD
   AOZrmhMLRe8HJyfe8q3l08LcudhIEgyHG/LH3Fqer9aZd+70qmp6nhMSb
   zxB4DS0NtJhunz25xpcRbu0KwskAlSuXSkeaFMQriG3NuTv/5K8aunn/o
   Q==;
X-CSE-ConnectionGUID: XeQzzDUvSdK9qt5tyKO8dw==
X-CSE-MsgGUID: jPtqW7PiSLSmYgZtWyYZbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26210646"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="26210646"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 09:50:54 -0700
X-CSE-ConnectionGUID: i+4WCiHXSkSx6bdgvfmV9g==
X-CSE-MsgGUID: 1BNoSfG3Rt2AE6PTt1fCsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60404184"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Aug 2024 09:50:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg5ak-0009Cw-2Q;
	Mon, 19 Aug 2024 16:50:50 +0000
Date: Tue, 20 Aug 2024 00:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sagi Grimberg <sagi@grimberg.me>
Subject: [hare-nvme:secure-concat.v9 5/10] crypto/hkdf.c:43:5: error:
 redefinition of 'hkdf_extract'
Message-ID: <202408200025.RFRSfsHx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v9
head:   24817e66fba53d9e2722aec6abd8a00b29bf108a
commit: b5aa0d4d46aa77eff72ff274903a705239484de7 [5/10] nvme: add nvme_auth_derive_tls_psk()
config: arm64-randconfig-001-20240819 (https://download.01.org/0day-ci/archive/20240820/202408200025.RFRSfsHx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200025.RFRSfsHx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408200025.RFRSfsHx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from crypto/hkdf.c:12:
   include/crypto/hkdf.h: In function 'hkdf_extract':
   include/crypto/hkdf.h:25:17: error: 'ENOTSUP' undeclared (first use in this function); did you mean 'ENOTSUPP'?
      25 |         return -ENOTSUP;
         |                 ^~~~~~~
         |                 ENOTSUPP
   include/crypto/hkdf.h:25:17: note: each undeclared identifier is reported only once for each function it appears in
   include/crypto/hkdf.h: In function 'hkdf_expand':
   include/crypto/hkdf.h:31:17: error: 'ENOTSUP' undeclared (first use in this function); did you mean 'ENOTSUPP'?
      31 |         return -ENOTSUP;
         |                 ^~~~~~~
         |                 ENOTSUPP
   crypto/hkdf.c: At top level:
>> crypto/hkdf.c:43:5: error: redefinition of 'hkdf_extract'
      43 | int hkdf_extract(struct crypto_shash *hmac_tfm, const u8 *ikm,
         |     ^~~~~~~~~~~~
   include/crypto/hkdf.h:20:19: note: previous definition of 'hkdf_extract' with type 'int(struct crypto_shash *, const u8 *, unsigned int,  const u8 *, unsigned int,  u8 *)' {aka 'int(struct crypto_shash *, const unsigned char *, unsigned int,  const unsigned char *, unsigned int,  unsigned char *)'}
      20 | static inline int hkdf_extract(struct crypto_shash *hmac_tfm,
         |                   ^~~~~~~~~~~~
>> crypto/hkdf.c:72:5: error: redefinition of 'hkdf_expand'
      72 | int hkdf_expand(struct crypto_shash *hmac_tfm,
         |     ^~~~~~~~~~~
   include/crypto/hkdf.h:27:19: note: previous definition of 'hkdf_expand' with type 'int(struct crypto_shash *, const u8 *, unsigned int,  u8 *, unsigned int)' {aka 'int(struct crypto_shash *, const unsigned char *, unsigned int,  unsigned char *, unsigned int)'}
      27 | static inline int hkdf_expand(struct crypto_shash *hmac_tfm,
         |                   ^~~~~~~~~~~
--
   In file included from drivers/nvme/common/auth.c:14:
   include/crypto/hkdf.h: In function 'hkdf_extract':
   include/crypto/hkdf.h:25:17: error: 'ENOTSUP' undeclared (first use in this function); did you mean 'ENOTSUPP'?
      25 |         return -ENOTSUP;
         |                 ^~~~~~~
         |                 ENOTSUPP
   include/crypto/hkdf.h:25:17: note: each undeclared identifier is reported only once for each function it appears in
   include/crypto/hkdf.h: In function 'hkdf_expand':
   include/crypto/hkdf.h:31:17: error: 'ENOTSUP' undeclared (first use in this function); did you mean 'ENOTSUPP'?
      31 |         return -ENOTSUP;
         |                 ^~~~~~~
         |                 ENOTSUPP
   include/crypto/hkdf.h: In function 'hkdf_extract':
>> include/crypto/hkdf.h:26:1: warning: control reaches end of non-void function [-Wreturn-type]
      26 | }
         | ^
   include/crypto/hkdf.h: In function 'hkdf_expand':
   include/crypto/hkdf.h:32:1: warning: control reaches end of non-void function [-Wreturn-type]
      32 | }
         | ^


vim +/hkdf_extract +43 crypto/hkdf.c

7cdb18431a4b69 Hannes Reinecke 2024-07-18   14  
7cdb18431a4b69 Hannes Reinecke 2024-07-18   15  /*
7cdb18431a4b69 Hannes Reinecke 2024-07-18   16   * HKDF consists of two steps:
7cdb18431a4b69 Hannes Reinecke 2024-07-18   17   *
7cdb18431a4b69 Hannes Reinecke 2024-07-18   18   * 1. HKDF-Extract: extract a pseudorandom key from the input keying material
7cdb18431a4b69 Hannes Reinecke 2024-07-18   19   *    and optional salt.
7cdb18431a4b69 Hannes Reinecke 2024-07-18   20   * 2. HKDF-Expand: expand the pseudorandom key into output keying material of
7cdb18431a4b69 Hannes Reinecke 2024-07-18   21   *    any length, parameterized by an application-specific info string.
7cdb18431a4b69 Hannes Reinecke 2024-07-18   22   *
7cdb18431a4b69 Hannes Reinecke 2024-07-18   23   */
7cdb18431a4b69 Hannes Reinecke 2024-07-18   24  
7cdb18431a4b69 Hannes Reinecke 2024-07-18   25  /**
7cdb18431a4b69 Hannes Reinecke 2024-07-18   26   * hkdf_extract - HKDF-Extract (RFC 5869 section 2.2)
7cdb18431a4b69 Hannes Reinecke 2024-07-18   27   * @hmac_tfm: hash context
7cdb18431a4b69 Hannes Reinecke 2024-07-18   28   * @ikm: input keying material
7cdb18431a4b69 Hannes Reinecke 2024-07-18   29   * @ikmlen: length of @ikm
7cdb18431a4b69 Hannes Reinecke 2024-07-18   30   * @salt: input salt value
7cdb18431a4b69 Hannes Reinecke 2024-07-18   31   * @saltlen: length of @salt
7cdb18431a4b69 Hannes Reinecke 2024-07-18   32   * @prk: resulting pseudorandom key
7cdb18431a4b69 Hannes Reinecke 2024-07-18   33   *
7cdb18431a4b69 Hannes Reinecke 2024-07-18   34   * Extracts a pseudorandom key @prk from the input keying material
7cdb18431a4b69 Hannes Reinecke 2024-07-18   35   * @ikm with length @ikmlen and salt @salt with length @saltlen.
7cdb18431a4b69 Hannes Reinecke 2024-07-18   36   * The length of @prk is given by the digest size of @hmac_tfm.
7cdb18431a4b69 Hannes Reinecke 2024-07-18   37   * For an 'unsalted' version of HKDF-Extract @salt should be set
7cdb18431a4b69 Hannes Reinecke 2024-07-18   38   * to all zeroes and @saltlen should be set to the length of @prk.
7cdb18431a4b69 Hannes Reinecke 2024-07-18   39   *
7cdb18431a4b69 Hannes Reinecke 2024-07-18   40   * Returns 0 on success with the pseudorandom key stored in @prk,
7cdb18431a4b69 Hannes Reinecke 2024-07-18   41   * otherwise a negative error.
7cdb18431a4b69 Hannes Reinecke 2024-07-18   42   */
7cdb18431a4b69 Hannes Reinecke 2024-07-18  @43  int hkdf_extract(struct crypto_shash *hmac_tfm, const u8 *ikm,
7cdb18431a4b69 Hannes Reinecke 2024-07-18   44  		 unsigned int ikmlen, const u8 *salt, unsigned int saltlen,
7cdb18431a4b69 Hannes Reinecke 2024-07-18   45  		 u8 *prk)
7cdb18431a4b69 Hannes Reinecke 2024-07-18   46  {
7cdb18431a4b69 Hannes Reinecke 2024-07-18   47  	int err;
7cdb18431a4b69 Hannes Reinecke 2024-07-18   48  
7cdb18431a4b69 Hannes Reinecke 2024-07-18   49  	err = crypto_shash_setkey(hmac_tfm, salt, saltlen);
7cdb18431a4b69 Hannes Reinecke 2024-07-18   50  	if (!err)
7cdb18431a4b69 Hannes Reinecke 2024-07-18   51  		err = crypto_shash_tfm_digest(hmac_tfm, ikm, ikmlen, prk);
7cdb18431a4b69 Hannes Reinecke 2024-07-18   52  
7cdb18431a4b69 Hannes Reinecke 2024-07-18   53  	return err;
7cdb18431a4b69 Hannes Reinecke 2024-07-18   54  }
7cdb18431a4b69 Hannes Reinecke 2024-07-18   55  EXPORT_SYMBOL_GPL(hkdf_extract);
7cdb18431a4b69 Hannes Reinecke 2024-07-18   56  
7cdb18431a4b69 Hannes Reinecke 2024-07-18   57  /*
7cdb18431a4b69 Hannes Reinecke 2024-07-18   58   * hkdf_expand - HKDF-Expand (RFC 5869 section 2.3)
7cdb18431a4b69 Hannes Reinecke 2024-07-18   59   * @hmac_tfm: hash context keyed with pseudorandom key
7cdb18431a4b69 Hannes Reinecke 2024-07-18   60   * @info: application-specific information
7cdb18431a4b69 Hannes Reinecke 2024-07-18   61   * @infolen: length of @info
7cdb18431a4b69 Hannes Reinecke 2024-07-18   62   * @okm: output keying material
7cdb18431a4b69 Hannes Reinecke 2024-07-18   63   *
7cdb18431a4b69 Hannes Reinecke 2024-07-18   64   * This expands the pseudorandom key, which was already keyed into @hmac_tfm,
7cdb18431a4b69 Hannes Reinecke 2024-07-18   65   * into @okmlen bytes of output keying material parameterized by the
7cdb18431a4b69 Hannes Reinecke 2024-07-18   66   * application-specific @info of length @infolen bytes.
7cdb18431a4b69 Hannes Reinecke 2024-07-18   67   * This is thread-safe and may be called by multiple threads in parallel.
7cdb18431a4b69 Hannes Reinecke 2024-07-18   68   *
7cdb18431a4b69 Hannes Reinecke 2024-07-18   69   * Returns 0 on success with output keying material stored in @okm,
7cdb18431a4b69 Hannes Reinecke 2024-07-18   70   * negative error number otherwise.
7cdb18431a4b69 Hannes Reinecke 2024-07-18   71   */
7cdb18431a4b69 Hannes Reinecke 2024-07-18  @72  int hkdf_expand(struct crypto_shash *hmac_tfm,
7cdb18431a4b69 Hannes Reinecke 2024-07-18   73  		const u8 *info, unsigned int infolen,
7cdb18431a4b69 Hannes Reinecke 2024-07-18   74  		u8 *okm, unsigned int okmlen)
7cdb18431a4b69 Hannes Reinecke 2024-07-18   75  {
7cdb18431a4b69 Hannes Reinecke 2024-07-18   76  	SHASH_DESC_ON_STACK(desc, hmac_tfm);
7cdb18431a4b69 Hannes Reinecke 2024-07-18   77  	unsigned int i, hashlen = crypto_shash_digestsize(hmac_tfm);
7cdb18431a4b69 Hannes Reinecke 2024-07-18   78  	int err;
7cdb18431a4b69 Hannes Reinecke 2024-07-18   79  	const u8 *prev = NULL;
7cdb18431a4b69 Hannes Reinecke 2024-07-18   80  	u8 counter = 1;
7cdb18431a4b69 Hannes Reinecke 2024-07-18   81  	u8 *tmp;
7cdb18431a4b69 Hannes Reinecke 2024-07-18   82  
7cdb18431a4b69 Hannes Reinecke 2024-07-18   83  	if (WARN_ON(okmlen > 255 * hashlen))
7cdb18431a4b69 Hannes Reinecke 2024-07-18   84  		return -EINVAL;
7cdb18431a4b69 Hannes Reinecke 2024-07-18   85  
7cdb18431a4b69 Hannes Reinecke 2024-07-18   86  	tmp = kzalloc(hashlen, GFP_KERNEL);
7cdb18431a4b69 Hannes Reinecke 2024-07-18   87  	if (!tmp)
7cdb18431a4b69 Hannes Reinecke 2024-07-18   88  		return -ENOMEM;
7cdb18431a4b69 Hannes Reinecke 2024-07-18   89  
7cdb18431a4b69 Hannes Reinecke 2024-07-18   90  	desc->tfm = hmac_tfm;
7cdb18431a4b69 Hannes Reinecke 2024-07-18   91  
7cdb18431a4b69 Hannes Reinecke 2024-07-18   92  	for (i = 0; i < okmlen; i += hashlen) {
7cdb18431a4b69 Hannes Reinecke 2024-07-18   93  
7cdb18431a4b69 Hannes Reinecke 2024-07-18   94  		err = crypto_shash_init(desc);
7cdb18431a4b69 Hannes Reinecke 2024-07-18   95  		if (err)
7cdb18431a4b69 Hannes Reinecke 2024-07-18   96  			goto out;
7cdb18431a4b69 Hannes Reinecke 2024-07-18   97  
7cdb18431a4b69 Hannes Reinecke 2024-07-18   98  		if (prev) {
7cdb18431a4b69 Hannes Reinecke 2024-07-18   99  			err = crypto_shash_update(desc, prev, hashlen);
7cdb18431a4b69 Hannes Reinecke 2024-07-18  100  			if (err)
7cdb18431a4b69 Hannes Reinecke 2024-07-18  101  				goto out;
7cdb18431a4b69 Hannes Reinecke 2024-07-18  102  		}
7cdb18431a4b69 Hannes Reinecke 2024-07-18  103  
7cdb18431a4b69 Hannes Reinecke 2024-07-18  104  		if (info && infolen) {
7cdb18431a4b69 Hannes Reinecke 2024-07-18  105  			err = crypto_shash_update(desc, info, infolen);
7cdb18431a4b69 Hannes Reinecke 2024-07-18  106  			if (err)
7cdb18431a4b69 Hannes Reinecke 2024-07-18  107  				goto out;
7cdb18431a4b69 Hannes Reinecke 2024-07-18  108  		}
7cdb18431a4b69 Hannes Reinecke 2024-07-18  109  
7cdb18431a4b69 Hannes Reinecke 2024-07-18  110  		BUILD_BUG_ON(sizeof(counter) != 1);
7cdb18431a4b69 Hannes Reinecke 2024-07-18  111  		if (okmlen - i < hashlen) {
7cdb18431a4b69 Hannes Reinecke 2024-07-18  112  			err = crypto_shash_finup(desc, &counter, 1, tmp);
7cdb18431a4b69 Hannes Reinecke 2024-07-18  113  			if (err)
7cdb18431a4b69 Hannes Reinecke 2024-07-18  114  				goto out;
7cdb18431a4b69 Hannes Reinecke 2024-07-18  115  			memcpy(&okm[i], tmp, okmlen - i);
7cdb18431a4b69 Hannes Reinecke 2024-07-18  116  			memzero_explicit(tmp, sizeof(tmp));
7cdb18431a4b69 Hannes Reinecke 2024-07-18  117  		} else {
7cdb18431a4b69 Hannes Reinecke 2024-07-18  118  			err = crypto_shash_finup(desc, &counter, 1, &okm[i]);
7cdb18431a4b69 Hannes Reinecke 2024-07-18  119  			if (err)
7cdb18431a4b69 Hannes Reinecke 2024-07-18  120  				goto out;
7cdb18431a4b69 Hannes Reinecke 2024-07-18  121  		}
7cdb18431a4b69 Hannes Reinecke 2024-07-18  122  		counter++;
7cdb18431a4b69 Hannes Reinecke 2024-07-18  123  		prev = &okm[i];
7cdb18431a4b69 Hannes Reinecke 2024-07-18  124  	}
7cdb18431a4b69 Hannes Reinecke 2024-07-18  125  	err = 0;
7cdb18431a4b69 Hannes Reinecke 2024-07-18  126  out:
7cdb18431a4b69 Hannes Reinecke 2024-07-18  127  	if (unlikely(err))
7cdb18431a4b69 Hannes Reinecke 2024-07-18  128  		memzero_explicit(okm, okmlen); /* so caller doesn't need to */
7cdb18431a4b69 Hannes Reinecke 2024-07-18  129  	shash_desc_zero(desc);
7cdb18431a4b69 Hannes Reinecke 2024-07-18  130  	kfree(tmp);
7cdb18431a4b69 Hannes Reinecke 2024-07-18  131  	return err;
7cdb18431a4b69 Hannes Reinecke 2024-07-18  132  }
7cdb18431a4b69 Hannes Reinecke 2024-07-18  133  EXPORT_SYMBOL_GPL(hkdf_expand);
7cdb18431a4b69 Hannes Reinecke 2024-07-18  134  

:::::: The code at line 43 was first introduced by commit
:::::: 7cdb18431a4b69e4912fa880449c256e92f3a30d crypto,fs: Separate out hkdf_extract() and hkdf_expand()

:::::: TO: Hannes Reinecke <hare@kernel.org>
:::::: CC: Hannes Reinecke <hare@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
