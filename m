Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8D65473A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 May 2024 17:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716744539; cv=none; b=I4ZHhn0aBU4AUMtu0Z8Y4fZ5Wwa+5b6GQ2KvTC9gnXEMFbGq1tEUiMi5VHqsKvCQLL1DZFw5wU/ARztvg6HHtuQLe3G3MS04XJgmss8esjcPmhbEDnccbN5tm8UbVrp+y03k1qTVyxZMgwuQVoBwGczZCebZnHTW8/GT69Huqgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716744539; c=relaxed/simple;
	bh=nMo+u3lbPvQY9KBtdcsxLIpY6IyBrie2AHPtZ7LNNzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QenM+UFNqR4XseO7vd1tKr8D3oKk5PYq3Q0G2giXOJpBftL1pTPScKNPqR3MnHlJZYo1qzy4KCJUkXgE5oXAjBED9xnPYx7Z3d/doM4KyOL1SptrshCw0eS/QZCr0o+NRdD8Qch7zjUcXFBzjkLK6JOQbXDaZGQp7ikbSHtRqpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=deYIsIVF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="deYIsIVF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716744537; x=1748280537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nMo+u3lbPvQY9KBtdcsxLIpY6IyBrie2AHPtZ7LNNzM=;
  b=deYIsIVFKU20X3JHIbIdtHVvhTfNtXJbYMzZ8wWv/DtNRdfy5MWkJdGc
   jU02uZa8Y6ZbbN2ng3PQQInKC55DdLw5uKMV4yWrdMWl2w92I7anbTSqW
   1Tz+yYNP+qNaPqCAjWl2dmcvoYpE4GcjcgP4DXEA/xEZOj7DLw+PBFwkZ
   U8fgJWQ6X68jln2DEiKGc3g/v2P6Gr6BNkwTYHaB3R3/+PZnRb4JZZQ8+
   7YhpqffCdgStHG1/1Fri6f7RftWNzkNr6/ACo5yLjhNyHwBjU+P955yfF
   P8UZY/gWmQV+HJdQiO53vMpr3HQ7gCLftrr+0k4t4oVxDIhGTDnHeqr0w
   g==;
X-CSE-ConnectionGUID: Gg3IdKnVQceeFf7sPGL79A==
X-CSE-MsgGUID: CUjPQdseSZa0OcUwtcouSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="11704418"
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="11704418"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 10:28:57 -0700
X-CSE-ConnectionGUID: zjvGXbPnQ+eHuv9rByQdZA==
X-CSE-MsgGUID: XmPk7NWCS3u1e39M+DTSQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="34422692"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 May 2024 10:28:55 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBHfw-0008Id-39;
	Sun, 26 May 2024 17:28:52 +0000
Date: Mon, 27 May 2024 01:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, James Prestwood <prestwoj@gmail.com>
Subject: [jarkko-tpmdd:tpm2key-v6 6/7]
 crypto/asymmetric_keys/tpm2_key_rsa.c:261:49: error: 'TPM2_SE_ENCRYPT'
 undeclared; did you mean 'TPM2_SA_ENCRYPT'?
Message-ID: <202405270108.Ef7r32kb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   9f00b229e51e66882c00afff224982331af3aa8d
commit: b05f03fe4618446e2c2746a2124eae7717744c7a [6/7] keys: asymmetric: tpm2_key_rsa
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240527/202405270108.Ef7r32kb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240527/202405270108.Ef7r32kb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405270108.Ef7r32kb-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/asymmetric_keys/tpm2_key_rsa.c: In function '__tpm2_key_rsa_decrypt':
>> crypto/asymmetric_keys/tpm2_key_rsa.c:261:49: error: 'TPM2_SE_ENCRYPT' undeclared (first use in this function); did you mean 'TPM2_SA_ENCRYPT'?
     261 |         tpm_buf_append_hmac_session(chip, &buf, TPM2_SE_ENCRYPT, NULL, 0);
         |                                                 ^~~~~~~~~~~~~~~
         |                                                 TPM2_SA_ENCRYPT
   crypto/asymmetric_keys/tpm2_key_rsa.c:261:49: note: each undeclared identifier is reported only once for each function it appears in


vim +261 crypto/asymmetric_keys/tpm2_key_rsa.c

   236	
   237	static int __tpm2_key_rsa_decrypt(struct tpm_chip *chip,
   238					  struct tpm2_key *key,
   239					  struct kernel_pkey_params *params,
   240					  const void *in, int in_len, void *out)
   241	{
   242		u32 key_handle = 0;
   243		struct tpm_buf buf;
   244		u16 decrypted_len;
   245		u8 *pos;
   246		int ret;
   247	
   248		ret = tpm_try_get_ops(chip);
   249		if (ret)
   250			return ret;
   251	
   252		ret = tpm2_start_auth_session(chip);
   253		if (ret)
   254			goto err_ops;
   255	
   256		ret = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_LOAD);
   257		if (ret < 0)
   258			goto err_auth;
   259	
   260		tpm_buf_append_name(chip, &buf, key->parent, NULL);
 > 261		tpm_buf_append_hmac_session(chip, &buf, TPM2_SE_ENCRYPT, NULL, 0);
   262		tpm_buf_append(&buf, &key->data[0], key->priv_len + key->pub_len);
   263		if (buf.flags & TPM_BUF_OVERFLOW) {
   264			ret = -E2BIG;
   265			goto err_buf;
   266		}
   267		tpm_buf_fill_hmac_session(chip, &buf);
   268		ret = tpm_transmit_cmd(chip, &buf, 4, "TPM2_CC_LOAD");
   269		ret = tpm_buf_check_hmac_response(chip, &buf, ret);
   270		if (ret) {
   271			ret = -EIO;
   272			goto err_buf;
   273		}
   274		key_handle = be32_to_cpup((__be32 *)&buf.data[TPM_HEADER_SIZE]);
   275	
   276		pr_info("loaded\n");
   277	
   278		tpm_buf_reset(&buf, TPM2_ST_SESSIONS, TPM2_CC_RSA_DECRYPT);
   279		tpm_buf_append_name(chip, &buf, key_handle, NULL);
   280		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_ENCRYPT, NULL, 0);
   281		tpm_buf_append_u16(&buf, in_len);
   282		tpm_buf_append(&buf, in, in_len);
   283		tpm_buf_append_u16(&buf, TPM_ALG_NULL);
   284		tpm_buf_append_u16(&buf, 0);
   285		tpm_buf_fill_hmac_session(chip, &buf);
   286		ret = tpm_transmit_cmd(chip, &buf, 4, "TPM2_RSA_DECRYPT");
   287		ret = tpm_buf_check_hmac_response(chip, &buf, ret);
   288		if (ret) {
   289			ret = -EIO;
   290			goto err_blob;
   291		}
   292	
   293		pos = buf.data + TPM_HEADER_SIZE + 4;
   294		decrypted_len = be16_to_cpup((__be16 *)pos);
   295		pos += 2;
   296	
   297		if (params->out_len < decrypted_len) {
   298			ret = -EMSGSIZE;
   299			goto err_blob;
   300		}
   301	
   302		memcpy(out, pos, decrypted_len);
   303		ret = decrypted_len;
   304	
   305	err_blob:
   306		tpm2_flush_context(chip, key_handle);
   307	
   308	err_buf:
   309		tpm_buf_destroy(&buf);
   310	
   311	err_auth:
   312		if (ret < 0)
   313			tpm2_end_auth_session(chip);
   314	
   315	err_ops:
   316		tpm_put_ops(chip);
   317		return ret;
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
