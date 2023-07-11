Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C075519BBA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 16:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689091509; x=1720627509;
  h=date:from:cc:subject:message-id:mime-version;
  bh=P9YFyHxQSnIaGyUaKSrNV6usQQqtWQcAUouPYL/j+Vw=;
  b=J2ffICZ1JoZyD9r3x+jEJgOxSIvPbvgOAGQ73LsxUfHX+qkbAqhtLyYF
   vuWFyybTwRGmDwfLMyapHLMTM7f0YqEJkXpzAe3OnouN7oOj2CVWXFhU7
   dSbzAY1qTsigRFaCVIHnthlZJAcb1n8DO9uxio20HLTc6nJL/1SMY2dNE
   1z605elH8D0L3cTq6AmfiSr5u7tAKy2ezaYzaI/zo6rSS6RSJqtISo2CM
   2NhJAafK0dIfpETJNwY7YsQNUfHn4h8Yjv/UcL0q0m4tMbpI2TjGsOLAH
   KCLLeSRCojT+j4jvlqK2BBBAT92xIvFjH0vqYYxCxQfPPjVSajLzJIX1I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="428357099"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="428357099"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 09:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="791255346"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="791255346"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2023 09:05:07 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJFrO-0004vD-2f;
	Tue, 11 Jul 2023 16:05:06 +0000
Date: Wed, 12 Jul 2023 00:04:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Hardik Shah <hardik.t.shah@intel.com>
Subject: [intel-lts:4.19/android_s 3863/30000]
 sound/soc/codecs/rt700.c:1136:5: warning: no previous prototype for
 'rt700_pcm_hw_free'
