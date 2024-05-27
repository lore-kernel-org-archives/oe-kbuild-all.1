Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90534347C2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716795229; cv=none; b=NmwOI0Ma+oiaf0g+Bn6FjtrdC38ViHXrcFqGhCm/N1su8KihofYOWDvQ4cruvMd9dohj2Dz7Crrk5nM7MUwhX1aJOMVTlxrU16FCA/vz1ncBWaxig42zz0jIXD6GuG4usZneq0qASDZGWVAG0gJ3BKii+7GRP71IWOyE2DjU4kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716795229; c=relaxed/simple;
	bh=sM3waqZi5Py8B5gp9eUebVVgyZLKmHgjZusBG/2sFQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bA+AskRi5oxlkQWtNoQj4xr55s6bvpCEmpggvU8wZSKoHN4pX1mw19HWrShTqzAhKYpA7Cq5F78bz97joXsTvTqWYaETwENzcSf51XflDMnwPgUK+5HNnJNwaXK0k6OXpsETEtGM72u8VNDHQjDanFdexebPAz62abtZ5OSDdho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mGgb3mx7; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mGgb3mx7"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5755fafa5a7so10514482a12.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 00:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716795226; x=1717400026; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szq8chx5gDw7g2BArhFvSKwjo2xRRP2jZ+0BsRsUTS4=;
        b=mGgb3mx7m2+0gLflJ4tE+1KkN6QagBmZtZRU3MGX5d9H5vVHUaP88iAII82fqCTzCi
         ZWCERwOGmi8bx4siklC/QMFfWhDo8zu0tOr0L5FcTysy1Y4yaGbwKqtiNP2pJU6G/4ZW
         PzSEYkCD/kMkTs8/cJ/jgVGkm3OcTa254LHC4uaXpK8bUIG2JGOWeJNcKljNWxpCXIHq
         OsyAnM70sz/UoL9la7a+1G+mfItDFNB7IEh8HSW9zUWqas7WzHOncB99987bsfpik548
         9oJB2hKOryxbRChZCG8IOwNlUIwDwOsADXakQMq9D8q+gbi3K3AUTlllxKSH1G3GEFWG
         rujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716795226; x=1717400026;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szq8chx5gDw7g2BArhFvSKwjo2xRRP2jZ+0BsRsUTS4=;
        b=d6Irn79ME5Ikz6LgrtHiBiuqK5ls4w5gNQu3E8eekwBE6fPyAGMagRmWmp8Ye8H7Lx
         nP5QKZ/JhK4VTXR0oCNXh9BKuCabmL9P8C6hgmCzIv3SqGRcFT/Qi8bFPM1JViq81AS+
         X2f2Vme5/MZr8d010cYYBxCr1Bd8LyY7QLv1Jk0r/0LnIssIrE6DxP3NxV0CwsAZFD2o
         0KfXFD0TtJzom5bUvn+WGKuOPVzSesv6v92/RMSMqRND5Ro9e7tIgyo+hN7k8jRjyjdr
         hQKPxCV1Bt9A6jhF0REvHGT1qJKREN5ieNUjKv96QRUHD/G0a//hzkdQ27KNjCKlNPV7
         APcA==
X-Forwarded-Encrypted: i=1; AJvYcCX4J9ekqDdT8thrCRX/nfjC5K0PyWWwq5MT40Ypu/EuisDkEZUF5T0xWYbwvJunN21ruE6cSwzgDu3uNz03JohJIy/AgUgfa+suHRVWkQ==
X-Gm-Message-State: AOJu0Yw1TFHJ4RO9YOxotO+ShmIbfAgqQXh0uco2Zn9pchrdFP1dJjjD
	CytcdKQrk5GyQLwZgt0cwcAk34AXJXCvd61yfOn5wjEab5MZj19Lh+z6YrVoLMA=
X-Google-Smtp-Source: AGHT+IH+90KDj7wUtUPGfkFPzREA2Ne+OCwWNFgFXaN8yooMX2efgf6yPt1bDl2sO5lsktUrLUoK0g==
X-Received: by 2002:a17:906:59a2:b0:a62:a530:32aa with SMTP id a640c23a62f3a-a62a53038ddmr333019166b.19.1716795225701;
        Mon, 27 May 2024 00:33:45 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8b9b7sm459717666b.151.2024.05.27.00.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 00:33:45 -0700 (PDT)
Date: Mon, 27 May 2024 10:33:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-msg_ring 5/6] io_uring/msg_ring.c:133
 io_msg_fill_remote() error: uninitialized symbol 'ocqe'.
