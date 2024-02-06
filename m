Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D2A137E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 01:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707182392; cv=none; b=ptmP0UpD6hJ8nD5++r7KZBb+VxJSazjD03Jd501eZfq984GOzAhg/B5ZIrt5BTaREX3HUpvwfzAk6nYLZNtVRoK3a7fPcRHTmVu2XGul6+79KKkqw95iduCTdX9cdPJMigDS7BTQDduIxofeOnnfVX79e/F/miAnL/vTSmNqQsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707182392; c=relaxed/simple;
	bh=1qG5WW8hp9IharZ97UZzkmALcaHfBo0NhC6IsDlVJeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=un68NIFVAfnTxrVsOkE7nnLFNY0w3d3Pe6fLI6p8h7DcwOhYtJ4LyhyRfwD6Uco/mECpiKT1PHo/6TYE7vir894k8lxYunH7M67TRzBaKSxt3rblvY4jtamyRv8SSkLNI9bhWSjfSog56F+XDgWssFbCtwdJDF4IosTe4Je8Taw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvldcTRp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvldcTRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707182390; x=1738718390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1qG5WW8hp9IharZ97UZzkmALcaHfBo0NhC6IsDlVJeQ=;
  b=BvldcTRpteD/ulEMaiRRJ8Jbj+nb/rw72GdJL0snOnf0BpqMKaYUcuBf
   DAQ1akJ4WeOduA8gD8Mo9AwANtiYoXgN5Wf/TsnMu4CPRPqkx+VaByB5B
   JC+qjuCKgwO99q1EsDV8xyPzewJm33JsS3a44cpObv6mIX53JCBZf4JON
   x8LvGJzS3L9L15Jh+PG02yHq3MHENG243Cqg0dej6nKxN8fWVkuqns7oK
   rvvDcFLR34Nr5PI/+jlQa/pcTfcYrauNLOlHV5dGYhNXoYFgPjMZci/u3
   kRn+e83da9RY2mU6iaa0YK2uqEosAe0XDeqHBG+I0RItPJErcX/eIQSTH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26086306"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="26086306"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 17:19:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="31942295"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2024 17:19:46 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXA7k-0000xc-1j;
	Tue, 06 Feb 2024 01:19:44 +0000
Date: Tue, 6 Feb 2024 09:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13192/21616]
 drivers/crypto/hisilicon/qm.c:2726: warning: Excess function parameter 'ce'
 description in 'qm_hw_error_init'
Message-ID: <202402060939.zvTpc916-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: 73d33f5c59dc3824444baca6a458427f4de3d8fa [13192/21616] qm: Move all the same logic functions of hisilicon crypto to qm
config: arm64-randconfig-002-20240205 (https://download.01.org/0day-ci/archive/20240206/202402060939.zvTpc916-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060939.zvTpc916-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060939.zvTpc916-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/hisilicon/qm.c:2726: warning: Excess function parameter 'ce' description in 'qm_hw_error_init'
>> drivers/crypto/hisilicon/qm.c:2726: warning: Excess function parameter 'nfe' description in 'qm_hw_error_init'
>> drivers/crypto/hisilicon/qm.c:2726: warning: Excess function parameter 'fe' description in 'qm_hw_error_init'
>> drivers/crypto/hisilicon/qm.c:2726: warning: Excess function parameter 'msi' description in 'qm_hw_error_init'


vim +2726 drivers/crypto/hisilicon/qm.c

ae67d23af736c7 xuzaibo    2019-04-21  2706  
ae67d23af736c7 xuzaibo    2019-04-21  2707  /**
73d33f5c59dc38 Yu'an Wang 2020-04-16  2708   * qm_hw_error_init() - Configure qm hardware error report method.
ae67d23af736c7 xuzaibo    2019-04-21  2709   * @qm: The qm which we want to configure.
ae67d23af736c7 xuzaibo    2019-04-21  2710   * @ce: Correctable error configure.
ae67d23af736c7 xuzaibo    2019-04-21  2711   * @nfe: Non-fatal error configure.
ae67d23af736c7 xuzaibo    2019-04-21  2712   * @fe: Fatal error configure.
ae67d23af736c7 xuzaibo    2019-04-21  2713   * @msi: Error reported by message signal interrupt.
ae67d23af736c7 xuzaibo    2019-04-21  2714   *
ae67d23af736c7 xuzaibo    2019-04-21  2715   * Hardware errors of qm can be reported either by RAS interrupts which will
ae67d23af736c7 xuzaibo    2019-04-21  2716   * be handled by UEFI and then PCIe AER or by device MSI. User can configure
ae67d23af736c7 xuzaibo    2019-04-21  2717   * each error to use either of above two methods. For RAS interrupts, we can
ae67d23af736c7 xuzaibo    2019-04-21  2718   * configure an error as one of correctable error, non-fatal error or
ae67d23af736c7 xuzaibo    2019-04-21  2719   * fatal error.
ae67d23af736c7 xuzaibo    2019-04-21  2720   *
ae67d23af736c7 xuzaibo    2019-04-21  2721   * Bits indicating errors can be configured to ce, nfe, fe and msi to enable
ae67d23af736c7 xuzaibo    2019-04-21  2722   * related report methods. Error report will be masked if related error bit
ae67d23af736c7 xuzaibo    2019-04-21  2723   * does not configure.
ae67d23af736c7 xuzaibo    2019-04-21  2724   */
73d33f5c59dc38 Yu'an Wang 2020-04-16  2725  static void qm_hw_error_init(struct hisi_qm *qm)
ae67d23af736c7 xuzaibo    2019-04-21 @2726  {
73d33f5c59dc38 Yu'an Wang 2020-04-16  2727  	u32 nfe = qm->err_ini.err_info.nfe;
73d33f5c59dc38 Yu'an Wang 2020-04-16  2728  	u32 msi = qm->err_ini.err_info.msi;
73d33f5c59dc38 Yu'an Wang 2020-04-16  2729  	u32 ce = qm->err_ini.err_info.ce;
73d33f5c59dc38 Yu'an Wang 2020-04-16  2730  	u32 fe = qm->err_ini.err_info.fe;
73d33f5c59dc38 Yu'an Wang 2020-04-16  2731  
ae67d23af736c7 xuzaibo    2019-04-21  2732  	if (!qm->ops->hw_error_init) {
ae67d23af736c7 xuzaibo    2019-04-21  2733  		dev_err(&qm->pdev->dev,
ae67d23af736c7 xuzaibo    2019-04-21  2734  			"QM version %d doesn't support hw error handling!\n",
ae67d23af736c7 xuzaibo    2019-04-21  2735  			qm->ver);
ae67d23af736c7 xuzaibo    2019-04-21  2736  		return;
ae67d23af736c7 xuzaibo    2019-04-21  2737  	}
ae67d23af736c7 xuzaibo    2019-04-21  2738  
efe221f95003ac Zhou Wang  2019-07-11  2739  	qm->ops->hw_error_init(qm, ce, nfe, fe, msi);
ae67d23af736c7 xuzaibo    2019-04-21  2740  }
ae67d23af736c7 xuzaibo    2019-04-21  2741  

:::::: The code at line 2726 was first introduced by commit
:::::: ae67d23af736c75f90795297fddb86dc97e7b3c7 arm64: Add hisilicon Crypto drivers qm/hpre/zip and code format

:::::: TO: xuzaibo <xuzaibo@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
