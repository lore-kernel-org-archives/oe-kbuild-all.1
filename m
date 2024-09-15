Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254A5946C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726402439; cv=none; b=PllRl1TpQ/qLQ1BWd45DWv4hvs/Hy/c8kyKpPAFAhP7PUZcOK9uAfbXD+glnQCDuXjqb94RhKOZThm2Gp8hTA/bl1j1kPAHAgWInnswhOEqPqJc+8iWiH5zV1c4KO/i7VKQXQZWmP4RSl2bD7hkltLGfADeWQTwpVr4lX74gCrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726402439; c=relaxed/simple;
	bh=UVa6l0V7rrbFZZMICAZCWBKfAY681jk78M660bUHt2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P005IHyIsq5dqraJ9K2PtwqZTIxvbwtwfM9iSiKffQbIYTqSOudQe86QYOE2ADs9nsrLRZkBFkD+Twzd4T2aUkner2RRNLtkCPUU3NJPNR9D+LuL6A/78TkpunMO90xHwRrc2IDRlFbKLEST8PXD/0Xq6EbKmsnCgP5zDuiQHCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NVHj5CwS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NVHj5CwS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-375e5c12042so1949080f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 05:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726402435; x=1727007235; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbacs5q0lLjxoCXrYkHylGc3sqVSoO90SYD6szybiW0=;
        b=NVHj5CwSqXOtcw4mfmzTu2XJ+uOYAuFsMxN3BJsQ2+uDIg5v/uSo43gUXLT7IvTGGY
         MF/lZivQPwQgwOE3dFjoexcBXP3t8gwtS7riJXSJt9ZosFRPlqkwadepkV4EvPADkIwc
         W6J9r0Q4xtzDCLLka7XSV6Ma0OVTLDtBoG4iZJhoCkeHZxZLGL4A8ag4FHrA/MbuHqwY
         5o3Ivu8wpw/WJVbwwB9wCVoY5C/UBUmc/SBkwr+gC+oXxdLJSld3CEzTMJ1ZgyGWcwJD
         Hh6Toa/kRh9ePQc1XB//fEMc9G7bEuBlX9AJj2qkMTox1VO3QagD8qw4X+JOaHm0KR+A
         +IPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726402435; x=1727007235;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbacs5q0lLjxoCXrYkHylGc3sqVSoO90SYD6szybiW0=;
        b=l9qWaOKu6/2mQ0Gp8W/a9vQ92AlUucciA1ceKqUC025GJymY4efjNwiByf5mpB9HGv
         uwMjj31IT4csoV3c90L4KQQCYu49e2yXU8qz5mAL0p7uwS4JHg/SWACU9xHIe7nYrjk4
         60sHGPIDGBwnjcIONtF1+QZRl9LXEt8ISFpJnZ09QL+VynHxwnWYIltiqpGudtwlp9ur
         WXVrQ+qBthRA7Q5CAritW/AFBXvvzIE5F/FIhHALJAFEc6CqcVZQE/rvWdXT4hVZT05A
         bw4mqROwe8QzVEe02jSqGwZNbRAyP+CzzBxRsNxIyfkISYVvD++poTkzGeoOZ3kI0Njb
         z62g==
X-Forwarded-Encrypted: i=1; AJvYcCWDQKGR/eXAGe+XN2XnweNwRzEBXd8J8jgMfmvf4ue1GlUAJas9pUibJRXSYBPBZtJuiGqh0qoyWatN8AxU@lists.linux.dev
X-Gm-Message-State: AOJu0YzY5/jZmKi8tatvZoJ9IDvMOoHuvQ1YOkRKHcMAEAumLKcXZHs0
	Wlx/XjW8DcLTysTJU+6TUvE5c8KUseizcOU9rK0/zLeae0Tdv4bxgFg40NgDkT0=
X-Google-Smtp-Source: AGHT+IE2eApXxU+5wskyDHYyV8D+atVqB7mtF3s0obqGeeowHjxiCT+dV2WmSdf5VXrKqWDvkRVdlg==
X-Received: by 2002:a5d:4e10:0:b0:374:bd93:9bd4 with SMTP id ffacd0b85a97d-378c2d62109mr6900745f8f.56.1726402434979;
        Sun, 15 Sep 2024 05:13:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e71f068esm4591275f8f.3.2024.09.15.05.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 05:13:54 -0700 (PDT)
