Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F20515AD9C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 05:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733723459; cv=none; b=JP6/Ni4cREZxKicd5pR8841eCed0XAkNRVxJ/fHToPsPjJgf+DW4eSeMZIg5+j4aLEeweo+Q+6jvbI9SRlXvG7GNPixk6d5XyPSPYSRX9cpD3PzzCrWo+SbW3607OAQWn7sDRhdaFlLrINQGu99c8XZAnZ69magGCgcA2RDwMnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733723459; c=relaxed/simple;
	bh=MviEnYY+yN4NlL5Ybvu7cgCpvIJDFNrAjhE7HsAKz8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r64bbEgppBfeR6kn0/kw1Ea5tMdf2k9TUMgFsU1OdQ54aNfLBEk2/R38xmwxNP7ANp1HppG70x4d484L3FtiHvWArxmdumXy3rc26N7CRt+1qH6Qu/57iHdxS3+NOEmoMPW/ZVVPCWkN7Kajf7VYMwpqeYgJVlHHQnLmvdPVVxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YJAGM2uz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YJAGM2uz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434fe0a8cceso273675e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 08 Dec 2024 21:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733723455; x=1734328255; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=34kuMtFF1sUeZLabUgIRjLsTCdR/lMtQjrJoQQn6+wc=;
        b=YJAGM2uzqt7RT741bGtJBRM37m3td5+J09oHoOQONmrflMSOetHQXmM63n02hN8W9a
         DEhZFXpYIhGToBnIYWoWpncgtOnjvw3fqYuSv16ggLdbpB2t26PULj8UnCTYuC5yeg7T
         +VaKdRb6pLgBWiuJIbCq/+ekbgsHNe6+CW9Qo5k47DgecrdUoUt/qdjO142SovW6uP5q
         INQU3Z9xIoUtAtCeW3wP2OCnpGXhQbOyRAYd6d76RPovo1vRjYD35VP6q7PiWH6g/74J
         g1lNGllKQFAvs1x3LCCzmP9ZdXKxerXKBaUaG8KhAY6dmzr+OLSiQvm5ku3RYQBiHn+l
         xxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733723455; x=1734328255;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34kuMtFF1sUeZLabUgIRjLsTCdR/lMtQjrJoQQn6+wc=;
        b=o1KzpXckS9Y0P9OFAaGPcFEZ1bpBFqcl8s+wot9V+TNkAyhHshbQG2iZaAcZXWWGRf
         NMuhTr29wOgZDUSmpv31MkjhRfVPhooaRjUo9hFgnysEQdXjfPBzTVYNHliYyXxH63hQ
         4wamN846z0p/ieovGeUNZ91dx5jUZwKDS8+xp7nH8hNfqNNqvMgqP/vvOiJB79Et4zpO
         Fspc6a4cqlsiVgZS1pfS6NkrvBIeSxhT5kZZtH987AauY2YsrTfvd21K0fLyPKq9e26P
         0lVltUFEXMoMHpzg9rVP8Jpjfv+eyPppp+mz4rQ8uKfJDOHm7nDjUCR//ggWENYw3N5E
         yc9A==
X-Forwarded-Encrypted: i=1; AJvYcCXm8CfxMdI/CGWe3wYLt73NnynczuVlFeL9Hl+Q0q+usVVTmEnOb1Y4kNbKYkoxnvJ3+nGtUi4VE27QfS3j@lists.linux.dev
X-Gm-Message-State: AOJu0YyT63Kj5pMNjSzfHdPDOTgUIzgY485vNmEEC3D/2hLwbtboeIkJ
	hRof9bCAGpx1hWV0hdWKbU2J3oyNh/x+Osy0IzyXHXkDS6+LDALqwbnD/ZWrEKs=
X-Gm-Gg: ASbGncsoRjlvryHK87YXTTwd8/gZfgjB6ccU3EEQS46a9CgRwhjhzgknJ/hr5NM8yOp
	WrwzuhVDPi/gYWNtE9N4BGJlNyAFPEJDFWWcNcl7kcuAGlrAJOQqRO3pX3nZ+puh687SYLd9VQ+
	rGZv2kBbKiBJamBsSZE0kjteTctSicMkjPy9D9eUGHmfslKC7i4MufQ/tyYPkVnCC1r9EEMKk8p
	eAQRnacbkwOrlnP/7nmWUAKQyTmmgrfo95oOOqKoeuUNtd2ox8wYQQ=
X-Google-Smtp-Source: AGHT+IFLydXe9P5ouMDMbpX+VeEQbmBrKpmOflmaHL4GIGHpH96FEk93rDRJfKrGEEdnAUJfQ10o0A==
X-Received: by 2002:a05:600c:4f84:b0:434:a04d:166f with SMTP id 5b1f17b1804b1-434dde4dd11mr102110715e9.0.1733723455408;
        Sun, 08 Dec 2024 21:50:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f95bd258sm22788045e9.14.2024.12.08.21.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 21:50:54 -0800 (PST)
Date: Mon, 9 Dec 2024 08:50:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ranjan Kumar <ranjan.kumar@broadcom.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sumit Saxena <sumit.saxena@broadcom.com>
Subject: [linux-next:pending-fixes 350/550]
 drivers/scsi/mpi3mr/mpi3mr_app.c:2834 mpi3mr_bsg_process_mpt_cmds() warn:
 inconsistent returns '&mrioc->bsg_cmds.mutex'.
