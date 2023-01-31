Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A86A940
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 19:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675194627; x=1706730627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bGiEvmtbpZzqrKClcnl8WctqCaTfjoD+/CK/Govaa8k=;
  b=RvqVzhXLhvDO8vLbiOikfk7ddW7o6ptw01AF1SLm/qoexKT5+h3KlkgJ
   5ETS9/gYuA0L6IwpQT6UHHdNahHudPkSLtSuewgruqU3pC0rYVpN8jXIb
   zeARAbZ/vWcuoE0HKhkUUuZT4RphbVq6Ed9JoQTEfeiBvUuA8pvvMng/Z
   eSvaagt1nP/BjQozzP7pqg4AFFzn7AIa5zrp+AkP/QiB/QP8599LDUcsH
   MigZQlqq3fenaAddJX8UyG1NX2hxVstMdIPAy9d/xhgoAkVlS/i63dz91
   X/XaLhq/KqlUjeFUlc4/9ligjWrzdZZm/VOHPHL5FquSLbpCGoNITKO6K
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="308283605"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="308283605"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 11:50:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="733249613"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="733249613"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Jan 2023 11:50:23 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMwe6-0004fQ-1E;
	Tue, 31 Jan 2023 19:50:22 +0000
Date: Wed, 1 Feb 2023 03:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: Wanhui Sun <wanhui.sun@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Chen Meng J <meng.j.chen@intel.com>, Meng Wei <wei.meng@intel.com>
Subject: [intel-lts:5.10/preempt-rt 10959/29702]
 drivers/media/v4l2-core/v4l2-subdev.c:1027:1: warning: the frame size of
 1356 bytes is larger than 1024 bytes
Message-ID: <202302010341.DZXN2ye6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wanhui,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/preempt-rt
head:   32e6f493fd5e5c8cadd5b628aac19f8e64db0f33
commit: f13978177f8c57c155d53df5f2df60f519e82e4a [10959/29702] v4l: subdev: Add support for sub-streams
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230201/202302010341.DZXN2ye6-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/f13978177f8c57c155d53df5f2df60f519e82e4a
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/preempt-rt
        git checkout f13978177f8c57c155d53df5f2df60f519e82e4a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from drivers/media/v4l2-core/v4l2-subdev.c:12:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1250:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1250 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1236:27: note: 'mem_section' declared here
    1236 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'v4l2_subdev_link_validate':
>> drivers/media/v4l2-core/v4l2-subdev.c:1027:1: warning: the frame size of 1356 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1027 | }
         | ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
   Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
   Selected by [m]:
   - SND_ATMEL_SOC_SSC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m]
   - SND_ATMEL_SOC_SSC_PDC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]


vim +1027 drivers/media/v4l2-core/v4l2-subdev.c

