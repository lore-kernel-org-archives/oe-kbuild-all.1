Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990B91E0E0B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 03:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750391909; cv=none; b=UVlA43sT9n0kWIaU//hr7s+sUxCLO9q5RVSXha4fE1gWF5H6H3tcP2yVFgjbWJ4KhkxN/9hzYCypQHtG23EColwPT6c1T22FFYw9l6/IqMQDxrBuVGM99INJr4KtzKOf34QZsnU+72PuGUhOu0feIpPuzcEKRO4uX7i+Mjo9QSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750391909; c=relaxed/simple;
	bh=9pJouk95Dk7jxMDD63iVY7u8zgT7ckQalui69Rr6lv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kT5hga/dwEYFQDUPiJ1UUkxFtTs8HxPteptBO54SKk6oiUCalxDWhg9v4cm9MaQK/m6UJ+Rhm0R0hqkiZtYDE6TJ94sFjjOIM/w8OHDqYmws51M2qESINFCdACKYt8cYN/YKwfKy1SP8wghs3MeDEKnobSzD7SlJB/tS6BErG+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GUifxINe; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GUifxINe"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-73a5c1d9d93so1423014a34.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 20:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750391906; x=1750996706; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IFHKqqtOaEqzhi2Jp/MtBYDxod6qfm4n84K2u+AHhyw=;
        b=GUifxINeR+BOLnu28XoI/KMAsgBMkXOQ9QDQRQdFx9JR+FU4yOiaCjdVFEbwKkhaXI
         rDE+9vXnCjQbj4ckOd1D1iV1RKnXpwPzwxM69uC11Rj5WRF18uKXP0lDNNJGExnV+APf
         92BcSMGHAWavTbaZ/Wos9idm9iJyzYSzw3DxpuE5NwhF00ASxD0hlMVHwMwgdYS1Oav6
         tnFChjsvHxsF5MmQAmCtTOBT9ChrcrnHRS1L/vIIk9WGSDzyDyyt6GDyOroL0lUgkUoj
         Hb/mdH76o18RXRiIwZadhiY/s1FEyn11KQiK3e+Vme7WcJU/S+q6mxmnu9NHNZ4y2I6s
         VWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750391906; x=1750996706;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFHKqqtOaEqzhi2Jp/MtBYDxod6qfm4n84K2u+AHhyw=;
        b=Ep0wk8MMmWHgD+E7cfZRwp1gW7PWnhhT3NlXUEk3q+opNrl9hm+Iv0bdYiUEu06cvn
         Gj6V/nPjmEEeqdoTCqayASZ3Zk6o5kLfi6vEVYX/fYdzPxCqwliXu635UPfrGC7nfQA4
         NUGqtxkbjwxE6YXWL6wI4Qv0axGcLAasZ/IX2oQ425dFRHniL1ZnSFAd83uqKP8DaL7b
         K4MWLu29jboDttrShaFKMWAmv9k62QiBtyXo1dnxycf4/cJ7kWDziILOBCCODACd0qxi
         RF1repyrCu1r1kKbV6wtYt2U9E+0ZQU3akCgt2wInIWeWUmwkhwnPZDzJwtYuKnMNfLQ
         nuPw==
X-Forwarded-Encrypted: i=1; AJvYcCVlIeUucHVmv3nl0m2WOMJlAJfOncBu+TOLhQ3SAzQIDNF0Ouvm+pVMAHbrXSjDHh0j6qlR2QHPZDE9pSx9@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ1wAEgDAjTaOfJGosEv2erpG3qs0ljxsDC52bkXXZ/Wp2ZHmm
	m0kVGjv6NvHEhLbQCsxMQa2r0O4kXrtCbpetP86fRhNJG50IPa1MFI+0DTANnGsAaR0=
X-Gm-Gg: ASbGncsVgIhA8cjYtay+hNvi5AqGUC3/dBorY5W4zUMkEELobZWM6jN/2waJdSIsh88
	u/CcImYaWr7cnBl04cWd0t8VUza44F7AFlvYAlxAMJagIExtchTv3naf7/cz1UjdpI/zNu6qnRR
	Fqut11d7LZHi1m/sZAG43FJeazgBKCBpeqX9/ujGlmRmFh/RYDmuVDGMHoMLoCgQLcoEq1tUM2b
	G//4GdzTrq6KMAm5DKKP68sJweltE8ctXSZDiaEJTBVJRYHX88DITDsJr52CBG2Ou3oBLoQ7EL5
	CxHlANDj5G2wrrrjx5q9uIHiQDpir6RCDSzuIrSyakd5paRMl7yr4t7ppRFxHgzgz2jGog==
