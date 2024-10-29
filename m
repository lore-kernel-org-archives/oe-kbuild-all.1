Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED624203708
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 11:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730199960; cv=none; b=Ot6E8fQPIEsfVKgk0Y7zRODJLytll5p8fmSgWxDWmbYrAq6WCsTpvicS4NxaZXaGMkDLgIKCRFprLQLKnodYrRj0lWRLaiPgae70qD9A28JsPPtZ99mYNBPBwYTLrsnr3oOleDQJHh1x7LVbNIIjOv4kjBYiFy/5g+rrynsZEm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730199960; c=relaxed/simple;
	bh=dZfJPNsaOj7N1jwJ0brSheLEia4pJuRz33OTvpGISCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQCWF/1i62KWxQRmS28Y69N9s+/VMSdDDn9x44YDJF8Jgaq15BPjgDuukrul5qEpmng9XOcOCHG87tnAjjaOz73KATLeQF6LLz4+On4eEpIt6AqDkbgLsmoGQeqDSg9ZKcKuEOZPHOociwsg4HNNirr5NZUj3nPgTBSXP0gsmOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nY6Sfl08; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nY6Sfl08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730199958; x=1761735958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZfJPNsaOj7N1jwJ0brSheLEia4pJuRz33OTvpGISCc=;
  b=nY6Sfl08JEX8jU7tUZmX5Ve+RN0v7iZjeM5bkEfBEelhT/DnFr3fLY/i
   UHQAkTD+I0F+GX4wbGr1OBt7ZfCDtxmogkzCEy3aOXXz+rNFb4v0N5B+H
   UnR0Arp2k27nmq4lshFP5hpvtMiAB3B0/9vPRkEuk7zxGsrfCo7FpYGpS
   SZ9KEqgkxxrq/oXYLUYN851JeqJeQy2Hm6WOf2o/LCh8zNf5hTgUfAelX
   HTpQYmSW/2ynmPvmvJQv5ICBm4bMj2ZQYi0W4DHl8SinvU4+tYi74SHf8
   abp9YnCgz2g+WQU/rUauxQcWcO7cCMXOKm3EktQyZ7D0SEpNEUMphGlGB
   g==;
X-CSE-ConnectionGUID: WicfdPiwS1a4mmfclteeeQ==
X-CSE-MsgGUID: cjSQ1+5cQUC9kts2ahc3mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="32687295"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="32687295"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 04:05:58 -0700
X-CSE-ConnectionGUID: 0lvUNuniQwSTfQ+soJu6sg==
X-CSE-MsgGUID: k8uvnt5zS8qCx+RuWqQPIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82008602"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Oct 2024 04:05:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5k2q-000dZ4-0R;
	Tue, 29 Oct 2024 11:05:52 +0000
Date: Tue, 29 Oct 2024 19:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 10798/13046]
 arch/x86/kernel/zhaoxin_kh40000.c:33:15: sparse: sparse: symbol
 'zhaoxin_patch_code' was not declared. Should it be static?
Message-ID: <202410291828.mmzplkby-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: ab7f82d72290046790f10ac6f2bd8b6579899498 [10798/13046] Add kh40000_direct_dma_ops for KH-40000 platform
config: x86_64-randconfig-121-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291828.mmzplkby-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291828.mmzplkby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291828.mmzplkby-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/zhaoxin_kh40000.c:33:15: sparse: sparse: symbol 'zhaoxin_patch_code' was not declared. Should it be static?

vim +/zhaoxin_patch_code +33 arch/x86/kernel/zhaoxin_kh40000.c

    32	
  > 33	unsigned long zhaoxin_patch_code = ZHAOXIN_PATCH_CODE_DEFAULT;
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
