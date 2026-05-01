Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53A33CEBB6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777647691; cv=none; b=XK2XVfMA1r9O62kZPu4CQszFPpmNjeaYu20fBRUDs+GwvuVr9iiw41yekf5WNthXF88ZaZNZHhCYRaiODrYpxwQ5sxxpLZzeEo+PCKlBO+zj7BLMIl+/yGq7jirTMRJoNnXxaYVe7MzoQwE7RebY+DKxGwsLVJhfQyvfKbdfCpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777647691; c=relaxed/simple;
	bh=u3lKcwws5A+IQdggjYDE0lu5+w9dAqoHrVKi4z9WPxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sJe8y+K1UkFR9+qI1S3Omrfe22VF3RiyhoZKLyGUn22v7m8rJqeSVkn9XueBYw0lcmFbsAipubY2BSJdjAFHHx1P35+s8Wxf2r1zQOSgZaYOCJpg+3GTCfD62Uu5vaKFHrKKN4sJXfZXfImW3Tduxn7GAvL3jHUqB03qeuoM+e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQskQKLu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQskQKLu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso14769005e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 01 May 2026 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777647688; x=1778252488; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dR16UQEKsXq+JumlQUVyeXfr2XmAzyG4xUZFkuLAXAY=;
        b=bQskQKLu83Z4lfcLju1gP2WJgSOrFnA3lDOGsf4BuV8m9Adk0G/j7/BOBUB+FbJ/dA
         3v8zWLsF550gRZEk94AU/g7rsr1ffJlRayTrrn6U2LRgQ46mks5kl3XUMw4ge4Byy67G
         ffvNQlPmcOHrUTKxtbTW4vvmJVTePtQUOXs92LQ31AZoVJUrKj1aeevv94M9fE9Sx+I6
         vZlPQiGapUxiETFUGmSnnRhR35Iwego9INBwdMQFll9O+4Q+QlqeXfVAidB+DfGYnUnU
         y7hENSXMICV2IowiUEo0PsVSuMtLrybFM/76nhvRj6bokA5kinY6+ofuzSKxao1DzQM0
         Kk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777647688; x=1778252488;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dR16UQEKsXq+JumlQUVyeXfr2XmAzyG4xUZFkuLAXAY=;
        b=dPYKFoqpK3v8vG3uXs0BAmOHaJbGCSMCkwHXk3ogo9VYljXdjXznPTC+I4f04nP1rw
         K3+0Ot3c53MXchzAIK4ir8yC5WLAbJdx8/YrCW6BpPgBDsqJNhpNSir4FGGRbNlFAXr8
         sKsK8a00d0vYTwGXxYv3EuRKB/+5AezTt3Uehf/xYCa2pqkvQDlkAzsQ0o9qk25ZQmZH
         nLtxHEzdVO/O1Rb25NipC+MwYwmg9azf/J4k9K9zB5GwveJwFdzVRwn0a5D/rv3XaoR1
         V7fAXw9DIQw5SYIgOKuIWqBIj7IxFgIVLhlONbGpulh6LpSjEcxdqfeBjz2aWb3hu606
         wuUg==
X-Forwarded-Encrypted: i=1; AFNElJ9qcvYOS0rCk74Ya97lyOM8aZkXqryADMLDO6FYa2sFIpkBBV2mbcwdFAnwm4affSu97qXO0j8CO2Fs3GJx@lists.linux.dev
X-Gm-Message-State: AOJu0YyvV1bRB1F8nsgGZJ6/E8egAGIlrRAX8AgtWC3xTu83TEhLcZvB
	kFpe7X+pB6v+ZC5x3GBB4E1MaEAkOw2ZaoeM9/4VZiaJ+IfxUdNiCIcyzFjrRg==
