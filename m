Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D10B3C01
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 01:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758763064; cv=none; b=ei0sOxmGeEfLkf8ljqTcKBRM9TPEq6s4HhEoEd8GVdC71fll5xoesbbnbvCC0/qz9sJohTHNyKMGjLcXRKOFjimq7pw+31O1gTgE9xDr7cN1JzQEoUVypWgJwrl+Bu2DzqjVA4ecK7E5zwcrlJtm+tHARI7Xjo/AJX8pGWRgvZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758763064; c=relaxed/simple;
	bh=GzG7zW+FyCM1PxinVj9mnxfA55wPiWh5Ew6HhkK5Hl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EuFt6VAl8X8ejW5MBavmw51S/kH2dQcK6+4EIdngOwwt4vIIWVTWidCU6lKBNJWvDV/wIZMrw+OqRMQZgOsNkZj2tfx7nnE9yu4eQMspRGD7io+OAn99UY5CDWPfKF19Zq3GNkfnY3Y5muWQjIcB9tdg5zGronMWiEINFOK7yOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mi/S+VYn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mi/S+VYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758763062; x=1790299062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GzG7zW+FyCM1PxinVj9mnxfA55wPiWh5Ew6HhkK5Hl8=;
  b=Mi/S+VYnz53QNtmzw/sR0e88an+THfTIZJPuZ0yu1t+zW5bkYEiyvL1l
   bb2/2IgnhTOCYfU0y4jTNdcDlHHDo840OsL1xiirEhRYcGl+eXTadYcGb
   bYiMu9OxA3gCXddz3zUnqqGUQqxfZ3UrWWOC008kfzyxUroIS9h7k9NL2
   jTOJD29z4nIK8pGwC7IsVKZdY7aCvqJTqlVGqK/vv0hjteA69HY4dANNg
   xFUjrM4pOI8PPAgMv/nDy4GPpOmAWFF3odyG6XgwWiPp3c+L9aMyhcZYe
   hVblRrggkXme1GwE7T55UtbSJ8Kx3IkhYd8USrKHLXupjM06wcQVF+jZP
   Q==;
X-CSE-ConnectionGUID: P0jnF3NsTRWYlBmEd/pRPA==
X-CSE-MsgGUID: /s2tTX6QSWSG9eB09267Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="78710276"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="78710276"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:17:41 -0700
X-CSE-ConnectionGUID: PO6F4WcGQGi0eSE14T1vEA==
X-CSE-MsgGUID: qPNPytXnSL++MrzpqjbiNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="200879457"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 Sep 2025 18:17:40 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1ac6-0004mn-1X;
	Thu, 25 Sep 2025 01:17:38 +0000
Date: Thu, 25 Sep 2025 09:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm-buf 12/14] drivers/char/tpm/tpm2-cmd.c:537:8:
 error: use of undeclared label 'out'
