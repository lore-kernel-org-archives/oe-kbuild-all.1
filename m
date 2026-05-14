Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46246426ECD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771554; cv=pass; b=Nd7M0POc8i1p9nLYtQdA6TnnIkWOMF7fK2Gjm3gHVY3AZyR5mqOuK6AH/ErlGSVdpSIMrlM7T/MDa49wHpPY6335lYhJPqjb01qraZ7jGkgdJrmGKGWCjInb1iXktd22Plhs5doTauzfYVAfTgwyHF/0pBMNwUqtbY9JUU52Bqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771554; c=relaxed/simple;
	bh=9nLStDiEaNHMUCjehXYuLHXRvSgJ48MvlH7ZDuLcviE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mjha37mwrLeCShRJMS8aWvOnhstaHKufXlUIJGyNWjUoIv4SguS4JNZzMGaYTzWjjO1K6sSsYSm4ydQUnqu0e+ewCtG3wGy+8jgiAr8FY2kjZVhnEDzaiysVNXYcH2mTAXhN320JihlnNSzj+ouVr9qnE4mrnavH/imxgd490xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D6Ht2Tl6; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D6Ht2Tl6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso73765985e9.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 08:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778771544; cv=none;
        d=google.com; s=arc-20240605;
        b=bNgqDMeFX4aNKHDIkefZZrApzRh+js282ZcX1QYk4K9rhL33GbK0gzdmx7QDyIQZrZ
         uV1DRpoEAKZryXSFCqQX0lBJro6SZ/X3xOIclyUec4+JuQAAdqSwQD3BL1BxbBaqWuYN
         0ztNXrYF+dmJRyVC0XFzGwDfTj+lH3q1Q5z54S4U38OUftS6RgKYJctxzGj7f+6ijjzc
         DDHxU+7QlZ0jX8DYLM8B+8u0TMUom/SNdfmFNNHyXzMQWErmvttPLq2EVgWKsUXVgRJ1
         dP4n3GO1Y3HpIuBBfRVt0GRW1hBEUGlDloOq1gjPECxy8uLTaFNVKllmIRABd0PdLcsY
         0LRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RGcE/jTsBOG7jczVOnyAVkWwzBB2B7HHg7u4izrsggc=;
        fh=OO76Je+RP0gwMTaQx/3Xc8mjf4kTh5fKt0Fjf4OgmzE=;
        b=Q9T/cQxyLCyUoPOIjjTATV+ZSDxB9086QSL/12+lz8teTbxaf3Ksg1L/AQMtx4lWM0
         4VyhM+oJQeFKBRN3FnMVuY+FZk8o1kP7x4Y8LPUoeEGxzGSIXSZnwk2+7kHegb7wYKqo
         jXbiMlWvT8T7umNW+pTb+24njKNIzIr2AqJakQQNaIE9INDgHkYBfYCzVI5PU42KDH4w
         sc6yUsQRLvGYngEB7s2WomEcuFdWoaE0RJLvZgJPp9jmp1oUWQzsOtp5VHtEEhx4t0oj
         PqrZysU0qfmC0YAYWCPAO87CsKM8ZNef+5cUaHbe8Gii4tru2HbTCEl1m3bbHnhvEPZJ
         0MDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778771544; x=1779376344; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RGcE/jTsBOG7jczVOnyAVkWwzBB2B7HHg7u4izrsggc=;
        b=D6Ht2Tl6qvh3moBlsR85929ppJWmpYk3sMtzrHXk0f4vmJtMRzJbszLowmZVa4aQbn
         pNKjcx4SWOb7DUP4osdmOh8tdsL1A0wC6Rl3Ri93EycAYWPEehhV2jW9Jpq0z9YeUsDf
         SgUDYzJLlTRGk5PU4/GeL+F63G653XUHw0gKCpxtIN7732vKkPVLvn1dQKHq5GG3q9kx
         65T2iv35knCE/edMG6hqcvTkUtqc2HqCsUVtOo7N+MiIvRsMOIFo8+T93O67fL99tWQz
         y+T9fc+PDcSJ3/vbytB8y0YoGxbrgTpDjYgGWmSG6Oamd+4DOzgQ4swZWC3N1D4NQm7m
         1OBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771544; x=1779376344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGcE/jTsBOG7jczVOnyAVkWwzBB2B7HHg7u4izrsggc=;
        b=eZp/6M2+lN1GfUivOnj41zbALXlVVrTCbMYmN1ACnST3l096OQYS+w1npsduqY9Dn4
         ihdiQi20DKCeaIRZIe7rIQxl4u02BBE5InnFEtIR7ZvLarmfj6epmymho+91XhsuMrw/
         wvXjeQT14YsyiLIsJNdtoDRiFi+IJvoEOLjR+kx60nrCpS+045LU7XCqJJ+irLL3ggp0
         zmDJTs1rN9E+QB9oD70uJqIXw0nzoA5tJT/oHN4tHakw5DnD7gPseIeLbboB7ZcJlo62
         ytWXPIJAa+Kea9zxJYzOAV9n1VEDxqyeyMb6puOzjDkc+1yPxZk7se05vmo4mMBu/vo8
         +WCA==
