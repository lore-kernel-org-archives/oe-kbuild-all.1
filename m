Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B24EDCCF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 16:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180767; cv=none; b=NLQNeytvY0qJFa9lfaV/tDcJ/9cu26gbOCRUpLoqOf1ypX1mPMWM84taGQUJnGt0wqC/FBsszMjeJNDeQ7kKC5bHjqN06SRPi9c8VtcV0OVR9ZH5BaNrptfdSmqs5cEQyrreFdVm3L8MscKTqEuFLkMCzZwt92tnvlvV2EQw/9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180767; c=relaxed/simple;
	bh=eZFB2UcEd4RwqWiiY4oTrr50qcT2k8yv+p/nA1P73Fk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CER5ymaWw5dK2ViuV31UghNJQVZFdeNt6diVc0IEcd5gs5Bwk8XBxPavgnTtIW630ypmmpYj8DtsoTkgm+DVD1X+KEOoqZLl8PHR4YOp5UJtZKdeyXywqn7AY5PhZu9r4Fn+opUuvTI3syovr/yRzjjHPFWiDqlUOKQs9XoyIzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGsDeliB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGsDeliB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790180765; x=1821716765;
  h=date:from:to:cc:subject:message-id;
  bh=eZFB2UcEd4RwqWiiY4oTrr50qcT2k8yv+p/nA1P73Fk=;
  b=BGsDeliB7WzbNtoUi/eDjHFpny/rKyKxhL5ZbwTnEz6fNhBkGcDh48KZ
   8IcoZaHiZSBBUzG74tBCCe+RNZc7nLzX0GJ+9TOKzg9+ceRpISxzH9/zq
   Jkiz/wP1CLrQ+vl7nuDCyqoFVyW2uAsO3D0h0Aj9A/yO5jj69ckN4SPO6
   e+fGfoqCVUbvaJMadc1sVWd0QY7Dq+xU44C9muteG1Ecl/XJR1EIr+4ft
   bA2lcnoSkgqZV/Y34kOCG6jl1DPD70ivu2o9ean0fUUybnvbk8ru125ss
   XUCXW0zj5eKHPNQq2vVgrJGLq1IRAgN2EqapM4KaXhAF3aa/1/+GTRo3X
   A==;
X-CSE-ConnectionGUID: GbuT8v5qTKCg9MPvnOvASg==
X-CSE-MsgGUID: fkiTgNnXSg60fAOp+NZLlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="108393704"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="108393704"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 09:26:02 -0700
X-CSE-ConnectionGUID: sPJq4+llS7KFeUpu15eclg==
X-CSE-MsgGUID: DevNRcUQRA2HzqnmBgx8DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272279182"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2026 09:26:01 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9PnD-000000000k7-04BI;
	Wed, 23 Sep 2026 16:25:59 +0000
Date: Wed, 23 Sep 2026 18:25:48 +0200
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:master 6/9]
 drivers/char/tpm/tpm_ibmvtpm.c:407:12: warning: 'tpm_ibmvtpm_suspend' defined
 but not used
Message-ID: <202609231819.JBymmKOF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git master
head:   ab411db3c3b1fd0c70a36fb32c96b2c60175210b
commit: 137fb82b9c1b8b281307a7163ef719af752ee0bc [6/9] char: tpm: Use SIMPLE_DEV_PM_OPS for ibmvtpm power management
config: powerpc64-randconfig-r2105-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231819.JBymmKOF-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231819.JBymmKOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231819.JBymmKOF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm_ibmvtpm.c:407:12: warning: 'tpm_ibmvtpm_suspend' defined but not used [-Wunused-function]
     407 | static int tpm_ibmvtpm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/tpm_ibmvtpm_suspend +407 drivers/char/tpm/tpm_ibmvtpm.c

132f7629474424 Ashley Lai        2012-08-22  400  
132f7629474424 Ashley Lai        2012-08-22  401  /**
132f7629474424 Ashley Lai        2012-08-22  402   * tpm_ibmvtpm_suspend - Suspend
132f7629474424 Ashley Lai        2012-08-22  403   * @dev:	device struct
132f7629474424 Ashley Lai        2012-08-22  404   *
93c12f293f8798 Winkler, Tomas    2016-11-23  405   * Return: Always 0.
132f7629474424 Ashley Lai        2012-08-22  406   */
132f7629474424 Ashley Lai        2012-08-22 @407  static int tpm_ibmvtpm_suspend(struct device *dev)
132f7629474424 Ashley Lai        2012-08-22  408  {
9e0d39d8a6a0a8 Christophe Ricard 2016-03-31  409  	struct tpm_chip *chip = dev_get_drvdata(dev);
9e0d39d8a6a0a8 Christophe Ricard 2016-03-31  410  	struct ibmvtpm_dev *ibmvtpm = dev_get_drvdata(&chip->dev);
132f7629474424 Ashley Lai        2012-08-22  411  	int rc = 0;
132f7629474424 Ashley Lai        2012-08-22  412  
fb154e0e0a9524 Michal Suchanek   2017-02-24  413  	rc = ibmvtpm_send_crq(ibmvtpm->vdev,
fb154e0e0a9524 Michal Suchanek   2017-02-24  414  			IBMVTPM_VALID_CMD, VTPM_PREPARE_TO_SUSPEND, 0, 0);
132f7629474424 Ashley Lai        2012-08-22  415  	if (rc != H_SUCCESS)
132f7629474424 Ashley Lai        2012-08-22  416  		dev_err(ibmvtpm->dev,
132f7629474424 Ashley Lai        2012-08-22  417  			"tpm_ibmvtpm_suspend failed rc=%d\n", rc);
132f7629474424 Ashley Lai        2012-08-22  418  
132f7629474424 Ashley Lai        2012-08-22  419  	return rc;
132f7629474424 Ashley Lai        2012-08-22  420  }
132f7629474424 Ashley Lai        2012-08-22  421  

:::::: The code at line 407 was first introduced by commit
:::::: 132f7629474424418a5cdd666796ad3cfa4dc0c5 drivers/char/tpm: Add new device driver to support IBM vTPM

:::::: TO: Ashley Lai <adlai@linux.vnet.ibm.com>
:::::: CC: Kent Yoder <key@linux.vnet.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
