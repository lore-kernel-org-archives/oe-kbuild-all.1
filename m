Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99480378838
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 09:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415026; cv=none; b=u1cy3HPxd3+nhwc9tW5puum3tZJ1gjU4imj48RLHPdkatzOmjvhUB9iiu2qv6m6mbtNVZZflo2/Gf3FmWYFCM7P7LAp+yBGtIFi+yXDB/rl6vEWTNINXcSUq9lOta3SlNXUnz8o2rj8/k6whWHkWRtn6gnaBzDurfDjNhoC5XFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415026; c=relaxed/simple;
	bh=XL0pyNBZlbDukXIWytdCTMvUu/eORxrxEzerEcygDDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pKl28iTrIUhhdgiUhmKWC1uSSMLB9hp1y3Jpfh2JGObYvTar49/r+K4ATUL0gPFiDISreuoRrl00aa1NH7W5TwFFES7H+oppQymKTI3yPoxEVi405b5SP2UA8LkPh8RfEJlv42IMIM2TAe8Ts3UJOThXPRTtdLCOMIyklGUq4rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rmk+gDsn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rmk+gDsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783415025; x=1814951025;
  h=date:from:to:cc:subject:message-id;
  bh=XL0pyNBZlbDukXIWytdCTMvUu/eORxrxEzerEcygDDk=;
  b=Rmk+gDsnkXpG1ysYSCHANBnAhZHg32JrPDRv1FeJ2/zH5LCWltiv1YFA
   C+fZyoLyu3Sk6koJPM3aBRItXyLNC6MfiOimJyG8RlbeGid0+AiZj9Et7
   UWhMQmAoY6iExzv7+HWPyObmwY+glNjnI4uqUSSJxLuB8DRtsGOT5o+gr
   TC5t44T5gEJkXuqfWp/WY4cgsq3JkY0s7ljeRXolZkdKm+nxxyS63BT59
   w8rwqbRUz/h7q/DkcfjBTlr7n7q0ducUR7MLlK5MpS9/1P1J4I6XOlaHa
   9YdY0yTzQvIXWbV5jinU4JfhZz9co+2HO70aosN/zQlB/OVx7n3zUJd0L
   A==;
X-CSE-ConnectionGUID: CKOhr2JAQTKw2sNvpuAkIQ==
X-CSE-MsgGUID: HTqAb8VUQBSvYT6x8+BVbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="95436324"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95436324"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:03:45 -0700
X-CSE-ConnectionGUID: 8N5jKQwlQXCvOC7sbTGTgQ==
X-CSE-MsgGUID: L8Z/xoe6R362A5MUGd9XTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277157789"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jul 2026 02:03:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wh1iN-00000000FBZ-1ZQh;
	Tue, 07 Jul 2026 09:03:40 +0000
Date: Tue, 07 Jul 2026 17:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 438/3855] arm-linux-gnueabi-ld:
 drivers/net/wireless/nxp/nxpwifi/cfp.o:(.data.region_code_index+0x0):
 multiple definition of `region_code_index';
 drivers/net/wireless/marvell/mwifiex/cfp.o:(.data.region_code_index+0x0):
 first defined here
Message-ID: <202607071642.fu89mtLA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e9685d3c41c35dd1b37df70d854137abcb2fbac
commit: 4c477f8bfc1a86c54a719cae475f7fa1973eba0f [438/3855] wifi: nxp: add nxpwifi driver for IW61x
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260707/202607071642.fu89mtLA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607071642.fu89mtLA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607071642.fu89mtLA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/wireless/nxp/nxpwifi/main.o: in function `is_command_pending':
>> main.c:(.text.is_command_pending+0x0): multiple definition of `is_command_pending'; drivers/net/wireless/marvell/mwifiex/main.o:main.c:(.text.is_command_pending+0x0): first defined here
>> arm-linux-gnueabi-ld: drivers/net/wireless/nxp/nxpwifi/main.o:(.data.driver_version+0x0): multiple definition of `driver_version'; drivers/net/wireless/marvell/mwifiex/main.o:(.rodata.driver_version+0x0): first defined here
>> arm-linux-gnueabi-ld: drivers/net/wireless/nxp/nxpwifi/cfp.o:(.data.region_code_index+0x0): multiple definition of `region_code_index'; drivers/net/wireless/marvell/mwifiex/cfp.o:(.data.region_code_index+0x0): first defined here
>> arm-linux-gnueabi-ld: drivers/net/wireless/nxp/nxpwifi/wmm.o:(.rodata.tos_to_tid_inv+0x0): multiple definition of `tos_to_tid_inv'; drivers/net/wireless/marvell/mwifiex/wmm.o:(.rodata.tos_to_tid_inv+0x0): first defined here

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
