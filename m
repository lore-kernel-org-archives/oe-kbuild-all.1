Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90411898F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761933713; cv=none; b=uwRHkvZPsCLPLFJ2VOuMGnkx4JITHauce0gEcRQpdo5YeGIxXn0mrbc7qEmqOB3CitaWnrrmQdrn6xtkiaZquC2mzqwCegB2aRCT4xZIn2kzJeWx3WH55T8OZ6Ba1b8O9cYZFwiipaW4mslabLLanSr0UrxqVd5crETVTZCljp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761933713; c=relaxed/simple;
	bh=ADSVAiPOX6B1gSmsW9EyKAj2xSrKAsl+RxaW9LESL74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lbi1js+54Axi6m/dY5WBk9UgfDUepP81eAzY5GnDCVxbhJcMJ9WiP1y/G5WtedjW8TvMxvslgqDWp8z26YS2UnEHNmh7IBEpE+iFahn4NWVUOqmfK0pdbwpLwVNJgazJNrDvkwc4juEM3LReTxhEkrNIiOKU12c1mrU2biPmJAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBcKzo3j; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBcKzo3j"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4710665e7deso12137045e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761933710; x=1762538510; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E6SP8H42MhuGKhf5Tf0RkAnos12jDN/g0vG2yinKCDE=;
        b=IBcKzo3jcaoZoUyfz/Sju+UzRUCQBZnq2t5RP3RLAmQqAKwfErBkU/pQ2VoAIZqN7F
         UX8PMyghK5aB4T/KqBBF2LTWV6c05EfOMOPpMawjCSsbljL3C4bSfmYnYNj/351BTSaZ
         mbDi1BNPOCedAguy2uHMlrKOSZ8ix7UeDBh3MBkI8tyAQzCfyNVJPVCX5qZp5qQV/NNi
         /8saj0sls+3KD1KHXnTRe7kE+CNuOrTEKiSmCfgVh/NtyuiKrsbPlfcKCtnibeQNcOzb
         cUofYAbX6LwIGg8fBV1bFI3TR3QDE/kUA5Wmpcd4ANpe/we9AqGJaIYuqsvQuyF3JIgE
         hNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761933710; x=1762538510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6SP8H42MhuGKhf5Tf0RkAnos12jDN/g0vG2yinKCDE=;
        b=Ay1OC268pe3gtpiVfS9zWSnSu5iSx56Q476m1iC4JJkS04jPFPiHT/Q4pl++sjxKX2
         Hisx491S1GjC4VnECVEqOFN014fbY/E3BEZwqfz/mvadMipuajBVLpBgnS/Q8PwNJg10
         hLLcBvDOesVQfHrs3R/0r3Pbkos1CDYFyU4PB2eSP0T2/bSgoqBNgsqF5nWH07SFvHZr
         56wQItBe9sCYp1UV4V7bOG4mPu9fzFhtmrBtYBd0sQWJPKgpLxLt6VLmOpCWjGH5YgxT
         7ixDcqYirVzIq78OtVTmQf/GxVIsvJHQuF6oTB2R0OSz6p0o+GFphtfBXkjwUaPwFYZ5
         cK3w==
X-Forwarded-Encrypted: i=1; AJvYcCWMyKj1rZ0AepEdNz7f0ghvzutpH75deaMjPRFQtWcvUIHhRU8gTVlug4o243VEiaunde/oonCsrhEw5PaR@lists.linux.dev
X-Gm-Message-State: AOJu0YzNP2Ddloae4LtGl6c5jXUZGu9pxQJIjHCIcSBDsq9hnShY2Vg3
	Q2FIuGvnhdrPk3FQznwy9gJdb+hXCeFFRyTfA30fCE6DAlJ8SlV0BUe9nVnY3sYKYsvIDzOt/ag
	5/Jc/
