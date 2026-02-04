Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792DD360735
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 06:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770186490; cv=none; b=XO1Ahk18QtP9bKcURlY7m9NrCTdN2QxvQIDoniZ+6eIR7XUpRPlL+djeZFdD+RpAGeQYnFZHTtjeu4HV+QZKZTBRQ9h+cTxywQmbTCHA93IAb/yGtWJc/C3q6W5Kac/2s5I6dBq5dbL7mP3DLAoiLTTmANCgBF5gL5SuwjfMyKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770186490; c=relaxed/simple;
	bh=MRR/LMO82nqnv12nAILYJUk5qPxGpRhQAGa9nall85o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MtJjleh5VCrHeaP1BmaJ087lfGJ+iib8k78QsVPdFc1zotQrY1ef/kdc81/rYvjtnVx1Bsk/kNZu7SD791qmGBn8rGGBqkA7ouT1a51LrfozTHgpHeV8O/EoFTAbpzWru45y30L8EpEi6VCIjWNvGwcc+GhAZtReBvqpod0NiQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRTO6dqG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRTO6dqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770186489; x=1801722489;
  h=date:from:to:cc:subject:message-id;
  bh=MRR/LMO82nqnv12nAILYJUk5qPxGpRhQAGa9nall85o=;
  b=hRTO6dqGIh6hI0oYmntVWHAg8y/1UFuyMacF99URjCkOhmKw5fSLSOVa
   jeaktpN+jYekR+K3xBg7qzy9O2ZveermGUJHlJjMDfXNZlUNXDV1nknc+
   R5geOww0mYHniQRKjO/JTpe83i1faF7TsnXRXGyQZeTWnvpaZuV+IScbM
   1m600dP8LnTbs3NHwjR/I+i+A/5Vy4OxtjwspdfHH4h9VFLOqjzfnJixW
   Ajt2uaC9lQHoGVO8B46aa4rU9SKkfNpjY0shNGiR3mIVcZkmki1ZdUDKr
   mkMHFw/j8f1YuljW7BXm9WiJpArGcBQwT2K6CEtX4ZtXavnNydZrKaHiv
   w==;
X-CSE-ConnectionGUID: VOhhCNSoRP+EROuHkIkgQQ==
X-CSE-MsgGUID: HSuUraZ0QJW9rpy+AU6x3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71271266"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71271266"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 22:28:09 -0800
X-CSE-ConnectionGUID: 4+ep6+P1TZSI9HI3dAKQ4Q==
X-CSE-MsgGUID: 6sthg4WBRdu5lad2vK3/MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209367560"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2026 22:28:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnWMv-00000000hVI-1f3d;
	Wed, 04 Feb 2026 06:28:05 +0000
Date: Wed, 04 Feb 2026 14:27:10 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-DMR-APX-ANBZ29353 29/29]
 setup.c:undefined reference to `topology_apply_cmdline_limits_early'
Message-ID: <202602041451.orT6B6kT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-DMR-APX-ANBZ29353
head:   45bafd656145fec57975dd36e97ecda524ed6dbf
commit: 958a42aeddf62f2857c597e278636e6b389927c9 [29/29] x86/cpu/topology: Rework possible CPU management
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260204/202602041451.orT6B6kT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041451.orT6B6kT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041451.orT6B6kT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/setup.o: in function `setup_arch':
>> setup.c:(.init.text+0x7dc): undefined reference to `topology_apply_cmdline_limits_early'
>> ld: setup.c:(.init.text+0x7ec): undefined reference to `topology_init_possible_cpus'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
