Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F9D3161BE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 20:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433975; cv=none; b=AuT3Wfnjc5d711IEWGqba0RR2xZN69lzp7O5jr/iwS+iilE32SHzZF4HyrTYn0JgsbFOpeH1VSx3ruOV/HefdqFDUUQWFCm91fxmOQV0n8mwCJgl4EMp1h/ss4TmPbCVCJ36h8P3CNRiVo1URIHfW7jV4h82CeEQYis01Gh6Qrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433975; c=relaxed/simple;
	bh=AAqOLrE08wY86j2iZ5yonYE6/r/TLKF7gowkewrvZdQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C0BjwtW99xIwS7zHdflaTYT91vM1qNa6UB3TZYsTSYGDubu9zAryTbZ0BaIszqWiDyYRNoLbdHrWGI2EbV4gOAxObnXGQUgEVe+v+1LXzRqu81LVB2zhVVl4zld2GDtlQbiiFvJavidEdzL4OejIDdISwkQbnojuc4if+d0WthQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/CdkWDq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/CdkWDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780433972; x=1811969972;
  h=date:from:to:cc:subject:message-id;
  bh=AAqOLrE08wY86j2iZ5yonYE6/r/TLKF7gowkewrvZdQ=;
  b=j/CdkWDqE/A9E2HTpAlyl0J51Xxnsc4zdki2apM+I80kGJ1yzAkR77Mr
   Z8Sfgm6rUZobDTkJQMI3q1G3IWMR91E5uYj1rqEQQHlqiPRO4rW5VjQwW
   8SuSEP6lsBhR6NHLNi+LTFvl4yBDnGMmzOyicMqcRRVccp6pIs14jVjAi
   K3AOINuu8qFtA5Dnp/GrCe53T4Gv18hjnIjoTvi+gGQaK5rmQMZuBCyAp
   x1MRxJJKHVM4q/RhXqQ2zT7NjUPyKVNLDkEg+iS6Jsjpbybcjl0/zvgnN
   Vt9ZIp5RTZ71H6j22fxVybCyhhYsWxGcoSyrAtsbV98CLHKdXllnYW4nV
   A==;
X-CSE-ConnectionGUID: sCeRX8XWQnyKOichtIfyvA==
X-CSE-MsgGUID: qck57CNlRKCcM5yvceHfUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81091760"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81091760"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 13:59:29 -0700
X-CSE-ConnectionGUID: ypljMjcoRHG3Yj55u+Lilw==
X-CSE-MsgGUID: IrGslEXBQi2mY+VVLtXXDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="244103653"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jun 2026 13:59:27 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUWCq-00000000CVo-3sFS;
	Tue, 02 Jun 2026 20:59:24 +0000
Date: Wed, 03 Jun 2026 04:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/intel/boards/sof_maxim_common.h:24:38: warning: 'struct
 snd_soc_card_platform' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202606030416.kjukTrfl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: b9692079ff7862be72856b5db574a06b03299af2 [290/290] ASoC: intel: sof_*: use snd_soc_card_register()
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260603/202606030416.kjukTrfl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030416.kjukTrfl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030416.kjukTrfl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/intel/boards/sof_rt5682.c:28:
>> sound/soc/intel/boards/sof_maxim_common.h:24:38: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      24 | void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_maxim_common.h:36:58: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      36 | void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
         |                                                          ^~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/intel/boards/sof_rt5682.c:29:
