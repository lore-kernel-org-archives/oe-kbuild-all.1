Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2613F9D2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 01:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735607235; cv=none; b=IwNOpqgl1iQeBIKZe+7CkGxiXooCr4VZjqpFgKyN8RBzqbFcpO85CWkEIkr0kie5KtHaLFtbkROxjPxsewL9BWrfIebrtGmNS6zm9JrgCIKPa5EVWrLR5obkM7WEwbcSc6LrTB/UeHsAHlepezCUVQr3LtADtHY+LhYY4N4WJxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735607235; c=relaxed/simple;
	bh=joo35cddA2PSdnIHMUsf/jRPH/MGgWVRd5MtO45rtQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aAc6PxJUEJXFdzkCqB/bL0KXdRN5GSNp0ShhstBb324w7JeM68yReWrXd1PSvvCaR/CuWRsMG2HxlBNTO5/MJFHOne6+J/h3r14QQ9/pcJbqYcERHBgCaod+JXnyOydYyxwE2a5eJfRs/I3zyAreHPOPngnav5uh68DzOj4pCSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+bh5Klp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+bh5Klp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735607233; x=1767143233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=joo35cddA2PSdnIHMUsf/jRPH/MGgWVRd5MtO45rtQ0=;
  b=M+bh5Klp8ees+16HxwBbt90iVbcS91uHlfzbI1Y0aInSUALGzm+n1pOP
   BTHKcQ/IiJ6EKt7CP4tVFEAT4YhFWSz+59rxOHB4SjiHFHacpqOqRo68u
   Eh4dwVE8a7sudJNBIzUTUXeu3x3LzWJQXvPkrVo5mm5ffeDzm51Wagmff
   Zdjqsu4WNcKGAjYmtIopYRDi02eCdyk532J78vjuQJKMjnJvMtD5x/vwp
   9pOJiHtF4yfGUzwzBH5c2nKXoFfOOd2cxyXkcfstnzR1xp0lTW6dDqQ68
   T+uShVJGyVxGJjTSe8z4tnSzB857+X+pGfIEFTbrL6JAqfWnBc72pap3f
   w==;
X-CSE-ConnectionGUID: uQus5eEITj2tJ/DtUvVL/w==
X-CSE-MsgGUID: whnk2GUjTgK4DQ0bZB1BSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="58360047"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="58360047"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 17:07:12 -0800
X-CSE-ConnectionGUID: yKiBq9w+RpKFxT9bfC9ByQ==
X-CSE-MsgGUID: Jgd6NcXLRsa+kos2dsSqSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131862174"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Dec 2024 17:07:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSQiy-0006WF-0f;
	Tue, 31 Dec 2024 01:07:08 +0000
Date: Tue, 31 Dec 2024 09:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	George Yang <George.Yang@amd.com>, Min Ma <min.ma@amd.com>
Subject: [linux-next:master 476/5236]
 drivers/accel/amdxdna/aie2_pci.c:254:34: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202412310857.syD1sXXO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: b87f920b934426a24d54613f12ed67c03ae05024 [476/5236] accel/amdxdna: Support hardware mailbox
