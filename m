Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E819A2135C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 22:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707518691; cv=none; b=Jv3rII5dV9SEsRVZy262lMl7TMtbuDM8HZB5ueM8jst2J9Jt2eZfdo9XZzux09xKTtM7sDc3kivZ1uvNS/fo+xYJPst45VfI3EWrHfKgt5DmmqRshJfPsFXmvynn8tOPKED2tlkjknqGwOwyKP+YIffNrWtbZFVcDSce79sZSYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707518691; c=relaxed/simple;
	bh=a2k4LS7WySXZcHHHptqBtDnfwlJrHv+YV6H4+eourKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bZGpZXqArK3FXNjtgH2wg6GW0qB91RXEgeDqj+T16rlpocO+ncQ4EAbS0T/axWRJRY+INNvBbnzftFc8vKIzEreniGYaNiNSfJlIMd93Q2rSvxVypr2WIg61cxVf73NPnyxWveh12GZfUV2pADT/VcUP8wmIHefvgXO90Xv3sTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nY9JKXYu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nY9JKXYu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707518687; x=1739054687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a2k4LS7WySXZcHHHptqBtDnfwlJrHv+YV6H4+eourKs=;
  b=nY9JKXYuagnT9BE1c94cjnnLiqPMK/NYaJ4t5b+bhIV9deAkQeBf3asF
   Mc3vqzgINC9n+iAN8aaRdilaqSrQatiW/6SSnElI426U2ZG+7Lu7W91bF
   ahqYLOYP+mSI0pmfnU+jh72HadOi0rfvmixb8cn+gRIDW9WcQkbFwOYhA
   /pgxnJ6Up23PTot7aSB4IKYpv4VpAPAGfmPlgohFJu2DqXefxeGd8fA1k
   UAKJBlhyH2hjGaDUxa4Uv8Xfn84HEL/i+l51kQPL5PQEES3SmJam8DAXV
   /jJPJpuE2IHJ0gAbDQwbH2MScDwmOG2TOD+N+HvT+JptZRadtlzYpzr11
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1647901"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="1647901"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 14:44:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="2043130"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Feb 2024 14:44:45 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYZbu-0005Aw-1I;
	Fri, 09 Feb 2024 22:44:42 +0000
Date: Sat, 10 Feb 2024 06:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: [linux-next:master 3007/5901]
 drivers/video/backlight/ktd2801-backlight.c:16:33: sparse: sparse: symbol
 'ktd2801_timing' was not declared. Should it be static?
Message-ID: <202402100625.M0RkJhMh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   445a555e0623387fa9b94e68e61681717e70200a
commit: 66c76c1cd984c14660453dfa2118014817924375 [3007/5901] backlight: Add Kinetic KTD2801 backlight support
config: arm-randconfig-r111-20240209 (https://download.01.org/0day-ci/archive/20240210/202402100625.M0RkJhMh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240210/202402100625.M0RkJhMh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100625.M0RkJhMh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/backlight/ktd2801-backlight.c:16:33: sparse: sparse: symbol 'ktd2801_timing' was not declared. Should it be static?

vim +/ktd2801_timing +16 drivers/video/backlight/ktd2801-backlight.c

    14	
    15	/* These values have been extracted from Samsung's driver. */
  > 16	const struct expresswire_timing ktd2801_timing = {
    17		.poweroff_us = 2600,
    18		.detect_delay_us = 150,
    19		.detect_us = 270,
    20		.data_start_us = 5,
    21		.short_bitset_us = 5,
    22		.long_bitset_us = 15,
    23		.end_of_data_low_us = 10,
    24		.end_of_data_high_us = 350
    25	};
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