>> sound/soc/intel/boards/sof_realtek_common.h:27:55: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      27 | void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
         |                                                       ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_realtek_common.h:36:36: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      36 | void sof_rt1015p_codec_conf(struct snd_soc_card_platform *card_platform);
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_realtek_common.h:46:35: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      46 | void sof_rt1015_codec_conf(struct snd_soc_card_platform *card_platform);
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_rt5682.c:494:15: error: variable 'sof_audio_card_rt5682' has initializer but incomplete type
     494 | static struct snd_soc_card_platform sof_audio_card_rt5682 = {
         |               ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_rt5682.c:495:10: error: 'struct snd_soc_card_platform' has no member named 'name'
     495 |         .name = "rt5682", /* the sof- prefix is added by the core */
         |          ^~~~
>> sound/soc/intel/boards/sof_rt5682.c:495:17: warning: excess elements in struct initializer
     495 |         .name = "rt5682", /* the sof- prefix is added by the core */
         |                 ^~~~~~~~
   sound/soc/intel/boards/sof_rt5682.c:495:17: note: (near initialization for 'sof_audio_card_rt5682')
   sound/soc/intel/boards/sof_rt5682.c:496:10: error: 'struct snd_soc_card_platform' has no member named 'owner'
     496 |         .owner = THIS_MODULE,
         |          ^~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/resource_ext.h:9,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from sound/soc/intel/boards/sof_rt5682.c:8:
   include/linux/init.h:176:21: warning: excess elements in struct initializer
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/intel/boards/sof_rt5682.c:496:18: note: in expansion of macro 'THIS_MODULE'
     496 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   include/linux/init.h:176:21: note: (near initialization for 'sof_audio_card_rt5682')
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/intel/boards/sof_rt5682.c:496:18: note: in expansion of macro 'THIS_MODULE'
     496 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   sound/soc/intel/boards/sof_rt5682.c:497:10: error: 'struct snd_soc_card_platform' has no member named 'driver'
     497 |         .driver = {
         |          ^~~~~~
   sound/soc/intel/boards/sof_rt5682.c:497:19: error: extra brace group at end of initializer
     497 |         .driver = {
         |                   ^
   sound/soc/intel/boards/sof_rt5682.c:497:19: note: (near initialization for 'sof_audio_card_rt5682')
   sound/soc/intel/boards/sof_rt5682.c:497:19: warning: excess elements in struct initializer
   sound/soc/intel/boards/sof_rt5682.c:497:19: note: (near initialization for 'sof_audio_card_rt5682')
   sound/soc/intel/boards/sof_rt5682.c: In function 'sof_card_dai_links_create':
   sound/soc/intel/boards/sof_rt5682.c:540:63: error: invalid use of undefined type 'struct snd_soc_card_platform'
     540 |         ret = sof_intel_board_set_dai_link(dev, &card_platform->driver, ctx);
         |                                                               ^~
   sound/soc/intel/boards/sof_rt5682.c: In function 'sof_audio_probe':
   sound/soc/intel/boards/sof_rt5682.c:676:38: error: invalid use of undefined type 'struct snd_soc_card_platform'
     676 |                 sof_audio_card_rt5682.name = card_name;
         |                                      ^
   sound/soc/intel/boards/sof_rt5682.c:706:46: error: invalid use of undefined type 'struct snd_soc_card_platform'
     706 |                         sof_audio_card_rt5682.name = card_name;
         |                                              ^
   sound/soc/intel/boards/sof_rt5682.c:720:46: error: invalid use of undefined type 'struct snd_soc_card_platform'
     720 |                         sof_audio_card_rt5682.name = card_name;
         |                                              ^
   sound/soc/intel/boards/sof_rt5682.c:759:42: error: passing argument 1 of 'max_98373_set_codec_conf' from incompatible pointer type [-Wincompatible-pointer-types]
     759 |                 max_98373_set_codec_conf(&sof_audio_card_rt5682);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~
         |                                          |
         |                                          struct snd_soc_card_platform *
   sound/soc/intel/boards/sof_maxim_common.h:24:61: note: expected 'struct snd_soc_card_platform *' but argument is of type 'struct snd_soc_card_platform *'
      24 | void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   sound/soc/intel/boards/sof_rt5682.c:762:54: error: passing argument 2 of 'max_98390_set_codec_conf' from incompatible pointer type [-Wincompatible-pointer-types]
     762 |                 max_98390_set_codec_conf(&pdev->dev, &sof_audio_card_rt5682);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
         |                                                      |
         |                                                      struct snd_soc_card_platform *
   sound/soc/intel/boards/sof_maxim_common.h:36:81: note: expected 'struct snd_soc_card_platform *' but argument is of type 'struct snd_soc_card_platform *'
      36 | void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
         |                                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   sound/soc/intel/boards/sof_rt5682.c:765:51: error: passing argument 2 of 'sof_rt1011_codec_conf' from incompatible pointer type [-Wincompatible-pointer-types]
     765 |                 sof_rt1011_codec_conf(&pdev->dev, &sof_audio_card_rt5682);
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
         |                                                   |
         |                                                   struct snd_soc_card_platform *
   sound/soc/intel/boards/sof_realtek_common.h:27:78: note: expected 'struct snd_soc_card_platform *' but argument is of type 'struct snd_soc_card_platform *'
      27 | void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
         |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   sound/soc/intel/boards/sof_rt5682.c:768:39: error: passing argument 1 of 'sof_rt1015_codec_conf' from incompatible pointer type [-Wincompatible-pointer-types]
     768 |                 sof_rt1015_codec_conf(&sof_audio_card_rt5682);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       struct snd_soc_card_platform *
   sound/soc/intel/boards/sof_realtek_common.h:46:58: note: expected 'struct snd_soc_card_platform *' but argument is of type 'struct snd_soc_card_platform *'
      46 | void sof_rt1015_codec_conf(struct snd_soc_card_platform *card_platform);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   sound/soc/intel/boards/sof_rt5682.c:771:40: error: passing argument 1 of 'sof_rt1015p_codec_conf' from incompatible pointer type [-Wincompatible-pointer-types]
     771 |                 sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~
         |                                        |
         |                                        struct snd_soc_card_platform *
   sound/soc/intel/boards/sof_realtek_common.h:36:59: note: expected 'struct snd_soc_card_platform *' but argument is of type 'struct snd_soc_card_platform *'
      36 | void sof_rt1015p_codec_conf(struct snd_soc_card_platform *card_platform);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   sound/soc/intel/boards/sof_rt5682.c:786:52: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Wincompatible-pointer-types]
     786 |         card = devm_snd_soc_card_alloc(&pdev->dev, &sof_audio_card_rt5682);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
         |                                                    |
         |                                                    struct snd_soc_card_platform *
   In file included from include/sound/soc.h:1318,
                    from sound/soc/intel/boards/sof_rt5682.c:18:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct snd_soc_card_platform *'
      91 |                                              struct snd_soc_card_driver *driver);
--
   In file included from sound/soc/intel/boards/sof_cs42l42.c:24:
>> sound/soc/intel/boards/sof_maxim_common.h:24:38: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      24 | void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_maxim_common.h:36:58: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      36 | void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
         |                                                          ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_cs42l42.c:135:15: error: variable 'sof_audio_card_cs42l42' has initializer but incomplete type
     135 | static struct snd_soc_card_platform sof_audio_card_cs42l42 = {
         |               ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_cs42l42.c:136:10: error: 'struct snd_soc_card_platform' has no member named 'name'
     136 |         .name = "cs42l42", /* the sof- prefix is added by the core */
         |          ^~~~
>> sound/soc/intel/boards/sof_cs42l42.c:136:17: warning: excess elements in struct initializer
     136 |         .name = "cs42l42", /* the sof- prefix is added by the core */
         |                 ^~~~~~~~~
   sound/soc/intel/boards/sof_cs42l42.c:136:17: note: (near initialization for 'sof_audio_card_cs42l42')
   sound/soc/intel/boards/sof_cs42l42.c:137:10: error: 'struct snd_soc_card_platform' has no member named 'owner'
     137 |         .owner = THIS_MODULE,
         |          ^~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/resource_ext.h:9,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from sound/soc/intel/boards/sof_cs42l42.c:8:
   include/linux/init.h:176:21: warning: excess elements in struct initializer
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/intel/boards/sof_cs42l42.c:137:18: note: in expansion of macro 'THIS_MODULE'
     137 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   include/linux/init.h:176:21: note: (near initialization for 'sof_audio_card_cs42l42')
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/intel/boards/sof_cs42l42.c:137:18: note: in expansion of macro 'THIS_MODULE'
     137 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   sound/soc/intel/boards/sof_cs42l42.c:138:10: error: 'struct snd_soc_card_platform' has no member named 'driver'
     138 |         .driver = {
         |          ^~~~~~
   sound/soc/intel/boards/sof_cs42l42.c:138:19: error: extra brace group at end of initializer
     138 |         .driver = {
         |                   ^
   sound/soc/intel/boards/sof_cs42l42.c:138:19: note: (near initialization for 'sof_audio_card_cs42l42')
   sound/soc/intel/boards/sof_cs42l42.c:138:19: warning: excess elements in struct initializer
   sound/soc/intel/boards/sof_cs42l42.c:138:19: note: (near initialization for 'sof_audio_card_cs42l42')
   sound/soc/intel/boards/sof_cs42l42.c: In function 'sof_card_dai_links_create':
   sound/soc/intel/boards/sof_cs42l42.c:163:63: error: invalid use of undefined type 'struct snd_soc_card_platform'
     163 |         ret = sof_intel_board_set_dai_link(dev, &card_platform->driver, ctx);
         |                                                               ^~
   sound/soc/intel/boards/sof_cs42l42.c: In function 'sof_audio_probe':
   sound/soc/intel/boards/sof_cs42l42.c:243:52: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Wincompatible-pointer-types]
     243 |         card = devm_snd_soc_card_alloc(&pdev->dev, &sof_audio_card_cs42l42);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                    |
         |                                                    struct snd_soc_card_platform *
   In file included from include/sound/soc.h:1318,
                    from sound/soc/intel/boards/sof_cs42l42.c:18:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct snd_soc_card_platform *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   sound/soc/intel/boards/sof_cs42l42.c: At top level:
   sound/soc/intel/boards/sof_cs42l42.c:135:37: error: storage size of 'sof_audio_card_cs42l42' isn't known
     135 | static struct snd_soc_card_platform sof_audio_card_cs42l42 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from sound/soc/intel/boards/sof_nau8825.c:24:
>> sound/soc/intel/boards/sof_realtek_common.h:27:55: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      27 | void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
         |                                                       ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_realtek_common.h:36:36: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      36 | void sof_rt1015p_codec_conf(struct snd_soc_card_platform *card_platform);
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_realtek_common.h:46:35: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      46 | void sof_rt1015_codec_conf(struct snd_soc_card_platform *card_platform);
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/intel/boards/sof_nau8825.c:25:
>> sound/soc/intel/boards/sof_maxim_common.h:24:38: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      24 | void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_maxim_common.h:36:58: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      36 | void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
         |                                                          ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_nau8825.c:160:15: error: variable 'sof_audio_card_nau8825' has initializer but incomplete type
     160 | static struct snd_soc_card_platform sof_audio_card_nau8825 = {
         |               ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_nau8825.c:161:10: error: 'struct snd_soc_card_platform' has no member named 'name'
     161 |         .name = "nau8825", /* the sof- prefix is added by the core */
         |          ^~~~
>> sound/soc/intel/boards/sof_nau8825.c:161:17: warning: excess elements in struct initializer
     161 |         .name = "nau8825", /* the sof- prefix is added by the core */
         |                 ^~~~~~~~~
   sound/soc/intel/boards/sof_nau8825.c:161:17: note: (near initialization for 'sof_audio_card_nau8825')
   sound/soc/intel/boards/sof_nau8825.c:162:10: error: 'struct snd_soc_card_platform' has no member named 'owner'
     162 |         .owner = THIS_MODULE,
         |          ^~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/resource_ext.h:9,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from sound/soc/intel/boards/sof_nau8825.c:9:
   include/linux/init.h:176:21: warning: excess elements in struct initializer
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/intel/boards/sof_nau8825.c:162:18: note: in expansion of macro 'THIS_MODULE'
     162 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   include/linux/init.h:176:21: note: (near initialization for 'sof_audio_card_nau8825')
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/intel/boards/sof_nau8825.c:162:18: note: in expansion of macro 'THIS_MODULE'
     162 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   sound/soc/intel/boards/sof_nau8825.c:163:10: error: 'struct snd_soc_card_platform' has no member named 'driver'
     163 |         .driver = {
         |          ^~~~~~
   sound/soc/intel/boards/sof_nau8825.c:163:19: error: extra brace group at end of initializer
     163 |         .driver = {
         |                   ^
   sound/soc/intel/boards/sof_nau8825.c:163:19: note: (near initialization for 'sof_audio_card_nau8825')
   sound/soc/intel/boards/sof_nau8825.c:163:19: warning: excess elements in struct initializer
   sound/soc/intel/boards/sof_nau8825.c:163:19: note: (near initialization for 'sof_audio_card_nau8825')
   sound/soc/intel/boards/sof_nau8825.c: In function 'sof_card_dai_links_create':
   sound/soc/intel/boards/sof_nau8825.c:188:63: error: invalid use of undefined type 'struct snd_soc_card_platform'
     188 |         ret = sof_intel_board_set_dai_link(dev, &card_platform->driver, ctx);
         |                                                               ^~
   sound/soc/intel/boards/sof_nau8825.c: In function 'sof_audio_probe':
   sound/soc/intel/boards/sof_nau8825.c:265:42: error: passing argument 1 of 'max_98373_set_codec_conf' from incompatible pointer type [-Wincompatible-pointer-types]
     265 |                 max_98373_set_codec_conf(&sof_audio_card_nau8825);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                                          |
         |                                          struct snd_soc_card_platform *
   sound/soc/intel/boards/sof_maxim_common.h:24:61: note: expected 'struct snd_soc_card_platform *' but argument is of type 'struct snd_soc_card_platform *'
      24 | void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   sound/soc/intel/boards/sof_nau8825.c:268:40: error: passing argument 1 of 'sof_rt1015p_codec_conf' from incompatible pointer type [-Wincompatible-pointer-types]
     268 |                 sof_rt1015p_codec_conf(&sof_audio_card_nau8825);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~
         |                                        |
         |                                        struct snd_soc_card_platform *
   sound/soc/intel/boards/sof_realtek_common.h:36:59: note: expected 'struct snd_soc_card_platform *' but argument is of type 'struct snd_soc_card_platform *'
      36 | void sof_rt1015p_codec_conf(struct snd_soc_card_platform *card_platform);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   sound/soc/intel/boards/sof_nau8825.c:281:52: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Wincompatible-pointer-types]
     281 |         card = devm_snd_soc_card_alloc(&pdev->dev, &sof_audio_card_nau8825);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                    |
         |                                                    struct snd_soc_card_platform *
   In file included from include/sound/soc.h:1318,
                    from sound/soc/intel/boards/sof_nau8825.c:18:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct snd_soc_card_platform *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   sound/soc/intel/boards/sof_nau8825.c: At top level:
   sound/soc/intel/boards/sof_nau8825.c:160:37: error: storage size of 'sof_audio_card_nau8825' isn't known
     160 | static struct snd_soc_card_platform sof_audio_card_nau8825 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from sound/soc/intel/boards/sof_da7219.c:19:
>> sound/soc/intel/boards/sof_maxim_common.h:24:38: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      24 | void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_maxim_common.h:36:58: warning: 'struct snd_soc_card_platform' declared inside parameter list will not be visible outside of this definition or declaration
      36 | void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
         |                                                          ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_da7219.c:198:15: error: variable 'card_da7219' has initializer but incomplete type
     198 | static struct snd_soc_card_platform card_da7219 = {
         |               ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_da7219.c:199:10: error: 'struct snd_soc_card_platform' has no member named 'name'
     199 |         .name = "da7219", /* the sof- prefix is added by the core */
         |          ^~~~
>> sound/soc/intel/boards/sof_da7219.c:199:17: warning: excess elements in struct initializer
     199 |         .name = "da7219", /* the sof- prefix is added by the core */
         |                 ^~~~~~~~
   sound/soc/intel/boards/sof_da7219.c:199:17: note: (near initialization for 'card_da7219')
   sound/soc/intel/boards/sof_da7219.c:200:10: error: 'struct snd_soc_card_platform' has no member named 'owner'
     200 |         .owner = THIS_MODULE,
         |          ^~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/log2.h:12,
                    from arch/x86/include/asm/div64.h:8,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/input.h:8,
                    from sound/soc/intel/boards/sof_da7219.c:8:
   include/linux/init.h:176:21: warning: excess elements in struct initializer
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/intel/boards/sof_da7219.c:200:18: note: in expansion of macro 'THIS_MODULE'
     200 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   include/linux/init.h:176:21: note: (near initialization for 'card_da7219')
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/intel/boards/sof_da7219.c:200:18: note: in expansion of macro 'THIS_MODULE'
     200 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   sound/soc/intel/boards/sof_da7219.c:201:10: error: 'struct snd_soc_card_platform' has no member named 'driver'
     201 |         .driver = {
         |          ^~~~~~
   sound/soc/intel/boards/sof_da7219.c:201:19: error: extra brace group at end of initializer
     201 |         .driver = {
         |                   ^
   sound/soc/intel/boards/sof_da7219.c:201:19: note: (near initialization for 'card_da7219')
   sound/soc/intel/boards/sof_da7219.c:201:19: warning: excess elements in struct initializer
   sound/soc/intel/boards/sof_da7219.c:201:19: note: (near initialization for 'card_da7219')
   sound/soc/intel/boards/sof_da7219.c: In function 'sof_card_dai_links_create':
   sound/soc/intel/boards/sof_da7219.c:226:63: error: invalid use of undefined type 'struct snd_soc_card_platform'
     226 |         ret = sof_intel_board_set_dai_link(dev, &card_platform->driver, ctx);
         |                                                               ^~
   sound/soc/intel/boards/sof_da7219.c: In function 'audio_probe':
   sound/soc/intel/boards/sof_da7219.c:332:36: error: invalid use of undefined type 'struct snd_soc_card_platform'
     332 |                         card_da7219.name = card_name;
         |                                    ^
   sound/soc/intel/boards/sof_da7219.c:349:36: error: invalid use of undefined type 'struct snd_soc_card_platform'
     349 |                         card_da7219.name = card_name;
         |                                    ^
   sound/soc/intel/boards/sof_da7219.c:358:36: error: invalid use of undefined type 'struct snd_soc_card_platform'
     358 |                         card_da7219.name = card_name;
         |                                    ^
   sound/soc/intel/boards/sof_da7219.c:375:36: error: invalid use of undefined type 'struct snd_soc_card_platform'
     375 |                         card_da7219.name = card_name;
         |                                    ^
   sound/soc/intel/boards/sof_da7219.c:383:36: error: invalid use of undefined type 'struct snd_soc_card_platform'
     383 |                         card_da7219.name = card_name;
         |                                    ^
   sound/soc/intel/boards/sof_da7219.c:401:42: error: passing argument 1 of 'max_98373_set_codec_conf' from incompatible pointer type [-Wincompatible-pointer-types]
     401 |                 max_98373_set_codec_conf(&card_da7219);
         |                                          ^~~~~~~~~~~~
         |                                          |
         |                                          struct snd_soc_card_platform *
   sound/soc/intel/boards/sof_maxim_common.h:24:61: note: expected 'struct snd_soc_card_platform *' but argument is of type 'struct snd_soc_card_platform *'
      24 | void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   sound/soc/intel/boards/sof_da7219.c:404:54: error: passing argument 2 of 'max_98390_set_codec_conf' from incompatible pointer type [-Wincompatible-pointer-types]
     404 |                 max_98390_set_codec_conf(&pdev->dev, &card_da7219);
         |                                                      ^~~~~~~~~~~~
         |                                                      |
         |                                                      struct snd_soc_card_platform *
   sound/soc/intel/boards/sof_maxim_common.h:36:81: note: expected 'struct snd_soc_card_platform *' but argument is of type 'struct snd_soc_card_platform *'
      36 | void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
         |                                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   sound/soc/intel/boards/sof_da7219.c:416:52: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Wincompatible-pointer-types]
     416 |         card = devm_snd_soc_card_alloc(&pdev->dev, &card_da7219);
         |                                                    ^~~~~~~~~~~~
         |                                                    |
         |                                                    struct snd_soc_card_platform *
   In file included from include/sound/soc.h:1318,
                    from sound/soc/intel/boards/sof_da7219.c:14:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct snd_soc_card_platform *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   sound/soc/intel/boards/sof_da7219.c: At top level:
   sound/soc/intel/boards/sof_da7219.c:198:37: error: storage size of 'card_da7219' isn't known
     198 | static struct snd_soc_card_platform card_da7219 = {
         |                                     ^~~~~~~~~~~
..


vim +24 sound/soc/intel/boards/sof_maxim_common.h

    22	
    23	void max_98373_dai_link(struct device *dev, struct snd_soc_dai_link *link);
  > 24	void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
    25	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
