Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD47823AB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 05:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728279839; cv=none; b=MeHB6iO6C5rKJnAw8Xq1/WyLXeB4XDmKhx0edxfCT2rUJ0HNR10R33ZKRVvVUqef6bNneisY9JQJu2cKD7/0TeWwLZGCJRz/Pf/JqEbvbg7IwB390Y2Hk76SED4/odrszSyXZ16ctVRLT1x13A2LN2X7z+EWYzLcU2jwQCthuMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728279839; c=relaxed/simple;
	bh=4FnAdEWhgT21dew3vINLRmKlEW2+V58lcs7/4s9dgPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SlXOKqh6fkV+TpuK1DrBxnUCBeuKwXcCOcRji78eOiC7A3RQ8+mJ7Ie3+cmvYGVZ/CvCQep0h9YpwKNledaLaZ4SyMST42GlR378WJwG/cThXH/0styWqVER0MOuxzPKwAO9bOb+kHDfLDb1xb9t0jlRU/oD/1P/67+I0pJitIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPH5Knm/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPH5Knm/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so41311565e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 06 Oct 2024 22:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728279836; x=1728884636; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZIeZkxv8ncN38TzGr+HuLXR09Uvc+UUF48KBR58GAQ=;
        b=FPH5Knm/U29qfLMcwGvgu8MgLvlQNtIy4Q6P5tEJq2dsWnnxq6rHZGLGK6tPlCoGi+
         rfoHKIgmwebXuZXGvlW6UbxB/6R2fsPlUXi0ATaniGa+l9OACe7v5fz/opMmYwoQegDG
         OSrLUvguCHd1oL/1J/FNBkCgWJCEr8aTOElkB8ua4TCIO+Na/Fyniy9Jgb/z2EIDPogs
         lZsjLzLEPQcxDsgviAlNgHWeUZNKp7qk9hcoKpxz1rwEPyI5sQVVW2Ny8X34yceUuf3c
         UCniWbs53iTW+Sn14xLksF7K0CHja997SuxKft3lxaJ5byAF1T/NBSh+XvmwajOyl6hu
         IB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728279836; x=1728884636;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZIeZkxv8ncN38TzGr+HuLXR09Uvc+UUF48KBR58GAQ=;
        b=c6QeW9uF4zvzadeP4peSNiaAD9pIvqF14XwiFww/3UgncjGIZ+1VhKapFtGX/GoRhu
         74WTqUuXWYiBJ62bdrO56Zx/K5HAcPbwnR89Kolvk3fcczloEX1QatUdEsW1u5TnCCxw
         tlsiRw5IVacq23GKWQSN1Q4ZrbrBeRlvAEZskh7lpEXQNPjlCM7MMKaM8oKS6TuPmO4a
         TRjXGdOWgfpN9n5WNqfLlpghPrewAU3Lmkg0mcgiFIHRIKM9PrO/+lYVbKLxQvrjM4JG
         Oa2JQMK7z4Mstrsl+d7Fxal9QZfOnN+oNXVkwyhF0GeNi81D9dQeAF1BEo4kaa2b+YH+
         5Opw==
X-Forwarded-Encrypted: i=1; AJvYcCX9WS+7SRGimFG3XtJ2nxQQYDx0WbrS4vAYrG4AQcDtF1fzx82v6N31FGdfWURxq6xlUlp65WBDlWY3Mu6h@lists.linux.dev
X-Gm-Message-State: AOJu0YyLqjOX4EQyrvrSYI32hF4K37UFhj6lyfJMi76z3EaXSWXiYmL4
	WGhD/07Zx5xeHx1NweLr7y3rm98sMVAoT+XEj/Ol7TYbjxLYOjDuEQe+1lNDalqdLIztpBLHNuX
	Y
X-Google-Smtp-Source: AGHT+IEeeaJSgmHoNoZlIfFAtR20iqlnve6/gDiP6iuGAvFUBns4yfxJNE0VjtC6SONF+XV7qRs+CA==
X-Received: by 2002:a05:600c:1907:b0:42c:af2a:dcf4 with SMTP id 5b1f17b1804b1-42f85ae8ee5mr68223405e9.27.1728279835497;
        Sun, 06 Oct 2024 22:43:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a205absm81217085e9.19.2024.10.06.22.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 22:43:54 -0700 (PDT)
Date: Mon, 7 Oct 2024 08:43:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [ambarus:mailbox-request-v1 1/1] drivers/mailbox/mailbox.c:543
 mbox_free_channel() warn: variable dereferenced before check 'chan' (see
 line 540)
Message-ID: <381b8465-2432-4fc7-9314-b14dd57bc017@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day mailbox-request-v1
head:   1f2e24358cc2d39e5a26ef0a6b0fe65920f04caf
commit: 1f2e24358cc2d39e5a26ef0a6b0fe65920f04caf [1/1] maybox: add simple async mechanism to empower controllers
config: sparc64-randconfig-r073-20241005 (https://download.01.org/0day-ci/archive/20241006/202410060657.bzHprVZf-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410060657.bzHprVZf-lkp@intel.com/

smatch warnings:
drivers/mailbox/mailbox.c:543 mbox_free_channel() warn: variable dereferenced before check 'chan' (see line 540)

vim +/chan +543 drivers/mailbox/mailbox.c

2b6d83e2b8b7de Jassi Brar    2014-06-12  538  void mbox_free_channel(struct mbox_chan *chan)
2b6d83e2b8b7de Jassi Brar    2014-06-12  539  {
1f2e24358cc2d3 Tudor Ambarus 2024-10-03 @540  	struct mbox_controller *mbox = chan->mbox;
                                                                               ^^^^^^
Dereference

2b6d83e2b8b7de Jassi Brar    2014-06-12  541  	unsigned long flags;
2b6d83e2b8b7de Jassi Brar    2014-06-12  542  
2b6d83e2b8b7de Jassi Brar    2014-06-12 @543  	if (!chan || !chan->cl)
                                                     ^^^^
Checked too late

2b6d83e2b8b7de Jassi Brar    2014-06-12  544  		return;
2b6d83e2b8b7de Jassi Brar    2014-06-12  545  
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  546  	if (mbox->ops->shutdown)
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  547  		mbox->ops->shutdown(chan);
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  548  
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  549  	if (mbox->ops->send_request)
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  550  		return module_put(mbox->dev->driver->owner);
2b6d83e2b8b7de Jassi Brar    2014-06-12  551  
2b6d83e2b8b7de Jassi Brar    2014-06-12  552  	/* The queued TX requests are simply aborted, no callbacks are made */
2b6d83e2b8b7de Jassi Brar    2014-06-12  553  	spin_lock_irqsave(&chan->lock, flags);
2b6d83e2b8b7de Jassi Brar    2014-06-12  554  	chan->cl = NULL;
2b6d83e2b8b7de Jassi Brar    2014-06-12  555  	chan->active_req = NULL;
33cd7123ac0ba5 Sudeep Holla  2017-09-28  556  	if (chan->txdone_method == TXDONE_BY_ACK)
2b6d83e2b8b7de Jassi Brar    2014-06-12  557  		chan->txdone_method = TXDONE_BY_POLL;
2b6d83e2b8b7de Jassi Brar    2014-06-12  558  
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  559  	module_put(mbox->dev->driver->owner);
2b6d83e2b8b7de Jassi Brar    2014-06-12  560  	spin_unlock_irqrestore(&chan->lock, flags);
2b6d83e2b8b7de Jassi Brar    2014-06-12  561  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

