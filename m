Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E188A1FAC42
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 00:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765499880; cv=none; b=FU8scqani+Ko95pVdcfHSHnVVenHZzMvg9QKQYjg/BiexqSK6VZGeP8jxBwYNfZ34L8LBHfeiMOgKKG/gYx+nWqMLmsEjk1j2Mhqd/RCqh6VaULBa/eftpl+bkX4sF1LnAqi7tPlaQeEdK4LmQlauxx4TQquvUFfNc9GW2evW8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765499880; c=relaxed/simple;
	bh=PE4cDxUbJeYfE8op0i8/pUDQ4WBgIKpbPwHnwTIE3j4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GdyzX/CjdcUQQ7gNbyjZXo51fS4Qg4xPsDp9IUA4VnUbw7mNO+uyrmwQ7KSlDS3biA00ZC3A07fKKjMLXmy7j18oVoqO3arhWsQ5Pp7wiuTUq6WaP7wP8ve8qzgEOVrlrP8cA8m37ULevzahX+DrTfhFIkCJJXHryjKcRGayIgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7hmssOy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7hmssOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765499879; x=1797035879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PE4cDxUbJeYfE8op0i8/pUDQ4WBgIKpbPwHnwTIE3j4=;
  b=V7hmssOyMxxqme/Vw1AIztQCgrexGD747VOlVRSWemnCF3UBk87bFFug
   as0hJiE/VRSWgLQLGUZk7uKZtzhMTBr4b84o8Z6os3q7nfXtFBzzaH2Na
   ZYydrQifVaWOVwPKvmvAYRh964Tiv93LnaDFyEBAKgHsK7PpLZnvaxjUq
   Aa3lzpqxa/Q5G2+Z0N9/y5m6f6UlBfjkooEjCq+Q+VW+38sq3DGfTTp/H
   5Iz4kfLfd8DPw7NwyF8QeHMNDdHQjAboG+yJEvVnNnCv1tFrxi4TQGcV6
   eryTzpgMCqyBsoSCYQVg8ZdgqvRKIKIgSwzBT4MYxPe4gmStXgbqSS+Hl
   g==;
X-CSE-ConnectionGUID: /m0JdbmVT/uXIPGMKjqMPQ==
X-CSE-MsgGUID: Igbr9xEzQ3iyubivVgK6Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70072643"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="70072643"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 16:37:58 -0800
X-CSE-ConnectionGUID: Fa+9YI3ZSlaudbnMTCNZ8g==
X-CSE-MsgGUID: nEeoUb4CR0aVLmctaxyrUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="227584158"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Dec 2025 16:37:57 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTrAR-000000005FN-09Fj;
	Fri, 12 Dec 2025 00:37:55 +0000
Date: Fri, 12 Dec 2025 08:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 35/35]
 sound/usb/mixer_scarlett2.c:3310:48: warning: ' Volume Control Playback
 Enum' directive output may be truncated writing 29 bytes into a region of
 size between 25 and 33
Message-ID: <202512120816.u1vke6to-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   267508ada711fa80841b65e937e809311ab616dd
commit: 771ad4dfbdbbba875f17adddf4806bd24a0835c1 [35/35] ALSA: scarlett2: Rename scarlett_gen2 to scarlett2
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512120816.u1vke6to-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120816.u1vke6to-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120816.u1vke6to-lkp@intel.com/

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