Message-ID: <202307120049.fb8gsAWQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   d86cf6f06c9415a617dd1a1e3c9dc081a3cf0f8f
commit: c36af003bab3f4722b78a13d335474c853d12bfd [3863/30000] ASoC: add rt700 codec driver
config: i386-randconfig-i005-20230710 (https://download.01.org/0day-ci/archive/20230712/202307120049.fb8gsAWQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120049.fb8gsAWQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120049.fb8gsAWQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from sound/soc/codecs/rt700.c:16:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1156:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1156 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1147:27: note: 'mem_section' declared here
    1147 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   sound/soc/codecs/rt700.c: In function 'rt700_hda_read':
   sound/soc/codecs/rt700.c:561:29: warning: unused variable 'val_l' [-Wunused-variable]
     561 |         unsigned int val_h, val_l;
         |                             ^~~~~
   sound/soc/codecs/rt700.c:561:22: warning: unused variable 'val_h' [-Wunused-variable]
     561 |         unsigned int val_h, val_l;
         |                      ^~~~~
   sound/soc/codecs/rt700.c:560:13: warning: unused variable 'ret' [-Wunused-variable]
     560 |         int ret;
         |             ^~~
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9:
   sound/soc/codecs/rt700.c: In function 'rt700_set_amp_gain_put':
   include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:343:16: note: in expansion of macro 'KERN_DEBUG'
     343 |         printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   sound/soc/codecs/rt700.c:669:9: note: in expansion of macro 'pr_debug'
     669 |         pr_debug("%s val = %d, %d\n", __func__, ucontrol->value.integer.value[0],
         |         ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:343:16: note: in expansion of macro 'KERN_DEBUG'
     343 |         printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   sound/soc/codecs/rt700.c:669:9: note: in expansion of macro 'pr_debug'
     669 |         pr_debug("%s val = %d, %d\n", __func__, ucontrol->value.integer.value[0],
         |         ^~~~~~~~
   sound/soc/codecs/rt700.c: At top level:
>> sound/soc/codecs/rt700.c:1136:5: warning: no previous prototype for 'rt700_pcm_hw_free' [-Wmissing-prototypes]
    1136 | int rt700_pcm_hw_free(struct snd_pcm_substream *substream,
         |     ^~~~~~~~~~~~~~~~~
   sound/soc/codecs/rt700.c: In function 'rt700_index_cmd_show':
   sound/soc/codecs/rt700.c:1206:46: warning: unused variable 'sdw_data_1' [-Wunused-variable]
    1206 |         unsigned int sdw_data_3, sdw_data_2, sdw_data_1, sdw_data_0;
         |                                              ^~~~~~~~~~
   sound/soc/codecs/rt700.c:1206:34: warning: unused variable 'sdw_data_2' [-Wunused-variable]
    1206 |         unsigned int sdw_data_3, sdw_data_2, sdw_data_1, sdw_data_0;
         |                                  ^~~~~~~~~~
   sound/soc/codecs/rt700.c:1206:22: warning: unused variable 'sdw_data_3' [-Wunused-variable]
    1206 |         unsigned int sdw_data_3, sdw_data_2, sdw_data_1, sdw_data_0;
         |                      ^~~~~~~~~~
   sound/soc/codecs/rt700.c:1205:34: warning: unused variable 'sdw_addr_l' [-Wunused-variable]
    1205 |         unsigned int sdw_addr_h, sdw_addr_l;
         |                                  ^~~~~~~~~~
   sound/soc/codecs/rt700.c:1205:22: warning: unused variable 'sdw_addr_h' [-Wunused-variable]
    1205 |         unsigned int sdw_addr_h, sdw_addr_l;
         |                      ^~~~~~~~~~
   sound/soc/codecs/rt700.c: In function 'rt700_index_cmd_store':
   sound/soc/codecs/rt700.c:1227:58: warning: unused variable 'sdw_data_l' [-Wunused-variable]
    1227 |         unsigned int sdw_addr_h, sdw_addr_l, sdw_data_h, sdw_data_l;
         |                                                          ^~~~~~~~~~
   sound/soc/codecs/rt700.c:1227:46: warning: unused variable 'sdw_data_h' [-Wunused-variable]
    1227 |         unsigned int sdw_addr_h, sdw_addr_l, sdw_data_h, sdw_data_l;
         |                                              ^~~~~~~~~~
   sound/soc/codecs/rt700.c:1227:34: warning: unused variable 'sdw_addr_l' [-Wunused-variable]
    1227 |         unsigned int sdw_addr_h, sdw_addr_l, sdw_data_h, sdw_data_l;
         |                                  ^~~~~~~~~~
   sound/soc/codecs/rt700.c:1227:22: warning: unused variable 'sdw_addr_h' [-Wunused-variable]
    1227 |         unsigned int sdw_addr_h, sdw_addr_l, sdw_data_h, sdw_data_l;
         |                      ^~~~~~~~~~
   sound/soc/codecs/rt700.c: In function 'rt700_hda_cmd_show':
   include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:343:16: note: in expansion of macro 'KERN_DEBUG'
     343 |         printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   sound/soc/codecs/rt700.c:1279:9: note: in expansion of macro 'pr_debug'
    1279 |         pr_debug("%s cnt=%d RT700_HDA_DUMP_LEN=%d PAGE_SIZE=%d\n",
         |         ^~~~~~~~
   sound/soc/codecs/rt700.c:1275:58: warning: unused variable 'sdw_data_0' [-Wunused-variable]
    1275 |         unsigned int sdw_data_3, sdw_data_2, sdw_data_1, sdw_data_0;
         |                                                          ^~~~~~~~~~
   sound/soc/codecs/rt700.c:1275:46: warning: unused variable 'sdw_data_1' [-Wunused-variable]
    1275 |         unsigned int sdw_data_3, sdw_data_2, sdw_data_1, sdw_data_0;
         |                                              ^~~~~~~~~~
   sound/soc/codecs/rt700.c:1275:34: warning: unused variable 'sdw_data_2' [-Wunused-variable]
    1275 |         unsigned int sdw_data_3, sdw_data_2, sdw_data_1, sdw_data_0;
         |                                  ^~~~~~~~~~
   sound/soc/codecs/rt700.c:1275:22: warning: unused variable 'sdw_data_3' [-Wunused-variable]
    1275 |         unsigned int sdw_data_3, sdw_data_2, sdw_data_1, sdw_data_0;
         |                      ^~~~~~~~~~
   sound/soc/codecs/rt700.c:1274:34: warning: unused variable 'sdw_addr_l' [-Wunused-variable]
    1274 |         unsigned int sdw_addr_h, sdw_addr_l;
         |                                  ^~~~~~~~~~
   sound/soc/codecs/rt700.c:1274:22: warning: unused variable 'sdw_addr_h' [-Wunused-variable]
    1274 |         unsigned int sdw_addr_h, sdw_addr_l;
         |                      ^~~~~~~~~~
   sound/soc/codecs/rt700.c: In function 'rt700_clock_config':
   sound/soc/codecs/rt700.c:1405:33: warning: unused variable 'read_value2' [-Wunused-variable]
    1405 |         int value, read_value1, read_value2;
         |                                 ^~~~~~~~~~~
   sound/soc/codecs/rt700.c:1405:20: warning: unused variable 'read_value1' [-Wunused-variable]
    1405 |         int value, read_value1, read_value2;
         |                    ^~~~~~~~~~~
   sound/soc/codecs/rt700.c: In function 'rt700_probe':
   sound/soc/codecs/rt700.c:1451:20: error: assignment to 'struct sdw_slv *' from incompatible pointer type 'struct sdw_slave *' [-Werror=incompatible-pointer-types]
    1451 |         rt700->sdw = slave;
         |                    ^
   In file included from include/linux/i2c.h:30,
                    from sound/soc/codecs/rt700.c:22:
   sound/soc/codecs/rt700.c:1455:24: error: invalid use of undefined type 'struct sdw_slave'
    1455 |         dev_info(&slave->dev, "%s\n", __func__);
         |                        ^~
   include/linux/device.h:1448:19: note: in definition of macro 'dev_info'
    1448 |         _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~
   sound/soc/codecs/rt700.c:1537:40: error: invalid use of undefined type 'struct sdw_slave'
    1537 |         ret = device_create_file(&slave->dev, &dev_attr_index_reg);
         |                                        ^~
   sound/soc/codecs/rt700.c:1539:31: error: invalid use of undefined type 'struct sdw_slave'
    1539 |                 dev_err(&slave->dev,
         |                               ^~
   include/linux/device.h:1442:18: note: in definition of macro 'dev_err'
    1442 |         _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                  ^~~
   sound/soc/codecs/rt700.c:1544:40: error: invalid use of undefined type 'struct sdw_slave'
    1544 |         ret = device_create_file(&slave->dev, &dev_attr_hda_reg);
         |                                        ^~
   sound/soc/codecs/rt700.c:1546:31: error: invalid use of undefined type 'struct sdw_slave'
    1546 |                 dev_err(&slave->dev,
         |                               ^~
   include/linux/device.h:1442:18: note: in definition of macro 'dev_err'
    1442 |         _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                  ^~~
   sound/soc/codecs/rt700.c:1551:48: error: invalid use of undefined type 'struct sdw_slave'


vim +/rt700_pcm_hw_free +1136 sound/soc/codecs/rt700.c

  1135	
> 1136	int rt700_pcm_hw_free(struct snd_pcm_substream *substream,
  1137					struct snd_soc_dai *dai)
  1138	{
  1139		struct snd_soc_component *component = dai->component;
  1140		struct rt700_priv *rt700 = snd_soc_component_get_drvdata(component);
  1141		struct sdw_stream_data *stream = snd_soc_dai_get_dma_data(dai,
  1142				substream);
  1143		if (!rt700->sdw)
  1144			return 0;
  1145		sdw_release_stream(rt700->sdw->mstr, rt700->sdw, stream->stream_tag);
  1146		return 0;
  1147	}
  1148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
