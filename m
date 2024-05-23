Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA36412AAF0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 08:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716451207; cv=none; b=XjOezfj7ZkAcDzvWxQ0kjNJUnH1OwHiLo1zy/uZrQ60vnlyI4ZYpJaZC0/m02Y/YuEu6FFw+TcaUadHtGIMiNRJOIQ/881F6iaeXTEkXm4HgQfcms3fpYXyyVIMrirvDYvxmX/lEdNJ0cuP78KbdJ9eqXtckaCGEoV/04gj8vnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716451207; c=relaxed/simple;
	bh=qGZMzdVI4j7TnwcHA2l53kkBoQCtzdt0JkQYFGFoF4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F7NTfokXuavC8jg2u41vNLf5Gkxr0xv85l6ju4T2O3sPNv7LBLHXyHlhkc4pEEUXw/8b5wPZttRK/X80XmKEyOHTsTxYoqXDG0NcEAnGwv14A+CxOhzNyvZ35CpOKXFbhePmAjaXOgrQ3IMaiQeV8elxsmjGDWgKMexBaQ2VjfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/3Qn/mL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/3Qn/mL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716451205; x=1747987205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qGZMzdVI4j7TnwcHA2l53kkBoQCtzdt0JkQYFGFoF4E=;
  b=c/3Qn/mLqlabEfcj65ETDUYkSgrfpIYZYuY3iPfGtRnrbT6J/tfaM1Kj
   L911So7wOrGLETnUpB7/tPKbV86l3v2ct+mSU2adLM+i9jB46GQWEsj3y
   lELGGyvSnxMX4dGPN1OUhSNoiJt9fu61icnNzKsE+iCOcKZ140/GO8dkr
   QU8KEtvDxU/3uiZJQLOpsvpNX7ooG939FcDDnTsdwEfO/O/HOj1YHXUYy
   iPKOWlXjUqCzDMR+YZTAPTDezap8LRw12YVcB9jz/PflWDqY86SV4SPnE
   1rySp32l+jDGnOxXrVvUuYkB5n/uPdMTNlKPMD0gfpWRce+mR+gIiCaQA
   Q==;
X-CSE-ConnectionGUID: MSq3VKTJT22L5baGTX5mQA==
X-CSE-MsgGUID: 5HxzG64dQoyf6U4L1mJfNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="16589473"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="16589473"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 01:00:05 -0700
X-CSE-ConnectionGUID: K1at0U1NQFyA3WmVjfB9Bw==
X-CSE-MsgGUID: WuyLR+wkT5KqpKS7gPE2vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="34187368"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 May 2024 01:00:04 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA3Jo-0002bH-1V;
	Thu, 23 May 2024 07:57:01 +0000
Date: Thu, 23 May 2024 15:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: James Prestwood <prestwoj@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:tpm2key-v3 7/7]
 crypto/asymmetric_keys/tpm2_key_rsa.c:360:1: warning: label 'err_auth'
 defined but not used
Message-ID: <202405231542.NYBUAOf9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v3
head:   9e82832aa16a3b33db19220c360342be336b77d2
commit: 9e82832aa16a3b33db19220c360342be336b77d2 [7/7] keys: asymmetric: ASYMMETRIC_TPM2_KEY_RSA_SUBTYPE
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240523/202405231542.NYBUAOf9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231542.NYBUAOf9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231542.NYBUAOf9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/asymmetric_keys/tpm2_key_rsa.c: In function '__tpm2_key_rsa_decrypt':
>> crypto/asymmetric_keys/tpm2_key_rsa.c:360:1: warning: label 'err_auth' defined but not used [-Wunused-label]
     360 | err_auth:
         | ^~~~~~~~
   crypto/asymmetric_keys/tpm2_key_rsa.c:284:22: warning: unused variable 'offset' [-Wunused-variable]
     284 |         unsigned int offset = 0;
         |                      ^~~~~~


vim +/err_auth +360 crypto/asymmetric_keys/tpm2_key_rsa.c

   278	
   279	static int __tpm2_key_rsa_decrypt(struct tpm_chip *chip,
   280					  struct tpm2_key_rsa *key,
   281					  struct kernel_pkey_params *params,
   282					  const void *in, int in_len, void *out)
   283	{
   284		unsigned int offset = 0;
   285		u32 key_handle = 0;
   286		struct tpm_buf buf;
   287		u16 decrypted_len;
   288		u32 parent;
   289		u8 *pos;
   290		int ret;
   291	
   292		ret = tpm_try_get_ops(chip);
   293		if (ret)
   294			return ret;
   295	
   296		ret = tpm2_start_auth_session(chip);
   297		if (ret)
   298			goto err_ops;
   299	
   300		parent = key->key.parent;
   301	
   302		ret = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_LOAD);
   303		if (ret < 0)
   304			goto err_parent;
   305	
   306		tpm_buf_append_name(chip, &buf, parent, NULL);
   307		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_CONTINUE_SESSION |
   308					    TPM2_SA_ENCRYPT, NULL, 0);
   309		tpm_buf_append(&buf, key->key.blob, key->key.blob_len);
   310		if (buf.flags & TPM_BUF_OVERFLOW) {
   311			ret = -E2BIG;
   312			goto err_buf;
   313		}
   314		tpm_buf_fill_hmac_session(chip, &buf);
   315		ret = tpm_transmit_cmd(chip, &buf, 4, "RSA key loading");
   316		ret = tpm_buf_check_hmac_response(chip, &buf, ret);
   317		if (ret) {
   318			ret = -EIO;
   319			goto err_buf;
   320		}
   321		key_handle = be32_to_cpup((__be32 *)&buf.data[TPM_HEADER_SIZE]);
   322	
   323		tpm_buf_reset(&buf, TPM2_ST_SESSIONS, TPM2_CC_RSA_DECRYPT);
   324		tpm_buf_append_name(chip, &buf, key_handle, NULL);
   325		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_DECRYPT, NULL, 0);
   326		tpm_buf_append_u16(&buf, in_len);
   327		tpm_buf_append(&buf, in, in_len);
   328		tpm_buf_append_u16(&buf, TPM_ALG_NULL);
   329		tpm_buf_append_u16(&buf, 0);
   330		tpm_buf_fill_hmac_session(chip, &buf);
   331		ret = tpm_transmit_cmd(chip, &buf, 4, "RSA key decrypting");
   332		ret = tpm_buf_check_hmac_response(chip, &buf, ret);
   333		if (ret) {
   334			ret = -EIO;
   335			goto err_blob;
   336		}
   337	
   338		pos = buf.data + TPM_HEADER_SIZE + 4;
   339		decrypted_len = be16_to_cpup((__be16 *)pos);
   340		pos += 2;
   341	
   342		if (params->out_len < decrypted_len) {
   343			ret = -EMSGSIZE;
   344			goto err_blob;
   345		}
   346	
   347		memcpy(out, pos, decrypted_len);
   348		ret = decrypted_len;
   349	
   350	err_blob:
   351		tpm2_flush_context(chip, key_handle);
   352	
   353	err_buf:
   354		tpm_buf_destroy(&buf);
   355	
   356	err_parent:
   357		if (key->key.parent == TPM2_RH_NULL)
   358			tpm2_flush_context(chip, parent);
   359	
 > 360	err_auth:
   361		if (ret < 0)
   362			tpm2_end_auth_session(chip);
   363	
   364	err_ops:
   365		tpm_put_ops(chip);
   366		return ret;
   367	}
   368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
