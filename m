Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EED133F8BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 12:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134899; cv=none; b=dQ4n5Q1hFkjqZ0Q3JJEfOT0mvxZ3Eth5r9rELCvX037Vn9DngDswpmv8Nl3IoQ6i8NGKZVow7lHIiTbWHJHXJQluaXVOVzXyWiWumu9RlFhFtV6v+v27RMmdM2Nd60dxPmay0CE1lx0gYj7lU1saQLgaduPatWAmOQEO8RgnHqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134899; c=relaxed/simple;
	bh=tZhHNi5tiOiq5ZyFScnnqPfCNqj/bQHHe9aIYrpZW4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iO7g0fFRhJX71vgZKduVpRTBkBWelLnwdTnxLJbRGvfac3veRXLLSkMlwGM65NwARbJqtHLSgXLRywKkSvVghHdva+rGR3ol1TymWIy0vEn4NqzlHnVbPQNWhNkkMkLGXcHakXzdOgb3f4H5GBGiSXiQVc0R7Qql/UshrO9kMp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mYEZ1uBB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mYEZ1uBB"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42706c3b7cfso2332831f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 05:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761134895; x=1761739695; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DvbnSMIYk5HD128ctAAfLOD94aj1lQC5qodcVPOSef8=;
        b=mYEZ1uBB4TTssHTgAhMKw7oMhJ7NPFtTy81iSrr7I30f2b035EHgd9Kq3DQoeSONk6
         6pE7O9kQaO/vANCSdthYvl767nNLOCSjFJM4eNuJARpIgz6VsCd2deYdUjjRt4MtQI13
         Be8jMHy6+A1W7EYs5p9NPQ/ZUQwp+U1P69pvMedJVxBKgyVJEU8I+14JTbKo6+6VXxvL
         vWtkp+/1EOIEY/toVZ9a3wucfL4sbW7YqgR+mp6BHpqdh8yR1XAljwOG50oSDINS2rxC
         uP0aN43hw6VyqmtUF4Mp+8AjwuaSYegrWYMLBKXwzkVswytXfruCZWsMQYVF/ymlWJ85
         N0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134895; x=1761739695;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvbnSMIYk5HD128ctAAfLOD94aj1lQC5qodcVPOSef8=;
        b=TGhIh2monTxK4F8gqQohuge44/XCOKIDT2NGtFp46KOUxAmG2jCbNwDXV+0v9l2dBC
         Zzhj3UPzsiUafzNOBX7xEwjF1/KVgZ1aiH/dK2105pS69YQrn7ielYqR3NwvePK8DlNz
         W65znV43H51mW/yxBz4gSAKMn/O9pm4lRZgxPgrQuhc62fbUERfgT/SEbFVr+5cY+YPM
         QKfBYz7MG+rdt+uverzu3chkfViW3+R+BwO++ayptNreFCX7Per4m9Dju7byy0Q0jOMx
         puc9g+DBvMnK2c9M5cTKD/Vd0o/OxwEEDfMUiBQA/sNOyGzndaaZZ1AEAQzffHO5S03v
         5g+w==
X-Forwarded-Encrypted: i=1; AJvYcCVEAUEYSMteZhsKzXT0sMGVfejS67JeuOmls7AbhjxwrN9n81QeNYZ0Q5mDLFsHq+wiYxD5qUYX/4IVBeTt@lists.linux.dev
X-Gm-Message-State: AOJu0YzmeVbVwrd/yp4iNOvA0wYSZbuqMOWIDRVzOYXhVMHfAARHtE0y
	3msU4UAB4vZDcQMPml/PCdWDf3AyTmd/ndJH+l4YO6i/NqNNz4bmpboc3PmCnvzn+3o=
