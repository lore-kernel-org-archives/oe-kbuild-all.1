Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE83C1917EE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733385217; cv=none; b=Cs1UteQR7/y/FQigpZOnvx1DK+49e/S2r39mY2Ll7Wt+HUDgtpsiLGx9vAQGJw8rzuc7+pK91MmA6hxF+V63LB7BHlabrFFDlAUtT0wG7QRgxXY4Ivhn5jlTHr/oUVeq6hnuduHVdXks+LI9y7Em4r2kHz4Ir/T2WaJICLlKotg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733385217; c=relaxed/simple;
	bh=rNLkOrja+fjelYi49mXop/QbH0nhaWqHZi1LrcwdE/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SUnS7e7HoBK/EmYBIyYQMzwkG8YnqXAM4AbtIlKBAi36q6IkSHvqXFgYLtGEIAS7tj8C93oBNwbFRWYI5iuH0upqpcv4YwTc5F/vLj0kWz/U568DzP9mA1cghzDErYpwg6F/9BmifXEt/6fJ5qEpw/HFwNGxjdcSI/2fYPVv5QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xuxTg2RC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xuxTg2RC"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434aa222d96so6255065e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Dec 2024 23:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733385214; x=1733990014; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cw0aKudym1GacjK1kSQ+ayXt2em3H+XIjkba+DLt6j4=;
        b=xuxTg2RCffE3JrO5ITTeCBBBAGFLV+e7iIWmywuq5MYLLfh3FGf/JhF9TDudS2FWhm
         TVljThOYtjsrkCW4h9B0kO6UK6bbLsurSS37PXb7obm9FpJH1qdrb8tvotQ09K6A4Hbd
         QN0japVH9XDxc2ntQAEslDtqqko53m6uEdr/S1gBx2AHEa6OeEL1wjuCXz3Q7un9Ohac
         sZW5AcztK7S+FoosFtzJErPJxaEpO1XOkJFXqRp/8eOcng5golDWkFHHP+p7DznEJYiN
         WyP1xAkRA4JSAdKSrAEFIuY1V7Rwde2INTWRylzx567/a4zOyVaYyaE1iE/7wCsLIuYh
         z2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733385214; x=1733990014;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cw0aKudym1GacjK1kSQ+ayXt2em3H+XIjkba+DLt6j4=;
        b=L1VIWqI+t+Y5pHl/qnBZgtJZwV1O54o8Ek5AlMWpW3awSvpH6RKlnMeHZ6a5gBTIYR
         FTNHlaofY6/zhhkUxpK+FUMTKVIRJRBSkfKMdXb6l5UaQgRmSixB0lhW8OdR2HqPEKj0
         cn52XAKvitRF/W+u4/SJ4vBSwIcZP0yYjkG/qrd+SsNEdoc7QT9Q96QjTOS3B1v/8T24
         433GgXGMw6H/oxFtMtc189ztKByqn2PYhy9piNxKk3NzbZy8r5X3V5PMum+IBFaRnrBd
         VNPznvQZZK6Q91h+i8/A0R9OsVsw52ljkGUQlupdE36bNbtLdbf/J91+a8oXOWYm3L//
         ifHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU97Df3qBRpfo3p2Vl/ytvq6NmvEfTxQqrEiqm7POogI0NE4vMpDTsQtKwcqfTtBrBocmwNcVjpcwbvq05v@lists.linux.dev
X-Gm-Message-State: AOJu0YxM2LsgUdf601um/UlD2WP5HF5csSIFo3nUEqcVmmp9n/Gh1xT4
	iFzPLHE4WSc01gvZsjeUWsDKfkyurF4V6Nu2vSWS4zM58KYwzLt2djFZrpm1fEc=
X-Gm-Gg: ASbGncthDHHq+HcWr/LMQNGJBdB5jrcSgARd1SOJ8lKUbfaLBqfwbzE2jIMspVrINWN
	peCyAktC0sSnGsTVwENcvhSWKjjDJNYeUvR7e08ADGnUkjVz1xuDcvdA9F82G+pLim2oUhfROD2
	qevgnEDokmtEgNksrqzQ/iAIIciGW4FzkvllmFBfRQaeKg4vRxIHIo9sIuQ5LCtDQkB4L4/sTv6
	Un71xVGhxWieNvDJDSs2vM/IlQqMcw9mZTAMqeKeEJdxMtN2WXHeM0=
X-Google-Smtp-Source: AGHT+IHeHx6J40zka1wLL2JkYZnlM+LhLjW9YE2vh1+GWCFVNs50wHfukGoUdRPwrZOGx+bmYNmclw==
X-Received: by 2002:a05:600c:450e:b0:434:a30b:5445 with SMTP id 5b1f17b1804b1-434d09d1cfemr86118705e9.19.1733385214272;
        Wed, 04 Dec 2024 23:53:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d6961sm14679745e9.12.2024.12.04.23.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:53:33 -0800 (PST)
Date: Thu, 5 Dec 2024 10:53:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: drivers/dma/idxd/device.c:370 idxd_cmd_exec() warn: mixing irqsave
 and irq
