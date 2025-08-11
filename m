Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61449263C8A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 20:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754944226; cv=none; b=qTexza2veM6YVpgoFUBbvqabh4WjY8u9wi+Df2mlMBb2/PfxMbnUueRgEb8awYiSu+5XTrgH6pPz/cHMEHj8RfzXhR5+ZQaeFMfuHwmv4/wMVyUp19ZgJbMV66zE+eiXhWTGK8dfkz2ZvAjQYszovYTPQ/GmKM3LHoB9NEYo7Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754944226; c=relaxed/simple;
	bh=rjhrII5s1B7vI11Amiozbb5vc8ewb5SaCOgfGySOvnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hLVr9P9I4bgL8yJnHKtBQnGqkFWQ36ELWHuRYA1q3Zak/pyVejXId17jfIx3NgMlq3RntzgXeArYK/K2GkGCSvRxZAdmXd6DLhyjOLr0bzv+/LnghryoJgQW75T1uA3yKCnFUXjEiL61znNQ3XatcHXgK1jQiac3tYZls20poSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPlgRrJo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPlgRrJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754944225; x=1786480225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rjhrII5s1B7vI11Amiozbb5vc8ewb5SaCOgfGySOvnA=;
  b=JPlgRrJoT+6MOF3lLbfiT41MmUjeF++KugBl+rnxnZOyAko6ViF/KXOi
   BddPK1TQE/rLUEfMxpYL8r5ot/aVUBIvVn3vePtK8kklcWcuMIqsui5/x
   BoXTGdm8kfh8MuWnY4s9RK8enbEEMy88txLBMwnclvAZVXqNtozH6cS/Y
   o0RVPYw96GkyLMfYJLZCFfgXlG2Bgucq4QKoztFf5N3qVW83ArPr+qA0J
   d8UAmSa2FLSmFSXvr2+np4PkuYiLDyVRbBs3lnvrdjrofxZNOm+R/p5VF
   A5eX6Gbx+O8iF9QVu0PgCgmfLTlTGCZZ6V4MSv+k1/5xdHLjuABgHMDbw
   w==;
X-CSE-ConnectionGUID: ilOJ/1KBSo64PTQT3XKEAg==
X-CSE-MsgGUID: sjjbgYE1TG6sdHx03avd6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57163343"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57163343"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:30:24 -0700
X-CSE-ConnectionGUID: Pwuv8OdoREinHSEIyr+lLg==
X-CSE-MsgGUID: htZXjJEDSIaakx5q/9qLyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170147446"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Aug 2025 13:30:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulZ9w-0006Cs-2G;
	Mon, 11 Aug 2025 20:30:20 +0000
Date: Tue, 12 Aug 2025 04:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2667/2667] arch/arm64/kvm/cca_base.c:52:6:
 warning: no previous prototype for 'set_cca_cvm_type'
Message-ID: <202508120416.G0o0Cpl1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a5185c1b0fd7a9b3ea9b6923d5bcedc7392c59b7
commit: 419da4d196ffa97d1430d017d1b36348fea395e5 [2667/2667] VirtCCA: Add CCA base operations.
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250812/202508120416.G0o0Cpl1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120416.G0o0Cpl1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120416.G0o0Cpl1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/cca_base.c:52:6: warning: no previous prototype for 'set_cca_cvm_type' [-Wmissing-prototypes]
      52 | void set_cca_cvm_type(int type)
         |      ^~~~~~~~~~~~~~~~


vim +/set_cca_cvm_type +52 arch/arm64/kvm/cca_base.c

    51	
  > 52	void set_cca_cvm_type(int type)
    53	{
    54		cca_cvm_type = type;
    55	}
    56	EXPORT_SYMBOL_GPL(set_cca_cvm_type);
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
