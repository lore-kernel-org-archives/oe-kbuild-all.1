Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA3A225771
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 23:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749769573; cv=none; b=U/X+MWg50ebah5vjfAgnd5dWCkAcHKlQCfJst0GQffpjePAN+kWyD6iUPWzEfCURXJh2kL6GLrSzs/Q2T2JaioBfZgOaBZryl3PGlET9yYnEk2LOFZ2okmWSGeLey5gorvizl4EuvAqpWtXopEk6G0VIFsCzprZS9ybjypC0uls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749769573; c=relaxed/simple;
	bh=42DxeMH18pStU8d+i4uYd8J1GvuEtr28iSqW77gs9R0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QnHAY7swCiu4qIlnyWAcuF2W/i/uVz+pY9LKAKmD7wPJlUfb0iBhTH7C6tTDzbf2V2EpZvkP2qOQ/xLV8hWosMj8A+5Ekfn5hFjJl3t85neQaIFEVjExlEdxIBq/Km9r5pMP9rmOTUiy67AD61DXish9+b95r1VVXVCYsdxrIyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1mc/uKm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1mc/uKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749769572; x=1781305572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=42DxeMH18pStU8d+i4uYd8J1GvuEtr28iSqW77gs9R0=;
  b=A1mc/uKmzfMT3K34X9FTFb+Uum0OHT2qCQIfSvXAWBHrLPR1M43hz8xb
   uzWPBmn8jvOmOAOq8a4OQb2R05AKdPA4HAWfuFI3P1i5OGaWcoHZCanHe
   I850HM+kVfQX+XPMrGm52G9lt/7DkLrmWwkrUF0AILYFg9PXtxsV6Z9SW
   NfOl9nD4Yd9yPceNlcKNmznpVVmrPwHBPaSGyqpWHx61bUllg9dPBs1tb
   lylUfnyKW3Xf8gh8C2ehf/LKeTSroTfSHwHKb/lVzUJmPTOlTB9SzDlWb
   ZKKfjIrOG+xAt/6/hBmswEOfP9nyI87AELoqpXhOqIGL0jVS6ENQZxkZG
   Q==;
X-CSE-ConnectionGUID: lgrSdx1xQYWvfwSsdYt4ng==
X-CSE-MsgGUID: wyU2ebdBSqWHHxt7IRxfYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69543024"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="69543024"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 16:06:11 -0700
X-CSE-ConnectionGUID: qKQJ8m/FTP+l3e1RF3Re7A==
X-CSE-MsgGUID: fvmexS/ERFSOi2NMLBK/3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="152946596"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jun 2025 16:06:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPqzm-000C16-2G;
	Thu, 12 Jun 2025 23:06:06 +0000
Date: Fri, 13 Jun 2025 07:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 10/18] mixer_quirks.c:undefined reference to
 `input_close_device'
Message-ID: <202506130733.gnPKw2l3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   30f85eddbdebba7665f9b7b772821e588547ca9e
commit: 79d561c4ec0497669f19a9550cfb74812f60938b [10/18] ALSA: usb-audio: Add mixer quirk for Sony DualSense PS5
config: nios2-randconfig-001-20250613 (https://download.01.org/0day-ci/archive/20250613/202506130733.gnPKw2l3-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130733.gnPKw2l3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130733.gnPKw2l3-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: sound/usb/mixer_quirks.o: in function `snd_dualsense_ih_disconnect':
>> mixer_quirks.c:(.text+0x25d8): undefined reference to `input_close_device'
>> mixer_quirks.c:(.text+0x25d8): relocation truncated to fit: R_NIOS2_CALL26 against `input_close_device'
>> nios2-linux-ld: mixer_quirks.c:(.text+0x25e0): undefined reference to `input_unregister_handle'
>> mixer_quirks.c:(.text+0x25e0): relocation truncated to fit: R_NIOS2_CALL26 against `input_unregister_handle'
   nios2-linux-ld: sound/usb/mixer_quirks.o: in function `snd_dualsense_mixer_elem_free':
>> mixer_quirks.c:(.text+0x26f0): undefined reference to `input_unregister_handler'
>> mixer_quirks.c:(.text+0x26f0): relocation truncated to fit: R_NIOS2_CALL26 against `input_unregister_handler'
   nios2-linux-ld: sound/usb/mixer_quirks.o: in function `snd_dualsense_ih_connect':
>> mixer_quirks.c:(.text+0x2d8c): undefined reference to `input_register_handle'
>> mixer_quirks.c:(.text+0x2d8c): relocation truncated to fit: R_NIOS2_CALL26 against `input_register_handle'
>> nios2-linux-ld: mixer_quirks.c:(.text+0x2d9c): undefined reference to `input_open_device'
>> mixer_quirks.c:(.text+0x2d9c): relocation truncated to fit: R_NIOS2_CALL26 against `input_open_device'
   nios2-linux-ld: mixer_quirks.c:(.text+0x2dac): undefined reference to `input_unregister_handle'
   mixer_quirks.c:(.text+0x2dac): relocation truncated to fit: R_NIOS2_CALL26 against `input_unregister_handle'
   nios2-linux-ld: sound/usb/mixer_quirks.o: in function `snd_dualsense_jack_create':
>> mixer_quirks.c:(.text+0x2f30): undefined reference to `input_register_handler'
>> mixer_quirks.c:(.text+0x2f30): relocation truncated to fit: R_NIOS2_CALL26 against `input_register_handler'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
