Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699928;
	b=lsvzfMncVj+T1yV+KMn5SRANXC95NepqzudAjHy6D48mbpht1h4x96xPpp1Xx2tczAQm
	 qVFj4h9P+ryfn0y35XOs56LpssMvmEoerfEjRVgH0JIYoJEMkV7ruLJWv7hxjkbouLPo7
	 AvKpFViFk0TBIA5r+lCEqC8cvNnED+pHzWoAOjADuABOgK8yZAbQw/MD8QRoJ5ZVaYvOe
	 /u/wjN3PN6v4CsZQrhe4SweSMuxCW41MLOMxSRdEh58Zw6wkhpQG4J13g0Ab0HCwGnGIK
	 aoMFCJlSJ7BYvP3yS9NmRItm5unrmNho43xHAAXe9yk9jlcyrPNphvexCHLBLwdTOpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699928;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=D/XEpvbf9JdsXE99JqMaLT6k/1BSGLuJ24WCfYUFBtc=;
	b=z49TowNzSEhXw8ZwYpUDOlitoQ8j6DRPYvi8DU/i/fIzgeLKYWg3coD6HeBEsbd+p1FA
	 0+KxyPYwHz+DR8IsUW/td6Kl1iRQ/swVbwGE5X/jdkxh3bKTAUhl2d0LCmpuD02wjPq78
	 DGFdomFZBx6Bg1n3SppvxoxBGP933TUCvEghVuXeh+44Z0FLLCDbayQD7Xe/zeTol7iFO
	 U5ZXXWER/A9V7mAZWreCo3pZIYQdmN7xI79yG2ryQZCBuZjQ37gb/u3jpfy4X+ciYhBfH
	 uVtHnHHdiWk+fdB+d+0cLOlRPK7yS2WYtaRbU1vpB9nXaoj8Dclakv8Jb8x9HpvJsxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RlKvLIqt;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1526606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 13:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1526606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RlKvLIqt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795699929; x=1827235929;
  h=date:from:to:cc:subject:message-id;
  bh=yF6FdL1tjlvdq/rPC9zu+/H0xFf6RxqG/Kwj9M1FQfI=;
  b=RlKvLIqtUbFEG2nnWWLl6RQSZ1r7ryvKWQt5CInh424wDY+dosJ9hfAd
   FpZ++CArautjhjsBk/pfsDtsICi8U8PIN72+dbG4aHvU8ZCKKsGxV2hda
   9fsV1cnGW5cQ43LbB8qTMA8KdRlY3hpMstaa+pN/LIRmpxGvgxHvZo4aw
   K6aduGRnhSftrB8fGJ8xwlw8y+uQbPJr+TDRBtq9l06KrlGZqrT5pf5oo
   Hse723gm8e/CqXAsGdZaOVz9/PGplLB5Lmd5gfGS0/QcsaBie5Shdeuc4
   DCulV4rnDexQL5X2zytJ0RrcGHCW/s5hlOQBt1r3Ym15oNMZLeJxcY+i+
   w==;
X-CSE-ConnectionGUID: ttruT6S0QrOvh11gh9mSsg==
X-CSE-MsgGUID: qWcm6XKeQQS4doZpNVBV4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4661949"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4661949"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 05:32:02 -0800
X-CSE-ConnectionGUID: Ytb0D6M4RfGnfJkl4c6LjA==
X-CSE-MsgGUID: tl8dsI6YS0yT6A0jC7lUWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12206993"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2026 05:31:57 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWZZr-0000000004E-0Pqi;
	Thu, 26 Nov 2026 13:31:55 +0000
Date: Thu, 26 Nov 2026 14:31:53 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/62]
 sound/usb/mixer_scarlett2.c:3310:48: warning: ' Volume Control Playback Enum'
 directive output may be truncated writing 29 bytes into a region of size
 between 25 and 33
Message-ID: <20261126142058.C4IvrgGb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Geoffrey,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5a11c7fa1d6b059063b6621f3392c54827910306
commit: 771ad4dfbdbbba875f17adddf4806bd24a0835c1 [0/62] ALSA: scarlett2: Rename scarlett_gen2 to scarlett2
config: x86_64-randconfig-2001-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126142058.C4IvrgGb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126142058.C4IvrgGb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126142058.C4IvrgGb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/usb/mixer_scarlett2.c: In function 'scarlett2_add_line_out_ctls':
>> sound/usb/mixer_scarlett2.c:3310:48: warning: ' Volume Control Playback Enum' directive output may be truncated writing 29 bytes into a region of size between 25 and 33 [-Wformat-truncation=]
    3310 |                                  "Line Out %02d Volume Control Playback Enum",
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett2.c:3309:25: note: 'snprintf' output between 41 and 49 bytes into a destination of size 44
    3309 |                         snprintf(s, sizeof(s),
         |                         ^~~~~~~~~~~~~~~~~~~~~~
    3310 |                                  "Line Out %02d Volume Control Playback Enum",
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3311 |                                  i + 1);
         |                                  ~~~~~~


