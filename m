Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4321A288529
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 13:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464209; cv=none; b=e+nmAn2q3AVVuJBe6d7G6nxmT+wWip1nDOi2T7em85ACup1vw/vycqZdhiyrNTTNwazadoJuTT9sbiYUEIIBfNteH4iEjY6css7FRArnuB5z/0nMdCEm+1/OPTH/ma4CvKNNmJgi2kUrS8dAFNuQz9bakB8xN5TKbJMVHj0gEFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464209; c=relaxed/simple;
	bh=BqICwh8rhfbjr0TzRliC+dq4Wft6Iu5RxrdzYMpPh9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nqs3fyDWi2QksrSzzL8HJmMYDIZnO1+W97C+259ifQwbIM0Bekqi69SrLwpLkwFEgi0wpyI3hLGi5m8gdbjFE/pndME+69+sST+EVuaDPQ0f4ljRtlFkpJNz9CIxcZ9Hbv2gJ4xYbq6MY7fQmOi4kwm8Zqql+qKeQ0tUVti+AAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVL0j9pc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVL0j9pc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751464207; x=1783000207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BqICwh8rhfbjr0TzRliC+dq4Wft6Iu5RxrdzYMpPh9g=;
  b=KVL0j9pcqSy+FVbA2n+525a8dQO7C9y71tXk1zG0sr9UCR+Jo/lRIeTv
   imbDa2b9oiQq66OxoJKbOEo35Q5yqNms9s0OTZEtBNzUwmUZbkyExtUdj
   xVRNDp8zW/7b2pjZv4pquFLGUeuRzDiPkDr+rTbAXHaNBLsz6IU6PxFmG
   J2NNon7rcrC3h5CP54pH8Usfq6HkDCrngAkJU1vRZyRQOYj4vqV5C8jPJ
   5h1x/P4704wGHfcgCcDbIwuO77OfKwCDvBw+drVSmZctPrMG8wOLQIWXr
   j1F9wcqiU9DSrajlO/RMlUC0XPMFvMi/87hX55onXUCno4nWW+ETGEaJN
   A==;
X-CSE-ConnectionGUID: PQ0q7EGBQ1+DZ2/gVBO+0Q==
X-CSE-MsgGUID: /eVMnjljQQS85HM9dEduyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53688582"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53688582"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 06:50:06 -0700
X-CSE-ConnectionGUID: dzMLPMnfS/aehtK62ekVCg==
X-CSE-MsgGUID: o96TOZPRS+ynvQDIuCk1oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154635732"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2025 06:50:05 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWxqd-0000IH-1F;
	Wed, 02 Jul 2025 13:50:03 +0000
Date: Wed, 2 Jul 2025 15:49:00 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-06 0/1]
 sound/usb/mixer_scarlett2.c:3310:48: warning: ' Volume Control Playback
 Enum' directive output may be truncated writing 29 bytes into a region of
 size between 25 and 33
