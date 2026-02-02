Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32291EEA5F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770023719; cv=none; b=g9wbzyq/JaOSQnRE7bjen8pM2yaFyWXbLf1aXNf96buYh6mYCjQq0J6eSxMnlgBkobIfc8KBOGa4u0bcLrpkIxKSbBRVhTU44mTDGziv7XKX0xqSTE9uNsVD3V5iXvA4h8iyvd4VnohkPbwmWvs3swKFl+BWadSDo5ne8cqYP0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770023719; c=relaxed/simple;
	bh=oCgXpI2MucJ6uycnjqvDIXXh50gaZ0qQedrWeVNOucs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ruFSsnpL6RZY3rxhTrABzA2M5fsnsVBPi5rnhD3/3LIbsfnawPhrbHytNRgOKWrzeDgZgiSB77Wcj1ExAKmCixhAWhmzc7gUblbkMJWLCNXJv7iI2K+dxnmhj5gMOQWcq03Bd9BjuS2Q/Z/zFdusyd+iF/47cnblkRyVcOfl81o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W26VJwpQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W26VJwpQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so46655775e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 02 Feb 2026 01:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770023716; x=1770628516; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0VxT5WdxL72GGauKTl1EPnUwAVKDysEqE8T8RoyWVZg=;
        b=W26VJwpQq0OhxN8g/Sr8UaTnnTyOWLTlvtiAvwLpAjCE9c9SwvAWQNYaO/xpAHKXsY
         gdezu0pbshIUVL6sthatipIzZl8Jqza5NyT6GBRW3URFYFUHty0iENAqVWUs9vopMd1R
         rvnBmMEdVTMZUCdVmTJW07XL4QkZ+TDgzeEg1oCr/EbcXn7k2moQu3E6ErrGfxxaoye7
         WoZT2d8KleE7YMxFu/KxH957uG1xC9S47qAwskms2kjZbwa0uu9OAsuOXVyZTm361IjU
         EvJBb+g8yfHk4IGwliDskrkVbBZX47Zk5TwpbCkz6U9AseV8lnDlZ4alwWdxfLg7n2mf
         HudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770023716; x=1770628516;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VxT5WdxL72GGauKTl1EPnUwAVKDysEqE8T8RoyWVZg=;
        b=UU4YKNTNfTT1FjeJWU3lzcKINQ55FKND4lNe6Sw/ljvH5CNAUpR270SignkFUFXjAy
         QxMayHSjTO9jpC0gH5POx/CFCcu2gBkiWoqhaxuVmdl6MXaiGyFUP2jgoTUq9TuyYVcI
         byVvM+wmysSvOgiMW3vgfOeyCI+cb1Wp1yJIzlP5qDgmT0uLvknM6iKUMjD6zP6g0cBv
         nvURTQ2oh/IFXH6jO1NjDkuIO2V83kz8ZXB7/D+Q1QQWB7E27HGYbapPg1jL6kNWGTQ1
         PibEZjamDwZ3QWNjpjQXhBM55gF+jGe7Z9BnXxF99Lh9NW2VUQexGwzapvlaDBrMeXje
         BH2g==
X-Forwarded-Encrypted: i=1; AJvYcCV56r37ec9Q+sFcHIrcPX9ftZ/TcOO0a22Dchl0+3ELqprFEy7Z2mtz8ZpWCHPSzDjHBc/al61TpCTSIz0/@lists.linux.dev
X-Gm-Message-State: AOJu0YzdVnJn0cN8cWSrcQidWW3OjNk5i2yaEl2J1btOxZ2PaO5ByLXg
	s3PGrtZnCHmtDxbnzrXHif9xhIuffbzq3TnVfUaVntF7P7fd6Ik29E411lwWN46fBdE=
