Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5D187F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 04:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721882198; cv=none; b=QMFbC9ZBC2RTR6ksZ1R4sFqFPBnzSfUaRex3afcmOdmCP5rLUHf6w9IBS6wkxkB7quIcWldoh2DAyel6tcqlCaBwwxnQ+URSVuGsOgw+xN7d6Z+7NmgPJ1y7rGXmC2or3FqRfuJSrKD4n2j4+HdP0h2cmui4yvp9OkfI9txLGq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721882198; c=relaxed/simple;
	bh=g3MQue6DPrcM3/oYlSOSueEe4ENE37p7OQKXd8KPry0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qM+4b/9sonHFXS009XsWZL0vjQBRudYdU59t0+pJ8xWiboqG5h99nWflCVvGaLK2lHfFvx7kh8eC2iBcavRLR9VKTULcOjshaDCo8by2qsoXxMX5uH26EdJVHvMRZTfUNd9re7qS9iwQsu4buwPB7dy/g/XgQd7/xyD8LQfSjOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VEjfm4Ba; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VEjfm4Ba"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25d6dd59170so261442fac.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 21:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721882195; x=1722486995; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5iMh8IbQPSJpHcShy/xCb7bIzttiHffpF2Mhjt5fOY=;
        b=VEjfm4Ba2ZuNlYY6MIK3NXSXgzyeBeYDx0mntqRMXnt5aLTE2D71eYYz47uyNVVCSb
         qyxwox3yR9r/uWNY3zPlKBwQ6jsEvNmbW00UIHKFSGJ9Uq9M2teX2tLqJHMhd1SXykyi
         K6HRygZhSBWmTn3wkLnmnxCJZlSP/LRK4X4spK48geJpWIvbSkmgNqbGqUnPNC0Jo3yU
         TcbxAG4XqfJ8qj+qMQWuK3QckQTw1Jck6cb68qGfNRGFIRVGSWmJKUR8vknu782/pIwL
         mYUT/jPtLekknPCTanuMxliGOtmPKwNgTU1S76qcJYc0D0fln7HopKVzPMQbQvtfZtK7
         rZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721882195; x=1722486995;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5iMh8IbQPSJpHcShy/xCb7bIzttiHffpF2Mhjt5fOY=;
        b=AEbfei5K5ERSlPrq5ZMn3Wx1ReekBMEi2Wrt1c7BUbiLWuOsZ3TwjtxeOPap0v0H7Q
         8kBtY5tAUztBdb8PzX/N2VdJmAp9+0E5VMSE3mLH0r6w3daLvhJ869516xTHVa5OsaG5
         eQ4lLYdl9RF8aOrxWW0zTidJ8XU+06hOJwdynG+jyLEkNgJMlSSWF006r+ugMEjeD20v
         PjzSCE5kXOXbfnkn5kcAC84uPxFMWjTBbm4DLT9gmEblHdOTu8x2wvbp3yjGtmyAcWlp
         nm/QFZOEwncED8tyA+poK1pe15jbb1b6c3oP322E+XB6UyDLlKx9ZHQoQj09aC+/+PZc
         Osbw==
X-Forwarded-Encrypted: i=1; AJvYcCULxNpWc7bfOgTYsP6Mkx8DZRtak5teaMqYfTw894FRg3Ew9ZdxD1oUwNUjoynJUZMIX+ZkzoCBDHpkruyJ5B67nhbCTWlWTq5i6G2b8Q==
X-Gm-Message-State: AOJu0YwEnQzI8F5d5WSfIJBh0PzrwqSZTp/tBYk/y6QJCAWXYg9NcER1
	i+WuGt+DjcmY+G3yd2GhrU4yYeHPufLzkHtrsV4qUj+7XAWwOA9FA0MHcrK3Ons=
X-Google-Smtp-Source: AGHT+IH/8yStkhJVN06A38rAdUcv1FIXuGJjIK5doF/2GgD38hPHmYFc+JOSQ8XVlwTzFreMK6gWiQ==
X-Received: by 2002:a05:6870:718c:b0:260:e3c1:1788 with SMTP id 586e51a60fabf-266ede02c8bmr758265fac.44.1721882195366;
        Wed, 24 Jul 2024 21:36:35 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6751:f2ec:fdb9:323e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-265771e5c9csm156710fac.45.2024.07.24.21.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:36:34 -0700 (PDT)
Date: Wed, 24 Jul 2024 23:36:32 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:for_each_port-2024-07-23 19/24]
 drivers/media/platform/xilinx/xilinx-vipp.c:281 xvip_graph_build_dma()
 error: uninitialized symbol 'ep'.
