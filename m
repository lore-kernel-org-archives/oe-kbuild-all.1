Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAD910E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Sep 2025 00:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759019767; cv=none; b=ka9G6zDEPJZY/EBPn8RG0DRzbykCLsjB+jHr6HosyGE292Be5xK5hVKWJUvSzXT9ZaeVDpLIiyWOQkeYEHBE7F1bB55jXOj1EA6jKHRTJJKviipqx8qFeidlXFlCRZFnBYkBAgFs2+9dw+cZLCXkvA/u3g9gQqZWs4Hn8/tqs+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759019767; c=relaxed/simple;
	bh=/Zs1l2PvXE+2r1ie6NPgHI95HVkjOnbmEig/+WQCVo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+emEr2MiK/qAXrO1ZgV8QkBhYqC8HA0u6vdzohUP0hDwQfW60z8hsaqbUtbuE1GAi+sgPnJV+XZK94UOadqZBUTxuIHD12znyw74tmaLgCteeOlYXq/XBFP438a42oW6DnSHdDmfVFmskKBudUEtali42cQl/jNWcPQvfRIrq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cG1QVv2G; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cG1QVv2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759019765; x=1790555765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Zs1l2PvXE+2r1ie6NPgHI95HVkjOnbmEig/+WQCVo4=;
  b=cG1QVv2G67qFfFjzNIPUJpZfORFp+xmyL0gbhCaXmHHA/8NE1WQxbmiE
   iDBmXiMu4/s5x2JBb2M8PapADTK8+Z4IOayiV8vur5H6Cn6vPV0XsfyC6
   Llz8xl34r4sgeY0iyA4Plhp8vLwCeadQqoIvL/hvsUKKhQAIJztPNYauo
   2B3BywrjOJ85R4WaosnYtRthZIdH2aJdfggGk24HwZAkH7twzUsqYKNNM
   vxNjeHHsmSgQnpxy/y3r3od9Ecygh+aplaHbBLkX+jBIe+AjG7VIP79qk
   FdE32JDfK2zuJXW3+WKPqJlt/Nh9jNceNojUco+rhAX+101K8rdsHk5F/
   Q==;
X-CSE-ConnectionGUID: fTh+uYX5Q5ukpsGo7HGYqQ==
X-CSE-MsgGUID: Ru+2K39TQsqQwYbBQ7KLRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="71985727"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="71985727"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 17:36:04 -0700
X-CSE-ConnectionGUID: L2yKFI+cT/C1HwtLT/IZ6A==
X-CSE-MsgGUID: bBezNWQXROO4CHQoJfQhlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="177044844"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Sep 2025 17:36:02 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2fON-0007QN-1D;
	Sun, 28 Sep 2025 00:35:56 +0000
Date: Sun, 28 Sep 2025 08:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Xinpeng Sun <xinpeng.sun@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Kosina <jikos@kernel.org>,
	Even Xu <even.xu@intel.com>
Subject: [linux-next:master 10265/12740]
 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c:469:49: sparse:
 sparse: cast to restricted __le16
Message-ID: <202509280841.pxmgBzKW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   262858079afde6d367ce3db183c74d8a43a0e83f
commit: 0b1fca9dce44d0d2a8f4c55df1e4149744934a91 [10265/12740] HID: intel-thc-hid: intel-quicki2c: support ACPI config for advanced features
config: x86_64-randconfig-r121-20250928 (https://download.01.org/0day-ci/archive/20250928/202509280841.pxmgBzKW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280841.pxmgBzKW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509280841.pxmgBzKW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c:469:49: sparse: sparse: cast to restricted __le16

vim +469 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c

   445	
   446	/**
   447	 * quicki2c_dma_adv_enable - Configure and enable DMA advanced features
   448	 * @qcdev: Pointer to the quicki2c_device structure
   449	 *
   450	 * If platform supports THC DMA advanced features, such as max input size
   451	 * control or interrupt delay, configures and enables them.
   452	 */
   453	static void quicki2c_dma_adv_enable(struct quicki2c_device *qcdev)
   454	{
   455		/*
   456		 * If platform supports max input size control feature and touch device
   457		 * max input length <= THC detect capability, enable the feature with device
   458		 * max input length.
   459		 */
   460		if (qcdev->i2c_max_frame_size_enable) {
   461			if (qcdev->i2c_max_frame_size >=
   462			    le16_to_cpu(qcdev->dev_desc.max_input_len)) {
   463				thc_i2c_set_rx_max_size(qcdev->thc_hw,
   464							le16_to_cpu(qcdev->dev_desc.max_input_len));
   465			} else {
   466				dev_warn(qcdev->dev,
   467					 "Max frame size is smaller than hid max input length!");
   468				thc_i2c_set_rx_max_size(qcdev->thc_hw,
 > 469							le16_to_cpu(qcdev->i2c_max_frame_size));
   470			}
   471			thc_i2c_rx_max_size_enable(qcdev->thc_hw, true);
   472		}
   473	
   474		/* If platform supports interrupt delay feature, enable it with given delay */
   475		if (qcdev->i2c_int_delay_enable) {
   476			thc_i2c_set_rx_int_delay(qcdev->thc_hw,
   477						 qcdev->i2c_int_delay * 10);
   478			thc_i2c_rx_int_delay_enable(qcdev->thc_hw, true);
   479		}
   480	}
   481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
