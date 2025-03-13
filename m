Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02361F0E5B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Mar 2025 19:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741893308; cv=none; b=GxwAqMglhg0qgx7ShNWG8MERuA7cMK4VLyKYJoseU33gWVJfjxxvmLZ7A6WBLg6dQqMFpepfyLT9fQ2XAxhHFsvrzj4YEG4zYRa4fFqpwv4t50nTb+TnOrzDNCowHihlxBTFoE9IjkMsSH7MeEkMwKhySQe+LaJ2y8Y89NFJWFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741893308; c=relaxed/simple;
	bh=KhFLWhpIvTdxLxeZCNSnTNZvfVRAFWub/04LVghUVO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geqXAf/JmllFu/btH6sMVXIr3VNZ78xS+MZe/M0lBosoNxSF1Hgc6EfW/W/0IWidQBa7cboIO8E+I6Im6ndo2BNLQJpaSWPf6KegfE+Xf1apxa0xA1kAyRz+WfZlWm4H7aGZTz6L92NpNOIvrOaR6dWbRZKlGaemEaYa80Y1P2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUCNdi61; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUCNdi61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741893307; x=1773429307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KhFLWhpIvTdxLxeZCNSnTNZvfVRAFWub/04LVghUVO8=;
  b=iUCNdi61jBZi8kHf2ofyWB53ibaaEL3yHaInPWGcjzcx5bwNB7tgX0uF
   htR75FnzXFWMMKwi8cjVZNLIWIa+86HbLEFNOkQFCq3YhLjhPFbV+TSVB
   cVoTtsSKA+CWTdsGXCI/mClibIWcx9+YxFu3tVk5FVRDlj+8/ufPA6GK+
   J64Rbb97TT1u8JHvWmks/k0t7rqJCaKx7Bw9g2/xWVw5rSzxQA/Ql5Syi
   lm5G7kafyqw6vv5SZA1mHerJIzgEeocyetMnpNAM9xyQocJ2hbesh/JtO
   ia/TYCJJ26jXx5VIhzBHasKszKGI/fqs7dTjA2woMN89wdap4HfKGUx3S
   A==;
X-CSE-ConnectionGUID: 3D3KeO/oTEG97LJQDwcD/A==
X-CSE-MsgGUID: +IUmyre6T4aFpaU6X9Csrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="30622140"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="30622140"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 12:15:06 -0700
X-CSE-ConnectionGUID: n7ZiRqeKTY+Qm0HuD0JhYQ==
X-CSE-MsgGUID: uOcypELWT3udA83IHUPj1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="121983449"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 13 Mar 2025 12:15:05 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tso1G-0009mW-1n;
	Thu, 13 Mar 2025 19:15:02 +0000
Date: Fri, 14 Mar 2025 03:14:27 +0800
From: kernel test robot <lkp@intel.com>
To: Stuart Yoder <stuart.yoder@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 1/5] tpm_crb: implement driver compliant to CRB over
 FF-A
Message-ID: <202503140300.gRq95lsm-lkp@intel.com>
References: <20250305173611.74548-2-stuart.yoder@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305173611.74548-2-stuart.yoder@arm.com>

Hi Stuart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.14-rc6 next-20250313]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stuart-Yoder/tpm_crb-implement-driver-compliant-to-CRB-over-FF-A/20250306-013848
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250305173611.74548-2-stuart.yoder%40arm.com
patch subject: [PATCH v6 1/5] tpm_crb: implement driver compliant to CRB over FF-A
config: arm64-randconfig-r071-20250312 (https://download.01.org/0day-ci/archive/20250314/202503140300.gRq95lsm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503140300.gRq95lsm-lkp@intel.com/

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
