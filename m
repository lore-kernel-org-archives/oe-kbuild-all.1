Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7152BD11
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088564; cv=none; b=vBQmC1BfmtbNKRnSzn0FacBZc2QmmQ+FUSHG0W17wcm4IeZpBesxkqas14ub3KAn1jQXza88cHY9LxTxMGacsD/TSAviLx4RjRLDVsbG+g8vfkYf9r0Gy6vZKnwwsqP6fekeAusgNrpg7CmAPhpBOOHDK/tYgDRhq9AnHsSnHiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088564; c=relaxed/simple;
	bh=LQ0bxs+3d9n403nrVVBCtUaJTlLutOkC1jRK9LEEa6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPoV8TVhnEI6SjiK6abHMf2YQEnxPzpCa1ub5DJ8f+5+6opJTjj4P+bIXayLHN6pA0lLeIS/s1zN+UIGcFNRTqx1CGsz3XMP6JeYVfdmww9MP615jKN7OKLfWBGJSzz8sLfgP5BF9VpF+I3M1IqEfBYrwQ9LU4m12DEO0D/owpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H9176JKz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H9176JKz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48541edecf9so27258385e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 03:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088561; x=1774693361; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ncZ3YNhaTYxF3dz2fmkAFzB2GbjnNzz5sDTtsch5DyI=;
        b=H9176JKzrpEQVeQtuYqumkQQjC51HRJMFAJWm1PPQkFnbMAjXApOGleTOCAJGcpWKB
         qaWlzV3mk2JxHv/QXq86XT37izprsDCwtN4zogSnWMPRYctDnk2H9mv4/nCi7igEMwOp
         kUlhe/NxRDIS5uh+wgroBI/QM+DDxDbQooWgTFF36iqH6iPX/q8QkKYLi77ddqwBiFwK
         /wvAgmqM8JV0voTZ0iRJEdx2aON5J82MvqL6/oQuA/+e/hzPW+Srcjf4awaOLSQhsNJG
         QCu2Oo+ta406wL7soHyiP00lvJ+1x77APaqvhgr3Z571q4YiEVANcJ+hqW0qqcL+RFO+
         1KgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088561; x=1774693361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncZ3YNhaTYxF3dz2fmkAFzB2GbjnNzz5sDTtsch5DyI=;
        b=IK2APjmNCKJa4O+XNyVRGym7+cg8zVch95M09idnLRd9QY1ikJP16nsik1jwCG97Gm
         0gj37IfLpJ7Ryvi0k4jodTmiZgbmrI5iupghOLU+/lk4OD0m4UpXdO7vmw9zJnFVd4pl
         UXzG5PemtRfC2QrFKGxHvSpofToHofO2iurXjzJ8yHk4SIcVDXuJh1EWOEIuhPYwE/OW
         IeqBkLA6e7cKjzMVFMG3Hjg8VsmUH56wMTWayKYBSQoXrKbw6qcd/6bsaGkQw5oWvvb1
         lkaxfz5uIU3dkAsEwJbHkueb9KcIXIttGcBaP1QQAKyzZuXxbxN9puUMdRsZf31FeLbO
         Cndw==
X-Forwarded-Encrypted: i=1; AJvYcCUuvKQbSMZPd7MmdMlB8DYudwL0MzTEQzzfXflnkI41yvVEDlfatoFZJl5WH7Zgi1sX8URkEzHbXfC4CwjZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyuMkiQ2QnfrYvJJoghwg7b2Jmas6AuK5L4KEUcTHoryAGnq3VQ
	1PKkHruDw3eWjSVK5qTtMAlmUJ9Y/kRmBnEUn560A5+xLMBu3gGkkY1cIuXwvR7Hf3fwl28UBF2
	/1zZs
X-Gm-Gg: ATEYQzyOYVLQRCg8bnItlqA0OypoxDHXTADfBcFU5pVI06ftPzKyHThMu6f7DHICue/
	SQ0zvZ130jBwb+kmd1bR3fftgTaCYdceVi6AVlOCU2n5t6dPT6beA9WRbBqgdtHHSZbjE9UlIqs
	LSdv2HZ/o5gk6M9DWXhPLKF8brDPf09Hjovi0m3pwhyrBLN15broWv981NFv3gDIKByT2w1ZcMF
	6iDbUSTWId6FOBrTfziJIhKo38TASsc8arp6UPGcaE/Cc7ypg27gq/fWsUCT10L9lEBRqpJODIK
	0EsdyUiBjblWX5VXIYIGs5UONhS9pnpcCdPyxd7/OvZgsdItt7aMy06dRkoomRoLgzJyiEiaslP
	e4oA7qnL5TFgW+A0utU8QP2ASkMTlWt+7ziyFJd1EMfsAa2DxJsr8BjD+lNc0MVgpClRXIx3ISL
	ShJTp2nlxPfYuOyFtABKumXnwsCmsX654PUaKqi1E=
X-Received: by 2002:a05:600c:c167:b0:486:fab9:a578 with SMTP id 5b1f17b1804b1-486fedc3843mr85510505e9.11.1774088561508;
        Sat, 21 Mar 2026 03:22:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe032a55sm238485695e9.7.2026.03.21.03.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:22:41 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:22:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: yaxing guo <guoyaxing@bosc.ac.cn>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/uio/uio_pci_generic_sva.c:140 probe() warn: passing
 devm_ allocated variable to kfree. 'udev'
Message-ID: <ab5xbtDoMoq7HUnz@stanley.mountain>
References: <202603210811.1eXTfndx-lkp@intel.com>
 <2da23703-7693-47f8-a561-743428b9bb22@bosc.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2da23703-7693-47f8-a561-743428b9bb22@bosc.ac.cn>

On Sat, Mar 21, 2026 at 05:51:15PM +0800, yaxing guo wrote:
> > 3397c3cd859a2c Yaxing Guo 2025-09-26  135  	pci_set_drvdata(pdev, udev);
> > 3397c3cd859a2c Yaxing Guo 2025-09-26  136
> > 3397c3cd859a2c Yaxing Guo 2025-09-26  137  	return 0;
> > 3397c3cd859a2c Yaxing Guo 2025-09-26  138
> > 3397c3cd859a2c Yaxing Guo 2025-09-26  139  out_free:
> > 3397c3cd859a2c Yaxing Guo 2025-09-26 @140  	kfree(udev);
> > 
> > So this is a double free.
> > 
> > 3397c3cd859a2c Yaxing Guo 2025-09-26  141  out_disable:
> > 3397c3cd859a2c Yaxing Guo 2025-09-26  142  	pci_disable_device(pdev);
> > 3397c3cd859a2c Yaxing Guo 2025-09-26  143
> > 3397c3cd859a2c Yaxing Guo 2025-09-26  144  	return ret;
> > 3397c3cd859a2c Yaxing Guo 2025-09-26  145  }
> > 
> 
> Hi Dan,
> The double-free issue has been addressed by Shuangshuo Li, who has already
> submitted a fix patch:
> 
> https://lore.kernel.org/lkml/20260226153250.18079-1-lgs201920130244@gmail.com/
> 

Okay.  Good.  I actually reported this bug to you last year in
November.

https://lore.kernel.org/all/202511280815.WV9iCJZb-lkp@intel.com/

regards,
dan carpenter
