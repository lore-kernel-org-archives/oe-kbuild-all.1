Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49521862
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 01:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728783933; cv=none; b=R6Pm8Nfg4DZxrz9BKxBJuSHSUilrLS+yA5yzvpXERq9O2sZsNAZAduB3sY9s6BaaZXUNKcydUgPSPQHXse77HwUGuMzZ4SwrVa3c99lMF3CHK0eotLBMcLS4PZ9yGhZZw6tzifDwgoQ+yRT38+aajkisI+HhX+IV6WD7LcBvVV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728783933; c=relaxed/simple;
	bh=y+8j86Yo+eaLZ0pgnYoTskeOAXu1FF2lozIOJpKbUfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFXWrXikfX5Nc6y3yhUkkpnxMiJtP5VGwO6DwwCOnCxXZPl07UKwDk+bWkUYigW/UpoheE4LVh6/YOkzXf3eacxagtGnji5QIRdIIFBepT3iaOi/XIWx87q8zk+sOBGS8pwBfHzIPKmuEmwm3foj9rBq346lWfq1WqTqfOOSMGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgTLrHLr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgTLrHLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728783932; x=1760319932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y+8j86Yo+eaLZ0pgnYoTskeOAXu1FF2lozIOJpKbUfU=;
  b=BgTLrHLr3YN4rnxPKIP4IDTFYeZvWNMUpw7hwsoty7QfHsKktE1vQp6+
   P0eeLTylGvSPARYoqYD2Y4PXE9Y2CivWy7QA2dogAXbpBz3mzInrmF2G+
   PJV5vsgiilnXo2gMzHNIKYLZuBXbtKPqAj74jJBY1hBF2xRvq4WlB/g7W
   G475Vu5XJj7IM3dxR050SMEbcX0eVQhkYd2hcCGxDkVSYcl3u3VkciCgl
   8y3IRHARmNvomBs+7RZctxDbqIefmZOd5O9AuguwCtGDuK6iTukbSyJmT
   yiRNdA8aILqeZjOS/jR85EKcayoeUnJVSnhtOKpnVfsw6iLgLewVwB6nW
   w==;
X-CSE-ConnectionGUID: M1XarfaQSPm03NdBWJP/IQ==
X-CSE-MsgGUID: RcnhaEdjThqQiLW88ozdcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31957519"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31957519"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 18:45:32 -0700
X-CSE-ConnectionGUID: ghFygR1ySxGP7GD7qcyU6w==
X-CSE-MsgGUID: YNMjtsaOQA6uapn0wHJ1hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77104563"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Oct 2024 18:45:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sznfj-000DxP-39;
	Sun, 13 Oct 2024 01:45:27 +0000
Date: Sun, 13 Oct 2024 09:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 256/382] WARNING: modpost: module
 dma-buf-phys uses symbol dma_buf_unmap_attachment from namespace DMA_BUF,
 but does not import it.
Message-ID: <202410130927.pen12PCq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   451df8c0a2a3bcf0656b2f6fdc49d6fb4d05f186
commit: a6d074da1a95aa77f6d6315d7c454623ff578a7e [256/382] HACK: misc: Add dma-buf to physical address exporter
config: sh-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241013/202410130927.pen12PCq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410130927.pen12PCq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130927.pen12PCq-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module dma-buf-phys uses symbol dma_buf_unmap_attachment from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module dma-buf-phys uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module dma-buf-phys uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module dma-buf-phys uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module dma-buf-phys uses symbol dma_buf_attach from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module dma-buf-phys uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
