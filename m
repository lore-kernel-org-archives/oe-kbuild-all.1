Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2062E410
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 19:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710445186; cv=none; b=eJ5Qr3PEnfPaPMcap0BjfHy0i/AOzWb+MpZB+orPEt4S+XIYq2fcKY0ZtpV75uiSI/qFUyCa1mU4PhAD/um1l4Jc1vAvJoAscGREjc+s37kvTLghSOg0d+lNUHdMweRo9w9882O8EXoYU2yqXkBhb63FeC7jc3K1EQHQsvPnMG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710445186; c=relaxed/simple;
	bh=rWaAsmPWqA/QFy8Zaf33tmsZqs1Mn0FbZ6BmN5Y37QM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fT16r0iGyGT2Hn+g9Zt4SXdbs0EKYcooFra3NpctM092r43tbTjsjOzU/kGYPLxKNdYKmAYa9eu8yPslbSlukVq2Qz3bcDT+LYHxjxA1Hzgv4k8xWQq+CRs/UJPKFd4P0E+xpUagtCZ0ZAfnVV3BEvfDb1Efrmb3lTxAas4hjlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9vqrRAg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9vqrRAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710445183; x=1741981183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rWaAsmPWqA/QFy8Zaf33tmsZqs1Mn0FbZ6BmN5Y37QM=;
  b=E9vqrRAgRttKrmwD2/Ycop5r/eFpQP/lSA+7gDIlPILrwjSW2QyF8zjl
   tTsNdfQLAs+Ct1xxtoFtv3am4qanK+kQ0uvW6QNGlFGYY84txy1jsgzic
   EgICy+AMXjl7J3XRa63QyOj7ncivTwskup/p9qJwHLoE3mxMaxXhoRO/T
   zwuHUs9SSIRBTORDzepISJehDXyx5RK1BCLFKOw3H1OkGbjDFfHZfvuXn
   pyD46e6KfdFO0yklokIzzcNtkz486O4rPnHkjc4L9A7j3hhOr0Xeipyov
   s9J3vWeVVa4fDzOaBWdLie3XshuZG3LNCeWtmaJacen9iAaDtJHOoCS0j
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22749383"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="22749383"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 12:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="17002512"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Mar 2024 12:39:41 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkqvT-000DjV-11;
	Thu, 14 Mar 2024 19:39:39 +0000
Date: Fri, 15 Mar 2024 03:39:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17809/21864]
 drivers/powercap/intel_rapl_common.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202403150315.89t0aVV8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c41e48598c428d3e38e9ce985a698070deb979b
commit: 74c448a8b8ad8801c117e98ccd0e399413c063bb [17809/21864] Intel: intel_rapl: Fix module autoloading issue
config: x86_64-buildonly-randconfig-006-20240312 (https://download.01.org/0day-ci/archive/20240315/202403150315.89t0aVV8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403150315.89t0aVV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403150315.89t0aVV8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/powercap/intel_rapl_common.o: warning: objtool: missing symbol for section .init.text
--
>> drivers/powercap/intel_rapl_msr.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
