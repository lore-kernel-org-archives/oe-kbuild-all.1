Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03AA2857C1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 12:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767614982; cv=none; b=Ikb0BHheDDra/C8ckfCdzgX3qgVJ0sTqedOlskhZqBxXtotXq7b7cdwBFeVT/a5KbOO5h4VtszSor7m127ZIvOh2m48f28dnXzMJUAZY+JoWTNIRxLus86GIHw7kfZjPa/m/J71qo8qWBbOb+MzJ9YtI2qbQrJ2H5JJ7k5XkFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767614982; c=relaxed/simple;
	bh=wg3o1nLtlRINrYKTEcNMmJe5FajNDpqcXq4zyKDjNbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HAl5spsSeawbMShaauqeUiLwVxEoJynaH6Oe0IIVq8B1L3lkWB/3pt6A1POkQFBKHf5/6gbq8umiO9xDI5Dbk48mymyTZMxr5xkAvE3MJHCNix6kDLHsn/qZrvnr5ZUu8+kl1eMR0QlKCRtyElNApNOszfqPGiaEGUmFJ9RR/0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UoaaL6hp; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UoaaL6hp"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so70086005e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jan 2026 04:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767614976; x=1768219776; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JlcVXJ0cVi1nZHZmHKHk4Wk8YLQnuU8zMU/lz6fsauM=;
        b=UoaaL6hp5EH+/kHoz9jO4e7pqYUKEfiFKMCPZZ9BcZ9JAcpMCC5rSUmDx2bfJKVaMO
         ndABphrKQp/jJ0eqAhTxv17mZcBiVTfG3/gv7yku/c0mj/7F+qIYS1f/Q7FutHJg18o6
         5cD4QnMLQOBkgrXGRSq9gS3mck2FPE9sXTcQVGELWhyoV6ezxWp7KynYp4jdhpAZ1Lfo
         /KFn4ZpX6jkiqrIoHQ2o7kJvevjAVTyy0PzKe9Cfuo9rtCK8RrYaWFsHa/WgTM1lutog
         lRuclpwRcW8/5sIvPfTE8RRFBNJdHTAqdFzQ5WjcyGnfg8VajyHQdpApKyHQvLNE7fS/
         YFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614976; x=1768219776;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlcVXJ0cVi1nZHZmHKHk4Wk8YLQnuU8zMU/lz6fsauM=;
        b=AYwwWX1nqkewGmtA5qCfqnRjWcXlwtUqTUwNJ4pnKcF4/9KRjX8czrfijF7NFV+PsY
         AsSxDwlBr21kaJMk3LwBhq/X71lRYB3Up+j/mH8+H3kHhcTz3eZ3Dw5gpXDtVZPFD5RI
         EIo3mrtkxF8GIucadJryCon4X7mXIQIaNmYVumZNQ02TebolvVUaprJjqDGfRymWRTDu
         1cQW04bZSMuRnfNly6ELUtCXlG0K3rr+yhyCu3ixAdN3Hvb4NbzFOy4cM+ZIoPXfyPDA
         6vAGzNXLtLrFxHRBx8EUA+R6dtrO6ySrys0Tp6DuzuEt1vyMyFNI4Rf6zAmBsVqMWX/n
         ftCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzEKz3XfeTO/SGr5pZpsb0lCpf+HEjl7aL3BPSRpk35iiOTwUmeFUwUlTzmeNOd+loSJz4McSieMK0/NzJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwZEFAcgHy6TiSGlD83QMrXtgjo6uPRaWEca8UhOneoGfgBmjIO
	DsHRNp2hlQHrPFkBeQWxS4CRBDn2jxiOvu7h9P0dBH/zTX5Arm8VzNLNmzSxs8b9S+I=
X-Gm-Gg: AY/fxX6IC8vJ8O0/WQCm6sBUD2iOk2jwaHfyhxUmxKQm3f/LpZqUJwhXNX+4yzkAxac
	yFIBOMKVmm6utUVAD2NBa0RMDumNypgvtoyGiFKnHf82NsywwEzXmOpkBGmjJ2u4oxt6JAHob6D
	HuJDj5kFP5LFv9ixKQH6aLafsOdaA9b8H3xaq3CO7YPXLX0laxd3/+J5RxllNNpIEn70BvqrBA7
	rm1Fc7WArrCxMmJlj5e1Jl8AfRr642sxGfq8VwUVz9y5D2Tqwa9QZq8h316eyNPfGTNMCPGvTfK
	461Ag3kBHFCFtcLKb2jy92TEnCrZfqsL7qXhQaX34vUAkIOwfaSTGwzNMI6tgLIfSNz5k+Hj1xE
	EyVLgxqk30puiFpPJrU6dVnvH4/fIEFrH2qsSgc6oSQHzqBPn6UO4DmD+15Nc3NoNjRTg6pqS5S
	fxh/VDrbqiDyLJoCAS
