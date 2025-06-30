Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3E8242D8B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751323297; cv=none; b=qvIBURxaPM9GclnW+vjmYXa8y1/xj/t8DRYFKrSBxtNRFe3I5+ENcg3YDquyd7nr/6mVP+z2ECYBhCyqfN5vvwSG5ZywuymhAZCpvOlGmwPMEo7o7IYJVUbprvLG7HMxCDTcB45pXJRrTpx/aX6/dnGvtxnwdJcQR+k/ayqLTYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751323297; c=relaxed/simple;
	bh=EYDR9mTsx3ZckZQUxkRE88+1RWkyfZHWvYU9GV+PnjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LZB/Guas00nabMUWBk5hclBnbiOKhA1D9qldJhr9/Mj2eflFJPsTYYyIGT7edSj5FpSScoagyNYYSMbsFR3Jzcmgw0ncjTxXeDgU2M6xVxLu76h42XXTcVRnBByD2X635yAvCn8NQPZQY0NBb4poYb5s2ymDpqwZQxm1FIya4ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cum9e7Id; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cum9e7Id"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751323295; x=1782859295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EYDR9mTsx3ZckZQUxkRE88+1RWkyfZHWvYU9GV+PnjM=;
  b=Cum9e7Idm8BXoDuLcoC+IOY6sN2qSlka8QJSSzpYnIscIQA189rjhQj4
   HfRtkBMJoiBiLD1QqCHB9t1zqWzvMOFxaFvlDO6Ryr+kfXsF6pSG8YH8N
   otWXy0L3BGpA7dQDVufaS5FVDdt29qseMHkTbQj4hFvjiEfmSoecqu34j
   6lmQOhboaTccDMupyCYZftOJDGhf3ZBk7qGrL2B7yqsw5KFzDMRu1If9M
   YlN6kmuxEalhj5inNZHdi2JZyoYzKxW/vJaCrtW4j/Uptmfx60wxuMlVI
   K9QRIMkCi+OEUPdpl811H27/4LAqHsLuHHV6z0QSryUjJjsAPDwGlFf2z
   Q==;
X-CSE-ConnectionGUID: pl2ieLGuT4OQI8AIzQeLeA==
X-CSE-MsgGUID: 63P/M5LVTUGzA4PO/kVk1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="70994252"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="70994252"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 15:41:35 -0700
X-CSE-ConnectionGUID: iEG1ve6wSZmtno9027KftA==
X-CSE-MsgGUID: zCKg/v67T7W7+hGy2lqk/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153334159"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 30 Jun 2025 15:41:33 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWNBq-0001L9-0u;
	Mon, 30 Jun 2025 22:41:30 +0000
Date: Tue, 1 Jul 2025 00:40:49 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1]
 drivers/firmware/qcom_scm.c:183:13: warning: unused variable 'ret'
Message-ID: <202507010034.kBUah0Ky-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   3041dc18cad39ce48f7eb75cd07bcb383b76d6c5
commit: 89ff5a158f4ec51d7f42be7e184e72ea155f76b9 [1/1] BACKPORT: firmware: qcom_scm: Make __qcom_scm_is_call_available() return bool
config: arm64-randconfig-2003-20250630 (https://download.01.org/0day-ci/archive/20250701/202507010034.kBUah0Ky-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010034.kBUah0Ky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010034.kBUah0Ky-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/qcom_scm.c: In function 'qcom_scm_pas_supported':
>> drivers/firmware/qcom_scm.c:183:13: warning: unused variable 'ret' [-Wunused-variable]
     183 |         int ret;
         |             ^~~


vim +/ret +183 drivers/firmware/qcom_scm.c

d0f6fa7ba2d624 Andy Gross      2016-06-03  173  
f01e90fe34f563 Bjorn Andersson 2015-09-23  174  /**
f01e90fe34f563 Bjorn Andersson 2015-09-23  175   * qcom_scm_pas_supported() - Check if the peripheral authentication service is
f01e90fe34f563 Bjorn Andersson 2015-09-23  176   *			      available for the given peripherial
f01e90fe34f563 Bjorn Andersson 2015-09-23  177   * @peripheral:	peripheral id
f01e90fe34f563 Bjorn Andersson 2015-09-23  178   *
f01e90fe34f563 Bjorn Andersson 2015-09-23  179   * Returns true if PAS is supported for this peripheral, otherwise false.
f01e90fe34f563 Bjorn Andersson 2015-09-23  180   */
f01e90fe34f563 Bjorn Andersson 2015-09-23  181  bool qcom_scm_pas_supported(u32 peripheral)
f01e90fe34f563 Bjorn Andersson 2015-09-23  182  {
f01e90fe34f563 Bjorn Andersson 2015-09-23 @183  	int ret;
f01e90fe34f563 Bjorn Andersson 2015-09-23  184  
89ff5a158f4ec5 Stephen Boyd    2021-02-23  185  	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
89ff5a158f4ec5 Stephen Boyd    2021-02-23  186  					  QCOM_SCM_PAS_IS_SUPPORTED_CMD))
f01e90fe34f563 Bjorn Andersson 2015-09-23  187  		return false;
f01e90fe34f563 Bjorn Andersson 2015-09-23  188  
f01e90fe34f563 Bjorn Andersson 2015-09-23  189  	return __qcom_scm_pas_supported(__scm->dev, peripheral);
f01e90fe34f563 Bjorn Andersson 2015-09-23  190  }
f01e90fe34f563 Bjorn Andersson 2015-09-23  191  EXPORT_SYMBOL(qcom_scm_pas_supported);
f01e90fe34f563 Bjorn Andersson 2015-09-23  192  

:::::: The code at line 183 was first introduced by commit
:::::: f01e90fe34f563a5e189d4070de4a23948105642 firmware: qcom: scm: Peripheral Authentication Service

:::::: TO: Bjorn Andersson <bjorn.andersson@sonymobile.com>
:::::: CC: Andy Gross <andy.gross@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
