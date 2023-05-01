Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697B8361
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 02:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682909518; x=1714445518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rbMENmJEED5gPUK87Uj4UxMyly9B4Dv040Dr1BWL2yE=;
  b=Xm28seJyo74UMROw/wzUNp0xtuIf9X7cUwqtc6j/fWBCT/PPP3wHrd0Y
   vsnj/F3GbQLxY2LLdvrEJv4W9CblT+Wb2mgXPuFvdJ0FdXgJiWmmD2vr+
   nP80blPcxrFtcNwv9Unfey11omA6DP1sPBXfdeAZjNLtTSdNo9GtAKliS
   EfznD5UIT8kRVHOc9l7/g7YDRcZp07ElHF8jYQ5xB9FY8UbqT1ybntD1F
   9uMVmGE6eaGFCzkxj+KNf0Ks+tkTZpV7vd+TEMZ0ZSUrO43BC1/WStDpg
   c7m3YndjPk3F53YL9eaLL4Fhw1BQfcJPaX0fZPQsvVGbqncDt/ZsY9BjC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="351028599"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="351028599"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 19:51:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="819875728"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="819875728"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Apr 2023 19:51:56 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptJdr-0000H7-1t;
	Mon, 01 May 2023 02:51:55 +0000
Date: Mon, 1 May 2023 10:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:ssm3515 1/1] include/sound/soc.h:33:9: error: initializer
 element is not constant
Message-ID: <202305011009.onbd7xvj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux ssm3515
head:   d21bf64e223abceae841cda9e62bb5655d31264c
commit: d21bf64e223abceae841cda9e62bb5655d31264c [1/1] UNTESTED: ASoC: Add SSM3515 amp driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230501/202305011009.onbd7xvj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/povik/linux/commit/d21bf64e223abceae841cda9e62bb5655d31264c
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik ssm3515
        git checkout d21bf64e223abceae841cda9e62bb5655d31264c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305011009.onbd7xvj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/ssm3515.c:17:
