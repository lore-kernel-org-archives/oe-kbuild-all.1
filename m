Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8D0334C1F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 12:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770812021; cv=none; b=Uo+RhiXyeBCoeQCPRukaMu31CXMe/VDClVTiaxWHHpKoTeSPr689dYXYKy+kZbBCZn7mvKPF/6d2xQXjPzwJb87F5f1dc3ZIj4aR7gEuqsRARkkY79Qy8IkWt+uqRs81iQu46kNtJpImqETDkZINNw0+AK8VvDNUxJv2Uww9nrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770812021; c=relaxed/simple;
	bh=WqVuBtULsDHMX1CDf/kntO1x6mRDJwf2B40ihqIBFTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DJGMO6hjXe3edcPFYz01Gb7DKrnMU05b20SN3R4JRDwg+g+bZzgNCzSkH/1+qskDcOuiYkTbvE2c/jtuquVOGwCWFLye60ttxRxPN7OXLmbKQ+4rbyKptDvMKppPkqMfE0nF01GTTbPoOOHxGS0o6EuKJWSjp7oweoeAMTEya6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wxCg7jsT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wxCg7jsT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so22411035e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 04:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770812018; x=1771416818; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/S+pJFmSKw9Ty17LOwhFyPGGZE1kNWrO+AT0nc+iHq4=;
        b=wxCg7jsTcyysXrlgJcrhGpffTHKlgyVW3nGhD0c9mJBew6I+LQvBmGRGAaRimAVcvH
         ZRjAeh2JO6+fkCGT8dT4+oTQK5o5hWWLPoeZi+WGYNCtjHGeLen1crwJdgGDk/xuixq7
         huqo5Eg7vxgjJhwCJl3qpf7fA523oRKJMrbXkvpMqg0CKb2kWsXdlWd4fUflclXfP5CG
         06tp/8EJfcyxLi7vUZZpHHE4y5eia0B9jmpjsbdS5SbflyzRbcLAP9FFKB83MgxfHZNE
         UHNiT+24PDOa5hAXuGuitviifwR/1Z1ENq5Y6p/sWHo1xRTP8cYClpB/1oz5Mcvo+Ii9
         fBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770812018; x=1771416818;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/S+pJFmSKw9Ty17LOwhFyPGGZE1kNWrO+AT0nc+iHq4=;
        b=vxLmtkF2MAdsRGdQ650nb78MtWcA1yqm0ifiZ9OfK9H+6+202ZKxCsihtruZruNKgW
         XssrnTU2qLLdfcq3ZCDiKiraO38R0DmSBazkfo0BfG+PDr1kJxdNTldJikm804GgZ61E
         7hoqcBGNSyKytrlQzvi9TUtfC0RaeqFTjDyhU7oH3cADriafkK27yhrwtPgQytKG6dCH
         0Jinfs1WbyWjzGJ5bkuT8HnSDtp9hebgfDZxVFOw0kmBA9ACv1AuKsbPYooManwm6dtU
         rbeoo+0BUYkKktDA45mVsaRz5bHtYFQuwCPYOKtBqmSb+IhvcUFZbA9sQi7xHDkeHJlt
         Ypsg==
X-Forwarded-Encrypted: i=1; AJvYcCVpxYuSVWKDF6nizHCnPZFvnE3DetYQALUsFpxteNnc8ho+6r8H/dA4Cdp146QY2f0At1jtVUuBlf7Iu4pb@lists.linux.dev
X-Gm-Message-State: AOJu0YwlPHKIWnD3/dpLQ2Eoa5j0UaIjLJJ+ItozMyiZ095vvqpJ313r
	k5mi/qmjX1M7pdFr9shJ+bYb2W3YS7clyUBsm1U+xl+yjUkhNeDXvmuk9GJpFyBqwlk=
