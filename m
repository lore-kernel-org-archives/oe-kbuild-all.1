Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB5A215778
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 05:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682740; cv=none; b=aJlM4cG7pvjvc/ISoHAC5IqkPdHP6HUwhTm7wIEzFBapF/ZclINdJBRhcFqvhnCbcZpiqOOkCJ5Gk2j9WfVMDTqaK0ZfGLqQfIwX80vhL5pDIZiK+A5UtawSAl+dQWVGkEJ5GiI9CFDTqDHqGeVSNylyHOLl9kpP6kStFDkIvZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682740; c=relaxed/simple;
	bh=WPfaW0cQFoc0vUNbrk3nFmHIyx6KGVJyt8mp7eMc1eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZcIBkT1vUA/xWIHkVV+jHAxfELvG608IzROQ34ZcAWh1q15V225J9KRLSVw7xiKmri73IrsHeffHjQkL/kPnLhbDbsW92zwP6F/ZPgcIwFGt3/q8vphfKRPg/Iy6o6Y52dqKzR0ZXydiVVDZAntFprB3BDGMypJ/aLIk+1TtVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OHHqtlDT; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OHHqtlDT"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso474131f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 07 May 2025 22:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746682737; x=1747287537; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3k4PEhU6worlCKck2U3ds/0NKF9gmmTtGy9MuzRu6o=;
        b=OHHqtlDTC9h7cUaGgkgCWPndNvjxxYE4HigLYynWTxANO9YHQS+FCeC3KhHjZ186/i
         9UJVgvBlsqlKaHIF267vohAo3tsw/iQVFqU0EzmvQ+OtU9YUdH86jp5+KeaD+SYdaJE+
         iasPP/wQLl8o2F6P12k0NZCSd3vLdYTccRvN1/iNjPDfodNArTJWqozBS54PuggEftVA
         Bcmh21L5bG5XsIS3OgKcv/3sUpm5uh7+lN3TbITgdFbOu3IAAMYvixzatLkYE42auKyX
         hTCQ0jZHSR/nKq1yuot4Z8XXxhBJIF9lwFkaDeWlj2+j60UiaU21qBmEZeVHsACf1Or/
         VDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746682737; x=1747287537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3k4PEhU6worlCKck2U3ds/0NKF9gmmTtGy9MuzRu6o=;
        b=nDWU8iDDRPBT3X5NQP0cl8V+oaZ12mzoRadOoIaw3XUgG2+5PCOYhp3EY7qjGbSl7L
         DyaFTcCT/MTmyGOcWcI6tim/0joun+8d3prMQ9ST9WZ5q84im3cLLMprg71pf5GbLOlc
         qcD+xH/iszKrMMIQ+GwC9NNdqHEDx8nz2meEzVXqFMfJ2VBl1DtBnDGqGPuHWZQo1CLC
         xy2OhlE+O3m/cpuQsHmr7HxvA5U1lwL541hbHredo/NST5Cu/sZyuQc3mPkoVqtseOCM
         yc9kW6/6v4i3aiJvBLC0UAiPUcUYpQi7mirQkJgX4B4382m8KEa4GPpqwb1T+dmi293E
         eALg==
X-Forwarded-Encrypted: i=1; AJvYcCXOXYTIf6Ef+5tOQMbWPVyYJeL33sPmCzsBt9V6jI8NZxTSvfFEcmbxQrHvziNuJSKsDia1PpijHGuzmT23@lists.linux.dev
X-Gm-Message-State: AOJu0YxNyjRPNZz1fhXzGGiYhoEZ5w50+NUb3Enbcx5l1wakNSFdoyvn
	+ITx5phSARlpVM4FDWusw3aYvDDejlZ5lpQNG6n0B6o1JCjmo3BY3TJXVGsiQoc=
X-Gm-Gg: ASbGnctQANmqDyD64d3qVGLRJ7qYIg2QamUbxmONCKNs5RcU7jcGlZ6FEFddYo/DgeG
	aOFfSEXGCiWMQBQiQs2qgXsB7r4WUgBmsKH/VTsJzjlCRqEw0NbFZFP1p4HbD2uafR7X7rlhY+W
	JwwP/Y5s7IzN7ZuNktQjHdZZZgfyupho1RxgFDSZ4HgYWmvVtwukLGVk7NL4sfLyotq+6eYWQ6X
	kUUQQVJqiyu7KNpKs+BG9Y5HR4FDXFndqDRPVdjSDBcScyslT8ame9i0WQKLLN4H9Lnd7WUcu1j
	+awa7SVRYz2iXnJBdiic3+9AtWESI6yO9Qot4cgW6uQ1TA==
X-Google-Smtp-Source: AGHT+IF7VpQhE++cMJ/0vycInQosYNQwdOLJveREj7gdb3HDRxdShvggZtkV4ZOpk2gw61u1hDiO5Q==
X-Received: by 2002:a05:6000:2dc4:b0:39f:ec:d4d with SMTP id ffacd0b85a97d-3a0b990e465mr1470004f8f.12.1746682737319;
        Wed, 07 May 2025 22:38:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b0ff8esm19098105f8f.79.2025.05.07.22.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 22:38:56 -0700 (PDT)
Date: Thu, 8 May 2025 08:38:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shivank Garg <shivankg@amd.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7893/8235] fs/jfs/jfs_metapage.c:245
 __metapage_migrate_folio() error: we previously assumed 'mp' could be null
 (see line 235)
Message-ID: <aBxDbdW9KNe3mBAB@stanley.mountain>
References: <202505071850.XaOkcCkX-lkp@intel.com>
 <21037c25-b85c-48fa-bdac-27cb3be2ccdb@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21037c25-b85c-48fa-bdac-27cb3be2ccdb@amd.com>

On Wed, May 07, 2025 at 05:19:52PM +0530, Shivank Garg wrote:
> 
> Hi Dan,
> 
> This is a false positive.
> 
> In metapage_migrate_folio(), it checks if (!src->private) and only calls
> __metapage_migrate_folio() if src->private is non-NULL
> 
> static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
> 				  struct folio *src, enum migrate_mode mode)
> {
> ...
> 	if (!src->private)
> 		return filemap_migrate_folio(mapping, dst, src, mode);
> ...
> ...
> 	return __metapage_migrate_folio(mapping, dst, src, mode);
> }
> 
> Then __metapage_migrate_folio() calls mp = folio_to_mp(src, 0), which returns src->private.
> Which should not be NULL as previously checked.
> 
> I think we can skip the mp != NULL check from 
> > 39ed4d1a0e03ce Shivank Garg  2025-04-30 @235  	if (mp && metapage_locked(mp))
> It seem redundant here.

Yep.  Just delete the unnecessary NULL check.

I only consider these a false positive if the NULL check is
required but it doesn't lead to a crash.  For example, there could be
another condition which is equivalent to checking for NULL.

	if (p)
		p->foo = 100;
	...
	if (!p_valid(p))
		return;

	p->foo = 99;

In this code, if you have the cross function database then Smatch
doesn't print a warning because the NULL check is not required.  But
the cross function database is way too slow to use in the kbuild-bot.

regards,
dan carpenter
