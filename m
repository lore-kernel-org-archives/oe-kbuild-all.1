Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401524071E8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593382; cv=none; b=b3IeisHwlTbqx33/7oNHV9si5A3I1mxdWhDkdUb9sSd3ksbUrqjcJY07id7LT0wO3jtXNssRrtWK8iGkb0aElIm5LS/qmEDrK6PCcwgzoLQqDR3D1NI61THdL/48XM0yWM6XtxIItqMTlhK/hkopeCaM/QPVmv2ZhMWftYQWGbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593382; c=relaxed/simple;
	bh=qxX0dE0OBUtqw9JQvY1JePBsbgseMjd5rGtMEwrM+T8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bts7iA6f2UKQ/H/PSwf8A0eX69o9fyORqJSxuwo0U42uiNTYSjEoYLSj8RZdpdCsgDN0n/LcoZBuFYUwk1I1hHR9200BmCoElKSvsyvuZbRr6STi3Pse4BPN97KC1wZM4FgSZK1jRiZEqaG1O6Lgyj/aKJ2+XDbf2HOauQITg9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLurLLmo; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLurLLmo"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4864ebb6268so299246b6e.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Jul 2026 03:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783593379; x=1784198179; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoqXSN8PEKoTPPLhPa7oguIX3My0y2fKQVIp51mrWN4=;
        b=ZLurLLmoCAqUcYcd4nSE21V3y8qtvjfbRPOsx4HVXs2RJBKUDebFYLRaYFL4B4qxQY
         wA6yQSXtwVbxTP0+3l3TysKAj4afkRpnNfRuPDDyUiTSwe3pdDj2LR0jG4eQ1lGnjj00
         ExMEfbDCBU6QloRrWjEto1t/z+xXNyguLcSt9457VJrkMgWOJ6UY/HsCEBt0SrMkwDZz
         nvGGlapJp7X+c8LHuqpZdueN4RF2x6asX2EM0yEDpXQN8gVw2WfTVcai4vWwXM/EHXm+
         ZO7YunATfIsM2hRKKrSH3ImTAzTogZT5Tu3wPKsZlyiPYjHnN3l5w4IMMdnNh499F1yo
         mwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593379; x=1784198179;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoqXSN8PEKoTPPLhPa7oguIX3My0y2fKQVIp51mrWN4=;
        b=IN7rKUVtpzsymi+X2QLzj7Tnz6WBReR37YFkvvrvI9wZ0v5Wzxb9BFjE2ubklgMc6Z
         F8EwhCVwOLn5GKOchopXusGTskI8YAwTAX39ZIkxuybYxnKXjKvFm3NrcLIASo5ItKRj
         n72sFEyF0eaBiQf1e7IQkrdMTatD8ypgsG2GtDapyRQO1V/vlxcvTc9mx1VWpx/h3utt
         u9FMlrq/Ss3WMVPXGaLlzhBteOwsGfTvizQ8GG9cp/JnJONSiH0fInNa/i/J8CVvWCWd
         aTnDQvHaDD94lPGL/inIdPJjJIXvFWV4ogudo8ZEdg/QNh6CglYUE0dHabcSABIfP5hr
         vA2g==
X-Forwarded-Encrypted: i=1; AFNElJ9HedEXkLquLeNjETBmvw/NkrGzN8+hEKrTjBwqv70R4eLXdm974KiFLN3on4vqdpvwAKVWPgsYo5QXA3nI@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn4fz5Y6q8R07Ps6NvuL0sNCKDdxd4TlBroWBGt52yvB8/3E3L
	iiZ0SzwrxZ91zsceQ3heNvCLRY3MTtq/7PpCM6YPd0ekOx7P2+13BKnT
X-Gm-Gg: AfdE7ckGD9V3XcoWkNh6FRxVfSAgjcRTsmJBOrwbnFy1ZpjkFkoJYgCAPEBb6Ur3UZG
	BftEErK6WpATmj1CrU50TQ5m+o32ScHO3euOT2cfrHZqPTFutIiBUdpa4sBGMSsVP2qELnf0722
	EDdvB9Xk3U0s/4dLUORPnbURtSMTWp/T2dUMIljYLSvJ9bRYDbuAdHofEwjQLDFdziZi/R06HR6
	Mwy5gXjEpESwccFxlhOu3HtjZ9XPj8FVqxobQ/xFeCbhdiS42aTNpz1rHDLHm6pe5MQ9PYkz7JX
	9d/PbpDtUzBpcOzeeRvVZpTzUx8BHLK5vKODrw8XYREBFqLEjzFrHlGOJ0gG8S3pvqJ631x+ecx
	sWm9qs3/SFQKCXKTW5FRKWBYuQjb1P3yYJxxyOMEZk9JaYy/ppXka0rGsFueVFZF3yK4PYqWJlH
	AXtbeQ
