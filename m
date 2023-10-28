Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E724441F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 09:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhC877MB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698486018; x=1730022018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=trifNML9Los5RfnfLQTh8LuwUrE2fC3QrtUdjwUncC4=;
  b=YhC877MBf5xhMdTv0rmJlh1Mvq34A9SANDLmQhMeBigmZ2rYEIcCDdag
   2xFAayfz9imkSfT+Y7RGqMPJxiYtMH4AlY9DSVlW4IYim4PvF56/3gCoF
   4zSiQ2P/WWPxTBMbqoVCei+7V/WyuwXOzuNPF80sri27Sws3yXNWYQ8hz
   6qXSWEDKKGCv9Y3qCFvHNgXOJy8ddU7zAB+W4MJ4dQVuQaVQEQNfIuPPR
   qYMOaCH1ZjSGq93XNL1na5g1vxc4IgzaAXF7TD5/V2VqgRC0YwSY1zTM9
   mHgHsnbcuHHUD0TcO4WYiLPhLjUVLP0pjzB+yZCXAwPhwc9mSKrxUkM7E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="372943500"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="372943500"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 02:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="903520400"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="903520400"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2023 02:37:45 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwfni-000BcJ-0p;
	Sat, 28 Oct 2023 09:40:14 +0000
Date: Sat, 28 Oct 2023 17:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:mtk/v6.6/dev/intervals 28/38]
 drivers/media/platform/renesas/vsp1/vsp1_clu.c:186:56: error: 'struct
 vsp1_entity' has no member named 'config'
