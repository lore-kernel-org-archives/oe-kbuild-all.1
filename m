Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748F824A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716377067; cv=none; b=tgvEEpFrkRVjCg/SC6FtLg1Aj6QAdPKntPhCpRFKTHc5uAGGVyW8Gimk/jdLc+WLz8797lY3jL6AAjeTEDlZ2RQVfiT2xXDxDXrc+POmS4UEAPckVsvH+ApcaLTkRB/heVuSgW4aL8J0LLxVugJzK9UQzAQWkHeqvqXK4HUJ+TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716377067; c=relaxed/simple;
	bh=GTkDeMdiPhbTO9D/VY1ApDQFtM8Bjk48U8qrtPUPXdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DIBkzkZuGJcl0JNFz4E3Hit1joA3DG0QdGjGuYg0eyUxWoXuwM7FFb3Qdpz+nVqFLe2qXdEZ2xkZtVhG/tfaDh051jN+5ns/g3YRue6mzuPQMoamLBw3nFjBbYHuYBXGajJdkO393FesbX41YjuhU3oJCAzdrOLRHjNdQuYjIZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LECfevZ4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LECfevZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716377066; x=1747913066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GTkDeMdiPhbTO9D/VY1ApDQFtM8Bjk48U8qrtPUPXdQ=;
  b=LECfevZ4Lwgmm5NoMxyIb+QmdIsBrLNiSgXmPAxVNh2TjfVJoye8P8Ke
   wlIp11DhQPOXD27O2YlWMxcr5jjAMqGyNxt9THB50eBXwkwP4g5bWdhqh
   WRo6FD1G3PWdRXeehleZrnocNhRfsNrQrTkRkioapbdwj+hRp1K/ZsmFf
   zmJzxLvecDFqyRs75Ub3+R8sIQDMtfQpeJF2F50upTij9G+lh+Ogd4a4B
   s66LuXKl2h5eAGeGl9eMMBF/dy7SoMS1oqsn09eXfCY3k4sgNWUsijxre
   vOAm8gvbI/TMS/jHH2PIDBwEWFV+SgB/NynGJvpTvMRo0+vc1gOaoDYOJ
   Q==;
X-CSE-ConnectionGUID: U3sq3hYVQ82fc66QtYmudQ==
X-CSE-MsgGUID: c0/rlycJQTij75UREDyO1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="35128899"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="35128899"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 04:24:25 -0700
X-CSE-ConnectionGUID: IRpZ+tzeTmuxqo9hDUrwUA==
X-CSE-MsgGUID: bT492HfBQNOCQxO8ZoMYXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="38091110"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 May 2024 04:24:24 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9k4z-0001KJ-1L;
	Wed, 22 May 2024 11:24:21 +0000
Date: Wed, 22 May 2024 19:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: James Prestwood <prestwoj@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:tpm2key-v4 5/5]
 crypto/asymmetric_keys/tpm2_key_rsa.c:273:22: warning: unused variable
 'offset'
Message-ID: <202405221925.Wje4IgfU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v4
head:   8d6000fe712d525bf767a9fbe7028d809adaf79e
commit: 8d6000fe712d525bf767a9fbe7028d809adaf79e [5/5] keys: asymmetric: ASYMMETRIC_TPM2_KEY_RSA_SUBTYPE
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240522/202405221925.Wje4IgfU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405221925.Wje4IgfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405221925.Wje4IgfU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/asymmetric_keys/tpm2_key_rsa.c: In function '__tpm2_key_rsa_decrypt':
>> crypto/asymmetric_keys/tpm2_key_rsa.c:273:22: warning: unused variable 'offset' [-Wunused-variable]
     273 |         unsigned int offset = 0;
         |                      ^~~~~~


vim +/offset +273 crypto/asymmetric_keys/tpm2_key_rsa.c

   267	
   268	static int __tpm2_key_rsa_decrypt(struct tpm_chip *chip,
   269					  struct tpm2_key_rsa *key,
   270					  struct kernel_pkey_params *params,
   271					  const void *in, int in_len, void *out)
   272	{
 > 273		unsigned int offset = 0;
   274		u32 key_handle = 0;
   275		struct tpm_buf buf;
   276		u16 decrypted_len;
   277		u32 parent;
   278		u8 *pos;
   279		int ret;
   280	
   281		ret = tpm_try_get_ops(chip);
   282		if (ret)
   283			return ret;
   284	
   285		ret = tpm2_start_auth_session(chip);
   286		if (ret)
   287			goto err_ops;
   288	
   289		parent = key->key.parent;
   290	
   291		ret = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_LOAD);
   292		if (ret < 0)
   293			goto err_auth;
   294	
   295		tpm_buf_append_name(chip, &buf, parent, NULL);
   296		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_CONTINUE_SESSION |
   297					    TPM2_SA_ENCRYPT, NULL, 0);
   298		tpm_buf_append(&buf, key->key.blob, key->key.blob_len);
   299		if (buf.flags & TPM_BUF_OVERFLOW) {
   300			ret = -E2BIG;
   301			goto err_buf;
   302		}
   303		tpm_buf_fill_hmac_session(chip, &buf);
   304		ret = tpm_transmit_cmd(chip, &buf, 4, "RSA key loading");
   305		ret = tpm_buf_check_hmac_response(chip, &buf, ret);
   306		if (ret) {
   307			ret = -EIO;
   308			goto err_buf;
   309		}
   310		key_handle = be32_to_cpup((__be32 *)&buf.data[TPM_HEADER_SIZE]);
   311	
   312		tpm_buf_reset(&buf, TPM2_ST_SESSIONS, TPM2_CC_RSA_DECRYPT);
   313		tpm_buf_append_name(chip, &buf, key_handle, NULL);
   314		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_DECRYPT, NULL, 0);
   315		tpm_buf_append_u16(&buf, in_len);
   316		tpm_buf_append(&buf, in, in_len);
   317		tpm_buf_append_u16(&buf, TPM_ALG_NULL);
   318		tpm_buf_append_u16(&buf, 0);
   319		tpm_buf_fill_hmac_session(chip, &buf);
   320		ret = tpm_transmit_cmd(chip, &buf, 4, "RSA key decrypting");
   321		ret = tpm_buf_check_hmac_response(chip, &buf, ret);
   322		if (ret) {
   323			ret = -EIO;
   324			goto err_blob;
   325		}
   326	
   327		pos = buf.data + TPM_HEADER_SIZE + 4;
   328		decrypted_len = be16_to_cpup((__be16 *)pos);
   329		pos += 2;
   330	
   331		if (params->out_len < decrypted_len) {
   332			ret = -EMSGSIZE;
   333			goto err_blob;
   334		}
   335	
   336		memcpy(out, pos, decrypted_len);
   337		ret = decrypted_len;
   338	
   339	err_blob:
   340		tpm2_flush_context(chip, key_handle);
   341	
   342	err_buf:
   343		tpm_buf_destroy(&buf);
   344	
   345	err_auth:
   346		if (ret < 0)
   347			tpm2_end_auth_session(chip);
   348	
   349	err_ops:
   350		tpm_put_ops(chip);
   351		return ret;
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
