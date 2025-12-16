Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C319733A9D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889924; cv=none; b=rWybY2cb9ReTh8Ytw88s4mdhm9iyDar+znckvR3L48wIooxoUEhdJ+DX4YlWWZToLlsEtWVe/ROIQ4IRvjq7xfzK6XeCXlJy+fBJhuGFyuMKblhCwgBclCWI5TAVIAPNVW+CDzlAB5QFIqNXyiEGgp90MAhJmY6b52YvzjMEkMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889924; c=relaxed/simple;
	bh=fjySlG+wDGqoUAaOpS7wlXqPSCjoePl0tLAR0GFeyAw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uLoN5YTYNq4g6PTw/MuI8USbC5KKGqvcOnUEG3hIZgVQAP8f+Vfq8BWAjmzYAz/NiXBPMx4CacUCNqF3azh4cVwOjpq5kU0ktdnogPNGPFfQJK8X2ZCDrbxdQDpWoStsuTEhmgh1nHHbx/M/Xc03IqFg0FVeFgiXDDWRxyFY9rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ma+6aMVq; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ma+6aMVq"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-42fbc544b09so2326227f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 04:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765889921; x=1766494721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4a6mOsfv3RnQ6962mCNsIiYlyvmUIvf225M/JZ00fuU=;
        b=ma+6aMVq7OGTmw9Phad6f2wRhvIsRUfcNQYZ9tJlGie8Osnmc6ulyTC/W58rxyhtx5
         IhbYZep1CZw7NzZnKYazIA8dYIarSFD7RjG8dD7Nnn0cAlOwcClGI/bMTWSmk3yUbUZr
         hy03Lh/WoOsfANWcwI4KjhulwjUCqi0avnD/MEKmhlOmwPIJSEDTJC53aVZ8c++w1l2/
         3ClMNMfaAMnQgFcATkGQgG69yMnSuP0zy4n/aFbCUmBn4LhuB7Znw1413lOi9EdJBLXf
         quyWjdNL1Rg3fj9PK7GRjAwjxiWzGzWoN+z9DuYgXIUQCYR58LDbnI9GHD5axDcpWkOe
         0sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765889921; x=1766494721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4a6mOsfv3RnQ6962mCNsIiYlyvmUIvf225M/JZ00fuU=;
        b=wUXRVv8JkjhMZJ8kHwigPgudRuDBgvIoBIUP5FdQxQGW8im1uF1nZvmcW0khAAf4bM
         L37DBC/S5LEcN8oJIKJFmgsb9Yz7cXtzFkjs4bdnuMd5w/601VQPHkGnv9zAlwqzKwCa
         T1o7gBj5FN7LMkuHvV5sV+a35++KamEFk3fAKnSEo0R2+H49riRzlA2zNXnzTP1y7oL4
         obHorTNgKiGVKFQCYfGiWim3DL6+U7tfaHaTO4XeSpI0cLOQSNd9a26O3I10JqYPUdGQ
         WIL6q0PfSM6Pev+RgSxe+CndFN/ePglvixYFBdI7n8E3GvIcKIONaZtWOW9ueIw6IIBd
         uG1g==
X-Gm-Message-State: AOJu0YyxpMTqoyET9I+Zha46L/fbziJ1ZTBw7vSpnDKjM03lypFYdpdg
	sd7yLb8JaR12TSF1aa1ysJRMtZuXygxKCgZ/SXdY8hYD83XNhe8i4P8/
