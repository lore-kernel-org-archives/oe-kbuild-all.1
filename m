Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681AC1D6DA9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 06:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754115852; cv=none; b=qU/QdeSlPNlveqaYsJ/6cNwLpBLiV7PyczjXyatdX0A7LPNXR8hMzPoRlwdYw0nFeBvnioTMpHpAgk3JOmewnchJsF1grKuAZBpcIt00tRbZYvEEqfY0R89unSYyxD05kZp3Zj0A7E3lcgegt2pUGtOz0cY8CFyw2HnIi7Nh+qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754115852; c=relaxed/simple;
	bh=Z/lFC3wcE/9vJf+O9rI/pfdUAvrWF0fzNlThTQXrkuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j9O+NbA/pIcmPtBM4hZGRU/u1Obzd+OeDEsiB8m23PDBcTaHnGvChsUl3YceDRbtTrI0o5uNWO25Yv9E0mKBNEVv8rjvRA5xfhHz/VxpVs6CZU8N3MrSeA/J4+6DdMlC4VqXuQ8IU84DRKNVHBszf1cZD3g3qVTK1jewOPrvnn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COaIOCH7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COaIOCH7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so15830765e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 01 Aug 2025 23:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754115848; x=1754720648; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaW6Z9mIwoz4/BLM3SJFes1csza6skaZh9LB6oOgbeE=;
        b=COaIOCH7rCf3TMMJCh4JGiyHYtJvn3XY20ZurPzRp+K5z/VqfgHpKUkJljsUYbWzrz
         spJhlUYhX26Qkdb7xRniz7Me/wKshpfj7Cs192VducSHOgZOkCFsep+lVVNtIFwOcZyM
         9pyAZWGcmT9wvMo+GzbtFU1XBV7CeIb3VLoQ8Vr0Azge6y1leVhkkl1U+Ws4LLcu0bl8
         low5wWGyhYH4gHTpIX+qQxzEnj1rxo2ibAkkRziykd8pZ78mn5ZnzLrZD9lyLPDSohDK
         xCFC8jlH50BbcT6SDCey6DzTLWy5GvG0UCizbAlW/J10p2caDH/6Ch8EW2PsmwTd5rcg
         tabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754115848; x=1754720648;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaW6Z9mIwoz4/BLM3SJFes1csza6skaZh9LB6oOgbeE=;
        b=J2lcLeggZHHeOIEiiPJqQsIWFCeqJEVjMTiRyqi8Jxo6IJJgPB7teGnYERjK24D52v
         SPQExYHSjQlItw6S6NANGKfxGb8cvIaw6s1uZ79P3fRnkCXFgEPB1wjmbjXxm+87AiD/
         muO45SprFV3BJbaWkDQggF7Ktj1h+cMVT2K2B9K3lNpsSTsEy6GYq28tFhRyVksxElkl
         +QKdddq8OVWpIcUGnZimvpnlR0b2sjH3wINyBeuoTCFGhWjm8/x+BU7eQdhw+x3aaF6f
         QObTKfMEobPFTx4hI6WvwizA5eelAFFBP4pU2UBjcTuOEvoP6Lr3xpAuTfzrnYdx/uZO
         JiBg==
X-Forwarded-Encrypted: i=1; AJvYcCWkf6CyE4S14EtdBXONew9ahkOViR37Uyur91fdh31QtsGcNhKlbHlYdoTI633JsEQdNifz76GZ0HM3nYty@lists.linux.dev
X-Gm-Message-State: AOJu0YydYMsi+Ktp7tMdq4y0vEbYkDkG3NqlO1lN+vQ/46iHFX2ItIDR
	Aud/wtHuo3F1CuwZWDeLCOdjDwqzQ/sMWJD4uBvAgnYZc1UTR2/aofTAA13O0lHF8Kk=
