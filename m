Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43C1FAC49
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735925210; cv=none; b=ZMplP2AZJ53Tw/+af9LVcfve+JnyMGIle089NZnLN6ie6qmtA6N1fea8NgMo9JMV25oPqe1P2vveNj6cC2cZMRBjQHGmL8/5iCCeNKJYaxbgbJALFc0bNqntZL3JCnkycbvn+Nf+eSaWec0YM/dzLQm2KdiCeli45uTmDNv7jMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735925210; c=relaxed/simple;
	bh=a9soXkcUckaUMzyuAmIPERzPY7LVtfpCcL3tvaWJ2fI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0SXk/+9IJ7Sr3B18WYJPipYkoA0KUvESwo3x1cGtkgJzMkMWUPKlUAqTMIjJ4h0whwyxUUYUob9DXMeQOuP7KHRPXBuChXgexPzFjFEIf+miWop5RtIX+NdP9Vo5VqK5QM/2HcOlLvrGNiF7HCVWka3rfPaCC6/wSfM+NLECwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1B5lDEv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1B5lDEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735925207; x=1767461207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a9soXkcUckaUMzyuAmIPERzPY7LVtfpCcL3tvaWJ2fI=;
  b=Q1B5lDEvbowjdCCPW5Us6SzKhu0H/ulFwXGZwWBeeFm8bDwfzYdRkxdk
   V2m98XAf0oE0unqtnWkNRxBQeMxOJJ6/Owcb+Y1G4H4Zyn1YChgSSo/1c
   WaT44yd0z+13B8CtlFbL3Bu029trBQ9R0TbOZp9kDHtDLzyrnJH6sWMET
   Kifm+MSILDLGS54AowBoEJ9nYqLHF6HOhnZ7om/3/5AW/voZTfr9rPXzA
   uFD8ylbfmP/4/DgmpAuUeHC014x11Bf6TdjmCupw50ykBR/ljzDX2C3Q9
   zIfNt4x4jp6lGCvgt4ZJpt39Q9XDSoyh6lFrF7miB3QhrQ9qUrK2/bWwm
   g==;
X-CSE-ConnectionGUID: 5X6HlOA+ShKSyx/cvWmSmg==
X-CSE-MsgGUID: nvk6EhHzTWWiRyF78+6z4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47161132"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="47161132"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 09:26:47 -0800
X-CSE-ConnectionGUID: 6i5D/3iBRQiSzB++jauowg==
X-CSE-MsgGUID: 6s55VlQwRFOz72a0yASLyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101697208"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jan 2025 09:26:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTlRb-000A5u-0K;
	Fri, 03 Jan 2025 17:26:43 +0000
Date: Sat, 4 Jan 2025 01:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Min Ma <min.ma@amd.com>
Subject: [linux-next:master 483/5236]
 drivers/accel/amdxdna/aie2_pci.c:549:39: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202501040135.plFlC72Z-lkp@intel.com>
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
commit: 850d71f6bf4c2010efae845f9ff841cce902f22c [483/5236] accel/amdxdna: Add query functions
config: x86_64-randconfig-122-20241231 (https://download.01.org/0day-ci/archive/20250104/202501040135.plFlC72Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040135.plFlC72Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040135.plFlC72Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/accel/amdxdna/aie2_pci.c:27:5: sparse: sparse: symbol 'aie2_max_col' was not declared. Should it be static?
   drivers/accel/amdxdna/aie2_pci.c:311:34: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/accel/amdxdna/aie2_pci.c:313:31: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/accel/amdxdna/aie2_pci.c:549:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char *buf @@     got void [noderef] __user * @@
   drivers/accel/amdxdna/aie2_pci.c:549:39: sparse:     expected char *buf
   drivers/accel/amdxdna/aie2_pci.c:549:39: sparse:     got void [noderef] __user *

vim +549 drivers/accel/amdxdna/aie2_pci.c

   528	
   529	static int aie2_get_aie_status(struct amdxdna_client *client,
   530				       struct amdxdna_drm_get_info *args)
   531	{
   532		struct amdxdna_drm_query_aie_status status;
   533		struct amdxdna_dev *xdna = client->xdna;
   534		struct amdxdna_dev_hdl *ndev;
   535		int ret;
   536	
   537		ndev = xdna->dev_handle;
   538		if (copy_from_user(&status, u64_to_user_ptr(args->buffer), sizeof(status))) {
   539			XDNA_ERR(xdna, "Failed to copy AIE request into kernel");
   540			return -EFAULT;
   541		}
   542	
   543		if (ndev->metadata.cols * ndev->metadata.size < status.buffer_size) {
   544			XDNA_ERR(xdna, "Invalid buffer size. Given Size: %u. Need Size: %u.",
   545				 status.buffer_size, ndev->metadata.cols * ndev->metadata.size);
   546			return -EINVAL;
   547		}
   548	
 > 549		ret = aie2_query_status(ndev, u64_to_user_ptr(status.buffer),
   550					status.buffer_size, &status.cols_filled);
   551		if (ret) {
   552			XDNA_ERR(xdna, "Failed to get AIE status info. Ret: %d", ret);
   553			return ret;
   554		}
   555	
   556		if (copy_to_user(u64_to_user_ptr(args->buffer), &status, sizeof(status))) {
   557			XDNA_ERR(xdna, "Failed to copy AIE request info to user space");
   558			return -EFAULT;
   559		}
   560	
   561		return 0;
   562	}
   563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