config: x86_64-randconfig-122-20241231 (https://download.01.org/0day-ci/archive/20241231/202412310857.syD1sXXO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310857.syD1sXXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310857.syD1sXXO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/aie2_pci.c:254:34: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/accel/amdxdna/aie2_pci.c:256:31: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/accel/amdxdna/amdxdna_mailbox.c:101:23: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accel/amdxdna/amdxdna_mailbox.c:101:23: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/accel/amdxdna/amdxdna_mailbox.c:101:23: sparse:     got void *
>> drivers/accel/amdxdna/amdxdna_mailbox.c:109:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accel/amdxdna/amdxdna_mailbox.c:109:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/accel/amdxdna/amdxdna_mailbox.c:109:23: sparse:     got void *
   drivers/accel/amdxdna/amdxdna_mailbox.c:119:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accel/amdxdna/amdxdna_mailbox.c:119:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/accel/amdxdna/amdxdna_mailbox.c:119:15: sparse:     got void *
   drivers/accel/amdxdna/amdxdna_mailbox.c:119:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accel/amdxdna/amdxdna_mailbox.c:119:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/accel/amdxdna/amdxdna_mailbox.c:119:15: sparse:     got void *
   drivers/accel/amdxdna/amdxdna_mailbox.c:232:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accel/amdxdna/amdxdna_mailbox.c:232:36: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/accel/amdxdna/amdxdna_mailbox.c:232:36: sparse:     got void *
>> drivers/accel/amdxdna/amdxdna_mailbox.c:239:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void * @@
   drivers/accel/amdxdna/amdxdna_mailbox.c:239:22: sparse:     expected void volatile [noderef] __iomem *
   drivers/accel/amdxdna/amdxdna_mailbox.c:239:22: sparse:     got void *
   drivers/accel/amdxdna/amdxdna_mailbox.c:318:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accel/amdxdna/amdxdna_mailbox.c:318:36: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/accel/amdxdna/amdxdna_mailbox.c:318:36: sparse:     got void *
>> drivers/accel/amdxdna/amdxdna_mailbox.c:344:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got void * @@
   drivers/accel/amdxdna/amdxdna_mailbox.c:344:44: sparse:     expected void const volatile [noderef] __iomem *
   drivers/accel/amdxdna/amdxdna_mailbox.c:344:44: sparse:     got void *

vim +/__iomem +254 drivers/accel/amdxdna/aie2_pci.c

   220	
   221	static int aie2_hw_start(struct amdxdna_dev *xdna)
   222	{
   223		struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
   224		struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
   225		struct xdna_mailbox_res mbox_res;
   226		u32 xdna_mailbox_intr_reg;
   227		int mgmt_mb_irq, ret;
   228	
   229		ret = pci_enable_device(pdev);
   230		if (ret) {
   231			XDNA_ERR(xdna, "failed to enable device, ret %d", ret);
   232			return ret;
   233		}
   234		pci_set_master(pdev);
   235	
   236		ret = aie2_smu_init(ndev);
   237		if (ret) {
   238			XDNA_ERR(xdna, "failed to init smu, ret %d", ret);
   239			goto disable_dev;
   240		}
   241	
   242		ret = aie2_psp_start(ndev->psp_hdl);
   243		if (ret) {
   244			XDNA_ERR(xdna, "failed to start psp, ret %d", ret);
   245			goto fini_smu;
   246		}
   247	
   248		ret = aie2_get_mgmt_chann_info(ndev);
   249		if (ret) {
   250			XDNA_ERR(xdna, "firmware is not alive");
   251			goto stop_psp;
   252		}
   253	
 > 254		mbox_res.ringbuf_base = (u64)ndev->sram_base;
   255		mbox_res.ringbuf_size = pci_resource_len(pdev, xdna->dev_info->sram_bar);
   256		mbox_res.mbox_base = (u64)ndev->mbox_base;
   257		mbox_res.mbox_size = MBOX_SIZE(ndev);
   258		mbox_res.name = "xdna_mailbox";
   259		ndev->mbox = xdnam_mailbox_create(&xdna->ddev, &mbox_res);
   260		if (!ndev->mbox) {
   261			XDNA_ERR(xdna, "failed to create mailbox device");
   262			ret = -ENODEV;
   263			goto stop_psp;
   264		}
   265	
   266		mgmt_mb_irq = pci_irq_vector(pdev, ndev->mgmt_chan_idx);
   267		if (mgmt_mb_irq < 0) {
   268			ret = mgmt_mb_irq;
   269			XDNA_ERR(xdna, "failed to alloc irq vector, ret %d", ret);
   270			goto stop_psp;
   271		}
   272	
   273		xdna_mailbox_intr_reg = ndev->mgmt_i2x.mb_head_ptr_reg + 4;
   274		ndev->mgmt_chann = xdna_mailbox_create_channel(ndev->mbox,
   275							       &ndev->mgmt_x2i,
   276							       &ndev->mgmt_i2x,
   277							       xdna_mailbox_intr_reg,
   278							       mgmt_mb_irq);
   279		if (!ndev->mgmt_chann) {
   280			XDNA_ERR(xdna, "failed to create management mailbox channel");
   281			ret = -EINVAL;
   282			goto stop_psp;
   283		}
   284	
   285		ret = aie2_mgmt_fw_init(ndev);
   286		if (ret) {
   287			XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
   288			goto destroy_mgmt_chann;
   289		}
   290	
   291		return 0;
   292	
   293	destroy_mgmt_chann:
   294		xdna_mailbox_stop_channel(ndev->mgmt_chann);
   295		xdna_mailbox_destroy_channel(ndev->mgmt_chann);
   296	stop_psp:
   297		aie2_psp_stop(ndev->psp_hdl);
   298	fini_smu:
   299		aie2_smu_fini(ndev);
   300	disable_dev:
   301		pci_disable_device(pdev);
   302	
   303		return ret;
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