X-Gm-Gg: AeBDiesQESjEQzK4RG5iG6HXPmJ73wrMa/fozYIyPew/TxwMYGlxC9ldLKaJqgoYmUZ
	j/Vp0McbrtrMyG3IJ0pLSijVFQl773+KGy1cCmWNPk5qG3A0oa/LnWTYKhu+RhxCkWE+o0J4sqZ
	mUIooSDjBVpKcAU1oYgbn0Ab7onUm8vIUYeamT4Oqu9LozqMG28mfqwOTJSB61DY0i2R6TLSS1V
	yVEhzREv/8CMkhL+LAeOmfA0l3StKPhffP4S5uO1ySA6TQnG/xyfbSETd9gxQ3vwDNSeQnx2K8j
	WKGODgZQeTAofLTd05agAaL+btSaHEPoPkT1BWA2M6rbvOIBe1qpMh6jaWI4Sr4U8uxr1TPQvNw
	SJu9KC7JAJLnhPgU1hEYS1TxUNzkHz7ialpyIWTZQtWArYMWhE2DfiA6Qx2HSQRwEXbvnyK/gNo
	GgIIocO2SPgugvVxrvpzhq9o8zTmFfVA==
X-Received: by 2002:a05:600c:4f47:b0:488:b239:77ec with SMTP id 5b1f17b1804b1-48a8451d08amr119856825e9.17.1777647683978;
        Fri, 01 May 2026 08:01:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe928f6sm14730465e9.6.2026.05.01.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:01:22 -0700 (PDT)
Date: Fri, 1 May 2026 18:01:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 90/90]
 drivers/ufs/core/ufshcd.c:2294 ufshcd_hba_capabilities() warn: missing error
 code? 'err'
Message-ID: <202605012135.qpiuGqaa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   90993a7a9684f014a3d9f2b1b0deb516badc3ecc
commit: 996bbaea824f317c30977c4967f84b10feb3cf40 [90/90] FROMGIT: scsi: ufs: core: Introduce multi-circular queue capability
config: arm64-randconfig-r073-20260426 (https://download.01.org/0day-ci/archive/20260501/202605012135.qpiuGqaa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605012135.qpiuGqaa-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:2294 ufshcd_hba_capabilities() warn: missing error code? 'err'

vim +/err +2294 drivers/ufs/core/ufshcd.c

27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2273  static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2274  {
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2275  	int err;
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2276  
b873a27538dff5 drivers/scsi/ufs/ufshcd.c Seungwon Jeon      2013-06-26  2277  	hba->capabilities = ufshcd_readl(hba, REG_CONTROLLER_CAPABILITIES);
6554400d6f66b9 drivers/ufs/core/ufshcd.c Yoshihiro Shimoda  2022-06-03  2278  	if (hba->quirks & UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS)
6554400d6f66b9 drivers/ufs/core/ufshcd.c Yoshihiro Shimoda  2022-06-03  2279  		hba->capabilities &= ~MASK_64_ADDRESSING_SUPPORT;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2280  
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2281  	/* nutrs and nutmrs are 0 based values */
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2282  	hba->nutrs = (hba->capabilities & MASK_TRANSFER_REQUESTS_SLOTS) + 1;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2283  	hba->nutmrs =
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2284  	((hba->capabilities & MASK_TASK_MANAGEMENT_REQUEST_SLOTS) >> 16) + 1;
945c3cca05d783 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  2285  	hba->reserved_slot = hba->nutrs - 1;
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2286  
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2287  	/* Read crypto capabilities */
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2288  	err = ufshcd_hba_init_crypto_capabilities(hba);
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2289  	if (err)
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2290  		dev_err(hba->dev, "crypto setup failed\n");
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2291  
996bbaea824f31 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2292  	hba->mcq_sup = FIELD_GET(MASK_MCQ_SUPPORT, hba->capabilities);
996bbaea824f31 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2293  	if (!hba->mcq_sup)
996bbaea824f31 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13 @2294  		return err;

return -EINVAL?

996bbaea824f31 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2295  
2be21deeeb950c drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2296  	hba->mcq_capabilities = ufshcd_readl(hba, REG_MCQCAP);
2be21deeeb950c drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2297  	hba->ext_iid_sup = FIELD_GET(MASK_EXT_IID_SUPPORT,
2be21deeeb950c drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2298  				     hba->mcq_capabilities);
2be21deeeb950c drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2299  
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2300  	return err;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2301  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