X-Received: by 2002:a05:6808:1512:b0:497:da97:8c7b with SMTP id 5614622812f47-4a203fc1530mr5884922b6e.31.1783593379164;
        Thu, 09 Jul 2026 03:36:19 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1b01f1722sm3661154b6e.16.2026.07.09.03.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:36:17 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:36:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 98/105]
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c:853
 ipu6_isys_alloc_stream_firmware() error: double free of 'stream' (line 790)
Message-ID: <202607031449.9y46lBuM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   a6d4ce993bcd76851cfc7f28cc33aac011a30fa9
commit: 5bd6ad739336637aa65b270823cf43a5a8f2dcab [98/105] media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260703/202607031449.9y46lBuM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031449.9y46lBuM-lkp@intel.com/

smatch warnings:
drivers/media/pci/intel/ipu6/ipu6-isys-video.c:853 ipu6_isys_alloc_stream_firmware() error: double free of 'stream' (line 790)

vim +/stream +853 drivers/media/pci/intel/ipu6/ipu6-isys-video.c

5bd6ad73933663 Sakari Ailus 2026-06-26  770  struct ipu6_isys_stream *
5bd6ad73933663 Sakari Ailus 2026-06-26  771  ipu6_isys_alloc_stream_firmware(struct ipu6_isys_csi2 *csi2,
5bd6ad73933663 Sakari Ailus 2026-06-26  772  				struct v4l2_subdev_state *csi2_state,
5bd6ad73933663 Sakari Ailus 2026-06-26  773  				struct v4l2_mbus_frame_desc *desc,
5bd6ad73933663 Sakari Ailus 2026-06-26  774  				u8 vc)
5bd6ad73933663 Sakari Ailus 2026-06-26  775  {
5bd6ad73933663 Sakari Ailus 2026-06-26  776  	struct device *dev = &csi2->isys->adev->auxdev.dev;
5bd6ad73933663 Sakari Ailus 2026-06-26  777  	struct ipu6_isys_stream *stream;
5bd6ad73933663 Sakari Ailus 2026-06-26  778  	struct v4l2_subdev_route *route;
5bd6ad73933663 Sakari Ailus 2026-06-26  779  	int ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  780  
5bd6ad73933663 Sakari Ailus 2026-06-26  781  	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  782  	if (!stream) {
5bd6ad73933663 Sakari Ailus 2026-06-26  783  		ret = -ENOMEM;
5bd6ad73933663 Sakari Ailus 2026-06-26  784  		goto err_free_stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  785  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  786  
5bd6ad73933663 Sakari Ailus 2026-06-26  787  	ret = ida_alloc_max(&csi2->isys->streams, IPU6_ISYS_MAX_STREAMS - 1,
5bd6ad73933663 Sakari Ailus 2026-06-26  788  			    GFP_KERNEL);
5bd6ad73933663 Sakari Ailus 2026-06-26  789  	if (ret < 0) {
5bd6ad73933663 Sakari Ailus 2026-06-26 @790  		kfree(stream);
5bd6ad73933663 Sakari Ailus 2026-06-26  791  		goto err_free_stream;

Double free on this error path.

5bd6ad73933663 Sakari Ailus 2026-06-26  792  	}
5bd6ad73933663 Sakari Ailus 2026-06-26  793  
5bd6ad73933663 Sakari Ailus 2026-06-26  794  	stream->stream_handle = ret;
5bd6ad73933663 Sakari Ailus 2026-06-26  795  	mutex_init(&stream->mutex);
5bd6ad73933663 Sakari Ailus 2026-06-26  796  	init_completion(&stream->stream_open_completion);
5bd6ad73933663 Sakari Ailus 2026-06-26  797  	init_completion(&stream->stream_close_completion);
5bd6ad73933663 Sakari Ailus 2026-06-26  798  	init_completion(&stream->stream_start_completion);
5bd6ad73933663 Sakari Ailus 2026-06-26  799  	init_completion(&stream->stream_stop_completion);
5bd6ad73933663 Sakari Ailus 2026-06-26  800  	INIT_LIST_HEAD(&stream->queues);
5bd6ad73933663 Sakari Ailus 2026-06-26  801  	stream->isys = csi2->asd.isys;
5bd6ad73933663 Sakari Ailus 2026-06-26  802  	stream->asd = &csi2->asd;
5bd6ad73933663 Sakari Ailus 2026-06-26  803  	stream->vc = vc;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  804  
5bd6ad73933663 Sakari Ailus 2026-06-26  805  	scoped_guard(spinlock_irqsave, &stream->isys->power_lock) {
5bd6ad73933663 Sakari Ailus 2026-06-26  806  		stream->isys->streams_by_handle[stream->stream_handle] =
5bd6ad73933663 Sakari Ailus 2026-06-26  807  			stream;
5bd6ad73933663 Sakari Ailus 2026-06-26  808  		csi2->streams_by_vc[stream->vc] = stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  809  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  810  
5bd6ad73933663 Sakari Ailus 2026-06-26  811  	list_add(&stream->csi2_entry, &csi2->streams);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  812  
5bd6ad73933663 Sakari Ailus 2026-06-26  813  	for_each_active_route(&csi2_state->routing, route) {
5bd6ad73933663 Sakari Ailus 2026-06-26  814  		struct media_pad *vdev_pad =
5bd6ad73933663 Sakari Ailus 2026-06-26  815  			media_pad_remote_pad_first(&csi2->asd.pad[route->source_pad]);
5bd6ad73933663 Sakari Ailus 2026-06-26  816  		struct v4l2_mbus_frame_desc_entry *entry = NULL;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  817  
5bd6ad73933663 Sakari Ailus 2026-06-26  818  		for (unsigned int i = 0; i < desc->num_entries; i++) {
5bd6ad73933663 Sakari Ailus 2026-06-26  819  			if (desc->entry[i].stream != route->sink_stream)
5bd6ad73933663 Sakari Ailus 2026-06-26  820  				continue;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  821  
5bd6ad73933663 Sakari Ailus 2026-06-26  822  			entry = &desc->entry[i];
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  823  			break;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  824  		}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  825  
5bd6ad73933663 Sakari Ailus 2026-06-26  826  		if (!entry) {
5bd6ad73933663 Sakari Ailus 2026-06-26  827  			dev_dbg(dev, "cannot find stream %u in frame desc\n",
5bd6ad73933663 Sakari Ailus 2026-06-26  828  				route->sink_stream);
5bd6ad73933663 Sakari Ailus 2026-06-26  829  			ret = -EINVAL;
5bd6ad73933663 Sakari Ailus 2026-06-26  830  			goto err_ida_free;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  831  		}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  832  
5bd6ad73933663 Sakari Ailus 2026-06-26  833  		if (entry->bus.csi2.vc != vc)
5bd6ad73933663 Sakari Ailus 2026-06-26  834  			continue;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  835  
5bd6ad73933663 Sakari Ailus 2026-06-26  836  		struct ipu6_isys_video *av =
5bd6ad73933663 Sakari Ailus 2026-06-26  837  			container_of_const(vdev_pad, struct ipu6_isys_video,
5bd6ad73933663 Sakari Ailus 2026-06-26  838  					   pad);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  839  
5bd6ad73933663 Sakari Ailus 2026-06-26  840  		list_add(&av->aq.node, &stream->queues);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  841  
5bd6ad73933663 Sakari Ailus 2026-06-26  842  		stream->nr_output_pins++;
5bd6ad73933663 Sakari Ailus 2026-06-26  843  		av->stream = stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  844  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  845  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  846  	return stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  847  
5bd6ad73933663 Sakari Ailus 2026-06-26  848  err_ida_free:
5bd6ad73933663 Sakari Ailus 2026-06-26  849  	list_del(&stream->csi2_entry);
5bd6ad73933663 Sakari Ailus 2026-06-26  850  	ida_free(&csi2->isys->streams, stream->stream_handle);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  851  
5bd6ad73933663 Sakari Ailus 2026-06-26  852  err_free_stream:
5bd6ad73933663 Sakari Ailus 2026-06-26 @853  	kfree(stream);

Second free.

3c1dfb5a69cf83 Bingbu Cao   2024-01-31  854  
5bd6ad73933663 Sakari Ailus 2026-06-26  855  	return ERR_PTR(ret);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  856  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

