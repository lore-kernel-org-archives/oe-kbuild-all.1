Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E8518DF60
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 22:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738189307; cv=none; b=LDFqeXLKYGJzvFsLba0cj+FgZBLG9Qa75e2huwaBuwp+pITMC7+vYgOH+MULpDoW3eJtiU96opv0TNg9gyGXVFt6j1DC/Vn0qiSPHrJY7iAKBCJ4ImmzW6HNncxKJzsoQ+5rOKMoMMdpyAP5YxVQW+QCEluB/CrxbLxlbvRQrBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738189307; c=relaxed/simple;
	bh=farTO53coIPRLWdA/j5ulwMmgF1hIwZqDCDXvQL/1/0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JyaJqQozcg2wMyDlODVSRscKekk8aD6DA3pcJQzbjzCY1nGaaP0oKh2hXdEZufuuAhr7Wy2XRyd9Gq7a6qtMscPNrImx6tRleI1/4pcH/b/S8JVHcqcgVNiYNKgCZdEvA4dnZ8k2lsakURYI8vW+diecnTA4mcpf4LJkAw56Amc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dznD1oGG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dznD1oGG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43635796b48so618625e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 14:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738189303; x=1738794103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOVDg+y8yqQJG2b6/A3VgQPrw3p5f6ahdRiK7F2y/XY=;
        b=dznD1oGG6TgQYUSzvHehW/Fvaheubr0q759n/V7f6Rj8l2EV2nkCIl22Mwa11nftH4
         hlmhLiMRDF++lSvwXVOw4xv3l1q1gKBiPyillN+9FBjfqbcO9AfsrrgodpoJSy1YbQtl
         H7afyw1N6Yrx3AwW3ID9ZlRmBSLqhw61Ipti5bmmQCsG/1ID7o61J67Vb5737u1Kfe9d
         vXHHa+XlUfkOWaM/OwEC60KUlTvlXnDUUU9VV1+tIuBLO191t/4laJcuoU/nbYnuyOTg
         cdAZy7tA9QY48YurA0j3cG2vaQl+5LYkaw2HAfmbMl2tmk5QJh6Eq2LmFsDzrlZhXMkA
         tn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738189303; x=1738794103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOVDg+y8yqQJG2b6/A3VgQPrw3p5f6ahdRiK7F2y/XY=;
        b=Le146d0y0ZHp55lCQT+ytET/mK/bLpA6c3IR1sYP2d/vI30XyRbNMB0Bnc6aaaOOyZ
         DZczvlLpPDhH9pXfgc4SdmCKVCRz/gcjGn8rrSEiQB9V5V6GJZB7Mk4TBChW7FOO5xSU
         qI5zVcwj0MneodFaVuXUY/entwcHgE9R3yV5KOmTPojYJdJAUT4H6v1EA0hM6v0RmbG3
         4wziSO5VENJmDlaa07M/znPTWOTlYhueFouBgwmXlOt6L0zMTQoCY5/5bTwiNx1X2JxR
         yrh5vAtef9GTCLhDNzE4pbAficU3U5S9ZJrWgmSeamsAK+OiFa53xPX8RCyAE/K7GDz+
         UuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRuWv7QM/UWVBbTAhjNFT6gKeLUTK68x2Lso/sCdXcPDcnsuNCJmwV/sGZ18h2VkaxLBhNR5VtS0qu8lki@lists.linux.dev
X-Gm-Message-State: AOJu0YzDLVVoTvXocPWnUqWz60QGHCvKOyG4IxXLGRD6cN4KCL9JNwFH
	X21lT5H0JvrftCrxRT+GQm/ZZYJmJefR6yUt38RlgaVrZ/IABno6Qu2sMw==
X-Gm-Gg: ASbGnctqJwndWiMR1D89cuV6C1NKLjF7fRSfse7BMh1KjaB8Ji2LjTZovPNssgiexCT
	xi4sXoAd2y2vWxTSn/vBQqPaM11EA2ooyZ0S8Xld2OWn7EHCOPpW6V4Ax2tyMATDhkrsosWuKQg
	8fD7QOdmz8Ja/rBJ0UPiM2HnlWVAHpyADIn+nuHwAuWnSvLopCZ+Hnd1ndYc7/MuEzRSDYW/bYF
	E40842jGqN+VKwFUanT8t0xU6/DMyD+sjtXUEmxJh4Z9Z2jzDoP8vaEq3375vl5CHjFOalNwMzO
	8XSiSEhQ7GGSOpZVKdgHR+AdJh8ZcOV1QCTGW4h61L/2g7LomaR2qA==
X-Google-Smtp-Source: AGHT+IFsn/yWIL1EWmQDx0L2XWxnpx2kTSuDh+vsZ4vDcf0vOrxidiZ+CLBoyvPtTo0M0t1fJefQ1A==
X-Received: by 2002:a05:600c:3b8e:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-438e16fa988mr8268035e9.11.1738189303321;
        Wed, 29 Jan 2025 14:21:43 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438d7b4c4c4sm33826055e9.1.2025.01.29.14.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 14:21:42 -0800 (PST)
Date: Wed, 29 Jan 2025 22:21:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Even Xu <even.xu@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Xinpeng Sun
 <xinpeng.sun@intel.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>
Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38:
 sparse: sparse: dubious: !x | !y
Message-ID: <20250129222141.478c03df@pumpkin>
In-Reply-To: <202501292144.eFDq4ovr-lkp@intel.com>
References: <202501292144.eFDq4ovr-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jan 2025 22:02:59 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> commit: a688404b2e20f00cce6d0a2b888ef4ca9154e144 HID: intel-thc-hid: intel-thc: Add THC DMA interfaces
> date:   3 weeks ago
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250129/202501292144.eFDq4ovr-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501292144.eFDq4ovr-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501292144.eFDq4ovr-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: sparse: sparse: dubious: !x | !y  
>    drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, ...):
>    include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
>    include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
> 
> vim +298 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
...	
>    297		for (i = 0; i < config->prd_tbl_num; i++) {
>  > 298			if (!config->sgls[i] | !config->sgls_nent[i])  
>    299				continue;
...

If zeros are unlikely the bit-wise 'or' is pretty likely to generate better code
than a logical 'or'.

	David

