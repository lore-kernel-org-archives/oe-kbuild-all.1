Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F881494C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 01:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768180587; cv=none; b=pUGckAN5RaqZAkr2nVOSc0fEztp5x39bYVmoGyPmmP1l1vlXi1ONqOBFmpftTku2Lfz7WhmPRmGRqm0aLMsg3zU2dbH8GxfuB7GE0WcDl3tYl9CfFkzUTA0pGchE+JO5oNzTm85GEnlI6wd1jTY8zppetOmZcDZXxib/+h8tia4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768180587; c=relaxed/simple;
	bh=qBtvZ/flvuaWXAABGRRvZ4rFYI2uLS6VHFvtJ7m5IEg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jPW/rMAN99WZbEl1Hci/pS0NDRHhwdqEGlkEAvHmYgnecGDdKODTCkwUvU8AqL4Xk7zb9jNlMzmWwtIx6BUQ+WiIqeAQQC9maI65w9EumNXURmtBpU241O9yb0SGOnLJxBtlpT11oHs15qAr+O5zueuyJNolDowWUQm+w6aIjdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiaGKey1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiaGKey1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768180586; x=1799716586;
  h=date:from:to:cc:subject:message-id;
  bh=qBtvZ/flvuaWXAABGRRvZ4rFYI2uLS6VHFvtJ7m5IEg=;
  b=QiaGKey1BHN+YZra0xc+oHsIvYZv30u53KKFuLF8sCS/DkhHL9MtHGNL
   kRMidPMHkT7I2TBueB20PPa+zHsgdpOvi4QNwtE9CAxSmxzDc7FA+22J+
   BM/JFwaNcNF5TT8ZuOnerkl5TU6RB0vn8MVGFmE6Rc+ag/wEUQDwMZPVv
   TEit3/UEdkPD8gXdm361389rtPMC8ASZN6FpZKGS0h5voa+yr+6FhCH9T
   jrqumLDlsjxJHMjls1bdN2hOEy4hlJ6R031RBPQG4oUPVK+BSlSn/Bl9e
   jqZZghnb1JdBs/t9SSKAol78WWJ88zpwtl5Gy8FxX4pTtpOYJ9MmQvCkA
   w==;
X-CSE-ConnectionGUID: rPCaCjvbSLy0E0JwTm0LnA==
X-CSE-MsgGUID: w0UaH2YKSn6aiqzBCuoC9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69441827"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69441827"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 17:16:26 -0800
X-CSE-ConnectionGUID: j2u/X4COSqqHItnnFjboIw==
X-CSE-MsgGUID: SQMb97ubQPSdRxrbqMQ1GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208452899"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jan 2026 17:16:23 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf6Xd-000000000an-0AuE;
	Mon, 12 Jan 2026 01:16:21 +0000
Date: Mon, 12 Jan 2026 02:15:26 +0100
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 5/8] crypto/testmgr.c:3971:15: error:
 too few arguments to function 'crypto_sig_verify'
