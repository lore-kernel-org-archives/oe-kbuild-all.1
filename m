Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155C433FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 10:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677233689; x=1708769689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v0qEQqX3Ls4T69mzl2IPQMulCyLJMUeEwhdz9dTCyr4=;
  b=Tei/Q74Uby0LlqxKPPQPqNla6jKTYHFT2Jx1pSa1c5Ymt0mdScOjy0ia
   8YYew161eCSlAz1/3BTFS2Cvwf0TaHym5ZpJ+IBBgvh1NvFZizl1LloAd
   zZV9SxqvlqUaBywYIpJThJbVG1jEnge2rbOvnGsoJL9KcIhtnvT1cYU/v
   4vmin4QQERS/J5/5ipqFaU1rEXwfNKdDaCkckEERegtHvtE2eBklgopIe
   n7FyG3MQaT+K11J02nepkvwY5BTGADP9z8NnQqbdWvF2WwY6Q2RVnpCA5
   qe4LVnFL1QujlPo+INN0QyzwDFqM9MUQtMqg1iiyVH1Oop2mW1bmimIzs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="360948191"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="360948191"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 02:14:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="666117439"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="666117439"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Feb 2023 02:14:46 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVV6E-0002KT-04;
	Fri, 24 Feb 2023 10:14:46 +0000
Date: Fri, 24 Feb 2023 18:14:35 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:dcp-better-timeline 22/29]
 drivers/gpu/drm/apple/parser.c:641:5: warning: no previous prototype for
 'parse_sample_rate_bit'
Message-ID: <202302241804.JbkNg0j6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux dcp-better-timeline
head:   0de243b5677f9107b36034576e442a7e66bb692b
commit: 08283375be334446ea4f4f640687c16d72585286 [22/29] gpu: drm: apple: Add sound mode parsing
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230224/202302241804.JbkNg0j6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/povik/linux/commit/08283375be334446ea4f4f640687c16d72585286
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik dcp-better-timeline
        git checkout 08283375be334446ea4f4f640687c16d72585286
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302241804.JbkNg0j6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/apple/parser.c:641:5: warning: no previous prototype for 'parse_sample_rate_bit' [-Wmissing-prototypes]
     641 | int parse_sample_rate_bit(struct dcp_parse_ctx *handle, unsigned int *ratebit)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/apple/parser.c:662:5: warning: no previous prototype for 'parse_sample_fmtbit' [-Wmissing-prototypes]
     662 | int parse_sample_fmtbit(struct dcp_parse_ctx *handle, u64 *fmtbit)
         |     ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/trace/define_trace.h:102,
                    from drivers/gpu/drm/apple/trace.h:437,
                    from drivers/gpu/drm/apple/trace.c:9:
   drivers/gpu/drm/apple/./trace.h: In function 'trace_raw_output_avep_sound_mode':
>> drivers/gpu/drm/apple/./trace.h:419:23: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
     419 |             TP_printk("dcp=%llx, rates=%#x, rates=%#x, nchans=%#x",
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   drivers/gpu/drm/apple/./trace.h:404:1: note: in expansion of macro 'TRACE_EVENT'
     404 | TRACE_EVENT(avep_sound_mode,
         | ^~~~~~~~~~~
   drivers/gpu/drm/apple/./trace.h:419:13: note: in expansion of macro 'TP_printk'
     419 |             TP_printk("dcp=%llx, rates=%#x, rates=%#x, nchans=%#x",
         |             ^~~~~~~~~
   In file included from include/trace/trace_events.h:237:
   drivers/gpu/drm/apple/./trace.h:419:53: note: format string is defined here
     419 |             TP_printk("dcp=%llx, rates=%#x, rates=%#x, nchans=%#x",
         |                                                   ~~^
         |                                                     |
         |                                                     unsigned int
         |                                                   %#llx


vim +/parse_sample_rate_bit +641 drivers/gpu/drm/apple/parser.c

   640	
 > 641	int parse_sample_rate_bit(struct dcp_parse_ctx *handle, unsigned int *ratebit)
   642	{
   643		s64 rate;
   644		int ret = parse_int(handle, &rate);
   645	
   646		if (ret)
   647			return ret;
   648	
   649		*ratebit = snd_pcm_rate_to_rate_bit(rate);
   650		if (*ratebit == SNDRV_PCM_RATE_KNOT) {
   651			/*
   652			 * The rate wasn't recognized, and unless we supply
   653			 * a supplementary constraint, the SNDRV_PCM_RATE_KNOT bit
   654			 * will allow any rate. So clear it.
   655			 */
   656			*ratebit = 0;
   657		}
   658	
   659		return 0;
   660	}
   661	
 > 662	int parse_sample_fmtbit(struct dcp_parse_ctx *handle, u64 *fmtbit)
   663	{
   664		s64 sample_size;
   665		int ret = parse_int(handle, &sample_size);
   666	
   667		if (ret)
   668			return ret;
   669	
   670		switch (sample_size) {
   671		case 16:
   672			*fmtbit = SNDRV_PCM_FMTBIT_S16;
   673			break;
   674		case 20:
   675			*fmtbit = SNDRV_PCM_FMTBIT_S20;
   676			break;
   677		case 24:
   678			*fmtbit = SNDRV_PCM_FMTBIT_S24;
   679			break;
   680		case 32:
   681			*fmtbit = SNDRV_PCM_FMTBIT_S32;
   682			break;
   683		default:
   684			*fmtbit = 0;
   685			break;
   686		}
   687	
   688		return 0;
   689	}
   690	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
