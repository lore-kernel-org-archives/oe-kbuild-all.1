Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F51231A37
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 21:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742594327; cv=none; b=CeKYefxrml0Z65V6MNSd7STLxp1EaUkxt25yN0z/KhJlwT+aGgFEBp/Qno+CJqgCRggIDitXR+CRoiGdMMfn96osT7uTY3B7N1uDoapd1Wj2Xw0UHK+7DKnahXvFDx6tpb3YPhOTZqfsi1mvaSB6Tfj6rh52S7EBDDMfcU1zpg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742594327; c=relaxed/simple;
	bh=MIySeDb+kreajrIhiKfxcsuyDCEoR7Qs/Ro0Lou5eIU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DsshHKx0QYAtaRZdeP3oEfnMxpDukbkmvb+NDrJxJl6I8pEy1rn5alzmETwoK+p0HVyTN5tQTYHgNEVkyqqd4Qxmufz6diBA3X2kM7YGDlKpBPKBWDNY7slm8J+NY02LEOwYcUidyRPKvpx45qSIFV9ml+xYIYdyNWOJsYeIgWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmxLnMfp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmxLnMfp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43948021a45so19325005e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 14:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742594324; x=1743199124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmVdno9JiW66EUzziccNjwwwsJPLYydEw+984DnsTqU=;
        b=gmxLnMfpIXM9pUZPIKIUo729W9P9E/pH2zwC4+vap8tdzwdRZ8a1gfx7mzpMuBhCus
         66woARbcet6xxlrGprX2cM0bEcVHl66Yx0/Qcor7FtdBP1I59v6/NwR00B2/pzODNkoR
         Bb1KTqZIGkgdfW1mCUCAuCbKZ58Mi6Bt7HM+6EC/yE5aze+T+v1dFmB+hMU06Q6NsO1X
         oiOXep6FaZTVQJrhTRMDUupvV8Jk7e4+bBhb7JmF0Kqy/gDPhHCyJWpF3Afjwyo8/6pX
         jKK5B6I7y8jRaqBAI0IAjTAfU4ZAQKjxNFpBEZSD/pckWyl+WUhgpMe1/peGIixW4pYn
         EPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742594324; x=1743199124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmVdno9JiW66EUzziccNjwwwsJPLYydEw+984DnsTqU=;
        b=TNyFlVtGdHOsjC8rbj0ABLy1u78S/6Q9mk1li+qMgEPlu5Jw/TaA9wyGW8BokafdUD
         4pGebt4aSXjnk3faphH2mQ5H0Og+Uk/zra2i40dNZnP9fzQHcL6d6Hmv71yMtckP+sh+
         rsO7t3mctkEOATI7UBSBTfbrMkxWw8Zvd71kYDCqR5RpQtaM2az+qQEv9rU3tJIO/oUu
         JRpRsOxJdIqDeeo0T9xfGM9H+EpTHj1e8JFv1+wC1OY3Fl1f/68MQlVpm70dxZNsVXLE
         GPX8iRmfLJs95bdzhbuQtjzspQ7OgyXvMQcOPhvBY5dyWlOT36cKLeKIlXxuYbf35RDS
         0Qgg==
X-Forwarded-Encrypted: i=1; AJvYcCXa2pf5vqwm+RlOUO6w1o3j6UnzUO2Aj+8zU+7kJROlTPUggLaORnh9hSvPErXbJR3bZE6Xkshx0DtdeYur@lists.linux.dev
X-Gm-Message-State: AOJu0YxIJLatvFqyJIZ/+vdnt64PTz+krx9edirG7Wx7TsyOKsg/Oalw
	feD7JPNecJrqth0UjnmvFaH3c5pbzu2I05mhb+pRFiFLg4RqOSZC
X-Gm-Gg: ASbGncup7X81dSJ+kwQVxHZMSzerHgMTDgl7pBZYVjMmEx6dU+GqlmJ6Gmaa9PDlV/r
	IDfaWObSl3aF014Yf1kDBB5uk5YHhGXisU8C+vjhI2KA1HMGOYmmtwr5J0g/yefQvffErtcMJPi
	TdpR152tOBtfGGUfvwcU4jVcMyT2rvoFEl0J+XDdf6ttfdL3dDNR5Ot+t8stm5stK/lfxWdWPGi
	ZJbnSWFsdYBZdUrQiPmOgpkz4Yt2HB9NEvsMkLnOkT6viX+/dSemWfZ5DQbLVLMpwQBCX3i0ejK
	47KquSO7msUGOLdtAMNWHJA6kKRUBSskW73kt2sM4SGvm0rbUKlQxLhLhbqRAEWbF1caH89kFUJ
	Sx5Q4Xng=
