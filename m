Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517F9B665
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 00:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766364451; cv=none; b=O2EHmhhwnMtfC2vXN15QAgYVv8yqbZFhQroj8GlrDHC1WpBSFGdDjVJ4NlSu5K6OIZaTFRyXuByoZS/R2/CNP65PUSqhbUyA5orLphs9G6KP4gAWDaye9gfL2bhZhBodbuS4BNu32RLFmFPP8RU/h3YtgTtO1U4VjmPsxf4lPn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766364451; c=relaxed/simple;
	bh=vn0kjPSfHUY9BZePXsWrnGKHRPe87fMC7f0eYX5JADo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rf9o4f4kg0Jpew6ytczewify3E7G5VvY+wr6mH5DU/sXx1iPlRhuYN+mbPBCTd4y4LEk2D8KHyOjQukihBuBWQWjOE1pSEmkK0XOvA6A9Cp++r8rMZ2zgIg3r3FstNACmYQtwqTIKVgECG5qsYGbdcHnA5pNLJ3oVvJ93HMOn40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkRLgaFf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkRLgaFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766364449; x=1797900449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vn0kjPSfHUY9BZePXsWrnGKHRPe87fMC7f0eYX5JADo=;
  b=WkRLgaFfoPNUOYDAB3mea2pgYuRZIHgXafcQFpWBXulkSLJal8B/JYVp
   lsvSvX3wGExT+zYhI826p+WsWw0MqepFntPtt1DjNcH7c1MI6a+JP0Qd6
   G090lDSgfc+wJcAD74lUh4OnDWT0jIdFoi87AehwP18h5naFKA/1IIk9l
   0ik8zwEOGLW1oQW0fiKe8BqbsXWvGiAFaJ2rOsv/ZJoW4gEMoLJyJJOv5
   jqE8quEhhosqT7tuXna9ILjqmd13zQ6r1T+w08qAjEMQBravJsXga5WNE
   Q0/2CZ/VhQSCcdjbfNZKAhccpZuoOdnVbXTPTHndu5rCLw90NAutMQmLz
   w==;
X-CSE-ConnectionGUID: 7fLoCwv0QKGW3lTTtL5QDw==
X-CSE-MsgGUID: GRg6t9GoRq+iycqnn7La9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68268634"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68268634"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 16:47:28 -0800
X-CSE-ConnectionGUID: FLDC3bWGTJSb1XL7aYZy3Q==
X-CSE-MsgGUID: C/RFgYx8THKmj3SiXV4zFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="200276614"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2025 16:47:27 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXU57-000000000Lh-2QY3;
	Mon, 22 Dec 2025 00:47:25 +0000
Date: Mon, 22 Dec 2025 08:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/13] media: ipu6: Always call
 video_device_pipeline_alloc_start()
Message-ID: <202512220812.whZN2jLQ-lkp@intel.com>
References: <20251219095829.2830843-14-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219095829.2830843-14-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on media-tree/master sailus-media-tree/master linus/master v6.19-rc1 next-20251219]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-ipu6-Ensure-stream_mutex-is-acquired-when-dealing-with-node-list/20251219-180136
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251219095829.2830843-14-sakari.ailus%40linux.intel.com
patch subject: [PATCH 13/13] media: ipu6: Always call video_device_pipeline_alloc_start()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251222/202512220812.whZN2jLQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220812.whZN2jLQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220812.whZN2jLQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1180:25: warning: unused variable 'pipeline' [-Wunused-variable]
    1180 |         struct media_pipeline *pipeline;
         |                                ^~~~~~~~
   1 warning generated.


vim +/pipeline +1180 drivers/media/pci/intel/ipu6/ipu6-isys-video.c

3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1165  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1166  int ipu6_isys_setup_video(struct ipu6_isys_video *av,
faffdb64f711cf Sakari Ailus 2025-12-19  1167  			  struct media_pad *remote_pad,
faffdb64f711cf Sakari Ailus 2025-12-19  1168  			  struct media_pad *source_pad, int *nr_queues)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1169  {
d3bd039cd2a009 Bingbu Cao   2024-01-31  1170  	const struct ipu6_isys_pixelformat *pfmt =
d3bd039cd2a009 Bingbu Cao   2024-01-31  1171  		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1172  	struct device *dev = &av->isys->adev->auxdev.dev;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1173  	struct v4l2_mbus_frame_desc_entry entry;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1174  	struct v4l2_subdev_route *route = NULL;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1175  	struct v4l2_subdev_route *r;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1176  	struct v4l2_subdev_state *state;
faffdb64f711cf Sakari Ailus 2025-12-19  1177  	struct v4l2_subdev *remote_sd =
faffdb64f711cf Sakari Ailus 2025-12-19  1178  		media_entity_to_v4l2_subdev(remote_pad->entity);
faffdb64f711cf Sakari Ailus 2025-12-19  1179  	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(remote_sd);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31 @1180  	struct media_pipeline *pipeline;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1181  	int ret = -EINVAL;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1182  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1183  	*nr_queues = 0;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1184  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1185  	/* Find the root */
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1186  	state = v4l2_subdev_lock_and_get_active_state(remote_sd);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1187  	for_each_active_route(&state->routing, r) {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1188  		(*nr_queues)++;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1189  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1190  		if (r->source_pad == remote_pad->index)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1191  			route = r;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1192  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1193  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1194  	if (!route) {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1195  		v4l2_subdev_unlock_state(state);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1196  		dev_dbg(dev, "Failed to find route\n");
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1197  		return -ENODEV;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1198  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1199  	av->source_stream = route->sink_stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1200  	v4l2_subdev_unlock_state(state);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1201  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1202  	ret = ipu6_isys_csi2_get_remote_desc(av->source_stream,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1203  					     to_ipu6_isys_csi2(asd),
faffdb64f711cf Sakari Ailus 2025-12-19  1204  					     source_pad->entity, &entry);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1205  	if (ret == -ENOIOCTLCMD) {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1206  		av->vc = 0;
d3bd039cd2a009 Bingbu Cao   2024-01-31  1207  		av->dt = ipu6_isys_mbus_code_to_mipi(pfmt->code);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1208  	} else if (!ret) {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1209  		dev_dbg(dev, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1210  			entry.stream, entry.length, entry.bus.csi2.vc,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1211  			entry.bus.csi2.dt);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1212  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1213  		av->vc = entry.bus.csi2.vc;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1214  		av->dt = entry.bus.csi2.dt;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1215  	} else {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1216  		dev_err(dev, "failed to get remote frame desc\n");
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1217  		return ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1218  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1219  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1220  	ret = video_device_pipeline_alloc_start(&av->vdev);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1221  	if (ret < 0) {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1222  		dev_dbg(dev, "media pipeline start failed\n");
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1223  		return ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1224  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1225  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1226  	av->stream = ipu6_isys_get_stream(av, asd);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1227  	if (!av->stream) {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1228  		video_device_pipeline_stop(&av->vdev);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1229  		dev_err(dev, "no available stream for firmware\n");
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1230  		return -EINVAL;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1231  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1232  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1233  	return 0;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1234  }
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1235  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