Date: Sun, 15 Sep 2024 15:13:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned-rebase 51/57] fs/xfs/xfs_zone_gc.c:322
 xfs_zone_gc_data_alloc() error: buffer overflow 'data->scratch' 2 <= s32max
Message-ID: <18a0d6c9-a697-40af-b4fc-71d2a32b6f32@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-rebase
head:   ccc2db4d79624bc274d9879eb76670cad04efeff
commit: e334accc28179d073922768f2deec41758403cf0 [51/57] xfs: support zoned RT devices
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240915/202409150207.qmhcRNcV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409150207.qmhcRNcV-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_zone_gc.c:322 xfs_zone_gc_data_alloc() error: buffer overflow 'data->scratch' 2 <= s32max

vim +322 fs/xfs/xfs_zone_gc.c

e334accc28179d Christoph Hellwig 2024-09-10  291  static struct xfs_zone_gc_data *
e334accc28179d Christoph Hellwig 2024-09-10  292  xfs_zone_gc_data_alloc(
e334accc28179d Christoph Hellwig 2024-09-10  293  	struct xfs_mount	*mp)
e334accc28179d Christoph Hellwig 2024-09-10  294  {
e334accc28179d Christoph Hellwig 2024-09-10  295  	struct xfs_zone_gc_data	*data;
e334accc28179d Christoph Hellwig 2024-09-10  296  	int i;
e334accc28179d Christoph Hellwig 2024-09-10  297  
e334accc28179d Christoph Hellwig 2024-09-10  298  	data = kzalloc(sizeof(*data), GFP_KERNEL);
e334accc28179d Christoph Hellwig 2024-09-10  299  	if (!data)
e334accc28179d Christoph Hellwig 2024-09-10  300  		return NULL;
e334accc28179d Christoph Hellwig 2024-09-10  301  
e334accc28179d Christoph Hellwig 2024-09-10  302  	/*
e334accc28179d Christoph Hellwig 2024-09-10  303  	 * We actually only need a single bio_vec.  It would be nice to have
e334accc28179d Christoph Hellwig 2024-09-10  304  	 * a flag that only allocates the inline bvecs and not the separate
e334accc28179d Christoph Hellwig 2024-09-10  305  	 * bvec pool.
e334accc28179d Christoph Hellwig 2024-09-10  306  	 */
e334accc28179d Christoph Hellwig 2024-09-10  307  	if (bioset_init(&data->bio_set, 4, offsetof(struct xfs_gc_bio, bio),
e334accc28179d Christoph Hellwig 2024-09-10  308  			BIOSET_NEED_BVECS))
e334accc28179d Christoph Hellwig 2024-09-10  309  		goto out_free_data;
e334accc28179d Christoph Hellwig 2024-09-10  310  	for (i = 0; i < XFS_ZONE_GC_NR_SCRATCH; i++) {
e334accc28179d Christoph Hellwig 2024-09-10  311  		data->scratch[i].folio =
e334accc28179d Christoph Hellwig 2024-09-10  312  			folio_alloc(GFP_KERNEL, get_order(XFS_GC_CHUNK_SIZE));
e334accc28179d Christoph Hellwig 2024-09-10  313  		if (!data->scratch[i].folio)
e334accc28179d Christoph Hellwig 2024-09-10  314  			goto out_free_scratch;
e334accc28179d Christoph Hellwig 2024-09-10  315  	}
e334accc28179d Christoph Hellwig 2024-09-10  316  	spin_lock_init(&data->list_lock);
e334accc28179d Christoph Hellwig 2024-09-10  317  	data->mp = mp;
e334accc28179d Christoph Hellwig 2024-09-10  318  	return data;
e334accc28179d Christoph Hellwig 2024-09-10  319  
e334accc28179d Christoph Hellwig 2024-09-10  320  out_free_scratch:
e334accc28179d Christoph Hellwig 2024-09-10  321  	while (--i > 0)

The warning is garbage, but this should be ">= 0" instead of "> 0".

e334accc28179d Christoph Hellwig 2024-09-10 @322  		folio_put(data->scratch[i].folio);
e334accc28179d Christoph Hellwig 2024-09-10  323  	bioset_exit(&data->bio_set);
e334accc28179d Christoph Hellwig 2024-09-10  324  out_free_data:
e334accc28179d Christoph Hellwig 2024-09-10  325  	kfree(data);
e334accc28179d Christoph Hellwig 2024-09-10  326  	return NULL;
e334accc28179d Christoph Hellwig 2024-09-10  327  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

