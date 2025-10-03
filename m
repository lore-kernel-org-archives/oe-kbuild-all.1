Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA3B28FFE7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759488833; cv=none; b=beWsxLv4yPUhUqFv0uQrnniC0Tu0yxiY547aMDwn0mVPUw8l6LavElpgfUfEfeIwFOCDhPbL+wqClZKTn8jE5TPghBLQvO2MlqENyWQWKkVswDEPAJM7v0Sms6VVLmAXhrzRcv5O2Gk0ECEYsIAqI95ZJrGSdu2XV3KccwwOblo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759488833; c=relaxed/simple;
	bh=UFcz23HgBO5hzJco7gPQTmR+kMORHGddodDKDlaocds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ms8j39DOHh080WOmEdjmXZqEFAPVz0VIq1n7V+F02+2TIaSFCHew9koOlbxfMSHQ3DNL6BnbJ7lep+LbRSHUjzRjSCL0TaiIEGgaM2ItP8LyzDsYjKYYGf9ePXls1Ynyijwfr5QDwJ7XpRuqTn/hFQvp6mbHj20v/HKfMipSY5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9At0WK1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9At0WK1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso17786565e9.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Oct 2025 03:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759488830; x=1760093630; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Jq1nFX8ssmKPjRdYEcACdaY/2lxp/Z6xx9OphjWlEk=;
        b=Z9At0WK1wCT8qJr22rt6ZWXeAvmZ4t1mKL4rfI3MqQAdEB5dlgv71XHIrJZ9eXwLSX
         NjafD1mhi0rCnsqYMZfGcFoBf7fWrBgTZc0EXxYoXnu54ewCbNQ/zpwa3atR8rKKbVE2
         OIBLQ9qeh3Re9pqKDFJNekqtQWaUTT//mESCN5ZNnjCvYYl1KUPPr1tzOTVV537WTQEE
         KL719a6n5QOTwvgKzs7x6mapbLnbrIB1odmrsOFuxwTp6OskONQTIhSWPDA4Aa/7oUbx
         okGFNDKTXlF/4e5z7sk9GBbK2ry15MshtoTO7pSeDbt44ZZjZ04QoxgLc1Sdea0Fsp99
         /kUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759488830; x=1760093630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Jq1nFX8ssmKPjRdYEcACdaY/2lxp/Z6xx9OphjWlEk=;
        b=LamTbnC4VahPF6ptnfNj1pGJ4UmGj9LVHLoKtDqD/kswD+bPoR2aLVFwcFZUpmYGOB
         8s9AfungsPIJStICwwOXxnO2wWfDVhAHJWZ5ONmn5sMYh1uER57UkKdcM9O1wLUJ+Qz6
         xjcZItye4yV/lxQOYTnN5+WTRo0z1K1+jSNQ3KAJVT4/ytLfB9pa+nLdPFN1g4AvxPQK
         eIOxDNnv70IcwlSh+PnwvtmKi8UCAyTFcymYJLY7cDUqKr6eNmDjhAyrs/WJ3/1cdxdC
         zV5UHpnyK5AKcBFybAXvGgYxLKSq77W/tXqo4RyZ2FLWQJr5HRgL75cnKKQG6ZSVjxMW
         vZFA==
X-Forwarded-Encrypted: i=1; AJvYcCX1TYR1+8X1QsJdrs4TFYxSLvoOHBZ7eEfMZiGANVRrsdI5rmahAA7IxWfnnfpfnMw4a9RVaBJvXDoOIdXz@lists.linux.dev
X-Gm-Message-State: AOJu0YxMW/NeXRgPY4CCJNx3XOGkkkqmxI7gvllA1VYeVNmrW6OlM01s
	1q69wY780W95H6vSOn1YMKWEUtl+MFyuRrlg2EdnaAJ6YbYGQuo/KhQ2r92vylqTItk=
