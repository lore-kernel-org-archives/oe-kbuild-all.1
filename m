Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C18156991
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 06:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732862366; cv=none; b=hzWxSV+flemnJxwwPlEeREbeSkrefoU6ni+LHT+MZ8ABBgtvuAlE3uN74mR3sfFlRDptz2J061J0biCBiWZUeyQ+6Eumx93yTxHcbR9kG4GuPIgK36N5gWyUVlaVUD9bHstKaO8u+U9jeY5/ccwO8HHEtRi5aBzwBOAttvkQ5ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732862366; c=relaxed/simple;
	bh=EVqKUhonBKI7lSvYI2Tk3VI51+q5utA4MmWhPkOdDZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PNJhKf367eEH6uphjScOxgwUISGlx8NioGPh//VmDokBsONHr+gnA+bnPuuM9ZwyxytMvVe+JaWDoDqXnlMVgShP5DU63z2KOzBgdV81AZyBBMmckdJtgFKamAl/OcDHWprXCnwrr1j/AT8xr4/PIzdv+e2kwyMef1Sdo8mm1hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WB/lGVb+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WB/lGVb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732862364; x=1764398364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EVqKUhonBKI7lSvYI2Tk3VI51+q5utA4MmWhPkOdDZo=;
  b=WB/lGVb+cfltZ2lo3OJ4pyWE40o6sD71n787L+k9gBqvNQHFVlHFhwI8
   FdGvrkjjwl0VYDBkcf4X9X/CcXMjDTLCaAE4/WCq+erX4w38yQVyuFExZ
   7Y1b/YUWW39KJ1Yf3K0omhieDt9WdOQ2rLYQkVmomjwSDWrhIGvJACc4+
   sSzeOT47GFlWYmv8HnJrgRkXtbvi9D416oLYga5fCudNPitkLUj/BjMen
   ff3sPDAYiVlQ4EwZAaa8D/oGbHBIsuCOlYIdQ50bz5mroVSeKwh9L2xXE
   XoH9JhImK+MBVFXBIly1pyi7Wl7i4XHXhDQAQk1Fz+Mz9ajmcyPymiltf
   Q==;
X-CSE-ConnectionGUID: q2G/XqG9RFKXs+EDz3ZP0w==
X-CSE-MsgGUID: +wIwJInxSDCGPsheRNFxJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="20689013"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="20689013"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 22:39:20 -0800
X-CSE-ConnectionGUID: 7Xd4MJanQT6otx/T1ZRN5g==
X-CSE-MsgGUID: yV5KxyHsQciZWEkU/m/TXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="123370185"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2024 22:39:20 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGuer-000067-23;
	Fri, 29 Nov 2024 06:39:17 +0000
Date: Fri, 29 Nov 2024 14:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297]
 drivers/pci/controller/hisi-pcie-customer/.tmp_hisi_pcie_cae.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202411291412.QcA88pv3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 2208b0283616863f166ef470fb9286223ba8f9ba [1297/1297] pcie: hisi pcie dfx driver
config: x86_64-buildonly-randconfig-002-20241117 (https://download.01.org/0day-ci/archive/20241129/202411291412.QcA88pv3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291412.QcA88pv3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291412.QcA88pv3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/hisi-pcie-customer/.tmp_hisi_pcie_cae.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
