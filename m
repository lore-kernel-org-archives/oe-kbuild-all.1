Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DCB378D76
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 14:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372818; cv=none; b=L201kQr7/BCearYacbRYENX/bGy8WrvqK9MDlaFY63LnglGS9dJUggw/VfCImYAcwysTIrnsQdFSqGHX2l47YbzhwvJvHeA98R+cKfnM80UrxS39mWD8rAwDN7/r2MMCc/5g/tut1NbR0LnWD1nug14TuaBNjZmdQPFqOio3dhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372818; c=relaxed/simple;
	bh=CNky1ZijymGzAWMQRH5lhbKE74GVu3y5O9Q5pZdxUQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YIwasljpcsMppqC6Zv8ejzgH6bPFHGWuBiWML8JqbRH9otOdYRX4OrkyWarS2m3lF2Nzuhu3Vrq7/gofAfUy85370n5SOiGO3XP4puV+4B7btwfsDUzOkxpLie+ydZkM9y4coIvlBamFW/Hi62cgFxTfJvYxH/0q7/VoVGs2C6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXlVAR7B; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXlVAR7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779372817; x=1810908817;
  h=date:from:to:cc:subject:message-id;
  bh=CNky1ZijymGzAWMQRH5lhbKE74GVu3y5O9Q5pZdxUQo=;
  b=WXlVAR7B2sauQz3ALYbTUZpXGpXQuu2ULsj1djuQ6ZWvWDOpxs8bb6UP
   fBK6zLuV1k1Pv5KPDQ2UQAtimnYuuHZFK+390C1UfREKCIX+AABXSqerN
   GFM7xrRv9IGUwY5SaIAV7fdUfls6AWGhdMnUXN63Ea27BRC9xGafh3/L9
   jSHTPDW6a1566hfNl6zC7tB4X1CN8p3n++ksrvzkNT4r0hCf76I+hL7xm
   a4DPBpDyQPMr5ER73RyZxxtw4X8vDUgWvSxI9vwsUzW8NvUZmv0DkPQlF
   f/hxp0NsyBxCrQ8W00zuwEJCh1QXf4+NZAEMYt6UEv2FD11+tAo36rZ9t
   Q==;
X-CSE-ConnectionGUID: nDG57WrUQ4upgZD+SCqL5A==
X-CSE-MsgGUID: jqYMaMQDTkWztUF7mnuuow==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91762027"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="91762027"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 07:13:34 -0700
X-CSE-ConnectionGUID: QQVpy5ONRB2Vq5rZS8/Atg==
X-CSE-MsgGUID: NJeFYsXaQtWJ06grp/dZWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="278647362"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2026 07:13:33 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ49S-000000000PN-1OmB;
	Thu, 21 May 2026 14:13:30 +0000
Date: Thu, 21 May 2026 22:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: David McKay <david.mckay@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 892/1130]
 Warning: drivers/pci/controller/pcie-xilinx.c:132 struct member 'mask_lock'
 not described in 'xilinx_pcie'
Message-ID: <202605212251.v0Ud2hdP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: feb5d3d1d66a0710ca05111d06aa48d5568cddc4 [892/1130] PCI: xilinx: Add support for decoded interrupts
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260521/202605212251.v0Ud2hdP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212251.v0Ud2hdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212251.v0Ud2hdP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/controller/pcie-xilinx.c:132 struct member 'mask_lock' not described in 'xilinx_pcie'
>> Warning: drivers/pci/controller/pcie-xilinx.c:132 struct member 'irq_lo' not described in 'xilinx_pcie'
>> Warning: drivers/pci/controller/pcie-xilinx.c:132 struct member 'irq_hi' not described in 'xilinx_pcie'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