Message-ID: <202601120238.GMWIKhYM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   7b32eec2a40ecddafbcbd35bda3ccd1c54477b05
commit: 229769f7796050dd02dbf2e67e935bb6e53cb6da [5/8] crypto: Add supplementary info param to asymmetric key signature verification
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260112/202601120238.GMWIKhYM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120238.GMWIKhYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120238.GMWIKhYM-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/testmgr.c: In function 'test_sig_one':
>> crypto/testmgr.c:3971:15: error: too few arguments to function 'crypto_sig_verify'
    3971 |         err = crypto_sig_verify(tfm, vecs->c, vecs->c_size,
         |               ^~~~~~~~~~~~~~~~~
   In file included from crypto/testmgr.c:36:
   include/crypto/sig.h:217:19: note: declared here
     217 | static inline int crypto_sig_verify(struct crypto_sig *tfm,
         |                   ^~~~~~~~~~~~~~~~~


vim +/crypto_sig_verify +3971 crypto/testmgr.c

946cc46372dcf8 Tadeusz Struk 2015-06-16  3942  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3943  static int test_sig_one(struct crypto_sig *tfm, const struct sig_testvec *vecs)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3944  {
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3945  	u8 *ptr, *key __free(kfree);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3946  	int err, sig_size;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3947  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3948  	key = kmalloc(vecs->key_len + 2 * sizeof(u32) + vecs->param_len,
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3949  		      GFP_KERNEL);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3950  	if (!key)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3951  		return -ENOMEM;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3952  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3953  	/* ecrdsa expects additional parameters appended to the key */
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3954  	memcpy(key, vecs->key, vecs->key_len);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3955  	ptr = key + vecs->key_len;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3956  	ptr = test_pack_u32(ptr, vecs->algo);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3957  	ptr = test_pack_u32(ptr, vecs->param_len);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3958  	memcpy(ptr, vecs->params, vecs->param_len);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3959  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3960  	if (vecs->public_key_vec)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3961  		err = crypto_sig_set_pubkey(tfm, key, vecs->key_len);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3962  	else
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3963  		err = crypto_sig_set_privkey(tfm, key, vecs->key_len);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3964  	if (err)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3965  		return err;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3966  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3967  	/*
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3968  	 * Run asymmetric signature verification first
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3969  	 * (which does not require a private key)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3970  	 */
65c4c93caaf1a9 Lukas Wunner  2024-09-10 @3971  	err = crypto_sig_verify(tfm, vecs->c, vecs->c_size,
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3972  				vecs->m, vecs->m_size);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3973  	if (err) {
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3974  		pr_err("alg: sig: verify test failed: err %d\n", err);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3975  		return err;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3976  	}
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3977  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3978  	/*
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3979  	 * Don't invoke sign test (which requires a private key)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3980  	 * for vectors with only a public key.
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3981  	 */
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3982  	if (vecs->public_key_vec)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3983  		return 0;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3984  
f4144b6bb74cc3 Lukas Wunner  2025-02-02  3985  	sig_size = crypto_sig_maxsize(tfm);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3986  	if (sig_size < vecs->c_size) {
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3987  		pr_err("alg: sig: invalid maxsize %u\n", sig_size);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3988  		return -EINVAL;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3989  	}
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3990  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3991  	u8 *sig __free(kfree) = kzalloc(sig_size, GFP_KERNEL);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3992  	if (!sig)
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3993  		return -ENOMEM;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3994  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3995  	/* Run asymmetric signature generation */
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3996  	err = crypto_sig_sign(tfm, vecs->m, vecs->m_size, sig, sig_size);
f4144b6bb74cc3 Lukas Wunner  2025-02-02  3997  	if (err < 0) {
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3998  		pr_err("alg: sig: sign test failed: err %d\n", err);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  3999  		return err;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4000  	}
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4001  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4002  	/* Verify that generated signature equals cooked signature */
f4144b6bb74cc3 Lukas Wunner  2025-02-02  4003  	if (err != vecs->c_size ||
f4144b6bb74cc3 Lukas Wunner  2025-02-02  4004  	    memcmp(sig, vecs->c, vecs->c_size) ||
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4005  	    memchr_inv(sig + vecs->c_size, 0, sig_size - vecs->c_size)) {
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4006  		pr_err("alg: sig: sign test failed: invalid output\n");
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4007  		hexdump(sig, sig_size);
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4008  		return -EINVAL;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4009  	}
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4010  
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4011  	return 0;
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4012  }
65c4c93caaf1a9 Lukas Wunner  2024-09-10  4013  

:::::: The code at line 3971 was first introduced by commit
:::::: 65c4c93caaf1a9fca2855942e338530967162d25 crypto: sig - Introduce sig_alg backend

:::::: TO: Lukas Wunner <lukas@wunner.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
