Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53441C2EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 10:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692960721; x=1724496721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3HNm/6a9XHt0w9oaO2F07Ql+LmtVdx6BDfueJqdI2yo=;
  b=FbxmzC7RraGI1hgCFoejLyTv0TV30zPUcWB7UfEJQEvzJtPEOe5LSs7P
   vH6tj2y28uD0mdu+8o5Q63BRKEXu076KhhMxcJhOnnDkp2ANYQG8kblSA
   AO9A1OECL62ikNR28djArMsVyX8+KbjpfPv4zPsXjqOMvuPr820M0AHiA
   tue67tODG0EUnbX/OJTQGm0tCupHP19jhyDKazIj0lqBemjlgJHARsats
   cTKHG9daueGzTpJd5Vr1h+V2V0JWE2aN0OVJY7eXI1MEz/2e5xTYGi89q
   ssaUsaI6G1IfNGqn5e918U2j7drOSdYStit5Zdft6RSkbNSTHZNOYOIQv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="461048668"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="461048668"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 03:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="827549432"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="827549432"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2023 03:51:55 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZUPy-0003T6-11;
	Fri, 25 Aug 2023 10:51:54 +0000
Date: Fri, 25 Aug 2023 18:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12822/12910] sound/core/ump.c:1194:53: warning:
 '%s' directive output may be truncated writing up to 127 bytes into a region
 of size 80
Message-ID: <202308251844.1FuQYsql-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6269320850097903b30be8f07a5c61d9f7592393
commit: 7266869cd146d5b98a659dad9afb747e90fc45ce [12822/12910] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230825/202308251844.1FuQYsql-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251844.1FuQYsql-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251844.1FuQYsql-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/ump.c: In function 'snd_ump_attach_legacy_rawmidi':
>> sound/core/ump.c:1194:53: warning: '%s' directive output may be truncated writing up to 127 bytes into a region of size 80 [-Wformat-truncation=]
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%s (MIDI 1.0)",
         |                                                     ^~
   sound/core/ump.c:1194:9: note: 'snprintf' output between 12 and 139 bytes into a destination of size 80
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%s (MIDI 1.0)",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1195 |                  ump->info.name);
         |                  ~~~~~~~~~~~~~~~
>> sound/core/ump.c:1194:53: warning: '%s' directive output may be truncated writing up to 127 bytes into a region of size 80 [-Wformat-truncation=]
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%s (MIDI 1.0)",
         |                                                     ^~
   sound/core/ump.c:1194:9: note: 'snprintf' output between 12 and 139 bytes into a destination of size 80
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%s (MIDI 1.0)",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1195 |                  ump->info.name);
         |                  ~~~~~~~~~~~~~~~
>> sound/core/ump.c:1194:53: warning: '%s' directive output may be truncated writing up to 127 bytes into a region of size 80 [-Wformat-truncation=]
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%s (MIDI 1.0)",
         |                                                     ^~
   sound/core/ump.c:1194:9: note: 'snprintf' output between 12 and 139 bytes into a destination of size 80
    1194 |         snprintf(rmidi->name, sizeof(rmidi->name), "%s (MIDI 1.0)",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1195 |                  ump->info.name);
         |                  ~~~~~~~~~~~~~~~
