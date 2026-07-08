Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA53A37FF66
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 09:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501530; cv=none; b=EQEEfBDrLHf0WHBsU5m7ulTMPB6CW7ZcBK+Gtg7/drh2HiNsRUhF8Mk1+5LaMmbs+xwOQen2pO3btQ35w5AF5XLxpnMlGLOF3eo5MN4qmv1n5e23agUk16rKZCQR33c0TmxadPbNMHq5MoNjb4iMcR4GfmNxEf8t9xXBmSbGmUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501530; c=relaxed/simple;
	bh=D6A1AFvRVwCoP0Yf4gBfv6kcbqqSCtisDz1c7bw4Svg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ewSevHbX3RhiUhnLg/CliMOOhI1xqHL+NIRV0eXxbIB8RE+azC3/U2jZdDbLZepynvB7lYzTGHR9O/uH2mlwaF+rTuzDhHYUvgXE4/ROymNVeEO5hHWwORv+8Va1yOFgKQ2uurjkBgQVJ0V1DaWkX0aSdO6Ba+6TJPFAmP1/dAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8qLAvTy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8qLAvTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783501529; x=1815037529;
  h=date:from:to:cc:subject:message-id;
  bh=D6A1AFvRVwCoP0Yf4gBfv6kcbqqSCtisDz1c7bw4Svg=;
  b=O8qLAvTyV5enaGjWcHgCEKMJWrJnwR63T99UeABEVv3IB/8lw/KbuQLv
   f/V7phE4QI7IE3AeySuImZYpMd3XxI9PxWfqzURAuKzcXkH4PeIUhA/sb
   oVBUH7rnQq1olqD4gbGNkLRbMc8mx10pnJ+PebeQAWpkhTzDw8/385dQo
   FJrduMEgymuSNK6cSKD1cLPv6zA+8V/j7QQvJrocci3aQ9OEbOcFXXdG5
   z0GYW9Mqox3hwqVcIsphthh6+HK8zWWyJnqumdBy36Whf/BMLrzEQywlk
   LpeIMUZ55pLfJElwIGGrpGHXjlfpnT5ApS7TbIJN1dh1Uw+m1eQ2Gu/2u
   Q==;
X-CSE-ConnectionGUID: /G5dg4NWTPanjrHIIkwT7Q==
X-CSE-MsgGUID: kVp5YeWPQsquFMt9VxMjww==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="101581910"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="101581910"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 02:05:28 -0700
X-CSE-ConnectionGUID: uT6c4uV0Swac88MCGKm2Ow==
X-CSE-MsgGUID: WVO8Ll+rS12q/x+21eOoUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="249793486"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jul 2026 02:05:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whODa-00000000GC9-3jyk;
	Wed, 08 Jul 2026 09:05:22 +0000
Date: Wed, 08 Jul 2026 17:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [tip:irq/drivers 12/15] Warning:
 drivers/irqchip/qcom-pdc.c:436 expecting prototype for
 qcom_pdc_gic_set_type(). Prototype was for qcom_pdc_gic_secondary_set_type()
 instead
Message-ID: <202607081724.42MewVti-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   698a8648ca8051d34722b09b8a8088c741120ac3
commit: ad01c2b2f29163ca0bbe1fd4f9343fbc5119c239 [12/15] irqchip/qcom-pdc: Configure PDC to pass through mode
config: arm-randconfig-004-20260708 (https://download.01.org/0day-ci/archive/20260708/202607081724.42MewVti-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081724.42MewVti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081724.42MewVti-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/irqchip/qcom-pdc.c:436 expecting prototype for qcom_pdc_gic_set_type(). Prototype was for qcom_pdc_gic_secondary_set_type() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
