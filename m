Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4626614A84
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714917063; cv=none; b=imWET5GSw+TQvTE4pFWNbYf3zV7Yk/paPjH9hlgxTJ9Ejhwc3hkfLx2nBP4F2E9xL5BoN+koi+YIjgsmy6h+8uilOuHsK5axy5VEUunH4ZioA7owjHpF51M5H5kyRX0V4LOEI3H4WmW9ZC5O2StSZGOqyFLUFsqsWAp/1IrZwWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714917063; c=relaxed/simple;
	bh=pvEvL58Tt2ORsuyF5yQ7N1fB7Ub+S0qmZRaLTxULPMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pLZV+J6aBt6re/weoGv5+cf3GVWroJmg99Lr1C0GtkdWLqucmudw2KD73Xpg+NdpMo3QrqWc+kPs8eD67yqu55wBiZSUJ0tIVzAkmKNFsSzwnmDYSICSP+hbFyJC1paczL0Vq3KVrKVzey4EoU6LBQwkaA9Tm3Z0+1wxlBgICfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3w+kNgZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3w+kNgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714917062; x=1746453062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pvEvL58Tt2ORsuyF5yQ7N1fB7Ub+S0qmZRaLTxULPMk=;
  b=e3w+kNgZO2dsglfgge+j8IMwNYRUq6b8qKRhzoUbxiIbXpMDfcCu+Igi
   bcpJZMhxJWooYCRipsTnOJFf04GewOMxSbe+y14aVfBqfgcWJILzPd5s4
   Gf5GRnMiZWtZ4R+d80aToFj+sWWj17x5jLVsmtkrD6KUFNpFRMiE51dy0
   gvlslEP3BBnRJYJb9j0QemJvuKmhdjdvm1dvYih9DzpwiNBkeEgFI7dqo
   f2LnQPLVrF0kSreFA4/JJoNrZDEnB5IiuzGbl1H85ZfrVbBYi58P3AWeR
   I8U4sapkqFKNLu3g/chksGBUMlii6tz9ryuRaGPFh0bdG294Vpit7r4Bl
   g==;
X-CSE-ConnectionGUID: r5gCLNlyTEqk19AGkWxEJA==
X-CSE-MsgGUID: /RaForSJTBaF+KR6ZhmEgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14452989"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="14452989"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 06:51:01 -0700
X-CSE-ConnectionGUID: wduHGjsCSJWG5NWo8Bfrjg==
X-CSE-MsgGUID: YwWdXv02QF+mccgGlys3Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="28003595"
Received: from lkp-server01.sh.intel.com (HELO 123fad1cf874) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2024 06:50:59 -0700
Received: from kbuild by 123fad1cf874 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3cGX-0000Fs-10;
	Sun, 05 May 2024 13:50:57 +0000
Date: Sun, 5 May 2024 21:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 866/1143]
 drivers/ufs/host/ufs-aspeed.c:202:31: warning: unused variable 'host_cap'
Message-ID: <202405052159.mKdPd7JD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 31c27ef87645acacd6db6c29d2ce897645968869 [866/1143] drivers: ufs: register pre power change for high speed workaround
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240505/202405052159.mKdPd7JD-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405052159.mKdPd7JD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405052159.mKdPd7JD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ufs/host/ufs-aspeed.c: In function 'aspeed_ufshc_pre_pwr_change':
   drivers/ufs/host/ufs-aspeed.c:202:31: error: storage size of 'host_cap' isn't known
     202 |         struct ufs_dev_params host_cap;
         |                               ^~~~~~~~
   drivers/ufs/host/ufs-aspeed.c:205:9: error: implicit declaration of function 'ufshcd_init_pwr_dev_param'; did you mean 'ufshcd_init_host_params'? [-Werror=implicit-function-declaration]
     205 |         ufshcd_init_pwr_dev_param(&host_cap);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         ufshcd_init_host_params
   drivers/ufs/host/ufs-aspeed.c:209:15: error: implicit declaration of function 'ufshcd_get_pwr_dev_param' [-Werror=implicit-function-declaration]
     209 |         ret = ufshcd_get_pwr_dev_param(&host_cap,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ufs/host/ufs-aspeed.c:202:31: warning: unused variable 'host_cap' [-Wunused-variable]
     202 |         struct ufs_dev_params host_cap;
         |                               ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/host_cap +202 drivers/ufs/host/ufs-aspeed.c

   197	
   198	static int aspeed_ufshc_pre_pwr_change(struct ufs_hba *hba,
   199					       struct ufs_pa_layer_attr *dev_max_params,
   200					       struct ufs_pa_layer_attr *dev_req_params)
   201	{
 > 202		struct ufs_dev_params host_cap;
   203		int ret;
   204	
 > 205		ufshcd_init_pwr_dev_param(&host_cap);
   206		host_cap.hs_rx_gear = UFS_HS_G2;
   207		host_cap.hs_tx_gear = UFS_HS_G2;
   208	
   209		ret = ufshcd_get_pwr_dev_param(&host_cap,
   210					       dev_max_params,
   211					       dev_req_params);
   212		if (ret) {
   213			pr_info("%s: failed to determine capabilities\n",
   214				__func__);
   215		}
   216	
   217		ufshcd_dme_peer_set(hba, UIC_ARG_MIB(PA_MAXRXHSGEAR), host_cap.hs_rx_gear);
   218	
   219		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXTERMINATION), true);
   220		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXGEAR), UFS_PWM_G1);
   221	
   222		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_RXTERMINATION), true);
   223		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_RXGEAR), UFS_PWM_G1);
   224	
   225		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_ACTIVETXDATALANES),
   226			       dev_req_params->lane_tx);
   227		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_ACTIVERXDATALANES),
   228			       dev_req_params->lane_rx);
   229		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_HSSERIES),
   230			       dev_req_params->hs_rate);
   231	
   232		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXHSADAPTTYPE),
   233			       PA_NO_ADAPT);
   234	
   235		ret = ufshcd_uic_change_pwr_mode(hba,
   236						 SLOWAUTO_MODE << 4 | SLOWAUTO_MODE);
   237	
   238		if (ret) {
   239			dev_err(hba->dev, "%s: HSG1B FASTAUTO failed ret=%d\n",
   240				__func__, ret);
   241		}
   242	
   243		return ret;
   244	}
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
