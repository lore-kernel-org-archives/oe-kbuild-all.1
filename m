Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44765161
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 21:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729977867; cv=none; b=EY7PTSOtgXrfijFk18WCGD+A/diwXyOnDXJsWnSmmhdIQ4xUd1r1NDUE7tyhPXnZb5plsabhfBEkGiAMeSUgoo57hYmPF8eGhKQJZ3c6Edc3ZCNiaGjREb6r47Z619SuFcNrjXw9YqpsKsOBxMfKbaqjon9vjphmYVhBOAenWfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729977867; c=relaxed/simple;
	bh=nkTADzxqbilpj3y9Og2F5L4W4uinwb4EdhVe3rqkv8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gRJ/gcKEX1fHsItxPvdOpeIQwC8AmQm6y8fPjijC841qzSaHuUqXHj1gpdOy2/SxQMWHp8ur3OvlOuKlJ/h2H7EtSXGjh5P7PjJvX9UCDsiMF5AT7JD6aXwrHPUQ+acvkYAlex8LoE0Li0lga17cHlTyKAtKMAVF26b9ygbOe8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+fSPjXq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+fSPjXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729977866; x=1761513866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nkTADzxqbilpj3y9Og2F5L4W4uinwb4EdhVe3rqkv8o=;
  b=L+fSPjXqWo28i6fQlsa5MkjOyly4loLI7f9ynqYgMNvhhup4dUIDWD+2
   J7Cx4LZqOf0s1YCs6CzJsfzQ86pUjN/Nn6xkEOIg1AQcRhBMfq/23gnRG
   aDb8y4u6oxlOK8D5fYwNzjMGSNH2XjDKZKOQDvBMXsNS4eugB0sKQjEAg
   8eFAek0GEW8fbhN5by6JealsdcPBi19U1OLLGzIwFxtiWsuo72f7BjuPE
   RxoZ4KARNudFXJyyaQgbb/HFVAfHEmiu5u1BI9UBJN7gN0upj3khcU5u3
   kWURKxDXZhkrDoBUyHg0etH+tWmI9wbRNMisQjUv/GuBARBzWPZtLff0j
   A==;
X-CSE-ConnectionGUID: bkd8nS9mSXSp7CbaUBzKvQ==
X-CSE-MsgGUID: cvejAqoKS5Gz9pBXFxZyUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="17251158"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="17251158"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 14:24:25 -0700
X-CSE-ConnectionGUID: UMwfKTkoT26s68iRof7wgg==
X-CSE-MsgGUID: eK06/QsIQWuV/JzmbHfm4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="80873552"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Oct 2024 14:24:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4oGj-000a3E-0o;
	Sat, 26 Oct 2024 21:24:21 +0000
Date: Sun, 27 Oct 2024 05:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, wangyuan <wangyuan46@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21583/23866]
 drivers/crypto/hisilicon/qm.c:3322: warning: Excess function parameter 'ce'
 description in 'qm_hw_error_init'
