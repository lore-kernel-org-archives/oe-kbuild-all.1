Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4602313BAE2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 19:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727466884; cv=none; b=XTK6ujGQYkVVqwFhlk2MxQs3a6yzdPlmbmUYtdcTnc5/fizNEaZlbuM13CwOxcZhTG1gclVk0jN+mtGOLDEyB/L8Mt8Z/iv2X7QFZHY8rZKR/h3ZV7D6c6CU54P1BrTMPwj1yC6BxjO1TeGAiDMIRvoAhw8pP2d40APZf3t9O9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727466884; c=relaxed/simple;
	bh=HQ19q1UTyo3cZcCQAAtJgeeM6vWYcEQVcOrIstMBoUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ic/3wA6qPxUT/LmKBXI949rOCmWyWKZgXvRwT8iijsLRK9I/ROi2OB3QK0UwPMRwOMihU/ysS60cHIYdChKMQGEDX+kCl62i5/6DfMU6m7h1tQtlILGVkRe6HOQVxY1MYJ+BidXkKyxBtukn0lBjyDS7TjU5UfH7Bpemkcmwmp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcHkHlE+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcHkHlE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727466883; x=1759002883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HQ19q1UTyo3cZcCQAAtJgeeM6vWYcEQVcOrIstMBoUQ=;
  b=lcHkHlE+WPrSIpYNQ1lOx42LXuyQTe54xFTy8xreoM3WpHXViFz6QOGH
   kL/7CTFPqtjurf0BM0llt4brDG3uK9+HemviVYzpgyz0C3SdJWYuiD0NN
   MzrLMosuoAkkqTGxLWiCLFqdmditFDTyr+Izzj/zugP5J91Ripqzw0MG3
   mDePT76I0lep86o6Uk+aJgRrnHwgLNlA049R7/42+S8BE/EjXbmKDJcle
   uK1ZM5wwYTuB+vgaeS2sX++tAfznYZxdGwsUI8PAzbk5MbPOlWUIcVgks
   qqIA+6vBiR9ES5b8mbjtlfKxbMtGbkxJ1x8gDAJPfdnYg6bDf2Ipl4db9
   g==;
X-CSE-ConnectionGUID: PrNpG0L+SWiJG+8wI9E0XA==
X-CSE-MsgGUID: Tq4PtqZXRVeTzks9/X6oqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26497050"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="26497050"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 12:54:42 -0700
X-CSE-ConnectionGUID: wH5+5CoRRU2CdHoPbWgQ8w==
X-CSE-MsgGUID: AEQhKzd6Tj+kZZpOfY0T6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72933739"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Sep 2024 12:54:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suH30-000MYv-0P;
	Fri, 27 Sep 2024 19:54:38 +0000
Date: Sat, 28 Sep 2024 03:54:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13192/23799]
 drivers/crypto/hisilicon/qm.c:2726: warning: Excess function parameter 'ce'
 description in 'qm_hw_error_init'
Message-ID: <202409280341.XkIGO1R8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu'an,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: 73d33f5c59dc3824444baca6a458427f4de3d8fa [13192/23799] qm: Move all the same logic functions of hisilicon crypto to qm
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280341.XkIGO1R8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280341.XkIGO1R8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280341.XkIGO1R8-lkp@intel.com/

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
