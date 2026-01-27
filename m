Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211352853F2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 20:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769546912; cv=none; b=jmz08R/3jy9b7B3lzzoJwmagNMGjPjXsxM76jalU0oHGnD3DK083JcEM12X6bF1Sqoucrye1nCdXUhhaUeqs85JTYKOUO5iAZA/NL4DZjY2AFjvvdfOgCyeTP4gSCHtID0ANxeqTmu+8E3jtgzUFk5HpHjJwFIMuruxl7HSJLIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769546912; c=relaxed/simple;
	bh=VrpG/5fjPAJmxCRHqaT/bh3KQR0TfOmqRHxxtWMxe40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgDTFkFAjiG7Xs/PVbsVehpiLej184RzYNsPsvyVQyRopzZu9ZQjr1WgszE5lJ8yMgEsAjAFNU9L6kIEHzjrhQZt3PY/EOzlsPWJb2raIDRViw211PbKahVHuKH6vpD09YXLmCVXvQ/iSGlmeFdlGa0xohY3YtJR/H5/LMZuJTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dLsCdQ6u; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dLsCdQ6u"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a76b39587aso3105ad.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 12:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769546910; x=1770151710; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxQ/jJ5+RCHFOsLeGzry/OBxfQLFoCbuarfI17mm5NU=;
        b=dLsCdQ6u2vcrdBaKO67CxMdOF25CLNsrmJch/qI4nOedDvhAxtGq5AMnYX9pypeN8e
         xx7XzeSq3MVdSKNcShMMIMf5GPNLUaYcaD6H5nOo5J5rJVOy96jFYAoaKeemU9M7au1p
         7CvzUKcyOq35K/0FavgtI63W/LylwIeNAb5IBR9NJp+Af6ar1EX/OgKAxT5oKMD6/G0m
         NPOgL2egpawTP5uMaM7T4ZeTSCUaxFUdYxj6apMNYLuZXeuACxd24y3Q/Tm1nXNXAJlU
         Co7ewfrBXPjFrYpOtbB85QYDrEsGbxD30nshBhMqnmRH11hghl/L8rgRtzSC1F3i2u2y
         a1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769546910; x=1770151710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxQ/jJ5+RCHFOsLeGzry/OBxfQLFoCbuarfI17mm5NU=;
        b=Ok38sef6kY8KXV8lf1w4SQzlsbagabF3Ium/DRez2T+ukS8dDqIlHd7Qb3zT6obdQy
         w7oT5GUKGQGpY5HikaNu0hhgqPiA7n94PT+qocyoXheglm5JvFec7lAmEDpJ77/i5lmZ
         tqqfk8DlsrFZz8MMg+DvW8eqC2r3SF/aiPoCjv81K4Q8HkGkpnRKG95z0Hzvo9vx7NvQ
         skHF8uet0J4y16qtdU2Sn5wCXcCppYcMlYVUquXNJU5VvBm00PxYUcEOCfhOozV0UGgt
         nBZ7wCAuWaz4nt4Mn/B02qggQ/OfAaNsQl5uJIVZkUA/Nyxk0UcPBHMoybuTih65PT9D
         BxiA==
X-Forwarded-Encrypted: i=1; AJvYcCXldSoopsq8xHckti76Ykcoo0F7Ed7MSpK+m7lwlR4fs1M2+LH86v18Iu1Cu2DLX2dadzyHd6ndl9/gqevP@lists.linux.dev
X-Gm-Message-State: AOJu0YzEDYBgWcpAaxlBocJ0Iqzm731ucyL9+LW/iXZH9eHb7NV9Y2Jj
	JOqxc5cF9eBtUg2nhScYkRm/CXLfX5aN7xDQZSfX9hniHm3eC+1ytxgrPCJ2AtUWdbWuK0h1e3b
	3OOp7hA==
