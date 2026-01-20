Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AED2F12CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890357; cv=none; b=KPGyivXiMGqfrDkJyk6B3hJTpNlXnArsV71Lt2d6apqld+rgucLHvr9NrJ1YYlGiOZ5Zd2GuwFUCQHFuug4WPK8QRjzPhb9ZQkRX4hWpEPEpXld2Ozpxr0X/LjYh5IplJrqc7uRKpmYIaeHLbJYUTaU8lx5i7m9c/5kadwgzTyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890357; c=relaxed/simple;
	bh=bFzV/JRvO0mVh/8Oau60Wo/dwox3USMdJ0+kXgJrLDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YGov2HqzbZj60raSVKN2IXRKstN9Rp4MNuRZr6hrWKGqp0itOKhL/5P/UGYJe3PZPYpI183TfXU5Pq8K8aibPbZsFV6FOkQmhf2qJlxO/IK3zkZw6AwP6ABoSX3dS3Hd/OaBj9Vz1d4iJw4/V6R9qiz0QsqJZmZO+bMCpT0fIKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wfuu/sZD; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wfuu/sZD"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso34268845e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 22:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768890354; x=1769495154; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MEH4a9dbSSC7KzSuEGK0I5t0sNTWBFQtBe43QofgiU=;
        b=Wfuu/sZDtdKBkk2Seo9IaLSybMLw0d+yEKwz4SbV7tm55pKFaUEfr59E/1lNhGzHGX
         8++gN7SEgd/m3cX/Jo/zCGaHSzvt4LvkzPg/Ehfq0PxlKjM18BP83o//1UBdJ4iX3FJP
         GdD2Hd1M0hUZm6Z2AQKvuTImIuu9Wy4tNfVbKhVYzL+dncHp3BM8itvgKCZsQqQUEoMK
         9+B6T94VxAUl8BLLvEKec2EE92sRG5/ivj9wO5YDv86kLbIXDXBLQ1NNiubmwcGXV4Jn
         075XOxc3Gj5IebHgjowi/Z/5Xc09Fy3ZOMhUPstI5AS3HoU1a7JW7DTzFFaNIeELxuzI
         38pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890354; x=1769495154;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MEH4a9dbSSC7KzSuEGK0I5t0sNTWBFQtBe43QofgiU=;
        b=Th7iJeAfx1EhxXvyQpp7J+En6CiuiHieKX7tK6mHAeiVkVvTh5x92BzCtauoTDjQ24
         Zub9R1bc1G/B0JW+VB5NEn2GdTxS9QJAwHqVJaPVw7/hMLE2BTHgLpMyX/4psYxqG/Ls
         Tobh4etfxF3CKPhccK2qcufXv+PpbKCRQ4a2YaZbYmzr9iJcjG9T0QK7b0VuREZ1arK/
         jyYSo+gur+t5oMLVCsn6a56D2E38HrgipwkROYF+SPDXpIDdw77qSdO+rY4Qnpt+z322
         T8esBCS1I+711P7sXsPpjMxjSUp7l5hCBsjT1UEv/97CqSECOz45uRdCHjcNYYaHohPf
         013A==
X-Forwarded-Encrypted: i=1; AJvYcCVhqNpkFeC4MhmP+fb3FvKyzMmh5jcMtX5MYvY72GYTNKAGydyGfqvGLQ/7CPkd7oiPCrt04o2j46ZmJSrA@lists.linux.dev
X-Gm-Message-State: AOJu0Yx559LLQu76PMrMSyBHwYxVCHrFQ2ZhbVpZK7pA+x6ySvunAkZA
	HI8z4sQsKFf8qJCnfrIoH90g/eGfG3xclx4brKmOO1o6n1dhShdVa3PdM3qvmU2PEQY=
X-Gm-Gg: AY/fxX66Vmk9VWr3vGAS/ZJWzyMRXgyPfduuLA2ef4vNRE2Y6MEsG4tDu14SeNKuL0L
	9+HPZueUnjYAWGjWQWvYIYjy02YzjeGCyHlzR7T5zKNYRB8bKrtDQPxlQJSUoUE3B1WUCwdLC8w
	CIqfp4jrXmE4tmkhfKK+VXPsUywkFOACwfkTtwF6cNq6giDE3TSEkON2i0CYf92LkeLCHxjE8Xf
	4bUqL6VBXC5pt7fTG1PfN3jUO12VOTk00hdaXQYaPXUnNUjAAB8JEVqUbvF5134fSGpe24TXeb0
	7HmE8XR3/C9do4vn5hQCc6RyfZrvhZZ0XRSeL4G5gdA6/xhYlLZXuiVFBtBwmIOvaMGBw7/YaUj
	rSH5VMXDWzl7YH+Y/TJ4hEBs4fAevVRm81dg12MkI3dzxxTMbFV4DDetimp5yFfNTnfuHtxcj/W
	O1IsU3A+ao3SYGNbMO
X-Received: by 2002:a05:600c:1c17:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-4803e7f18famr9364815e9.28.1768890353941;
        Mon, 19 Jan 2026 22:25:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cf33sm28222970f8f.25.2026.01.19.22.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:25:53 -0800 (PST)
Date: Tue, 20 Jan 2026 09:25:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 90/113]
 drivers/media/v4l2-core/v4l2-subdev.c:2675 v4l2_subdev_get_frame_desc()
 warn: was && intended here instead of ||?
Message-ID: <202601200147.SRFr3GE9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   55ba38aaeb6e07cbbbe550578fa4737b05de1d00
commit: 50fcff1c16cac7152a1b5b56a71656e97d276857 [90/113] media: v4l2-subdev: Introduce v4l2_subdev_get_frame_desc()
config: x86_64-randconfig-161-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200147.SRFr3GE9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601200147.SRFr3GE9-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-subdev.c:2675 v4l2_subdev_get_frame_desc() warn: was && intended here instead of ||?

vim +2675 drivers/media/v4l2-core/v4l2-subdev.c

50fcff1c16cac7 Sakari Ailus 2025-12-04  2660  int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
50fcff1c16cac7 Sakari Ailus 2025-12-04  2661  			       struct v4l2_mbus_frame_desc *desc)
50fcff1c16cac7 Sakari Ailus 2025-12-04  2662  {
50fcff1c16cac7 Sakari Ailus 2025-12-04  2663  	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
50fcff1c16cac7 Sakari Ailus 2025-12-04  2664  		unsigned int type = desc->type;
50fcff1c16cac7 Sakari Ailus 2025-12-04  2665  		int ret;
50fcff1c16cac7 Sakari Ailus 2025-12-04  2666  
50fcff1c16cac7 Sakari Ailus 2025-12-04  2667  		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
50fcff1c16cac7 Sakari Ailus 2025-12-04  2668  
50fcff1c16cac7 Sakari Ailus 2025-12-04  2669  		if (desc->type != type)
50fcff1c16cac7 Sakari Ailus 2025-12-04  2670  			return -EINVAL;
50fcff1c16cac7 Sakari Ailus 2025-12-04  2671  
50fcff1c16cac7 Sakari Ailus 2025-12-04  2672  		return ret;
50fcff1c16cac7 Sakari Ailus 2025-12-04  2673  	}
50fcff1c16cac7 Sakari Ailus 2025-12-04  2674  
50fcff1c16cac7 Sakari Ailus 2025-12-04 @2675  	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ||

The zero day bot chopped the other side of the or statement off.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