>> sound/core/ump.c:1160:63: warning: '%s' directive output may be truncated writing up to 127 bytes into a region of size between 21 and 23 [-Wformat-truncation=]
    1160 |                 snprintf(s->name, sizeof(s->name), "Group %d (%s)",
         |                                                               ^~
   In function 'fill_substream_names',
       inlined from 'snd_ump_attach_legacy_rawmidi' at sound/core/ump.c:1201:3:
   sound/core/ump.c:1160:17: note: 'snprintf' output between 11 and 140 bytes into a destination of size 32
    1160 |                 snprintf(s->name, sizeof(s->name), "Group %d (%s)",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1161 |                          ump->legacy_mapping[s->number] + 1, ump->info.name);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/ump.c: In function 'snd_ump_attach_legacy_rawmidi':
>> sound/core/ump.c:1160:63: warning: '%s' directive output may be truncated writing up to 127 bytes into a region of size between 21 and 23 [-Wformat-truncation=]
    1160 |                 snprintf(s->name, sizeof(s->name), "Group %d (%s)",
         |                                                               ^~
   In function 'fill_substream_names',
       inlined from 'snd_ump_attach_legacy_rawmidi' at sound/core/ump.c:1203:3:
   sound/core/ump.c:1160:17: note: 'snprintf' output between 11 and 140 bytes into a destination of size 32
    1160 |                 snprintf(s->name, sizeof(s->name), "Group %d (%s)",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1161 |                          ump->legacy_mapping[s->number] + 1, ump->info.name);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1194 sound/core/ump.c

b2bcbd031d34d1b Takashi Iwai 2023-08-24  1153  
1761f4cc114af53 Takashi Iwai 2023-08-24  1154  static void fill_substream_names(struct snd_ump_endpoint *ump,
1761f4cc114af53 Takashi Iwai 2023-08-24  1155  				 struct snd_rawmidi *rmidi, int dir)
1761f4cc114af53 Takashi Iwai 2023-08-24  1156  {
1761f4cc114af53 Takashi Iwai 2023-08-24  1157  	struct snd_rawmidi_substream *s;
1761f4cc114af53 Takashi Iwai 2023-08-24  1158  
1761f4cc114af53 Takashi Iwai 2023-08-24  1159  	list_for_each_entry(s, &rmidi->streams[dir].substreams, list)
1761f4cc114af53 Takashi Iwai 2023-08-24 @1160  		snprintf(s->name, sizeof(s->name), "Group %d (%s)",
b2bcbd031d34d1b Takashi Iwai 2023-08-24  1161  			 ump->legacy_mapping[s->number] + 1, ump->info.name);
1761f4cc114af53 Takashi Iwai 2023-08-24  1162  }
1761f4cc114af53 Takashi Iwai 2023-08-24  1163  
0b5288f5fe63eab Takashi Iwai 2023-05-23  1164  int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
0b5288f5fe63eab Takashi Iwai 2023-05-23  1165  				  char *id, int device)
0b5288f5fe63eab Takashi Iwai 2023-05-23  1166  {
0b5288f5fe63eab Takashi Iwai 2023-05-23  1167  	struct snd_rawmidi *rmidi;
0b5288f5fe63eab Takashi Iwai 2023-05-23  1168  	bool input, output;
b2bcbd031d34d1b Takashi Iwai 2023-08-24  1169  	int err, num;
0b5288f5fe63eab Takashi Iwai 2023-05-23  1170  
b2bcbd031d34d1b Takashi Iwai 2023-08-24  1171  	ump->out_cvts = kcalloc(SNDRV_UMP_MAX_GROUPS,
b2bcbd031d34d1b Takashi Iwai 2023-08-24  1172  				sizeof(*ump->out_cvts), GFP_KERNEL);
33cd7630782df22 Takashi Iwai 2023-06-23  1173  	if (!ump->out_cvts)
33cd7630782df22 Takashi Iwai 2023-06-23  1174  		return -ENOMEM;
0b5288f5fe63eab Takashi Iwai 2023-05-23  1175  
b2bcbd031d34d1b Takashi Iwai 2023-08-24  1176  	num = fill_legacy_mapping(ump);
b2bcbd031d34d1b Takashi Iwai 2023-08-24  1177  
0b5288f5fe63eab Takashi Iwai 2023-05-23  1178  	input = ump->core.info_flags & SNDRV_RAWMIDI_INFO_INPUT;
0b5288f5fe63eab Takashi Iwai 2023-05-23  1179  	output = ump->core.info_flags & SNDRV_RAWMIDI_INFO_OUTPUT;
0b5288f5fe63eab Takashi Iwai 2023-05-23  1180  	err = snd_rawmidi_new(ump->core.card, id, device,
b2bcbd031d34d1b Takashi Iwai 2023-08-24  1181  			      output ? num : 0, input ? num : 0,
0b5288f5fe63eab Takashi Iwai 2023-05-23  1182  			      &rmidi);
0b5288f5fe63eab Takashi Iwai 2023-05-23  1183  	if (err < 0) {
33cd7630782df22 Takashi Iwai 2023-06-23  1184  		kfree(ump->out_cvts);
0b5288f5fe63eab Takashi Iwai 2023-05-23  1185  		return err;
0b5288f5fe63eab Takashi Iwai 2023-05-23  1186  	}
0b5288f5fe63eab Takashi Iwai 2023-05-23  1187  
0b5288f5fe63eab Takashi Iwai 2023-05-23  1188  	if (input)
0b5288f5fe63eab Takashi Iwai 2023-05-23  1189  		snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT,
0b5288f5fe63eab Takashi Iwai 2023-05-23  1190  				    &snd_ump_legacy_input_ops);
0b5288f5fe63eab Takashi Iwai 2023-05-23  1191  	if (output)
0b5288f5fe63eab Takashi Iwai 2023-05-23  1192  		snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,
0b5288f5fe63eab Takashi Iwai 2023-05-23  1193  				    &snd_ump_legacy_output_ops);
5f11dd938fe7657 Takashi Iwai 2023-08-24 @1194  	snprintf(rmidi->name, sizeof(rmidi->name), "%s (MIDI 1.0)",
5f11dd938fe7657 Takashi Iwai 2023-08-24  1195  		 ump->info.name);
0b5288f5fe63eab Takashi Iwai 2023-05-23  1196  	rmidi->info_flags = ump->core.info_flags & ~SNDRV_RAWMIDI_INFO_UMP;
0b5288f5fe63eab Takashi Iwai 2023-05-23  1197  	rmidi->ops = &snd_ump_legacy_ops;
0b5288f5fe63eab Takashi Iwai 2023-05-23  1198  	rmidi->private_data = ump;
0b5288f5fe63eab Takashi Iwai 2023-05-23  1199  	ump->legacy_rmidi = rmidi;
1761f4cc114af53 Takashi Iwai 2023-08-24  1200  	if (input)
1761f4cc114af53 Takashi Iwai 2023-08-24  1201  		fill_substream_names(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
1761f4cc114af53 Takashi Iwai 2023-08-24  1202  	if (output)
1761f4cc114af53 Takashi Iwai 2023-08-24  1203  		fill_substream_names(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
1761f4cc114af53 Takashi Iwai 2023-08-24  1204  
0b5288f5fe63eab Takashi Iwai 2023-05-23  1205  	ump_dbg(ump, "Created a legacy rawmidi #%d (%s)\n", device, id);
0b5288f5fe63eab Takashi Iwai 2023-05-23  1206  	return 0;
0b5288f5fe63eab Takashi Iwai 2023-05-23  1207  }
0b5288f5fe63eab Takashi Iwai 2023-05-23  1208  EXPORT_SYMBOL_GPL(snd_ump_attach_legacy_rawmidi);
0b5288f5fe63eab Takashi Iwai 2023-05-23  1209  #endif /* CONFIG_SND_UMP_LEGACY_RAWMIDI */
0b5288f5fe63eab Takashi Iwai 2023-05-23  1210  

:::::: The code at line 1194 was first introduced by commit
:::::: 5f11dd938fe7657899ca79b2ffc4d708e43f4737 ALSA: usb-audio: Attach legacy rawmidi after probing all UMP EPs

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
