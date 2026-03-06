Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAC82264A7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 07:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772781868; cv=none; b=j2Ml/1czPulHwOOEEWlawOAqaX8mQ3v2Yic78WC3zbU83lBywHieuoTx2sbT3LqgsY9xel41xlgX548v4nLo6DcQ79Y9mNfTEDurJbPDPEVNNCJaXTwLx3E3TwUsoVkw/sPdJG6dW6JEjc32i2CUkt4/qhSs0yCVpy5uf/eq2qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772781868; c=relaxed/simple;
	bh=xy0d2CWp8k00H5MCo4iuoVbgEJ430v37+oaK5jxtuwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+VkBygsW5eGym7fBuIQu90MeOhRXl7lzvhackZPtxgStfkak5Qa+qOVDedqI4f/xa/72OcJSxj+wXNo5ODErQsN5uV2fz8Z+Ryi1GkzAuSTIYGLaAzT5MjH2i5Nqyb7UfR3YVw5DsXf2NBeqZIKY9HKUXGRocghJGoSWwKXUTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pKMLwdxS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pKMLwdxS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4807068eacbso74364045e9.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 05 Mar 2026 23:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772781865; x=1773386665; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XosiABtFX1f7B/CW19TAehcX0bvOa3LXzhquH++ZON4=;
        b=pKMLwdxSbbT4DVZtqlFOQiL17em8ki9iw2nODo732exF9mrXYkccsek5F4+1+bGfmu
         yifOCYq/+7AQZnfKyNTtxpj2Zrpr9GMoAYek0UFgSXYGU48DM5LsaTqQurEQpE8iC3my
         hxgVyqlXpVMJoRxyNH4f5h5qi9628dFP4UVpHRTfEmxo4axp6EMGa8RxoI1vnT1gPMrU
         /QsKJ9tFOSrmRFcBND28P6dM6VGjCYbezpUDPPCwIClmXBcagb4e5GabtQFpPo+IbQr3
         yZGd9fnclz65CUSDLT28jUBA3hiRAym0EMAC7Ovc5CH7SzLvb+ZEBirDdjd0M6jgUkzs
         sS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781865; x=1773386665;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XosiABtFX1f7B/CW19TAehcX0bvOa3LXzhquH++ZON4=;
        b=pCINNWP2v+4AYM015SDaMMS9uSr6oiH46/xh+ooKHx3Ccgavckt3W8SVgmuDQVZrAN
         YPj9DKNUijYRwv2+jo0Ay6a3tlo5XmlWn0aXToM7Znwpal/i1pq7Rp4FYLZBk6tShdtC
         Bkuw013XNowMy1W0mtqyRfRUrWTQP7H38og7eZFgMa99rdK5oWkimZnbatbnLk63sCXM
         1fcmpEMORucvXXMb/KxgTSmCotzJjpSBm7L0wi/Q6D+RM5fhuT9eXOthEvlfojeasNHr
         Q5ESE+5SKE09MVamXATuX8mmMMk7vhQEQYB05dam/a4GYw86753RA38SkJsR6l62576v
         FoQw==
X-Forwarded-Encrypted: i=1; AJvYcCV9QlrzpHAfBnyWnY52x3XbUaf8UkK7HQuMwYRaepOEf4BU8LwIv+CH7+RnrS1P/IYCR9RvIe3LIaX3awYG@lists.linux.dev
X-Gm-Message-State: AOJu0YxvCxKKMzN2D1EZ5ADtW+oNpFpOIWrIKGy2RgVAKV1zQ4d00u1K
	Yi21f0tALHLmPHI1+IGEFOIl1nn3hsD45SQhrtnhwch7rMhqRjkfiyZ6J7NqvGxT7Eo=
X-Gm-Gg: ATEYQzyIFqfO4eGRrjCOxfFdfbe0LWjgSSUq41/M2qI4nwE6XVMd4c8VKhrHIHUGOel
	asY/zt8KHM11oAdCoy/8JHTvg9pcOS4GgmipR6yUs8yWSoP7L15g+XDFwUhYadkbk9scBsYQXdU
	Bwi8jHJeI4monphJaJkSQdMv9WfHId9htShvWgl8MnDekx0Qon6FwMKBaNtw1Ib6O/7IduSC5iT
	dCH0OR62DOnxmKlB5ZZN2zWuJaKPDmVAVqKkq9Q8IkTW73ww7swY4LlHNaDwoRmouGhkkQ1Z+GR
	/mQqyCZbyMpGPbwFllR/3E66Nk5w0REXSAi8gUQiPS98c/3CKUR3hKRpGNflhVJAVHR/a/jaYZB
	7TKQSzll+89THar/VsWxhPPKn9ufJvgvyUS/aTIGecArP6Wv0/KFOQBF8ka22OnSmUX24SiB7Gq
	tU1j8LB/qiMcFw2sB6JKhNGqtauYIBGvPWNyQrziA=
X-Received: by 2002:a05:600c:45d1:b0:480:6ab1:ed0d with SMTP id 5b1f17b1804b1-4852691d5f0mr15816005e9.9.1772781865058;
        Thu, 05 Mar 2026 23:24:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276bc6bbsm14138885e9.15.2026.03.05.23.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:24:24 -0800 (PST)
Date: Fri, 6 Mar 2026 10:24:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: drivers/net/ethernet/qlogic/qede/qede_fp.c:989 qede_tpa_end() error:
 testing array offset 'i' after use.
