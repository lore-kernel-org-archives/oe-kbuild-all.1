Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA1C1E98FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 04:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742529929; cv=none; b=fIYNEANv2ZE9e77uc/inct3QSP+D9T8Cw+vwZOPyFegucmYPpFW1559wErWVaw324xaY7wRFbPYTZQB6mIAgFPb6/aN3hKItBUY9SUkRUYZYgLF6GIFDU7mezmb+ALwWObMxEBN2G7r/zfpftrPxlgmM0IrJbFH/NozPuj9vI1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742529929; c=relaxed/simple;
	bh=0hvDeP86lkRm47thC0zjITDdCflRq64zFpmGUht90eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aZ/nzY67u1Y1Si7Syws5/Kog+ZT6RWmcF9eD6Byr2D+t5fum6SAMnrnx9/aDrILuqSjkAyq/ihw5T1qJaDBaNt9S+IQo//D8PzYhqXe0HPVS0xndMZ61DM6gtclTOC/+4EmEdfa7kkvou2Y6e6INik0mr0clT2Di5UsuPpC2mWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSsb9knc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSsb9knc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742529927; x=1774065927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0hvDeP86lkRm47thC0zjITDdCflRq64zFpmGUht90eo=;
  b=lSsb9kncIcdng7wfnNwnabvCSuwiPcFVWmnPTi3ZUVo+f4OSzg7g1F5R
   avn8fvXBOC80+vGW1nB+1P4o3LfHF7P3ClV0m0xvqN2ihkl2w7OjOKQ9m
   IiLLD3+5LVRMDcQQ9rUlgpsVG1xg2J+4q+3O8Oa9h0O3ETQIRt7rKw5A7
   jkHa5Ls+8isPvEKmm3xueYFTD8gc5w/iSH83cVFjO7Ypr/uqAH/aEW7po
   MG51r9FA9y48KDBBCy83Exw51QK8tmzaNVCpnn1+PjYBnA0u88aqeLcT0
   1ink4fbyVOEuj+hiJl9kUgZR0Ug5ZavHH/bjyF/apd3Is8InxYDSdcNAx
   g==;
X-CSE-ConnectionGUID: L4oojOpOQfeRHy6xBaygjQ==
X-CSE-MsgGUID: 8UlDMC1OQoC4LkS2ITGzBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47664952"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="47664952"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 21:05:26 -0700
X-CSE-ConnectionGUID: 0TYdp1Y+Qxio/Epz+G9xYg==
X-CSE-MsgGUID: UNXSX9JXRmqdc9jlOcvlxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="128513481"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2025 21:05:25 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvTdH-00011R-2a;
	Fri, 21 Mar 2025 04:05:20 +0000
Date: Fri, 21 Mar 2025 12:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:for-next 8/18] ld: sound/pci/oxygen/oxygen.o:undefined
 reference to `oxygen_pci_pm'
Message-ID: <202503211242.zaTMusOT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   ee3d1f09e04643b1b48bd894de1de3c600a01c05
commit: 5ea0a2206b58356779cc686630b6548a3402991c [8/18] ALSA: oxygen: Convert to EXPORT_SIMPLE_DEV_PM_OPS()
config: i386-randconfig-061-20250320 (https://download.01.org/0day-ci/archive/20250321/202503211242.zaTMusOT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211242.zaTMusOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211242.zaTMusOT-lkp@intel.com/

Note: the tiwai-sound/for-next HEAD ee3d1f09e04643b1b48bd894de1de3c600a01c05 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld: sound/pci/oxygen/oxygen.o:(.data+0x454): undefined reference to `oxygen_pci_pm'
>> ld: sound/pci/oxygen/virtuoso.o:(.data+0xf4): undefined reference to `oxygen_pci_pm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
