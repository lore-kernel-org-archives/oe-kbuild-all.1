Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC3B1386DA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719994287; cv=none; b=J8/BW9wFJSj6HTZ1plnEz3KiSM7uM4lo5OVwvRYvIgwSOp8ICg/BYaKVXn7lE62oNCe4aWmQS3KQ29jqCFwmKdn+oj51n92YRWFr7KvRRrdJxA/oh2Ov20jb0ScU4ahJ6+DvVm0S/OoUQK19haJ5mSoziTOXE/hszGrheBsXlcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719994287; c=relaxed/simple;
	bh=w8BYuQDZs2TkHeEnaLlAKDyb7ijrNnENGOhQ2mQVbZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NF6g5x1xA8TasaD82Fa+g9vT5sq73FugZuZwn8+oC9FxfoZhCtcPD/a1R90kZrsb5IdxX6Gc1GEshPhkYLGcLX/cYKF+oFXWB37KGDqLV9707xA/Dgi0JFFEyfgzPYmsnZOXRy0hZuf1BFOFqWQ2NQh3b8SnH+k3K9+BLPdDe88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IW05Qt6D; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IW05Qt6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719994285; x=1751530285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w8BYuQDZs2TkHeEnaLlAKDyb7ijrNnENGOhQ2mQVbZo=;
  b=IW05Qt6DxNly/f9632Tg+ao69YDbHKixCK7jXlBGwl/LvjFaYMGu55ot
   3dRCJfa7+PicqshHXXeFxifxc4eK2l9DxL1r3CCDoyM43x2694k3DEcAS
   QtVyY+7Qkr/Im0tK5+RizJ6/XMA1Bg0dMsifeZh0S7Rucak79Fuv2fHTu
   3fB9eFsUZ4iERkkhQpt5/NSHeFzN5EUbixT7zYWLJExZtSiXxXYlAr8Ib
   LrALfE4szeR89q5CZ4Q4mljfjQi28IE+NV41NeJYTa8A2tV36vA1vvq4k
   /hu4ijbroKgiCaMMSnTqyIFMW1DcVTd7SKd5zoMpjgvYzBPF9Ylz/wQ0N
   A==;
X-CSE-ConnectionGUID: zjZNUANlSkqnheSMODD+kA==
X-CSE-MsgGUID: BrtYJ53BQAeIXQku+EjS3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="12372306"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="12372306"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 01:11:24 -0700
X-CSE-ConnectionGUID: MxA0zxXyQXCrMi+rTUro2w==
X-CSE-MsgGUID: 7MIxz+dmQWeRuW6lyjDlGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="50791732"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 01:11:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOv5F-000PXS-1m;
	Wed, 03 Jul 2024 08:11:21 +0000
Date: Wed, 3 Jul 2024 16:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 8777/10451] sound/soc/fsl/lpc3xxx-i2s.h:42:30:
 error: implicit declaration of function 'FIELD_PREP'
Message-ID: <202407031601.Hy5RHjFB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 0959de657a10cc40b2cc41cff9169ab0e0fd4456 [8777/10451] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
config: loongarch-randconfig-r062-20240703 (https://download.01.org/0day-ci/archive/20240703/202407031601.Hy5RHjFB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031601.Hy5RHjFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031601.Hy5RHjFB-lkp@intel.com/

Note: the linux-next/master HEAD 0b58e108042b0ed28a71cd7edf5175999955b233 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   sound/soc/fsl/lpc3xxx-i2s.c: In function '__lpc3xxx_find_clkdiv':
   sound/soc/fsl/lpc3xxx-i2s.c:42:13: warning: variable 'savedbitclkrate' set but not used [-Wunused-but-set-variable]
      42 |         u32 savedbitclkrate, diff, trate, baseclk;
         |             ^~~~~~~~~~~~~~~
   In file included from sound/soc/fsl/lpc3xxx-i2s.c:23:
   sound/soc/fsl/lpc3xxx-i2s.c: In function 'lpc3xxx_i2s_hw_params':
>> sound/soc/fsl/lpc3xxx-i2s.h:42:30: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      42 | #define LPC3XXX_I2S_WW8      FIELD_PREP(0x3, 0) /* Word width is 8bit */
         |                              ^~~~~~~~~~
   sound/soc/fsl/lpc3xxx-i2s.c:169:24: note: in expansion of macro 'LPC3XXX_I2S_WW8'
     169 |                 tmp |= LPC3XXX_I2S_WW8 | LPC3XXX_I2S_WS_HP(LPC3XXX_I2S_WW8_HP);
         |                        ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +42 sound/soc/fsl/lpc3xxx-i2s.h

    40	
    41	/* i2s_daO i2s_dai register definitions */
  > 42	#define LPC3XXX_I2S_WW8      FIELD_PREP(0x3, 0) /* Word width is 8bit */
    43	#define LPC3XXX_I2S_WW16     FIELD_PREP(0x3, 1) /* Word width is 16bit */
    44	#define LPC3XXX_I2S_WW32     FIELD_PREP(0x3, 3) /* Word width is 32bit */
    45	#define LPC3XXX_I2S_MONO     BIT(2)   /* Mono */
    46	#define LPC3XXX_I2S_STOP     BIT(3)   /* Stop, diables the access to FIFO, mutes the channel */
    47	#define LPC3XXX_I2S_RESET    BIT(4)   /* Reset the channel */
    48	#define LPC3XXX_I2S_WS_SEL   BIT(5)   /* Channel Master(0) or slave(1) mode select */
    49	#define LPC3XXX_I2S_WS_HP(s) FIELD_PREP(0x7FC0, s) /* Word select half period - 1 */
    50	#define LPC3XXX_I2S_MUTE     BIT(15)  /* Mute the channel, Transmit channel only */
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