Message-ID: <a3a72581-8e19-4322-90df-dce744db701d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   2152e8397622d3783e947ca02ff62d94bc5b8f9e
commit: 367ac16e5ff2dcd6b7f00a8f94e6ba98875cb397 [350/550] scsi: mpi3mr: Synchronize access to ioctl data buffer
config: i386-randconfig-141-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071034.OF3x0CTb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412071034.OF3x0CTb-lkp@intel.com/

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_app.c:2834 mpi3mr_bsg_process_mpt_cmds() warn: inconsistent returns '&mrioc->bsg_cmds.mutex'.

vim +2834 drivers/scsi/mpi3mr/mpi3mr_app.c

fb231d7deffb41 Chandrakanth patil   2023-12-06  2298  static long mpi3mr_bsg_process_mpt_cmds(struct bsg_job *job)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2299  {
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2300  	long rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2301  	struct mpi3mr_ioc *mrioc = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2302  	u8 *mpi_req = NULL, *sense_buff_k = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2303  	u8 mpi_msg_size = 0;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2304  	struct mpi3mr_bsg_packet *bsg_req = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2305  	struct mpi3mr_bsg_mptcmd *karg;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2306  	struct mpi3mr_buf_entry *buf_entries = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2307  	struct mpi3mr_buf_map *drv_bufs = NULL, *drv_buf_iter = NULL;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2308  	u8 count, bufcnt = 0, is_rmcb = 0, is_rmrb = 0;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2309  	u8 din_cnt = 0, dout_cnt = 0;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2310  	u8 invalid_be = 0, erb_offset = 0xFF, mpirep_offset = 0xFF;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2311  	u8 block_io = 0, nvme_fmt = 0, resp_code = 0;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2312  	struct mpi3_request_header *mpi_header = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2313  	struct mpi3_status_reply_descriptor *status_desc;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2314  	struct mpi3_scsi_task_mgmt_request *tm_req;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2315  	u32 erbsz = MPI3MR_SENSE_BUF_SZ, tmplen;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2316  	u16 dev_handle;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2317  	struct mpi3mr_tgt_dev *tgtdev;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2318  	struct mpi3mr_stgt_priv_data *stgt_priv = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2319  	struct mpi3mr_bsg_in_reply_buf *bsg_reply_buf = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2320  	u32 din_size = 0, dout_size = 0;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2321  	u8 *din_buf = NULL, *dout_buf = NULL;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2322  	u8 *sgl_iter = NULL, *sgl_din_iter = NULL, *sgl_dout_iter = NULL;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2323  	u16 rmc_size  = 0, desc_count = 0;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2324  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2325  	bsg_req = job->request;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2326  	karg = (struct mpi3mr_bsg_mptcmd *)&bsg_req->cmd.mptcmd;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2327  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2328  	mrioc = mpi3mr_bsg_verify_adapter(karg->mrioc_id);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2329  	if (!mrioc)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2330  		return -ENODEV;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2331  
367ac16e5ff2dc Ranjan Kumar         2024-11-11  2332  	if (mutex_lock_interruptible(&mrioc->bsg_cmds.mutex))
367ac16e5ff2dc Ranjan Kumar         2024-11-11  2333  		return -ERESTARTSYS;
367ac16e5ff2dc Ranjan Kumar         2024-11-11  2334  
367ac16e5ff2dc Ranjan Kumar         2024-11-11  2335  	if (mrioc->bsg_cmds.state & MPI3MR_CMD_PENDING) {
367ac16e5ff2dc Ranjan Kumar         2024-11-11  2336  		dprint_bsg_err(mrioc, "%s: command is in use\n", __func__);
367ac16e5ff2dc Ranjan Kumar         2024-11-11  2337  		mutex_unlock(&mrioc->bsg_cmds.mutex);
367ac16e5ff2dc Ranjan Kumar         2024-11-11  2338  		return -EAGAIN;
367ac16e5ff2dc Ranjan Kumar         2024-11-11  2339  	}
367ac16e5ff2dc Ranjan Kumar         2024-11-11  2340  
fb231d7deffb41 Chandrakanth patil   2023-12-06  2341  	if (!mrioc->ioctl_sges_allocated) {
fb231d7deffb41 Chandrakanth patil   2023-12-06  2342  		dprint_bsg_err(mrioc, "%s: DMA memory was not allocated\n",
fb231d7deffb41 Chandrakanth patil   2023-12-06  2343  			       __func__);

mutex_unlock(&mrioc->bsg_cmds.mutex) before returning

fb231d7deffb41 Chandrakanth patil   2023-12-06  2344  		return -ENOMEM;
fb231d7deffb41 Chandrakanth patil   2023-12-06  2345  	}
fb231d7deffb41 Chandrakanth patil   2023-12-06  2346  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2347  	if (karg->timeout < MPI3MR_APP_DEFAULT_TIMEOUT)
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2348  		karg->timeout = MPI3MR_APP_DEFAULT_TIMEOUT;
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2349  
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2350  	mpi_req = kzalloc(MPI3MR_ADMIN_REQ_FRAME_SZ, GFP_KERNEL);
367ac16e5ff2dc Ranjan Kumar         2024-11-11  2351  	if (!mpi_req) {
367ac16e5ff2dc Ranjan Kumar         2024-11-11  2352  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena         2022-04-29  2353  		return -ENOMEM;
367ac16e5ff2dc Ranjan Kumar         2024-11-11  2354  	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