Message-ID: <202410270513.RTL2eHIu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   22c50245e8025b0c6beee13d0df238987b98e6f8
commit: 267bce716c1008522c3b8ddbeac8d3c65514e98f [21583/23866] crypto: hisilicon/qm - drop unnecessary IS_ENABLE(CONFIG_NUMA) check
config: arm64-randconfig-002-20241026 (https://download.01.org/0day-ci/archive/20241027/202410270513.RTL2eHIu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270513.RTL2eHIu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270513.RTL2eHIu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/hisilicon/qm.c:3322: warning: Excess function parameter 'ce' description in 'qm_hw_error_init'
>> drivers/crypto/hisilicon/qm.c:3322: warning: Excess function parameter 'nfe' description in 'qm_hw_error_init'
>> drivers/crypto/hisilicon/qm.c:3322: warning: Excess function parameter 'fe' description in 'qm_hw_error_init'
>> drivers/crypto/hisilicon/qm.c:3322: warning: Excess function parameter 'msi' description in 'qm_hw_error_init'


vim +3322 drivers/crypto/hisilicon/qm.c

ae67d23af736c7 xuzaibo    2019-04-21  3302  
ae67d23af736c7 xuzaibo    2019-04-21  3303  /**
73d33f5c59dc38 Yu'an Wang 2020-04-16  3304   * qm_hw_error_init() - Configure qm hardware error report method.
ae67d23af736c7 xuzaibo    2019-04-21  3305   * @qm: The qm which we want to configure.
ae67d23af736c7 xuzaibo    2019-04-21  3306   * @ce: Correctable error configure.
ae67d23af736c7 xuzaibo    2019-04-21  3307   * @nfe: Non-fatal error configure.
ae67d23af736c7 xuzaibo    2019-04-21  3308   * @fe: Fatal error configure.
ae67d23af736c7 xuzaibo    2019-04-21  3309   * @msi: Error reported by message signal interrupt.
ae67d23af736c7 xuzaibo    2019-04-21  3310   *
ae67d23af736c7 xuzaibo    2019-04-21  3311   * Hardware errors of qm can be reported either by RAS interrupts which will
ae67d23af736c7 xuzaibo    2019-04-21  3312   * be handled by UEFI and then PCIe AER or by device MSI. User can configure
ae67d23af736c7 xuzaibo    2019-04-21  3313   * each error to use either of above two methods. For RAS interrupts, we can
ae67d23af736c7 xuzaibo    2019-04-21  3314   * configure an error as one of correctable error, non-fatal error or
ae67d23af736c7 xuzaibo    2019-04-21  3315   * fatal error.
ae67d23af736c7 xuzaibo    2019-04-21  3316   *
ae67d23af736c7 xuzaibo    2019-04-21  3317   * Bits indicating errors can be configured to ce, nfe, fe and msi to enable
ae67d23af736c7 xuzaibo    2019-04-21  3318   * related report methods. Error report will be masked if related error bit
ae67d23af736c7 xuzaibo    2019-04-21  3319   * does not configure.
ae67d23af736c7 xuzaibo    2019-04-21  3320   */
73d33f5c59dc38 Yu'an Wang 2020-04-16  3321  static void qm_hw_error_init(struct hisi_qm *qm)
ae67d23af736c7 xuzaibo    2019-04-21 @3322  {
73d33f5c59dc38 Yu'an Wang 2020-04-16  3323  	u32 nfe = qm->err_ini.err_info.nfe;
73d33f5c59dc38 Yu'an Wang 2020-04-16  3324  	u32 msi = qm->err_ini.err_info.msi;
73d33f5c59dc38 Yu'an Wang 2020-04-16  3325  	u32 ce = qm->err_ini.err_info.ce;
73d33f5c59dc38 Yu'an Wang 2020-04-16  3326  	u32 fe = qm->err_ini.err_info.fe;
73d33f5c59dc38 Yu'an Wang 2020-04-16  3327  
ae67d23af736c7 xuzaibo    2019-04-21  3328  	if (!qm->ops->hw_error_init) {
ae67d23af736c7 xuzaibo    2019-04-21  3329  		dev_err(&qm->pdev->dev,
ae67d23af736c7 xuzaibo    2019-04-21  3330  			"QM version %d doesn't support hw error handling!\n",
ae67d23af736c7 xuzaibo    2019-04-21  3331  			qm->ver);
ae67d23af736c7 xuzaibo    2019-04-21  3332  		return;
ae67d23af736c7 xuzaibo    2019-04-21  3333  	}
ae67d23af736c7 xuzaibo    2019-04-21  3334  
efe221f95003ac Zhou Wang  2019-07-11  3335  	qm->ops->hw_error_init(qm, ce, nfe, fe, msi);
ae67d23af736c7 xuzaibo    2019-04-21  3336  }
ae67d23af736c7 xuzaibo    2019-04-21  3337  

:::::: The code at line 3322 was first introduced by commit
:::::: ae67d23af736c75f90795297fddb86dc97e7b3c7 arm64: Add hisilicon Crypto drivers qm/hpre/zip and code format

:::::: TO: xuzaibo <xuzaibo@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
