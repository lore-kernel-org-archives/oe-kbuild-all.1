Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB6130CDB1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769163516; cv=none; b=tekWcEwzFud3m298lQmg6eBoEvCfaRCkDNm/lVQ9SSylgATQPi/8pGuNMV5/i8snHulT4pIcVd6cuMZspmKeYwz9TzWotRNy60IZd5E21YNkYTAE3jd70q81VQ1UtFJiDfQlM6ZEma0X4Gfc0SQcEEgei9hrqiUssnOMD7EUj4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769163516; c=relaxed/simple;
	bh=U2r65y0/QOYBLtjuWr/ClQtfCRil8+sfT9hgRvIR8fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ADUFcTbfF5nR9mRQ744RAuiejqMxzk/r0f02tFladTK4u/kzPtBUEMU/CJ3jeWNtgNgBxw0fvbMDM6xhTQbN9S0FyC+YAQzO/H3zvDbFYgfobbiW9E6NL/ETK2XpEed9iKd9ftst2JX6q+d2ycIwZ96558yMThSwX6eO6+OOfGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJAcBit5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJAcBit5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso23603455e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 02:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769163513; x=1769768313; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dgi6FhsphtkTCHE826+RbFMGVK96GRZAG4Z7WF56k5w=;
        b=UJAcBit5IPQ3QqYRKSOnLptSIDKG2ZVH6KnRpgyzCiAhhcsy6r8RScR5a5MtQblvOA
         HQfSJRizbNLFY3Sw0ALGoiFvV7gXSDUvi8O+DKhVrEHAxLElqNkKvKJE/u5jwWVcxgL/
         GdX/WRnUIEZQPqRVH0zciYpcRarODHy4JzrfnxhzqAIcAIkYEfof7bh073HQ4xLilNN+
         MXP/Robd+aETw+E4E1nr74YRjK+90falTDfEgYfWHj32TfmqsKzYctcx2O7IQbTA++mn
         83HIcYS+vsR70uXAemRRSxFN+PNOGQtwGHsNVqzMuwUv1fLILQ+NtmeeAR2X6XIIfX4C
         MeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769163513; x=1769768313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dgi6FhsphtkTCHE826+RbFMGVK96GRZAG4Z7WF56k5w=;
        b=FGZWAP2FmBcnI34K6HSC2Jb1JFDRz5bcC2qiaoVEK9SgK0lN2M/uAoZgbsS499ynnr
         ul8UNLI0rEx/QCmuRCck08a1a51jwvOu6Ztb4DlPFQq7khV2eNYXYmWKVn01GkfhbDvb
         x0qkhRb3ip24U5+17k6seHI5VY2g1GASKSjPq73voOXGACaWXENx4UaJqLKWyhJUmoQg
         mbyqD/izs3rloOLgsOFFQoemkYCSFbKzYIoiKKIPxaAw7kf/tFkZYDo5nAQPAWmWFBBZ
         43jVsJPsspW7Hrsf9cpwhvgPTvhzcf7jXdOIjh5lYtCJfKrC2/i6+VBY/x3ZiVTAoPMK
         +hYg==
X-Forwarded-Encrypted: i=1; AJvYcCVVSqBUAEii/IHxK3P/U8gvwzPFuMZqbpIHKH1UP/0ImZFWjRQFuml1VDUpxc6kgFEV0caN1t5P3WxWARV2@lists.linux.dev
X-Gm-Message-State: AOJu0YwoDuqk1AGN20Q5IRjOFGO9a7cl7OS5YZgj3LfQRTwjVzKBIetd
	8uCHzg/38TwA1kwOXkqBs5eWanvFmuOxgcexvXZPuv1FD3vNknl004lZ
X-Gm-Gg: AZuq6aKqFfoMiubFyZR2Ecco7hIcNJQ5FZ0QVA2kg3XLsWvJDfPAtUcfHSrkUT/GkXa
	JEPL6PACuLsGP5bD4ppRm8UhalQQVi3/HbIjEGO2THpYXrfor+8U1AWsSpkV6SgMp7xd6JFpubI
	XxI+GY19mH78KqIwDN5+SAqenna9dhMgzghk3EPK1L/b6PBrDG3ujEMNbA0mozAQQVZ1hMtvw1H
	zMlODX28ZpZ5MRvRzyF6oi8YQEtDT+VtUjwr9Pn7AQQ04XV0UdoJgn2ef4zASsGtGGmdWaVum9t
	XXBKSZYvLZoUuXysw26Z7Whh6qVhN7Bj4xdUv8YEUTK8cehGn0IW3yDAtGO+srEtYt/1WCr42wJ
	H/z89of1olJMQUJxdkS6k9ZsrqVTRFYrZqAuHV9XuGicmB0yImANmHwgZk6IgmWql9wLHxAE2NY
	fizQlZ9x5LKi/FdVB+1yaE3PChagaiiJTWvBa8soDWuaHQWWBmSv2N/im/FoNxbnXs07qoy0awf
	qoV5z0kMcoi3yD0A8ZJop7oqpjReXfB+zTLhn78G0ZKDM78Lx0nr5cJCw==
X-Received: by 2002:a05:600c:a08e:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-4804c9b1fa2mr36941905e9.21.1769163512725;
        Fri, 23 Jan 2026 02:18:32 -0800 (PST)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:b9f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd8696sm17481235e9.8.2026.01.23.02.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 02:18:32 -0800 (PST)
Message-ID: <a59bc8fb-6fb1-4efd-b545-010459f7e5db@gmail.com>
Date: Fri, 23 Jan 2026 10:18:29 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe:for-7.0/io_uring 20/21] io_uring/io_uring.c:2741
 io_uring_sanitise_params() warn: if statement not indented
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
References: <202601231651.HeTmPS8C-lkp@intel.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <202601231651.HeTmPS8C-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/26 09:03, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.0/io_uring
> head:   82dadc8a494758093e775336390cb31033c6f9a3
> commit: 5247c034a67f5a93cc1faa15e9867eec5b22f38a [20/21] io_uring: introduce non-circular SQ
> config: alpha-randconfig-r071-20260123 (https://download.01.org/0day-ci/archive/20260123/202601231651.HeTmPS8C-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 8.5.0
> smatch version: v0.5.0-8994-gd50c5a4c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601231651.HeTmPS8C-lkp@intel.com/
> 
> smatch warnings:
> io_uring/io_uring.c:2741 io_uring_sanitise_params() warn: if statement not indented
> 
> vim +2741 io_uring/io_uring.c
> 
> 92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2733  static int io_uring_sanitise_params(struct io_uring_params *p)
> 92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2734  {
> 92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2735  	unsigned flags = p->flags;
> 92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2736
> 712fbe97c3322c io_uring/io_uring.c Pavel Begunkov 2025-11-10  2737  	if (flags & ~IORING_SETUP_FLAGS)
> 712fbe97c3322c io_uring/io_uring.c Pavel Begunkov 2025-11-10  2738  		return -EINVAL;
> 712fbe97c3322c io_uring/io_uring.c Pavel Begunkov 2025-11-10  2739
> 5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2740  	if (flags & IORING_SETUP_SQ_REWIND) {
> 5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20 @2741  		if ((flags & IORING_SETUP_SQPOLL) ||
> 5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2742  		    !(flags & IORING_SETUP_NO_SQARRAY))
> 5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2743  		return -EINVAL;
> 
> Something missing here?

Just botched indention. Thanks for taking a look

-- 
Pavel Begunkov