Message-ID: <0047f184-52c2-4d7c-8f03-425b6f185860@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
commit: 0d5c10b4c84d6ae6255129e5f16a0d2119c74334 dmaengine: idxd: add work queue drain support
config: x86_64-randconfig-161-20241112 (https://download.01.org/0day-ci/archive/20241205/202412050237.MXIHJMPC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412050237.MXIHJMPC-lkp@intel.com/

smatch warnings:
drivers/dma/idxd/device.c:370 idxd_cmd_exec() warn: mixing irqsave and irq

vim +370 drivers/dma/idxd/device.c

0d5c10b4c84d6a Dave Jiang 2020-06-26  357  static void idxd_cmd_exec(struct idxd_device *idxd, int cmd_code, u32 operand,
0d5c10b4c84d6a Dave Jiang 2020-06-26  358  			  u32 *status)
bfe1d56091c1a4 Dave Jiang 2020-01-21  359  {
bfe1d56091c1a4 Dave Jiang 2020-01-21  360  	union idxd_command_reg cmd;
0d5c10b4c84d6a Dave Jiang 2020-06-26  361  	DECLARE_COMPLETION_ONSTACK(done);
0d5c10b4c84d6a Dave Jiang 2020-06-26  362  	unsigned long flags;
bfe1d56091c1a4 Dave Jiang 2020-01-21  363  
bfe1d56091c1a4 Dave Jiang 2020-01-21  364  	memset(&cmd, 0, sizeof(cmd));
bfe1d56091c1a4 Dave Jiang 2020-01-21  365  	cmd.cmd = cmd_code;
bfe1d56091c1a4 Dave Jiang 2020-01-21  366  	cmd.operand = operand;
0d5c10b4c84d6a Dave Jiang 2020-06-26  367  	cmd.int_req = 1;
0d5c10b4c84d6a Dave Jiang 2020-06-26  368  
0d5c10b4c84d6a Dave Jiang 2020-06-26  369  	spin_lock_irqsave(&idxd->dev_lock, flags);
0d5c10b4c84d6a Dave Jiang 2020-06-26 @370  	wait_event_lock_irq(idxd->cmd_waitq,
0d5c10b4c84d6a Dave Jiang 2020-06-26  371  			    !test_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags),
0d5c10b4c84d6a Dave Jiang 2020-06-26  372  			    idxd->dev_lock);

Please understand that these emails complaining about ancient code are
from the zero day bot, not from me.  The issue here is that
using spin_lock_irqsave() implies that perhaps the caller disabled IRQs
but then the wait_event_lock_irq() macro enables IRQs when it is
finished.

0d5c10b4c84d6a Dave Jiang 2020-06-26  373  
bfe1d56091c1a4 Dave Jiang 2020-01-21  374  	dev_dbg(&idxd->pdev->dev, "%s: sending cmd: %#x op: %#x\n",
bfe1d56091c1a4 Dave Jiang 2020-01-21  375  		__func__, cmd_code, operand);
0d5c10b4c84d6a Dave Jiang 2020-06-26  376  
0d5c10b4c84d6a Dave Jiang 2020-06-26  377  	__set_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags);
0d5c10b4c84d6a Dave Jiang 2020-06-26  378  	idxd->cmd_done = &done;
bfe1d56091c1a4 Dave Jiang 2020-01-21  379  	iowrite32(cmd.bits, idxd->reg_base + IDXD_CMD_OFFSET);
bfe1d56091c1a4 Dave Jiang 2020-01-21  380  
0d5c10b4c84d6a Dave Jiang 2020-06-26  381  	/*
0d5c10b4c84d6a Dave Jiang 2020-06-26  382  	 * After command submitted, release lock and go to sleep until
0d5c10b4c84d6a Dave Jiang 2020-06-26  383  	 * the command completes via interrupt.
0d5c10b4c84d6a Dave Jiang 2020-06-26  384  	 */
0d5c10b4c84d6a Dave Jiang 2020-06-26  385  	spin_unlock_irqrestore(&idxd->dev_lock, flags);

This irqrestore sets the IRQs back to whatever they were when the function
was called.

0d5c10b4c84d6a Dave Jiang 2020-06-26  386  	wait_for_completion(&done);
0d5c10b4c84d6a Dave Jiang 2020-06-26  387  	spin_lock_irqsave(&idxd->dev_lock, flags);
0d5c10b4c84d6a Dave Jiang 2020-06-26  388  	if (status)
0d5c10b4c84d6a Dave Jiang 2020-06-26  389  		*status = ioread32(idxd->reg_base + IDXD_CMDSTS_OFFSET);
0d5c10b4c84d6a Dave Jiang 2020-06-26  390  	__clear_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags);
0d5c10b4c84d6a Dave Jiang 2020-06-26  391  	/* Wake up other pending commands */
0d5c10b4c84d6a Dave Jiang 2020-06-26  392  	wake_up(&idxd->cmd_waitq);
0d5c10b4c84d6a Dave Jiang 2020-06-26  393  	spin_unlock_irqrestore(&idxd->dev_lock, flags);
bfe1d56091c1a4 Dave Jiang 2020-01-21  394  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

