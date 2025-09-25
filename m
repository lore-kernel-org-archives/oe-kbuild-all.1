Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D6A15624D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 02:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768227; cv=none; b=B5bbKKeQqwdHpAbfkSKF41HF5iyX//c7vaBRPxw45uQ74P94OdOWnn0Duc9Tqg6x2ihz+r526Gmc5BVqRdAANNSdYGEY6DEkn5EgN6XEHe+sz3L+OzqwUFJoTxLp3FNXq5V6AKOcDIIUxckKMr6H4SYLqfauttTtsFrD3uRQDd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768227; c=relaxed/simple;
	bh=6uYlAdacsH23owWDQAdmS0o58sPsVThFkQciO0ndKv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASx++EsiwSlvYDsfvt9R4GFZ3rHGFNR3R9ru2LePCywZnJuizhRsUIZRVv2VDKz8pGPlkhp98256P+AB8hDsT1aJdE/4IJdfTeOFLjWdK8gFvrbk5f775vXaxGA3dr1+876Uo2brE7C0O43LCA15t3KMBC69RwC/uwzYRxpnajo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGLCOllq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGLCOllq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758768226; x=1790304226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uYlAdacsH23owWDQAdmS0o58sPsVThFkQciO0ndKv8=;
  b=YGLCOllqqF9S7bnpfEr/pVFAxSMragO1Rc0T4fSiHGNKpdkiLb672N61
   YainJngd2w3tteN/G9mRh6Wk4Y/uAKN7Ttf6P3SFY9CxIgBSsjuiHw93C
   25epgd6GFukXqREoje/9vgUauEOP9Rt0WEFC1zyZ/pYBwpvYIlZ8QJiRP
   dJLGE3vfjTnVIKaXZdPJUTr/4wDLeixP57VUyNs6n2lhV7eZvCmPfP/5G
   oSNcXu8TSwVLxv4B5qWewkQBFt0QkDlris5qbi4iqteXqGa06ar5YdNnM
   ziWAVNr4bpoiy8oUWjCA4yqnhed1Tf+i+mJ9Xthk3bX5G4XrCLFF3uN1y
   w==;
X-CSE-ConnectionGUID: U6aabqEVSWizV0l8RnR1aQ==
X-CSE-MsgGUID: R6vI7X8ETHuQ9dC18TW6Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60114387"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="60114387"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 19:43:45 -0700
X-CSE-ConnectionGUID: mzH8sRrYRViVc4Sqdm1rzw==
X-CSE-MsgGUID: A9SgIT/OQkyAFUJXqYLIGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="177037285"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Sep 2025 19:43:43 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1bxM-0004rR-2z;
	Thu, 25 Sep 2025 02:43:40 +0000
Date: Thu, 25 Sep 2025 10:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm-buf 14/14] drivers/char/tpm/tpm-interface.c:492:6:
 warning: variable 'num_bytes' set but not used
Message-ID: <202509251010.F9UgGAfw-lkp@intel.com>
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
commit: c3511ecb0337eea74a90bd8ccf79c05ad2ae1a6c [14/14] tpm: re-erchestrate tpm_get_random()
config: i386-buildonly-randconfig-001-20250925 (https://download.01.org/0day-ci/archive/20250925/202509251010.F9UgGAfw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251010.F9UgGAfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509251010.F9UgGAfw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm-interface.c:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm-interface.c:492:6: warning: variable 'num_bytes' set but not used [-Wunused-but-set-variable]
     492 |         u32 num_bytes = max;
         |             ^
>> drivers/char/tpm/tpm-interface.c:493:6: warning: variable 'dest_ptr' set but not used [-Wunused-but-set-variable]
     493 |         u8 *dest_ptr = out;
         |             ^
   3 warnings generated.


vim +/num_bytes +492 drivers/char/tpm/tpm-interface.c

   479	
   480	/**
   481	 * tpm_get_random() - get random bytes from the TPM's RNG
   482	 * @chip:	a &struct tpm_chip instance, %NULL for the default chip
   483	 * @out:	destination buffer for the random bytes
   484	 * @max:	the max number of bytes to write to @out
   485	 *
   486	 * Return: number of random bytes read or a negative error value.
   487	 */
   488	int tpm_get_random(struct tpm_chip *chip, u8 *out, size_t max)
   489	{
   490		u8 buf_data[TPM_BUF_MIN_SIZE];
   491		struct tpm_buf *buf = (struct tpm_buf *)buf_data;
 > 492		u32 num_bytes = max;
 > 493		u8 *dest_ptr = out;
   494		int retries = 5;
   495		int total = 0;
   496		int rc;
   497	
   498		if (!out || max > TPM_MAX_RNG_DATA)
   499			return -EINVAL;
   500	
   501		tpm_buf_init(buf, TPM_BUF_MIN_SIZE);
   502	
   503		chip = tpm_find_get_ops(chip);
   504		if (!chip)
   505			return -ENODEV;
   506	
   507		rc = tpm2_start_auth_session(chip);
   508		if (rc)
   509			return rc;
   510	
   511		do {
   512			if (chip->flags & TPM_CHIP_FLAG_TPM2)
   513				rc = tpm2_get_random(chip, buf, out, max);
   514			else
   515				rc = tpm1_get_random(chip, buf, out, max);
   516	
   517			if (rc < 0)
   518				break;
   519	
   520			dest_ptr += rc;
   521			total += rc;
   522			num_bytes -= rc;
   523		} while (retries-- && total < max);
   524	
   525		tpm2_end_auth_session(chip);
   526		tpm_put_ops(chip);
   527		return total ? total : -EIO;
   528	}
   529	EXPORT_SYMBOL_GPL(tpm_get_random);
   530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
