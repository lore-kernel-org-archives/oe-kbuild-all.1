Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359F52550D7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 06:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769407924; cv=none; b=KPMco8nfsO2G2hHgrtrxEICgE8gXjPQRKGgwfgHDx/Xr7ZHUA3kS/kMlvuEqcHmNOX1BIKVAaGpmfVYc0qLGogHIl+5vKaxg1Zi3v7J7W9LAPYt3qgRdyh/prkl3YrIeoqiUpe0wGyVlUXI0vzAlUXqFnDc84hkEn+umGhdj17Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769407924; c=relaxed/simple;
	bh=vUX+FMvb0vQROoTIhZuihK8rCYjN0ZGyUXZUkqBOz+c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gprAxtEjyNi34iDTtZkc0LtXh2XNxV4APug4qO02Iq0Ik7N92NR4FTNbI9wLhvqKva4hwuxrAghE+TSwUMGeIqmk3Ds/A+hUsj/EMLumGnLR7MhC2+VInJfUuWHGIOBnItqNs6EFaKO+Lj8/p0iJMP/GeqxDo4VoYt8xWxWE+tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7/P5Ayg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7/P5Ayg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769407923; x=1800943923;
  h=date:from:to:cc:subject:message-id;
  bh=vUX+FMvb0vQROoTIhZuihK8rCYjN0ZGyUXZUkqBOz+c=;
  b=e7/P5Aygcr0Ng4eMQBlBSRprcf0oyXiuPFA5fXCEGDJhxbXbLJHAo4Ca
   pGo5ctKhNTYWrTgMzJC6hZt9iJzjcHnRWbGqj6Xx60MedtxwoieYbdGSf
   bBIR8GaZl6egfshhxH6zASuwznGk3qzd7XfXbHjAgG/oWjCZ5NcVfnWjk
   J08/RCjq2wl0EpaIE9xo48+qfg/bVKZo4MXTJYr/nRX25C5vNruEKyhNO
   gbNNUMMqOwxl2uA9xV8aiqrNa9kKPKY67ahoSOdahF4Lr8pZkFTLzWU6D
   YyznwylV6+FOThPIZjS7BxwcJI1viOnX0e7F/r1fo2RzxPg3S8xdM7Jvl
   w==;
X-CSE-ConnectionGUID: 2tqd1LTRQdSSqY2Wg7X1VA==
X-CSE-MsgGUID: RYTFTFp4SSqGcrXtFvSfJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70484473"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70484473"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 22:12:02 -0800
X-CSE-ConnectionGUID: Mga2npKWRkGdM0cAwXe2sA==
X-CSE-MsgGUID: nJnuwdXdTmeixlPeE9Lbug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="212580563"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jan 2026 22:12:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkFpN-00000000WzG-43Oe;
	Mon, 26 Jan 2026 06:11:57 +0000
Date: Mon, 26 Jan 2026 14:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/5]
 drivers/ufs/core/ufshcd.c:2307:26-31: WARNING: conversion to bool not needed
 here
Message-ID: <202601261427.oQCUTVvC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   94397366ef04e97e159dedfff9b20f82abd0f94c
commit: d32533d30e2119b0c0aa17596734f1f842f750df [0/5] scsi: ufs: core: Poll HCS.UCRDY before issuing a UIC command
config: i386-randconfig-052-20260126 (https://download.01.org/0day-ci/archive/20260126/202601261427.oQCUTVvC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601261427.oQCUTVvC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/ufs/core/ufshcd.c:2307:26-31: WARNING: conversion to bool not needed here

vim +2307 drivers/ufs/core/ufshcd.c

  2293	
  2294	/**
  2295	 * ufshcd_ready_for_uic_cmd - Check if controller is ready
  2296	 *                            to accept UIC commands
  2297	 * @hba: per adapter instance
  2298	 *
  2299	 * Return: true on success, else false.
  2300	 */
  2301	static inline bool ufshcd_ready_for_uic_cmd(struct ufs_hba *hba)
  2302	{
  2303		u32 val;
  2304		int ret = read_poll_timeout(ufshcd_readl, val, val & UIC_COMMAND_READY,
  2305					    500, UIC_CMD_TIMEOUT * 1000, false, hba,
  2306					    REG_CONTROLLER_STATUS);
> 2307		return ret == 0 ? true : false;
  2308	}
  2309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
