Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365A96FC7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 01:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713232343; cv=none; b=Rb28qvO5ud0eSqSM3uAI7XGc76i4AWaFveXzDQRlKn+xFTXFO1hLR8t46Xdb5qzmYXEHJn4XhIyD0bYLgJpdF//wx5PysVLbipQQ6zZ6NslJmkzyI4A/eP9Ng9Di/QdXj19r3XYp2CKPJYYPl0iPtYbF4m86qPFsUvcmkq9f3HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713232343; c=relaxed/simple;
	bh=GlvL6V1VSlfareo7VbX0/euGZXdXlqLfKhxENgFXy7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eqvw5q0HC25R2Gz1mUOyOHQq+e8wnWmVGouTh8rBxjrq4Sl2/DNbUgJNMBpF5LThp9Ahs6dgi6p7oai4Cw8xKcm8XrvOJ6SAMyEpbIvX1HRWDwgKLvHHq5zQvfhKVoV1VOgPa4OzFBqJHIH2JmCLjHzp6OWAxJI9iW8h/cT0N4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrS1Uk4D; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrS1Uk4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713232341; x=1744768341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GlvL6V1VSlfareo7VbX0/euGZXdXlqLfKhxENgFXy7E=;
  b=RrS1Uk4DhYfHn4NUr7u1p+hZoBUo8bRxLUsziRBt7HVpEHHdfdNfGlU7
   LjK+MvJWNqutRQLasq891cLungICClwn/3X2S9PY2Ld1MeXdFQtsYCTw0
   A3Ldpio0pU//Z6wfihWV+d5vu4F/A/xpXVMuS6irxvT7/Mhq7OEINfMNR
   GmAS/iRl6HDBGwL2HdjXBEd0xx5vZ1HTOSbxzsHyjyzNQei9XqklQZAGB
   eDyKTBA2Jo9IW0lYFWydBKP3vSzEtpDoO8ipJz4mHt2krIjBtSfntoovP
   4hZLd1zDzhtb1PpM6FDt7FvNLgA/qyZza8s2aA5Vm2Vb3CQHaqULXPtx4
   g==;
X-CSE-ConnectionGUID: bmAwUvivTHaRJzsMpbDaHg==
X-CSE-MsgGUID: TaJxmsmISLmYMoGQ7br+DA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19209229"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="19209229"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 18:52:20 -0700
X-CSE-ConnectionGUID: TpPPW4leRwau2RgNA3/R9w==
X-CSE-MsgGUID: XionoGq8Q7aoE71kp5d29Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="45384721"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Apr 2024 18:52:19 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwXzd-0004pc-0s;
	Tue, 16 Apr 2024 01:52:17 +0000
Date: Tue, 16 Apr 2024 09:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14630/22116]
 drivers/net/xen-netback/interface.c:170:49: sparse: sparse: dubious: !x | !y
Message-ID: <202404160915.wAO7ibZH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Juergen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b152f5a5ef7efe0b5bf8de2aae6e73a549d0d223
commit: b8f0cb59f64793764cac8b6db7bee9b6157ceb7e [14630/22116] xen/netback: use lateeoi irq binding
config: arm64-randconfig-r111-20240331 (https://download.01.org/0day-ci/archive/20240416/202404160915.wAO7ibZH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240416/202404160915.wAO7ibZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160915.wAO7ibZH-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccKkN2Zj.s: Assembler messages:
>> /tmp/ccKkN2Zj.s:1072: Error: immediate out of range at operand 3 -- `bic w0,w1,5'

sparse warnings: (new ones prefixed by >>)
>> drivers/net/xen-netback/interface.c:170:49: sparse: sparse: dubious: !x | !y

vim +170 drivers/net/xen-netback/interface.c

   160	
   161	irqreturn_t xenvif_interrupt(int irq, void *dev_id)
   162	{
   163		struct xenvif_queue *queue = dev_id;
   164		int old;
   165	
   166		old = atomic_fetch_or(NETBK_COMMON_EOI, &queue->eoi_pending);
   167		WARN(old, "Interrupt while EOI pending\n");
   168	
   169		/* Use bitwise or as we need to call both functions. */
 > 170		if ((!xenvif_handle_tx_interrupt(queue) |
   171		     !xenvif_handle_rx_interrupt(queue))) {
   172			atomic_andnot(NETBK_COMMON_EOI, &queue->eoi_pending);
   173			xen_irq_lateeoi(irq, XEN_EOI_FLAG_SPURIOUS);
   174		}
   175	
   176		return IRQ_HANDLED;
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
