Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B061E50B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 05:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742795910; cv=none; b=XSXZUJJi7jsfHTDwSpMthDl8M0FI8FXs/dTFzBGuLffDYMM5BJaXPQuXZoVAJnem/Pqs/rBWuiTBKTps7cxN7phARa/zmmFAt+NDSNE0OOj3gba17xrouXryh0PerGsscJMca+uvh8FZUGgYW6n5S8G2QpVUgBafxiGmTbs/AnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742795910; c=relaxed/simple;
	bh=yNIZquMF38bk2rHy+xtDADdE3FvhUO+NFPf+AFkX9Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lXAfQaRoQhhhRFTl3QQuAzulsaSyDSbJu07nAwygmUiGOV9wlXzdaMzxHeZMFLGUOOMPQqA7S9nSp9Ws+5sS5hGIMGpMtL1aOIzGRrAbN7Fco9GbEb8iWEGhSyMnI7d/6WaEroZaIfJT4ABzgDcTLWQHaa78E0yy5EoTUuDweeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NwP2FanC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NwP2FanC"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so38153145e9.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 22:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742795907; x=1743400707; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K8xlcuEIxJivxRfeLiEVKTBTLzbQUtLbKH23ujGL7u8=;
        b=NwP2FanCDHG78iouLYDvZ/mS4Lhu+qrbnYCOBow2mpWfUuCNxpHfoE+DEqJqRk8x6u
         usGDC7StcWH7XpOsg/B0B2oKxI8SXEuKpegLFSPPwtBYNxG5qzvcYFjOVLNGCmkoo+8e
         9Z2COfEQzrO3QP0He8plMU2zhTho+eWh2O52eaGT3UKXwhYYHYFNT9XxVms/SeKRxLwy
         Mbu4b8MfjFBIrXffzeas0sK2rt7WvRjdXxVWRom2SDIk2dKX/JecPfbCmaDrWMa3NGAe
         p+9ZwLAsbds2QJfs+K8XU03RlyKM8My1xy+q41WMryLusMkItDsOSZNTPnDx49GhVLjQ
         NF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742795907; x=1743400707;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8xlcuEIxJivxRfeLiEVKTBTLzbQUtLbKH23ujGL7u8=;
        b=p/DLa3hrdvZczLc45DAESBF1Lw++AS34QZJIIZsmRJzgXTu7Q3sd0mxioqD4HZeTor
         W9cIYdyxZFkkaR2ASFHsYG84bXfzppZr+gvZ6sX0BlRyYSgj08Xm4+rslCqqeZ/ydlrn
         0Vkhx4UjdHotBSb4+a2faYEnfoTutT61ejXZg2v59UAcTh3y+VTqQfn41Pqe1NXO6uvK
         ESJQqd0Nqu3tYLNep7hONIzN2t9oHAOFgWZUZ3eI/2cxPqx58WbaZ4uFLZA+GipSiCvn
         ThUsosG6dvSILa9V4WenP4rT875h/5bzB8QzKyfOYlFMz+sslBqN0h6QnmyzZLPRMLAG
         81mg==
X-Forwarded-Encrypted: i=1; AJvYcCX9eT/pcfZqOpgQ8Yb90L0tY5sBCxyOk1qLBH0qg3EQ6LPAxTDMRRAjAilZ2b1pEkV3eezmlDKJL91+MZw9@lists.linux.dev
X-Gm-Message-State: AOJu0YyERdwKw4aHOLckZQltpwLm1DIwgpKpDQdsiMSj3MAoIMjSJup1
	8Wmq7ncElDGv4yuhh2K/ngsj+WuR/IEeYPbhbJwZUIhvryoEiAFyaukJRhpn0zM=
