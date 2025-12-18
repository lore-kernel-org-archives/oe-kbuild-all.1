Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C8C2BEFFD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766076922; cv=none; b=n9+zQrD46zEepYce5uBLDmr47qmyPbiHU1ngyqiPuqnaHURrjp8CdR9YhO99cUGt18c2YOROCF8E8i0om/iCavH7V7FUEuLRgIKBL3Np7n6VkrNZYJgJ3nIiV2QyncaEeyRgmr8OsWiUC+C/Obe5iMXW9drQ+rKtGuD5ayzeOBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766076922; c=relaxed/simple;
	bh=6vrrYhmX3QRxXT61KAPr7XC+gy3Pz43ARwJkAEU9jOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jvau32pd8MCcY+DE6PyrWkB7/4rqDVl0xjLYmiQTZdYu2ef7ZmUNiHY8lmG6h+EbFq0qPJMLQvUNLjPEpTduBP4nH/IyXO0p6BlZik4g0OTgoiXdek0fTuIawO1ib58sM2NLykiWkVoQHYu049M2zhhc55z1Z3emPGK1AH7j//M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bxpr1Zfe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bxpr1Zfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766076920; x=1797612920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6vrrYhmX3QRxXT61KAPr7XC+gy3Pz43ARwJkAEU9jOw=;
  b=Bxpr1ZferJVNUhn+lfz2pJ//HTfvlhYNHsMJOlXf6PPIy5kC6ojbJ3S4
   HJLnZfYWIUnkGFl8eFqiAyyWa9If7ItXaMFHzl16S3HNJPU3/t9pXOIfW
   ztbjasA/Y/8oOiAmsDD65lwE70AmoyVLF43Ep7Mp/aLbqHYGSJot01Dko
   FP5bME741jk2jIlyneFljUZcSd1p6LY/o/Q3uaDU+u9eZgxjxWjtBojn+
   tx0ccPoXnnwjYZljBMGdp/GYSBOOTvjKbqrH+khW4Gjkp+nTQ8cVOjlPh
   g0iTSi+zYp5gS9M8xuD0Oso0KP4/Csdh0lNruJMlmtz/+8qZF2XuGWnLm
   w==;
X-CSE-ConnectionGUID: /XmcLJ7vTuKsFzH9V6iGxg==
X-CSE-MsgGUID: HvpNGJxRS+e/RSnvM3euKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71886589"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="71886589"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 08:55:18 -0800
X-CSE-ConnectionGUID: H5yvOvAzTYuZ3/x/MBeV4A==
X-CSE-MsgGUID: f6zxwBBCTRC9HVbp+XK95Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="222051530"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 08:55:16 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWHHW-000000002LD-1kD5;
	Thu, 18 Dec 2025 16:55:14 +0000
Date: Fri, 19 Dec 2025 00:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: Stuart Yoder <stuart.yoder@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: drivers/char/tpm/tpm_crb_ffa.c:311 tpm_crb_ffa_probe() warn:
 unsigned 'tpm_crb_ffa->minor_version' is never less than zero.
Message-ID: <202512190044.RICLFTSA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: eb93f0734ef1bc5657313bfb55cda58763363603 tpm_crb: ffa_tpm: Implement driver compliant to CRB over FF-A
date:   9 months ago
config: arm64-randconfig-r072-20251218 (https://download.01.org/0day-ci/archive/20251219/202512190044.RICLFTSA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190044.RICLFTSA-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm_crb_ffa.c:311 tpm_crb_ffa_probe() warn: unsigned 'tpm_crb_ffa->minor_version' is never less than zero.

vim +311 drivers/char/tpm/tpm_crb_ffa.c

   268	
   269	static int tpm_crb_ffa_probe(struct ffa_device *ffa_dev)
   270	{
   271		struct tpm_crb_ffa *p;
   272		int rc;
   273	
   274		/* only one instance of a TPM partition is supported */
   275		if (tpm_crb_ffa && !IS_ERR_VALUE(tpm_crb_ffa))
   276			return -EEXIST;
   277	
   278		tpm_crb_ffa = ERR_PTR(-ENODEV); // set tpm_crb_ffa so we can detect probe failure
   279	
   280		if (!ffa_partition_supports_direct_recv(ffa_dev)) {
   281			pr_err("TPM partition doesn't support direct message receive.\n");
   282			return -EINVAL;
   283		}
   284	
   285		p = kzalloc(sizeof(*tpm_crb_ffa), GFP_KERNEL);
   286		if (!p)
   287			return -ENOMEM;
   288		tpm_crb_ffa = p;
   289	
   290		mutex_init(&tpm_crb_ffa->msg_data_lock);
   291		tpm_crb_ffa->ffa_dev = ffa_dev;
   292		ffa_dev_set_drvdata(ffa_dev, tpm_crb_ffa);
   293	
   294		/* if TPM is aarch32 use 32-bit SMCs */
   295		if (!ffa_partition_check_property(ffa_dev, FFA_PARTITION_AARCH64_EXEC))
   296			ffa_dev->ops->msg_ops->mode_32bit_set(ffa_dev);
   297	
   298		/* verify compatibility of TPM service version number */
   299		rc = tpm_crb_ffa_get_interface_version(&tpm_crb_ffa->major_version,
   300						       &tpm_crb_ffa->minor_version);
   301		if (rc) {
   302			pr_err("failed to get crb interface version. rc:%d", rc);
   303			goto out;
   304		}
   305	
   306		pr_info("ABI version %u.%u", tpm_crb_ffa->major_version,
   307			tpm_crb_ffa->minor_version);
   308	
   309		if (tpm_crb_ffa->major_version != CRB_FFA_VERSION_MAJOR ||
   310		    (tpm_crb_ffa->minor_version > 0 &&
 > 311		    tpm_crb_ffa->minor_version < CRB_FFA_VERSION_MINOR)) {
   312			pr_err("Incompatible ABI version");
   313			goto out;
   314		}
   315	
   316		return 0;
   317	
   318	out:
   319		kfree(tpm_crb_ffa);
   320		tpm_crb_ffa = ERR_PTR(-ENODEV);
   321		return -EINVAL;
   322	}
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