X-Gm-Gg: ASbGncsJZ+EGhVkyRbjQegcGlvDEVxLH4ZE0OG9kVzKTe+4p1nV7txRrUdKh0ucj9rL
	0+fx/Bt/8Hs7aJGKU5RWOt7psEYbhr6yCZ+wRQR7fPTrdtcftjsJQEoaat9zutLZ9utayqTXGZ2
	bCQUE9hlPQ6qkEVVeNbahU+0grwzb7SAfUE+VVwdwVMFtvafHFgFU/ykn1QxYeOWzvRs2iaLSrM
	Ue5XEk3SAN2EKgchjZPAiSn/cdu0otJHhE6F6yIoAmn9guOVfRto3fh780mx8pt1sAiTcTHqiXb
	c8fst29MEmiRWwffQkYUpnQGyfn/OE9dVZMK8XSYOEPpLhGGDWGdP++DH6C9dJEYBrgyTskIfja
	j0eC+5XUEklq0l4yCYHbBc9GMOquiFUvhKFeeJ7Q/jBU7ZsFbr/JRt2mH13VKnRTEpP9xgzTHLf
	T9DOg1Ag==
X-Google-Smtp-Source: AGHT+IGwTAH43N3wM16XX7jUmA2M+gELhc+IjeuUzRi/sE3Q+QtcHc71PYNZcyiwhAqVZ69okNUHWA==
X-Received: by 2002:a05:600c:4e09:b0:477:3012:d285 with SMTP id 5b1f17b1804b1-477307d7a25mr44275995e9.3.1761933709560;
        Fri, 31 Oct 2025 11:01:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c2e677csm8734835e9.3.2025.10.31.11.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 11:01:49 -0700 (PDT)
Date: Fri, 31 Oct 2025 21:01:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Avri Altman <avri.altman@sandisk.com>
Subject: Re: [bvanassche:ufs-lrbp-as-priv-data 27/28]
 drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn:
 inconsistent returns '&hba->clk_scaling_lock'.
Message-ID: <aQT5iXgmRCzaa_xZ@stanley.mountain>
References: <202510311328.Is1wMfkq-lkp@intel.com>
 <5dd16de9-4594-4b42-b912-d56c3ce6868e@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dd16de9-4594-4b42-b912-d56c3ce6868e@acm.org>

On Fri, Oct 31, 2025 at 08:57:25AM -0700, Bart Van Assche wrote:
> On 10/30/25 11:06 PM, Dan Carpenter wrote:
> > tree:   https://github.com/bvanassche/linux ufs-lrbp-as-priv-data
> > head:   f5ce986a0b77ce2944bf8314554d60eec17968e8
> > commit: 226979e4eb8a5844be9fb6047a1d042bf2cd72ab [27/28] ufs: core: Move code out of ufshcd_wait_for_dev_cmd()
> > config: x86_64-randconfig-r071-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311328.Is1wMfkq-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202510311328.Is1wMfkq-lkp@intel.com/
> > 
> > New smatch warnings:
> > drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn: inconsistent returns '&hba->clk_scaling_lock'.
> > drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn: inconsistent returns '&hba->dev_cmd.lock'.
> 
> Hi Dan,
> 
> Thanks for the report. This report applies to a patch series from July
> 10 (more than three months ago). I just pushed out the latest version of
> this patch series to my github account. Can you please repeat your
> analysis for https://github.com/bvanassche/linux ufs-lrbp-as-priv-data?
> 

Hi Bart,

These are from the zero day bot so how they are generated is mysterious.
The zero day bot thought the patch was 3 days old.  I think someone did
a merge or something.

I re-ran it on that branch and there were three warnings.  The "literal
zero" is a style issue thing so I haven't published that check.

drivers/ufs/core/ufshcd.c:2955 __ufshcd_setup_cmd() warn: variable dereferenced before check 'cmd' (see line 2950)

drivers/ufs/core/ufshcd.c:6849 ufshcd_err_handler() warn: inconsistent returns '&hba->host_sem'.
  Locked on  : 6696
  Unlocked on: 6688,6849

drivers/ufs/core/ufshcd.c:9035 ufshcd_device_init() info: returning a literal zero is cleaner

regards,
dan carpenter
