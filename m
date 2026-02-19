Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA4F1E0B86
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 07:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771484850; cv=none; b=tFnIHo5bcQpzdqOGi1L++2DjQnwgBGEgSZ3OqJckPdPZ5uOtw+K0ukhVAD3KDtvHm81eEYHJxv8MGBHJ4ibsEDM8rg4umcSKPfzstTORxfImykSEG8aakj00I4Gxt9JAZkX9VAvTNhfzwuwbs4zOctJhf9kzx2CGmt3xKtQChh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771484850; c=relaxed/simple;
	bh=8uUVri0cFA+596uYVgu1xjFSWnUH1eYCeHLFHC7qPz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XyvdWJh0F4pHH+ZbE/qY+tpPQ0pA4EJ30F/14j6G5txcOqDkLqom2GlQEGxKR7RjzjNPQD50fSzUDFvDk2I9g2ZkPXnpNyHUx6pBfrfZHTuTVpf9doCtQeJxhDcMmhbzsVY2gm8QnFMffchLGyc247fniYukqXWwsi1um2PzVnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aTX9BE3G; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aTX9BE3G"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso5204425e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 23:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771484846; x=1772089646; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a911hhjUe7DJK8Rt561ipBUwNa/gipo2lowXM0LivmU=;
        b=aTX9BE3GSDJQrWM0gEXagwAPqPtWXppXsqCml5dcgSUWHCXz13Lx91Qf8hx0WTs/n9
         Fi9yTLTpwhivogxwBZHWwI1e6NAxaaCbRbNBkaVh/3NSf5GwHX3ULNwSm+YhSne07/0M
         mhIbRDRHdXCIxjFw0GLpaKaUESs1OxQF87FDMQffb1NpaWgfxmrD51nfAFblUTTgCIuG
         yK/bbpI4gBA5rTVwtIycdWxaMPcY1Ua2kRQ+Z/egLSSWMz9dMTvi7Lq5RKfKEbfF6c1O
         ZSCXEjyOECc1Q+8sQj2esslDg8+wXytkEzr0nIc4A2tku2i4+qeg505JxXskQ7/DHg2m
         4gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771484846; x=1772089646;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a911hhjUe7DJK8Rt561ipBUwNa/gipo2lowXM0LivmU=;
        b=MLoRxuq94d2qXiRIYCYuNaZ2NK6qMy9cdiSBGabuaktHpLn0wTok7VFviIlJDHDJrd
         QOBBaZ2LgXGNWNPMiHfcr/4HwsrY9evgKdCHNAhBtkudqHTefXe1uEs0GWmDUyDcQdYx
         YzL02ZE9QQFwD2tG/JdSJ03QnfVj7m7P0STEE9EkrdENdjhVcx5keDCSWyUhF1guPvzd
         yHq/bhX+0q5+aRC1Ak6xznraCAo4Iiq+iaL2yKEgDTtdOFqX9syCNyjBeyWfx9LjavPa
         nHsTXXk61pdLzjMZedHnXIcXIdUZBtymjcRCLSKoLIh8KRiVZrbTrIk5EAk9aq/ix+uk
         3J4w==
X-Forwarded-Encrypted: i=1; AJvYcCWLz1vlHTYPtWilNI/YIMHNcTEXlGTgF3zkUZvL8S3ulHF+BzkyUhhL5aAtxuWqdvAB8wsuMm8nUzWs61t0@lists.linux.dev
X-Gm-Message-State: AOJu0Ywsd6PuAn1fQiSD7oGa8I6CpV9nThErZHXD23vUEVvuU/ve1l3Y
	sbnkV8nSb6hpmWzB1MyrLBzbH70mrM4rYfWzzYMm2HUaPCEdUIuyLiSMf+bg3ko5tBw=
X-Gm-Gg: AZuq6aKacZcKnHuZeI85QXMvtkqdh33sbvCDMUcvLP4Hq8UXKdebsZ5o0/JtsL7r3XN
	SVwSpJxl7TkZDG4pYJEieTHVk/touR4sJd+XVPqE2rDj4klmOEXqexL69rlujuexFV1lBuA30rA
	mYBdPvNvBFO7WxyszB4+Z2cCLgFgetAqMzT5Q1df8grmjMi0VMNc0AEdGmPRrtuzm3BceUCFqNf
	ygrWKa7NnKhb8w2U/NjGNl4ZXbl45Fad296uCnFDkdRGPxIovIoXCKpO5rmebcQivzpjGrm+iaz
	0wbj5c1MLeNTH5RrnDadB6OQkQKEOLzYF9A22+2o9A4UONMMHsNjlvaI3yLC1PsZzWKfgoKg9W7
	89Gmw95OrVrK9qaEwLzWN2u2SuDF5wN6HKQnwni1qhGJkkYCyTkfryuHNpZtfx4IRV7jm52tyTC
	2LMtGgepf/NUXgAFG/pAYmmArNaNQ5
