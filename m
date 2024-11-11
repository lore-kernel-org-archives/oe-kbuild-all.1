Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4738157E78
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731322144; cv=none; b=MEP6BtvhT9mcYHS1avubeMKzj0jCfqaHdbznfUipA3gBti0mlY8U0EVYjpVjEE22x/Di7kO92KYEm4P5M9STIAKtotYdSMJ7GgcYbe38VO+kORkmNRLhF7dMRIMfHjqDymZFgRmkaGf2WTM9mkX1Tp3jzT9YgPqUzNw3aJw9KHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731322144; c=relaxed/simple;
	bh=1qCgNxM6GribbPBDPQcQMfgTEkJnK/L813KEb/XFF1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sc2XB2557HJcxMZv4RRZeOdHI/Gdw3ao5sRS3lFsYY+hHDNghXmW2RLSwbpzTnFjdcBbwBbYQbG2I4RQ6ZtmSUBb9RTbo2GdTT5y1fb1t0xq3Yom+Snwuij+Whh5zytRTFeX9HJlZg6p/nafXQ5BXRAtsSweqi0sJgcwlLjLKUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FriRyzYE; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FriRyzYE"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cb15b84544so6425855a12.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 02:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731322141; x=1731926941; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xiKwMDavE0Kq8c9ykbojMaa6POsVYsPkZQQqGOgNLKw=;
        b=FriRyzYEekJ2e8eKCZcwR1doqGuHhmdJXNlyGKwf2UEXbjIq0AcrWV9ZmEc+tSMC2K
         s+a31Rdbxn+yHey+7FAzV80fX9YBC/7b/GF+kwvhBk5dd+SWGtqN5D8x/j0dl8z4qrB9
         fV4LfmZI/7zOizsNI2QUJyVISfAkEAypXL0LaBGwMPiB+y50ozF36PinwkbPE5iRMFf6
         sWNq2OYDBEMKICnDiUHArDMe7Gyj9Ad8tzle+MU9IrtD6MhBQD/sGWl+PXUP6p0OAhhi
         bco5E+7WvAo8y8rMTH2jo+Hm3AfIm5/OtckzYebrZL/l2Gn2K42+3+URcclECuyls3VA
         IBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731322141; x=1731926941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiKwMDavE0Kq8c9ykbojMaa6POsVYsPkZQQqGOgNLKw=;
        b=uPdwUZNRYskNrA2Tt5sCwb4RvAFxAYpoXy7lKgxhMqmgtdoeM3/WOkrLCzpK+wpimx
         IS6xvjFhTnXSUM/Me3yPxscznu9XM6WSy6QFfVxR6jHI6/I6/xJwuGF5SQei9Z6+jg7c
         dWsxRceBrT+1tEuxNdlycVLzKylSG6oWSiBb2Esb8lBNRcTMA0eqMrlyRDbEBm+OgyRy
         VawDn9jdNnxDhScxJknrgKTCnW170jS3YMrtKqgjiRl42qAmyj6b73zoKRg+sphS/4XC
         5ThVQzbqWDsUew2umpmyBjRb+CVq67v65RAydGB6pX2UoHiplNwh2tefOtcHb5AahOjG
         CS1g==
X-Forwarded-Encrypted: i=1; AJvYcCVHy/R2G9xad6SBWNzUMrxG6BWY3P7rRWobgu2M4Nx3PECtB1kvIDSaqfkKiZ5rHP676oVd0FCV9ml8WZzL@lists.linux.dev
X-Gm-Message-State: AOJu0YzVvUJzAu/JY8Ta6faKBpHYNW1ZMs6jZBWJyPCD48IQbA9FNwqE
	87EcVfyeMwnuwQzwDtOE7JblcvPADUWmN4UeR231SfhEgWRkuEcBNTpwJlJHdLJRpnpgTEPNbDM
	C50I=
X-Google-Smtp-Source: AGHT+IGKAUF9p1z1VW/AC38KwD61jBHbbtopi+iHnRoH4aSUgaxyItp9800qusnbCJWRILFlGW0mbg==
X-Received: by 2002:a17:906:730d:b0:a9a:a5a:1d47 with SMTP id a640c23a62f3a-a9eefeb27a3mr1192531766b.2.1731322141215;
        Mon, 11 Nov 2024 02:49:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a17651sm578830266b.38.2024.11.11.02.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 02:49:00 -0800 (PST)
Date: Mon, 11 Nov 2024 13:48:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] nvmet: fix the error of point math issue
Message-ID: <f4ce4ae4-fb33-467b-937c-444a46eb6f02@stanley.mountain>
References: <20241111104035.31770-1-kanie@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111104035.31770-1-kanie@linux.alibaba.com>

On Mon, Nov 11, 2024 at 06:40:35PM +0800, Guixin Liu wrote:
> Fix the wrong place of parenthesis of ctrl_eds and data point in
> nvmet_execute_pr_report(), switch to "void *" first and then do
> the addtion.
> 
> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>

This needs a Fixes tag so that the stable tools know not to apply it to old
kernels.

regards,
dan carpenter

