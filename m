Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78791D131D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 02:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724984088; cv=none; b=jVs4nHDtrkN1nvsh4SLBYpoC9vjxSVWSS9OBnhAfOqPPpBa6fn9ulcFhVh71zX/YXmH4BpBef7PTJFzTMDPGAJUfuweb+q9r+3JnTx6StWnH2tHHUYX+8eeY5tg7wxxFpTn6V1/+YlfNsgGf1URe4eENOr1V0eT/2HB38GcYamE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724984088; c=relaxed/simple;
	bh=pjTLxCHWJUCWw2Dl+1m0/7z0L4EDrkBaYCQc/LxlS+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MTOf5rmXVs4TGiqJh921kU04BLvbT9IOTeIgX3m7Ln6VTBzCuiUO/nG+cEhIFzH9yZ3VXAtbAGHfrv+YHyMCEd24MuZvQYfjYmDcTnCQyDaQq8Chtu8KC7KQcNs3Rp3D/NOLOhFwkteaJiE0TBJrdi6VSebeoHjzNBkOWNqGLlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXbWyofW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXbWyofW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724984088; x=1756520088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pjTLxCHWJUCWw2Dl+1m0/7z0L4EDrkBaYCQc/LxlS+8=;
  b=NXbWyofWmbPdlfehnudwVm/HUoatMOe4Nuv2pTYRaR1Jmn+T7AQFSAPH
   HQ6+mVncbrdWyvam2ejAqqzqL7x7P3Vqu8DQyo7OXqpj40p1fwNUTl0i6
   z50UjCmagNvYJkPUrK7lT+zUcULyDsGTtzpyASP6aU5B2tHen610gUBox
   uBADWJv10mXqzTUuZY+pqZgIc43uBXBhulsPIWhVD69+xDgjVOuYjZUV+
   Tg4bepCS8APebvfJi5KhpHi6ahgE4+ADLnayd7vkrZ4DLzLr8Ash+SlH/
   xKEWIiJDBD3HaimjawSg0Hz/7l7haRnCseQDvG5+t/l0ODCwNZ0ihoXdN
   Q==;
X-CSE-ConnectionGUID: HM/E9c3xQUaNV/BiKxJ66w==
X-CSE-MsgGUID: hQKcU3YsS0mtwNzDxEn47Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="48995498"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="48995498"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 19:14:47 -0700
X-CSE-ConnectionGUID: tjk+EjigSOODX4pa/xf83g==
X-CSE-MsgGUID: vZgc04nCQEO8fxRWAyqIQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="64109217"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Aug 2024 19:14:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjr9v-0000u8-09;
	Fri, 30 Aug 2024 02:14:43 +0000
Date: Fri, 30 Aug 2024 10:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg 2/7] drivers/virtio/virtio_msg_mmio.c:79:17:
 error: implicit declaration of function 'writeq'; did you mean 'writel'?
Message-ID: <202408301051.o1ZXSrfe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg
head:   1e5e683a3d1aa8b584f279edd144b4b1d5aad45c
commit: c104c4c3d684ae1ca8c7d3ead145d28a1a7a8f7b [2/7] virtio: Add support for MMIO based channel bus
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240830/202408301051.o1ZXSrfe-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408301051.o1ZXSrfe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408301051.o1ZXSrfe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_msg_mmio.c: In function 'virtio_msg_mmio_send':
>> drivers/virtio/virtio_msg_mmio.c:79:17: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Wimplicit-function-declaration]
      79 |                 writeq(*(data + i), addr + i);
         |                 ^~~~~~
         |                 writel
>> drivers/virtio/virtio_msg_mmio.c:87:31: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Wimplicit-function-declaration]
      87 |                 *(data + i) = readq(addr + i);
         |                               ^~~~~
         |                               readl


vim +79 drivers/virtio/virtio_msg_mmio.c

    68	
    69	static int virtio_msg_mmio_send(struct virtio_msg_device *vmdev,
    70					struct virtio_msg *request,
    71					struct virtio_msg *response)
    72	{
    73		struct virtio_msg_mmio_device *vmmdev = to_virtio_msg_mmio_device(vmdev);
    74		int i, len = sizeof(*request) / sizeof(u64);
    75		u64 *data = (u64 *) request;
    76		u64 *addr = vmmdev->base;
    77	
    78		for (i = 0; i < len; i++)
  > 79			writeq(*(data + i), addr + i);
    80	
    81		if (!response)
    82			return 0;
    83	
    84		data = (u64 *) response;
    85	
    86		for (i = 0; i < len; i++)
  > 87			*(data + i) = readq(addr + i);
    88	
    89		return 0;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
