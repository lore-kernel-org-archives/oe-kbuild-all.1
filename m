Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0711810EA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Dec 2023 04:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgVEcScM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703995740; x=1735531740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DataobQi3W4V6btsb7UH/IsMe34Zh7Ts3oQlIcjc07o=;
  b=mgVEcScMBeCAGd7Nfwuj13DCzlWXePGWYHjNhM7I46+ovrb57z7ZysZg
   qPf+K6vXS62oh+sO5LTUaE50yqgdGBQAbdGg4MJsnvpJd51IB0vLiGtlX
   I928GEofbK+xpXwbqCfDn9+CgNP+Lj6dJSfGp9CXLK5KNsCWbz+PD1YRi
   DSKtjvXXKgP4XlRGTcFxRx0fH2A9grOOP3MZKk8wBv0XEcMjqLMwz+yRX
   zuZRCtmHBp606Uo/qpO7TOwuiQoJf0FBSyeQ0k9lzTJrRdkjSJODDaqAC
   osmujXR3lxJnPKjrAhCUNH0ryMj806dnEp2zsHUZSWJE7IZ/w9cNa7+Q7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="381699572"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="381699572"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 20:08:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="897905573"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="897905573"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Dec 2023 20:08:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJn7r-000Iz7-2u;
	Sun, 31 Dec 2023 04:08:35 +0000
Date: Sun, 31 Dec 2023 12:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:topic/scarlett2 91/97]
 sound/usb/mixer_scarlett2.c:5320:53: warning: ' Playback Volume' directive
 output may be truncated writing 16 bytes into a region of size between 11
 and 22
Message-ID: <202312311123.HZeLFR3F-lkp@intel.com>
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
commit: c6c9f0cf9dba7e86f1f6cca658bb6b86c5d02530 [91/97] ALSA: scarlett2: Add support for custom Gen 4 Direct Monitor mixes
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231231/202312311123.HZeLFR3F-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231231/202312311123.HZeLFR3F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312311123.HZeLFR3F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/usb/mixer_scarlett2.c: In function 'scarlett2_add_line_out_ctls':
   sound/usb/mixer_scarlett2.c:4808:48: warning: ' Volume Control Playback Enum' directive output may be truncated writing 29 bytes into a region of size between 24 and 33 [-Wformat-truncation=]
    4808 |                                  "Line Out %02d Volume Control Playback Enum",
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett2.c:4807:25: note: 'snprintf' output between 41 and 50 bytes into a destination of size 44
    4807 |                         snprintf(s, sizeof(s),
         |                         ^~~~~~~~~~~~~~~~~~~~~~
    4808 |                                  "Line Out %02d Volume Control Playback Enum",
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4809 |                                  i + 1);
         |                                  ~~~~~~
   sound/usb/mixer_scarlett2.c: In function 'scarlett2_add_line_in_ctls':
   sound/usb/mixer_scarlett2.c:4928:56: warning: ' Link Capture Switch' directive output may be truncated writing 20 bytes into a region of size between 13 and 33 [-Wformat-truncation=]
    4928 |                                          "Line In %d-%d Link Capture Switch",
         |                                                        ^~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett2.c:4927:33: note: 'snprintf' output between 32 and 52 bytes into a destination of size 44
    4927 |                                 snprintf(s, sizeof(s),
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
    4928 |                                          "Line In %d-%d Link Capture Switch",
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4929 |                                          i, i + 1);
         |                                          ~~~~~~~~~
   sound/usb/mixer_scarlett2.c:4847:50: warning: '%s' directive output may be truncated writing 4 bytes into a region of size between 0 and 10 [-Wformat-truncation=]
    4847 |         const char *fmt = "Line In %d %s Capture %s";
         |                                                  ^~
   ......
    4955 |                                  "Autogain Status", "Enum");
         |                                                     ~~~~~~
   sound/usb/mixer_scarlett2.c:4954:25: note: 'snprintf' output between 39 and 49 bytes into a destination of size 44
    4954 |                         snprintf(s, sizeof(s), fmt, i + 1,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4955 |                                  "Autogain Status", "Enum");
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett2.c: In function 'snd_scarlett2_controls_create':
>> sound/usb/mixer_scarlett2.c:5320:53: warning: ' Playback Volume' directive output may be truncated writing 16 bytes into a region of size between 11 and 22 [-Wformat-truncation=]
    5320 |                         "Monitor %sMix %c Input %02d Playback Volume";
         |                                                     ^~~~~~~~~~~~~~~~
   In function 'scarlett2_add_direct_monitor_ctls',
       inlined from 'snd_scarlett2_controls_create' at sound/usb/mixer_scarlett2.c:6615:8:
   sound/usb/mixer_scarlett2.c:5337:33: note: 'snprintf' output between 39 and 50 bytes into a destination of size 44
    5337 |                                 snprintf(name, sizeof(name), format,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    5338 |                                          mix_type, 'A' + j, k + 1);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~


vim +5320 sound/usb/mixer_scarlett2.c

  5293	
  5294	static int scarlett2_add_direct_monitor_ctls(struct usb_mixer_interface *mixer)
  5295	{
  5296		struct scarlett2_data *private = mixer->private_data;
  5297		const struct scarlett2_device_info *info = private->info;
  5298		const char *s;
  5299		int err, i, j, k, index;
  5300	
  5301		if (!info->direct_monitor)
  5302			return 0;
  5303	
  5304		s = info->direct_monitor == 1
  5305		      ? "Direct Monitor Playback Switch"
  5306		      : "Direct Monitor Playback Enum";
  5307	
  5308		err = scarlett2_add_new_ctl(
  5309			mixer, &scarlett2_direct_monitor_ctl[info->direct_monitor - 1],
  5310			0, 1, s, &private->direct_monitor_ctl);
  5311		if (err < 0)
  5312			return err;
  5313	
  5314		if (!private->num_monitor_mix_ctls)
  5315			return 0;
  5316	
  5317		/* 1 or 2 direct monitor selections (Mono & Stereo) */
  5318		for (i = 0, index = 0; i < info->direct_monitor; i++) {
  5319			const char * const format =
> 5320				"Monitor %sMix %c Input %02d Playback Volume";
  5321			const char *mix_type;
  5322	
  5323			if (info->direct_monitor == 1)
  5324				mix_type = "";
  5325			else if (i == 0)
  5326				mix_type = "1 ";
  5327			else
  5328				mix_type = "2 ";
  5329	
  5330			/* 2 Mix outputs, A/Left & B/Right */
  5331			for (j = 0; j < 2; j++)
  5332	
  5333				/* Mix inputs */
  5334				for (k = 0; k < private->num_mix_in; k++, index++) {
  5335					char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
  5336	
  5337					snprintf(name, sizeof(name), format,
  5338						 mix_type, 'A' + j, k + 1);
  5339	
  5340					err = scarlett2_add_new_ctl(
  5341						mixer, &scarlett2_monitor_mix_ctl,
  5342						index, 1, name, NULL);
  5343					if (err < 0)
  5344						return err;
  5345				}
  5346		}
  5347	
  5348		return 0;
  5349	}
  5350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