>> include/sound/soc.h:33:9: error: initializer element is not constant
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:78:9: note: in expansion of macro 'SOC_SINGLE'
      78 |         SOC_SINGLE("Low EMI Mode Switch", SSM3515_GEC,
         |         ^~~~~~~~~~
   include/sound/soc.h:33:9: note: (near initialization for 'ssm3515_snd_controls[1]')
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:78:9: note: in expansion of macro 'SOC_SINGLE'
      78 |         SOC_SINGLE("Low EMI Mode Switch", SSM3515_GEC,
         |         ^~~~~~~~~~
>> include/sound/soc.h:33:9: error: initializer element is not constant
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:80:9: note: in expansion of macro 'SOC_SINGLE'
      80 |         SOC_SINGLE("Soft Volume Ramping Switch", SSM3515_DAC,
         |         ^~~~~~~~~~
   include/sound/soc.h:33:9: note: (near initialization for 'ssm3515_snd_controls[2]')
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:80:9: note: in expansion of macro 'SOC_SINGLE'
      80 |         SOC_SINGLE("Soft Volume Ramping Switch", SSM3515_DAC,
         |         ^~~~~~~~~~
>> include/sound/soc.h:33:9: error: initializer element is not constant
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:82:9: note: in expansion of macro 'SOC_SINGLE'
      82 |         SOC_SINGLE("HPF Switch", SSM3515_DAC,
         |         ^~~~~~~~~~
   include/sound/soc.h:33:9: note: (near initialization for 'ssm3515_snd_controls[3]')
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:82:9: note: in expansion of macro 'SOC_SINGLE'
      82 |         SOC_SINGLE("HPF Switch", SSM3515_DAC,
         |         ^~~~~~~~~~
>> include/sound/soc.h:33:9: error: initializer element is not constant
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:84:9: note: in expansion of macro 'SOC_SINGLE'
      84 |         SOC_SINGLE("Low Power Mode Switch", SSM3515_DAC,
         |         ^~~~~~~~~~
   include/sound/soc.h:33:9: note: (near initialization for 'ssm3515_snd_controls[4]')
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:84:9: note: in expansion of macro 'SOC_SINGLE'
      84 |         SOC_SINGLE("Low Power Mode Switch", SSM3515_DAC,
         |         ^~~~~~~~~~
>> include/sound/soc.h:33:9: error: initializer element is not constant
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:86:9: note: in expansion of macro 'SOC_SINGLE'
      86 |         SOC_SINGLE("DAC Invert Switch", SSM3515_SAI1,
         |         ^~~~~~~~~~
   include/sound/soc.h:33:9: note: (near initialization for 'ssm3515_snd_controls[5]')
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:86:9: note: in expansion of macro 'SOC_SINGLE'
      86 |         SOC_SINGLE("DAC Invert Switch", SSM3515_SAI1,
         |         ^~~~~~~~~~
   sound/soc/codecs/ssm3515.c: In function 'ssm3515_hw_params':
   sound/soc/codecs/ssm3515.c:178:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     178 |                 if (ret < 0)
         |                    ^
   sound/soc/codecs/ssm3515.c:181:9: note: here
     181 |         default:
         |         ^~~~~~~


vim +33 include/sound/soc.h

808db4a4512bed Richard Purdie      2006-10-06   27  
808db4a4512bed Richard Purdie      2006-10-06   28  /*
808db4a4512bed Richard Purdie      2006-10-06   29   * Convenience kcontrol builders
808db4a4512bed Richard Purdie      2006-10-06   30   */
57295073b6acfd Lars-Peter Clausen  2013-08-05   31  #define SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, xmax, xinvert, xautodisable) \
4eaa9819dc08d7 Jon Smirl           2008-07-29   32  	((unsigned long)&(struct soc_mixer_control) \
30d86ba47f79d5 Peter Ujfalusi      2011-10-05  @33  	{.reg = xreg, .rreg = xreg, .shift = shift_left, \
26bdcc4ba12351 Srinivas Kandagatla 2022-08-16   34  	.rshift = shift_right, .max = xmax, \
57295073b6acfd Lars-Peter Clausen  2013-08-05   35  	.invert = xinvert, .autodisable = xautodisable})
c1b4d1c7774189 Lars-Peter Clausen  2014-10-25   36  #define SOC_DOUBLE_S_VALUE(xreg, shift_left, shift_right, xmin, xmax, xsign_bit, xinvert, xautodisable) \
c1b4d1c7774189 Lars-Peter Clausen  2014-10-25   37  	((unsigned long)&(struct soc_mixer_control) \
c1b4d1c7774189 Lars-Peter Clausen  2014-10-25   38  	{.reg = xreg, .rreg = xreg, .shift = shift_left, \
26bdcc4ba12351 Srinivas Kandagatla 2022-08-16   39  	.rshift = shift_right, .min = xmin, .max = xmax, \
c1b4d1c7774189 Lars-Peter Clausen  2014-10-25   40  	.sign_bit = xsign_bit, .invert = xinvert, .autodisable = xautodisable})
57295073b6acfd Lars-Peter Clausen  2013-08-05   41  #define SOC_SINGLE_VALUE(xreg, xshift, xmax, xinvert, xautodisable) \
57295073b6acfd Lars-Peter Clausen  2013-08-05   42  	SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
4eaa9819dc08d7 Jon Smirl           2008-07-29   43  #define SOC_SINGLE_VALUE_EXT(xreg, xmax, xinvert) \
4eaa9819dc08d7 Jon Smirl           2008-07-29   44  	((unsigned long)&(struct soc_mixer_control) \
26bdcc4ba12351 Srinivas Kandagatla 2022-08-16   45  	{.reg = xreg, .max = xmax, .invert = xinvert})
cdffa775e72de3 Peter Ujfalusi      2011-10-04   46  #define SOC_DOUBLE_R_VALUE(xlreg, xrreg, xshift, xmax, xinvert) \
cdffa775e72de3 Peter Ujfalusi      2011-10-04   47  	((unsigned long)&(struct soc_mixer_control) \
cdffa775e72de3 Peter Ujfalusi      2011-10-04   48  	{.reg = xlreg, .rreg = xrreg, .shift = xshift, .rshift = xshift, \
26bdcc4ba12351 Srinivas Kandagatla 2022-08-16   49  	.max = xmax, .invert = xinvert})
cd21b123346c6a Markus Pargmann     2014-01-16   50  #define SOC_DOUBLE_R_S_VALUE(xlreg, xrreg, xshift, xmin, xmax, xsign_bit, xinvert) \
cd21b123346c6a Markus Pargmann     2014-01-16   51  	((unsigned long)&(struct soc_mixer_control) \
cd21b123346c6a Markus Pargmann     2014-01-16   52  	{.reg = xlreg, .rreg = xrreg, .shift = xshift, .rshift = xshift, \
26bdcc4ba12351 Srinivas Kandagatla 2022-08-16   53  	.max = xmax, .min = xmin, .sign_bit = xsign_bit, \
cd21b123346c6a Markus Pargmann     2014-01-16   54  	.invert = xinvert})
229e3fdc1ba49b Mark Brown          2012-06-22   55  #define SOC_DOUBLE_R_RANGE_VALUE(xlreg, xrreg, xshift, xmin, xmax, xinvert) \
229e3fdc1ba49b Mark Brown          2012-06-22   56  	((unsigned long)&(struct soc_mixer_control) \
229e3fdc1ba49b Mark Brown          2012-06-22   57  	{.reg = xlreg, .rreg = xrreg, .shift = xshift, .rshift = xshift, \
26bdcc4ba12351 Srinivas Kandagatla 2022-08-16   58  	.min = xmin, .max = xmax, .invert = xinvert})
a7a4ac86b4754f Philipp Zabel       2008-01-10   59  #define SOC_SINGLE(xname, reg, shift, max, invert) \
808db4a4512bed Richard Purdie      2006-10-06   60  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
808db4a4512bed Richard Purdie      2006-10-06   61  	.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,\
808db4a4512bed Richard Purdie      2006-10-06   62  	.put = snd_soc_put_volsw, \
57295073b6acfd Lars-Peter Clausen  2013-08-05   63  	.private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
6c9d8cf6372ed2 Adam Thomson        2012-05-31   64  #define SOC_SINGLE_RANGE(xname, xreg, xshift, xmin, xmax, xinvert) \
6c9d8cf6372ed2 Adam Thomson        2012-05-31   65  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
6c9d8cf6372ed2 Adam Thomson        2012-05-31   66  	.info = snd_soc_info_volsw_range, .get = snd_soc_get_volsw_range, \
6c9d8cf6372ed2 Adam Thomson        2012-05-31   67  	.put = snd_soc_put_volsw_range, \
6c9d8cf6372ed2 Adam Thomson        2012-05-31   68  	.private_value = (unsigned long)&(struct soc_mixer_control) \
9bde4f0b1c83d1 Mark Brown          2012-12-19   69  		{.reg = xreg, .rreg = xreg, .shift = xshift, \
9bde4f0b1c83d1 Mark Brown          2012-12-19   70  		 .rshift = xshift,  .min = xmin, .max = xmax, \
26bdcc4ba12351 Srinivas Kandagatla 2022-08-16   71  		 .invert = xinvert} }
a7a4ac86b4754f Philipp Zabel       2008-01-10   72  #define SOC_SINGLE_TLV(xname, reg, shift, max, invert, tlv_array) \
a7a4ac86b4754f Philipp Zabel       2008-01-10   73  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
a7a4ac86b4754f Philipp Zabel       2008-01-10   74  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
a7a4ac86b4754f Philipp Zabel       2008-01-10   75  		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
a7a4ac86b4754f Philipp Zabel       2008-01-10   76  	.tlv.p = (tlv_array), \
a7a4ac86b4754f Philipp Zabel       2008-01-10   77  	.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,\
a7a4ac86b4754f Philipp Zabel       2008-01-10   78  	.put = snd_soc_put_volsw, \
57295073b6acfd Lars-Peter Clausen  2013-08-05   79  	.private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
1d99f2436d0d1c Brian Austin        2012-03-30   80  #define SOC_SINGLE_SX_TLV(xname, xreg, xshift, xmin, xmax, tlv_array) \
1d99f2436d0d1c Brian Austin        2012-03-30   81  {       .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
1d99f2436d0d1c Brian Austin        2012-03-30   82  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
1d99f2436d0d1c Brian Austin        2012-03-30   83  	SNDRV_CTL_ELEM_ACCESS_READWRITE, \
1d99f2436d0d1c Brian Austin        2012-03-30   84  	.tlv.p  = (tlv_array),\
34198710f55b5f Charles Keepax      2015-10-14   85  	.info = snd_soc_info_volsw_sx, \
1d99f2436d0d1c Brian Austin        2012-03-30   86  	.get = snd_soc_get_volsw_sx,\
1d99f2436d0d1c Brian Austin        2012-03-30   87  	.put = snd_soc_put_volsw_sx, \
1d99f2436d0d1c Brian Austin        2012-03-30   88  	.private_value = (unsigned long)&(struct soc_mixer_control) \
1d99f2436d0d1c Brian Austin        2012-03-30   89  		{.reg = xreg, .rreg = xreg, \
1d99f2436d0d1c Brian Austin        2012-03-30   90  		.shift = xshift, .rshift = xshift, \
1d99f2436d0d1c Brian Austin        2012-03-30   91  		.max = xmax, .min = xmin} }
6c9d8cf6372ed2 Adam Thomson        2012-05-31   92  #define SOC_SINGLE_RANGE_TLV(xname, xreg, xshift, xmin, xmax, xinvert, tlv_array) \
6c9d8cf6372ed2 Adam Thomson        2012-05-31   93  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
6c9d8cf6372ed2 Adam Thomson        2012-05-31   94  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
6c9d8cf6372ed2 Adam Thomson        2012-05-31   95  		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
6c9d8cf6372ed2 Adam Thomson        2012-05-31   96  	.tlv.p = (tlv_array), \
6c9d8cf6372ed2 Adam Thomson        2012-05-31   97  	.info = snd_soc_info_volsw_range, \
6c9d8cf6372ed2 Adam Thomson        2012-05-31   98  	.get = snd_soc_get_volsw_range, .put = snd_soc_put_volsw_range, \
6c9d8cf6372ed2 Adam Thomson        2012-05-31   99  	.private_value = (unsigned long)&(struct soc_mixer_control) \
9bde4f0b1c83d1 Mark Brown          2012-12-19  100  		{.reg = xreg, .rreg = xreg, .shift = xshift, \
9bde4f0b1c83d1 Mark Brown          2012-12-19  101  		 .rshift = xshift, .min = xmin, .max = xmax, \
26bdcc4ba12351 Srinivas Kandagatla 2022-08-16  102  		 .invert = xinvert} }
460acbec1e7ba7 Peter Ujfalusi      2011-10-04  103  #define SOC_DOUBLE(xname, reg, shift_left, shift_right, max, invert) \
808db4a4512bed Richard Purdie      2006-10-06  104  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
808db4a4512bed Richard Purdie      2006-10-06  105  	.info = snd_soc_info_volsw, .get = snd_soc_get_volsw, \
808db4a4512bed Richard Purdie      2006-10-06  106  	.put = snd_soc_put_volsw, \
460acbec1e7ba7 Peter Ujfalusi      2011-10-04  107  	.private_value = SOC_DOUBLE_VALUE(reg, shift_left, shift_right, \
57295073b6acfd Lars-Peter Clausen  2013-08-05  108  					  max, invert, 0) }
d13871b3531b05 Damien.Horsley      2015-12-08  109  #define SOC_DOUBLE_STS(xname, reg, shift_left, shift_right, max, invert) \
d13871b3531b05 Damien.Horsley      2015-12-08  110  {									\
d13871b3531b05 Damien.Horsley      2015-12-08  111  	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),		\
d13871b3531b05 Damien.Horsley      2015-12-08  112  	.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,		\
d13871b3531b05 Damien.Horsley      2015-12-08  113  	.access = SNDRV_CTL_ELEM_ACCESS_READ |				\
d13871b3531b05 Damien.Horsley      2015-12-08  114  		SNDRV_CTL_ELEM_ACCESS_VOLATILE,				\
d13871b3531b05 Damien.Horsley      2015-12-08  115  	.private_value = SOC_DOUBLE_VALUE(reg, shift_left, shift_right,	\
d13871b3531b05 Damien.Horsley      2015-12-08  116  					  max, invert, 0) }
4eaa9819dc08d7 Jon Smirl           2008-07-29  117  #define SOC_DOUBLE_R(xname, reg_left, reg_right, xshift, xmax, xinvert) \
808db4a4512bed Richard Purdie      2006-10-06  118  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
e8f5a10307f7d2 Peter Ujfalusi      2011-10-05  119  	.info = snd_soc_info_volsw, \
974815ba4f88f3 Peter Ujfalusi      2011-10-05  120  	.get = snd_soc_get_volsw, .put = snd_soc_put_volsw, \
cdffa775e72de3 Peter Ujfalusi      2011-10-04  121  	.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, xshift, \
cdffa775e72de3 Peter Ujfalusi      2011-10-04  122  					    xmax, xinvert) }
229e3fdc1ba49b Mark Brown          2012-06-22  123  #define SOC_DOUBLE_R_RANGE(xname, reg_left, reg_right, xshift, xmin, \
229e3fdc1ba49b Mark Brown          2012-06-22  124  			   xmax, xinvert)		\
229e3fdc1ba49b Mark Brown          2012-06-22  125  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
229e3fdc1ba49b Mark Brown          2012-06-22  126  	.info = snd_soc_info_volsw_range, \
229e3fdc1ba49b Mark Brown          2012-06-22  127  	.get = snd_soc_get_volsw_range, .put = snd_soc_put_volsw_range, \
229e3fdc1ba49b Mark Brown          2012-06-22  128  	.private_value = SOC_DOUBLE_R_RANGE_VALUE(reg_left, reg_right, \
229e3fdc1ba49b Mark Brown          2012-06-22  129  					    xshift, xmin, xmax, xinvert) }
460acbec1e7ba7 Peter Ujfalusi      2011-10-04  130  #define SOC_DOUBLE_TLV(xname, reg, shift_left, shift_right, max, invert, tlv_array) \
a7a4ac86b4754f Philipp Zabel       2008-01-10  131  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
a7a4ac86b4754f Philipp Zabel       2008-01-10  132  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
a7a4ac86b4754f Philipp Zabel       2008-01-10  133  		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
a7a4ac86b4754f Philipp Zabel       2008-01-10  134  	.tlv.p = (tlv_array), \
a7a4ac86b4754f Philipp Zabel       2008-01-10  135  	.info = snd_soc_info_volsw, .get = snd_soc_get_volsw, \
a7a4ac86b4754f Philipp Zabel       2008-01-10  136  	.put = snd_soc_put_volsw, \
460acbec1e7ba7 Peter Ujfalusi      2011-10-04  137  	.private_value = SOC_DOUBLE_VALUE(reg, shift_left, shift_right, \
57295073b6acfd Lars-Peter Clausen  2013-08-05  138  					  max, invert, 0) }
6b183919f70512 Charles Keepax      2022-06-21  139  #define SOC_DOUBLE_SX_TLV(xname, xreg, shift_left, shift_right, xmin, xmax, tlv_array) \
6b183919f70512 Charles Keepax      2022-06-21  140  {       .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
6b183919f70512 Charles Keepax      2022-06-21  141  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
6b183919f70512 Charles Keepax      2022-06-21  142  	SNDRV_CTL_ELEM_ACCESS_READWRITE, \
6b183919f70512 Charles Keepax      2022-06-21  143  	.tlv.p  = (tlv_array), \
6b183919f70512 Charles Keepax      2022-06-21  144  	.info = snd_soc_info_volsw_sx, \
6b183919f70512 Charles Keepax      2022-06-21  145  	.get = snd_soc_get_volsw_sx, \
6b183919f70512 Charles Keepax      2022-06-21  146  	.put = snd_soc_put_volsw_sx, \
6b183919f70512 Charles Keepax      2022-06-21  147  	.private_value = (unsigned long)&(struct soc_mixer_control) \
6b183919f70512 Charles Keepax      2022-06-21  148  		{.reg = xreg, .rreg = xreg, \
6b183919f70512 Charles Keepax      2022-06-21  149  		.shift = shift_left, .rshift = shift_right, \
6b183919f70512 Charles Keepax      2022-06-21  150  		.max = xmax, .min = xmin} }
4eaa9819dc08d7 Jon Smirl           2008-07-29  151  #define SOC_DOUBLE_R_TLV(xname, reg_left, reg_right, xshift, xmax, xinvert, tlv_array) \
a7a4ac86b4754f Philipp Zabel       2008-01-10  152  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
a7a4ac86b4754f Philipp Zabel       2008-01-10  153  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
a7a4ac86b4754f Philipp Zabel       2008-01-10  154  		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
a7a4ac86b4754f Philipp Zabel       2008-01-10  155  	.tlv.p = (tlv_array), \
e8f5a10307f7d2 Peter Ujfalusi      2011-10-05  156  	.info = snd_soc_info_volsw, \
974815ba4f88f3 Peter Ujfalusi      2011-10-05  157  	.get = snd_soc_get_volsw, .put = snd_soc_put_volsw, \
cdffa775e72de3 Peter Ujfalusi      2011-10-04  158  	.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, xshift, \
cdffa775e72de3 Peter Ujfalusi      2011-10-04  159  					    xmax, xinvert) }
229e3fdc1ba49b Mark Brown          2012-06-22  160  #define SOC_DOUBLE_R_RANGE_TLV(xname, reg_left, reg_right, xshift, xmin, \
229e3fdc1ba49b Mark Brown          2012-06-22  161  			       xmax, xinvert, tlv_array)		\
229e3fdc1ba49b Mark Brown          2012-06-22  162  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
229e3fdc1ba49b Mark Brown          2012-06-22  163  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
229e3fdc1ba49b Mark Brown          2012-06-22  164  		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
229e3fdc1ba49b Mark Brown          2012-06-22  165  	.tlv.p = (tlv_array), \
229e3fdc1ba49b Mark Brown          2012-06-22  166  	.info = snd_soc_info_volsw_range, \
229e3fdc1ba49b Mark Brown          2012-06-22  167  	.get = snd_soc_get_volsw_range, .put = snd_soc_put_volsw_range, \
229e3fdc1ba49b Mark Brown          2012-06-22  168  	.private_value = SOC_DOUBLE_R_RANGE_VALUE(reg_left, reg_right, \
229e3fdc1ba49b Mark Brown          2012-06-22  169  					    xshift, xmin, xmax, xinvert) }
1d99f2436d0d1c Brian Austin        2012-03-30  170  #define SOC_DOUBLE_R_SX_TLV(xname, xreg, xrreg, xshift, xmin, xmax, tlv_array) \
1d99f2436d0d1c Brian Austin        2012-03-30  171  {       .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
1d99f2436d0d1c Brian Austin        2012-03-30  172  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
1d99f2436d0d1c Brian Austin        2012-03-30  173  	SNDRV_CTL_ELEM_ACCESS_READWRITE, \
1d99f2436d0d1c Brian Austin        2012-03-30  174  	.tlv.p  = (tlv_array), \
34198710f55b5f Charles Keepax      2015-10-14  175  	.info = snd_soc_info_volsw_sx, \
1d99f2436d0d1c Brian Austin        2012-03-30  176  	.get = snd_soc_get_volsw_sx, \
1d99f2436d0d1c Brian Austin        2012-03-30  177  	.put = snd_soc_put_volsw_sx, \
1d99f2436d0d1c Brian Austin        2012-03-30  178  	.private_value = (unsigned long)&(struct soc_mixer_control) \
1d99f2436d0d1c Brian Austin        2012-03-30  179  		{.reg = xreg, .rreg = xrreg, \
1d99f2436d0d1c Brian Austin        2012-03-30  180  		.shift = xshift, .rshift = xshift, \
1d99f2436d0d1c Brian Austin        2012-03-30  181  		.max = xmax, .min = xmin} }
cd21b123346c6a Markus Pargmann     2014-01-16  182  #define SOC_DOUBLE_R_S_TLV(xname, reg_left, reg_right, xshift, xmin, xmax, xsign_bit, xinvert, tlv_array) \
cd21b123346c6a Markus Pargmann     2014-01-16  183  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
cd21b123346c6a Markus Pargmann     2014-01-16  184  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
cd21b123346c6a Markus Pargmann     2014-01-16  185  		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
cd21b123346c6a Markus Pargmann     2014-01-16  186  	.tlv.p = (tlv_array), \
cd21b123346c6a Markus Pargmann     2014-01-16  187  	.info = snd_soc_info_volsw, \
cd21b123346c6a Markus Pargmann     2014-01-16  188  	.get = snd_soc_get_volsw, .put = snd_soc_put_volsw, \
cd21b123346c6a Markus Pargmann     2014-01-16  189  	.private_value = SOC_DOUBLE_R_S_VALUE(reg_left, reg_right, xshift, \
cd21b123346c6a Markus Pargmann     2014-01-16  190  					    xmin, xmax, xsign_bit, xinvert) }
bc8cb02976cd60 Richard Fitzgerald  2022-04-05  191  #define SOC_SINGLE_S_TLV(xname, xreg, xshift, xmin, xmax, xsign_bit, xinvert, tlv_array) \
bc8cb02976cd60 Richard Fitzgerald  2022-04-05  192  	SOC_DOUBLE_R_S_TLV(xname, xreg, xreg, xshift, xmin, xmax, xsign_bit, xinvert, tlv_array)
dcc0799bf75c43 Srinivas Kandagatla 2016-05-27  193  #define SOC_SINGLE_S8_TLV(xname, xreg, xmin, xmax, tlv_array) \
dcc0799bf75c43 Srinivas Kandagatla 2016-05-27  194  {	.iface  = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
dcc0799bf75c43 Srinivas Kandagatla 2016-05-27  195  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
dcc0799bf75c43 Srinivas Kandagatla 2016-05-27  196  		  SNDRV_CTL_ELEM_ACCESS_READWRITE, \
dcc0799bf75c43 Srinivas Kandagatla 2016-05-27  197  	.tlv.p  = (tlv_array), \
dcc0799bf75c43 Srinivas Kandagatla 2016-05-27  198  	.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,\
dcc0799bf75c43 Srinivas Kandagatla 2016-05-27  199  	.put = snd_soc_put_volsw, \
dcc0799bf75c43 Srinivas Kandagatla 2016-05-27  200  	.private_value = (unsigned long)&(struct soc_mixer_control) \
dcc0799bf75c43 Srinivas Kandagatla 2016-05-27  201  	{.reg = xreg, .rreg = xreg,  \
26bdcc4ba12351 Srinivas Kandagatla 2022-08-16  202  	 .min = xmin, .max = xmax, \
dcc0799bf75c43 Srinivas Kandagatla 2016-05-27  203  	.sign_bit = 7,} }
4eaa9819dc08d7 Jon Smirl           2008-07-29  204  #define SOC_DOUBLE_S8_TLV(xname, xreg, xmin, xmax, tlv_array) \
e13ac2e9b18bde Mark Brown          2008-05-28  205  {	.iface  = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
e13ac2e9b18bde Mark Brown          2008-05-28  206  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
e13ac2e9b18bde Mark Brown          2008-05-28  207  		  SNDRV_CTL_ELEM_ACCESS_READWRITE, \
e13ac2e9b18bde Mark Brown          2008-05-28  208  	.tlv.p  = (tlv_array), \
c1b4d1c7774189 Lars-Peter Clausen  2014-10-25  209  	.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,\
c1b4d1c7774189 Lars-Peter Clausen  2014-10-25  210  	.put = snd_soc_put_volsw, \
c1b4d1c7774189 Lars-Peter Clausen  2014-10-25  211  	.private_value = SOC_DOUBLE_S_VALUE(xreg, 0, 8, xmin, xmax, 7, 0, 0) }
9a8d38db030f01 Takashi Iwai        2014-02-18  212  #define SOC_ENUM_DOUBLE(xreg, xshift_l, xshift_r, xitems, xtexts) \
808db4a4512bed Richard Purdie      2006-10-06  213  {	.reg = xreg, .shift_l = xshift_l, .shift_r = xshift_r, \
9a8d38db030f01 Takashi Iwai        2014-02-18  214  	.items = xitems, .texts = xtexts, \
9a8d38db030f01 Takashi Iwai        2014-02-18  215  	.mask = xitems ? roundup_pow_of_two(xitems) - 1 : 0}
9a8d38db030f01 Takashi Iwai        2014-02-18  216  #define SOC_ENUM_SINGLE(xreg, xshift, xitems, xtexts) \
9a8d38db030f01 Takashi Iwai        2014-02-18  217  	SOC_ENUM_DOUBLE(xreg, xshift, xshift, xitems, xtexts)
9a8d38db030f01 Takashi Iwai        2014-02-18  218  #define SOC_ENUM_SINGLE_EXT(xitems, xtexts) \
9a8d38db030f01 Takashi Iwai        2014-02-18  219  {	.items = xitems, .texts = xtexts }
9a8d38db030f01 Takashi Iwai        2014-02-18  220  #define SOC_VALUE_ENUM_DOUBLE(xreg, xshift_l, xshift_r, xmask, xitems, xtexts, xvalues) \
2e72f8e3716bc3 Peter Ujfalusi      2009-01-05  221  {	.reg = xreg, .shift_l = xshift_l, .shift_r = xshift_r, \
9a8d38db030f01 Takashi Iwai        2014-02-18  222  	.mask = xmask, .items = xitems, .texts = xtexts, .values = xvalues}
5967cb3d878029 Charles Keepax      2015-05-01  223  #define SOC_VALUE_ENUM_SINGLE(xreg, xshift, xmask, xitems, xtexts, xvalues) \
5967cb3d878029 Charles Keepax      2015-05-01  224  	SOC_VALUE_ENUM_DOUBLE(xreg, xshift, xshift, xmask, xitems, xtexts, xvalues)
561ed680b764b2 Charles Keepax      2015-05-01  225  #define SOC_VALUE_ENUM_SINGLE_AUTODISABLE(xreg, xshift, xmask, xitems, xtexts, xvalues) \
561ed680b764b2 Charles Keepax      2015-05-01  226  {	.reg = xreg, .shift_l = xshift, .shift_r = xshift, \
561ed680b764b2 Charles Keepax      2015-05-01  227  	.mask = xmask, .items = xitems, .texts = xtexts, \
561ed680b764b2 Charles Keepax      2015-05-01  228  	.values = xvalues, .autodisable = 1}
b948837a32cc2a Lars-Peter Clausen  2014-02-28  229  #define SOC_ENUM_SINGLE_VIRT(xitems, xtexts) \
b948837a32cc2a Lars-Peter Clausen  2014-02-28  230  	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, xitems, xtexts)
808db4a4512bed Richard Purdie      2006-10-06  231  #define SOC_ENUM(xname, xenum) \
808db4a4512bed Richard Purdie      2006-10-06  232  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname,\
808db4a4512bed Richard Purdie      2006-10-06  233  	.info = snd_soc_info_enum_double, \
808db4a4512bed Richard Purdie      2006-10-06  234  	.get = snd_soc_get_enum_double, .put = snd_soc_put_enum_double, \
808db4a4512bed Richard Purdie      2006-10-06  235  	.private_value = (unsigned long)&xenum }
f8ba0b7bfd06a2 Jon Smirl           2008-07-29  236  #define SOC_SINGLE_EXT(xname, xreg, xshift, xmax, xinvert,\
808db4a4512bed Richard Purdie      2006-10-06  237  	 xhandler_get, xhandler_put) \
808db4a4512bed Richard Purdie      2006-10-06  238  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
1c433fbda4896a Graeme Gregory      2007-02-02  239  	.info = snd_soc_info_volsw, \
808db4a4512bed Richard Purdie      2006-10-06  240  	.get = xhandler_get, .put = xhandler_put, \
57295073b6acfd Lars-Peter Clausen  2013-08-05  241  	.private_value = SOC_SINGLE_VALUE(xreg, xshift, xmax, xinvert, 0) }
460acbec1e7ba7 Peter Ujfalusi      2011-10-04  242  #define SOC_DOUBLE_EXT(xname, reg, shift_left, shift_right, max, invert,\
7629ad24f2b3df Daniel Mack         2009-04-24  243  	 xhandler_get, xhandler_put) \
7629ad24f2b3df Daniel Mack         2009-04-24  244  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
7629ad24f2b3df Daniel Mack         2009-04-24  245  	.info = snd_soc_info_volsw, \
7629ad24f2b3df Daniel Mack         2009-04-24  246  	.get = xhandler_get, .put = xhandler_put, \
460acbec1e7ba7 Peter Ujfalusi      2011-10-04  247  	.private_value = \
57295073b6acfd Lars-Peter Clausen  2013-08-05  248  		SOC_DOUBLE_VALUE(reg, shift_left, shift_right, max, invert, 0) }
c25c79b468a61a Adam Thomson        2015-09-29  249  #define SOC_DOUBLE_R_EXT(xname, reg_left, reg_right, xshift, xmax, xinvert,\
c25c79b468a61a Adam Thomson        2015-09-29  250  	 xhandler_get, xhandler_put) \
c25c79b468a61a Adam Thomson        2015-09-29  251  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
c25c79b468a61a Adam Thomson        2015-09-29  252  	.info = snd_soc_info_volsw, \
c25c79b468a61a Adam Thomson        2015-09-29  253  	.get = xhandler_get, .put = xhandler_put, \
c25c79b468a61a Adam Thomson        2015-09-29  254  	.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, xshift, \
c25c79b468a61a Adam Thomson        2015-09-29  255  					    xmax, xinvert) }
f8ba0b7bfd06a2 Jon Smirl           2008-07-29  256  #define SOC_SINGLE_EXT_TLV(xname, xreg, xshift, xmax, xinvert,\
10144c09a0d6a6 Mike Montour        2008-06-11  257  	 xhandler_get, xhandler_put, tlv_array) \
10144c09a0d6a6 Mike Montour        2008-06-11  258  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
10144c09a0d6a6 Mike Montour        2008-06-11  259  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
10144c09a0d6a6 Mike Montour        2008-06-11  260  		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
10144c09a0d6a6 Mike Montour        2008-06-11  261  	.tlv.p = (tlv_array), \
10144c09a0d6a6 Mike Montour        2008-06-11  262  	.info = snd_soc_info_volsw, \
10144c09a0d6a6 Mike Montour        2008-06-11  263  	.get = xhandler_get, .put = xhandler_put, \
57295073b6acfd Lars-Peter Clausen  2013-08-05  264  	.private_value = SOC_SINGLE_VALUE(xreg, xshift, xmax, xinvert, 0) }
a54e22f40480eb Charles Keepax      2015-09-16  265  #define SOC_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
a54e22f40480eb Charles Keepax      2015-09-16  266  				 xhandler_get, xhandler_put, tlv_array) \
a54e22f40480eb Charles Keepax      2015-09-16  267  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
a54e22f40480eb Charles Keepax      2015-09-16  268  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
a54e22f40480eb Charles Keepax      2015-09-16  269  		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
a54e22f40480eb Charles Keepax      2015-09-16  270  	.tlv.p = (tlv_array), \
a54e22f40480eb Charles Keepax      2015-09-16  271  	.info = snd_soc_info_volsw_range, \
a54e22f40480eb Charles Keepax      2015-09-16  272  	.get = xhandler_get, .put = xhandler_put, \
a54e22f40480eb Charles Keepax      2015-09-16  273  	.private_value = (unsigned long)&(struct soc_mixer_control) \
a54e22f40480eb Charles Keepax      2015-09-16  274  		{.reg = xreg, .rreg = xreg, .shift = xshift, \
a54e22f40480eb Charles Keepax      2015-09-16  275  		 .rshift = xshift, .min = xmin, .max = xmax, \
26bdcc4ba12351 Srinivas Kandagatla 2022-08-16  276  		 .invert = xinvert} }
d0af93db12639c Joonyoung Shim      2009-07-15  277  #define SOC_DOUBLE_EXT_TLV(xname, xreg, shift_left, shift_right, xmax, xinvert,\
d0af93db12639c Joonyoung Shim      2009-07-15  278  	 xhandler_get, xhandler_put, tlv_array) \
d0af93db12639c Joonyoung Shim      2009-07-15  279  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
d0af93db12639c Joonyoung Shim      2009-07-15  280  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
d0af93db12639c Joonyoung Shim      2009-07-15  281  		 SNDRV_CTL_ELEM_ACCESS_READWRITE, \
d0af93db12639c Joonyoung Shim      2009-07-15  282  	.tlv.p = (tlv_array), \
d0af93db12639c Joonyoung Shim      2009-07-15  283  	.info = snd_soc_info_volsw, \
d0af93db12639c Joonyoung Shim      2009-07-15  284  	.get = xhandler_get, .put = xhandler_put, \
460acbec1e7ba7 Peter Ujfalusi      2011-10-04  285  	.private_value = SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, \
57295073b6acfd Lars-Peter Clausen  2013-08-05  286  					  xmax, xinvert, 0) }
3ce91d5a5a47ec Joonyoung Shim      2009-07-15  287  #define SOC_DOUBLE_R_EXT_TLV(xname, reg_left, reg_right, xshift, xmax, xinvert,\
3ce91d5a5a47ec Joonyoung Shim      2009-07-15  288  	 xhandler_get, xhandler_put, tlv_array) \
3ce91d5a5a47ec Joonyoung Shim      2009-07-15  289  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
3ce91d5a5a47ec Joonyoung Shim      2009-07-15  290  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
3ce91d5a5a47ec Joonyoung Shim      2009-07-15  291  		 SNDRV_CTL_ELEM_ACCESS_READWRITE, \
3ce91d5a5a47ec Joonyoung Shim      2009-07-15  292  	.tlv.p = (tlv_array), \
e8f5a10307f7d2 Peter Ujfalusi      2011-10-05  293  	.info = snd_soc_info_volsw, \
3ce91d5a5a47ec Joonyoung Shim      2009-07-15  294  	.get = xhandler_get, .put = xhandler_put, \
cdffa775e72de3 Peter Ujfalusi      2011-10-04  295  	.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, xshift, \
cdffa775e72de3 Peter Ujfalusi      2011-10-04  296  					    xmax, xinvert) }
cf51406ccb0839 Simon Trimmer       2022-04-25  297  #define SOC_DOUBLE_R_S_EXT_TLV(xname, reg_left, reg_right, xshift, xmin, xmax, \
cf51406ccb0839 Simon Trimmer       2022-04-25  298  			       xsign_bit, xinvert, xhandler_get, xhandler_put, \
cf51406ccb0839 Simon Trimmer       2022-04-25  299  			       tlv_array) \
cf51406ccb0839 Simon Trimmer       2022-04-25  300  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
cf51406ccb0839 Simon Trimmer       2022-04-25  301  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
cf51406ccb0839 Simon Trimmer       2022-04-25  302  		  SNDRV_CTL_ELEM_ACCESS_READWRITE, \
cf51406ccb0839 Simon Trimmer       2022-04-25  303  	.tlv.p = (tlv_array), \
cf51406ccb0839 Simon Trimmer       2022-04-25  304  	.info = snd_soc_info_volsw, \
cf51406ccb0839 Simon Trimmer       2022-04-25  305  	.get = xhandler_get, .put = xhandler_put, \
cf51406ccb0839 Simon Trimmer       2022-04-25  306  	.private_value = SOC_DOUBLE_R_S_VALUE(reg_left, reg_right, xshift, \
cf51406ccb0839 Simon Trimmer       2022-04-25  307  					      xmin, xmax, xsign_bit, xinvert) }
5349c0c93d15df Richard Fitzgerald  2022-04-25  308  #define SOC_SINGLE_S_EXT_TLV(xname, xreg, xshift, xmin, xmax, \
5349c0c93d15df Richard Fitzgerald  2022-04-25  309  			     xsign_bit, xinvert, xhandler_get, xhandler_put, \
5349c0c93d15df Richard Fitzgerald  2022-04-25  310  			     tlv_array) \
5349c0c93d15df Richard Fitzgerald  2022-04-25  311  	SOC_DOUBLE_R_S_EXT_TLV(xname, xreg, xreg, xshift, xmin, xmax, \
5349c0c93d15df Richard Fitzgerald  2022-04-25  312  			       xsign_bit, xinvert, xhandler_get, xhandler_put, \
5349c0c93d15df Richard Fitzgerald  2022-04-25  313  			       tlv_array)
808db4a4512bed Richard Purdie      2006-10-06  314  #define SOC_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) \
808db4a4512bed Richard Purdie      2006-10-06  315  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
808db4a4512bed Richard Purdie      2006-10-06  316  	.info = snd_soc_info_bool_ext, \
808db4a4512bed Richard Purdie      2006-10-06  317  	.get = xhandler_get, .put = xhandler_put, \
808db4a4512bed Richard Purdie      2006-10-06  318  	.private_value = xdata }
808db4a4512bed Richard Purdie      2006-10-06  319  #define SOC_ENUM_EXT(xname, xenum, xhandler_get, xhandler_put) \
808db4a4512bed Richard Purdie      2006-10-06  320  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
9a953e6f27fd28 Lars-Peter Clausen  2013-08-10  321  	.info = snd_soc_info_enum_double, \
808db4a4512bed Richard Purdie      2006-10-06  322  	.get = xhandler_get, .put = xhandler_put, \
808db4a4512bed Richard Purdie      2006-10-06  323  	.private_value = (unsigned long)&xenum }
1e4c0d7c9a2b44 Richard Fitzgerald  2014-07-07  324  #define SOC_VALUE_ENUM_EXT(xname, xenum, xhandler_get, xhandler_put) \
1e4c0d7c9a2b44 Richard Fitzgerald  2014-07-07  325  	SOC_ENUM_EXT(xname, xenum, xhandler_get, xhandler_put)
808db4a4512bed Richard Purdie      2006-10-06  326  

:::::: The code at line 33 was first introduced by commit
:::::: 30d86ba47f79d566fffe9ba577caf247d06a3796 ASoC: core: Change SOC_SINGLE/DOUBLE_VALUE representation

:::::: TO: Peter Ujfalusi <peter.ujfalusi@ti.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
