Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57468165F16
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 03:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751340450; cv=none; b=HyfJhBJajRdJmqxeZy7wKcQwvWjnjKxUJQmq0dzI22oBUqMJJx3xq+D+ik9huL4jsufskwKykVnqRR3Fsv6sKuNUx85SFsHSWbzgGOLRwpNpsKQN1hKPie3SxtSONgdnGKY42Vo086slsQZ3E+aB1Fr4e6KUe9D16BWwphrddYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751340450; c=relaxed/simple;
	bh=NUDjp2NBcP5Fnux545cL+pfx8J49FYgBnPx4xGMw3UM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P3rx4AQqmvGBroUHl8lMTFe0OK3M6gnr+O5h07kQaCXIkqfOtoy4m7i1lVmZtJ3C/Fzw2/4GCwQPUrxRQJnxtYlceLCULIuyCMQqBAyfdvJp0ogIQeyGcxkzUmWNpFJxxG+M6zhneFQ8BMd03LaOrTdZRF4Jxe3NiaJ9RB6NV5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cz4ElhYm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cz4ElhYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751340448; x=1782876448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUDjp2NBcP5Fnux545cL+pfx8J49FYgBnPx4xGMw3UM=;
  b=Cz4ElhYmkSrUYYtgnks6vb04KFYAlMeCmJPV/UehWwNEc/1QcXXHkC1r
   R25p3E7qtr9NGoKkVpJq514HEDRhtSP8XRRNyaJjNQjRpflKVht4Rf4mS
   QAqddoI62Dr2sIuwGkzLuHlrjXyYkk14ON+5KLos6QeqzG1T3ExJA/Zcq
   HEffisEXhly0gmjrkfORrpXqbuFZH3aBu/a0pDnpeq53mJwobUhGdtpig
   /hqwvlNKPiFSawxR1QlUwphOjoglb9zm87vUAcYg5BtQA9jMbOawYMkr7
   6KCfvTCQctA1Ern4kGDwkqhAa3oqlXVA4aF+dRncwUpOTxoCSCAvgu/Bj
   Q==;
X-CSE-ConnectionGUID: PW2/UFtnT8a8a3VJGltNJQ==
X-CSE-MsgGUID: vtTTuJ91S6OhIaikM6qUCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53521529"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53521529"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 20:27:28 -0700
X-CSE-ConnectionGUID: ZpJNjhg/QPyhclIQbC+YBw==
X-CSE-MsgGUID: 5Mbd3qF2S+Gp48qbsyS0+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="154165171"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jun 2025 20:27:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWReW-000Zgu-2u;
	Tue, 01 Jul 2025 03:27:24 +0000
Date: Tue, 1 Jul 2025 11:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 440/440] kismet: WARNING: unmet
 direct dependencies detected for DMA_VIRTUAL_CHANNELS when selected by
 GKI_HIDDEN_SND_SOC_CONFIGS
Message-ID: <202507011158.58Dhgjo1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   9262077f7dda6a5ced992027f566118fd18e154f
commit: dd17237d7284a4f7a881bd3c746e299f5b4675da [440/440] ANDROID: gki: build-in DMA_VIRTUAL_CHANNELS
config: x86_64-kismet-CONFIG_DMA_VIRTUAL_CHANNELS-CONFIG_GKI_HIDDEN_SND_SOC_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250701/202507011158.58Dhgjo1-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250701/202507011158.58Dhgjo1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011158.58Dhgjo1-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS when selected by GKI_HIDDEN_SND_SOC_CONFIGS
   WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