Message-ID: <202310281737.RcIZuwVb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.6/dev/intervals
head:   358c0c0ab9826452f42f79daa9ffbf1018246ad9
commit: de65f37d63de6c5277702b08e75b4e5c13677e39 [28/38] media: renesas: vsp1: Fix references to pad config
config: s390-randconfig-001-20231028 (https://download.01.org/0day-ci/archive/20231028/202310281737.RcIZuwVb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310281737.RcIZuwVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281737.RcIZuwVb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/renesas/vsp1/vsp1_clu.c: In function 'clu_configure_stream':
>> drivers/media/platform/renesas/vsp1/vsp1_clu.c:186:56: error: 'struct vsp1_entity' has no member named 'config'
     186 |                                             clu->entity.config,
         |                                                        ^
--
   drivers/media/platform/renesas/vsp1/vsp1_wpf.c: In function 'vsp1_wpf_set_rotation':
>> drivers/media/platform/renesas/vsp1/vsp1_wpf.c:69:61: error: 'struct vsp1_entity' has no member named 'config'
      69 |                                                  wpf->entity.config,
         |                                                             ^
   drivers/media/platform/renesas/vsp1/vsp1_wpf.c:72:63: error: 'struct vsp1_entity' has no member named 'config'
      72 |                                                    wpf->entity.config,
         |                                                               ^
   drivers/media/platform/renesas/vsp1/vsp1_wpf.c: In function 'wpf_configure_stream':
   drivers/media/platform/renesas/vsp1/vsp1_wpf.c:272:61: error: 'struct vsp1_entity' has no member named 'config'
     272 |                                                  wpf->entity.config,
         |                                                             ^
   drivers/media/platform/renesas/vsp1/vsp1_wpf.c:275:63: error: 'struct vsp1_entity' has no member named 'config'
     275 |                                                    wpf->entity.config,
         |                                                               ^
   drivers/media/platform/renesas/vsp1/vsp1_wpf.c: In function 'wpf_configure_partition':
   drivers/media/platform/renesas/vsp1/vsp1_wpf.c:410:61: error: 'struct vsp1_entity' has no member named 'config'
     410 |                                                  wpf->entity.config,
         |                                                             ^
--
   drivers/media/platform/renesas/vsp1/vsp1_hgo.c: In function 'hgo_configure_stream':
>> drivers/media/platform/renesas/vsp1/vsp1_hgo.c:143:60: error: 'struct vsp1_entity' has no member named 'config'
     143 |         crop = vsp1_entity_get_pad_selection(entity, entity->config,
         |                                                            ^~
   drivers/media/platform/renesas/vsp1/vsp1_hgo.c:145:63: error: 'struct vsp1_entity' has no member named 'config'
     145 |         compose = vsp1_entity_get_pad_selection(entity, entity->config,
         |                                                               ^~
--
   drivers/media/platform/renesas/vsp1/vsp1_hgt.c: In function 'hgt_configure_stream':
>> drivers/media/platform/renesas/vsp1/vsp1_hgt.c:142:60: error: 'struct vsp1_entity' has no member named 'config'
     142 |         crop = vsp1_entity_get_pad_selection(entity, entity->config,
         |                                                            ^~
   drivers/media/platform/renesas/vsp1/vsp1_hgt.c:144:63: error: 'struct vsp1_entity' has no member named 'config'
     144 |         compose = vsp1_entity_get_pad_selection(entity, entity->config,
         |                                                               ^~
--
   drivers/media/platform/renesas/vsp1/vsp1_rpf.c: In function 'rpf_configure_stream':
>> drivers/media/platform/renesas/vsp1/vsp1_rpf.c:92:61: error: 'struct vsp1_entity' has no member named 'config'
      92 |                                                  rpf->entity.config,
         |                                                             ^
   drivers/media/platform/renesas/vsp1/vsp1_rpf.c:95:63: error: 'struct vsp1_entity' has no member named 'config'
      95 |                                                    rpf->entity.config,
         |                                                               ^
   drivers/media/platform/renesas/vsp1/vsp1_rpf.c:169:66: error: 'struct vsp1_entity' has no member named 'config'
     169 |                                                         pipe->brx->config,
         |                                                                  ^~
   drivers/media/platform/renesas/vsp1/vsp1_rpf.c: In function 'rpf_configure_partition':
   drivers/media/platform/renesas/vsp1/vsp1_rpf.c:313:52: error: 'struct vsp1_entity' has no member named 'config'
     313 |         crop = *vsp1_rwpf_get_crop(rpf, rpf->entity.config);
         |                                                    ^
--
   drivers/media/platform/renesas/vsp1/vsp1_lif.c: In function 'lif_configure_stream':
>> drivers/media/platform/renesas/vsp1/vsp1_lif.c:97:70: error: 'struct vsp1_entity' has no member named 'config'
      97 |         format = vsp1_entity_get_pad_format(&lif->entity, lif->entity.config,
         |                                                                      ^
--
   drivers/media/platform/renesas/vsp1/vsp1_video.c: In function 'vsp1_video_calculate_partition':
>> drivers/media/platform/renesas/vsp1/vsp1_video.c:201:65: error: 'struct vsp1_entity' has no member named 'config'
     201 |                                             pipe->output->entity.config,
         |                                                                 ^
   drivers/media/platform/renesas/vsp1/vsp1_video.c: In function 'vsp1_video_pipeline_setup_partitions':
   drivers/media/platform/renesas/vsp1/vsp1_video.c:266:65: error: 'struct vsp1_entity' has no member named 'config'
     266 |                                             pipe->output->entity.config,
         |                                                                 ^


vim +186 drivers/media/platform/renesas/vsp1/vsp1_clu.c

1fd87bf2f3a762 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2015-11-11  168  
1fd87bf2f3a762 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2015-11-11  169  /* -----------------------------------------------------------------------------
1fd87bf2f3a762 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2015-11-11  170   * VSP1 Entity Operations
1fd87bf2f3a762 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2015-11-11  171   */
1fd87bf2f3a762 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2015-11-11  172  
46ce3639a579c2 drivers/media/platform/vsp1/vsp1_clu.c Kieran Bingham        2018-05-18  173  static void clu_configure_stream(struct vsp1_entity *entity,
1fd87bf2f3a762 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2015-11-11  174  				 struct vsp1_pipeline *pipe,
b36c6049ed4b6e drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2019-03-11  175  				 struct vsp1_dl_list *dl,
12832dd9dde924 drivers/media/platform/vsp1/vsp1_clu.c Kieran Bingham        2018-05-18  176  				 struct vsp1_dl_body *dlb)
1fd87bf2f3a762 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2015-11-11  177  {
1fd87bf2f3a762 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2015-11-11  178  	struct vsp1_clu *clu = to_clu(&entity->subdev);
46ce3639a579c2 drivers/media/platform/vsp1/vsp1_clu.c Kieran Bingham        2018-05-18  179  	struct v4l2_mbus_framefmt *format;
1fd87bf2f3a762 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2015-11-11  180  
b61873922d2c00 drivers/media/platform/vsp1/vsp1_clu.c Mauro Carvalho Chehab 2016-09-19  181  	/*
46ce3639a579c2 drivers/media/platform/vsp1/vsp1_clu.c Kieran Bingham        2018-05-18  182  	 * The yuv_mode can't be changed during streaming. Cache it internally
46ce3639a579c2 drivers/media/platform/vsp1/vsp1_clu.c Kieran Bingham        2018-05-18  183  	 * for future runtime configuration calls.
20fab5e086aa14 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2016-06-11  184  	 */
20fab5e086aa14 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2016-06-11  185  	format = vsp1_entity_get_pad_format(&clu->entity,
20fab5e086aa14 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2016-06-11 @186  					    clu->entity.config,
1fd87bf2f3a762 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2015-11-11  187  					    CLU_PAD_SINK);
20fab5e086aa14 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2016-06-11  188  	clu->yuv_mode = format->code == MEDIA_BUS_FMT_AYUV8_1X32;
20fab5e086aa14 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2016-06-11  189  }
1fd87bf2f3a762 drivers/media/platform/vsp1/vsp1_clu.c Laurent Pinchart      2015-11-11  190  

:::::: The code at line 186 was first introduced by commit
:::::: 20fab5e086aa141df5a94fd61706b18dfaadd090 [media] v4l: vsp1: clu: Support runtime modification of controls

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
