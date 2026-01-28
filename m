Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABAE350D51
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599753; cv=none; b=ZKJpE05UAh6EovhM/0Vd6rl4ZW1y+DemuiEcD4hA1rsyDdPkEvjdsWPsQ4GRtjTcPdJ4YP5Q4ugTWGjGgdpRQtdnqDMHkxzFa/YL02Ev2OHCxqodyAGXp6e9+dxILCVtPxvVSvfoWktpQ6U7O2Ja+RkL9oDnbWUSFjYf9L7za7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599753; c=relaxed/simple;
	bh=3CLtZ3wk/VMe5xps+/LNBIPD8iqcEdzqblKOKs3ukL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WF0MSuUs44VOvGwzkTjAe6Xqv4Wfu3Qp3oeQ9IQGj/qItLRDOapO9kzFl/WTdvNarsJ0dTNzGjwJfDPYorl2W+kkQjvm155OX3GFYDYCU2h6kuLIy21zpsC+hobbdJRY4Psc4ljSKFLdZwDP+NeG0h+Q7qS+sNR2J4Mzo+8VVE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PS66aF9b; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PS66aF9b"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so8904025e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 03:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769599750; x=1770204550; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wD9cjK4h2ME11R43It4jeF977U8gV/xH4Mn6b8QC/Vc=;
        b=PS66aF9b+fuwhkX/IbK+l9EeLUWuNEvAUeciMD4nxKMpR9mNmZBtG0robS4uGyyNQV
         7QFlk3UExYl6+uxKtNdXrdwkcwSF05kEPsgoElG8/CHQdr38GG41U/nboal+LQWsnByh
         DdP/wyFpvZWCERkhj3CbxJSdZUvvafp8cOYpbYK2JgzWGA5vcCzoTpG7nbBTK7zb7H5v
         xUza0RSgNVTVsrmOTKFiOP87Frn484Bc5E3RJIyvN/KLqY3KrzJ58ebf4DJoVhmH0Z2K
         DzBGBEVEfLfuMPjfUlIIwTdlhFmwpfhO1RLcMVxtvvhLOF28ODdGgxl5KH33dPnSxYv1
         S7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599750; x=1770204550;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wD9cjK4h2ME11R43It4jeF977U8gV/xH4Mn6b8QC/Vc=;
        b=b6n4IUkp4IS+PTLMeXkipI89f68JoBCzWiiBakRtOylqGXl5svwyudOfvdHAJmAdOO
         Xin4mlvMTyA7CTkHur2d/VnNdmKWHzWe2Z9dEp6Jg/7lldjWLCX04IyqezrRp/jumWvR
         cvkudJ8smHcpiBCdTmXfNG6Ggle/AuFrQ0TZZl+HHsTCBKWbQmPMqN4VWUfqxHf4RUYw
         ohEh3XhlZJ+kpqzzGT1VMspfQ/qD/HFzYLzMOq329VjJ5kyx/j5PVxA8fWUZBoH4DKRI
         VNNVWXPn3pKspcpK8LpQtMocvrp9iin+92RGnxvSP11GlyWOldpfkpM8lWHavqdzPFoX
         UcmA==
X-Forwarded-Encrypted: i=1; AJvYcCXCoQFY2J1JMvtMRnEBAF7TiRJdhfdoHiaBOqLFnga6+J05Zxt6nGMwj6b05VFdrL9n1EVE2SfUGZVPsOwj@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7rFQyoQFnnd8Hhy7GdwXhSq9xx/8C3pl2PLs/2rCRId7cYjPZ
	cIX6uaYmehYFqXAuXBvyhAHAVnlXxSE5qiBpy9ooRlTberijutGfKZiKWQvB93iIcuw=
X-Gm-Gg: AZuq6aIzCdmLSDhmmYb2Juh/8vlTPvBtWgpCqy1MNOzlV1ZfD4Dv25n9+WkHIsJDEMe
	UJ39fOvPpr/zEjW8H5daBw4A+6zqQQNdBUJ/u8Swo3Ihmsm31j6ivlbY1WAkGyEdpU4Mc1VttMV
	/FZsi3jlbE/YC2FP6j4DKJcfYGkq3mZ8HJ1M+AoUbiZRgLDcTh8BsC7x+D2RFOenoWFLrTwdFZc
	MRKtGjjh7+HDpqiuvn+2S7ZzVJ2VHSfcI+SQxs8L3MUSLhgJ+xzKFI4CqnWFT9/yBSM6fZfw0GT
	nZKKIMrKHh1B/WRXUMFrs2kxrdpTdy22uIvTqqnqOfdVCOuSMSdyEgHfiNEBTDt3QOmMMeFNatB
	UFucT9KL5dRpEq3NKxmTJtw6EAXvFfhxuSJM28kMBIXy7vbmprKhnNQ3mFNS3iwxZpXBN8NqBjF
	0x55jT3HFf6dh+vf9fmOF7+VIou9E=