Message-ID: <6e45c650-2bd5-4b09-9157-19d0a0fe3b53@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-msg_ring
head:   558d3cfd371df365ab388a0cc86b410a6e2d305c
commit: fb2eeb0dbfa4112219f87a805ddaa15967dc57c6 [5/6] io_uring/msg_ring: add an alloc cache for CQE entries
config: i386-randconfig-141-20240526 (https://download.01.org/0day-ci/archive/20240526/202405261421.LEU6xUnr-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405261421.LEU6xUnr-lkp@intel.com/

New smatch warnings:
io_uring/msg_ring.c:133 io_msg_fill_remote() error: uninitialized symbol 'ocqe'.
io_uring/msg_ring.c:142 io_msg_fill_remote() warn: inconsistent returns '&target_ctx->uring_lock'.
io_uring/msg_ring.c:265 io_msg_install_remote() warn: inconsistent returns '&target_ctx->uring_lock'.

vim +/ocqe +133 io_uring/msg_ring.c

6d043ee1164ca3 Pavel Begunkov    2022-12-07  126  
1d04718b61b885 Jens Axboe        2024-05-24  127  static int io_msg_fill_remote(struct io_msg *msg, unsigned int issue_flags,
1d04718b61b885 Jens Axboe        2024-05-24  128  			      struct io_ring_ctx *target_ctx, u32 flags)
1d04718b61b885 Jens Axboe        2024-05-24  129  {
1d04718b61b885 Jens Axboe        2024-05-24  130  	struct io_overflow_cqe *ocqe;
1d04718b61b885 Jens Axboe        2024-05-24  131  
1d04718b61b885 Jens Axboe        2024-05-24  132  	if (unlikely(io_double_lock_ctx(target_ctx, issue_flags))) {
1d04718b61b885 Jens Axboe        2024-05-24 @133  		kfree(ocqe);
                                                                      ^^^^
Heh.

1d04718b61b885 Jens Axboe        2024-05-24  134  		return -EAGAIN;
1d04718b61b885 Jens Axboe        2024-05-24  135  	}
1d04718b61b885 Jens Axboe        2024-05-24  136  
fb2eeb0dbfa411 Jens Axboe        2024-05-25  137  	ocqe = io_alloc_overflow(target_ctx);
fb2eeb0dbfa411 Jens Axboe        2024-05-25  138  	if (!ocqe)
fb2eeb0dbfa411 Jens Axboe        2024-05-25  139  		return -ENOMEM;

Drop the lock before returning?

fb2eeb0dbfa411 Jens Axboe        2024-05-25  140  
1d04718b61b885 Jens Axboe        2024-05-24  141  	io_msg_add_overflow(msg, target_ctx, ocqe, msg->len, flags);
1d04718b61b885 Jens Axboe        2024-05-24 @142  	return 0;
6d043ee1164ca3 Pavel Begunkov    2022-12-07  143  }

[ snip ]

37501cb5c8a5bc Jens Axboe        2024-05-24  237  static int io_msg_install_remote(struct io_msg *msg, unsigned int issue_flags,
37501cb5c8a5bc Jens Axboe        2024-05-24  238  				 struct io_ring_ctx *target_ctx)
6d043ee1164ca3 Pavel Begunkov    2022-12-07  239  {
37501cb5c8a5bc Jens Axboe        2024-05-24  240  	bool skip_cqe = msg->flags & IORING_MSG_RING_CQE_SKIP;
37501cb5c8a5bc Jens Axboe        2024-05-24  241  	struct io_overflow_cqe *ocqe;
37501cb5c8a5bc Jens Axboe        2024-05-24  242  	int ret;
6d043ee1164ca3 Pavel Begunkov    2022-12-07  243  
fb2eeb0dbfa411 Jens Axboe        2024-05-25  244  	if (unlikely(io_double_lock_ctx(target_ctx, issue_flags))) {
fb2eeb0dbfa411 Jens Axboe        2024-05-25  245  		kfree(ocqe);
                                                                ^^^^^^^^^^^

fb2eeb0dbfa411 Jens Axboe        2024-05-25  246  		return -EAGAIN;
fb2eeb0dbfa411 Jens Axboe        2024-05-25  247  	}
fb2eeb0dbfa411 Jens Axboe        2024-05-25  248  
37501cb5c8a5bc Jens Axboe        2024-05-24  249  	if (!skip_cqe) {
37501cb5c8a5bc Jens Axboe        2024-05-24  250  		ocqe = io_alloc_overflow(target_ctx);
37501cb5c8a5bc Jens Axboe        2024-05-24  251  		if (!ocqe)
37501cb5c8a5bc Jens Axboe        2024-05-24  252  			return -ENOMEM;

Drop the lock?

37501cb5c8a5bc Jens Axboe        2024-05-24  253  	}
37501cb5c8a5bc Jens Axboe        2024-05-24  254  
37501cb5c8a5bc Jens Axboe        2024-05-24  255  	ret = __io_fixed_fd_install(target_ctx, msg->src_file, msg->dst_fd);
37501cb5c8a5bc Jens Axboe        2024-05-24  256  	if (ret >= 0) {
37501cb5c8a5bc Jens Axboe        2024-05-24  257  		msg->src_file = NULL;
37501cb5c8a5bc Jens Axboe        2024-05-24  258  		if (!skip_cqe) {
37501cb5c8a5bc Jens Axboe        2024-05-24  259  			io_msg_add_overflow(msg, target_ctx, ocqe, ret, 0);
37501cb5c8a5bc Jens Axboe        2024-05-24  260  			return 0;
37501cb5c8a5bc Jens Axboe        2024-05-24  261  		}
37501cb5c8a5bc Jens Axboe        2024-05-24  262  	}
37501cb5c8a5bc Jens Axboe        2024-05-24  263  	mutex_unlock(&target_ctx->uring_lock);
37501cb5c8a5bc Jens Axboe        2024-05-24  264  	kfree(ocqe);
                                                        ^^^^^^^^^^^^
ocqe uninitilaized on skip_cqe path.


37501cb5c8a5bc Jens Axboe        2024-05-24 @265  	return ret;
6d043ee1164ca3 Pavel Begunkov    2022-12-07  266  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

