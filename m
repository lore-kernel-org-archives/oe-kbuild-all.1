Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01841B4236
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 18:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735843126; cv=none; b=V19jlaft7ZSTgqx4y55YadImmFMwqp7leRA6gp7tAMglg/sqUXfubrZCHetuqWGRhFHmX3qfDfAdGpgd7IkC7nmU28mANbCrPc2maHrJZL4NyvPr1JH6uSJHIxN1fOrNJotwAZSY0mk8X8utbhlO0qJFa6Zhm7BiUl6LQxbS7k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735843126; c=relaxed/simple;
	bh=aiK9Eo30lMl+cvPZ9rdk38DZZknLOhcaof4gBaulews=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmI/sMl0t9UJoIdfmHD0/69BwP6bZmaTmHSmqMTbkYzVMCPAd4mThbOdXxGB68HYTEA5XNRiYqJuqjz2z+4qDfWF/geYtKX0/AjXMaEeE2kdguFQk80XeoZI68XnuN/8/atwBCda8bgMpumLAWPWX+eGtvAixzMavvbU54d8azo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tv4whnIt; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tv4whnIt"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216395e151bso115811805ad.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Jan 2025 10:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735843124; x=1736447924; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yVR89FDZCwaovneB/CRzO/aHUswAytv58IvwgTr88W4=;
        b=Tv4whnIt47fJ9LLAShubwI0QVcFblUoFfsynlAfGoM13WiblxKJ2saG6Yb1Ii+V1Rz
         yd0/3tChXwU3sn/JIy2AguDLnLGz/pmXfMNQ69l1mJjjuNj+kCv/NA5twPL5uvyPHyy5
         LB67g0p+byGIpWIgHB8srMxnSCWQz/NOjatBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735843124; x=1736447924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVR89FDZCwaovneB/CRzO/aHUswAytv58IvwgTr88W4=;
        b=wYK6QOrXStpDLY5bF0hAMFrswUYSiz6Xdidn2Dy28J3tuW1PAt4Yq5Y5leb+axGeCj
         0vkZ39LiXldN3c+dwbUPy0bs5ffyHue9YfGJ3mQUJUn3/Q7XH8TCi5z/tx01OySjNcJn
         34omyVo0F+xHNVlwPwQ+biB3zZYtZXSx5ojjHH7sMT9H/cR0asgxTN4iBPOKZaaTwU7f
         z7fPt4k3fhigiMBr9keHjtRM43m9M41vQsxIunN55pZ50sSGw6UW7k1dDl4wQRE/7ya0
         sor1V55w1/+nZtvsgLROw4RPUZzerM1O7VZLXVgHhDnEu1pab/O9JiIy/S6hN3VwarG2
         AnkQ==
X-Gm-Message-State: AOJu0YyEe1BOVvTMoy6VQnWAt5xGokrS3A2vrg3ZrvGMxbyB1X2unOg+
	xY2N1fvcHUzDGMSQTOYenaic263c9bgj+qe0HmtjJRfCiLsBT4W1hhDgozDRgQ==
X-Gm-Gg: ASbGncsMoCUzrVBc7iHP7kMO7OkAepeKpDVf8wdOvcwPdEK4IWIShfX/0e7nbxywHax
	y0e0fh92z/viu4TU4Tos/PPcNfnOk6EI1fpD/J/I5uG7iflERa/6HfjTJyqDzC7xNghN4X2TYUh
	0L2RZXPgE2vpNfw470iCTLLWjdo4Z3dhlwBt1BjTLjIF1NsyafawCl5cJhdDxQiA0RO7zgYatYo
	VGVaH72oK3sgOFL+m2bdzeWSf50pHHcat9e6F+lBV9N6xfhg73Tb5GBrKOJ2dd9/QGqD6vJZAGu
	Y8K0/XX1pdshnEFCAhE=
X-Google-Smtp-Source: AGHT+IGKzS7n64vKCx1fJcvRPXHtsFQpEYWhYMqZfY9QaX1QPQwahmk8qRDNflg8T6wWQVybs8zylg==
X-Received: by 2002:a17:903:98d:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-219e6ccdc98mr741472245ad.7.1735843124189;
        Thu, 02 Jan 2025 10:38:44 -0800 (PST)
Received: from localhost ([2a00:79e0:2e14:7:2f1b:db40:bb38:fa8e])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc962bfasm231440465ad.2.2025.01.02.10.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 10:38:43 -0800 (PST)
Date: Thu, 2 Jan 2025 10:38:42 -0800
From: Brian Norris <briannorris@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>
Subject: Re: [driver-core:driver-core-testing 29/29]
 include/kunit/platform_device.h:15:57: warning: 'struct completion' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <Z3bdMogEbi3j7Oj3@google.com>
References: <202412241958.dbAImJsA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412241958.dbAImJsA-lkp@intel.com>

On Tue, Dec 24, 2024 at 07:16:35PM +0800, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/base/test/platform-device-test.c:3:
> >> include/kunit/platform_device.h:15:57: warning: 'struct completion' declared inside parameter list will not be visible outside of this definition or declaration
>       15 |                                                  struct completion *x);
>          |                                                         ^~~~~~~~~~
> 
> 
> vim +15 include/kunit/platform_device.h
> 
> 5ac79730324c6f Stephen Boyd 2024-07-18  12  
> 5ac79730324c6f Stephen Boyd 2024-07-18  13  int kunit_platform_device_prepare_wait_for_probe(struct kunit *test,
> 5ac79730324c6f Stephen Boyd 2024-07-18  14  						 struct platform_device *pdev,
> 5ac79730324c6f Stephen Boyd 2024-07-18 @15  						 struct completion *x);
> 5ac79730324c6f Stephen Boyd 2024-07-18  16  
> 
> :::::: The code at line 15 was first introduced by commit
> :::::: 5ac79730324c6f37106ce397586020ffe6e8e234 platform: Add test managed platform_device/driver APIs

For the record, I already patched this here:

https://lore.kernel.org/lkml/20241213180841.3023843-1-briannorris@chromium.org/
Subject: [PATCH] kunit: platform: Resolve 'struct completion' warning

That patch is still pending though.

Brian
