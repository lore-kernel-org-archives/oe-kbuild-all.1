Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75972561
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Dec 2023 09:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZsaDZpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703930274; x=1735466274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D9qzYwVIsSkMUPPMpbK7sIUJJ1ST28mVhMpB0t1l/Kg=;
  b=SZsaDZpo2wpMBeNwU8GOekDi8MSbeytUmJ/3Vk0pzAitrub1IHFinwBK
   yhR3Pr6dMgB8CeF9MKWoVlhoRY8W27xfyYSj5J5w4TYq0iMiTYoG4+B2U
   LixhVOLC9b5h9wP1lYSirfwzDLlktgRXn+E+vdK6L8R1AafcnXLUfZwME
   KeaIDxaQUitRDkfJ+pTtCa/vGJtsLKFDWUDWgzttcqQ+3lnkSvhvYIdDr
   oXPlCsVKGpDTznNGIQOP8yb/n2+FVDLudvKQbE6uYozg+826dETpxaAP4
   iswbzNwe4eD2mXc+/YWmFYrTb7PlRrusm8CbOy8TDqeKopPea67Uw/J6g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="381672191"
X-IronPort-AV: E=Sophos;i="6.04,317,1695711600"; 
   d="scan'208";a="381672191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 01:57:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="897741111"
X-IronPort-AV: E=Sophos;i="6.04,317,1695711600"; 
   d="scan'208";a="897741111"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Dec 2023 01:57:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJW5w-000IL6-1R;
	Sat, 30 Dec 2023 09:57:49 +0000
Date: Sat, 30 Dec 2023 17:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:topic/scarlett2 84/97]
 sound/usb/mixer_scarlett2.c:4564:56: warning: ' Link Capture Switch'
 directive output may be truncated writing 20 bytes into a region of size
 between 13 and 33
Message-ID: <202312301704.jgu0FecE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/scarlett2
head:   4a2c8cc1644738191d9d6c0bca24516cfe390d41
commit: 0a995e38dc440fdfe658a5ebf19bf6eb647a0f5f [84/97] ALSA: scarlett2: Add support for software-controllable input gain
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231230/202312301704.jgu0FecE-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312301704.jgu0FecE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312301704.jgu0FecE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/usb/mixer_scarlett2.c: In function 'scarlett2_add_line_out_ctls':
   sound/usb/mixer_scarlett2.c:4444:48: warning: ' Volume Control Playback Enum' directive output may be truncated writing 29 bytes into a region of size between 24 and 33 [-Wformat-truncation=]
    4444 |                                  "Line Out %02d Volume Control Playback Enum",
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett2.c:4443:25: note: 'snprintf' output between 41 and 50 bytes into a destination of size 44
    4443 |                         snprintf(s, sizeof(s),
         |                         ^~~~~~~~~~~~~~~~~~~~~~
    4444 |                                  "Line Out %02d Volume Control Playback Enum",
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4445 |                                  i + 1);
         |                                  ~~~~~~
   sound/usb/mixer_scarlett2.c: In function 'scarlett2_add_line_in_ctls':
>> sound/usb/mixer_scarlett2.c:4564:56: warning: ' Link Capture Switch' directive output may be truncated writing 20 bytes into a region of size between 13 and 33 [-Wformat-truncation=]
    4564 |                                          "Line In %d-%d Link Capture Switch",
         |                                                        ^~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett2.c:4563:33: note: 'snprintf' output between 32 and 52 bytes into a destination of size 44
    4563 |                                 snprintf(s, sizeof(s),
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
    4564 |                                          "Line In %d-%d Link Capture Switch",
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4565 |                                          i, i + 1);
         |                                          ~~~~~~~~~
