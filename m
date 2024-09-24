Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084481805A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 04:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727152686; cv=none; b=qT65Z1HcysiIQpkDTVTjknBGuz5UnifrYCwnRaID0N2czrrCyu+h0s0r2lgwTRSYT/LfDjqaJnYH66dloybrEGtlHvCqBJw+W84TKBwHjBaz0JP44s9BKLU5pi0sDXnCgOpNCWbZnhlKOHztLU45spuCYk3wsRzflfLxwxPxpsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727152686; c=relaxed/simple;
	bh=U4mSfmRXCCsZ6m1VLppL52+HsL9AAJ6F4KogG7rzjFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=omy0ygtTv/kMBNZEYp5uPHPpqHC1PgPd9B97wzN/iD5yopafL+RphKlYz2bnc0KpWuIbZD0ghMp/pODcV2YnhnhHSLBAX/ZSjHvaA5LOchfcayBY/T84z+Yn4dYRdgPq0FjW8jDR33kYmN6dTcluRZhyK+ooSncZjvsmLNc11fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biBrj0Z5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biBrj0Z5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727152684; x=1758688684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U4mSfmRXCCsZ6m1VLppL52+HsL9AAJ6F4KogG7rzjFY=;
  b=biBrj0Z5xGcfDNC9cXMwo/uRrOoB3PSRlxtAzY9Ivcfskrnp6VTS19zj
   QuWTAh9So5NBpHa+G1sgpAx4PE04/U8R++4enVFyb4rXYmC41NoFeuZaQ
   wQb1UHQZJqSmG9mLVp2/Us2YEdCmH7e2yKAJ7M5HlHsRAZXKNxmdRxFN6
   JXHUjSB9sIC3TUt0a4/NBZd1woC+4gNZCcZ45iO+pP9vXVkYANFJm+Lur
   ulu0Gjx236h3hDm/pmCxClk0SnfB1rJl+blzcmLlB4acR02m3805GAGmy
   Hj5j7rq373hffbZVmsm2bu0VHVBkfTJp08S/PXwFq14ciZXgr5Bn+QJ6u
   w==;
X-CSE-ConnectionGUID: QDqXIBNDQpOqj8ZineOiGA==
X-CSE-MsgGUID: haeL8S1PTjydvHEStyj5Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43596843"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="43596843"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 21:38:03 -0700
X-CSE-ConnectionGUID: onAYb0RRRsGOQkRpNJmm5Q==
X-CSE-MsgGUID: NENxvF13TXiW7vBsDh0trw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="71610584"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Sep 2024 21:38:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssxJF-000HuO-1r;
	Tue, 24 Sep 2024 04:37:57 +0000
Date: Tue, 24 Sep 2024 12:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1849/2441] kismet:
 WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY when selected
 by VFIO_MDEV_IDXD
Message-ID: <202409241246.zqjq7gp1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 3fc743601586ae7d5e07907a94af65a8112159d4 [1849/2441] vfio: idxd: wholesale copy over 5.12 PO kernel mdev driver
config: x86_64-kismet-CONFIG_IMS_MSI_ARRAY-CONFIG_VFIO_MDEV_IDXD-0-0 (https://download.01.org/0day-ci/archive/20240924/202409241246.zqjq7gp1-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240924/202409241246.zqjq7gp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241246.zqjq7gp1-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]
   
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
