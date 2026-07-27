Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01083FF1AE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 12:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155399; cv=none; b=H2ooV626E5wNCKjSEXXEwpsBnicxzuZyx0gstjp0DDUHLgSAGAur7h462uXe/uzGhdqAA5Vmjk/vCLqbVdruZYT5Rj08s+e3jdX/kQbcv2UEHwkxz9edGCrDDH3/GYzNIy1RQQh3RHkwEocjWE2P21XoAUgfQtIFtUWzYLudpuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155399; c=relaxed/simple;
	bh=MaQNczacZwUqP5j90mbjPqJaKDasE98nGzImulTOX6s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N3DRWkcl1HofIkZRxFuiNbycmjty5WJUR8FqK/rc5+f80RM0qHE6GCilot8RJ1kytSGtW+5WGGyVkQCqQ73rRtL/ZAy4ZwknriW0YimLbHoajk5yipVfMN/lWXdTdV6uOm6Sh1+Ct2NNCPNXrZqFdpeTwuHWJgDV4H9GlXVIRyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpCklIwY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpCklIwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785155397; x=1816691397;
  h=date:from:to:cc:subject:message-id;
  bh=MaQNczacZwUqP5j90mbjPqJaKDasE98nGzImulTOX6s=;
  b=JpCklIwYHYLKc2waZ3Ceapiky5djyzo1SACuQ308Nc+k1D3coYk08/Gp
   er+0pfaLEY1G1ddN2kUFFfKzAsCuyzsqe40kT6Hml64/cVMiB5C+erGLG
   KS8042J9qIa4aYPb0fIrqLNI927eh98CtgUzn8ATbXwGxFTbqcwLAi3oH
   RkWYHG3CEDMqbK/HCb7NntZ6fVGI0ecGkvIP7D/qt/xK3tVzvuynKlPxZ
   5aU+HLWEkneh6XPK4+9cF2+XxZGCykuKG7T3JOTTrSBsiW4GxK41MeWxs
   oqLbCvvF9acNrJoZOwlputXsnQpE0FFES3Uu50RFUBT1vkdPzCN/zIfx8
   w==;
X-CSE-ConnectionGUID: EKRa71i4RBaqw7PsYz+vFQ==
X-CSE-MsgGUID: ZD69F/9pSTOrqgPuckUM0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="111265159"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="111265159"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 05:29:56 -0700
X-CSE-ConnectionGUID: GGPzJDwXQkCwp9I9Q9E8nQ==
X-CSE-MsgGUID: sdB4xiSRSUGe5uytOyA7Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="258837959"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Jul 2026 05:29:54 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woKSu-000000001ac-249o;
	Mon, 27 Jul 2026 12:29:52 +0000
Date: Mon, 27 Jul 2026 14:29:38 +0200
From: kernel test robot <lkp@intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: [thesofproject:topic/sof-dev 12/23] Warning:
 sound/soc/sof/intel/hda-stream.c:1186 function parameter 'rtd' not described
 in 'hda_dsp_get_llp'
Message-ID: <202607271411.8L4kuBob-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   7afcfbbcdfcbfd59f6980b1552f097938e13cfe6
commit: 589b466c7e51c6929ec3196b362f1feccf32b411 [12/23] ASoC: SOF: ops: Add new platform-specific ops for compress
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260727/202607271411.8L4kuBob-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260727/202607271411.8L4kuBob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607271411.8L4kuBob-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/sof/intel/hda-stream.c:1186 function parameter 'rtd' not described in 'hda_dsp_get_llp'
>> Warning: sound/soc/sof/intel/hda-stream.c:1186 function parameter 'dir' not described in 'hda_dsp_get_llp'
>> Warning: sound/soc/sof/intel/hda-stream.c:1186 expecting prototype for hda_dsp_get_stream_llp(). Prototype was for hda_dsp_get_llp() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
