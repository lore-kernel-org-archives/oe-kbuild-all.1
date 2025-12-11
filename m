Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9BB30170E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 10:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765448939; cv=none; b=EvJyvcRy0j/4f9A/eJ7oVaTY6RX/m5djb9C0tO2zFKBdBDFj0vVqw8r0MNnDXhlDwkXFboTtShHzp9T/5I0jRv/Dzsl69l3ZxLUlAZTVpBDhImyW3tnnwL4SLEyfyq93XftbKfbUJWWwesoomPWzOohn8JYb6b3cTOzeqQ2AejU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765448939; c=relaxed/simple;
	bh=ly/zF3i4wfSdBzy2pRTttArzzRQzxWxN1QGa30pD4+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vC1Afni9vi/Vg4OyWxwZFzzbuDIdGfJREWkKKb3iIiIdquaMYVJN3L9Yae+TeRZw/tbYrOhM/63RPwwJXmIV4Rpte3CxEo8+Xot7OmqUZK4osRHarhk8vKfMMZpV9cWS6K7sJphaSqvTtTvqcHw6gJrhXU2LiBD7fhNoSa67MTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJc+HW9p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJc+HW9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765448937; x=1796984937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ly/zF3i4wfSdBzy2pRTttArzzRQzxWxN1QGa30pD4+E=;
  b=VJc+HW9pde9rnec54FstRQNoIUlnbHXxg6SRrNbTHjhGbU9CjiEkmBYX
   RQHvn04L3RIrV1VcFCy0AqUurghh+/awFD/PeLmKHPbfNeeTIwyTqcrIA
   g1bxRTbu/0MM4j2DRXN4Nrs5+cuQNdbgxk0osgjDedaMtclzSpOJaLPYY
   EgqHXs2NoatWt5SXHk8nQNarpQ4lon8Y20/yl8WlQ8kFiZxa928ODZJbM
   RRognGz3seFBJ+gYUacPoSPga/yRf6gFFI0qttOAyYKktvf/ipq12/ngS
   wZnWviImcGIQ8vg9lXPQ3QSFVfIVNccPdl/NdijoAnhWFTgD378DI5LOW
   g==;
X-CSE-ConnectionGUID: eGfPVFzbS9WV9HyJfihLSw==
X-CSE-MsgGUID: jbGqDTWuRg+ie2yQoR+MKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78132325"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78132325"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 02:28:57 -0800
X-CSE-ConnectionGUID: yYxrec6rTauIMgKAXZVI3Q==
X-CSE-MsgGUID: 49cGs+0gThuPKEy2n+DJ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196771174"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2025 02:28:56 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTdun-000000004X7-0c6m;
	Thu, 11 Dec 2025 10:28:53 +0000
Date: Thu, 11 Dec 2025 18:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 5/5] crypto/testmgr.c:4062:15: error: too few
 arguments to function 'crypto_sig_verify'; expected 6, have 5
Message-ID: <202512111836.3p0agtLc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   36c9b1b46c63798cb54fac7ece3c85a1a02e0dc2
commit: 36c9b1b46c63798cb54fac7ece3c85a1a02e0dc2 [5/5] Add RSASSA-PSS support (RFC8017)
config: sh-randconfig-001-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111836.3p0agtLc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111836.3p0agtLc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111836.3p0agtLc-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/testmgr.c: In function 'test_sig_one':
>> crypto/testmgr.c:4062:15: error: too few arguments to function 'crypto_sig_verify'; expected 6, have 5
    4062 |         err = crypto_sig_verify(tfm, vecs->c, vecs->c_size,
         |               ^~~~~~~~~~~~~~~~~
   In file included from crypto/testmgr.c:36:
   include/crypto/sig.h:217:19: note: declared here
     217 | static inline int crypto_sig_verify(struct crypto_sig *tfm,
         |                   ^~~~~~~~~~~~~~~~~


vim +/crypto_sig_verify +4062 crypto/testmgr.c

946cc46372dcf8 Tadeusz Struk 2015-06-16  4033  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4034  static int test_sig_one(struct crypto_sig *tfm, const struct sig_testvec *vecs)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4035  {
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4036  	u8 *ptr, *key __free(kfree);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4037  	int err, sig_size;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4038  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4039  	key = kmalloc(vecs->key_len + 2 * sizeof(u32) + vecs->param_len,
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4040  		      GFP_KERNEL);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4041  	if (!key)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4042  		return -ENOMEM;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4043  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4044  	/* ecrdsa expects additional parameters appended to the key */
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4045  	memcpy(key, vecs->key, vecs->key_len);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4046  	ptr = key + vecs->key_len;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4047  	ptr = test_pack_u32(ptr, vecs->algo);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4048  	ptr = test_pack_u32(ptr, vecs->param_len);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4049  	memcpy(ptr, vecs->params, vecs->param_len);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4050  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4051  	if (vecs->public_key_vec)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4052  		err = crypto_sig_set_pubkey(tfm, key, vecs->key_len);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4053  	else
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4054  		err = crypto_sig_set_privkey(tfm, key, vecs->key_len);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4055  	if (err)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4056  		return err;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4057  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4058  	/*
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4059  	 * Run asymmetric signature verification first
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4060  	 * (which does not require a private key)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4061  	 */
65c4c93caaf1a9 Lukas Wunner  2024-09-10 @4062  	err = crypto_sig_verify(tfm, vecs->c, vecs->c_size,
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4063  				vecs->m, vecs->m_size);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4064  	if (err) {
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4065  		pr_err("alg: sig: verify test failed: err %d\n", err);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4066  		return err;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4067  	}
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4068  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4069  	/*
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4070  	 * Don't invoke sign test (which requires a private key)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4071  	 * for vectors with only a public key.
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4072  	 */
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4073  	if (vecs->public_key_vec)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4074  		return 0;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4075  
f4144b6bb74cc3 Lukas Wunner  2025-02-02  4076  	sig_size = crypto_sig_maxsize(tfm);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4077  	if (sig_size < vecs->c_size) {
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4078  		pr_err("alg: sig: invalid maxsize %u\n", sig_size);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4079  		return -EINVAL;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4080  	}
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4081  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4082  	u8 *sig __free(kfree) = kzalloc(sig_size, GFP_KERNEL);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4083  	if (!sig)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4084  		return -ENOMEM;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4085  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4086  	/* Run asymmetric signature generation */
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4087  	err = crypto_sig_sign(tfm, vecs->m, vecs->m_size, sig, sig_size);
f4144b6bb74cc3 Lukas Wunner  2025-02-02  4088  	if (err < 0) {
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4089  		pr_err("alg: sig: sign test failed: err %d\n", err);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4090  		return err;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4091  	}
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4092  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4093  	/* Verify that generated signature equals cooked signature */
f4144b6bb74cc3 Lukas Wunner  2025-02-02  4094  	if (err != vecs->c_size ||
f4144b6bb74cc3 Lukas Wunner  2025-02-02  4095  	    memcmp(sig, vecs->c, vecs->c_size) ||
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4096  	    memchr_inv(sig + vecs->c_size, 0, sig_size - vecs->c_size)) {
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4097  		pr_err("alg: sig: sign test failed: invalid output\n");
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4098  		hexdump(sig, sig_size);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4099  		return -EINVAL;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4100  	}
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4101  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4102  	return 0;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4103  }
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4104  

:::::: The code at line 4062 was first introduced by commit
:::::: 65c4c93caaf1a9fca2855942e338530967162d25 crypto: sig - Introduce sig_alg backend

:::::: TO: Lukas Wunner <lukas@wunner.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
