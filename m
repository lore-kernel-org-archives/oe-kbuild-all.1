Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65446130A73
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756106792; cv=none; b=BDcyegec1UCM5YYS+2iQ0RXRkcXUt9x+O+1IRIhZNR9G1HBzExgncUAkYl9QVFX7C1wqBT/IejzEJlgtSFYSoK/KcxC25dc6mn58YMw+J9FVFBl1Xom373SNw0hChYUuxLDo4vU0Xg7/Gy4h4WTkWm5NGM5RE1DGxb7Rv5SN4qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756106792; c=relaxed/simple;
	bh=XcfUHZbpminC1LjKkK7GBwQm3RDpQBVIen2tXQ3GtPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HvbgbwMnphKXe3m15V9e/u2zbk0ukmcTwJ7bIukbicMEKLH5TcfIm+ZSe+fcT/RGHAoU47mqezVLruNPVfcu1QaMQi8ccMYACXlf51nJonFiTos9TLgxgEaDlLmVT7hYKjl8sShJ4tzaDZUq2CbNSwiSk+bmQDTjY3xypwgHKN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bc7FhKWX; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bc7FhKWX"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3c7edd71bbfso1479817f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756106789; x=1756711589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YXW4WXdZbpuVMj+45X2QEx8cTs8sv2KAIiv17RXifaI=;
        b=bc7FhKWXwEHIieef3kFe3QU4Sim8F8W70wwY4gLvT9BTDR5PNvqBBUZLMFpbkBMKf/
         UXCZJB9ntuMPKt1tC1lDoIQF/AvLsbsdTw0M5i/qNCS6JzZICvf7e7SLAUYD+VCoipX1
         1oVWY9NrJuHraafBDs2yLoOJpOGqB4N0TGiQvaQ+0t6daqoYzh/0vMiSirFHpYj5WH+R
         1r466B9vw0MzUhdrltsgxWJ7FPFWeB124q7anHaz47m2c8lmj/uad5DwzhSMYXP1Wwes
         w9sbOj7YE3DzEvI6pHmhinW7RvZtrm9jW7AowRA200INZ09a4PNVMfbJ2KddrOgITmSM
         Kx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756106789; x=1756711589;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXW4WXdZbpuVMj+45X2QEx8cTs8sv2KAIiv17RXifaI=;
        b=jzU5Y2bi70wJ5Pma4UpLgaOoxQVVGjVZi6GCXE290ndjPhtoGKXcYhwbhYKx06Ge5C
         65Ru0vqVWlfMJ6l5HSJ9YOPjg6fXWXZXvX+knPRYtohvQ4VFDejO6yJcntjpTXjWp0qm
         JT7huUhnQvD+jJFu5k9A1SL+wU3+HfauxH6fizSt2JOVAFN4zlI0MTKXJ5AS8wbCVEJk
         foBwP5L3UOZ7bKK1P+1JQKZJ0/dEv+E/ek0SuTlMcOBrFPMk/EcxkkKps8AxIkBeCL36
         qdA0yecKxeff0zwId/AOK4qR0RAzwbjcD1622XHk+ypnagCPrSrtTKDBbJwBHXyZ2V2H
         HF9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWOrd5CyQ5D3yHxp7Ly+lo2j0RIh5x8qvL/SGo9m8wZeDLzYfm7nl47jw3m/0NoCdm8xYoCjurFyw6m/cT@lists.linux.dev
X-Gm-Message-State: AOJu0YynXT4JnM4D0zF+5UeVHfZuo+SH3KE3m7vOTdK9Da/OhMCEUUVc
	cBM2yE1aXLPcwBcu6lGob0NzW5sxF7nh8vEgAoCAFToKu816CQresS8x21YuBKdyMGM=