X-Google-Smtp-Source: AGHT+IGUQmTj+9m7FaiYD4WJ5FF0OHhs7IVIQp/ZWwzNCBLK0VP6ehnZzuOQGptDNVvffH6/iWPxOQ==
X-Received: by 2002:a05:6830:8088:b0:72b:9bac:c044 with SMTP id 46e09a7af769-73a918fa9b7mr739379a34.0.1750391906569;
        Thu, 19 Jun 2025 20:58:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90ca8a3csm185316a34.47.2025.06.19.20.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 20:58:26 -0700 (PDT)
Date: Fri, 20 Jun 2025 06:58:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	bingbu.cao@linux.intel.com, stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com, tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 12/13] media: v4l2-mc: Introduce
 v4l2_mc_pipeline_enabled()
Message-ID: <e216aeb2-0a2a-4720-aeb5-13513d857054@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-13-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-ipu6-Use-correct-pads-for-xlate_streams/20250619-161847
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250619081546.1582969-13-sakari.ailus%40linux.intel.com
patch subject: [PATCH 12/13] media: v4l2-mc: Introduce v4l2_mc_pipeline_enabled()
config: i386-randconfig-141-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201121.oifnpp7r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506201121.oifnpp7r-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-mc.c:732 v4l2_mc_downpath_enabled() error: uninitialized symbol 'source_stream'.
drivers/media/v4l2-core/v4l2-mc.c:834 v4l2_mc_pipeline_enabled() warn: variable dereferenced before IS_ERR check 'src_pad' (see line 802)

vim +/source_stream +732 drivers/media/v4l2-core/v4l2-mc.c

