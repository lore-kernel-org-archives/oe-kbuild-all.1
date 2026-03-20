Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BC33D3D0E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 17:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027079; cv=none; b=drv6jmnOYh+sfG8BrVf5P4HT6Bw6cM6mFZSkzRkIwuabdGefP8z6hK07JornOSn7U5ZWYyvSSpMw2X8nW9IAQngwAMJy/34gTTTsrkpXXENniEKon/hOAtfv79eQfYh9IHtfzcN7TjKIzsrLn8sI0k85oAVbsVERJgodNJlegwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027079; c=relaxed/simple;
	bh=mk04EbwiBMrGyO+nf7/ilpM8Kc1oq3I6zTN3J7qD89k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ct8JoheFH0IBblzHrOdZ7/yVvuiYMWL7bJDQ1SeVUuTp93jxT7zQ2uq+bEy5zKucoXgprehlqnUOTEhNsNppg9OOEXZXSllFoa+MhupNrGsvBV+jem/UpdhFUgHNXJ0i/T/gJQgVwZ/1MAfXPGgOSk+Al2UqnZPKiu8y5O9wgzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfgxWqXf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfgxWqXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774027077; x=1805563077;
  h=date:from:to:cc:subject:message-id;
  bh=mk04EbwiBMrGyO+nf7/ilpM8Kc1oq3I6zTN3J7qD89k=;
  b=ZfgxWqXfAaIOjY3U7DH/xjBGKUi5DWtHP/SGjSSuVgctQDIPwjgpIaQa
   69mSsIT6U2eTrDsd2Y9Hbt0i5l25Er5tGUwfbDJ8yTknPuVRy3TWYtHbA
   3Hm/7tlz5ifKxJTFmgic+RHg2g5uP5BEd5EWZjF3bPt37i8aI5eLpNTgE
   PDIeJq8IXRmecW8Ol+8+HPxT7NeCediFB5rdAWAZcchadCw5Ykh/iHma/
   a2iaH1BZfC3jHqUm0NYjEQofX7I7zhyM6j6r0CBjF+tAYo0cfurk7qTII
   kS4+YE9w0qe2A/9qbCt0sGAMJaB/9J5QTagzm05MmCwpTHPkutDZfTGXd
   Q==;
X-CSE-ConnectionGUID: jwu8Z1kqTGGNmjtayi8J1w==
X-CSE-MsgGUID: n3l366afRPmspIUIqC6OzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="85432066"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="85432066"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 10:17:54 -0700
X-CSE-ConnectionGUID: eg5eFVTnRFWKwUhWwlxEqw==
X-CSE-MsgGUID: AK2DuZynSo2PSCIX2yoAPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="246375759"
Received: from lkp-server01.sh.intel.com (HELO ba623fe84fe1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2026 10:17:52 -0700
Received: from kbuild by ba623fe84fe1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3dTp-000000000D7-2SCd;
	Fri, 20 Mar 2026 17:17:49 +0000
Date: Sat, 21 Mar 2026 01:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: drivers/remoteproc/imx_dsp_rproc.c:668:20: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202603210118.PhZohwTv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e4f8f1a3d081e834be5fd0a62bdb2554fadd307
commit: a84a1e21c0678032f1185173f816cbb500a87877 remoteproc: imx_dsp_rproc: Fix multiple start/stop operations
date:   3 months ago
config: arm-randconfig-r111-20260320 (https://download.01.org/0day-ci/archive/20260321/202603210118.PhZohwTv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210118.PhZohwTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210118.PhZohwTv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/imx_dsp_rproc.c:653:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/imx_dsp_rproc.c:653:12: sparse:     expected void *va
   drivers/remoteproc/imx_dsp_rproc.c:653:12: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/imx_dsp_rproc.c:668:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *io_addr @@     got void *va @@
   drivers/remoteproc/imx_dsp_rproc.c:668:20: sparse:     expected void volatile [noderef] __iomem *io_addr
   drivers/remoteproc/imx_dsp_rproc.c:668:20: sparse:     got void *va

vim +668 drivers/remoteproc/imx_dsp_rproc.c

   664	
   665	static int imx_dsp_rproc_mem_release(struct rproc *rproc,
   666					     struct rproc_mem_entry *mem)
   667	{
 > 668		iounmap(mem->va);
   669	
   670		return 0;
   671	}
   672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