X-Google-Smtp-Source: AGHT+IFeHoHB22UQipfl9400C+XWuP+arx3zZ+LkvJtYR63KKKHnv/Wd4J+oKhJ/M4esH4T5ibKoiw==
X-Received: by 2002:a05:600c:1d16:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-43d58db52e1mr6181575e9.21.1742594323421;
        Fri, 21 Mar 2025 14:58:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdeb79sm89798935e9.25.2025.03.21.14.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 14:58:42 -0700 (PDT)
Date: Fri, 21 Mar 2025 21:58:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Huang Ying <ying.huang@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: include/linux/minmax.h:93:30: warning: large integer implicitly
 truncated to unsigned type
Message-ID: <20250321215838.179be239@pumpkin>
In-Reply-To: <202503201231.VrUIFcq2-lkp@intel.com>
References: <202503201231.VrUIFcq2-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Mar 2025 12:16:57 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   a7f2e10ecd8f18b83951b0bab47ddaf48f93bf47
> commit: 99185c10d5d9214d0d0c8b7866660203e344ee3b resource, kunit: add test case for region_intersects()
> date:   6 months ago
> config: arm-randconfig-r063-20250320 (https://download.01.org/0day-ci/archive/20250320/202503201231.VrUIFcq2-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503201231.VrUIFcq2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503201231.VrUIFcq2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/ioport.h:15:0,
>                     from kernel/resource.c:15:
>    kernel/resource.c: In function 'gfr_start':
> >> include/linux/minmax.h:93:30: warning: large integer implicitly truncated to unsigned type [-Woverflow]  
>      ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
>                                  ^
>    include/linux/minmax.h:96:2: note: in expansion of macro '__cmp_once_unique'
>      __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>      ^~~~~~~~~~~~~~~~~
>    include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
>     #define min_t(type, x, y) __cmp_once(min, type, x, y)
>                               ^~~~~~~~~~
>    kernel/resource.c:1838:9: note: in expansion of macro 'min_t'
>       end = min_t(resource_size_t, base->end, MAX_PHYS_ADDR);


The error is because MAX_PHYS_ADDR is too large for resource_size_t.
The constant seems to have been changed several times.
But I don't see the patch that changes it from DIRECT_MAP_PHYSMEM_END to MAX_PHYS_ADDR.
I'd guess this is a 32bit build and resource_size_t is 32 bits but MAX_PHYS_ADDR is 64.

Who knows what the code is supposed to do, but it is another case of min_t()
discarding significant bits.

It might be that just using min() will fix the compilation and DTRT.

	David




>             ^~~~~
>    kernel/resource.c: In function 'gfr_continue':
> >> include/linux/minmax.h:93:30: warning: large integer implicitly truncated to unsigned type [-Woverflow]  
>      ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
>                                  ^
>    include/linux/minmax.h:96:2: note: in expansion of macro '__cmp_once_unique'
>      __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>      ^~~~~~~~~~~~~~~~~
>    include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
>     #define min_t(type, x, y) __cmp_once(min, type, x, y)
>                               ^~~~~~~~~~
>    kernel/resource.c:1855:11: note: in expansion of macro 'min_t'
>       addr <= min_t(resource_size_t, base->end, MAX_PHYS_ADDR);
>               ^~~~~
> 
> 
> vim +93 include/linux/minmax.h
> 
> d03eba99f5bf7c David Laight   2023-09-18  91  
> 017fa3e8918784 Linus Torvalds 2024-07-28  92  #define __cmp_once_unique(op, type, x, y, ux, uy) \
> 017fa3e8918784 Linus Torvalds 2024-07-28 @93  	({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
> 017fa3e8918784 Linus Torvalds 2024-07-28  94  
> 
> :::::: The code at line 93 was first introduced by commit
> :::::: 017fa3e89187848fd056af757769c9e66ac3e93d minmax: simplify and clarify min_t()/max_t() implementation
> 
> :::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
> 

