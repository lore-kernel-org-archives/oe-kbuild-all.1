Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED984399011
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Apr 2026 08:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278031; cv=none; b=hodb6Wq0MuDt6Wu89UD6mLyZrdBtSxKr3qeFR24k0fBeq41gdUjqg7YPo20AT8k2h8yrnTnHJSyOIt96gaXrVmvHexk9b1lDj7gksPkhoJ9m4bUCiGvTPUVAQb9NXw+b422DbzIWGjPK73818BZ0+A9XB1vyagnWqRHn8uPvU40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278031; c=relaxed/simple;
	bh=SHWXQ1cgbA1qNXkw3j2S87uVcsp0R/vJ+bG5CzJrFxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hDNK326Drc/aZvVPrzIfEUdEXb7VzYt3+w4FyD1d3tgb6FyxKzD6IDCOP2gt0urU+eI9O9Hi/nUTUWw44nBtiE8okOz91OzL78xj936X3Al7adflLWhM1LUglMMBvCwkkedKQY+lKZbggUdzvRxgG8TWefdz+ZRXVt+chdTKe+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAT1PlRa; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAT1PlRa"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso80862835e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Apr 2026 01:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777278028; x=1777882828; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IeaiHiIBeUzYTsoUR9UbM/X9KQyMJU7iFyB30GIRQpw=;
        b=FAT1PlRazEpM750oWqoNxbzNMNgv02JvNJc5zEEbnCTvEaGjrCYHUOyLwCgcNbF8BT
         TlMu4nIl8BjbH1Bi80Ps1fcLKadg86WYKI+Y/iwoxBaKFbTVYDttZMoNoNTGaW2/CVyX
         Rj+GbziocPtLmhYlsgxov4Dy1ECIzbwrMcskcpGp3FNApAwbKMllCOE03ZtAH3Yk04js
         6RSa395EeR62DdDxTpE6C0UhbxnLqk6WLEs8wEmsaP7ATZmNwS/6Kz6/5CvF7ZTFm7nu
         QZbqUi5/EKex5DFg/qIkIqEAbKIfBPBAPD2gBGisA4JCYEeBrhpL2oMFiAef+yW2SHqD
         ytgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777278028; x=1777882828;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IeaiHiIBeUzYTsoUR9UbM/X9KQyMJU7iFyB30GIRQpw=;
        b=HANY0NTkE2Q+V3+TWEL7J8JjuZVDv0EtRSmopyWYOjAbB1MbB6Z9fVro12ap/u5xVg
         m4LJoq6GRp14wISmdmOg9vCIxISyb/c3YmOOKpKU8wvCRTHE9+qPj2pYpwOxcIK9+/N4
         /Bdfyywx3gaa+jZ5SsrbQ2aPkmhve9ZslHsYagXJg5XpNrEi7xh195k7Q9EdoTvySMPk
         TdqJsQG7cVqV6P1gtUaadJJF9UMRTKp5lZUyMu8k1vtXjb0RHqmpSF9IBut5gzadqgbg
         GIMBCBWg3wgrG8F0aJRcTm2KvwOZsD7QFASU350uC8OPTC+vjgWPSxgLKKVWqCac7HrQ
         CQ6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8tdi5p2TmKU+rgstBpKAuqgAtGGt9/3hYxZgIO4ZKEbzrBOvF1L0bBwrM69D6UG8Xm18J1nJJ81asAj9if@lists.linux.dev
X-Gm-Message-State: AOJu0YyH1SD8l2cMWFLZSx8wjwa1iu9Xl6FbzIiJii6ff92fpiMLOeih
	Ce3gRJtV2I9lt5X/hIYzNnCvMtsXirYR/VaBM7qeJX/BEPkHoOkJYBYT
X-Gm-Gg: AeBDieuRSz0HQBH+BKP79mKceHTK6Ceh7Au39FcRqTSAQcaVDtR1COE1F8XmCC9kH15
	LFxWWtzeAuftKm2U1LNwWqSFQoaPmZTuTpzrrKZ5q3GKYRzdJXSdpR4GOJA0glgJa52GcWR79+N
	uLMjCObjy33okMoMMyqHivVaJwOZyK/zRjdMd4JpAoywZ7NBMaI4SG9F024nLCW3nPrXdj40TQX
	F3TX7GUX2fD1cuOALZleiXp0wvam8/B7vBFcsMw3a0UxTfQVSW54VW8ZmBCuCqAfxcZK1mqSRFa
	YzKbV2ZcdhKrFiEm6Qw+Y60KLlNFriKHsHXFOM7I5KTZ3sGQWl6CZIROvHq+pzIQpCBfyKwhsn5
	/gUOoHd+xiQ+UdJox1f4J2x/cBXGDHcrSiL4MGk03PVTOKqiQPp/L0UEx4ux8CCNGlAEYqBY3rj
	HAIu6wC4WH0SBMbUNkuph+0F9jwDYmEw==
X-Received: by 2002:a05:600c:1587:b0:489:1c02:773a with SMTP id 5b1f17b1804b1-4891c0277bfmr266423375e9.31.1777278028198;
        Mon, 27 Apr 2026 01:20:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm604003145e9.1.2026.04.27.01.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:20:27 -0700 (PDT)
Date: Mon, 27 Apr 2026 11:20:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 90/90]
 drivers/ufs/core/ufshcd.c:2294 ufshcd_hba_capabilities() warn: missing error
 code? 'err'
Message-ID: <202604271024.4NqzRoy9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   60204d422ab64b04f22d60b06861bc9134aeab5e
commit: 996bbaea824f317c30977c4967f84b10feb3cf40 [90/90] FROMGIT: scsi: ufs: core: Introduce multi-circular queue capability
config: arm64-randconfig-r073-20260426 (https://download.01.org/0day-ci/archive/20260427/202604271024.4NqzRoy9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604271024.4NqzRoy9-lkp@intel.com/

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

return an error code here?

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

