Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F4FEACD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 17:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757525326; cv=none; b=jxC1PuWaUfTAChJABE/2ZbMQbyRwl/gUNF7XHCXkhlNS4feFCj91auHiQDYi7lJ9DEZxriOSM7cIpV8ARFVCwWJCaq+YT80e6niG81z/J0i/F75KjYXXkPFlqLr8jMiiZrR6dGY1gXsfEfwxZxNBNxCz1loducMtNXTZS2N+d5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757525326; c=relaxed/simple;
	bh=7Vw8bN1bp8YR3Ykjrm7AveWmswibsLD8sqfJ8YFmTEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aQjuB5gBRLWdupqMD9bnzulWnUwsaflkIs2yXed8OAJAlDoIQQVGvztajuDrtxIFTvTZM+uBNF/5XR7RsbVzTMBRgtQT+8DUwu6/xQoToxV7G2CzpKAMg7yQY3l1WpNRk2vQtM8JRdzoxhnFBNcN42tsQ3G7bqrDoOFHCX/xb+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=coP7i1VQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="coP7i1VQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757525325; x=1789061325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Vw8bN1bp8YR3Ykjrm7AveWmswibsLD8sqfJ8YFmTEM=;
  b=coP7i1VQtOn4WlVpJ/+xxYXMv1D7/bAwyMQBPFSSjtIJkqSvY/huABWx
   TB8xfyT/40Db8GVxnB4glUmp4toVxNptuEeTQr5jKXdaee+js+1S9Uqyv
   0JzT4R10yX7aUYg2Zyy4iE1vhoZbDCIE7D4ORhH5bk1bXCapqY5TSRUQE
   zBaXicvSqlXBTlrd2DCf17XLz8Ydng+jboSKIgnlvmEXGIL1NMyS2HyAM
   uIS8FdIQUhADV2EAo1PeB/kwvZxfWpC1uTFCAESAueMka5T25Jm25E0xf
   yCdOxRxBkeFs3lTjnZ4GRNVQXRkdRawIiSFA1/BCxJvi5Wq2f8KieA4Pv
   Q==;
X-CSE-ConnectionGUID: Ry01NgCzSO6TKiXtbgeAiQ==
X-CSE-MsgGUID: fuU1Q72YQpWPJjb9mL23zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="47418669"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="47418669"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 10:28:44 -0700
X-CSE-ConnectionGUID: zIHPBAt2ScGp9UkGT7clLg==
X-CSE-MsgGUID: UaLgMcTgTWiZiq90sxsGuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="178653280"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Sep 2025 10:28:42 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwOca-0006An-0M;
	Wed, 10 Sep 2025 17:28:40 +0000
Date: Thu, 11 Sep 2025 01:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-QAT-Fix-V6.16-ANBZ21972 42/42]
 drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c:236:9: error: too many
 arguments to function 'adf_dev_down'
Message-ID: <202509110119.9YRNLBAl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-QAT-Fix-V6.16-ANBZ21972
head:   8cd81475ad413dfb4d25f70a9aad98fa1aafa5bb
commit: edb1fa1295c4fc71f3eb608b8d8ad8987ff219b3 [42/42] crypto: qat - preserve ADF_GENERAL_SEC
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250911/202509110119.9YRNLBAl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110119.9YRNLBAl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110119.9YRNLBAl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c: In function 'adf_shutdown':
>> drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c:236:9: error: too many arguments to function 'adf_dev_down'
     236 |         adf_dev_down(accel_dev, false);
         |         ^~~~~~~~~~~~
   In file included from drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c:17:
   drivers/crypto/intel/qat/qat_dh895xcc/../qat_common/adf_common_drv.h:59:5: note: declared here
      59 | int adf_dev_down(struct adf_accel_dev *accel_dev);
         |     ^~~~~~~~~~~~


vim +/adf_dev_down +236 drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c

7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_drv.c       Tadeusz Struk    2014-06-05  231  
796c96cf668553 drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c Giovanni Cabiddu 2025-07-25  232  static void adf_shutdown(struct pci_dev *pdev)
796c96cf668553 drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c Giovanni Cabiddu 2025-07-25  233  {
796c96cf668553 drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c Giovanni Cabiddu 2025-07-25  234  	struct adf_accel_dev *accel_dev = adf_devmgr_pci_to_accel_dev(pdev);
796c96cf668553 drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c Giovanni Cabiddu 2025-07-25  235  
796c96cf668553 drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c Giovanni Cabiddu 2025-07-25 @236  	adf_dev_down(accel_dev, false);
796c96cf668553 drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c Giovanni Cabiddu 2025-07-25  237  }
796c96cf668553 drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c Giovanni Cabiddu 2025-07-25  238  

:::::: The code at line 236 was first introduced by commit
:::::: 796c96cf668553dbb12049738a8f7d83b26092e1 crypto: qat - add shutdown handler to qat_dh895xcc

:::::: TO: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