Message-ID: <202507021542.Hx1Fgeul-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geoffrey,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-06
head:   93d285b4a114a690ac06d56817597665fb5b469f
commit: 771ad4dfbdbbba875f17adddf4806bd24a0835c1 [0/1] ALSA: scarlett2: Rename scarlett_gen2 to scarlett2
config: x86_64-buildonly-randconfig-2003-20250702 (https://download.01.org/0day-ci/archive/20250702/202507021542.Hx1Fgeul-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021542.Hx1Fgeul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021542.Hx1Fgeul-lkp@intel.com/

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

9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3250  
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3251  static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3252  {
e46f2195c86b00 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3253  	struct scarlett2_data *private = mixer->private_data;
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3254  	const struct scarlett2_device_info *info = private->info;
e2cc91ac8f4e1b sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3255  	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3256  	int num_line_out =
e2cc91ac8f4e1b sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3257  		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3258  	int err, i;
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3259  	char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3260  
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3261  	/* Add R/O HW volume control */
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3262  	if (info->line_out_hw_vol) {
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3263  		snprintf(s, sizeof(s), "Master HW Playback Volume");
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3264  		err = scarlett2_add_new_ctl(mixer,
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3265  					    &scarlett2_master_volume_ctl,
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3266  					    0, 1, s, &private->master_vol_ctl);
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3267  		if (err < 0)
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3268  			return err;
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3269  	}
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3270  
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3271  	/* Add volume controls */
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3272  	for (i = 0; i < num_line_out; i++) {
9cfe1276a6736f sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3273  		int index = line_out_remap(private, i);
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3274  
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3275  		/* Fader */
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3276  		if (info->line_out_descrs[i])
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3277  			snprintf(s, sizeof(s),
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3278  				 "Line %02d (%s) Playback Volume",
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3279  				 i + 1, info->line_out_descrs[i]);
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3280  		else
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3281  			snprintf(s, sizeof(s),
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3282  				 "Line %02d Playback Volume",
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3283  				 i + 1);
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3284  		err = scarlett2_add_new_ctl(mixer,
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3285  					    &scarlett2_line_out_volume_ctl,
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3286  					    i, 1, s, &private->vol_ctls[i]);
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3287  		if (err < 0)
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3288  			return err;
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3289  
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3290  		/* Mute Switch */
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3291  		snprintf(s, sizeof(s),
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3292  			 "Line %02d Mute Playback Switch",
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3293  			 i + 1);
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3294  		err = scarlett2_add_new_ctl(mixer,
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3295  					    &scarlett2_mute_ctl,
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3296  					    i, 1, s,
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3297  					    &private->mute_ctls[i]);
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3298  		if (err < 0)
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3299  			return err;
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3300  
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3301  		/* Make the fader and mute controls read-only if the
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3302  		 * SW/HW switch is set to HW
0c88f9db1910ff sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3303  		 */
9cfe1276a6736f sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3304  		if (private->vol_sw_hw_switch[index])
06250c89d47cef sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-22  3305  			scarlett2_vol_ctl_set_writable(mixer, i, 0);
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3306  
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3307  		/* SW/HW Switch */
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3308  		if (info->line_out_hw_vol) {
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3309  			snprintf(s, sizeof(s),
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29 @3310  				 "Line Out %02d Volume Control Playback Enum",
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3311  				 i + 1);
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3312  			err = scarlett2_add_new_ctl(mixer,
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3313  						    &scarlett2_sw_hw_enum_ctl,
f02da6534810ac sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3314  						    i, 1, s,
f02da6534810ac sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3315  						    &private->sw_hw_ctls[i]);
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3316  			if (err < 0)
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3317  				return err;
e914d8432cb4b9 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3318  
e914d8432cb4b9 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3319  			/* Make the switch read-only if the line is
e914d8432cb4b9 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3320  			 * involved in speaker switching
e914d8432cb4b9 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3321  			 */
e914d8432cb4b9 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3322  			if (private->speaker_switching_switch && i < 4)
e914d8432cb4b9 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-23  3323  				scarlett2_sw_hw_ctl_ro(private, i);
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3324  		}
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3325  	}
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3326  
dbd82c0550633c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3327  	/* Add dim/mute controls */
03bdbcf08a8cb7 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3328  	if (info->line_out_hw_vol)
dbd82c0550633c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3329  		for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++) {
03bdbcf08a8cb7 sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3330  			err = scarlett2_add_new_ctl(
dbd82c0550633c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3331  				mixer, &scarlett2_dim_mute_ctl,
dbd82c0550633c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3332  				i, 1, scarlett2_dim_mute_names[i],
dbd82c0550633c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2021-06-21  3333  				&private->dim_mute_ctls[i]);
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3334  			if (err < 0)
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3335  				return err;
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3336  		}
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3337  
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3338  	return 0;
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3339  }
9e4d5c1be21f0c sound/usb/mixer_scarlett_gen2.c Geoffrey D. Bennett 2019-07-29  3340  

:::::: The code at line 3310 was first introduced by commit
:::::: 9e4d5c1be21f0c00e747e92186784f3298309b3e ALSA: usb-audio: Scarlett Gen 2 mixer interface

:::::: TO: Geoffrey D. Bennett <g@b4.vu>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
