Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792840818;
	b=vC66UuBeEqtLALY8dcbO3dNB1frWlSQlE0tKQPyxc/piMKYLh0jAKN/KYH/Dw59PvJM/
	 ky4BZLypM4/dDz6VkQLnCeiBB3jBHkwtgB+C3a2p7QT/LOZ/SSN0eHvpzX7i8Nq6rWdW5
	 yYTBKSaL0mS1TjVEwKOULffjjpuO75G6GTaarZo249urjkZf242waxVZtFirDwI9hCa7Q
	 dKExr4drPiHTMsdoFk0CPJF6tljzltT/m9Xa5i70BtR7X8d11YRuZXdbUEaCIc4PVtEUZ
	 EDZne3kkXXqfBWtm15nKHeIxaOsggYssC7hmWfxVd6MvIo7h2E2GS7xq3xyJ9BWWuMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792840818;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IC5yWO9Rhi+RD1ShAF2GChcdWnCyGC0yXXl7UUedZ4M=;
	b=qcbzPPNHPzEWLh/iz+2mEiYmru3+5+sessrZhGSj8xBEIIVo5cOag9gQmIOMKyERx6RI
	 QIKf/IVVGe7oUJPeZkZFmdg9MBYFKcBdNYTCLaxd+g12gV55fG1yMOPDHR+gDTiORilvl
	 M6sQggjXiMXCpN5eiz7jA4+KwUvtC4IDO9Jbibi0q6oVXM85gN415aFmb9W2Qp0p5yvfV
	 PeVi52wFYuBBDCR8RC0/zXCNnnCQeKVdI9cgJ9BJVXXiB7+hflHIM512wDnv1qqNBEFml
	 KI43IYexlGOQXn2Dlda+kDDEjBKH6pCw0PNeTzvfZ0PAaTHRvADONbIa8Op/mTBy1lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hoqpmifN;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C773C606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 11:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C773C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hoqpmifN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792840817; x=1824376817;
  h=date:from:to:cc:subject:message-id;
  bh=JJCfp3uI5JJ7K3SUDvdcpkvi7XKtvzj7FovN9wkSEFE=;
  b=hoqpmifN0XVMZNEV+30h9lsg1txyA0OqNcfOzWDqrGus/lDwFQpnYLj4
   3YpO2OrIt3OXqIEGbcuXPF3UbZPsfmviKzLg8WmwIdyTqLDWTfy4f4ZRP
   bvOlbsiPoCc1/oV0HHxRVPGDeYiyXDl4Oa/O6Xa0J+w4d1SMDWZEmN3WM
   ajlKfSqMFTD7VseSMBfsU1g4/NJ2lKaVahixS+dnABEFmUMTheQyLF1ZI
   EdV2MtWyFeG8oTLQuaPg1CXvKHExu9chzaLqzIoK2u5PBod+kWGxW3liR
   2JRzyQR6U3XV9kAkEph4G9R5rlvlKBo6qVIINxkypwjlNa99FbO9pbkoQ
   A==;
X-CSE-ConnectionGUID: PTgG61npRI+eibr97PSeTg==
X-CSE-MsgGUID: 81pqaV9FSpWIuUZt5JOtKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1453415"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1453415"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 04:20:17 -0700
X-CSE-ConnectionGUID: I9NnwyioTQitu1p8bJWAiw==
X-CSE-MsgGUID: poUgPe4yT5GrO4RkkAKdYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="3870080"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Oct 2026 04:20:15 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKZnI-00000000ToI-12zN;
	Sat, 24 Oct 2026 11:20:12 +0000
Date: Sat, 24 Oct 2026 19:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/dma-buf/dma-buf.c:345: warning: Function parameter or struct member
 'name' not described in 'dma_buf_set_name'
Message-ID: <202610241904.yTdSMAJx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Guangming,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e64d278d669fa423e1337ad06c6672336c13bea9
commit: 88a96b0b27bcdda732e9d4e9d35cefad8ea7ffd9 [2/2] ANDROID: dma-buf: support users to change dma_buf.name
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20261024/202610241904.yTdSMAJx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241904.yTdSMAJx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241904.yTdSMAJx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:345: warning: Function parameter or struct member 'name' not described in 'dma_buf_set_name'
   drivers/dma-buf/dma-buf.c:345: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'


vim +345 drivers/dma-buf/dma-buf.c

   330	
   331	/**
   332	 * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
   333	 * It could support changing the name of the dma-buf if the same
   334	 * piece of memory is used for multiple purpose between different devices.
   335	 *
   336	 * @dmabuf: [in]     dmabuf buffer that will be renamed.
   337	 * @buf:    [in]     A piece of userspace memory that contains the name of
   338	 *                   the dma-buf.
   339	 *
   340	 * Returns 0 on success. If the dma-buf buffer is already attached to
   341	 * devices, return -EBUSY.
   342	 *
   343	 */
   344	long dma_buf_set_name(struct dma_buf *dmabuf, const char *name)
 > 345	{
   346		char *buf = kstrndup(name, DMA_BUF_NAME_LEN, GFP_KERNEL);
   347		if (!buf)
   348			return -ENOMEM;
   349	
   350		_dma_buf_set_name(dmabuf, buf);
   351	
   352		return 0;
   353	}
   354	EXPORT_SYMBOL_GPL(dma_buf_set_name);
   355	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