X-Gm-Gg: ASbGncsuJvYlyUV57j2VMWUB8f/YrwCHkzLMsfpp7nzXxJHJBN3Z6lfYN/4btezPvWH
	yrS79XO2O2nvlbC00duJViWqpdMeVfEhgqyAHM9pIxezsF7018OZUZzqzvPlFsx01SYXCirQgyC
	Y/cUqCeUJRRtgkt5fsJq7GSy5gNccrEIsfcABL3sHCLjSb/Cm65pfS9CU1Fox0snVBXfl0BTG4E
	iB+01wGDbaJ8btY74dILb0nKbOkVnunT17Yox1TO4+6Vg7xbUYBYvQLl2Tzm3cGzcw8al4DMujj
	3pNNBYgPprWOOhs5QXaaOjyviAYfDk1pHf2fhKH7UbqDHmqgKXFFXy29vwN1vgjKMCmwiJlqAre
	dlxrrILfUU2bbtzmwFh6hnqMxrREiEB+8S65LPT3jUxYf0HMNHjZaq7Pt9kqH07pVm20=
X-Google-Smtp-Source: AGHT+IFKI8vo6YXEW6ISLFO/Qw8pm8IzIzu23bQ7h92y6EJ7m/68WLpBHtBfd+86xhRULF05lq2UJA==
X-Received: by 2002:a05:600c:4f08:b0:46d:d949:daba with SMTP id 5b1f17b1804b1-46e7608b683mr4836045e9.4.1759488829930;
        Fri, 03 Oct 2025 03:53:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8f017esm7511774f8f.47.2025.10.03.03.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 03:53:49 -0700 (PDT)
Date: Fri, 3 Oct 2025 13:53:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: oe-kbuild@lists.linux.dev, Qu Wenruo <wqu@suse.com>,
	linux-btrfs@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/4] btrfs: make btrfs_repair_io_failure() handle bs > ps
 cases without large folios
Message-ID: <aN-rOq9boL0hXZ3R@stanley.mountain>
References: <202510030550.mqFoO0Dw-lkp@intel.com>
 <234df03b-e6fc-44c8-a28f-aa51305d87a0@gmx.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <234df03b-e6fc-44c8-a28f-aa51305d87a0@gmx.com>

On Fri, Oct 03, 2025 at 06:47:11PM +0930, Qu Wenruo wrote:
> > cc53bd2085c8fa David Sterba      2025-09-17  885  	if (unlikely(!smap.dev->bdev ||
> > cc53bd2085c8fa David Sterba      2025-09-17  886  		     !test_bit(BTRFS_DEV_STATE_WRITEABLE, &smap.dev->dev_state))) {
> > bacf60e5158629 Christoph Hellwig 2022-11-15  887  		ret = -EIO;
> > bacf60e5158629 Christoph Hellwig 2022-11-15  888  		goto out_counter_dec;
> > bacf60e5158629 Christoph Hellwig 2022-11-15  889  	}
> > bacf60e5158629 Christoph Hellwig 2022-11-15  890
> > 2d65a91734a195 Qu Wenruo         2025-10-01  891  	bio = bio_alloc(smap.dev->bdev, nr_steps, REQ_OP_WRITE | REQ_SYNC, GFP_NOFS);
> > 2d65a91734a195 Qu Wenruo         2025-10-01  892  	/* Backed by fs_bio_set, shouldn't fail. */
> > 2d65a91734a195 Qu Wenruo         2025-10-01  893  	ASSERT(bio);
> > 2d65a91734a195 Qu Wenruo         2025-10-01 @894  	bio->bi_iter.bi_sector = smap.physical >> SECTOR_SHIFT;
> 
> I have no idea how to make smatch happy.

I would just delete the unnecessary NULL check, but an equally valid
thing is to just ignore the warning.  In the kernel, all old warnings
are false positives.  I'm never aiming for being completely free from
static checker warnings because that means we have to be less ambitious
about what we check for.

regards,
dan carpenter


