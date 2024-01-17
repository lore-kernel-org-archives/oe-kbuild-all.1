Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5193179C2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 04:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705465909; cv=none; b=pCW8cRopie5+yoGxuaRlvIM+fadqude8ZlzxgPYVjCn/SBbcgnb4Z4KDVUPa2Sxlsyh1IGkpWQYl4jMkUScP2Y2dyh1u0fT02Anz3695f+GwVRZ2D1o9u97eW/xeC5EXoHF/mLBbwRfFMySGKSEkJsd4/aD05RDiEH6I9mYRQV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705465909; c=relaxed/simple;
	bh=ifV3ANuXtyCO4cFPbJ6KyXZso0fZ7mdYZosd04SbJQM=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=XFfWqrm8AsI2EB+rsizwfECKv9fUfkHmccsR+9MpbHlQS/Q7FpFhZTYQf4jn2GxfOomUVsAZ4vKd/5P0YSo8mdlGcMyjnn6tki+1vLWkhxZHPt4IsX5C+Ic7nFu85y+9falFUAhvvsZT2O1Sl6HdXiPYMF72pYkPKHgsM7X/jss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBqeDo0P; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBqeDo0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705465907; x=1737001907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ifV3ANuXtyCO4cFPbJ6KyXZso0fZ7mdYZosd04SbJQM=;
  b=VBqeDo0PvyFp2OQwIRxEFbj/AHPzjkKMkICF0I1lkAzev50niCs9Xv3S
   KKNf+iWQgO2bWxZse4aFgUf4QQAies3D2Dqsq7lCKrIoaBqTt2TSYihzO
   i+D61MHQvH5JjkLb8EZRUgyxfWrAE/wP84GnxZbJ4PS+EjGj51TIBxxmt
   dptvEMWxbGiCIYxOTlPhTkvYiMGZB7/B1BAuaElB7xpdhfZRjO9YxbrC9
   NhA+c26ePZuxaIFXQi5TDcgV+Mh2yB26RsCsPPkFOwslzzgoSRnwrRFnB
   F0uZNkkb/5Sw+h9AIdQUQCUE7xjtbWKmrrlve/i7tWKbBDk0tXvWMF+Xb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="398936848"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="398936848"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 20:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="26034233"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 20:31:46 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPxaY-0001am-2L;
	Wed, 17 Jan 2024 04:31:42 +0000
Date: Wed, 17 Jan 2024 12:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29756/30000]
 drivers/irqchip/irq-gic-v3-its-platform-msi.c:15:20: warning: no previous
 prototype for 'vp_get_irq_domain'
Message-ID: <202401171215.UCpSxsgp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e4bd0053052e24e0c30e34d05ec042203c41976c
commit: db0a347cea38c38e957a7239689069d8c4ec5005 [29756/30000] irqchip/gic-v3-its: Add virt platform devices MSI support
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240117/202401171215.UCpSxsgp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401171215.UCpSxsgp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401171215.UCpSxsgp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3-its-platform-msi.c:15:20: warning: no previous prototype for 'vp_get_irq_domain' [-Wmissing-prototypes]
      15 | struct irq_domain *vp_get_irq_domain(void)
         |                    ^~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3-its-platform-msi.c:52:12: warning: no previous prototype for 'iort_pmsi_get_dev_id' [-Wmissing-prototypes]
      52 | int __weak iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/vp_get_irq_domain +15 drivers/irqchip/irq-gic-v3-its-platform-msi.c

    14	
  > 15	struct irq_domain *vp_get_irq_domain(void)
    16	{
    17		if (!vp_irq_domain)
    18			pr_err("virtual platform irqdomain hasn't be initialized!\n");
    19	
    20		return vp_irq_domain;
    21	}
    22	EXPORT_SYMBOL_GPL(vp_get_irq_domain);
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