e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   907  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   908  int v4l2_subdev_link_validate(struct media_link *link)
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   909  {
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   910  	struct v4l2_subdev *sink;
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   911  	struct v4l2_subdev_route sink_routes[LINK_VALIDATE_ROUTES];
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   912  	struct v4l2_subdev_routing sink_routing = {
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   913  		.routes = sink_routes,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   914  		.num_routes = ARRAY_SIZE(sink_routes),
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   915  	};
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   916  	struct v4l2_subdev_route src_routes[LINK_VALIDATE_ROUTES];
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   917  	struct v4l2_subdev_routing src_routing = {
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   918  		.routes = src_routes,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   919  		.num_routes = ARRAY_SIZE(src_routes),
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   920  	};
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   921  	unsigned int i, j;
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   922  	int rval;
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   923  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   924  	sink = media_entity_to_v4l2_subdev(link->sink->entity);
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   925  	if (!sink)
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   926  		return -EINVAL;
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   927  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   928  	if (!(link->sink->flags & MEDIA_PAD_FL_MULTIPLEX &&
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   929  		link->source->flags & MEDIA_PAD_FL_MULTIPLEX))
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   930  		return v4l2_subdev_link_validate_one(link, link->source, 0,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   931  						     link->sink, 0);
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   932  	/*
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   933  	 * multiplex link cannot proceed without route information.
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   934  	 */
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   935  	rval = v4l2_subdev_call(sink, pad, get_routing, &sink_routing);
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   936  	if (rval) {
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   937  		dev_err(sink->entity.graph_obj.mdev->dev,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   938  			"error %d in get_routing() on %s, sink pad %u\n", rval,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   939  			sink->entity.name, link->sink->index);
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   940  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   941  		return rval;
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   942  	}
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   943  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   944  	rval = v4l2_subdev_call(media_entity_to_v4l2_subdev(
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   945  					link->source->entity),
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   946  				pad, get_routing, &src_routing);
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   947  	if (rval) {
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   948  		dev_dbg(sink->entity.graph_obj.mdev->dev,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   949  			"error %d in get_routing() on %s, source pad %u\n",
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   950  			rval, sink->entity.name, link->source->index);
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   951  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   952  		return rval;
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   953  	}
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   954  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   955  	dev_dbg(sink->entity.graph_obj.mdev->dev,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   956  		"validating multiplexed link \"%s\":%u -> \"%s\":%u; %u/%u routes\n",
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   957  		link->source->entity->name, link->source->index,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   958  		sink->entity.name, link->sink->index,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   959  		src_routing.num_routes, sink_routing.num_routes);
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   960  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   961  	for (i = 0; i < sink_routing.num_routes; i++) {
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   962  		/* Get the first active route for the sink pad. */
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   963  		if (sink_routes[i].sink_pad != link->sink->index ||
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   964  		    !(sink_routes[i].flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE)) {
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   965  			dev_dbg(sink->entity.graph_obj.mdev->dev,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   966  				"skipping sink route %u/%u -> %u/%u[%u]\n",
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   967  				sink_routes[i].sink_pad,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   968  				sink_routes[i].sink_stream,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   969  				sink_routes[i].source_pad,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   970  				sink_routes[i].source_stream,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   971  				(bool)(sink_routes[i].flags
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   972  				       & V4L2_SUBDEV_ROUTE_FL_ACTIVE));
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   973  			continue;
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   974  		}
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   975  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   976  		/*
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   977  		 * Get the corresponding route for the source pad.
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   978  		 * It's ok for the source pad to have routes active
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   979  		 * where the sink pad does not, but the routes that
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   980  		 * are active on the source pad have to be active on
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   981  		 * the sink pad as well.
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   982  		 */
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   983  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   984  		for (j = 0; j < src_routing.num_routes; j++) {
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   985  			if (src_routes[j].source_pad == link->source->index &&
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   986  			    src_routes[j].source_stream
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   987  			    == sink_routes[i].sink_stream)
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   988  				break;
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   989  		}
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   990  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   991  		if (j == src_routing.num_routes) {
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   992  			dev_err(sink->entity.graph_obj.mdev->dev,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   993  				"no corresponding source found.\n");
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   994  			return -EINVAL;
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   995  		}
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   996  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   997  		/* The source route must be active. */
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   998  		if (!(src_routes[j].flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE)) {
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13   999  			dev_dbg(sink->entity.graph_obj.mdev->dev,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1000  				"source route not active\n");
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1001  			return -EINVAL;
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1002  		}
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1003  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1004  		dev_dbg(sink->entity.graph_obj.mdev->dev,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1005  			"validating link \"%s\": %u/%u => \"%s\" %u/%u\n",
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1006  			link->source->entity->name, src_routes[j].source_pad,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1007  			src_routes[j].source_stream, sink->entity.name,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1008  			sink_routes[i].sink_pad, sink_routes[i].sink_stream);
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1009  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1010  		rval = v4l2_subdev_link_validate_one(
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1011  			link, link->source, src_routes[j].source_stream,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1012  			link->sink, sink_routes[i].sink_stream);
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1013  		if (rval) {
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1014  			dev_dbg(sink->entity.graph_obj.mdev->dev,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1015  				"error %d in link validation\n", rval);
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1016  			return rval;
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1017  		}
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1018  	}
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1019  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1020  	if (i < sink_routing.num_routes) {
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1021  		dev_dbg(sink->entity.graph_obj.mdev->dev,
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1022  			"not all sink routes verified; out of source routes\n");
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1023  		return -EINVAL;
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1024  	}
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1025  
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13  1026  	return 0;
e822d33e27dd00 drivers/media/v4l2-core/v4l2-subdev.c wu xia           2016-06-13 @1027  }
8227c92b696884 drivers/media/video/v4l2-subdev.c     Sakari Ailus     2011-10-10  1028  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
9b02cbb3ede89b drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart 2015-04-24  1029  

:::::: The code at line 1027 was first introduced by commit
:::::: e822d33e27dd00bb200f0e9db1811231554ce03c v4l: Take routing info into account in link validation

:::::: TO: wu xia <xia.wu@intel.com>
:::::: CC: Pan, Kris <kris.pan@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
