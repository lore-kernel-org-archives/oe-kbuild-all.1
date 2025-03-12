Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B314F117
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 12:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741781618; cv=none; b=bfBCw64JCNIoZK8X9tPcrvlI4yOx6K5YhlRRF/suz35SzWHWWKhVcnPin4d619p++EKD6zPoyR19wyLpe1LMEji+KSdcWByJMHtf0vONwZdik2w1ilkRAmfgGdlbiSl50A07ZzKTpCg3MCkaDgkSTMxdv54j3VbYATIWpKfRasA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741781618; c=relaxed/simple;
	bh=LDDmEy4JWt4lRRvfekJUGmpuCWM91cRLOxMEcmFeHWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dSw8H19+6CdP8oEgaY4Jf+slst+6WtWZ0aiLNNEctbqYRQ+rglfvLbox2fr9C98jRReI0HKaPhrizKPfhVA8eB/8bvTB94YBtkdw2+sD8fOkfPlo9A6hSwOxwHwPyY5AZBtFAbD5QFlsKSSkCtTk84nAb7kFF2WYB9k9HXCCFIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gFOF7NBP; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gFOF7NBP"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f403edb4eso3606384f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 05:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741781615; x=1742386415; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UunO1TKA1JVm6fqr/6xageFiEYXWOspGofoP+25AegM=;
        b=gFOF7NBPZm7F6Wpjdqsl7QEI7FL3Hp9vGt2tjCr9d1ugptFha0S3I1XYuEU7sQ99zS
         klTBKwZKl6VXjRbDuIRleYKH9Ae6ZIHU9nn7XdC2n5yBeLcF/kDUOXRuhs70O31AuANu
         MCYdHqYwMZM+k9r8BRYbOwC5tymvgbpBl0PqOyGvln1kgF3oQUNzepEqUrza/mdUOWHq
         0yrR0DP/QNhRjGDyw+HlulOstu4vBREkkX18Ev4GxpN175lA1PuTIlPmNEduxQm9CnSD
         nLa3/lKgZwc4kbYJpFHu7ZFw/Ae0DLQlkx1lyl2/Af94TWMSoBM920Tca7a5HUvmGlFh
         9Csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741781615; x=1742386415;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UunO1TKA1JVm6fqr/6xageFiEYXWOspGofoP+25AegM=;
        b=ht3vg6UsZESJ5YdQPZpTJlcwTUDKJl0j37D0Ztqjr2h0OUddUGTQLMO3fhqzcHb7mG
         8vtwF2ivvLFPbPPWYV511ukV8Z6amT+i/AFCxvH14Kn58uA2zvlSOWlhxnSeh98VkKE8
         ZKYwWFRSqFsz9OT694DlDKKaAq3l8UrAhHwNXhEA/dNxgcgwk83KAgUlQo9LI39ovw08
         aT+SLyOepThv73VISGhPWZQpH8IcAeKgbNdstv42OkftBeou//b3aieEopcbkXLonO8Z
         V7bPtClJbnOnTEPncxCLEOSIFFjosO9zeBpZXWV3d3hQntJ7QcBOfQp2mVCIjx9xfA//
         yPNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzeFCOtaQknSUeYpC5ky3l0gk0jcIc7IQZdb0SnE44FAdv8Hdd7pMWxNfBfpzPdivZ9ttt6AP7dVhWay76@lists.linux.dev
X-Gm-Message-State: AOJu0YxXjQRVonFcZ0C/jkYWQTccDRixUwmm0SLacePAis44AUbAKnw6
	0f4hWJoZFphTKVjtfNmQ0Rs/S/E63QJWxsVmkW/9lgdac2FGPyUSE2S6xDky2Zc=