X-Gm-Gg: AY/fxX5OH6Huj03NutoYWPHNS0+GWcCvK29/I3vV8RKmpVDe8/DxaARveSTFPo3duFO
	msiR5Lh81eFJSYze/DLR3ePMJdfCZfmjEp4mxiFw/7PHaYMTfiNHrNGSLhwxHgjgR2ES4dt1o4D
	KJzgb7k6uS9AN0aygXiwYCP7Pm3NwwjXq+NR6x3MWs/UMIfjMh+STMddzRuediuir30ixa1NRFC
	eFASRCRr7Lj1otebfIslKKAs2DMGVuA2W+8qny0vV8NoOf80pEXUOjsarJI8L/SS+iGNSZzJVZJ
	wsqiGfTVPaeetQ1OVWvfnyz84HD8ZL3SwRVgiuFesbfNNY8pQPmudzyYGHyevWAjEq9BEP80x9F
	FBTcVx44VJ+MDKwi2GOUByC29t9jrGgFK+isDlHo9lPHvOmbP8Xo5nK6iox+r3vHZpAPEzRtr+6
	wvfMr00CVXSsMzlHybD7jmNeFvqevy6N1MJB/i8ztPIKEFHF/WGAsm
X-Google-Smtp-Source: AGHT+IFPgi7TTcjcdd99eLNcHo7wpcpOi8USD2GLgaobtq004FVNQnOS5KgbJ3i0Qdom2oLbozNUGQ==
X-Received: by 2002:a05:6000:228a:b0:431:9b2:61c8 with SMTP id ffacd0b85a97d-43109b263f4mr556895f8f.10.1765882981024;
        Tue, 16 Dec 2025 03:03:01 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b9b750sm34285532f8f.42.2025.12.16.03.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 03:03:00 -0800 (PST)
Date: Tue, 16 Dec 2025 11:02:59 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 linux-fsdevel@vger.kernel.org, miklos@szeredi.hu
Subject: Re: [linux-next:master 1617/1848]
 include/linux/compiler_types.h:630:45: error: call to
 '__compiletime_assert_612' declared with attribute error: min(((pos + len -
 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
Message-ID: <20251216110259.60c84f61@pumpkin>
In-Reply-To: <202512160948.O7QqxHj2-lkp@intel.com>
References: <202512160948.O7QqxHj2-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Dec 2025 09:05:42 +0100
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   563c8dd425b59e44470e28519107b1efc99f4c7b
> commit: 0f5bb0cfb0b40a31d2fe146ecbef5727690fa547 [1617/1848] fs: use min() or umin() instead of min_t()
> config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20251216/202512160948.O7QqxHj2-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160948.O7QqxHj2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512160948.O7QqxHj2-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
>    In function 'fuse_wr_pages',
>        inlined from 'fuse_perform_write' at fs/fuse/file.c:1347:27:
> >> include/linux/compiler_types.h:630:45: error: call to '__compiletime_assert_612' declared with attribute error: min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error  
...

The definitions are:

loff_t pos  - 64bit signed.
size_t len  - unsigned long, 32bit for this i386 build.
unsigned int max_pages - 32 bit unsigned.

On a 64bit build 'len' is 64bits unsigned which promotes the LHS to
   unsigned and min() is happy.
On a 32bit build this doesn't happen, the LHS remains signed and
   min() is unhappy.

I'm not sure why file offsets are signed (apart from relative lseek()),
causes signedness issues in a few places.

In any case there are a few ways to fix this.
Clearly a cast could be used somewhere, the most subtle would be changing
the prototype to 'u64 len'.

Perhaps better is rewriting the conditional as:
	min(((len + (pos & (PAGE_SIZE - 1)) - 1) >> PAGE_SHIFT) + 1,
		max_pages);
Although the LHS is still signed 64bit, the compiler knows it can't
be negative.

This still contains a lot of 64bit maths, adding a cast:
	min(((len + (size_t)(pos & (PAGE_SIZE - 1)) - 1) >> PAGE_SHIFT) + 1,
makes it 32bit and the generated code much, much better.

In theory the expression can overflow (fixable by masking off the high bit
of 'len' (eg (len << 1 >> 1)), but normal IO are limited to MAX_RW_COUNT
(INT_MAX & PAGE_MASK) even on 64bit.
I'm not sure io_uring enforces that limit (it should, a lot of drivers are
broken if the requested size exceeds 4G).

	David