X-Gm-Gg: AZuq6aKg9yFpCSfJZ7pbxyY+ec9MVnaMEz+phkVLJyI4Oys/GffDBtZr+aasFNVE/bg
	0UCJPnPV2LkyYDCkWN7on4nv8PY0baRCWBag9aH9pAywmMG1hI3DYmVRWbDr1tPiFl46oLcGLdy
	2ONDcM9DCYpF6YntkOeqDEV4EKS4nabzIWADWLlMY0fD29B2BqLZkXsIw57FOJ91b6UcjNQgkBT
	YtLxPkHIwsiAqhOXnZZ+/InlfnTXbkWLC9WnxdyfstXep52GqtBM/NanoVdpXLp8TbNqrNgXVRm
	lVRYo7Uylyw2HxVDZ/ybZ6yNz0n2OsCdZKmxZC+f/yQNNRwExpxXaKHQwcpMhD6N6g0VWlcFuee
	5h2zKtwXOIqmnuVVRILJQNLCvP225ViTAnFECWz4KCRKWudk8/msr+PYJD7ktY9LdjbnAKcyqOC
	gFVcJ9IGiai1hAzHN4g26mW+lvodiUqGOi21Qn9nbMJU2Vc/nTTqI=
X-Received: by 2002:a17:902:fc4c:b0:2a7:516d:18e2 with SMTP id d9443c01a7336-2a8708e53c0mr3360475ad.9.1769546910204;
        Tue, 27 Jan 2026 12:48:30 -0800 (PST)
Received: from google.com (28.117.125.34.bc.googleusercontent.com. [34.125.117.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3e04sm2043315ad.46.2026.01.27.12.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 12:48:29 -0800 (PST)
Date: Tue, 27 Jan 2026 20:48:25 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Matt Gilbride <mattgilbride@google.com>
Subject: Re: drivers/android/binder/rust_binderfs.c:134
 binderfs_binder_device_create() error: Calling ida_alloc_max() with a 'max'
 argument which is a power of 2. -1 missing?
Message-ID: <aXkkmSB06Blnk3kf@google.com>
References: <202512181203.IOv6IChH-lkp@intel.com>
 <aUO3ES90gStGvjxn@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUO3ES90gStGvjxn@google.com>

On Thu, Dec 18, 2025 at 08:10:57AM +0000, Alice Ryhl wrote:
> On Thu, Dec 18, 2025 at 10:17:52AM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
> > commit: eafedbc7c050c44744fbdf80bdf3315e860b7513 rust_binder: add Rust Binder driver
> > config: loongarch-randconfig-r071-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181203.IOv6IChH-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202512181203.IOv6IChH-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/android/binder/rust_binderfs.c:134 binderfs_binder_device_create() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
> > drivers/android/binder/rust_binderfs.c:418 binderfs_binder_ctl_create() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
> > 
> > vim +/max +134 drivers/android/binder/rust_binderfs.c
> > 
> > eafedbc7c050c4 Alice Ryhl 2025-09-19  130  
> > eafedbc7c050c4 Alice Ryhl 2025-09-19  131  	/* Reserve new minor number for the new device. */
> > eafedbc7c050c4 Alice Ryhl 2025-09-19  132  	mutex_lock(&binderfs_minors_mutex);
> > eafedbc7c050c4 Alice Ryhl 2025-09-19  133  	if (++info->device_count <= info->mount_opts.max)
> > eafedbc7c050c4 Alice Ryhl 2025-09-19 @134  		minor = ida_alloc_max(&binderfs_minors,
> > eafedbc7c050c4 Alice Ryhl 2025-09-19  135  				      use_reserve ? BINDERFS_MAX_MINOR :
> > eafedbc7c050c4 Alice Ryhl 2025-09-19  136  						    BINDERFS_MAX_MINOR_CAPPED,
> > 
> > ida_alloc_max() takes the maximum valid id not the count.  These should
> > be BINDERFS_MAX_MINOR - 1, BINDERFS_MAX_MINOR_CAPPED - 1.
> 
> Hmm, this is reported for rust_binderfs.c, but looks like binderfs.c has
> the same code. That means the bug has been there for a long time.

Yeah, this issue is also in C. Although it seems far fetch to reach that
number of binder devices (1 << 20). This still needs to be fixed though
as (1 << 20) overflows the max value for minor and I don't know what
happens then. I'll send out a patch.

--
Carlos Llamas
