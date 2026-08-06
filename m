Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C05382F2F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 14:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026072; cv=none; b=hvT915QT8mZ3L3JBUZOW94dvJBdnQJYbyeijpSb2ZqE4rwXGXwnk5EgrdR8YJmzk2bSdwI7839akAkR8CGDty7KY1nsF7Fy7vU03itMPrBME7xFjNyVW9yCwgge77GtPBk9Et7GoGFjuvat2IzzEmYPdxela7DncWWYVvxG/rZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026072; c=relaxed/simple;
	bh=z/asV1M7HMWULw6xvslXD+G7g3F+9S1B0b7jdzc/Uyo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BCJygrMYq45Opc7K6Oo0vO+hiPat8iclZnJskeGvjv/fESjMdDyxpcEISE8iRmQxd4lsZdZerLGUYfTuko36JAZmwM+kQ7P+j2Sj7ySINma1xEQIbx+lx7RwQkKDG1Zw7TydXe2VmDmq780av2C8od5X8Q5+4g3H9NtWOHb4oK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bD/Bem6+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bD/Bem6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026069; x=1817562069;
  h=date:from:to:cc:subject:message-id;
  bh=z/asV1M7HMWULw6xvslXD+G7g3F+9S1B0b7jdzc/Uyo=;
  b=bD/Bem6+LkChbEImPVM9UdqhGklfWV8rrGK5ThaShHRjkCgytv8dfIzI
   LUQdy4GnkIDVDk62W6RQmYWLS2UOs2sZDbIVWT1IJUOZNr6sXuty67/I5
   LL0qLR9xbf6bb43Bt881bZkahX3hgJ0Tdx5bGQxxQzaDedjByahGoeoQV
   FeWFOzjwl7vSvmGGjb/0WLAu4Or4iiNNYS/nxp6xh4UUA8UN11UDegyBs
   U+xrdE05G1l7EOX2m7g6myPbZ8OuS8Iafh0u3f52VbRz4FRCPCZK9gqae
   4iB06qvM/WSRNL7ev1K4lv6PWIqZxcA2YqdT4StwfqByRH7RCdyrjuml5
   w==;
X-CSE-ConnectionGUID: NGx/cVGRQvObFS6F3ZpePA==
X-CSE-MsgGUID: 5rH1wbS7QYq2yigdLyOCfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86632705"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86632705"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:09 -0700
X-CSE-ConnectionGUID: AQL1E3SURRSR3seZhlN6AA==
X-CSE-MsgGUID: xVJgBKPGTy+wRnB8zzkU6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="266341634"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Aug 2026 07:21:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wryy1-00000000FHt-1uNB;
	Thu, 06 Aug 2026 14:21:05 +0000
Date: Thu, 06 Aug 2026 22:21:03 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 1/67]
 drivers/media/platform/apple/isp/isp-drv.h:253:29: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 4 has type
 'dma_addr_t' {aka 'unsigned int'}
Message-ID: <202608062243.xmWV34OB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Eileen,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   6b01d08e5d4d33d4a7cdfb1ecea6f78e295bfd75
commit: 329bf83de183f0558c2e5bb6ba55da3f06a2c980 [1/67] media: apple: Add Apple ISP driver
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260806/202608062243.xmWV34OB-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608062243.xmWV34OB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608062243.xmWV34OB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from include/media/media-device.h:17,
                    from include/media/v4l2-device.h:12,
                    from drivers/media/platform/apple/isp/isp-drv.h:13,
                    from drivers/media/platform/apple/isp/isp-iommu.h:7,
                    from drivers/media/platform/apple/isp/isp-ipc.c:4:
   drivers/media/platform/apple/isp/isp-ipc.c: In function 'sm_malloc_deferred_worker':
>> drivers/media/platform/apple/isp/isp-drv.h:253:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     253 |         dev_err((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                             ^~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:253:9: note: in expansion of macro 'dev_err'
     253 |         dev_err((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/media/platform/apple/isp/isp-ipc.c:227:17: note: in expansion of macro 'isp_err'
     227 |                 isp_err(isp, "failed to vmap iova=0x%llx size=0x%llx\n",
         |                 ^~~~~~~


vim +253 drivers/media/platform/apple/isp/isp-drv.h

   251	
   252	#define isp_err(isp, fmt, ...) \
 > 253		dev_err((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
   254	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
