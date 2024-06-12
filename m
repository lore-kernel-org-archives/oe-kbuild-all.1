Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE12E16D9D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 10:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186770; cv=none; b=eXQcRjzvomj2Va39rjKSU22D1v8VvSjWmfHDnawCF2FZsjv0Gv1UwKifsSvpMkh56qz+g9o563nusyY568iE7/n0nIkbH40pZIUuBYls2a6t9vKMgIKyCGivN4WabbGa1bNI+h8Omx1X3oyGGc2IOzj9RBzJvjjhK53P+WlpYy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186770; c=relaxed/simple;
	bh=1A6bZen+Pwm2rwGjsZWg11Hh3DG8ekkj4TMpCIOx3uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiOxIeV0A1qujvJziPzxheeTanXxL+rrFWn7qxduJ6MrA28Q9KOVVQvSzfGbZ/A8RHchoEyAuEWCiMpJ0HKa22KCgXItKLefoMnWMm59ttGIc+Q30W5GZeFHLBSl6O9vH/OjwQAAX3KQCqqloiXxsq2oyE0O5+0bjbD9Doq9m6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R4fAq5aQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R4fAq5aQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-421d32fda86so31114875e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 03:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718186767; x=1718791567; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j7GQT4sb8fOqdwN7qErmxIxCia5GY2ESmxbkweiG4mk=;
        b=R4fAq5aQf3w6+H1PjusTwYjiJm0UDecwi+2imLg2whmoxVQkd/6B/AeRS4JJXqyYV6
         pUr8W6/ruVoqAFlH7blwc53LpfkfQIFo13QzkT513HIb/utTjVRVFCjtxPhuMFiHggMN
         G3oxIjYPFbNYmGDNAHg2NM+PUu5LDgJrhZLzEid/nqaCr/KnWZ/15u3VE1FoWhXhx82M
         YVUyS+0j4HenEMgTCWX1JV6uehSoNov3kPHWDhTix6g2ldJWmM6ZTbWjc3nZ1E7k6P9A
         ReKRC1keBRmrcxF5Iv790eACMeMhV+ONa0H24UxPbpTWru7mGrDOO60zerufHmeNemvX
         7imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718186767; x=1718791567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7GQT4sb8fOqdwN7qErmxIxCia5GY2ESmxbkweiG4mk=;
        b=PjE4Nze/6ZY1wS2exM4tcvK14KcEwDeXuGTcr3ogX0I6YYPA6YqqttD1iSK9DSmhsL
         jwofSOLRPju6JWa7F34OsSOLySYRJjZ2EpwQkYceAiAh7uYIkjJ8s3mm1wkaKEE3NfKQ
         jEse1uDmnKzNfq7UhJxnZzOzj+APWSrGaJv1I2ZBvqetA23luA0nFSYCEN88eiUFOlL/
         xtkqPwIyWJKPsIzuM7znvpKLF1QASCFXd8K+OSbEQPqTIfDNf8KTgyRGyIAeBATBMB87
         CHo5GZrbg17yzzX195VsIuVGIMajlKiwgVgT+2+dwzpyIXsn+PTBDF/CGnTDhmUKs3I8
         ya1w==
X-Forwarded-Encrypted: i=1; AJvYcCVd/uGTrS7ltFqIMU5ae0jp/GsdklPkOt1KkgzbSOExysjgXnAJUtCj/aaVcZHuKhNHeRWF/pK9OXtaM8WPio6SlcKZIprg9HSu/mgARA==
X-Gm-Message-State: AOJu0YyRc7pVSx4G5l/APSOForU1y4iCgnmyEQ8r7m4lXMbU5lTocAAQ
	KtyyolTocQzRud2W3thpdN9C0+18sAmdPkSYE2FRxcWT2NyDPujdFEolrXb3Q2w=
X-Google-Smtp-Source: AGHT+IEc+w6vERYyx26ozDlBXedCJnqiKgmj86kpCTQ5mYYcm1u2cnMPFRH40yWhGkpp8pMqt5gJLg==
X-Received: by 2002:a05:600c:4f4a:b0:421:f43d:dadd with SMTP id 5b1f17b1804b1-422867bf628mr16526785e9.33.1718186766848;
        Wed, 12 Jun 2024 03:06:06 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e73c7sm19643925e9.42.2024.06.12.03.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:06:05 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:06:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: oe-kbuild@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	ying.huang@intel.com, Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	John Hubbard <jhubbard@nvidia.com>, Mel Gorman <mgorman@suse.de>,
	Ryan Roberts <ryan.roberts@arm.com>, liushixin2@huawei.com
Subject: Re: [PATCH] mm: fix possible OOB in numa_rebuild_large_mapping()
Message-ID: <81da44d7-e07d-4757-9a67-87c35b62512c@moroto.mountain>
References: <100add53-aa58-44ce-a15d-8438001fb2b9@moroto.mountain>
 <c6df35cc-1331-4255-8ff5-898f6a911bec@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6df35cc-1331-4255-8ff5-898f6a911bec@huawei.com>

On Wed, Jun 12, 2024 at 10:50:02AM +0800, Kefeng Wang wrote:
> > b99a342d4f11a5 Huang Ying        2021-04-29  5364  out_map:
> > b99a342d4f11a5 Huang Ying        2021-04-29  5365  	/*
> > b99a342d4f11a5 Huang Ying        2021-04-29  5366  	 * Make it present again, depending on how arch implements
> > b99a342d4f11a5 Huang Ying        2021-04-29  5367  	 * non-accessible ptes, some can allow access by kernel mode.
> > b99a342d4f11a5 Huang Ying        2021-04-29  5368  	 */
> > d2136d749d76af Baolin Wang       2024-03-29  5369  	if (folio && folio_test_large(folio))
> > 
> > Are folio_test_large() and folio_is_zone_device() mutually exclusive?
> > If so then this is a false positive.  Just ignore the warning in that
> > case.
> > 
> 
> The folio in ZONE_DEVICE is not a large folio, so there is no issue for now,
> but will fix.
> 

If it's not an issue, then don't feel obligated to do anything.  These
are a one time email and then I treat it as addressed.  These warnings
are intended to be useful, not a burden.

regards,
dan carpenter