X-Forwarded-Encrypted: i=1; AFNElJ92dZqVhOWI9YCHkUHv+SIwam0GGxBK2+oietzUl8noy2IQhW0KdZDVF8kZtuuxWUhQ+pafVTkA5XZ7OxXj@lists.linux.dev
X-Gm-Message-State: AOJu0YzTrTjnBr+1Cf3xxTs2XvTS8/qQE60gZ1kCtNdsHC+i0ZV3ndGI
	XBk9qgmY83wuLzesNg4WQWhChxs9nrWenEOTykWJCsjMkzxHMD2LmeEXpl/xQzLre/UNsWnDy9P
	ruUiU9cAp5q0bIuEopddm2XIdWQuF3n7axBHiffkeCOYqA/v7JXjHFi4=
X-Gm-Gg: Acq92OFlnBzQARs7+wN8Q6vM+cDdRDGBMtPa7SFZAuN9E88QwvwAUbtG6VPNCrHARuF
	KRbpwRIMXFriMgEbGERzETT/Fypx4sBJ+wuUjfi//C+kAW5yp+zPX3RhZYCxNZHdfOl99vNa7OT
	OXlxg3DysTj9umBqjFCrcPVPjtSb8E+Ro6AissUJW3a1mC04MkMBfZ2dFcNuDAi8YDoOmn+cFIA
	EhyXe0x9Y3EMh0shpEfae6lZfC91b1DeTHLR/OlH7lfHT+1njeJN3kr+KtfdX2lfhMhrMizXE3M
	6gesLbJt5plfkbigRO4XYta+Hou0/GJ4xTu6QEjwg3Ra8Hgk3EcwIXiH+l/P+w0JXftMvmVv+Il
	+nv2RGD5eRNEuHwM=
X-Received: by 2002:a05:600c:1615:b0:48f:cfae:b654 with SMTP id
 5b1f17b1804b1-48fcfaeb761mr64898365e9.1.1778771543770; Thu, 14 May 2026
 08:12:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605140608.mGokLhCV-lkp@intel.com>
In-Reply-To: <202605140608.mGokLhCV-lkp@intel.com>
From: Daniel Vacek <neelx@suse.com>
Date: Thu, 14 May 2026 17:12:12 +0200
X-Gm-Features: AVHnY4Id7AErgVdtdae1NpJgrxBjWSyQIWYvXYhUUpioNSYFE1YC-0xtIKRtqvc
Message-ID: <CAPjX3FegBgD0+AQdeHmrZ1RCc=1k2bsYxVC=JOqEz1JBNsywVQ@mail.gmail.com>
Subject: Re: [kdave-btrfs-devel:ext/dv/fscrypt 1/43] Warning:
 fs/crypto/policy.c:821 expecting prototype for fscrypt_set_extent_context().
 Prototype was for fscrypt_context_for_new_extent() instead
To: kernel test robot <lkp@intel.com>
Cc: Josef Bacik <josef@toxicpanda.com>, oe-kbuild-all@lists.linux.dev, 
	David Sterba <dsterba@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 May 2026 at 00:56, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
> head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
> commit: 519fbe9ff1a258b3c0e1ef231718f0394c7ab2ef [1/43] fscrypt: add per-extent encryption support
> config: nios2-randconfig-r073-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140608.mGokLhCV-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 8.5.0
> smatch: v0.5.0-9185-gbcc58b9c
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140608.mGokLhCV-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605140608.mGokLhCV-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> Warning: fs/crypto/policy.c:821 expecting prototype for fscrypt_set_extent_context(). Prototype was for fscrypt_context_for_new_extent() instead

Oops. I'll fix this in the next version.

--nX

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