Message-ID: <202509250942.vEu7AqJH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm-buf
head:   c3511ecb0337eea74a90bd8ccf79c05ad2ae1a6c
commit: 75feecae0dd5e88f925008b6bdfc777366e18a76 [12/14] tpm: Make TPM buffer allocations more robust
config: i386-buildonly-randconfig-001-20250925 (https://download.01.org/0day-ci/archive/20250925/202509250942.vEu7AqJH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250942.vEu7AqJH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509250942.vEu7AqJH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm2-cmd.c:14:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm2-cmd.c:537:8: error: use of undeclared label 'out'
     537 |                 goto out;
         |                      ^
   1 warning and 1 error generated.


vim +/out +537 drivers/char/tpm/tpm2-cmd.c

1db15344f874f6 Nayna Jain      2017-01-30  502  
fa4f99c05320eb Nayna Jain      2019-07-11  503  ssize_t tpm2_get_pcr_allocation(struct tpm_chip *chip)
1db15344f874f6 Nayna Jain      2017-01-30  504  {
1db15344f874f6 Nayna Jain      2017-01-30  505  	struct tpm2_pcr_selection pcr_selection;
1db15344f874f6 Nayna Jain      2017-01-30  506  	void *marker;
1db15344f874f6 Nayna Jain      2017-01-30  507  	void *end;
1db15344f874f6 Nayna Jain      2017-01-30  508  	void *pcr_select_offset;
1db15344f874f6 Nayna Jain      2017-01-30  509  	u32 sizeof_pcr_selection;
bcfff8384f6c4e Roberto Sassu   2019-02-06  510  	u32 nr_possible_banks;
bcfff8384f6c4e Roberto Sassu   2019-02-06  511  	u32 nr_alloc_banks = 0;
bcfff8384f6c4e Roberto Sassu   2019-02-06  512  	u16 hash_alg;
1db15344f874f6 Nayna Jain      2017-01-30  513  	u32 rsp_len;
1db15344f874f6 Nayna Jain      2017-01-30  514  	int rc;
1db15344f874f6 Nayna Jain      2017-01-30  515  	int i = 0;
1db15344f874f6 Nayna Jain      2017-01-30  516  
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  517  	struct tpm_buf *buf __free(kfree) = kzalloc(PAGE_SIZE, GFP_KERNEL);
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  518  	if (!buf)
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  519  		return -ENOMEM;
1db15344f874f6 Nayna Jain      2017-01-30  520  
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  521  	tpm_buf_init(buf, TPM_BUF_MAX_SIZE);
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  522  	tpm_buf_reset(buf, TPM2_ST_NO_SESSIONS, TPM2_CC_GET_CAPABILITY);
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  523  	tpm_buf_append_u32(buf, TPM2_CAP_PCRS);
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  524  	tpm_buf_append_u32(buf, 0);
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  525  	tpm_buf_append_u32(buf, 1);
1db15344f874f6 Nayna Jain      2017-01-30  526  
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  527  	rc = tpm_transmit_cmd(chip, buf, 9, "get tpm pcr allocation");
1db15344f874f6 Nayna Jain      2017-01-30  528  	if (rc)
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  529  		return rc;
1db15344f874f6 Nayna Jain      2017-01-30  530  
bcfff8384f6c4e Roberto Sassu   2019-02-06  531  	nr_possible_banks = be32_to_cpup(
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  532  		(__be32 *)&buf->data[TPM_HEADER_SIZE + 5]);
ee156ef3755f4a Jarkko Sakkinen 2025-09-23  533  	if (nr_possible_banks > TPM2_MAX_BANKS) {
ee156ef3755f4a Jarkko Sakkinen 2025-09-23  534  		pr_err("tpm:: unexpected large number of banks: %u > %u",
ee156ef3755f4a Jarkko Sakkinen 2025-09-23  535  		       nr_possible_banks, TPM2_MAX_BANKS);
bcfff8384f6c4e Roberto Sassu   2019-02-06  536  		rc = -ENOMEM;
1db15344f874f6 Nayna Jain      2017-01-30 @537  		goto out;
1db15344f874f6 Nayna Jain      2017-01-30  538  	}
1db15344f874f6 Nayna Jain      2017-01-30  539  
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  540  	marker = &buf->data[TPM_HEADER_SIZE + 9];
1db15344f874f6 Nayna Jain      2017-01-30  541  
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  542  	rsp_len = be32_to_cpup((__be32 *)&buf->data[2]);
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  543  	end = &buf->data[rsp_len];
1db15344f874f6 Nayna Jain      2017-01-30  544  
bcfff8384f6c4e Roberto Sassu   2019-02-06  545  	for (i = 0; i < nr_possible_banks; i++) {
1db15344f874f6 Nayna Jain      2017-01-30  546  		pcr_select_offset = marker +
1db15344f874f6 Nayna Jain      2017-01-30  547  			offsetof(struct tpm2_pcr_selection, size_of_select);
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  548  		if (pcr_select_offset >= end)
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  549  			return -EFAULT;
1db15344f874f6 Nayna Jain      2017-01-30  550  
1db15344f874f6 Nayna Jain      2017-01-30  551  		memcpy(&pcr_selection, marker, sizeof(pcr_selection));
bcfff8384f6c4e Roberto Sassu   2019-02-06  552  		hash_alg = be16_to_cpu(pcr_selection.hash_alg);
bcfff8384f6c4e Roberto Sassu   2019-02-06  553  
bcfff8384f6c4e Roberto Sassu   2019-02-06  554  		pcr_select_offset = memchr_inv(pcr_selection.pcr_select, 0,
bcfff8384f6c4e Roberto Sassu   2019-02-06  555  					       pcr_selection.size_of_select);
bcfff8384f6c4e Roberto Sassu   2019-02-06  556  		if (pcr_select_offset) {
879b589210a9a0 Roberto Sassu   2019-02-06  557  			chip->allocated_banks[nr_alloc_banks].alg_id = hash_alg;
879b589210a9a0 Roberto Sassu   2019-02-06  558  
879b589210a9a0 Roberto Sassu   2019-02-06  559  			rc = tpm2_init_bank_info(chip, nr_alloc_banks);
879b589210a9a0 Roberto Sassu   2019-02-06  560  			if (rc < 0)
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  561  				return rc;
879b589210a9a0 Roberto Sassu   2019-02-06  562  
bcfff8384f6c4e Roberto Sassu   2019-02-06  563  			nr_alloc_banks++;
bcfff8384f6c4e Roberto Sassu   2019-02-06  564  		}
bcfff8384f6c4e Roberto Sassu   2019-02-06  565  
1db15344f874f6 Nayna Jain      2017-01-30  566  		sizeof_pcr_selection = sizeof(pcr_selection.hash_alg) +
1db15344f874f6 Nayna Jain      2017-01-30  567  			sizeof(pcr_selection.size_of_select) +
1db15344f874f6 Nayna Jain      2017-01-30  568  			pcr_selection.size_of_select;
1db15344f874f6 Nayna Jain      2017-01-30  569  		marker = marker + sizeof_pcr_selection;
1db15344f874f6 Nayna Jain      2017-01-30  570  	}
1db15344f874f6 Nayna Jain      2017-01-30  571  
bcfff8384f6c4e Roberto Sassu   2019-02-06  572  	chip->nr_allocated_banks = nr_alloc_banks;
75feecae0dd5e8 Jarkko Sakkinen 2025-09-19  573  	return 0;
1db15344f874f6 Nayna Jain      2017-01-30  574  }
61841be6358c03 Jarkko Sakkinen 2017-02-15  575  

:::::: The code at line 537 was first introduced by commit
:::::: 1db15344f874f656b267a79467d1e7ee6442ba09 tpm: implement TPM 2.0 capability to get active PCR banks

:::::: TO: Nayna Jain <nayna@linux.vnet.ibm.com>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
