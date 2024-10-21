Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E55A41
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 18:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729535537; cv=none; b=RpFNgyHKjEhYzmg71+cTJmhxgVC9FNRgDdlgqTkjBRsmExpWeynmAB6bLQYF35yMqnwwczsWXtzSu5jNEQwjkOCw9vFFSdR2cSpR8RcRpV6vliWDvRmKONyWEurXYfJ345khnIhbKw1v9wveIPO0vQ+ntogY/PsVwM6LK82xd1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729535537; c=relaxed/simple;
	bh=/Jikqjf0CL0KpCnJvp147SdJ4zfDd78X0ocM783HjtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=N6aA00UEomp7IEZuE7CfDUcwzY3aGo3fq5QRyX3rsvywhMz2pTTiOQRH83YEQXPItACn23eOcO18O5QIASlIJklkjlBkoZ1Orhszq34y13zp5XK6WFfX3WXN4ASS7R4Y7ntWOsA4vlBAW02JGJ+r9IvCx/fZV7Zpx5C0DsuLKUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tx82zIDb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tx82zIDb"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43163667f0eso32606285e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 11:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729535531; x=1730140331; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1zdjYjzLIbLJ1CeQLm3iN32vtd7+t/ewsVsWD0EwaRw=;
        b=Tx82zIDbb5wh7W4jQ0lAtvrkOpvZK1nt+GQgrj5SLpZvjZlU3H/AIrtEYHNwRU4VRb
         CLZ42+kvP1aty6Qtalivma6OVqLA4/bUMUg8k6NrCvD+wePoKsF+6JBVpmv8Pg85y+Ht
         WKiM1YKH0FxaYZ7EYmTtyrLUGi0LpB1D0LQNnFu0FDv6Syj4TMKdeKAEL/Tqov9po5B7
         Cjc8LJFpmMXsW0646JSJyLZPYIQtythTT76Du5sPacW8aZDUK+IWpW1sfioGIgaNwyvT
         oVKvmgABOVFSe9r4OjSLQ27AQ3RgcJaGfR8R5DQ0b6ab+OoOYCk0Dv59UYqzUEelVGJl
         05pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729535531; x=1730140331;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zdjYjzLIbLJ1CeQLm3iN32vtd7+t/ewsVsWD0EwaRw=;
        b=eJ9ZHzlAmFx2xoMfjkC3jr9It5ab77QdD+82XbMI++8pxDewXUN4+7voep/siBNxyJ
         VVXK532xNTkjnUi0WdmmVb3o6LuaS2byzWYQGGbmpKbFcd8Ks3IITKiPjG28PG8QM2Rr
         dn44a7v6UOjJw/Ds469PYWrgn0vzx5LRU8n+IYu6NhsjVTUz9S9wryOpbeAu2uLfLimU
         LKcG2OeHNdCcpADhDpgXCMmDjAbPkxs6iSxidKSXPvYNO9JGWrq/BaGileMdyXOZQ2fE
         dTQCvvy28SaOb1OLGlX//OVSa3T2f9JlLfMLPIHgbK5FQHN7CwRMmarPlbj1NddAsW28
         CsTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCZ+WHI6H90Okcrr06002JKmkBx40IutxkINcg2ZAUsFz23nD4R9N6EMZDpvuHLpA4QLjoNFSD53X6gOAq@lists.linux.dev
X-Gm-Message-State: AOJu0Yw928g1EGK5tso/RHmj8se7a+vCbv6yskbXMS5ceSsugY1CtV5U
	k/04uMpZOZllmb7jtDZbC8V7d/PWP5EBhw254rGHNFwjxl97fWNSQkEYIvVvm+/UlD/SQphN2dt
	T
X-Google-Smtp-Source: AGHT+IFDLZOKaqhkhui6EMc3gIgkUVJEas1IGzwEGyYVgYkTxW78PTyBKKBlS2Pik987FUlfa78QAA==
X-Received: by 2002:a05:600c:4ed2:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-4316163b8bbmr94064995e9.8.1729535530704;
        Mon, 21 Oct 2024 11:32:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a585f7sm4866289f8f.51.2024.10.21.11.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 11:32:10 -0700 (PDT)
Date: Mon, 21 Oct 2024 21:32:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 01/13] media: v4l2-ctrls-api: fix error handling for
 v4l2_g_ctrl()
Message-ID: <6d638db8-956c-44e4-a842-590c00e42e80@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d36ccf66f48a870c9bc0f7e9fda595505c4d342.1729230718.git.mchehab+huawei@kernel.org>

Hi Mauro,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/media-v4l2-ctrls-api-fix-error-handling-for-v4l2_g_ctrl/20241018-181159
base:   https://git.linuxtv.org/media_stage.git master
patch link:    https://lore.kernel.org/r/4d36ccf66f48a870c9bc0f7e9fda595505c4d342.1729230718.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH v2 01/13] media: v4l2-ctrls-api: fix error handling for v4l2_g_ctrl()
config: i386-randconfig-141-20241021 (https://download.01.org/0day-ci/archive/20241022/202410220105.oP6D4QD7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410220105.oP6D4QD7-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls-api.c:825 set_ctrl_lock() warn: inconsistent returns 'ctrl->handler->lock'.

vim +825 drivers/media/v4l2-core/v4l2-ctrls-api.c

71c689dc2e732d4 Hans Verkuil          2021-04-27  812  static int set_ctrl_lock(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl,
71c689dc2e732d4 Hans Verkuil          2021-04-27  813  			 struct v4l2_ext_control *c)
71c689dc2e732d4 Hans Verkuil          2021-04-27  814  {
71c689dc2e732d4 Hans Verkuil          2021-04-27  815  	int ret;
71c689dc2e732d4 Hans Verkuil          2021-04-27  816  
71c689dc2e732d4 Hans Verkuil          2021-04-27  817  	v4l2_ctrl_lock(ctrl);
54c5e2c49a4358b Mauro Carvalho Chehab 2024-10-18  818  	ret = user_to_new(c, ctrl);
54c5e2c49a4358b Mauro Carvalho Chehab 2024-10-18  819  	if (ret)
54c5e2c49a4358b Mauro Carvalho Chehab 2024-10-18  820  		return ret;

v4l2_ctrl_unlock() before returning

71c689dc2e732d4 Hans Verkuil          2021-04-27  821  	ret = set_ctrl(fh, ctrl, 0);
71c689dc2e732d4 Hans Verkuil          2021-04-27  822  	if (!ret)
54c5e2c49a4358b Mauro Carvalho Chehab 2024-10-18  823  		ret = cur_to_user(c, ctrl);
71c689dc2e732d4 Hans Verkuil          2021-04-27  824  	v4l2_ctrl_unlock(ctrl);
71c689dc2e732d4 Hans Verkuil          2021-04-27 @825  	return ret;
71c689dc2e732d4 Hans Verkuil          2021-04-27  826  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