>> sound/usb/mixer_scarlett2.c:4483:50: warning: '%s' directive output may be truncated writing 4 bytes into a region of size between 0 and 10 [-Wformat-truncation=]
    4483 |         const char *fmt = "Line In %d %s Capture %s";
         |                                                  ^~
   ......
    4591 |                                  "Autogain Status", "Enum");
         |                                                     ~~~~~~
   sound/usb/mixer_scarlett2.c:4590:25: note: 'snprintf' output between 39 and 49 bytes into a destination of size 44
    4590 |                         snprintf(s, sizeof(s), fmt, i + 1,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4591 |                                  "Autogain Status", "Enum");
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +4564 sound/usb/mixer_scarlett2.c

  4476	
  4477	static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
  4478	{
  4479		struct scarlett2_data *private = mixer->private_data;
  4480		const struct scarlett2_device_info *info = private->info;
  4481		int err, i;
  4482		char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
> 4483		const char *fmt = "Line In %d %s Capture %s";
  4484		const char *fmt2 = "Line In %d-%d %s Capture %s";
  4485	
  4486		/* Add input level (line/inst) controls */
  4487		for (i = 0; i < info->level_input_count; i++) {
  4488			snprintf(s, sizeof(s), fmt, i + 1 + info->level_input_first,
  4489				 "Level", "Enum");
  4490			err = scarlett2_add_new_ctl(mixer, &scarlett2_level_enum_ctl,
  4491						    i, 1, s, &private->level_ctls[i]);
  4492			if (err < 0)
  4493				return err;
  4494		}
  4495	
  4496		/* Add input pad controls */
  4497		for (i = 0; i < info->pad_input_count; i++) {
  4498			snprintf(s, sizeof(s), fmt, i + 1, "Pad", "Switch");
  4499			err = scarlett2_add_new_ctl(mixer, &scarlett2_pad_ctl,
  4500						    i, 1, s, &private->pad_ctls[i]);
  4501			if (err < 0)
  4502				return err;
  4503		}
  4504	
  4505		/* Add input air controls */
  4506		for (i = 0; i < info->air_input_count; i++) {
  4507			snprintf(s, sizeof(s), fmt, i + 1 + info->air_input_first,
  4508				 "Air", info->air_option ? "Enum" : "Switch");
  4509			err = scarlett2_add_new_ctl(
  4510				mixer, &scarlett2_air_ctl[info->air_option],
  4511				i, 1, s, &private->air_ctls[i]);
  4512			if (err < 0)
  4513				return err;
  4514		}
  4515	
  4516		/* Add input phantom controls */
  4517		if (info->inputs_per_phantom == 1) {
  4518			for (i = 0; i < info->phantom_count; i++) {
  4519				scnprintf(s, sizeof(s), fmt,
  4520					  i + 1 + info->phantom_first,
  4521					  "Phantom Power", "Switch");
  4522				err = scarlett2_add_new_ctl(
  4523					mixer, &scarlett2_phantom_ctl,
  4524					i, 1, s, &private->phantom_ctls[i]);
  4525				if (err < 0)
  4526					return err;
  4527			}
  4528		} else if (info->inputs_per_phantom > 1) {
  4529			for (i = 0; i < info->phantom_count; i++) {
  4530				int from = i * info->inputs_per_phantom + 1;
  4531				int to = (i + 1) * info->inputs_per_phantom;
  4532	
  4533				scnprintf(s, sizeof(s), fmt2, from, to,
  4534					  "Phantom Power", "Switch");
  4535				err = scarlett2_add_new_ctl(
  4536					mixer, &scarlett2_phantom_ctl,
  4537					i, 1, s, &private->phantom_ctls[i]);
  4538				if (err < 0)
  4539					return err;
  4540			}
  4541		}
  4542		if (info->phantom_count &&
  4543		    scarlett2_has_config_item(private,
  4544					      SCARLETT2_CONFIG_PHANTOM_PERSISTENCE)) {
  4545			err = scarlett2_add_new_ctl(
  4546				mixer, &scarlett2_phantom_persistence_ctl, 0, 1,
  4547				"Phantom Power Persistence Capture Switch", NULL);
  4548			if (err < 0)
  4549				return err;
  4550		}
  4551	
  4552		/* Add software-controllable input gain controls */
  4553		if (info->gain_input_count) {
  4554			err = scarlett2_add_new_ctl(
  4555				mixer, &scarlett2_input_select_ctl, 0, 1,
  4556				"Input Select Capture Enum",
  4557				&private->input_select_ctl);
  4558			if (err < 0)
  4559				return err;
  4560	
  4561			for (i = 0; i < info->gain_input_count; i++) {
  4562				if (i % 2) {
  4563					snprintf(s, sizeof(s),
> 4564						 "Line In %d-%d Link Capture Switch",
  4565						 i, i + 1);
  4566					err = scarlett2_add_new_ctl(
  4567						mixer, &scarlett2_input_link_ctl,
  4568						i / 2, 1, s,
  4569						&private->input_link_ctls[i / 2]);
  4570					if (err < 0)
  4571						return err;
  4572				}
  4573	
  4574				snprintf(s, sizeof(s), fmt, i + 1,
  4575					 "Gain", "Volume");
  4576				err = scarlett2_add_new_ctl(
  4577					mixer, &scarlett2_input_gain_ctl,
  4578					i, 1, s, &private->input_gain_ctls[i]);
  4579				if (err < 0)
  4580					return err;
  4581	
  4582				snprintf(s, sizeof(s), fmt, i + 1,
  4583					 "Autogain", "Switch");
  4584				err = scarlett2_add_new_ctl(
  4585					mixer, &scarlett2_autogain_switch_ctl,
  4586					i, 1, s, &private->autogain_ctls[i]);
  4587				if (err < 0)
  4588					return err;
  4589	
  4590				snprintf(s, sizeof(s), fmt, i + 1,
  4591					 "Autogain Status", "Enum");
  4592				err = scarlett2_add_new_ctl(
  4593					mixer, &scarlett2_autogain_status_ctl,
  4594					i, 1, s, &private->autogain_status_ctls[i]);
  4595	
  4596				snprintf(s, sizeof(s), fmt, i + 1,
  4597					 "Safe", "Switch");
  4598				err = scarlett2_add_new_ctl(
  4599					mixer, &scarlett2_safe_ctl,
  4600					i, 1, s, &private->safe_ctls[i]);
  4601				if (err < 0)
  4602					return err;
  4603			}
  4604		}
  4605	
  4606		return 0;
  4607	}
  4608	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
