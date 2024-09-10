Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5346C188A0C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725960162; cv=none; b=vBH0U94jGzlpDhcXxMY3SLnzEPsxSot77Yx6IR1lyU32UZST/B7XNMZ7g8bVFHjX7FcjshqjHVTLMN7U1Atp3YBQr5P6qr/cMHqo8YLSQAY6POhSFHiM/RZuKPhesF90VizlQD0akvtkfm9IikUdrrrWNmAWoBYL+qUidWb2gNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725960162; c=relaxed/simple;
	bh=dK17jcgWY0vko5c0BYqEzvomy14PjkYKvrp+seBX5uU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=bCJo/qOvYr+jOZt1kgJVp6bPp/qw1o2MW9drHRoQ65V15rWclSuZefv0YD1rBza7SZKa1InxjL68P3FUYcbsfChy225BVIQcxdYpG+x2h/mk5oi9k4njbOUCS7lO8CcP0HVLSWesWbykZ2fcgVthr1M+CZS59jFnDNMWJDAiH44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wyfO0ycb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wyfO0ycb"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c3400367so4563384f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725960158; x=1726564958; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cXvcIrkK/fWqYHE+VZNxz5hbtak4R+sbEAArmllXywo=;
        b=wyfO0ycbfHB7O3zqMC2q5DiDDAKH2R+GjfHy1+vvFFafQUzjPJXbDu1xEP/34T7Y0z
         8er8VbeAu/juUTiImZZIvZnXWXPtm2gcVlzxL/YMbjfoUfB/etbjVrzP5b28jJD1Sx9s
         V0jjGowqJ7g4FTENlwUqG7+K44Z1LViu6L4LgXNFgFe1SF6jFIliMAxEX6/Xc1pg73i6
         4iPG0DGtHMqO1MA3Z64Fh4ghndQXndSRGrGR98oN7fs8ITCJTMzD6uVm41uNVUDcrLlx
         oCqEVtgr39GAcm2WRVL+bPqv9RQx476tmr9HOMupJtOBHvhthOGFlCuU3jZiyPrLirj0
         U3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725960158; x=1726564958;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXvcIrkK/fWqYHE+VZNxz5hbtak4R+sbEAArmllXywo=;
        b=mgclGL1wCnpwyZbDvVJu592rrBM13mA+pT7e+lo5TRVFjmCIWLfL2X4L1h1m0V0j4u
         T4bh6RB8BeJN5mJMquuezUd5Nh9j7V1O/oJRJvp4mNo7Jf0AH/Q+yh1AkOVsDTL77C7M
         KeTNv3bZeqYDorb+WggPWuOMcg4JdmBrDit93a/Abj2X5x9+lI6+BvOvmGsYDNUQS/cR
         Z5Jbfr5GTjFHYZD9Rn0X/Ybf66yBtDamyyJm8LY2Okt1vY5XxIiHo1g8IxvGc9aBI7Zs
         fXdgmEylBYFjtMTuPVbKweNLE+RmU9QbDLmr9lYhqby2oH7pQzof5FUfi0lzhMOSez3y
         zYRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNfxAJrdXuCp5WnBgsUCyEilBWeI/sTDfPrAoiY7NKVPnF+aGnsfl447yNsGOgmG72dPyudBbvf8wRJtjT@lists.linux.dev
X-Gm-Message-State: AOJu0YxI+oAFYejJJOMSZvUJxNGfnT0c3qf+GJyZB2rGm2AZxrb9gbD2
	ld96vTRwfbutELGAu7AoYqS0wcTK7H+6TXSYA6Dysc+hc06cWilfJZ8X7F6imzo=
X-Google-Smtp-Source: AGHT+IGgI6jQFQ3fCw76i64e+t4HcCA6rdSMOj5d65X4dDT4qSmrjpbCUzEq87jUPozJ/ENrvEVruQ==
X-Received: by 2002:a5d:5cce:0:b0:374:bec7:8f with SMTP id ffacd0b85a97d-378922b7691mr7838237f8f.28.1725960158353;
        Tue, 10 Sep 2024 02:22:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb116f44esm96986705e9.45.2024.09.10.02.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 02:22:37 -0700 (PDT)
Date: Tue, 10 Sep 2024 12:22:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Aleksa Sarai <cyphar@cyphar.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 04/10] openat2: add CHECK_FIELDS flag to usize
 argument
Message-ID: <c4f3a9a8-e4e6-4e07-a65f-72c6504ad4cc@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906-extensible-structs-check_fields-v2-4-0f46d2de9bad@cyphar.com>

Hi Aleksa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Sarai/uaccess-add-copy_struct_to_user-helper/20240905-230518
base:   431c1646e1f86b949fa3685efc50b660a364c2b6
patch link:    https://lore.kernel.org/r/20240906-extensible-structs-check_fields-v2-4-0f46d2de9bad%40cyphar.com
patch subject: [PATCH RFC v2 04/10] openat2: add CHECK_FIELDS flag to usize argument
config: i386-randconfig-141-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091242.KVFltqkq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409091242.KVFltqkq-lkp@intel.com/

smatch warnings:
include/linux/uaccess.h:477 copy_struct_to_user() warn: maybe return -EFAULT instead of the bytes remaining?

vim +477 include/linux/uaccess.h

7f6f15ec9e2720 Aleksa Sarai 2024-09-06  462  static __always_inline __must_check int
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  463  copy_struct_to_user(void __user *dst, size_t usize, const void *src,
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  464  		    size_t ksize, bool *ignored_trailing)
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  465  {
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  466  	size_t size = min(ksize, usize);
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  467  	size_t rest = max(ksize, usize) - size;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  468  
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  469  	/* Double check if ksize is larger than a known object size. */
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  470  	if (WARN_ON_ONCE(ksize > __builtin_object_size(src, 1)))
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  471  		return -E2BIG;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  472  
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  473  	/* Deal with trailing bytes. */
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  474  	if (usize > ksize) {
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  475  		int ret = clear_user(dst + size, rest);
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  476  		if (ret)
7f6f15ec9e2720 Aleksa Sarai 2024-09-06 @477  			return ret;

if (clear_user(dst + size, rest))
	return -EFAULT;

7f6f15ec9e2720 Aleksa Sarai 2024-09-06  478  	}
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  479  	if (ignored_trailing)
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  480  		*ignored_trailing = ksize < usize &&
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  481  			memchr_inv(src + size, 0, rest) != NULL;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  482  	/* Copy the interoperable parts of the struct. */
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  483  	if (copy_to_user(dst, src, size))
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  484  		return -EFAULT;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  485  	return 0;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  486  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

