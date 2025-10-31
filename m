Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E392236EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 13:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761918162; cv=none; b=LhLnplPaj/keY0JK5dObOdYP4++a1T/8v6Fdkmk/LhgAp/01e/O1jfEUQkGivffso3gMqu/qjoGu1s4SonKU7XrE0XTwPltdI/TqqwLUri02h6mOx88gsswp757YKLCjx6LcZg4yNj/qzUedXOigmtXTBlW3jDAjKxG38aLmkYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761918162; c=relaxed/simple;
	bh=2EuZPp6iiAor3qSHhoxp+TV6FSvUxVrS44tAjEFif+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dmWFAG1aJ5EzMyOCCM1YByud0+VafiDnve+V7lMemdDT8rhT7jNGCeXXAL2JwCgkel/Pzcdx5D08QCSIycao7qHMSKgAWYF5FGzonol9OOIsHzpwdzJypvx/xlpoPHLB3JpxnHXGtRz4ajlJLacVJkwgSmevXusBDWLSCKlRtr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=MIQLCRaH; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="MIQLCRaH"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8a1744d9b8fso294334085a.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1761918160; x=1762522960; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=njpOP5qLjsmm+goYm8hA16YQgCyFH9JxfoHaSdz75Hs=;
        b=MIQLCRaHTjiLIbI58nLDfbj9FtQ6Krvmy6Fe1AohFPHQzlI3q0ghMfIzj4uKy0OO3x
         gCrzP2gvYOPg7u2Bquzu4/DzVA4VxdPyMVnxUbtvPHTk9Gxvr3FUTIc3muKP8Rt9/pFn
         duiX1LII3FdGF7oUixKxeLOF2Om8YwkhoASsbqaGfPISnasdD8SL/ZcH3Tlydw0D0dkn
         TaWNixuumKiIVhFlWGUaj0KkZTOJcM1CD0yHlopC0sqtLKOstjzEQMmcIObXBcN/KLbQ
         /p4KS+7QafoEY787D9UFLr5UmhzRQ0++51VlE9674lw23QbNsrX92cdsWfOZGp36wV7t
         GSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761918160; x=1762522960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njpOP5qLjsmm+goYm8hA16YQgCyFH9JxfoHaSdz75Hs=;
        b=ekPB8zJh5afIXp9VHiAaXxxHTLiQHvTjlc8pbiVfk/3w94oLuhuoIh3oIeJvmtmgLm
         bNqYiOswq6ZoS3e6Cm8cQF3lUg4S4Wid1seI23vDpNi4b9CceuzSLdyvkuKTc/gcmMh8
         RE399PRHS2oHG8m4gId5+j7T7eHyQIOGVbZRJhkPwciNqCUuhMz+BZdNFWWlCK9Bze3M
         PADv8MEJbQvnOu91FeJgwdnxNqpOPFTgMhumITzxU7GdDKBysLMO3NJvIGHFRxtdVtXF
         65ItI1DxQDEfcoDcnvhaZm2IWUWwggzagkAyfXehX5weoTDvDGrvYqeV9ZCetpNy4vjF
         Jn1A==
X-Forwarded-Encrypted: i=1; AJvYcCX0b1pCZ8hsV8wVvGZCHt1/xkVRQHBlUUoyqASKh/Ytt85dGt8inewE3oiHl0EsU/Jo/ZFsOz5bc5O8ea+P@lists.linux.dev
X-Gm-Message-State: AOJu0YwWqHAQuX1VNoURs9MAdMonr7gtHJbMqWzs2gVI0oOB0NaBNl+A
	ljfk7sZzMWJLLQTqlZMDV12GoHPV0l9brRAe/tLfVLJ0Ws2EHBEpBMEAgRfLq1XHsxA=
X-Gm-Gg: ASbGncvr6IP+biIahNSBOuTGVJQXdCwX+xuvZ6eoPzp4hDGtxkCl3Oyjup60vkd+h0R
	w8Xf3y8Dj2ZOCITGaO4Q+RWocaHNKmPKAsHEwYQshu1Ssyg45Pm+hTXjO8MSIzuFf1Zm7p91zif
	TvO7T9if4F73KJjdNY7/GDyFNwWCVnc2qURy810u/IyUFLyc8lZX6ILBmYV1MGZbxbcjkRPZTod
	FUFpmUQfYtxzW0k2qsqxreXhL61WGA5dCFsZYx1hNq1VVceqnkcmTuqFkMZjwNctvok84+xLq/g
	E7WNi5eCg3tdukgSxW1CSQOyXHYtGE9aYy3OezTyuuMq//XQzpVd94MimdDAs4p65ZUwLdTAG6a
	RDAAXpvF7ayldph/bv/WxZjnO+uvd51xGQwn+pvaapbvd3dr+z2fka6I8w5CsHiJnjIoqahV5S2
	Mryoimqah62ks6Z6ruCV8LE+ngoQkQT69sYlN9vqjO+fW5d1Jd40257aEZ2TA=
X-Google-Smtp-Source: AGHT+IGI8y8YIPM3S6yMnHOJ6VxcbdkbS8NWxjTOpRsE5kmW+ZuRWtwB9gd6TlqHaKBjY4fr8ejo4g==
X-Received: by 2002:a05:620a:28cc:b0:89f:3fa9:d2d4 with SMTP id af79cd13be357-8ab98eba4e2mr437021985a.15.1761918159702;
        Fri, 31 Oct 2025 06:42:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ac00a9a851sm111552085a.20.2025.10.31.06.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:42:39 -0700 (PDT)
Date: Fri, 31 Oct 2025 09:42:36 -0400
From: Gregory Price <gourry@gourry.net>
To: kernel test robot <lkp@intel.com>
Cc: Robert Richter <rrichter@amd.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>, oe-kbuild-all@lists.linux.dev,
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	Terry Bowman <terry.bowman@amd.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: [PATCH] cxl/region: Support multi-level interleaving with
 smaller granularities for lower levels
Message-ID: <aQS8zJ4p-r5iSgd1@gourry-fedora-PF4VCD3F>
References: <20251028094754.72816-1-rrichter@amd.com>
 <202510311413.HdTizWHK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510311413.HdTizWHK-lkp@intel.com>

On Fri, Oct 31, 2025 at 03:03:10PM +0800, kernel test robot wrote:
> Hi Robert,
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "__udivdi3" [drivers/cxl/core/cxl_core.ko] undefined!
> 

IIRC this happens when you do 64-bit division because it's annoying and
complicated. Ran into this madness in mempolicy.

~Gregory