X-Received: by 2002:a05:600c:c0ca:b0:483:78c5:d743 with SMTP id 5b1f17b1804b1-48378c5d9fcmr243436965e9.28.1771484845871;
        Wed, 18 Feb 2026 23:07:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f986118sm11262595e9.21.2026.02.18.23.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 23:07:25 -0800 (PST)
Date: Thu, 19 Feb 2026 10:07:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Deepak Gupta <debug@rivosinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Andy Chiu <andy.chiu@sifive.com>
Subject: arch/riscv/kernel/signal.c:196 __restore_cfiss_state() warn: maybe
 return -EFAULT instead of the bytes remaining?
Message-ID: <202602160730.QsdCT9Zp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: 66c9c713de597f9b40a319ebda4d3466ce2cdff0 riscv/signal: save and restore the shadow stack on a signal
config: riscv-randconfig-r073-20260216 (https://download.01.org/0day-ci/archive/20260216/202602160730.QsdCT9Zp-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602160730.QsdCT9Zp-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/signal.c:196 __restore_cfiss_state() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
arch/riscv/kernel/signal.c:52 restore_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:66 save_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:132 __restore_v_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:142 __restore_v_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:228 restore_sigcontext() warn: maybe return -EFAULT instead of the bytes remaining?

vim +196 arch/riscv/kernel/signal.c

66c9c713de597f Deepak Gupta 2026-01-25  174  static long __restore_cfiss_state(struct pt_regs *regs, void __user *sc_cfi)
66c9c713de597f Deepak Gupta 2026-01-25  175  {
66c9c713de597f Deepak Gupta 2026-01-25  176  	struct __sc_riscv_cfi_state __user *state = sc_cfi;
66c9c713de597f Deepak Gupta 2026-01-25  177  	unsigned long ss_ptr = 0;
66c9c713de597f Deepak Gupta 2026-01-25  178  	long err;
66c9c713de597f Deepak Gupta 2026-01-25  179  
66c9c713de597f Deepak Gupta 2026-01-25  180  	/*
66c9c713de597f Deepak Gupta 2026-01-25  181  	 * Restore shadow stack as a form of token stored on the shadow stack itself as a safe
66c9c713de597f Deepak Gupta 2026-01-25  182  	 * way to restore.
66c9c713de597f Deepak Gupta 2026-01-25  183  	 * A token on the shadow stack gives the following properties:
66c9c713de597f Deepak Gupta 2026-01-25  184  	 * - Safe save and restore for shadow stack switching. Any save of shadow stack
66c9c713de597f Deepak Gupta 2026-01-25  185  	 *   must have saved a token on shadow stack. Similarly any restore of shadow
66c9c713de597f Deepak Gupta 2026-01-25  186  	 *   stack must check the token before restore. Since writing to a shadow stack with
66c9c713de597f Deepak Gupta 2026-01-25  187  	 *   the address of shadow stack itself is not easily allowed, a restore without a save
66c9c713de597f Deepak Gupta 2026-01-25  188  	 *   is quite difficult for an attacker to perform.
66c9c713de597f Deepak Gupta 2026-01-25  189  	 * - A natural break. A token in the shadow stack provides a natural break in shadow stack
66c9c713de597f Deepak Gupta 2026-01-25  190  	 *   So a single linear range can be bucketed into different shadow stack segments.
66c9c713de597f Deepak Gupta 2026-01-25  191  	 *   sspopchk will detect the condition and fault to kernel as a sw check exception.
66c9c713de597f Deepak Gupta 2026-01-25  192  	 */
66c9c713de597f Deepak Gupta 2026-01-25  193  	err = __copy_from_user(&ss_ptr, &state->ss_ptr, sizeof(unsigned long));
66c9c713de597f Deepak Gupta 2026-01-25  194  
66c9c713de597f Deepak Gupta 2026-01-25  195  	if (unlikely(err))
66c9c713de597f Deepak Gupta 2026-01-25 @196  		return err;

A lot of code in signal.c used to return nonsense values because it's
highly optimized and the caller handles it.  As in:

	return __copy_from_user();

But this code doesn't feel very optimized, honestly, and I bet
returning -EFAULT doesn't hurt anything.  I think it would be faster
to get rid of the ret variable and do:

	if (__copy_from_user())
		return -EFAULT;

My brief and bogus testing seems to show a slight speed up
probably based on the smaller stack size.

66c9c713de597f Deepak Gupta 2026-01-25  197  
66c9c713de597f Deepak Gupta 2026-01-25  198  	return restore_user_shstk(current, ss_ptr);
66c9c713de597f Deepak Gupta 2026-01-25  199  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

