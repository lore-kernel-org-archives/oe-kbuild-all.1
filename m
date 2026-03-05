Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDF7372EF3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704247; cv=none; b=hScvflPHxfHs57vReiC5gAgikUtUm3+67s8B3DyS0wdrqwzKZtNbi0BKMdOe3t1BayArhlNawe7MeOu0kXlnIbWQRUtxXTwzXCNeV8Yfc8lww7f7D+l4yuiTuA3pY3Dg357R44NnEWo2j6Zo+ojiumFgP2kVGv/AagrOfHcmuqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704247; c=relaxed/simple;
	bh=layEtx+Amccq7TRRP9DLoYlCABP3IxC8UT+9WYsJo/U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oXdUOD2NNx3W/Er2IOKdCb7WaEVTju39vyfRjV8r8+lL6qnDTZ41dUtRmmsQflSimzzZUVzNX9TksrmJc+datyDJIaCjueuOIj3s1cE5HD4vNjvQDshAUx3aos8Zx1ZEUtrR+Ih0cxC6bkBvdAryakRayeRPHeP5WBfjyG0blTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgAJnKIT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgAJnKIT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772704247; x=1804240247;
  h=date:from:to:cc:subject:message-id;
  bh=layEtx+Amccq7TRRP9DLoYlCABP3IxC8UT+9WYsJo/U=;
  b=kgAJnKITW6VaCzoMsENrqC0IduZRbWaCWiS0GSczwl52cskTdsRBp8Yz
   aQzX3+kgwP3YC1je423MNUf8ZFMMd9ailMRWLS7vFMFDO47Z8QoofWfYc
   L/kAOwnq9nsMbP0vIU3Jb3hTjvCDDtpViMCyoN6jFarc8J6M20UulcYtU
   Se7IwqaVOGWYVdsIIRCC7xVgkNPS17MRLiKpd+tKgFfTud3u4hx5JZHhe
   FQFpQwFwlS8htGGzeqx6iV/7HIoGIhVf/5cziA9wVw0jH/CceSaHjuj53
   iNXapqavoANbHdXAfH9MRIsBVSMDZuV/CGCLeV17hI6KKbtYuDxIiXTMX
   Q==;
X-CSE-ConnectionGUID: qCJHwQQlRZqL7+Xf0wlG3A==
X-CSE-MsgGUID: IbyH6XWVQvaqAh/SsC2jhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77658287"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="77658287"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 01:50:46 -0800
X-CSE-ConnectionGUID: +BJaCc0hSk+0H1viYIdLpg==
X-CSE-MsgGUID: oB9yAUSaTAu4INWTeHDUHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="216908483"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2026 01:50:44 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy5Lu-000000000Qu-18TN;
	Thu, 05 Mar 2026 09:50:42 +0000
Date: Thu, 05 Mar 2026 17:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.6.y 0/683]
 drivers/dma/fsl-edma-main.c:234:3-10: line 234 is redundant because
 platform_get_irq() already prints an error
Message-ID: <202603051739.aqOqFr2V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.6.y
head:   682d8e2f892b73c2f574684c8dd6b625361b4c03
commit: 72f5801a4e2b7122ed8ff5672ea965a0b3458e6b [0/683] dmaengine: fsl-edma: integrate v3 support
config: i386-randconfig-053-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051739.aqOqFr2V-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051739.aqOqFr2V-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/fsl-edma-main.c:234:3-10: line 234 is redundant because platform_get_irq() already prints an error

vim +234 drivers/dma/fsl-edma-main.c

   218	
   219	static int fsl_edma3_irq_init(struct platform_device *pdev, struct fsl_edma_engine *fsl_edma)
   220	{
   221		int ret;
   222		int i;
   223	
   224		for (i = 0; i < fsl_edma->n_chans; i++) {
   225	
   226			struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[i];
   227	
   228			if (fsl_edma->chan_masked & BIT(i))
   229				continue;
   230	
   231			/* request channel irq */
   232			fsl_chan->txirq = platform_get_irq(pdev, i);
   233			if (fsl_chan->txirq < 0) {
 > 234				dev_err(&pdev->dev, "Can't get chan %d's irq.\n", i);
   235				return  -EINVAL;
   236			}
   237	
   238			ret = devm_request_irq(&pdev->dev, fsl_chan->txirq,
   239				fsl_edma3_tx_handler, IRQF_SHARED,
   240				fsl_chan->chan_name, fsl_chan);
   241			if (ret) {
   242				dev_err(&pdev->dev, "Can't register chan%d's IRQ.\n", i);
   243				return -EINVAL;
   244			}
   245		}
   246	
   247		return 0;
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