Message-ID: <ae1c30d8-2635-4344-9d72-5015d79549f3@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux for_each_port-2024-07-23
head:   0d5c15c966de29ebe4da371303e11521b14de8dd
commit: 8c1c6536a9ceb9158b6bd36332c4f8ad7c84bfd7 [19/24] of: property: replace of_graph_get_next_device_endpoint()
config: i386-randconfig-141-20240725 (https://download.01.org/0day-ci/archive/20240725/202407251014.1g932lAT-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407251014.1g932lAT-lkp@intel.com/

smatch warnings:
drivers/media/platform/xilinx/xilinx-vipp.c:281 xvip_graph_build_dma() error: uninitialized symbol 'ep'.

vim +/ep +281 drivers/media/platform/xilinx/xilinx-vipp.c

df3305156f98933 Laurent Pinchart      2013-05-15  192  static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
df3305156f98933 Laurent Pinchart      2013-05-15  193  {
df3305156f98933 Laurent Pinchart      2013-05-15  194  	u32 link_flags = MEDIA_LNK_FL_ENABLED;
df3305156f98933 Laurent Pinchart      2013-05-15  195  	struct device_node *node = xdev->dev->of_node;
df3305156f98933 Laurent Pinchart      2013-05-15  196  	struct media_entity *source;
df3305156f98933 Laurent Pinchart      2013-05-15  197  	struct media_entity *sink;
df3305156f98933 Laurent Pinchart      2013-05-15  198  	struct media_pad *source_pad;
df3305156f98933 Laurent Pinchart      2013-05-15  199  	struct media_pad *sink_pad;
df3305156f98933 Laurent Pinchart      2013-05-15  200  	struct xvip_graph_entity *ent;
859969b38e2e935 Sakari Ailus          2016-08-26  201  	struct v4l2_fwnode_link link;
7d5085ad203440f Kuninori Morimoto     2024-02-02  202  	struct device_node *ep;
df3305156f98933 Laurent Pinchart      2013-05-15  203  	struct xvip_dma *dma;
df3305156f98933 Laurent Pinchart      2013-05-15  204  	int ret = 0;
df3305156f98933 Laurent Pinchart      2013-05-15  205  
df3305156f98933 Laurent Pinchart      2013-05-15  206  	dev_dbg(xdev->dev, "creating links for DMA engines\n");
df3305156f98933 Laurent Pinchart      2013-05-15  207  
7d5085ad203440f Kuninori Morimoto     2024-02-02  208  	for_each_endpoint_of_node(node, ep) {

In this tree for_each_endpoint_of_node() is now a nested loop but how
is that going to work???

68d9c47b1679ec8 Rob Herring           2017-07-21  209  		dev_dbg(xdev->dev, "processing endpoint %pOF\n", ep);
df3305156f98933 Laurent Pinchart      2013-05-15  210  
859969b38e2e935 Sakari Ailus          2016-08-26  211  		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);
df3305156f98933 Laurent Pinchart      2013-05-15  212  		if (ret < 0) {
68d9c47b1679ec8 Rob Herring           2017-07-21  213  			dev_err(xdev->dev, "failed to parse link for %pOF\n",
68d9c47b1679ec8 Rob Herring           2017-07-21  214  				ep);
df3305156f98933 Laurent Pinchart      2013-05-15  215  			continue;
df3305156f98933 Laurent Pinchart      2013-05-15  216  		}
df3305156f98933 Laurent Pinchart      2013-05-15  217  
df3305156f98933 Laurent Pinchart      2013-05-15  218  		/* Find the DMA engine. */
df3305156f98933 Laurent Pinchart      2013-05-15  219  		dma = xvip_graph_find_dma(xdev, link.local_port);
df3305156f98933 Laurent Pinchart      2013-05-15  220  		if (dma == NULL) {
df3305156f98933 Laurent Pinchart      2013-05-15  221  			dev_err(xdev->dev, "no DMA engine found for port %u\n",
df3305156f98933 Laurent Pinchart      2013-05-15  222  				link.local_port);
859969b38e2e935 Sakari Ailus          2016-08-26  223  			v4l2_fwnode_put_link(&link);
df3305156f98933 Laurent Pinchart      2013-05-15  224  			ret = -EINVAL;
df3305156f98933 Laurent Pinchart      2013-05-15  225  			break;

In the original code, this broke out of the loop, but how it just goes
to the outer loop and the "ep" refcount is leaked.

df3305156f98933 Laurent Pinchart      2013-05-15  226  		}
df3305156f98933 Laurent Pinchart      2013-05-15  227  
df3305156f98933 Laurent Pinchart      2013-05-15  228  		dev_dbg(xdev->dev, "creating link for DMA engine %s\n",
df3305156f98933 Laurent Pinchart      2013-05-15  229  			dma->video.name);
df3305156f98933 Laurent Pinchart      2013-05-15  230  
df3305156f98933 Laurent Pinchart      2013-05-15  231  		/* Find the remote entity. */
d079f94c90469f4 Steve Longerbeam      2018-09-29  232  		ent = xvip_graph_find_entity(xdev, link.remote_node);
df3305156f98933 Laurent Pinchart      2013-05-15  233  		if (ent == NULL) {
68d9c47b1679ec8 Rob Herring           2017-07-21  234  			dev_err(xdev->dev, "no entity found for %pOF\n",
68d9c47b1679ec8 Rob Herring           2017-07-21  235  				to_of_node(link.remote_node));
859969b38e2e935 Sakari Ailus          2016-08-26  236  			v4l2_fwnode_put_link(&link);
df3305156f98933 Laurent Pinchart      2013-05-15  237  			ret = -ENODEV;
df3305156f98933 Laurent Pinchart      2013-05-15  238  			break;
df3305156f98933 Laurent Pinchart      2013-05-15  239  		}
df3305156f98933 Laurent Pinchart      2013-05-15  240  
df3305156f98933 Laurent Pinchart      2013-05-15  241  		if (link.remote_port >= ent->entity->num_pads) {
68d9c47b1679ec8 Rob Herring           2017-07-21  242  			dev_err(xdev->dev, "invalid port number %u on %pOF\n",
859969b38e2e935 Sakari Ailus          2016-08-26  243  				link.remote_port,
68d9c47b1679ec8 Rob Herring           2017-07-21  244  				to_of_node(link.remote_node));
859969b38e2e935 Sakari Ailus          2016-08-26  245  			v4l2_fwnode_put_link(&link);
df3305156f98933 Laurent Pinchart      2013-05-15  246  			ret = -EINVAL;
df3305156f98933 Laurent Pinchart      2013-05-15  247  			break;
df3305156f98933 Laurent Pinchart      2013-05-15  248  		}
df3305156f98933 Laurent Pinchart      2013-05-15  249  
df3305156f98933 Laurent Pinchart      2013-05-15  250  		if (dma->pad.flags & MEDIA_PAD_FL_SOURCE) {
df3305156f98933 Laurent Pinchart      2013-05-15  251  			source = &dma->video.entity;
df3305156f98933 Laurent Pinchart      2013-05-15  252  			source_pad = &dma->pad;
df3305156f98933 Laurent Pinchart      2013-05-15  253  			sink = ent->entity;
df3305156f98933 Laurent Pinchart      2013-05-15  254  			sink_pad = &sink->pads[link.remote_port];
df3305156f98933 Laurent Pinchart      2013-05-15  255  		} else {
df3305156f98933 Laurent Pinchart      2013-05-15  256  			source = ent->entity;
df3305156f98933 Laurent Pinchart      2013-05-15  257  			source_pad = &source->pads[link.remote_port];
df3305156f98933 Laurent Pinchart      2013-05-15  258  			sink = &dma->video.entity;
df3305156f98933 Laurent Pinchart      2013-05-15  259  			sink_pad = &dma->pad;
df3305156f98933 Laurent Pinchart      2013-05-15  260  		}
df3305156f98933 Laurent Pinchart      2013-05-15  261  
859969b38e2e935 Sakari Ailus          2016-08-26  262  		v4l2_fwnode_put_link(&link);
df3305156f98933 Laurent Pinchart      2013-05-15  263  
df3305156f98933 Laurent Pinchart      2013-05-15  264  		/* Create the media link. */
df3305156f98933 Laurent Pinchart      2013-05-15  265  		dev_dbg(xdev->dev, "creating %s:%u -> %s:%u link\n",
df3305156f98933 Laurent Pinchart      2013-05-15  266  			source->name, source_pad->index,
df3305156f98933 Laurent Pinchart      2013-05-15  267  			sink->name, sink_pad->index);
df3305156f98933 Laurent Pinchart      2013-05-15  268  
8df00a15817e3a2 Mauro Carvalho Chehab 2015-08-07  269  		ret = media_create_pad_link(source, source_pad->index,
df3305156f98933 Laurent Pinchart      2013-05-15  270  					       sink, sink_pad->index,
df3305156f98933 Laurent Pinchart      2013-05-15  271  					       link_flags);
df3305156f98933 Laurent Pinchart      2013-05-15  272  		if (ret < 0) {
df3305156f98933 Laurent Pinchart      2013-05-15  273  			dev_err(xdev->dev,
df3305156f98933 Laurent Pinchart      2013-05-15  274  				"failed to create %s:%u -> %s:%u link\n",
df3305156f98933 Laurent Pinchart      2013-05-15  275  				source->name, source_pad->index,
df3305156f98933 Laurent Pinchart      2013-05-15  276  				sink->name, sink_pad->index);
df3305156f98933 Laurent Pinchart      2013-05-15  277  			break;
df3305156f98933 Laurent Pinchart      2013-05-15  278  		}
df3305156f98933 Laurent Pinchart      2013-05-15  279  	}
df3305156f98933 Laurent Pinchart      2013-05-15  280  
df3305156f98933 Laurent Pinchart      2013-05-15 @281  	of_node_put(ep);

Smatch complains that we might never enter the outside loop.  But all
the break paths are suspect really.

df3305156f98933 Laurent Pinchart      2013-05-15  282  	return ret;
df3305156f98933 Laurent Pinchart      2013-05-15  283  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