X-Google-Smtp-Source: AGHT+IErbINclqwTphcC2ONopTe3/T1YNMW8InuHlmUfWLIx70UpQzUsOc7R9zmrY9fYanNexcLPkA==
X-Received: by 2002:a05:600c:5251:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-47d195a425bmr612432525e9.34.1767614975626;
        Mon, 05 Jan 2026 04:09:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452a3bsm146951515e9.11.2026.01.05.04.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:09:35 -0800 (PST)
Date: Mon, 5 Jan 2026 15:09:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Siva Reddy Kallam <siva.kallam@broadcom.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
	Usman Ansari <usman.ansari@broadcom.com>
Subject: drivers/infiniband/hw/bng_re/bng_dev.c:113 bng_re_net_ring_free()
 warn: variable dereferenced before check 'rdev' (see line 107)
Message-ID: <202601010413.sWadrQel-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c8ebd433459bcbf068682b09544e830acd7ed222
commit: 4f830cd8d7fe3e98fc12d25f347ed461e11fc1de RDMA/bng_re: Add infrastructure for enabling Firmware channel
config: s390-randconfig-r073-20251231 (https://download.01.org/0day-ci/archive/20260101/202601010413.sWadrQel-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601010413.sWadrQel-lkp@intel.com/

smatch warnings:
drivers/infiniband/hw/bng_re/bng_dev.c:113 bng_re_net_ring_free() warn: variable dereferenced before check 'rdev' (see line 107)
drivers/infiniband/hw/bng_re/bng_dev.c:270 bng_re_dev_init() warn: missing unwind goto?

vim +/rdev +113 drivers/infiniband/hw/bng_re/bng_dev.c

4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  104  static int bng_re_net_ring_free(struct bng_re_dev *rdev,
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  105  				u16 fw_ring_id, int type)
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  106  {
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17 @107  	struct bnge_auxr_dev *aux_dev = rdev->aux_dev;
                                                                                        ^^^^^^^^^^^^^
Unchecked dereference.

4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  108  	struct hwrm_ring_free_input req = {};
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  109  	struct hwrm_ring_free_output resp;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  110  	struct bnge_fw_msg fw_msg = {};
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  111  	int rc = -EINVAL;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  112  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17 @113  	if (!rdev)

Hopefully this NULL check can be deleted.

4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  114  		return rc;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  115  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  116  	if (!aux_dev)
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  117  		return rc;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  118  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  119  	bng_re_init_hwrm_hdr((void *)&req, HWRM_RING_FREE);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  120  	req.ring_type = type;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  121  	req.ring_id = cpu_to_le16(fw_ring_id);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  122  	bng_re_fill_fw_msg(&fw_msg, (void *)&req, sizeof(req), (void *)&resp,
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  123  			    sizeof(resp), BNGE_DFLT_HWRM_CMD_TIMEOUT);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  124  	rc = bnge_send_msg(aux_dev, &fw_msg);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  125  	if (rc)
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  126  		ibdev_err(&rdev->ibdev, "Failed to free HW ring:%d :%#x",
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  127  			  req.ring_id, rc);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  128  	return rc;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  129  }

[ snip ]

745065770c2dc9 Siva Reddy Kallam 2025-11-17  217  static int bng_re_dev_init(struct bng_re_dev *rdev)
745065770c2dc9 Siva Reddy Kallam 2025-11-17  218  {
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  219  	struct bng_re_ring_attr rattr = {};
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  220  	struct bng_re_creq_ctx *creq;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  221  	u32 db_offt;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  222  	int vid;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  223  	u8 type;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  224  	int rc;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  225  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  226  	/* Registered a new RoCE device instance to netdev */
745065770c2dc9 Siva Reddy Kallam 2025-11-17  227  	rc = bng_re_register_netdev(rdev);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  228  	if (rc) {
745065770c2dc9 Siva Reddy Kallam 2025-11-17  229  		ibdev_err(&rdev->ibdev,
745065770c2dc9 Siva Reddy Kallam 2025-11-17  230  				"Failed to register with netedev: %#x\n", rc);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  231  		return -EINVAL;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  232  	}
745065770c2dc9 Siva Reddy Kallam 2025-11-17  233  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  234  	set_bit(BNG_RE_FLAG_NETDEV_REGISTERED, &rdev->flags);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  235  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  236  	if (rdev->aux_dev->auxr_info->msix_requested < BNG_RE_MIN_MSIX) {
745065770c2dc9 Siva Reddy Kallam 2025-11-17  237  		ibdev_err(&rdev->ibdev,
745065770c2dc9 Siva Reddy Kallam 2025-11-17  238  			  "RoCE requires minimum 2 MSI-X vectors, but only %d reserved\n",
745065770c2dc9 Siva Reddy Kallam 2025-11-17  239  			  rdev->aux_dev->auxr_info->msix_requested);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  240  		bnge_unregister_dev(rdev->aux_dev);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  241  		clear_bit(BNG_RE_FLAG_NETDEV_REGISTERED, &rdev->flags);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  242  		return -EINVAL;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  243  	}
745065770c2dc9 Siva Reddy Kallam 2025-11-17  244  	ibdev_dbg(&rdev->ibdev, "Got %d MSI-X vectors\n",
745065770c2dc9 Siva Reddy Kallam 2025-11-17  245  		  rdev->aux_dev->auxr_info->msix_requested);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  246  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  247  	rc = bng_re_setup_chip_ctx(rdev);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  248  	if (rc) {
745065770c2dc9 Siva Reddy Kallam 2025-11-17  249  		bnge_unregister_dev(rdev->aux_dev);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  250  		clear_bit(BNG_RE_FLAG_NETDEV_REGISTERED, &rdev->flags);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  251  		ibdev_err(&rdev->ibdev, "Failed to get chip context\n");
745065770c2dc9 Siva Reddy Kallam 2025-11-17  252  		return -EINVAL;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  253  	}
745065770c2dc9 Siva Reddy Kallam 2025-11-17  254  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  255  	bng_re_query_hwrm_version(rdev);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  256  
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  257  	rc = bng_re_alloc_fw_channel(&rdev->bng_res, &rdev->rcfw);
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  258  	if (rc) {
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  259  		ibdev_err(&rdev->ibdev,
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  260  			  "Failed to allocate RCFW Channel: %#x\n", rc);
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  261  		goto fail;

Why a goto here and not before or after?

745065770c2dc9 Siva Reddy Kallam 2025-11-17  262  	}
745065770c2dc9 Siva Reddy Kallam 2025-11-17  263  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  264  	/* Allocate nq record memory */
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  265  	rdev->nqr = kzalloc(sizeof(*rdev->nqr), GFP_KERNEL);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  266  	if (!rdev->nqr) {
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  267  		bng_re_destroy_chip_ctx(rdev);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  268  		bnge_unregister_dev(rdev->aux_dev);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  269  		clear_bit(BNG_RE_FLAG_NETDEV_REGISTERED, &rdev->flags);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17 @270  		return -ENOMEM;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  271  	}
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  272  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  273  	rdev->nqr->num_msix = rdev->aux_dev->auxr_info->msix_requested;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  274  	memcpy(rdev->nqr->msix_entries, rdev->aux_dev->msix_info,
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  275  	       sizeof(struct bnge_msix_info) * rdev->nqr->num_msix);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  276  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  277  	type = RING_ALLOC_REQ_RING_TYPE_NQ;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  278  	creq = &rdev->rcfw.creq;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  279  	rattr.dma_arr = creq->hwq.pbl[BNG_PBL_LVL_0].pg_map_arr;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  280  	rattr.pages = creq->hwq.pbl[creq->hwq.level].pg_count;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  281  	rattr.type = type;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  282  	rattr.mode = RING_ALLOC_REQ_INT_MODE_MSIX;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  283  	rattr.depth = BNG_FW_CREQE_MAX_CNT - 1;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  284  	rattr.lrid = rdev->nqr->msix_entries[BNG_RE_CREQ_NQ_IDX].ring_idx;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  285  	rc = bng_re_net_ring_alloc(rdev, &rattr, &creq->ring_id);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  286  	if (rc) {
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  287  		ibdev_err(&rdev->ibdev, "Failed to allocate CREQ: %#x\n", rc);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  288  		goto free_rcfw;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  289  	}
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  290  	db_offt = rdev->nqr->msix_entries[BNG_RE_CREQ_NQ_IDX].db_offset;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  291  	vid = rdev->nqr->msix_entries[BNG_RE_CREQ_NQ_IDX].vector;
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  292  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  293  	rc = bng_re_enable_fw_channel(&rdev->rcfw,
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  294  					vid, db_offt);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  295  	if (rc) {
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  296  		ibdev_err(&rdev->ibdev, "Failed to enable RCFW channel: %#x\n",
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  297  			  rc);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  298  		goto free_ring;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  299  	}
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  300  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  301  	return 0;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  302  free_ring:
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  303  	bng_re_net_ring_free(rdev, rdev->rcfw.creq.ring_id, type);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  304  free_rcfw:
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  305  	bng_re_free_rcfw_channel(&rdev->rcfw);
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  306  fail:
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  307  	bng_re_dev_uninit(rdev);
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  308  	return rc;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  309  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

