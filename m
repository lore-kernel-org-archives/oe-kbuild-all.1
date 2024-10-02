Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C167E0FF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 06:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727852342; cv=none; b=mYjaqafIu6rPAkw5OqKDKa5Zj/Q146EZrs3VQMeov12gk1fl5J921eWvpViOeeXbKSxnKeUSDIplAz66HThh1be0suOqc+qjeNFUchZqGjCv9HQGpxBf1vT/BVlPwCB6DtMrxW7GhMJifLKTkXBWYgJEedQ8o40wWGTtO4tDrRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727852342; c=relaxed/simple;
	bh=SdMdwrHsvCYoCryNr+QXnkGHPc7d/gyX+g83za/P9eY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfd8QCLE90neMt7p8jWR7q4TfI91EGIH0KDsgOMVD1rdnOjnNKtBmHrzWRndr1uDM4OMPrdkdigb19TS8HhF81lpmnO11TrElWnbBfvfV3zFeAdUWDNWk8TpIZvhC23braNTVxi0L6Q7zAgw4El1HnjEjCAdjEvKh5Ke73Zp0GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/wxjR1x; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/wxjR1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727852340; x=1759388340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SdMdwrHsvCYoCryNr+QXnkGHPc7d/gyX+g83za/P9eY=;
  b=A/wxjR1xD5HbXDbhEuHxYqVgIYU9mK6EyvZ63d0q3JnoOyWSh9MqF6vg
   Hgv7Xd8Rir13raz215X7y+D5sg58GRHel6Ov+hT2ClV537t9J3ZTPbegU
   AeCQSxHAa4hGs1D0p52ETyJ+A24Szyi4RSycS6cDEGTIaduhPhFyZwVZs
   zYjX7iotw2uxJfp3mWMjIlIsgqh1PHf2yUWwg9rwYsY+Gl45dX6KZJdeP
   YhDTBr9HTXq6g/1Czqw32HMOOR+MhxhEPb7yPQlq6bWvYKrP/5g0/j/Vl
   8N7lZuffldX10VGY7Bdnbe/1C2VXc5JyPglmwHJtcprNOn5PNY3etLySY
   g==;
X-CSE-ConnectionGUID: HbvetIGBRhur05qge8gf1g==
X-CSE-MsgGUID: 6JZsKiyHQA6UyF6WzYr7uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26475307"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="26475307"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 23:59:00 -0700
X-CSE-ConnectionGUID: AKhwnbzRRiOP9jtliSDt7A==
X-CSE-MsgGUID: QgqG6BEdSSG3mSxXOl53Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="73795137"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2024 23:58:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svtK3-000Rep-3A;
	Wed, 02 Oct 2024 06:58:55 +0000
Date: Wed, 2 Oct 2024 14:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 1259/1491]
 sound/soc/intel/avs/apl.c:244:30: error: 'skl_log_buffer_offset' undeclared
 here (not in a function); did you mean 'avs_skl_log_buffer_offset'?
Message-ID: <202410021438.unI6eEtB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 7a0ad4bad1c6b21f2858d9321c81f0370dce225a [1259/1491] UPSTREAM: ASoC: Intel: avs: Abstract IRQ handling
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410021438.unI6eEtB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021438.unI6eEtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021438.unI6eEtB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/intel/avs/skl.c:73:5: warning: no previous prototype for 'skl_log_buffer_offset' [-Wmissing-prototypes]
      73 | int skl_log_buffer_offset(struct avs_dev *adev, u32 core)
         |     ^~~~~~~~~~~~~~~~~~~~~
--
>> sound/soc/intel/avs/apl.c:244:30: error: 'skl_log_buffer_offset' undeclared here (not in a function); did you mean 'avs_skl_log_buffer_offset'?
     244 |         .log_buffer_offset = skl_log_buffer_offset,
         |                              ^~~~~~~~~~~~~~~~~~~~~
         |                              avs_skl_log_buffer_offset


vim +244 sound/soc/intel/avs/apl.c

c8c960c109716d Cezary Rojewski 2022-05-16  233  
b397f142f47498 Debi sahoo      2024-04-25  234  const struct avs_dsp_ops apl_dsp_ops = {
c8c960c109716d Cezary Rojewski 2022-05-16  235  	.power = avs_dsp_core_power,
c8c960c109716d Cezary Rojewski 2022-05-16  236  	.reset = avs_dsp_core_reset,
c8c960c109716d Cezary Rojewski 2022-05-16  237  	.stall = avs_dsp_core_stall,
7a0ad4bad1c6b2 Cezary Rojewski 2024-02-20  238  	.irq_handler = avs_irq_handler,
7a0ad4bad1c6b2 Cezary Rojewski 2024-02-20  239  	.irq_thread = avs_skl_irq_thread,
c8c960c109716d Cezary Rojewski 2022-05-16  240  	.int_control = avs_dsp_interrupt_control,
c8c960c109716d Cezary Rojewski 2022-05-16  241  	.load_basefw = avs_hda_load_basefw,
c8c960c109716d Cezary Rojewski 2022-05-16  242  	.load_lib = avs_hda_load_library,
c8c960c109716d Cezary Rojewski 2022-05-16  243  	.transfer_mods = avs_hda_transfer_modules,
b397f142f47498 Debi sahoo      2024-04-25 @244  	.log_buffer_offset = skl_log_buffer_offset,

:::::: The code at line 244 was first introduced by commit
:::::: b397f142f4749886f861dab3a3cf60174ec547b4 Revert "UPSTREAM: ASoC: Intel: avs: Prefix SKL/APL-specific members"

:::::: TO: Debi sahoo <debix.prasad.sahoo@intel.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
