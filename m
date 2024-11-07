Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46011E1C36
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977982; cv=none; b=Fqp6Y+lj4t7LLKrkrWht0jgI1DOHaElviv6XbiR7YccYEXGMsHPGpkO9ftu0K1odgf2o9CmynuXROiSDprD/ye2k38hWbFbwxxLiaLCKv+Ui+bQPhjC18PDqHfVsselW8YfYMA92nI01M5DUj9jE/hEaXle24IKFa4eMlmarVGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977982; c=relaxed/simple;
	bh=FAssYMuT3g1UCnr1f1768ULjkSWodEn3Mogao3a8VUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRAeVOoN6iVPfsgdTy3nCWUky4+64QkWz1g2vCb6/QuAzWJ4tOd7Zyjk9PUW0N4drldSx8KkSZYXOfiCPosKQlJ5z3TC0X9MyfqRWN8W65BVBfINLjAV5eLkYnmmrj5vOMdbrzS0lDxgk+LZ9kqn/yB1Py0MsdtyNB2T97taCDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g9FrVVIg; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g9FrVVIg"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso127345966b.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 07 Nov 2024 03:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730977978; x=1731582778; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bxTnaansLsGwyX4X1dG26PErwNbDYPOXaZq2IphXvjY=;
        b=g9FrVVIg34n8rlhbFATVsc7ikeoMwdNlSa9MK5RS0DJiYsWGMV2MfpDwMF1LfMuvGI
         WwYG07/Bt+3HpAedTThMnjZP+X+KdIAS9od3sA6S2xtIkvgvRBAlGV3ubHHlEXwa8Phn
         kzGAWC0i46UXEbPuP4cDOOXi+JbOXWR8Rr700medzpOYVwMQqBiS+zmec5jjCqN0sfoy
         GgxTPQ1RT/svvJk4ZKK08pjIL/NNDB6xOKB9TV3NSSNMioNTn2sjJnxd6JMdTlGUAjD8
         kYk5+BiMyNxF8AQYiQ4ZIp7tSyw46CdShIdMfwfTdT5GCGE/wjL+Xk/J0rD2iKqqc7AX
         Lqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730977978; x=1731582778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxTnaansLsGwyX4X1dG26PErwNbDYPOXaZq2IphXvjY=;
        b=hD+q4WAZAf++tq897iND5AAQEBOiq+0O/INiU2ee9UtnOQPGJYH6xErRBvcf+0cSuV
         Q4DFpU1x6WjsMONe+8ZOI8KMfvCKKDcVe5EZtUZBaofzGce1WuUrui5eVEeAci4fMry/
         yR0vJwKCQdTqKhwBZrkw7AbFkHsqGjFEnEC9j3qTsyqRR9bJdEK/8PMys5hlA4SZtAhE
         04vV9UkmOuEBdu+S7qQ1RD3XWaorppFNUjdEseMLQNZthdscygJgsLY5/TP4GuXOkMh6
         QVb3UFRHS4z5zn4jQ70nfTtTQDbYhzvOAvcnbTBldvGtAwyXPcb3EHCgvEmYVeYF9PlX
         c2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvgfDNZ5OZjxdH4umArU8Ofjtq/8wfAe8xorVkdqKg3CGIwTFZIloHWOH7oQ693BoTFwq5vzhgOfIzHNU8@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6Xqpd5N9rmxOMevktNG+PKhNPbcrQa2h6CKMMlPODTvtAmqm2
	sMWXgd/S5JK3PAakRjgsKYBiXtCAiFIIN7ZeaeOnsirOnDXyGyNVFNPMKiFey4w=
X-Google-Smtp-Source: AGHT+IFphj611143VdJsImYjeAH+pxPMUc82CFGVDH/4iqS20JWIIoXXYG/sr/hULPByHmo8QW5suw==
X-Received: by 2002:a17:907:7d8d:b0:a9a:1e4d:856d with SMTP id a640c23a62f3a-a9de5edb084mr4352238366b.22.1730977978083;
        Thu, 07 Nov 2024 03:12:58 -0800 (PST)
Received: from localhost ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e0fabesm77450566b.174.2024.11.07.03.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 03:12:57 -0800 (PST)
Date: Thu, 7 Nov 2024 14:12:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Cindy Lu <lulu@redhat.com>,
	jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com,
	sgarzare@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 5/9] vhost: Add kthread support in function
 vhost_worker_queue()
Message-ID: <e55d4e60-37ed-49ad-a8cc-f7b6adb03b09@suswa.mountain>
References: <20241105072642.898710-6-lulu@redhat.com>
 <247f4cd6-5653-4eef-9436-5699b44c4b82@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <247f4cd6-5653-4eef-9436-5699b44c4b82@suswa.mountain>

On Thu, Nov 07, 2024 at 01:38:56PM +0300, Dan Carpenter wrote:
> Hi Cindy,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vhost-Add-a-new-parameter-to-allow-user-select-kthread/20241105-153254
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
> patch link:    https://lore.kernel.org/r/20241105072642.898710-6-lulu%40redhat.com
> patch subject: [PATCH v3 5/9] vhost: Add kthread support in function vhost_worker_queue()
> config: x86_64-randconfig-161-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071251.tQLG8K6C-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202411071251.tQLG8K6C-lkp@intel.com/
> 
> New smatch warnings:
> drivers/vhost/vhost.c:241 vhost_worker_queue() error: we previously assumed 'worker' could be null (see line 241)
> 

I only meant to send this warning.

> Old smatch warnings:
> drivers/vhost/vhost.c:311 vhost_dev_flush() warn: iterator 'i' not incremented
> drivers/vhost/vhost.c:678 vhost_attach_cgroups() error: uninitialized symbol 'ret'.
> drivers/vhost/vhost.c:673 vhost_attach_cgroups() warn: iterator 'i' not incremented
> 

Not these.  I need to fix these for systems without the cross function
DB...  #embarassing.

regards,
dan carpenter

