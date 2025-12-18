Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF42932E745
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 07:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766042379; cv=none; b=oFf5CIQU/wQ4ax7uTws6QP1057yYlv9rEy38iTV8LDW2CGmFJRE4L49dvOBNRp4OldtdovG/FNKnF+fQ++qu6rrtcOM1A2I3qMt5QkT19LykGAVgDbrHaN0Gz6qU+zV1HfvvETD2LEkDjeVVO5wc7e8nhGqPD5QH7ovXuFqQgmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766042379; c=relaxed/simple;
	bh=2XAZN4yfY+YxnTEtRiXRky2l9hu9s+c9ZZ5klJhe86k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6Mafdfe4KLYIMaJwfnS0Xb204LAnuK9NX5HdLMQZlAbTt7MRr1WQIZMG8VI8riDmIWNtkiTz+OEX/SOTXlTfia9GA2ciy6svl3V70HHChJunRZUZcGmguYbSt8zLS4NPtHVjYvhCFBSbAvyTmQdrMBx3Bsp/ISNp/4bnAeX1dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=reJouNt5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="reJouNt5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso2491935e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 23:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766042376; x=1766647176; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgDX8RRTzLlxHeg4crYid4bpMw6ddH0fqfjWnakhqlo=;
        b=reJouNt5kFOEiuU3U5M7c6Ngo6LqDUmsGAdauioTF7u1VKvpjEd9pSxKXMrOxivh2R
         GZr+IMTD5wkuekvty9t7TtcEHZaongDrTu4s31yZgQ6Pk/kw7EA/MzG52FSFBzurM0F8
         gJr8Ljo8TumI6gYyKMFrnjr7D73y3PZekrW/YzhsN8tCpa9zlbMAb44pMK30mlqLdNLZ
         43fO8NjY7m8PQEQSFz12kZY3TJFaqmm5ZEOdYQdZ+AhUBGApD194Ap4IMXsL4luCH6vp
         8ASy8AFdDrZOF9PXauoFYaW7mulTJscw3vL0HeNIFTkE7rnm/gwp0zDVyh0DijnDCbUZ
         Vf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766042376; x=1766647176;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BgDX8RRTzLlxHeg4crYid4bpMw6ddH0fqfjWnakhqlo=;
        b=xM8ZBE7FjAqbSnvYiUWIfX2AGVjsSBIEHK3dVchMZ/wvKDr2Y1zFyb2GGDBWyYR/RM
         fAVF4PPQYhlQPu/ctj3vUw6ZwkyiH0ZOKLZR5LtVzLYF7y9pMKsiNuu4KPXkIKrzCu7p
         cVr4UEfsUbdH+0h/IiM5bvqYj7JEkBDo5ckLiHrApa10PjImRb3gtOguZPL5pIiwBfqP
         610wXQH1j9KHC3U1dBpj4iHn2NwN6UefkDkCSPP/VBSRcVkwO0vDEevfPo0v+CQkN1kZ
         mCwvuPLLevsjCMxFzsq2umZtQ05teaVGYii+KdLqYopGAHoe6XW/KBhyT8hr8RCLpBmd
         M8Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVb9R0TqRl9iFXrl3Ul+AQfIWM1yQJgjjVjx6RTIxH7EsNbW8dwj4ZnsE6Un4Yuhq2ydePKfhJ9FZz/cs7a@lists.linux.dev
X-Gm-Message-State: AOJu0YxgciGxAPt/k8WHmYLtivJsxE/sxYjmJBkOiHQwnSDfqqck+3kw
	wfxQyNhXGOQhueGlFbccg/NpEN7uCwNCSQDtnwqqeqljVNkpwyiHEs2/2Zhr5eiqTbo=
X-Gm-Gg: AY/fxX76+rH3ihDK/730uM2Ty52kHfPcdJXfhQJBFqns9NaM7jh0lBY74rpkRGv93u4
	iMz6P9oMNImL0aofVJ1OIQ8995oNWefYajgHo0gGL/QPRaz2uP9FjLKRBMNUvysZewVlGy+hVUI
	a8QfC7SJirUf46amwQc2Sml1V/L+4A7Cz/V0Uaxa1OIAmT2q2MmIUyBxFceRS4j9oUtg+QQU2Hy
	MlUO/V6wk0hs5DsllNf7TEV+WSYG0neVMBdabxKrSVPmv45Ph5L0DfTEDrXIfo6WZYrFlge0F+b
	LLpGylQiwm1RIE052npMq1h1uNMfNNzWxVKe46SxFIbzQmMiVColqplsImy3I6GQr3wp0ZN25g9
	wqNtiusafTw0ITgoAjKftyyXzm02ymjL8o0QkjOw5izUmnLFZsl0zU+PuzeNhFe0TuaqzcVnhXZ
	TC00UaOCdNnxoTFwCo
X-Google-Smtp-Source: AGHT+IGwbf7mQ1WdrnPH46HyySiH44r9KZkX+tyRiOr/VP6+a5FY5gNWMsktIsul821W7jrPcYjxPQ==
X-Received: by 2002:a05:600c:3b84:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-47a8f89babcmr220630665e9.3.1766042375908;
        Wed, 17 Dec 2025 23:19:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3278439sm24779915e9.13.2025.12.17.23.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:19:35 -0800 (PST)
Date: Thu, 18 Dec 2025 10:19:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Herbert Xu <herbert@gondor.apana.org.au>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn: can
 'dev_data' even be NULL?
Message-ID: <202512181322.nBkDZbGb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Herbert,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 35c5097f737a164b3afe23d07698db95061f0db8 crypto: ti - Enable compile testing for dthev2
config: s390-randconfig-r071-20251217 (https://download.01.org/0day-ci/archive/20251218/202512181322.nBkDZbGb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512181322.nBkDZbGb-lkp@intel.com/

smatch warnings:
drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn: can 'dev_data' even be NULL?

vim +/dev_data +44 drivers/crypto/ti/dthev2-common.c

52f641bc63a4665 T Pratham 2025-08-20  35  struct dthe_data *dthe_get_dev(struct dthe_tfm_ctx *ctx)
52f641bc63a4665 T Pratham 2025-08-20  36  {
52f641bc63a4665 T Pratham 2025-08-20  37  	struct dthe_data *dev_data;
52f641bc63a4665 T Pratham 2025-08-20  38  
52f641bc63a4665 T Pratham 2025-08-20  39  	if (ctx->dev_data)
52f641bc63a4665 T Pratham 2025-08-20  40  		return ctx->dev_data;
52f641bc63a4665 T Pratham 2025-08-20  41  
52f641bc63a4665 T Pratham 2025-08-20  42  	spin_lock_bh(&dthe_dev_list.lock);
52f641bc63a4665 T Pratham 2025-08-20  43  	dev_data = list_first_entry(&dthe_dev_list.dev_list, struct dthe_data, list);
52f641bc63a4665 T Pratham 2025-08-20 @44  	if (dev_data)
52f641bc63a4665 T Pratham 2025-08-20  45  		list_move_tail(&dev_data->list, &dthe_dev_list.dev_list);

dev_data can't be NULL.  Probably this should use list_first_entry_or_null()

52f641bc63a4665 T Pratham 2025-08-20  46  	spin_unlock_bh(&dthe_dev_list.lock);
52f641bc63a4665 T Pratham 2025-08-20  47  
52f641bc63a4665 T Pratham 2025-08-20  48  	return dev_data;
52f641bc63a4665 T Pratham 2025-08-20  49  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