X-Gm-Gg: ASbGncseuXSpyu5ffTYnYUaQW/DUFULca5NDMoa+ruLagkcnaz88Aq9M3fyOihUfxcr
	+ElHPIkJlM2sSzYuo4qvHqUyflHQP3aftPC2Bv7uWq7iYX0gOMfeUJIDEGqVyfmltewY/DZ/KIw
	RxIZX6pQK+OpZn/GYdjJrukz2gB21vNy58A6yxYreoLD8VJZTDxc/7Qgiq2a6AnhJ6+YF48essa
	iOULrZR23j8l+5U7DxMdH1XmCAOugHELtkKlES7cjv6wUh5rDfWw68qKK53EyNmcYH75BOH7qGE
	/lH0okAqAGYbfUdDoPRI5Ro1SHCLVsUdyl2bJ5suDet+jwAEqA==
X-Google-Smtp-Source: AGHT+IF3uJLUjQRNpRxK9+a8Tm/6pvpMPNh5b4EMZn826iGT3YN7zl75T4N1qjZzbaDK149DrMtpwQ==
X-Received: by 2002:adf:a397:0:b0:391:3f4f:a169 with SMTP id ffacd0b85a97d-3913f4fa2d3mr9385827f8f.32.1741781614900;
        Wed, 12 Mar 2025 05:13:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d0a75b324sm19495165e9.24.2025.03.12.05.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:13:34 -0700 (PDT)
Date: Wed, 12 Mar 2025 15:13:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2] fs/btrfs/subpage.c:332
 btrfs_folio_end_lock_bitmap() warn: variable dereferenced before check
 'fs_info' (see line 326)
Message-ID: <6a23c1a6-3358-4084-95d6-be5b3e6a89c7@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   501e3c4dad2caa7d89416bbca980b0b803316a2e
commit: 0138f46fea3f5a250a5f49c33bd6174dec138369 [2/2] btrfs: rename btrfs_folio_(set|start|end)_writer_lock()
config: i386-randconfig-141-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121943.LRPJGfum-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503121943.LRPJGfum-lkp@intel.com/

smatch warnings:
fs/btrfs/subpage.c:332 btrfs_folio_end_lock_bitmap() warn: variable dereferenced before check 'fs_info' (see line 326)

vim +/fs_info +332 fs/btrfs/subpage.c

0138f46fea3f5a2 Qu Wenruo 2024-10-09  322  void btrfs_folio_end_lock_bitmap(const struct btrfs_fs_info *fs_info,
bd610c0937aaf03 Qu Wenruo 2024-09-02  323  				 struct folio *folio, unsigned long bitmap)
bd610c0937aaf03 Qu Wenruo 2024-09-02  324  {
bd610c0937aaf03 Qu Wenruo 2024-09-02  325  	struct btrfs_subpage *subpage = folio_get_private(folio);
bd610c0937aaf03 Qu Wenruo 2024-09-02 @326  	const int start_bit = fs_info->sectors_per_page * btrfs_bitmap_nr_locked;
                                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference

bd610c0937aaf03 Qu Wenruo 2024-09-02  327  	unsigned long flags;
bd610c0937aaf03 Qu Wenruo 2024-09-02  328  	bool last = false;
bd610c0937aaf03 Qu Wenruo 2024-09-02  329  	int cleared = 0;
bd610c0937aaf03 Qu Wenruo 2024-09-02  330  	int bit;
bd610c0937aaf03 Qu Wenruo 2024-09-02  331  
bd610c0937aaf03 Qu Wenruo 2024-09-02 @332  	if (unlikely(!fs_info) || !btrfs_is_subpage(fs_info, folio->mapping)) {
                                                             ^^^^^^^^
Checked too late.

bd610c0937aaf03 Qu Wenruo 2024-09-02  333  		folio_unlock(folio);
bd610c0937aaf03 Qu Wenruo 2024-09-02  334  		return;
bd610c0937aaf03 Qu Wenruo 2024-09-02  335  	}
bd610c0937aaf03 Qu Wenruo 2024-09-02  336  
0138f46fea3f5a2 Qu Wenruo 2024-10-09  337  	if (atomic_read(&subpage->nr_locked) == 0) {
0138f46fea3f5a2 Qu Wenruo 2024-10-09  338  		/* No subpage lock, locked by plain lock_page(). */
bd610c0937aaf03 Qu Wenruo 2024-09-02  339  		folio_unlock(folio);
bd610c0937aaf03 Qu Wenruo 2024-09-02  340  		return;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