bc83f513f8ad94 Sakari Ailus 2025-06-19  771  int v4l2_mc_pipeline_enabled(struct video_device *vdev,
bc83f513f8ad94 Sakari Ailus 2025-06-19  772  			     bool (*func)(struct video_device *vdev),
bc83f513f8ad94 Sakari Ailus 2025-06-19  773  			     struct media_pad **__sink_pad, u64 *__sink_streams)
bc83f513f8ad94 Sakari Ailus 2025-06-19  774  {
bc83f513f8ad94 Sakari Ailus 2025-06-19  775  	u64 sink_streams = 1U;
bc83f513f8ad94 Sakari Ailus 2025-06-19  776  	struct media_pad *src_pad;
bc83f513f8ad94 Sakari Ailus 2025-06-19  777  	u64 src_streams;
bc83f513f8ad94 Sakari Ailus 2025-06-19  778  	struct v4l2_subdev_state *state;
bc83f513f8ad94 Sakari Ailus 2025-06-19  779  	struct media_pad *sink_pad = vdev->entity.pads;
bc83f513f8ad94 Sakari Ailus 2025-06-19  780  	struct v4l2_subdev *sd = NULL;
bc83f513f8ad94 Sakari Ailus 2025-06-19  781  	bool streaming = true;
bc83f513f8ad94 Sakari Ailus 2025-06-19  782  	struct media_pad *tmp_pad;
bc83f513f8ad94 Sakari Ailus 2025-06-19  783  	u64 tmp_streams;
bc83f513f8ad94 Sakari Ailus 2025-06-19  784  	int ret;
bc83f513f8ad94 Sakari Ailus 2025-06-19  785  
bc83f513f8ad94 Sakari Ailus 2025-06-19  786  	if (!__sink_pad)
bc83f513f8ad94 Sakari Ailus 2025-06-19  787  		__sink_pad = &tmp_pad;
bc83f513f8ad94 Sakari Ailus 2025-06-19  788  	if (!__sink_streams)
bc83f513f8ad94 Sakari Ailus 2025-06-19  789  		__sink_streams = &tmp_streams;
bc83f513f8ad94 Sakari Ailus 2025-06-19  790  	*__sink_pad = NULL;
bc83f513f8ad94 Sakari Ailus 2025-06-19  791  	*__sink_streams = 0;
bc83f513f8ad94 Sakari Ailus 2025-06-19  792  
bc83f513f8ad94 Sakari Ailus 2025-06-19  793  	do {
bc83f513f8ad94 Sakari Ailus 2025-06-19  794  		src_pad = media_pad_remote_pad_unique(sink_pad);
bc83f513f8ad94 Sakari Ailus 2025-06-19  795  		if (IS_ERR(src_pad)) {
bc83f513f8ad94 Sakari Ailus 2025-06-19  796  			dev_dbg(sd ? sd->dev : vdev->dev_parent,
bc83f513f8ad94 Sakari Ailus 2025-06-19  797  				"no unique remote pad found from %s:%u\n",
bc83f513f8ad94 Sakari Ailus 2025-06-19  798  				sink_pad->entity->name, sink_pad->index);
bc83f513f8ad94 Sakari Ailus 2025-06-19  799  			return PTR_ERR(src_pad);
bc83f513f8ad94 Sakari Ailus 2025-06-19  800  		}
bc83f513f8ad94 Sakari Ailus 2025-06-19  801  
bc83f513f8ad94 Sakari Ailus 2025-06-19 @802  		sd = media_entity_to_v4l2_subdev(src_pad->entity);
bc83f513f8ad94 Sakari Ailus 2025-06-19  803  		if (!sd) {
bc83f513f8ad94 Sakari Ailus 2025-06-19  804  			dev_dbg(sd->dev,
bc83f513f8ad94 Sakari Ailus 2025-06-19  805  				"media entity %s is not a V4L2 sub-device\n",
bc83f513f8ad94 Sakari Ailus 2025-06-19  806  				src_pad->entity->name);
bc83f513f8ad94 Sakari Ailus 2025-06-19  807  			return -ENXIO;
bc83f513f8ad94 Sakari Ailus 2025-06-19  808  		}
bc83f513f8ad94 Sakari Ailus 2025-06-19  809  
bc83f513f8ad94 Sakari Ailus 2025-06-19  810  		/* Source streams match sink. */
bc83f513f8ad94 Sakari Ailus 2025-06-19  811  		src_streams = sink_streams;
bc83f513f8ad94 Sakari Ailus 2025-06-19  812  
bc83f513f8ad94 Sakari Ailus 2025-06-19  813  		state = v4l2_subdev_lock_and_get_active_state(sd);
bc83f513f8ad94 Sakari Ailus 2025-06-19  814  		ret = __v4l2_mc_pipeline_enabled(state, src_pad,
bc83f513f8ad94 Sakari Ailus 2025-06-19  815  						 src_streams, &sink_pad,
bc83f513f8ad94 Sakari Ailus 2025-06-19  816  						 &sink_streams);
bc83f513f8ad94 Sakari Ailus 2025-06-19  817  		v4l2_subdev_unlock_state(state);
bc83f513f8ad94 Sakari Ailus 2025-06-19  818  		if (ret)
bc83f513f8ad94 Sakari Ailus 2025-06-19  819  			return ret;
bc83f513f8ad94 Sakari Ailus 2025-06-19  820  	} while (sink_pad);
bc83f513f8ad94 Sakari Ailus 2025-06-19  821  
bc83f513f8ad94 Sakari Ailus 2025-06-19  822  	ret = v4l2_mc_source_get_streams(sd, src_pad->index, &src_streams);
bc83f513f8ad94 Sakari Ailus 2025-06-19  823  	if (ret)
bc83f513f8ad94 Sakari Ailus 2025-06-19  824  		return ret;
bc83f513f8ad94 Sakari Ailus 2025-06-19  825  
bc83f513f8ad94 Sakari Ailus 2025-06-19  826  	sd = media_entity_to_v4l2_subdev(src_pad->entity);
bc83f513f8ad94 Sakari Ailus 2025-06-19  827  
bc83f513f8ad94 Sakari Ailus 2025-06-19  828  	dev_dbg(sd->dev, "following %s:%u/%#llx\n", sd->entity.name,
bc83f513f8ad94 Sakari Ailus 2025-06-19  829  		src_pad->index, src_streams);
bc83f513f8ad94 Sakari Ailus 2025-06-19  830  
bc83f513f8ad94 Sakari Ailus 2025-06-19  831  	for (unsigned int i = __ffs(src_streams); src_streams;
bc83f513f8ad94 Sakari Ailus 2025-06-19  832  	     src_streams &= ~BIT_ULL(i), i = __ffs(src_streams)) {
bc83f513f8ad94 Sakari Ailus 2025-06-19  833  		sink_pad = media_pad_remote_pad_unique(src_pad);
bc83f513f8ad94 Sakari Ailus 2025-06-19 @834  		if (IS_ERR(src_pad)) {
                                                                   ^^^^^^^
Copy and paste.  s/src_pad/sink_pad/.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

