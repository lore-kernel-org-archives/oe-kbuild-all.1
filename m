Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD68D2773CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 02:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765421852; cv=none; b=Ndl7UYCzxt7uMyI9vTztRiskCLgbYOSNZk3qcg1o/rOVffBM+p9qljgSLG3HaRTAt6SmaZXdryr3/rmP3m/q2XVhepSDx/C6q0ql9Bv+eDrUd3Xi7e69wTLGXzo5McVEH6hVTnE1yCOqZbvSOskBV+x527FH6eCOttXaCUHOfg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765421852; c=relaxed/simple;
	bh=5fg43B15XVFrotCkyT4NLk9ctvIT+8D9u2kANdGpuZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n/eHX0M6t+m7Ir5OUMRJ6G8ingMGLT2GRozycxEdaSSROXmg385jidqyW0Iyy+xo/A8IEkIBMy8MFB0/6EKDaKBKCnaSKcoarlQC2vdGWHuj0DA8ybyKHo91knQ1CxSW37tMNy8IMlIPYUeOg/FnBUh7q9O966t4/ePYdnTzFNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+XRbt1Z; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+XRbt1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765421850; x=1796957850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5fg43B15XVFrotCkyT4NLk9ctvIT+8D9u2kANdGpuZk=;
  b=m+XRbt1Z8dTpFj0StH3W7fUO8+XYi30kQw1JUUYKY8pmIPecnAb6XcR6
   8wCTdsBTvu/ohlcgdpp20L9UFU8cELu4bd+ATNiYyK51selvUuaaxYH8H
   dPk29HHiW5Rmol6SVVuhrM8l2XN5GAi94VeCOxIXF+aS4U/nyGkKtbw6s
   fGxnnQz3w9/WfxvQxWG9MHNgCh5Elm/Z+oM/psvTXIOwI2D7HGaMzjdxf
   65eE9iG/lguUZgyG+U1KF648tK/D8Q9muVz7cdeLvBmPE7C65lFNbTLP1
   tq/7Nv04PZ5sNgi3wTrTfklEQTGDfW+nE3zgLEPYgDJ9qvPZdLxkblRcr
   A==;
X-CSE-ConnectionGUID: LA3TSJ47RKO7no6+8IJP2g==
X-CSE-MsgGUID: nZoGL3MtTBybIOHG7zShhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71025027"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71025027"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:57:29 -0800
X-CSE-ConnectionGUID: LT1NBAnsSV68B5+L6G372A==
X-CSE-MsgGUID: Fek9h156RHCrv+HVmIpCdA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Dec 2025 18:57:28 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTWru-0000000044Z-2epD;
	Thu, 11 Dec 2025 02:57:26 +0000
Date: Thu, 11 Dec 2025 10:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 5/5] crypto/testmgr.c:4062:15: error: too few
 arguments to function 'crypto_sig_verify'
Message-ID: <202512111055.IHgSKPdt-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251211/202512111055.IHgSKPdt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111055.IHgSKPdt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111055.IHgSKPdt-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/testmgr.c: In function 'test_sig_one':
>> crypto/testmgr.c:4062:15: error: too few arguments to function 'crypto_sig_verify'
    4062 |         err = crypto_sig_verify(tfm, vecs->c, vecs->c_size,
         |               ^~~~~~~~~~~~~~~~~
   In file included from crypto/testmgr.c:36:
   include/crypto/sig.h:217:19: note: declared here
     217 | static inline int crypto_sig_verify(struct crypto_sig *tfm,
         |                   ^~~~~~~~~~~~~~~~~


vim +/crypto_sig_verify +4062 crypto/testmgr.c

946cc46372dcf8e Tadeusz Struk 2015-06-16  4033  
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4034  static int test_sig_one(struct crypto_sig *tfm, const struct sig_testvec *vecs)
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4035  {
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4036  	u8 *ptr, *key __free(kfree);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4037  	int err, sig_size;
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4038  
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4039  	key = kmalloc(vecs->key_len + 2 * sizeof(u32) + vecs->param_len,
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4040  		      GFP_KERNEL);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4041  	if (!key)
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4042  		return -ENOMEM;
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4043  
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4044  	/* ecrdsa expects additional parameters appended to the key */
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4045  	memcpy(key, vecs->key, vecs->key_len);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4046  	ptr = key + vecs->key_len;
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4047  	ptr = test_pack_u32(ptr, vecs->algo);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4048  	ptr = test_pack_u32(ptr, vecs->param_len);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4049  	memcpy(ptr, vecs->params, vecs->param_len);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4050  
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4051  	if (vecs->public_key_vec)
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4052  		err = crypto_sig_set_pubkey(tfm, key, vecs->key_len);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4053  	else
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4054  		err = crypto_sig_set_privkey(tfm, key, vecs->key_len);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4055  	if (err)
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4056  		return err;
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4057  
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4058  	/*
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4059  	 * Run asymmetric signature verification first
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4060  	 * (which does not require a private key)
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4061  	 */
65c4c93caaf1a9f Lukas Wunner  2024-09-10 @4062  	err = crypto_sig_verify(tfm, vecs->c, vecs->c_size,
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4063  				vecs->m, vecs->m_size);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4064  	if (err) {
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4065  		pr_err("alg: sig: verify test failed: err %d\n", err);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4066  		return err;
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4067  	}
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4068  
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4069  	/*
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4070  	 * Don't invoke sign test (which requires a private key)
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4071  	 * for vectors with only a public key.
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4072  	 */
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4073  	if (vecs->public_key_vec)
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4074  		return 0;
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4075  
f4144b6bb74cc35 Lukas Wunner  2025-02-02  4076  	sig_size = crypto_sig_maxsize(tfm);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4077  	if (sig_size < vecs->c_size) {
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4078  		pr_err("alg: sig: invalid maxsize %u\n", sig_size);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4079  		return -EINVAL;
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4080  	}
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4081  
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4082  	u8 *sig __free(kfree) = kzalloc(sig_size, GFP_KERNEL);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4083  	if (!sig)
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4084  		return -ENOMEM;
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4085  
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4086  	/* Run asymmetric signature generation */
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4087  	err = crypto_sig_sign(tfm, vecs->m, vecs->m_size, sig, sig_size);
f4144b6bb74cc35 Lukas Wunner  2025-02-02  4088  	if (err < 0) {
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4089  		pr_err("alg: sig: sign test failed: err %d\n", err);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4090  		return err;
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4091  	}
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4092  
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4093  	/* Verify that generated signature equals cooked signature */
f4144b6bb74cc35 Lukas Wunner  2025-02-02  4094  	if (err != vecs->c_size ||
f4144b6bb74cc35 Lukas Wunner  2025-02-02  4095  	    memcmp(sig, vecs->c, vecs->c_size) ||
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4096  	    memchr_inv(sig + vecs->c_size, 0, sig_size - vecs->c_size)) {
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4097  		pr_err("alg: sig: sign test failed: invalid output\n");
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4098  		hexdump(sig, sig_size);
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4099  		return -EINVAL;
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4100  	}
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4101  
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4102  	return 0;
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4103  }
65c4c93caaf1a9f Lukas Wunner  2024-09-10  4104  

:::::: The code at line 4062 was first introduced by commit
:::::: 65c4c93caaf1a9fca2855942e338530967162d25 crypto: sig - Introduce sig_alg backend

:::::: TO: Lukas Wunner <lukas@wunner.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
