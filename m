Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0889F30E0F1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 10:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756722429; cv=none; b=M6I4B/7rmFR2RUNVZivlUNTHBqqnpUFfD/bxJAWuBL3Q0nI3wTfdfC+DNlSepe8mPxRiiMvwOTGXIUKNZhGGLxnxMboiMRd6/HjdVxgWHBZvbXa8VfOr1emZjUVhspgoDaxDUDgBJ+SWovklsFcl4DdNDIorMhe79aF4rq85L0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756722429; c=relaxed/simple;
	bh=6h/YI/Py/XlG4xBbZJ7thzV4uG9Z0BsZDM3FqQjDBdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BGXQ1jUOkqrJyC12C3u4f1zJohYOU8X/ym2oTOP/mZRzeytNgVy75DCqsR49m/XR3cNVaxcz0nldCuRmnaURHv6bJx3MjHBmV/ZqAGHETJ2/V30lisCdkisgbtiaGom+NNPD12DkZVRav5uJksGKCdEfe2BxLHMD8zpbx7SeUzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AzsDycdw; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AzsDycdw"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ceb9c3d98cso1827833f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Sep 2025 03:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756722425; x=1757327225; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3wMAXUg6TcQMtXg5Lgxugiws7d3wfWBJLDrvyAva+k=;
        b=AzsDycdwnxdOueuZOxw7TMJPm14R27Thq9gTMoS9VW8naxp+QyPnt8ktFkJjzkWudI
         tBgVqEQjRS3nYFYfReoDep0kreFxz1sGGanZvRARhfWxL4Av1MPmsuHxx5AJ+MZ8p5fS
         UZeYQysmhqltDGCmopG8gbdZUYSxzMTJ4IFeMPG//AZ5enHa6lSVBFm/lRMfl2WAdA6k
         9LnkrfUn7TG1vhvMXl8OrTaXS1gojgKNoYMzBUFCdGfGu79nDmBkuxmX+dt0vOFzpEoI
         XeFERvAAISZDaTDOHE/RcrYO/DKwQqLGJZpAv9nV3JOYYBWOTadfaO8L/F+bQ13QEWP1
         m5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756722425; x=1757327225;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3wMAXUg6TcQMtXg5Lgxugiws7d3wfWBJLDrvyAva+k=;
        b=Ici/nyn5CRA8/4bXt81aQ7ubtuiysXdhkYerGENArF022mGmJZXZTwz/g/CiG2B3Kk
         tsq2MlcSzmQNU4UjinjkCgDRe0qnmr3EtuAFD/xs+bCRU1ZcsRFVmv+7zfpjS27uvePr
         2qJowvvWHEEsClH0rlHfGYHHJX2wfYIozSHx+0i5X8kNX52EhUH+ug8v6hxY0IHeWWUv
         AD40HGlvrveqe2o+ECy8zlfT/jCVMtQWWOK0gVQHnWl+arolGLM46TQHeOYYO+0q6zaU
         y4EN6yqAwb0SL8esp1m4JtrP8loa61+Mw8ofU3ik6Rd6GznWiWHUwNiCy1o4rc3LzmYo
         6tZA==
X-Forwarded-Encrypted: i=1; AJvYcCUY6JhrrNUs3mKLGgg+9N57A5Y0SabMOeLDNV6Vlzu1+KuLdg9peA34FEYckZMErc0E4dEsjhkhHvBula8D@lists.linux.dev
X-Gm-Message-State: AOJu0YxK9q8mgV3QUipJrG5ZaYP4RRZZCcooOrOovs3HW4FhIjjVA9tD
	+QIrUSZJ8x0rJdZiU468lYbH00JWaGgqrdkE7qFXLeicrTiFYbPo2vas1fjaCOufCM4=
X-Gm-Gg: ASbGncsiLv07RT5U/XENeYJW1Lkx7hU64H7tpICHQLF40Fi4d9zb3TzyMOCtfZljc7n
	5ECNikEjQAW2CYxED2j2pmuw+nolKdS3qNnxqvs7Q/3I56FjnaFkX1OZfNGxWEP+ybSO7/W9d3d
	Kpr9DDuxXTtMmLhdMBD9qrqFU4k1O1/zl+EbDaBAWrJ9RqNS5nUPj05KMpc8ZvdqE0zPjIhmq4/
	JL6JFscJVBDGHuoiCsH7A6/KmMmhPgZC34y+XE7WiQf7oP6/ZHu2pqpPkCfSbjAsg0uDq7prJZP
	IzW/FBln86aUfN9J81m+qSXWeyLrk992TBLfS9BagxFxL+oOJWPt3p+dfikfMFfDeBTjcNgS4lQ
	uPayEdT6dGVbx7haxKdBU4zMinI1ES9Wxh2UxHg==
X-Google-Smtp-Source: AGHT+IE2RqWOouUNKF0LuMwYDv8VNEg+V4AVmzf6zsck7npghoz21h/jWKBn3nN0q+raGVTCFFwHxQ==
X-Received: by 2002:a05:6000:2510:b0:3d7:7def:8435 with SMTP id ffacd0b85a97d-3d77def8d9dmr1055874f8f.18.1756722425227;
        Mon, 01 Sep 2025 03:27:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf34493b8csm14441165f8f.59.2025.09.01.03.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 03:27:04 -0700 (PDT)