X-Gm-Gg: AZuq6aKt10xtYtsYq733Cs2L1J8xpUvKoEqGw+s+/6Mnc9i5/jJ9xDDwOxjeMausstA
	tFkGPUAxhMxFT1Mr/UYzWr0JkGxv9q3cATnGkwcehhj1ddWaakBEDpy3j3DwgL5v1sp5CXL8Joc
	kM7usdkeukF0LA0f/Bp3caA+vEJi4r5iar4LK2p+Y+MbU9umH0pr/AYo/wVWBzsDBcS6aiYwYaM
	xAvI8Os1GP1UcYB36/JEGW3HTKdDaA9ovjN8soxNqDUjglcpQ9979EOHHNs/sL08pnCUMHnLFzQ
	SHsAE1cWu+z8G1guWUp093XUnjQLo7KrxR0T82QIsqj+SDxSv+5l9xOCS6+0/zXrl2FUDLGrxH6
	bN34ZGd5jE/zvAlOwt0e1oLH488Ohc5I0hHFiSDUnwLBdA0TTFrKgklVlznwa8SbuSLUux9qiCu
	H3YFQGPONhKkxv8RRP
X-Received: by 2002:a05:600c:474f:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-482db4592e4mr156298125e9.3.1770023715933;
        Mon, 02 Feb 2026 01:15:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd79c7sm399149035e9.2.2026.02.02.01.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:15:15 -0800 (PST)
Date: Mon, 2 Feb 2026 12:15:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Damien Le Moal <dlemoal@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: kernel/trace/blktrace.c:664 blk_trace_setup() error: strcpy()
 'buts2.name' too large for 'buts.name' (64 vs 32)
Message-ID: <202602020718.GUEIRyG9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18f7fcd5e69a04df57b563360b88be72471d6b62
commit: 113cbd62824afdf62d2f3f092809cf37cc7f1dd8 blktrace: pass blk_user_trace2 to setup functions
date:   3 months ago
config: s390-randconfig-r073-20260202 (https://download.01.org/0day-ci/archive/20260202/202602020718.GUEIRyG9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602020718.GUEIRyG9-lkp@intel.com/

smatch warnings:
kernel/trace/blktrace.c:664 blk_trace_setup() error: strcpy() 'buts2.name' too large for 'buts.name' (64 vs 32)

vim +664 kernel/trace/blktrace.c

b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  631  int blk_trace_setup(struct request_queue *q, char *name, dev_t dev,
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  632  		    struct block_device *bdev,
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  633  		    char __user *arg)
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  634  {
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  635  	struct blk_user_trace_setup2 buts2;
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  636  	struct blk_user_trace_setup buts;
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  637  	struct blk_trace *bt;
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  638  	int ret;
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  639  
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  640  	ret = copy_from_user(&buts, arg, sizeof(buts));
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  641  	if (ret)
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  642  		return -EFAULT;
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  643  
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  644  	if (!buts.buf_size || !buts.buf_nr)
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  645  		return -EINVAL;
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  646  
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  647  	buts2 = (struct blk_user_trace_setup2) {
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  648  		.act_mask = buts.act_mask,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  649  		.buf_size = buts.buf_size,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  650  		.buf_nr = buts.buf_nr,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  651  		.start_lba = buts.start_lba,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  652  		.end_lba = buts.end_lba,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  653  		.pid = buts.pid,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  654  	};
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  655  
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  656  	mutex_lock(&q->debugfs_mutex);
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  657  	bt = blk_trace_setup_prepare(q, name, dev, buts.buf_size, buts.buf_nr,
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  658  				     bdev);
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  659  	if (IS_ERR(bt)) {
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  660  		mutex_unlock(&q->debugfs_mutex);
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  661  		return PTR_ERR(bt);
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  662  	}
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  663  	blk_trace_setup_finalize(q, name, 1, bt, &buts2);
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22 @664  	strcpy(buts.name, buts2.name);

BLKTRACE_BDEV_SIZE2 is 64. BLKTRACE_BDEV_SIZE is 32.  The kbuild bot
doesn't have cross function analsys, but in linux-next the callers
only pass BLKTRACE_BDEV_SIZE size strings.

b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  665  	mutex_unlock(&q->debugfs_mutex);
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  666  
9a8c28c8311e30 kernel/trace/blktrace.c Dmitry Monakhov    2010-02-27  667  	if (copy_to_user(arg, &buts, sizeof(buts))) {
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  668  		blk_trace_remove(q);
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  669  		return -EFAULT;
9a8c28c8311e30 kernel/trace/blktrace.c Dmitry Monakhov    2010-02-27  670  	}
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  671  	return 0;
1f2cac107c591c kernel/trace/blktrace.c Jens Axboe         2017-11-05  672  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

