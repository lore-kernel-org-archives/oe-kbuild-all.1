Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884E2D0625
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594686; cv=none; b=N60Oou4wR2BNohJSB8z3Ypvq8LxjQzgwBk1/G4DHsLCSYQdIslPA4Lzg9BKqTdaeRsq0jMGCDWKjOOW5eST633gNYVdHjKnNg3ymgKf9WDjWhPheKdJN6MIrGTnUvA183FdcJ4Tfq42LogJEchSb0fEJKCqB2FvoCNVbd5Yx4HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594686; c=relaxed/simple;
	bh=QVHDx3xcJSQGTsDOEtdfsXiKIHjbhDUL6hp1jm7lH8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RyIzO2SKZt4u4qXU1P++vCGZEPZlp4zMlNiiCA54e8BZTdRBZvIoc6txuwCQmLJQW1f55/j5c0uZ0NxO29qNtJ8EtqMqwqKojIqyxrl0vQdzCCfW3cbv/gw6Yczwt9HY3RADM8y0GsqerMtvaXnnPzW2yqUef6S/GqDrP/8dgVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xt5EskVA; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xt5EskVA"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so63976765e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 02:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769594683; x=1770199483; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mtm8B2T7S1qUauc/6qoIpJTX7nj6fC+BOV/5dGgx6bA=;
        b=Xt5EskVAhCGJzhsnUmUQLvG2cjqpOmlCWQcM4Stl4IFTM6xYJhZT4llPJmgCDqI9na
         Q0u8xraCRrrEa8j2nlFIs3/81zyNVuoh3bcGxXSVmqQFc+y8MB99MZTnbRSUZ4HIc8Uy
         t9LJjYxjVIbI+rvF3Lo/Kj8FrKGoe2JtecyTqirP7HYuADx/bWA3V2hg1szjyv+2Im4G
         tTxmBWppdBN2HITPvbbz7VQPDhV2X0rDFZZjPNPNhi/TUWKhTvap/i+yEbZ+hC1eZo4i
         v5UpLgUomDr1Sgh2bm2nOnj5RPlvDhQZUJsZ4UJfA4FUKn5ef6eeeQBlvc7cqjlM6wz4
         DPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594683; x=1770199483;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtm8B2T7S1qUauc/6qoIpJTX7nj6fC+BOV/5dGgx6bA=;
        b=aX5Rkb8HItbg7L0vORtH3ZGKS1FciEOlcIvvu479kqPRdkT6D68ZE2Nv3gcnSbvBg8
         w/HgmAXgQgQAQRnlBUJMJxX0G09V1wMUR+lNLjCF2Qwjt/YGhp1GJCcEmuBNAppalnCF
         OyuIprOvyI9i9e0gUnpC34K8Te9/qIwUaPjDt1God27hIjpXAAHTcf8ea46YW48cubWy
         z+31P6GJEYRDJ4MPlzhd1o21ovUYnIm49GQ9o1v9unTLrdpHtS9KnGU82wnytjM4eaNG
         bDd6baCu6KoOnpcQGwBxxNQfR36kpVADv6HXlTrPCC1VzXIIangK6AWpbEBdH9KK1Pxg
         2piw==
X-Forwarded-Encrypted: i=1; AJvYcCVVc688A1Xjl3FBcxF1L5Zk660vEJsI9l4jR7WO4MmZAT/+Ab/3rH4zdNsuLq8ZkRurkrhQ6NBXutYH+GMi@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5v2b9Siw53XgqOHgyx8fauNOoW/Xopt4b1e85qkPcEQbabJKi
	nro8EbedNUB0KhmpEGMwG9FXSmRMdHSuhmAZhCRVJXpHvyHDVA46sdgJduxRQ4wnRvo=
X-Gm-Gg: AZuq6aK6ROXAIMnnGAgnEGLlVn/49JyzAyMVSThcAPJaz01lyxZtHjoMxbiUCHylNFh
	ZEuhHJ14ekSDcSRRDZ11zpjjeBVJKUj9qCTvDgjCdjHSvLRws7z0BYOOk6rdd02ePh16dEpfo8U
	6pYmJA9pFnMTNmBslCBawMeWPOB6hhF60gW337yLHCxDddQjMWu9gMeG2YEYu5B6yFBh+2b1sSM
	Hmo+EE4qWXDLmo5puCQNTIj8rAV7YPMdgxWPy+lAXf+02+x67fu0GhPIZ4sbTwZj0f44oOKXIyV
	nka1T5iv+3OKgF7RWZcsO2Toqp9TIDSYEFCbG2m0Sjv14t2XiXa6yMAOZ8TgG6THZeSn1VnRtgp
	lTZCikX5YBaPX6qcaPSLQxCLZSkbtSo014biHP8x5bya/sMdD8cJWrNvczYHt3yjiHo7bZtXn6x
	yXiJKFhncIOesyjOlu
X-Received: by 2002:a05:600c:450b:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-48069c0fd5amr64474885e9.6.1769594682963;
        Wed, 28 Jan 2026 02:04:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806e2df1aesm2898375e9.16.2026.01.28.02.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 02:04:42 -0800 (PST)
Date: Wed, 28 Jan 2026 13:04:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [linux-next:master 7732/9539]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161
 dpu_hw_sspp_setup_pe_config_v13() warn: variable dereferenced before check
 'ctx' (see line 159)
Message-ID: <202601252214.oEaY3UZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: 688c7734002a1ee6f50a28ba9bd7aa380edbe12d [7732/9539] drm/msm/dpu: Add Kaanapali SSPP sub-block support
config: mips-randconfig-r071-20260125 (https://download.01.org/0day-ci/archive/20260125/202601252214.oEaY3UZM-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13() warn: variable dereferenced before check 'ctx' (see line 159)

vim +/ctx +161 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c

688c7734002a1e Yuanjie Yang 2026-01-15  152  static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
688c7734002a1e Yuanjie Yang 2026-01-15  153  					    struct dpu_hw_pixel_ext *pe_ext)
688c7734002a1e Yuanjie Yang 2026-01-15  154  {
688c7734002a1e Yuanjie Yang 2026-01-15  155  	struct dpu_hw_blk_reg_map *c;
688c7734002a1e Yuanjie Yang 2026-01-15  156  	u8 color;
688c7734002a1e Yuanjie Yang 2026-01-15  157  	u32 lr_pe[4], tb_pe[4];
688c7734002a1e Yuanjie Yang 2026-01-15  158  	const u32 bytemask = 0xff;
688c7734002a1e Yuanjie Yang 2026-01-15 @159  	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
                                                             ^^^^^
Dereference

688c7734002a1e Yuanjie Yang 2026-01-15  160  
688c7734002a1e Yuanjie Yang 2026-01-15 @161  	if (!ctx || !pe_ext)
                                                     ^^^
NULL check is too late.

688c7734002a1e Yuanjie Yang 2026-01-15  162  		return;
688c7734002a1e Yuanjie Yang 2026-01-15  163  
688c7734002a1e Yuanjie Yang 2026-01-15  164  	c = &ctx->hw;
688c7734002a1e Yuanjie Yang 2026-01-15  165  	/* program SW pixel extension override for all pipes*/
688c7734002a1e Yuanjie Yang 2026-01-15  166  	for (color = 0; color < DPU_MAX_PLANES; color++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

