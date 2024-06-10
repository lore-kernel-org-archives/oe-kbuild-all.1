Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FF28286D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718027418; cv=none; b=IfSG/4J4F0Nrf9K0nD/mFb5Kez5D7bUuSDJ167qmEjmoz4MIZ7kVfrZs/Qo2N+sVCeurbrI29PPNO6yKZKg1pvU+7Ytc0WBLoMfI2M3N076zerAL7Mn5t3jVEqEwrUdoXfGuD0sXgiIDZ/Vy6jgvh+4fEiiqEyw2CPgYOapG6Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718027418; c=relaxed/simple;
	bh=agdyUBPgF6H8dwJrP7A9Rp/a5hqRzc9bjVqEe/LPGDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SYgn3Z0wBVCmPgebof6glevJJPDUVJ/qNjEo1lqHVakS+N+EZm2qAWn24UqXcqQJk2lSxidt9e5vflU01wqp8l7zkMJlvJ2YgB4lpwNg/Ie/WuEUs7F83T3OJ+AkD9qS0zMbHy4qId9VAh563ZmnkDwrS1UoY2BwDX8EUExq+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N68e2Z+8; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N68e2Z+8"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-354b722fe81so3839315f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718027414; x=1718632214; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v58RC6jr1M1T/oN0NcWXR6ZAUSgZMQ4J+s2L21c84gI=;
        b=N68e2Z+83Rclcd5nrKDk720jiehveEJnX/8n2/mxua1ujHgpyC/m2EOm//0rskj6Pm
         tTm7jLsqpM2lIyNTzEtzt2Q78OcxFWZAJkTrZsHGHEa+PUTTQRwI02MXTSYJO8z4VhMR
         3CZLqfRvYmIx/hsMSsK/PYLRlDJFB45DmWrvk9Bum/YeJMl45f7+tWknqRx/OluqpVeF
         gR+h9btvo/tDRs4C3tMfDhGgTF0uJwfL++5EJ0VqlNWA8RJFVJg60a2dOyIJdl9Nj3WJ
         AjVjV1yHwGpr+rnBMAWKVTOqf8wrNHhbCIF+5Y0m6XE/4U9FUr8nQm9hqqPA++O52QeB
         /sLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718027414; x=1718632214;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v58RC6jr1M1T/oN0NcWXR6ZAUSgZMQ4J+s2L21c84gI=;
        b=wUEf+Qgp5iGrF578nNnhhPnW3e1YrLdHfmHQV4qWIduphzyjsZT+Ep9KZ/UoA1bnvJ
         Qj7aMLfhr3dw7cBUOj/l21nfgZI4rsLyzg2vTNLekO+WLZfJDKfHC5wakHQgjsUbtVUv
         np46FI7v9jCc5IhyO2JfzhnIvkH2sRNOzDk3ckQeXRWuNfACJ99n/7nKkYhT7J/vsf/J
         sS0v+IPnVmMmFnXKALSLl8N/foGPp8YwZnwDNBVYBvCRZi25iFUehVNuPKP7ORkbc9Yt
         dVSf1fbdwxJaxlGAOHt4NS5Eu7aaVLODLe45NOrOsBVT+uxR+4dSCkbqVEGLrMVbTrRv
         hMTw==
X-Forwarded-Encrypted: i=1; AJvYcCVOTmMo+s0tRknOkiN8FgsgloH0pTfy8MEXk5qSKUbjpdiLLl2nksUGaSGf2zRK0qicgThQVsPlhKvJ3btJYfDbCRgu8cVRtHi/A3L5FA==
X-Gm-Message-State: AOJu0YyJvwsRuLoqZ5uYPn3uTMq788F4bi+w6sdHUW6cWE5ZQFfhtShz
	BBg0lvggieov0umTpsGxJ/ByRyLOb2a0dVnTKCdqudTvA1AHpIzD93/3f3mRYamJ3fwzDwnTFGc
	P
X-Google-Smtp-Source: AGHT+IE7zn2A8qIt7IKzk+NIHajCl08mxKFy/Lq8si0Ifmf6D2yRfYox6z1QkjdQrP25L1XViU0tVA==
X-Received: by 2002:a05:6000:dc1:b0:35b:60d6:de8 with SMTP id ffacd0b85a97d-35efedd829amr6377352f8f.45.1718027414301;
        Mon, 10 Jun 2024 06:50:14 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5fc12e0sm11166022f8f.100.2024.06.10.06.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 06:50:13 -0700 (PDT)
Date: Mon, 10 Jun 2024 16:50:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jmondi:imx8mp/media-state/extensible-format 8/8]
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c:2397
 rkisp1_params_vb2_buf_init() warn: passing zero to 'PTR_ERR'
Message-ID: <74f5d4ea-b17f-4bd1-b892-f70aa64ee349@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git imx8mp/media-state/extensible-format
head:   091749220cf4a01bcfc64c9125ab07d632d578fe
commit: 091749220cf4a01bcfc64c9125ab07d632d578fe [8/8] media: rkisp1: Copy and validate parameters buffer
config: sparc64-randconfig-r071-20240609 (https://download.01.org/0day-ci/archive/20240610/202406102010.Gk3F3QRr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406102010.Gk3F3QRr-lkp@intel.com/

smatch warnings:
drivers/media/platform/rockchip/rkisp1/rkisp1-params.c:2397 rkisp1_params_vb2_buf_init() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +2397 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c

091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2382  static int rkisp1_params_vb2_buf_init(struct vb2_buffer *vb)
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2383  {
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2384  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2385  	struct rkisp1_params_buffer *params_buf =
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2386  		container_of(vbuf, struct rkisp1_params_buffer, vb);
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2387  	struct rkisp1_params *params = vb->vb2_queue->drv_priv;
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2388  	size_t buf_size = params->metafmt.buffersize;
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2389  
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2390  	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2391  		params_buf->cfg = NULL;
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2392  		return 0;
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2393  	}
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2394  
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2395  	params_buf->cfg = kvmalloc(buf_size, GFP_KERNEL);
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2396  	if (IS_ERR_OR_NULL(params_buf->cfg))
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05 @2397  		return PTR_ERR(params_buf->cfg);

This returns success if kvmalloc() fails.  It should be:

	params_buf->cfg = kvmalloc(buf_size, GFP_KERNEL);
	if (!params_buf->cfg)
		return -ENOMEM;

091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2398  
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2399  	return 0;
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2400  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