X-Gm-Gg: AZuq6aLLNx7Q8j6kImAtIfoaQhqp5J3b+VG+7NjZFtw3W+NYqrn4VZynRQB1P12gnH4
	PARyBcMX5ALQvnDqDxszNPWpNjvOVERSlDqKToLl+V6+dnFXdTTcC8ln2bDJS2GOxvLtmFDGm7f
	xdcCDdFitzUhPmqxTUM8mVMPGNxxMVI3/oNszp9nALGUIst7dEdxgrk46HVMOwejCLYSzc4EKw0
	xyJ4DfYpZQZl12D+bQXO1SUfm3XM9EjrNVZC9yymS8PNyjFdEaw5TpR0X1RbIwur6K/7/fhAdB4
	jsVG9D22tDwCa13JBwZxvvKro0RfiBT8GJqN/XQSKYGdIydtgNYmF9mXW/7xzLbRv9uqXIofkxk
	hvJb4uqZnZ0uMjop0uVMkilvraqLejeAYP7RQwpJVHX+3hI7Ua66HcHS7zUB+BCn8fQ0HRu2OQ6
	QKAKkqzMIr+s8Ru/wqlZWP4CqGfhiACJmCAFfjlNI=
X-Received: by 2002:a05:6000:2913:b0:42b:2dfd:5350 with SMTP id ffacd0b85a97d-4362937ff6fmr34012287f8f.56.1770812017802;
        Wed, 11 Feb 2026 04:13:37 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783dfc55dsm4398750f8f.20.2026.02.11.04.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 04:13:37 -0800 (PST)
Date: Wed, 11 Feb 2026 15:13:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "H. Peter Anvin" <hpa@zytor.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:308
 __cvdso_clock_gettime_common() warn: right shifting more than type allows 32
 vs 40
Message-ID: <202602111941.PIhubgrb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   192c0159402e6bfbe13de6f8379546943297783d
commit: 693c819fedcdcabfda7488e2d5e355a84c2fd1b0 x86/entry/vdso: Refactor the vdso build
config: x86_64-randconfig-161-20260210 (https://download.01.org/0day-ci/archive/20260211/202602111941.PIhubgrb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602111941.PIhubgrb-lkp@intel.com/

smatch warnings:
arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:308 __cvdso_clock_gettime_common() warn: right shifting more than type allows 32 vs 40
arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:308 __cvdso_clock_gettime_common() warn: bitwise AND condition is false here
arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:454 __cvdso_clock_getres_common() warn: right shifting more than type allows 32 vs 40
arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:454 __cvdso_clock_getres_common() warn: bitwise AND condition is false here

vim +308 arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c

fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  287  static __always_inline bool
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  288  __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  289  			     struct __kernel_timespec *ts)
00b26474c2f161 Vincenzo Frascino  2019-06-21  290  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  291  	const struct vdso_clock *vc = vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  292  	u32 msk;
00b26474c2f161 Vincenzo Frascino  2019-06-21  293  
1a1cd5fe881fdf Thomas Weiﬂschuh   2025-07-01  294  	if (!vdso_clockid_valid(clock))
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  295  		return false;
00b26474c2f161 Vincenzo Frascino  2019-06-21  296  
00b26474c2f161 Vincenzo Frascino  2019-06-21  297  	/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  298  	 * Convert the clockid to a bitmask and use it to check which
00b26474c2f161 Vincenzo Frascino  2019-06-21  299  	 * clocks are handled in the VDSO directly.
00b26474c2f161 Vincenzo Frascino  2019-06-21  300  	 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  301  	msk = 1U << clock;
8463cf80529d0f Christophe Leroy   2019-12-23  302  	if (likely(msk & VDSO_HRES))
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  303  		vc = &vc[CS_HRES_COARSE];
8463cf80529d0f Christophe Leroy   2019-12-23  304  	else if (msk & VDSO_COARSE)
70067ae181f302 Anna-Maria Behnsen 2025-03-03  305  		return do_coarse(vd, &vc[CS_HRES_COARSE], clock, ts);
8463cf80529d0f Christophe Leroy   2019-12-23  306  	else if (msk & VDSO_RAW)
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  307  		vc = &vc[CS_RAW];
cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01 @308  	else if (msk & VDSO_AUX)

This code is built with -m32 when we build
arch/x86/entry/vdso/vdso32/vclock_gettime.c so VDSO_AUX is zero
and we never call do_aux().  Presumably that's intentional.  I
don't know this code at all.

cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01  309  		return do_aux(vd, clock, ts);
c966533f8c6c45 Andrei Vagin       2019-11-12  310  	else
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  311  		return false;
c966533f8c6c45 Andrei Vagin       2019-11-12  312  
64c3613ce31a1a Anna-Maria Behnsen 2025-03-03  313  	return do_hres(vd, vc, clock, ts);
502a590a170b3b Thomas Gleixner    2019-07-28  314  }

