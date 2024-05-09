Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C2B12D744
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 22:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715295574; cv=none; b=SfVu+S1Cx0pW1/s3W6EPe0sWK9zfHY3j7MA4py3A8+T30EFSDvVjrsDJUWDdZK449wC8SuTRZB4ESif3nwUVlYizy3NEmG7DzbpGys2V7thywir79av7xrmzKMB8VRI8+Rgn+h+yp194JY2YPnKZp0A8+N7sRCEE+Ij3pvS7GGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715295574; c=relaxed/simple;
	bh=JOLjyK5EaUjK5glnkWwab8P0QJBV1jpf0TTVEatpyzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BsFcVR7uykM6Yovf+uVl3mFA7Tgun2g+cRzOyaDxVqGmTtbZlSn6YZbH2QGAZAn2GuypoAF3dYaje6UZwPUFYlQFa1pP9LELi4rL4R53mBImngpaZ8B7pNTIFT6fyLPoQ4pNldXfKrweKoy2DZXcfq3krAhbGn3HQoAifsbQoHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMvQqSw/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMvQqSw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715295572; x=1746831572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JOLjyK5EaUjK5glnkWwab8P0QJBV1jpf0TTVEatpyzU=;
  b=DMvQqSw/pv7Fhu60uOXtlZ/qyKp1blc0p2Xr2+tH5T3xx2zMAr5/2SDC
   E1QlIx9W1remGlD3hPiGVEOsLkGPaPyHmY93cin7niqVhpYQRoVMv0cl0
   xVP4ls/U0JmKyiYBdNzDECQM0l9n2qqM9c5oK3kZ/Vm9UjPnPKL2dj4gx
   91lLM5uUqQEhFjb4TaNefsc10KAyL+SLV6syn5WaUSZStf4dCAAe71Ami
   SmUgkdeUBBYMGzYlMQ21Y4xLL+MIp0XrAl5AvyDGlXaEVBgqpefbn3w7K
   mTiITu5GvqnBejQydkm9/I16Kj5RmOzY3a2qmGwvwIOZXiB53b3LQrDwr
   A==;
X-CSE-ConnectionGUID: avLV0d9mS/e9HqcreBPxaA==
X-CSE-MsgGUID: aHdLBphST6WN4fXwfqDX2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21827201"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="21827201"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 15:59:30 -0700
X-CSE-ConnectionGUID: idSBwrf0RRe1KNXvEOMHUA==
X-CSE-MsgGUID: 3jV6aRQbQliyQlEaznnuUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="66848914"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 May 2024 15:59:29 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5CjV-0005TE-2n;
	Thu, 09 May 2024 22:59:25 +0000
Date: Fri, 10 May 2024 06:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: Tedd Ho-Jeong An <tedd.an@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Kiran K <kiran.k@intel.com>
Subject: [linux-next:master 11453/12321]
 drivers/bluetooth/btintel_pcie.c:607:33: sparse: sparse: symbol
 'causes_list' was not declared. Should it be static?
Message-ID: <202405100654.0djvoryZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   704ba27ac55579704ba1289392448b0c66b56258
commit: 0636fdbb117aad116d33b04dc38f346ba243e1a2 [11453/12321] Bluetooth: btintel_pcie: Add support for PCIe transport
config: powerpc64-randconfig-r133-20240510 (https://download.01.org/0day-ci/archive/20240510/202405100654.0djvoryZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240510/202405100654.0djvoryZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100654.0djvoryZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/bluetooth/btintel_pcie.c:607:33: sparse: sparse: symbol 'causes_list' was not declared. Should it be static?

vim +/causes_list +607 drivers/bluetooth/btintel_pcie.c

   606	
 > 607	struct btintel_pcie_causes_list causes_list[] = {
   608		{ BTINTEL_PCIE_MSIX_FH_INT_CAUSES_0,	BTINTEL_PCIE_CSR_MSIX_FH_INT_MASK,	0x00 },
   609		{ BTINTEL_PCIE_MSIX_FH_INT_CAUSES_1,	BTINTEL_PCIE_CSR_MSIX_FH_INT_MASK,	0x01 },
   610		{ BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0, BTINTEL_PCIE_CSR_MSIX_HW_INT_MASK,	0x20 },
   611	};
   612	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
