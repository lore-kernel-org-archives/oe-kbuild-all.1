Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9819286429
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 16:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550246; cv=none; b=mzxyvJOeu8eSvc9pK0zxvBqWR+tc3gAHzITOhUVE+2JMV2drk03K2qwAfEu4fBf8unrfTQRkDPvERSP4TI0A63pFN4tUXN2coacOC2IYiAzE+74JBraZz6zezts69bP7tSDS7jR/9TAX1AVkaSZo5Lrdw9lJ+LsAY5zI2LMYPqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550246; c=relaxed/simple;
	bh=nAScuGI2MOkYQpCCW4c13go9CLsIayABoiMOvK1QThg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4PT3TiD9kVK3fya3XaW/P1i0B9WhLActQvArAN7hePGRvrUqrf+6zPdVbh/AbrYwTPBOzU4YCgLcus5QCaZ+MwaYblK6SdCWsSfx0txaLvNeY7hXdKNxfCTWxBjwVQ0glkUekqV48Xu9TnyM951YXddq/2LO8eXiydu1EQjTwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aX0UB1fA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aX0UB1fA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746550244; x=1778086244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nAScuGI2MOkYQpCCW4c13go9CLsIayABoiMOvK1QThg=;
  b=aX0UB1fAf9D+tk/aHHfbCu4udQDPpr7VcHOeyUyqbjM5AS0szjymYT8O
   YhbX/0APoUwwHth6qggp9WfuM4LHzxdBjcIh4mFaz4WqRCV7m1eZE8oOK
   5dSw0Fka/LCUeTXilD5HLFCYkqnmm7GVqqIYyceQ8sLg+jp6re768cedR
   B86Gk67PBeDtYkt08vcdwaW1Z/SC8uIAOjHUTbWq8DPIH1sX3GNIM3UcX
   Svj8xRXeUuD5d6XJy7NT9MxsBpsIHHNRqAENmLG4mEAKzgiX4edSwszhk
   ngywFNCkWe8b6qU72Bqb+FYf+uocjNp6HUEk380+Q3yokUhNrkMhoDZdw
   Q==;
X-CSE-ConnectionGUID: PrPkno+bSea7XoHzMfqWKA==
X-CSE-MsgGUID: tbt+74s5TTWztbpk4DHGdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70739090"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="70739090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 09:50:43 -0700
X-CSE-ConnectionGUID: y4DorEpCTPiDpxQONaga5Q==
X-CSE-MsgGUID: J+6PjdaJQ+OEeb395Ml/6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136638475"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 May 2025 09:50:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCLV9-0006i5-0q;
	Tue, 06 May 2025 16:50:39 +0000
Date: Wed, 7 May 2025 00:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by
 GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202505070053.d8I3RmMU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   e20c2e5ba70ac5fd2f1157f57a8ee53e07b671b5
commit: 194fc9ea8a50fa11e9b03bf04449614fc79be59a [2/2] ANDROID: GKI: enable hidden configs for DMA
config: i386-kismet-CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250507/202505070053.d8I3RmMU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505070053.d8I3RmMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505070053.d8I3RmMU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by GKI_HIDDEN_DMA_CONFIGS
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
