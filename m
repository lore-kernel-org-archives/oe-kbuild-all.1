Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245A81D6DA3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 21:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736977884; cv=none; b=eqghBvxsiUWsMwbYBgG84WUPUpot3fuWByEK8uTNJ+Bc9j165DVKvZUwxrq4mCufZykXi7/4o3p7EIZLwNeTuaka61Szvu9LVzndWkNe7Qy7mZQz7VqSyGMpyUgP+Cmbz4rDPYh/chSMwPaH6dUyZMyxeau8Q4Z0xwgxfX0VWq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736977884; c=relaxed/simple;
	bh=b/PSd3+j3d/btlxTqo16u0wllGDYjJO89lzjieTypI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q7oXiv03lm4BOPmM+ucJxONQa58QWSwfPpdLg1k64f14ChP21+Z0G4C1PAXDjvnpOoLB4bRFVLwdbjWCwnTae0DoeYGXsit1zyPwt9kNzL5fVfIoOnKE6/puFor7dMWncCFiL2zTfrgAtlS0QkJ46eeAq5lFycmjJkSUn2vNMX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SM6sr3qy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SM6sr3qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736977883; x=1768513883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b/PSd3+j3d/btlxTqo16u0wllGDYjJO89lzjieTypI0=;
  b=SM6sr3qyIcs01r/EiZcMdhlhD57Ldohg2PX99nTbBTiD7ONGaY5lzglk
   Eyg3mbV0QA1TNVjnkQtC0+AvNpmyhXFZg7zO7BWQWuZPijFF7pRU9lvO1
   0foAfCA9vradWS1yMFW9xhi6l1DLwwbZgdj/am8tlUf3MA/VpaaGiNf33
   XoLlu5L/NtHvGfgFhuiQaZB5NacYVprI5VVWyK/M383ZbI4ARsAQ3TQaa
   iuyjTgy8ydA29i0rSnEMOpiOURqlo8U393L8et4Y/lRZKZ5kblAL+Fgw/
   hXaBJBtUHITwBpVo6oHtsfqrQuu4oK1sS7Fq+rLWZevTsjH1HBzGeGDN4
   Q==;
X-CSE-ConnectionGUID: +8TudByHRAa5jZXG6aaCEg==
X-CSE-MsgGUID: 8JsMpSAUTA2RgVvkIqkszg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="54876891"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="54876891"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 13:51:22 -0800
X-CSE-ConnectionGUID: wgzag3TuTiyuM6WZHb6yDA==
X-CSE-MsgGUID: yDcJEHT9TxyBtk3fRHiepw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="136116943"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2025 13:51:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYBIE-000Qw3-1v;
	Wed, 15 Jan 2025 21:51:18 +0000
Date: Thu, 16 Jan 2025 05:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [tip:irq/core 6/17] ERROR: modpost:
 "irq_gc_mask_disable_and_ack_set" [drivers/irqchip/irq-brcmstb-l2.ko]
 undefined!
Message-ID: <202501160501.6r9pNtBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
head:   12cbdcb9f05559ff72eb8a04df829852804c0276
commit: dd1f17a9faf5359d76644236cde4cc1720f1184d [6/17] irqchip/irq-brcmstb-l2: Replace brcmstb_l2_mask_and_ack() by generic function
config: arm64-randconfig-002-20250115 (https://download.01.org/0day-ci/archive/20250116/202501160501.6r9pNtBg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160501.6r9pNtBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160501.6r9pNtBg-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "irq_gc_mask_disable_and_ack_set" [drivers/irqchip/irq-brcmstb-l2.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
