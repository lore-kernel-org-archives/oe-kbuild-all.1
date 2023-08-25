Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1A31079A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 16:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692981653; x=1724517653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t1aaER48jvnZ4Jshqqd5KgPr1m0n1mgeWiVND+yt7os=;
  b=naTv7Yn9um6RCHDcACuWH7I3dKX7OYMJy5m47Q27o0+wgpgDqT764vA7
   6uz5PC84Z47gFN5LfgJKhSeIIjpJ2zvsL4zFNCRrZrZNW1URqO27dgURK
   UcLF3mhQg5cWCBU4MPS5bpV0Es3W/PiQPqhkl+iGLhhD1wBkGSxHMVD4Z
   /pm8X3zozghnLOmj7yVn29UNxR4Kew9S0ekVVo8je7kTFzDEldazMieHB
   sCE3v5sVXHPnegnKLjzFwGyj+ZZQdZomi83Qy0zXbeODK0f7V4ZBgkI2Q
   bNUWDj+E6H2qGO5FVtf5yWaMHIBtLEESWBKRx9iX1FOzCRf8D7DSPT+4w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="355083169"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="355083169"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 09:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068289815"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="1068289815"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2023 09:40:50 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZZre-0003oV-0r;
	Fri, 25 Aug 2023 16:40:50 +0000
Date: Sat, 26 Aug 2023 00:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ALSA: ump: Fix -Wformat-truncation warnings
Message-ID: <202308260007.XSqTaJOf-lkp@intel.com>
References: <20230825150915.1595-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825150915.1595-1-tiwai@suse.de>

Hi Takashi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230825]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus v6.5-rc7 v6.5-rc6 v6.5-rc5 linus/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/ALSA-ump-Fix-Wformat-truncation-warnings/20230825-231128
base:   next-20230825
patch link:    https://lore.kernel.org/r/20230825150915.1595-1-tiwai%40suse.de
patch subject: [PATCH] ALSA: ump: Fix -Wformat-truncation warnings
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230826/202308260007.XSqTaJOf-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260007.XSqTaJOf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260007.XSqTaJOf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/ump.c: In function 'snd_ump_attach_legacy_rawmidi':
>> sound/core/ump.c:1194:69: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%.69s (MIDI 1.0)",
         |                                                                     ^
   sound/core/ump.c:1194:9: note: 'snprintf' output between 12 and 81 bytes into a destination of size 80
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%.69s (MIDI 1.0)",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1195 |                  ump->info.name);
         |                  ~~~~~~~~~~~~~~~
>> sound/core/ump.c:1194:69: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%.69s (MIDI 1.0)",
         |                                                                     ^
   sound/core/ump.c:1194:9: note: 'snprintf' output between 12 and 81 bytes into a destination of size 80
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%.69s (MIDI 1.0)",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1195 |                  ump->info.name);
         |                  ~~~~~~~~~~~~~~~
>> sound/core/ump.c:1194:69: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%.69s (MIDI 1.0)",
         |                                                                     ^
   sound/core/ump.c:1194:9: note: 'snprintf' output between 12 and 81 bytes into a destination of size 80
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%.69s (MIDI 1.0)",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1195 |                  ump->info.name);
         |                  ~~~~~~~~~~~~~~~
>> sound/core/ump.c:1194:69: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%.69s (MIDI 1.0)",
         |                                                                     ^
   sound/core/ump.c:1194:9: note: 'snprintf' output between 12 and 81 bytes into a destination of size 80
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%.69s (MIDI 1.0)",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1195 |                  ump->info.name);
         |                  ~~~~~~~~~~~~~~~


vim +/snprintf +1194 sound/core/ump.c

  1163	
  1164	int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
  1165					  char *id, int device)
  1166	{
  1167		struct snd_rawmidi *rmidi;
  1168		bool input, output;
  1169		int err, num;
  1170	
  1171		ump->out_cvts = kcalloc(SNDRV_UMP_MAX_GROUPS,
  1172					sizeof(*ump->out_cvts), GFP_KERNEL);
  1173		if (!ump->out_cvts)
  1174			return -ENOMEM;
  1175	
  1176		num = fill_legacy_mapping(ump);
  1177	
  1178		input = ump->core.info_flags & SNDRV_RAWMIDI_INFO_INPUT;
  1179		output = ump->core.info_flags & SNDRV_RAWMIDI_INFO_OUTPUT;
  1180		err = snd_rawmidi_new(ump->core.card, id, device,
  1181				      output ? num : 0, input ? num : 0,
  1182				      &rmidi);
  1183		if (err < 0) {
  1184			kfree(ump->out_cvts);
  1185			return err;
  1186		}
  1187	
  1188		if (input)
  1189			snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT,
  1190					    &snd_ump_legacy_input_ops);
  1191		if (output)
  1192			snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,
  1193					    &snd_ump_legacy_output_ops);
> 1194		snprintf(rmidi->name, sizeof(rmidi->name), "%.69s (MIDI 1.0)",
  1195			 ump->info.name);
  1196		rmidi->info_flags = ump->core.info_flags & ~SNDRV_RAWMIDI_INFO_UMP;
  1197		rmidi->ops = &snd_ump_legacy_ops;
  1198		rmidi->private_data = ump;
  1199		ump->legacy_rmidi = rmidi;
  1200		if (input)
  1201			fill_substream_names(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
  1202		if (output)
  1203			fill_substream_names(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
  1204	
  1205		ump_dbg(ump, "Created a legacy rawmidi #%d (%s)\n", device, id);
  1206		return 0;
  1207	}
  1208	EXPORT_SYMBOL_GPL(snd_ump_attach_legacy_rawmidi);
  1209	#endif /* CONFIG_SND_UMP_LEGACY_RAWMIDI */
  1210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