Date: Mon, 1 Sep 2025 13:27:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jisheng Zhang <jszhang@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/14] dmaengine: dma350: Alloc command[] from dma pool
Message-ID: <202508291556.kjNumYgR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823154009.25992-11-jszhang@kernel.org>

Hi Jisheng,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/dmaengine-dma350-Fix-CH_CTRL_USESRCTRIGIN-definition/20250824-000425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250823154009.25992-11-jszhang%40kernel.org
patch subject: [PATCH 10/14] dmaengine: dma350: Alloc command[] from dma pool
config: arm-randconfig-r073-20250829 (https://download.01.org/0day-ci/archive/20250829/202508291556.kjNumYgR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508291556.kjNumYgR-lkp@intel.com/

smatch warnings:
drivers/dma/arm-dma350.c:387 d350_get_residue() error: uninitialized symbol 'sgcur'.

vim +/sgcur +387 drivers/dma/arm-dma350.c

5d099706449d54 Robin Murphy  2025-03-12  360  static u32 d350_get_residue(struct d350_chan *dch)
5d099706449d54 Robin Murphy  2025-03-12  361  {
eae79fde2ff50c Jisheng Zhang 2025-08-23  362  	u32 res, xsize, xsizehi, linkaddr, linkaddrhi, hi_new;
eae79fde2ff50c Jisheng Zhang 2025-08-23  363  	int i, sgcur, retries = 3; /* 1st time unlucky, 2nd improbable, 3rd just broken */
eae79fde2ff50c Jisheng Zhang 2025-08-23  364  	struct d350_desc *desc = dch->desc;
5d099706449d54 Robin Murphy  2025-03-12  365  
5d099706449d54 Robin Murphy  2025-03-12  366  	hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
5d099706449d54 Robin Murphy  2025-03-12  367  	do {
5d099706449d54 Robin Murphy  2025-03-12  368  		xsizehi = hi_new;
5d099706449d54 Robin Murphy  2025-03-12  369  		xsize = readl_relaxed(dch->base + CH_XSIZE);
5d099706449d54 Robin Murphy  2025-03-12  370  		hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
5d099706449d54 Robin Murphy  2025-03-12  371  	} while (xsizehi != hi_new && --retries);
5d099706449d54 Robin Murphy  2025-03-12  372  
eae79fde2ff50c Jisheng Zhang 2025-08-23  373  	hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
eae79fde2ff50c Jisheng Zhang 2025-08-23  374  	do {
eae79fde2ff50c Jisheng Zhang 2025-08-23  375  		linkaddrhi = hi_new;
eae79fde2ff50c Jisheng Zhang 2025-08-23  376  		linkaddr = readl_relaxed(dch->base + CH_LINKADDR);
eae79fde2ff50c Jisheng Zhang 2025-08-23  377  		hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
eae79fde2ff50c Jisheng Zhang 2025-08-23  378  	} while (linkaddrhi != hi_new && --retries);
eae79fde2ff50c Jisheng Zhang 2025-08-23  379  
eae79fde2ff50c Jisheng Zhang 2025-08-23  380  	for (i = 0; i < desc->sglen; i++) {
eae79fde2ff50c Jisheng Zhang 2025-08-23  381  		if (desc->sg[i].phys == (((u64)linkaddrhi << 32) | (linkaddr & ~CH_LINKADDR_EN)))
eae79fde2ff50c Jisheng Zhang 2025-08-23  382  			sgcur = i;

I'm suprised there isn't a break statement after this assignment.
What if we exit the loop with i == desc->sglen?

eae79fde2ff50c Jisheng Zhang 2025-08-23  383  	}
eae79fde2ff50c Jisheng Zhang 2025-08-23  384  
5d099706449d54 Robin Murphy  2025-03-12  385  	res = FIELD_GET(CH_XY_DES, xsize);
5d099706449d54 Robin Murphy  2025-03-12  386  	res |= FIELD_GET(CH_XY_DES, xsizehi) << 16;
eae79fde2ff50c Jisheng Zhang 2025-08-23 @387  	res <<= desc->sg[sgcur].tsz;
                                                                 ^^^^^
Uninitialized.

eae79fde2ff50c Jisheng Zhang 2025-08-23  388  
eae79fde2ff50c Jisheng Zhang 2025-08-23  389  	for (i = sgcur + 1; i < desc->sglen; i++)
eae79fde2ff50c Jisheng Zhang 2025-08-23  390  		res += (((u32)desc->sg[i].xsizehi << 16 | desc->sg[i].xsize) << desc->sg[i].tsz);
5d099706449d54 Robin Murphy  2025-03-12  391  
eae79fde2ff50c Jisheng Zhang 2025-08-23  392  	return res;
5d099706449d54 Robin Murphy  2025-03-12  393  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