Message-ID: <202603060852.8GvwVQFk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5ee8dbf54602dc340d6235b1d6aa17c0f283f48c
commit: 896f1a2493b59beb2b5ccdf990503dbb16cb2256 net: qlogic/qede: fix potential out-of-bounds read in qede_tpa_cont() and qede_tpa_end()
config: mips-randconfig-r071-20260306 (https://download.01.org/0day-ci/archive/20260306/202603060852.8GvwVQFk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603060852.8GvwVQFk-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/qlogic/qede/qede_fp.c:989 qede_tpa_end() error: testing array offset 'i' after use.
drivers/net/ethernet/qlogic/qede/qede_fp.c:964 qede_tpa_cont() error: testing array offset 'i' after use.

vim +/i +989 drivers/net/ethernet/qlogic/qede/qede_fp.c

cdda926d409869 Mintz, Yuval   2017-01-01   958  static inline void qede_tpa_cont(struct qede_dev *edev,
cdda926d409869 Mintz, Yuval   2017-01-01   959  				 struct qede_rx_queue *rxq,
cdda926d409869 Mintz, Yuval   2017-01-01   960  				 struct eth_fast_path_rx_tpa_cont_cqe *cqe)
cdda926d409869 Mintz, Yuval   2017-01-01   961  {
cdda926d409869 Mintz, Yuval   2017-01-01   962  	int i;
cdda926d409869 Mintz, Yuval   2017-01-01   963  
896f1a2493b59b Pavel Zhigulin 2025-11-13  @964  	for (i = 0; cqe->len_list[i] && i < ARRAY_SIZE(cqe->len_list); i++)

Flip this around check if "i" is within bounds first before checking if
cqe->len_list[i] is non-zero.

	for (i = 0; i < ARRAY_SIZE(cqe->len_list) && cqe->len_list[i]; i++)

cdda926d409869 Mintz, Yuval   2017-01-01   965  		qede_fill_frag_skb(edev, rxq, cqe->tpa_agg_index,
cdda926d409869 Mintz, Yuval   2017-01-01   966  				   le16_to_cpu(cqe->len_list[i]));
cdda926d409869 Mintz, Yuval   2017-01-01   967  
cdda926d409869 Mintz, Yuval   2017-01-01   968  	if (unlikely(i > 1))
cdda926d409869 Mintz, Yuval   2017-01-01   969  		DP_ERR(edev,
cdda926d409869 Mintz, Yuval   2017-01-01   970  		       "Strange - TPA cont with more than a single len_list entry\n");
cdda926d409869 Mintz, Yuval   2017-01-01   971  }
cdda926d409869 Mintz, Yuval   2017-01-01   972  
10a0176e4e6eb6 Mintz, Yuval   2017-04-07   973  static int qede_tpa_end(struct qede_dev *edev,
cdda926d409869 Mintz, Yuval   2017-01-01   974  			struct qede_fastpath *fp,
cdda926d409869 Mintz, Yuval   2017-01-01   975  			struct eth_fast_path_rx_tpa_end_cqe *cqe)
cdda926d409869 Mintz, Yuval   2017-01-01   976  {
cdda926d409869 Mintz, Yuval   2017-01-01   977  	struct qede_rx_queue *rxq = fp->rxq;
cdda926d409869 Mintz, Yuval   2017-01-01   978  	struct qede_agg_info *tpa_info;
cdda926d409869 Mintz, Yuval   2017-01-01   979  	struct sk_buff *skb;
cdda926d409869 Mintz, Yuval   2017-01-01   980  	int i;
cdda926d409869 Mintz, Yuval   2017-01-01   981  
cdda926d409869 Mintz, Yuval   2017-01-01   982  	tpa_info = &rxq->tpa_info[cqe->tpa_agg_index];
cdda926d409869 Mintz, Yuval   2017-01-01   983  	skb = tpa_info->skb;
cdda926d409869 Mintz, Yuval   2017-01-01   984  
8a8633978b842c Manish Chopra  2018-05-17   985  	if (tpa_info->buffer.page_offset == PAGE_SIZE)
8a8633978b842c Manish Chopra  2018-05-17   986  		dma_unmap_page(rxq->dev, tpa_info->buffer.mapping,
8a8633978b842c Manish Chopra  2018-05-17   987  			       PAGE_SIZE, rxq->data_direction);
8a8633978b842c Manish Chopra  2018-05-17   988  
896f1a2493b59b Pavel Zhigulin 2025-11-13  @989  	for (i = 0; cqe->len_list[i] && i < ARRAY_SIZE(cqe->len_list); i++)

Same.

cdda926d409869 Mintz, Yuval   2017-01-01   990  		qede_fill_frag_skb(edev, rxq, cqe->tpa_agg_index,
cdda926d409869 Mintz, Yuval   2017-01-01   991  				   le16_to_cpu(cqe->len_list[i]));
cdda926d409869 Mintz, Yuval   2017-01-01   992  	if (unlikely(i > 1))
cdda926d409869 Mintz, Yuval   2017-01-01   993  		DP_ERR(edev,
cdda926d409869 Mintz, Yuval   2017-01-01   994  		       "Strange - TPA emd with more than a single len_list entry\n");
cdda926d409869 Mintz, Yuval   2017-01-01   995  
cdda926d409869 Mintz, Yuval   2017-01-01   996  	if (unlikely(tpa_info->state != QEDE_AGG_STATE_START))
cdda926d409869 Mintz, Yuval   2017-01-01   997  		goto err;
cdda926d409869 Mintz, Yuval   2017-01-01   998  
cdda926d409869 Mintz, Yuval   2017-01-01   999  	/* Sanity */
cdda926d409869 Mintz, Yuval   2017-01-01  1000  	if (unlikely(cqe->num_of_bds != tpa_info->frag_id + 1))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

