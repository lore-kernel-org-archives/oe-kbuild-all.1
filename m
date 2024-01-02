Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A15614F6B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jan 2024 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ssmVY+yu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d5336986cso91380165e9.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Jan 2024 06:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704205037; x=1704809837; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2rUe9G9ph5VPiX7/66+zz845Ttlqpb6kmmeMG7RvYGY=;
        b=ssmVY+yukLlmUp4tGSfkY013PvBz9mAM4D1OlYdixt5jDwqdP7V5yif1lSbrfHDKpy
         76iZeuH5HkZV2C1vn4oXN26mLIbAPOBHmhQvFGFKqOKSS+ultPvfrQTSfc738gE4ra6f
         p3yikSQqOwn515fddwZUkdJtByDUEj2BLjUUp+JCN11Z4iKBH5pv9XRis5ErqIm/kzzZ
         MqS4Aq/B+C/PPQbs7HiM537NlCnRsutiEHrXE3agv/yQiKNZMDXf/Q22sSjZNGpjxHbw
         rGv9HQauXhg+Q6HatMUCYJjs2ybjrqbQ68faPk1qXDCHGye2y74SwklXOfctqDWeun+T
         bA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704205037; x=1704809837;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2rUe9G9ph5VPiX7/66+zz845Ttlqpb6kmmeMG7RvYGY=;
        b=qO3cmdKVGaau9G96tLuSrDVNzkja+7qKizReWs5yDhUeNVUqTtTb43809tjx2glQbT
         k/51p3dz8dK6H+vapwHXr0k6ZLP5ujZh2iIG0raYpyXO0YcqvXZesZqEFhQK8BLIk4Fc
         8l+N77t5bC080SxMnRUw/EQchceLgpESx6tMzrkTmAO/iMj6TGW6EZqYxmOwdI8qOCPg
         VEgKlxg9wflFy30cKStN9dzjoVT/CuXzKbhctFvXyVfA/DyjIDbp+FwFd/iTn1lnSFeC
         bpaSEA5cTTm+vt18O/h05wCh7lsdEYh1rsh1N5ngOFC1ELDwKC/8tYNIydh/eQE2D9Eu
         /jbA==
X-Gm-Message-State: AOJu0Yzg8opqrmUUqFi4EIcl9tjRvwK1iMehi1hRaGLJIiVIAtk6zi+h
	mJx2MAn+DsB0ERgXR6jsKBBfW2U7XripPg==
X-Google-Smtp-Source: AGHT+IGtHX0RzHiSYwWrPg+u7CddJQY8taHch/L8sz4AYidvHzvi/80OEiaIqbxr/B0ogD4NkRKvsA==
X-Received: by 2002:a05:600c:3b94:b0:40d:3718:79fe with SMTP id n20-20020a05600c3b9400b0040d371879femr8888222wms.85.1704205037452;
        Tue, 02 Jan 2024 06:17:17 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id r14-20020a05600c458e00b0040d724896cbsm16884789wmo.18.2024.01.02.06.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:17:17 -0800 (PST)
Date: Tue, 2 Jan 2024 17:17:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 62/62] fs/xfs/libxfs/xfs_zones.c:89
 xfs_zone_validate_seq() warn: set_bit() takes a bit number
Message-ID: <0037ba30-5a54-458a-8916-90cca37c98c9@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   60b5c8af1e240372d2e077071f06662efdccec3a
commit: 60b5c8af1e240372d2e077071f06662efdccec3a [62/62] xfs: support zoned RT devices
config: x86_64-randconfig-161-20231216 (https://download.01.org/0day-ci/archive/20231216/202312161602.S0bkstgx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312161602.S0bkstgx-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_zones.c:89 xfs_zone_validate_seq() warn: set_bit() takes a bit number
fs/xfs/xfs_zone_alloc.c:86 xfs_zone_emptied() warn: set_bit() takes a bit number
fs/xfs/xfs_zone_alloc.c:674 xfs_zone_reset() warn: clear_bit() takes a bit number
fs/xfs/xfs_zone_alloc.c:883 xfs_zone_reclaim() warn: clear_bit() takes a bit number
fs/xfs/xfs_zone_alloc.c:914 xfs_zone_reclaim_pick() warn: test_and_set_bit() takes a bit number
fs/xfs/xfs_zone_alloc.c:920 xfs_zone_reclaim_pick() warn: clear_bit() takes a bit number

vim +89 fs/xfs/libxfs/xfs_zones.c

60b5c8af1e2403 Christoph Hellwig 2023-12-07   82  static int
60b5c8af1e2403 Christoph Hellwig 2023-12-07   83  xfs_zone_validate_seq(
60b5c8af1e2403 Christoph Hellwig 2023-12-07   84  	struct blk_zone		*zone,
60b5c8af1e2403 Christoph Hellwig 2023-12-07   85  	struct xfs_rtgroup	*rtg)
60b5c8af1e2403 Christoph Hellwig 2023-12-07   86  {
60b5c8af1e2403 Christoph Hellwig 2023-12-07   87  	struct xfs_mount	*mp = rtg->rtg_mount;
60b5c8af1e2403 Christoph Hellwig 2023-12-07   88  
60b5c8af1e2403 Christoph Hellwig 2023-12-07  @89  	set_bit(RTG_F_SEQUENTIAL, &rtg->rtg_flags);
60b5c8af1e2403 Christoph Hellwig 2023-12-07   90  

RTG_F_SEQUENTIAL is BIT(0) but it should probably be just 0.  Otherwise
it's a double shift bug.  BIT(BIT(0)).

60b5c8af1e2403 Christoph Hellwig 2023-12-07   91  	switch (zone->cond) {
60b5c8af1e2403 Christoph Hellwig 2023-12-07   92  	case BLK_ZONE_COND_EMPTY:
60b5c8af1e2403 Christoph Hellwig 2023-12-07   93  		return xfs_zone_validate_empty(zone, rtg);
60b5c8af1e2403 Christoph Hellwig 2023-12-07   94  	case BLK_ZONE_COND_IMP_OPEN:
60b5c8af1e2403 Christoph Hellwig 2023-12-07   95  	case BLK_ZONE_COND_EXP_OPEN:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