vim +3310 sound/usb/mixer_scarlett2.c

9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3250  
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3251  static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3252  {
e46f2195c86b008 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3253  	struct scarlett2_data *private = mixer->private_data;
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3254  	const struct scarlett2_device_info *info = private->info;
e2cc91ac8f4e1b0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3255  	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3256  	int num_line_out =
e2cc91ac8f4e1b0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3257  		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3258  	int err, i;
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3259  	char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3260  
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3261  	/* Add R/O HW volume control */
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3262  	if (info->line_out_hw_vol) {
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3263  		snprintf(s, sizeof(s), "Master HW Playback Volume");
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3264  		err = scarlett2_add_new_ctl(mixer,
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3265  					    &scarlett2_master_volume_ctl,
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3266  					    0, 1, s, &private->master_vol_ctl);
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3267  		if (err < 0)
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3268  			return err;
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3269  	}
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3270  
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3271  	/* Add volume controls */
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3272  	for (i = 0; i < num_line_out; i++) {
9cfe1276a6736fe sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3273  		int index = line_out_remap(private, i);
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3274  
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3275  		/* Fader */
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3276  		if (info->line_out_descrs[i])
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3277  			snprintf(s, sizeof(s),
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3278  				 "Line %02d (%s) Playback Volume",
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3279  				 i + 1, info->line_out_descrs[i]);
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3280  		else
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3281  			snprintf(s, sizeof(s),
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3282  				 "Line %02d Playback Volume",
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3283  				 i + 1);
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3284  		err = scarlett2_add_new_ctl(mixer,
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3285  					    &scarlett2_line_out_volume_ctl,
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3286  					    i, 1, s, &private->vol_ctls[i]);
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3287  		if (err < 0)
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3288  			return err;
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3289  
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3290  		/* Mute Switch */
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3291  		snprintf(s, sizeof(s),
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3292  			 "Line %02d Mute Playback Switch",
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3293  			 i + 1);
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3294  		err = scarlett2_add_new_ctl(mixer,
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3295  					    &scarlett2_mute_ctl,
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3296  					    i, 1, s,
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3297  					    &private->mute_ctls[i]);
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3298  		if (err < 0)
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3299  			return err;
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3300  
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3301  		/* Make the fader and mute controls read-only if the
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3302  		 * SW/HW switch is set to HW
0c88f9db1910ff4 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3303  		 */
9cfe1276a6736fe sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3304  		if (private->vol_sw_hw_switch[index])
06250c89d47cefb sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3305  			scarlett2_vol_ctl_set_writable(mixer, i, 0);
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3306  
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3307  		/* SW/HW Switch */
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3308  		if (info->line_out_hw_vol) {
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3309  			snprintf(s, sizeof(s),
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29 @3310  				 "Line Out %02d Volume Control Playback Enum",
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3311  				 i + 1);
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3312  			err = scarlett2_add_new_ctl(mixer,
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3313  						    &scarlett2_sw_hw_enum_ctl,
f02da6534810acb sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3314  						    i, 1, s,
f02da6534810acb sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3315  						    &private->sw_hw_ctls[i]);
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3316  			if (err < 0)
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3317  				return err;
e914d8432cb4b99 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3318  
e914d8432cb4b99 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3319  			/* Make the switch read-only if the line is
e914d8432cb4b99 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3320  			 * involved in speaker switching
e914d8432cb4b99 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3321  			 */
e914d8432cb4b99 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3322  			if (private->speaker_switching_switch && i < 4)
e914d8432cb4b99 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3323  				scarlett2_sw_hw_ctl_ro(private, i);
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3324  		}
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3325  	}
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3326  
dbd82c0550633c1 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3327  	/* Add dim/mute controls */
03bdbcf08a8cb7b sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3328  	if (info->line_out_hw_vol)
dbd82c0550633c1 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3329  		for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++) {
03bdbcf08a8cb7b sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3330  			err = scarlett2_add_new_ctl(
dbd82c0550633c1 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3331  				mixer, &scarlett2_dim_mute_ctl,
dbd82c0550633c1 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3332  				i, 1, scarlett2_dim_mute_names[i],
dbd82c0550633c1 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3333  				&private->dim_mute_ctls[i]);
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3334  			if (err < 0)
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3335  				return err;
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3336  		}
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3337  
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3338  	return 0;
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3339  }
9e4d5c1be21f0c0 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3340  

:::::: The code at line 3310 was first introduced by commit
:::::: 9e4d5c1be21f0c00e747e92186784f3298309b3e ALSA: usb-audio: Scarlett Gen 2 mixer interface

:::::: TO: Geoffrey D. Bennett <g@b4.vu>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