X-Gm-Gg: ASbGncu+m7zw2SUqHUUJZBxVWeX6+EPGgzpFf+qkupEOgAAd15z7uhuJ7TMlks3tdUJ
	Ow1UEXkb1DpKusBTZs4C+2LkivtZ4sWfjjE4rstQm7BAqaR+liMv8ZYqPZRpJ4mIgt+ZN5oOss4
	9fsbaUjDGMXdabZnURnuaY+MO8VtAdhmBqno6urBtWk4GYl4XzMNPsPAJ2Y9ef07A1A0qbrmNTJ
	Y510iGI+E8703ZwN9JFoG/rgLxzXdyFQ40U++gmOQN/T+0EohN/jg2pq28NJALTBEWGDHv1oOD2
	tGxPrTXl76IBO4hTkcp98FuWKXyIkvqgc5BbadchXJbL+n+Fyg==
X-Google-Smtp-Source: AGHT+IEYCDGg3jXqt5Yod2eTSaSNqRti/PGIBrxXvgqe4swkYucOlNorgl+9aHFa/LpSmyufPn6xuA==
X-Received: by 2002:a05:600c:1e0d:b0:43c:f689:88ce with SMTP id 5b1f17b1804b1-43d50a1d1b4mr110427565e9.20.1742795906839;
        Sun, 23 Mar 2025 22:58:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9955c0sm9752903f8f.3.2025.03.23.22.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 22:58:26 -0700 (PDT)
Date: Mon, 24 Mar 2025 08:58:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tomasz Lis <tomasz.lis@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	=?utf-8?Q?Micha=C5=82?= Wajdeczko <michal.wajdeczko@intel.com>,
	Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v4 2/3] drm/xe/sriov: Shifting GGTT area post migration
Message-ID: <71bb454a-e61a-43d7-9eba-646ebf9e16da@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306222126.3382322-3-tomasz.lis@intel.com>

Hi Tomasz,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomasz-Lis/drm-drm_mm-Safe-macro-for-iterating-through-nodes-in-range/20250307-102511
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250306222126.3382322-3-tomasz.lis%40intel.com
patch subject: [PATCH v4 2/3] drm/xe/sriov: Shifting GGTT area post migration
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250323/202503231159.himCw1Ch-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503231159.himCw1Ch-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_sriov_vf.c:191 vf_post_migration_fixup_ggtt_nodes() error: uninitialized symbol 'err'.

vim +/err +191 drivers/gpu/drm/xe/xe_sriov_vf.c

253478de2cb134 Tomasz Lis 2025-03-06  174  static int vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
253478de2cb134 Tomasz Lis 2025-03-06  175  {
253478de2cb134 Tomasz Lis 2025-03-06  176  	struct xe_tile *tile;
253478de2cb134 Tomasz Lis 2025-03-06  177  	unsigned int id;
253478de2cb134 Tomasz Lis 2025-03-06  178  	int err;
253478de2cb134 Tomasz Lis 2025-03-06  179  
253478de2cb134 Tomasz Lis 2025-03-06  180  	for_each_tile(tile, xe, id) {
253478de2cb134 Tomasz Lis 2025-03-06  181  		struct xe_gt *gt = tile->primary_gt;
253478de2cb134 Tomasz Lis 2025-03-06  182  		int ret;
253478de2cb134 Tomasz Lis 2025-03-06  183  
253478de2cb134 Tomasz Lis 2025-03-06  184  		/* media doesn't have its own ggtt */
253478de2cb134 Tomasz Lis 2025-03-06  185  		if (xe_gt_is_media_type(gt))
253478de2cb134 Tomasz Lis 2025-03-06  186  			continue;
253478de2cb134 Tomasz Lis 2025-03-06  187  		ret = xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
253478de2cb134 Tomasz Lis 2025-03-06  188  		if (ret != ENODATA)
253478de2cb134 Tomasz Lis 2025-03-06  189  			err = ret;

err isn't initialized on else path.

253478de2cb134 Tomasz Lis 2025-03-06  190  	}
253478de2cb134 Tomasz Lis 2025-03-06 @191  	return err;
253478de2cb134 Tomasz Lis 2025-03-06  192  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