X-Gm-Gg: ASbGnctVOimU0QIazfCri2FPy2sHJaQFVmDH7xyhN7ueg9en5ibUKXM1YTAcPdkLs4b
	yfuESXb2RdpMXbjgCyb5YQlpUKHxdV/J8EaGK2aBIVi1ZE2YJg/asqeMnzc93rcWMEwHxPq9bct
	dp+FNrbQiQPBjhz6cKi7DIFfUCVPJYKLMBz68T4Z7MJ/RGOOaI5kbH2Pmyyl2klFek0D37RiNaa
	BRuQccNO2BjWvP4FEhthz9NXBrrPCdcIKhmGe2EsjLv5PjxPwQ+NeM09tAK3HezFZQboAroxeXn
	8IyA6z/dSj8VjRPXtLPvZ/M8sJ8OWdqk6jK1AQny+PMDBhzLYPp5AOvz/u1uzCVg2xDyhwK8Y2a
	8g8PnXxkFJ5vmLutx+JxAe10yKmIOtN+mt0/5Bcu07GkGITpvVC8yadxatODt9x+KDb+SaEZjhF
	TbiHTyyf8t5Pboyxxv
X-Google-Smtp-Source: AGHT+IFtLElvxR81Tckw5mAAABXqwaPNv/lBu1tgkcuWlvZJfGpip3RMbzFOLoUXkftAvfjFkop/kg==
X-Received: by 2002:a5d:5f82:0:b0:3fa:5925:4b07 with SMTP id ffacd0b85a97d-42704d74f9fmr12489147f8f.18.1761134895206;
        Wed, 22 Oct 2025 05:08:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47496cf3b51sm35168225e9.9.2025.10.22.05.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:08:14 -0700 (PDT)
Date: Wed, 22 Oct 2025 15:08:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Artem Shimko <a.shimko.dev@gmail.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Artem Shimko <a.shimko.dev@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dmaengine: dw-axi-dmac: add reset control support
Message-ID: <202510221508.PY6fB9CB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017102950.206443-3-a.shimko.dev@gmail.com>

Hi Artem,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Artem-Shimko/dmaengine-dw-axi-dmac-simplify-PM-functions-and-use-modern-macros/20251017-183103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20251017102950.206443-3-a.shimko.dev%40gmail.com
patch subject: [PATCH v4 2/2] dmaengine: dw-axi-dmac: add reset control support
config: loongarch-randconfig-r072-20251019 (https://download.01.org/0day-ci/archive/20251022/202510221508.PY6fB9CB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510221508.PY6fB9CB-lkp@intel.com/

New smatch warnings:
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1355 axi_dma_resume() warn: 'chip->core_clk' from clk_prepare_enable() not released on lines: 1350.

Old smatch warnings:
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1237 dma_chan_pause() warn: inconsistent indenting
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1284 axi_chan_resume() warn: inconsistent indenting
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1355 axi_dma_resume() warn: 'chip->cfgr_clk' from clk_prepare_enable() not released on lines: 1346,1350.

vim +1355 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

45fdf99125b2bf7 Artem Shimko    2025-10-17  1335  static int axi_dma_resume(struct device *dev)

I guess kbuild bot thinks these are new warnings because the function
was renamed.  In the past we've just ignored clk_prepare_enable() warnings.
Perhaps that's the correct thing to do in a resume function.
The indenting in dma_chan_pause() and axi_chan_resume() could be cleaned up.

1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1336  {
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1337  	int ret;
45fdf99125b2bf7 Artem Shimko    2025-10-17  1338  	struct axi_dma_chip *chip = dev_get_drvdata(dev);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1339  
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1340  	ret = clk_prepare_enable(chip->cfgr_clk);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1341  	if (ret < 0)
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1342  		return ret;
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1343  
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1344  	ret = clk_prepare_enable(chip->core_clk);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1345  	if (ret < 0)
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1346  		return ret;
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1347  
9c360f02c387f93 Artem Shimko    2025-10-17  1348  	ret = reset_control_deassert(chip->resets);
9c360f02c387f93 Artem Shimko    2025-10-17  1349  	if (ret)
9c360f02c387f93 Artem Shimko    2025-10-17  1350  		return ret;
9c360f02c387f93 Artem Shimko    2025-10-17  1351  
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1352  	axi_dma_enable(chip);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1353  	axi_dma_irq_enable(chip);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1354  
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06 @1355  	return 0;
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1356  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

