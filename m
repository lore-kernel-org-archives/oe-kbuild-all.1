Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A11F14283
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKQ4vhR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702128860; x=1733664860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RqYroMB5FAFlAh3GByKkNBZrftUVSn5D9VOJiK9cRR4=;
  b=iKQ4vhR4q+Fl8n4byxKOrdVnaQc0aX+z1BYH3LNadSb2l0zlNALadx9F
   lJsTw8LroBoKYMMC2ocWN6ipdB6JuwVAmQTYIPlptC8QL6D6/19JQlRnA
   UQ4T2rDLpYBaOe/Sd3cD3qbLuggvLh2bsw9WJka74/9zMb+TTA+TRpVaJ
   XNDttrIW48cO3FwIMRpqnj84GgvW6HdyDnPIk+YDIS/1PK/RT+wX7nO8m
   jhYgx0vf46AeJYjwlXS+eX0e8Qaw3XF20aohSsCKAx6Wl/6hfyqtoID6r
   rW3Ak0Tkvu2lqYmsVxGOAn95AM1ebvEpICcR7OKVH5AaCppRVI5W0DM3B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="458826647"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="458826647"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 05:34:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890482093"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="890482093"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2023 05:34:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBxTE-000FNt-0M;
	Sat, 09 Dec 2023 13:34:16 +0000
Date: Sat, 9 Dec 2023 21:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@iot.bzh>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: drivers/remoteproc/rcar_rproc.c:28:12: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202312092135.RU2Mc1xl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: 285892a74f1370a12249f765c6a4e3b16194852e remoteproc: Add Renesas rcar driver
date:   2 years ago
config: openrisc-randconfig-r131-20231102 (https://download.01.org/0day-ci/archive/20231209/202312092135.RU2Mc1xl-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312092135.RU2Mc1xl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312092135.RU2Mc1xl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/rcar_rproc.c:28:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/rcar_rproc.c:28:12: sparse:     expected void *va
   drivers/remoteproc/rcar_rproc.c:28:12: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/rcar_rproc.c:45:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *va @@
   drivers/remoteproc/rcar_rproc.c:45:20: sparse:     expected void [noderef] __iomem *addr
   drivers/remoteproc/rcar_rproc.c:45:20: sparse:     got void *va

vim +28 drivers/remoteproc/rcar_rproc.c

    20	
    21	static int rcar_rproc_mem_alloc(struct rproc *rproc,
    22					 struct rproc_mem_entry *mem)
    23	{
    24		struct device *dev = &rproc->dev;
    25		void *va;
    26	
    27		dev_dbg(dev, "map memory: %pa+%zx\n", &mem->dma, mem->len);
  > 28		va = ioremap_wc(mem->dma, mem->len);
    29		if (!va) {
    30			dev_err(dev, "Unable to map memory region: %pa+%zx\n",
    31				&mem->dma, mem->len);
    32			return -ENOMEM;
    33		}
    34	
    35		/* Update memory entry va */
    36		mem->va = va;
    37	
    38		return 0;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