X-Received: by 2002:a05:600c:37c8:b0:480:3b26:82c3 with SMTP id 5b1f17b1804b1-48069c5b93amr61350985e9.20.1769599749669;
        Wed, 28 Jan 2026 03:29:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd77b8sm59333515e9.3.2026.01.28.03.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:29:09 -0800 (PST)
Date: Wed, 28 Jan 2026 14:29:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] fs/f2fs/iostat.c:210
 __update_iostat_latency() error: buffer overflow 'io_lat->sum_lat[idx]' 3 <=
 3
Message-ID: <202601272004.HnjloZC4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   8b96c137bec0cc9c414f85dc958b9a5785a0790f
commit: d95bf22a4d1cbeebc288b87af27f0ea181a57218 [1/1] f2fs: introduce periodic iostat io latency traces
config: x86_64-randconfig-161-20260126 (https://download.01.org/0day-ci/archive/20260127/202601272004.HnjloZC4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601272004.HnjloZC4-lkp@intel.com/

New smatch warnings:
fs/f2fs/iostat.c:210 __update_iostat_latency() error: buffer overflow 'io_lat->sum_lat[idx]' 3 <= 3
fs/f2fs/iostat.c:211 __update_iostat_latency() error: buffer overflow 'io_lat->bio_cnt[idx]' 3 <= 3
fs/f2fs/iostat.c:212 __update_iostat_latency() error: buffer overflow 'io_lat->peak_lat[idx]' 3 <= 3

Old smatch warnings:
fs/f2fs/iostat.c:213 __update_iostat_latency() error: buffer overflow 'io_lat->peak_lat[idx]' 3 <= 3

vim +210 fs/f2fs/iostat.c

d95bf22a4d1cbe Daeho Jeong 2021-08-20  183  static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
d95bf22a4d1cbe Daeho Jeong 2021-08-20  184  				int rw, bool is_sync)
d95bf22a4d1cbe Daeho Jeong 2021-08-20  185  {
d95bf22a4d1cbe Daeho Jeong 2021-08-20  186  	unsigned long ts_diff;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  187  	unsigned int iotype = iostat_ctx->type;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  188  	unsigned long flags;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  189  	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  190  	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  191  	int idx;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  192  
d95bf22a4d1cbe Daeho Jeong 2021-08-20  193  	if (!sbi->iostat_enable)
d95bf22a4d1cbe Daeho Jeong 2021-08-20  194  		return;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  195  
d95bf22a4d1cbe Daeho Jeong 2021-08-20  196  	ts_diff = jiffies - iostat_ctx->submit_ts;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  197  	if (iotype >= META_FLUSH)

Should this be NR_PAGE_TYPE?  The check is off by one.

d95bf22a4d1cbe Daeho Jeong 2021-08-20  198  		iotype = META;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  199  
d95bf22a4d1cbe Daeho Jeong 2021-08-20  200  	if (rw == 0) {
d95bf22a4d1cbe Daeho Jeong 2021-08-20  201  		idx = READ_IO;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  202  	} else {
d95bf22a4d1cbe Daeho Jeong 2021-08-20  203  		if (is_sync)
d95bf22a4d1cbe Daeho Jeong 2021-08-20  204  			idx = WRITE_SYNC_IO;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  205  		else
d95bf22a4d1cbe Daeho Jeong 2021-08-20  206  			idx = WRITE_ASYNC_IO;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  207  	}
d95bf22a4d1cbe Daeho Jeong 2021-08-20  208  
d95bf22a4d1cbe Daeho Jeong 2021-08-20  209  	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
d95bf22a4d1cbe Daeho Jeong 2021-08-20 @210  	io_lat->sum_lat[idx][iotype] += ts_diff;


Out of bounds if iotype is NR_PAGE_TYPE.

d95bf22a4d1cbe Daeho Jeong 2021-08-20 @211  	io_lat->bio_cnt[idx][iotype]++;
d95bf22a4d1cbe Daeho Jeong 2021-08-20 @212  	if (ts_diff > io_lat->peak_lat[idx][iotype])
d95bf22a4d1cbe Daeho Jeong 2021-08-20  213  		io_lat->peak_lat[idx][iotype] = ts_diff;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  214  	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
d95bf22a4d1cbe Daeho Jeong 2021-08-20  215  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