X-Gm-Gg: ASbGnctG7ilrOw9CSYhB7fxTFaZ58rZoK0t3He9UMow11gAJSp+0/W/fxTbk7yVPoj+
	Wfu39W1h09v/6t/FoWZGXY9QmhV9wBMHw6IOqn9SY22g3w8D+SCuwVYH+/60ylr0+HwVP3sE2R6
	bYgleFHJbt5DG5O3knLW9KiubIdiGAoe5Ny0EwV4OloL1CupJK4wcWFMOO5nOrczgjFMrLz4ELY
	Z+um0uEBUE5JCv/2VDBl2UYwqSlGJT7/XusBGymsSkY95Ox2METKK+ykr4mmxecXhZiaCrZNefR
	nR2pthAqX58pmYZmxtMtWpk152VVz2LKtQcndGIj3Yhom4gn74/EJ0fP08hv8iIv3yzBca9NRT9
	IDbKf+jBnu81+IC3dvgVc2AdDnA4=
X-Google-Smtp-Source: AGHT+IG4kq4B/k0aOy67kcdi2FASS6phoKi/+WMSCcssfYjF9DnttMupTJHXdVJRkNmINvKpdBWMXA==
X-Received: by 2002:a05:600c:6d3:b0:458:aed1:f82c with SMTP id 5b1f17b1804b1-458b719088bmr7653945e9.22.1754115847654;
        Fri, 01 Aug 2025 23:24:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47ae8esm8050737f8f.61.2025.08.01.23.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 23:24:07 -0700 (PDT)
Date: Sat, 2 Aug 2025 09:24:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, John David Anglin <dave.anglin@bell.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>
Subject: arch/parisc/lib/memcpy.c:44 raw_copy_from_user() warn: if statement
 not indented
Message-ID: <e0a7bc4c-aa14-4326-b2fd-7aae797892ba@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a6923c06a3b2e2c534ae28c53a7531e76cc95cfa
commit: 91428ca9320edbab1211851d82429d33b9cd73ef parisc: Check region is readable by user in raw_copy_from_user()
config: parisc-randconfig-r071-20250801 (https://download.01.org/0day-ci/archive/20250802/202508021047.Mp1T16dT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508021047.Mp1T16dT-lkp@intel.com/

smatch warnings:
arch/parisc/lib/memcpy.c:44 raw_copy_from_user() warn: if statement not indented

vim +44 arch/parisc/lib/memcpy.c

f64fd180ec2c0b Al Viro           2017-03-24  33  unsigned long raw_copy_from_user(void *dst, const void __user *src,
9e91db6b4abecd Helge Deller      2016-10-06  34  			       unsigned long len)
^1da177e4c3f41 Linus Torvalds    2005-04-16  35  {
91428ca9320edb John David Anglin 2025-07-21  36  	unsigned long start = (unsigned long) src;
91428ca9320edb John David Anglin 2025-07-21  37  	unsigned long end = start + len;
91428ca9320edb John David Anglin 2025-07-21  38  	unsigned long newlen = len;
91428ca9320edb John David Anglin 2025-07-21  39  
360bd6c658076f Helge Deller      2022-02-17  40  	mtsp(get_user_space(), SR_TEMP1);
360bd6c658076f Helge Deller      2022-02-17  41  	mtsp(get_kernel_space(), SR_TEMP2);
91428ca9320edb John David Anglin 2025-07-21  42  
91428ca9320edb John David Anglin 2025-07-21  43  	/* Check region is user accessible */
91428ca9320edb John David Anglin 2025-07-21 @44  	if (start)

Was the if statement accidentally deleted?  Otherwise it should
have been indented and multi-line indents get curly braces for
readability even when they are not required by C.

91428ca9320edb John David Anglin 2025-07-21  45  	while (start < end) {
91428ca9320edb John David Anglin 2025-07-21  46  		if (!prober_user(SR_TEMP1, start)) {
91428ca9320edb John David Anglin 2025-07-21  47  			newlen = (start - (unsigned long) src);
91428ca9320edb John David Anglin 2025-07-21  48  			break;
91428ca9320edb John David Anglin 2025-07-21  49  		}
91428ca9320edb John David Anglin 2025-07-21  50  		start += PAGE_SIZE;
91428ca9320edb John David Anglin 2025-07-21  51  		/* align to page boundry which may have different permission */
91428ca9320edb John David Anglin 2025-07-21  52  		start = PAGE_ALIGN_DOWN(start);
91428ca9320edb John David Anglin 2025-07-21  53  	}
91428ca9320edb John David Anglin 2025-07-21  54  	return len - newlen + pa_memcpy(dst, (void __force *)src, newlen);
^1da177e4c3f41 Linus Torvalds    2005-04-16  55  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

