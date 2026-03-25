Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371493A7F61
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437818; cv=none; b=qhLnNwsRwTZMB5Ls8WdjHPe1BLZvzSyCbncoQuRVpZUX6Oug+lCWTmNSpB8d3KERhIYTwqI5L6s6ip7MyvHoH6axQW9SOKnk2qf84SOznIZU7oxBSXpKIi5ElhWUnxXXimvg2as1u4HW+GpWswBbtag5bjkuA0w8L/f7LDcToUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437818; c=relaxed/simple;
	bh=aQPjhGoLjKR6KJbLzFxM9LH/dwDE9aGTxVk3RYZBWn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h1OLBWFahdfjHWKozEbegW1A0Oy5ntd2eFeKT1r1Km8cpLYqp+Xz0wGazO+Pp/LQovYCyntxtKjOGgd0LmTWfnD0Ms16hfC5jgIQWEIklYlTl9UOyiBrzbgcEpm8bbQ1onu/N033NvjItWhZ3KSpI9pVcZ9WjwUZ21Dgrf+oMTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g8gSnHzR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g8gSnHzR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so46595265e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 04:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774437815; x=1775042615; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yNcT6N4Da6oBh6vGHmp71lE7h4MsMXPkCvZSzQpZPVs=;
        b=g8gSnHzRqyX+UdwapjJIuTiT+5/oZZc2YSTRyVT5AYWPXaB1HGv9+fiH/YpWVRjRm/
         eW4WSHvYrgzttsogGIoLp3dJby2MDp18SH+AW2K1Aqi6La286hPKo0qUSyZVyFvE1cEw
         FwUef5kRtebNiVfBYSMlZCX3o2uiuwaNdPb682UvQph+16L5yLAJpPRw/2mzaKN7iuej
         VAlICWLwHlNz56nf1YjUCjowSKvoxkvTrUlH2QEeucwDk0jRGvZRC42H+TRNXdI37mEd
         9UUEmh6DUzZudAl4/tB6TVEhzZBtvu1Ncf9FpTXmjP2B+gC7ShBhfx5z+n9FEQeAb4nz
         BBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437815; x=1775042615;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNcT6N4Da6oBh6vGHmp71lE7h4MsMXPkCvZSzQpZPVs=;
        b=V2h/xuRxB6ntkJrZ3qMB00sRitcsETmsHet3FosRQxalrERmx8SImpihopx0KX/vLp
         cjxo43x06qa+P4tn3hejzEhB5BiAzZ6O+chVUKeV2o1t0wbAd9eeS+Ecm68S67zi4B7U
         1AGltDX05dK7DObbbDm2S/+YQHpL5+xzUpTA9FA17TdRl2vY7cRFR1w+8TLbA3OKklsP
         K05DrnU+t4sotctT99OvHSqHDfm72vPKAB6gyd6AyfdzVp8KjplB6+EAba3Z5xxZ1kLU
         bDSKiRonPyuPaVB6/F6lJF/FKZDTfJjiYrLGNom52SabIQdG8ONwBIUjNO4/T7qUIdxL
         FXiA==
X-Forwarded-Encrypted: i=1; AJvYcCVdSkFZF2rFhTH64EpK2SiqdATL0lqEsn8M4uPyVe5jKRTRvYoeQrG1yfGjwLWu57KPCFJZC/YNQU2LZvTT@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk47cDzEdi5uq2cxvUB7g+BhGpem68xabSDKES4hYzTV8G0YRN
	BlYb0i5dgxzyh2/ZVGmnHlqblYjKC6u2FLGcgYf3Pels7cbdH/9Q3qiQCle5aymB/FM=
X-Gm-Gg: ATEYQzyke7V2zUamAgJvK48LA/LQd4N4rkdGt8Bp9gSQbc7NeySSiCEnc74D6jC6wWO
	4Iudh5+27pSmZ1TGRnDE2zrTUFrUzl6A4AahAygzJbBYix87rKp/pZYUrxls/An2FuwyEH2P5Ur
	sv/YX1E6BgZ3M/4vyK4O9UAJyToMoFX34d8SUVpf9ENrscpWYJhXxwB7RN2m751vAu1IOHBce4Z
	2W5XjQoCpMwMxagviyoYmqcUTln0+sCdFvYe7Q+FCMyr9ZvRuXpIg7Lsbqz0Mh025KACqtv8x1C
	U0vqK/q1r822Ucp9MeEj6/6f//Z7EGvF4x7xpLLsEl96yPA2TxLzS+JUjOC7ApX8bYTWc/0hGhJ
	UZDabi6CK5uEBM4Z2n3zTnrKWkdEK4+0e8xvGOLKlQuZd8Zdt1uJFBxHw2JozegMkHMbG03stki
	TOz98jz5On9qBDxRi6MQ6nAdWRXbBQ
X-Received: by 2002:a05:600c:45d4:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-48715fd607cmr48967895e9.9.1774437815363;
        Wed, 25 Mar 2026 04:23:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871174f2cesm125063335e9.10.2026.03.25.04.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:23:34 -0700 (PDT)
Date: Wed, 25 Mar 2026 14:23:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: arch/s390/include/asm/syscall.h:23 syscall_get_nr() warn: check sign
 expansion for '-1'
Message-ID: <202603251953.xOfBpOhW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: e43b8bb56e537bfc8d9076793091e7679020fc9c entry: Inline syscall_exit_to_user_mode()
config: s390-randconfig-r072-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251953.xOfBpOhW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603251953.xOfBpOhW-lkp@intel.com/

smatch warnings:
arch/s390/include/asm/syscall.h:23 syscall_get_nr() warn: check sign expansion for '-1'

vim +23 arch/s390/include/asm/syscall.h

753c4dd6a2fa2a Martin Schwidefsky 2008-10-10  20  static inline long syscall_get_nr(struct task_struct *task,
753c4dd6a2fa2a Martin Schwidefsky 2008-10-10  21  				  struct pt_regs *regs)
753c4dd6a2fa2a Martin Schwidefsky 2008-10-10  22  {
d3a73acbc26a4a Martin Schwidefsky 2014-04-15 @23  	return test_pt_regs_flag(regs, PIF_SYSCALL) ?
aa33c8cbbae2eb Martin Schwidefsky 2011-12-27  24  		(regs->int_code & 0xffff) : -1;


regs->int_code is a u32, so the -1 becomes UINT_MAX where -1 was
obviously intended.  Maybe change the function to return int or change
the -1 to -1L?

753c4dd6a2fa2a Martin Schwidefsky 2008-10-10  25  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