X-Gm-Gg: ASbGnctpN+hhgGX6GkrNXHgd0QC6hwnoaqPnt/4p90cZZLGAKJfiR0xxqjWxwB2SvwL
	BS/kKvCPctQ9yRfLHHGg/wyPqrh6isJGKbDvvdNIo1rYCkAYIbbMMWCm37IhBkkFxczj2WKSSWa
	AbsOc6pso5psl8HpnwsQh3iV1FsaaJ8dkomI5aDKOG9JDewzAYM/fgRETZ1c0pZ0yA2+U4hiUfK
	wyCb/e77sfjEO2NDPSCpG8BZ031JaXUdqKPrRd+t08WoFmSrb7jZkgNFEQt/BqPlAsyfeKt43wF
	GKYuTywZnt9K43PSSQkkP/lUffb1OJZ7xqoKtgmlTUTFEDqROUkkFOF8HAuHjUaxON6cOAgoQ11
	FMrisjXP3xAGLZqNnmEZC9bXw6kQ=
X-Google-Smtp-Source: AGHT+IHr3tXyCt5Yvc6g17pBN46i+4YotNdNbVGbK4q48niWSb9xQKqdHzzLOgg+Scq9+9QVsNBEzw==
X-Received: by 2002:a05:6000:24c7:b0:3c8:1df2:540c with SMTP id ffacd0b85a97d-3c81df25723mr3798109f8f.43.1756106788624;
        Mon, 25 Aug 2025 00:26:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c7116e1478sm10327401f8f.46.2025.08.25.00.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 00:26:28 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:26:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
	jfalempe@redhat.com, airlied@redhat.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 6/6] drm/ast: Put AST_DRAM_ constants into enum
 ast_dram_layout
Message-ID: <202508240748.TUAvbluX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822132846.25376-7-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-ast-Do-not-print-DRAM-info/20250822-213333
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250822132846.25376-7-tzimmermann%40suse.de
patch subject: [PATCH 6/6] drm/ast: Put AST_DRAM_ constants into enum ast_dram_layout
config: i386-randconfig-141-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240748.TUAvbluX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508240748.TUAvbluX-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ast/ast_2100.c:63 ast_2100_get_dram_layout_p2a() error: uninitialized symbol 'dram_layout'.

vim +/dram_layout +63 drivers/gpu/drm/ast/ast_2100.c

334d62edac4c5b Thomas Zimmermann 2025-08-22  38  static enum ast_dram_layout ast_2100_get_dram_layout_p2a(struct ast_device *ast)
b59465efc7cb88 Thomas Zimmermann 2025-08-22  39  {
b59465efc7cb88 Thomas Zimmermann 2025-08-22  40  	u32 mcr_cfg;
334d62edac4c5b Thomas Zimmermann 2025-08-22  41  	enum ast_dram_layout dram_layout;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  42  
b59465efc7cb88 Thomas Zimmermann 2025-08-22  43  	ast_write32(ast, 0xf004, 0x1e6e0000);
b59465efc7cb88 Thomas Zimmermann 2025-08-22  44  	ast_write32(ast, 0xf000, 0x1);
b59465efc7cb88 Thomas Zimmermann 2025-08-22  45  	mcr_cfg = ast_read32(ast, 0x10004);
b59465efc7cb88 Thomas Zimmermann 2025-08-22  46  
b59465efc7cb88 Thomas Zimmermann 2025-08-22  47  	switch (mcr_cfg & 0x0c) {
b59465efc7cb88 Thomas Zimmermann 2025-08-22  48  	case 0:
b59465efc7cb88 Thomas Zimmermann 2025-08-22  49  	case 4:
334d62edac4c5b Thomas Zimmermann 2025-08-22  50  		dram_layout = AST_DRAM_512Mx16;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  51  		break;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  52  	case 8:
b59465efc7cb88 Thomas Zimmermann 2025-08-22  53  		if (mcr_cfg & 0x40)
334d62edac4c5b Thomas Zimmermann 2025-08-22  54  			dram_layout = AST_DRAM_1Gx16;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  55  		else
334d62edac4c5b Thomas Zimmermann 2025-08-22  56  			dram_layout = AST_DRAM_512Mx32;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  57  		break;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  58  	case 0xc:
334d62edac4c5b Thomas Zimmermann 2025-08-22  59  		dram_layout = AST_DRAM_1Gx32;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  60  		break;

Should there be a default case?

b59465efc7cb88 Thomas Zimmermann 2025-08-22  61  	}
b59465efc7cb88 Thomas Zimmermann 2025-08-22  62  
334d62edac4c5b Thomas Zimmermann 2025-08-22 @63  	return dram_layout;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  64  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

