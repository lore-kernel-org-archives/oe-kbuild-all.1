Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFD12F6587
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758529349; cv=none; b=Yk3NUBmztC5SccW8MlWHbW4xoW3Rr2wH7nUQITsurDoNxHDSjSVeEV0eMfLurMXjsFz8Lk0UJXNcDRSgBWuxQmKGIm6cyPBfoeyuop79/1nj67AFlziZtAoXhfnxRHAyQ+fcdHjq2wynp0B6Zd/H6XTnpaWWoRE7IYtUA0SL59o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758529349; c=relaxed/simple;
	bh=wcgd5vKAWbHO0vRZ+p4xrg5t4PZ/hiZsS2W2PPEHtOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CU08UfxR61TcU8ajZLoitMfMQLxEa386azEH5em3cBqYHaB2BRqDszBM8byB6aJ5kPOkwV9njeNLR2DQn6QMsOTXpNMzplfsTARZce3hF9KipyQqa3ZiaUhn48IuY+s12zUuBZcXUWnqLYbE0Oi4SXqlqFy5YZMQbHHAnKicbms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Oslv1CnH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Oslv1CnH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46d72711971so27975e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 01:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758529346; x=1759134146; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gqTj3W7IZ9HZZBW9wKpYWsYyOAxKSEoa6COxIZsKaeQ=;
        b=Oslv1CnHKs6SXFLpvAsX76X6ks5SirMVrlduEOTkAWJr0Uza1znYeAonW0vB6xXTxQ
         zNFrkxjccAX8jdBTVpEmwhU/Awm+blgfKPN/yU9DjW+gP5bNANsmx/ATLjV+6Yrs9kM0
         xktfL2gcXgsyPH8rr88VFM1S/83WzRcUvLZI9oU021NpnLXKGzRd/gfOQqZsgE7Ajx1S
         04C/PwdIEbhSl7x0mTwblD45x/6PhGUyWtm7+8+6rK/08e1QffH8dSxB9eiSFbIAruAT
         uF1i7LgT4U+iFwNzE/RBH1+EahyU/JZRQcBPlDQ6Z9O3UyuqIxjJePWL8rfDgdmVI4ak
         TvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758529346; x=1759134146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqTj3W7IZ9HZZBW9wKpYWsYyOAxKSEoa6COxIZsKaeQ=;
        b=EUN3KcTgTEeAMvfA0UnMMXt5KsOfbj7uNltuJYMk5Ywt+glwr6OMZ2jTZUIAIHtj9/
         kdhCkb/dIovIOfFx6FCWnoxM3E8Vb5jWFwaLSksEnY+kOimiON/s6mz85r20+ID6g2Sb
         HlINx9oDNj1dAAxfG1Dugp9jPorgKKJ1R7LeHdN3a5EEC5+7E0MaV3ta5GglI8AEI9XG
         AlQ8zvTYutHb/tHFTQ5G0a4x/vlgjOrDTxLYYZMcv37ulJKfDgzdeVY1FN8xdBiVEjhq
         4VXV/H+S+4PW2zAL7zMkRReDKqi1qympdTkyxJEyCXMem+qffcOHhtufHdwnWtFhLG0s
         zxxw==
X-Forwarded-Encrypted: i=1; AJvYcCX2b0bJVhoITlMZNStWvYQIUsNBIhOZ4eepb5/TuzJjB+4LzdZ6tjLqMuhv1AG6wqo/CpgExTrJmC3hJdcY@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0asE2jHiIv0EwzpAkxc1tfnPp2+ZppYRkEOPRlhYk32fjZv+K
	tljPn5Lls/6f+u46o5L2+i3kuqj/5xLfANFSPJJH5CmGYv3X4Ug7bHhb1e02tKcduw==
X-Gm-Gg: ASbGncsmNGtFULQgih07+r75k74iJJxSPQfnoZU8HNymUJ54Z+q4kLGYK5tknGDAal4
	pMNp/+O2BBmoqM8I0V5HHTMrfxbPB9S6H99T7SflRKZ2yiZ0EqxTHDyc7z76tvgGU7bRl8+aEDP
	qvTGJWla3Eg/DgJVI38Nm8bAvfuEaI+c7m8Ni8NzD4Csai18X550w2jtJH6Jkt0N7kk6GeYsMyF
	a+UazVBlJwjffS7Y6LZ2AJqQd20YPNfeKlEORxgQ3bqL+G1Kui/dtm8O7Gs7KENSX+H909bTeU6
	l+vkSuEYHvL/RVeJEPdHsQ0DJTebXmfyYWgFeTDeiWqoqHfeTqtpKtiEQ/tMS1kK4/xQLMFeWh7
	CweBaDiEbFdj2HjgDcRhGeohncdCCZYu0VHnNn8MvAypF57HUXdgc18W+2tPpNhQ=
X-Google-Smtp-Source: AGHT+IHFYkFn8z+GUWkNUAawcZ1YV51AhOshm97PW4qM3AjxsaLYtJ0SsbO2jweyVtrKw2JD5LyFpA==
X-Received: by 2002:a05:600c:4251:b0:46e:251:b1c2 with SMTP id 5b1f17b1804b1-46e0251b2b1mr355875e9.7.1758529345943;
        Mon, 22 Sep 2025 01:22:25 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee1095489asm18071631f8f.24.2025.09.22.01.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 01:22:25 -0700 (PDT)
Date: Mon, 22 Sep 2025 08:22:22 +0000
From: Mostafa Saleh <smostafa@google.com>
To: kernel test robot <lkp@intel.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	robin.murphy@arm.com, will@kernel.org, joro@8bytes.org,
	jgg@ziepe.ca, praan@google.com, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
Message-ID: <aNEHPo16_HgyYafz@google.com>
References: <20250919133316.2741279-5-smostafa@google.com>
 <202509201819.f369wBHc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509201819.f369wBHc-lkp@intel.com>

On Sat, Sep 20, 2025 at 06:42:59PM +0800, kernel test robot wrote:
> Hi Mostafa,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on soc/for-next]
> [also build test ERROR on linus/master v6.17-rc6 next-20250919]
> [cannot apply to joro-iommu/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Mostafa-Saleh/iommu-io-pgtable-arm-Simplify-error-prints-for-selftests/20250919-213912
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
> patch link:    https://lore.kernel.org/r/20250919133316.2741279-5-smostafa%40google.com
> patch subject: [PATCH v3 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
> config: i386-randconfig-013-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201819.f369wBHc-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201819.f369wBHc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509201819.f369wBHc-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> WARNING: modpost: drivers/iommu/io-pgtable-arm-selftests: section mismatch in reference: arm_lpae_run_tests+0x100 (section: .text) -> arm_lpae_dump_ops (section: .init.text)
> >> ERROR: modpost: "alloc_io_pgtable_ops" [drivers/iommu/io-pgtable-arm-selftests.ko] undefined!
> >> ERROR: modpost: "free_io_pgtable_ops" [drivers/iommu/io-pgtable-arm-selftests.ko] undefined!
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
>    Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n]) && !GENERIC_ATOMIC64 [=n]
>    Selected by [m]:
>    - IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST [=m] && IOMMU_SUPPORT [=y] && KUNIT [=m]
> 

There are 2 issues here:
- I missed one __init for dump_ops
- Then new kconfig change to select IOMMU_IO_PGTABLE_LPAE broke build for
  some ARM targets which select GENERIC_ATOMIC64

I will send a new version shortly

Thanks,
Mostafa

> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
