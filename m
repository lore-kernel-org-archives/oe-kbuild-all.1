Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7287E1EB195
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739983848; cv=none; b=WDD88+wliqTeoNi9aqz4Mm9keYL3Bb5fno+mJq72i+yUMOu1G4NN8rL9Ga2rEWvOJD+xVk4DS/y6mWloltvtgm6KWHALK36GTHUl8a1oR5AEqAKNDcQLB3QmfQSjcOBXoP32yDYSgLe2Bnr7KVRfUpjJP5dOBC1KpDe1I5Lv17s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739983848; c=relaxed/simple;
	bh=lFMuTuNDNsCphKz+op+LOYiUjyzHLocb+WQrq+Uxr/k=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XdBoHw9oiFL9o35t/d1xTddh7m7t9YKb6W89ReBHE6KtANeR5HcioHrL0JkY0Nzd+fZc3r4YQwMOyi1hSrdbuxuMsVD4bZEnzRHKEj/3aUEeJ8rdwDjE165FbCvNIRd19++sRDtORXDynXWtnr+L5fPRsfxiBkQro1nY44bhAQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRpG5KBB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRpG5KBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739983846; x=1771519846;
  h=date:from:cc:subject:message-id:mime-version;
  bh=lFMuTuNDNsCphKz+op+LOYiUjyzHLocb+WQrq+Uxr/k=;
  b=aRpG5KBBvP+kCxF1CrAXfTfyFRK8mZnz6+3miBt5P3PLBifauMLdO++o
   UzD+4Hg6e5o9GDb4c/ROhpfSewc+Ra9G7XS9Igega5bvR7URmDa0nkWx5
   z9Khc5Rs9LX6BnwjcKY8N7jzv/GjWO1nuXvQDkw5yxS+8NtY7oG8Xbc/k
   C6xsoab3UlMqDtk+PzFDTOm+vdY4V34c7r6aQNthmPCfRYUns6JCh0Chl
   PGluk49C0KJRS5PkqwKNn3PaMzA44/97/0WpOtrNVK+s1sIyDepfzBcTC
   JQnGsOQ7eIlqfgx87Ua95SJTdERBEzcPlJwfTgPJwJUb54EVSi+SHoGd9
   Q==;
X-CSE-ConnectionGUID: ZdQhGPo6QEafUx1tnOG3DQ==
X-CSE-MsgGUID: iVMh2IO8SNyoQi9e2qKw5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40991247"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="40991247"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 08:50:43 -0800
X-CSE-ConnectionGUID: f5BcyMleSvWFX0p3oJ22Zg==
X-CSE-MsgGUID: NY/RSkQnQ3SGFbI6l6OHaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="114964090"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 Feb 2025 08:15:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkmit-00039D-0f;
	Wed, 19 Feb 2025 16:14:57 +0000
Date: Thu, 20 Feb 2025 00:13:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Zhou Furong <furong.zhou@intel.com>,
	Tomas Winkler <tomas.winkler@intel.com>,
	Saul Wold <sgw@linux.intel.com>
Subject: [intel-lts:pr/59 1/1] drivers/char/tpm/tpm-interface.c:395:10:
 warning: 'return' with a value, in function returning void
Message-ID: <202502200032.liWOwjxc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 1b1e12ac6171b7858bab670f6de0fa6f9f42db7d [1/1] tpm: separate cmd_ready/go_idle from runtime_pm
config: sh-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250220/202502200032.liWOwjxc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200032.liWOwjxc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200032.liWOwjxc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/tpm/tpm-interface.c: In function 'tpm_relinquish_locality':
>> drivers/char/tpm/tpm-interface.c:395:10: warning: 'return' with a value, in function returning void
      return 0;
             ^
   drivers/char/tpm/tpm-interface.c:390:13: note: declared here
    static void tpm_relinquish_locality(struct tpm_chip *chip, unsigned int flags)
                ^~~~~~~~~~~~~~~~~~~~~~~
   At top level:
   drivers/char/tpm/tpm-interface.c:990:38: warning: 'pcrextend_header' defined but not used [-Wunused-const-variable=]
    static const struct tpm_input_header pcrextend_header = {
                                         ^~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm-interface.c:714:38: warning: 'tpm_getcap_header' defined but not used [-Wunused-const-variable=]
    static const struct tpm_input_header tpm_getcap_header = {
                                         ^~~~~~~~~~~~~~~~~


vim +/return +395 drivers/char/tpm/tpm-interface.c

   389	
   390	static void tpm_relinquish_locality(struct tpm_chip *chip, unsigned int flags)
   391	{
   392		int rc;
   393	
   394		if (flags & __TPM_TRANSMIT_RAW)
 > 395			return 0;
   396	
   397		if (!chip->ops->relinquish_locality)
   398			return;
   399	
   400		rc = chip->ops->relinquish_locality(chip, chip->locality);
   401		if (rc)
   402			dev_err(&chip->dev, "%s: : error %d\n", __func__, rc);
   403	
   404		chip->locality = -1;
   405	}
   406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
