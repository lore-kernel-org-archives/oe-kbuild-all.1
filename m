Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00D6315D43
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 06:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779949234; cv=none; b=Fm1VqMtjedrrji916q3HTyiyFOJvu8+LaQljtTCrFwToaF1BZI8hzxkY2JA2Zwo9HVgxzzINHaekyGHoaWTpvezRsJf4MTbmJUddBvo4il79JtF1MDammxlhUKd0qlXDmVICncCHemGw/ZFhCafe0mBrk5XmZcl4zmpnBhdyY/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779949234; c=relaxed/simple;
	bh=2egaF4JqOz/gl9SLUY90HURXnn0GR2GdC+N8/MNudYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nYvewHeskLF2mSLYnmBYyuyr2rnmZ+FiQEJcsN5EdoJlvIGK0w8HpuHPknOLAKrxE7cCeupmAAKRTl/tvUpNiDGDMvq5XuLhWs8mp1fgSfb8UVSDWRMjjK6CU/9Kmpjx9/CvoMcnsIWZTQ5jY/Md6i7O5IqiIML4IjeV5j9qOXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YecaFJnz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YecaFJnz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49050bfe053so29626195e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 23:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779949231; x=1780554031; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0DmSmrXZPiEu0OyuVrKN0In8ljbty3VMv6sMMRIM3c=;
        b=YecaFJnzLOSjGuKl38aaK+gWiNv4eIKnDBzrr+bTHzOWNBaMvkyb8ANROaPrm+/g2C
         SzRU3P5F7gsTGJKrh9CxE/jmDP7i/Yxy5DIia1X7o9p4Cw28YnAMuED1Rpyb+moekomL
         06bXL9+dVEDz0CiMG9sv5zJ7gzpZb9Ni5bXC7RRBSZfbTIcneKXQw4havgecguHGU5Vp
         T+xP1qGcOMVMweoySG3ZlRAnUiovFItRSoeXwL87VVUAfjmCylvPykiRLz/d8oJVl1+C
         VzgG5G0+FOODjbuTYY8RTR9L8NPq6Qe9eAfsXHtQV9a5fabQULN3GMHyqXUeKT7Rs3Nh
         0JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779949231; x=1780554031;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0DmSmrXZPiEu0OyuVrKN0In8ljbty3VMv6sMMRIM3c=;
        b=MEZIemFqzckPxDxBaBiyKUEKtVvjqwaUVY6ZWsfAJITUHXYpDuE0JUPgxVe3HCiMNF
         FhJMiZQgKzYAvq10Iu7IqPFuFsci309mz9dFZ8O4PY6lVPBtXhQ4PJjKQeRoDE5FL8AR
         lPWNUpRvYh71aTm5anec7cHBJuBqomuU+zphXWsW0R8UqIEydTstvtayznTaFFvg7mKS
         +wxYLL8YUMbhJyooYyIZ88z0uOFBb6+dxmhrb7ECGC0oEqxQ/AhDuT9xuquOWLrkCoVj
         U3InHLZvn59jcwOvyTHyCyxb4b9LR+mQC6nYDPeQNu9NbwNUSMFB13N8SZnVtNTBjk+j
         CQyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tzmt2RQTNWOXy/i9Rw5l+2WPQ7PUQHHcIrK5KGpZhJDXGo3ZZsgKSUdG6RWyzG8GVa/agd5pOg8K+8L8B@lists.linux.dev
X-Gm-Message-State: AOJu0YyCVv6heSnsmLUjq2GRl73q6wvSqYRTbKP7fUf8/hbOGdTlT4/f
	kmFGFtLkctMfkoAOIW4WIYNcoz3iQU/FFlZ6Opj3zlHUvjgVN3V1xTOE
X-Gm-Gg: Acq92OEY5Sm9nDJAfWpUrV5LVGHQstbJQ7QBxkvAyMLiC2Iogpcdj+GTfvgYJ0Ws6wK
	OhwQ2czd4h5y7PWyzmOaf5nzpmMDD7J65cwck/Bt0M6RAVwiuUkDl6JPpwtTLVhO6xSAwR8m/aa
	oQ0rltQpeDKo9K4Rn27SgRaOUdueOVhk991mfIdlh+QmkgEk2F0BcRCXDzdkqhMw/Lq4uPe61FC
	qrcueEtH/jhaf8VJytjDameG4jTiKkgz8x0q4BBN4XZFr1AaJYA+/oUlsM/cb3HtIB+8PqySqU/
	clsMKvKs9RxR1qkFGZ27wL9JofmrtBPysFA7aEbxv38cW1u44TEcr9taCf9LxXyO9/8n74jVYAr
	qffuXdNp42ikGfiNK1cNAzz4KIuC2iGoewtEA6fmUWsnuEYIADrvTp8SDXl/NjgU/pUQmwatXA6
	phCKHSlacGdVqOqJVOf1SI+3Vd3Ij0o+l/TQ==
X-Received: by 2002:a05:600c:4f0f:b0:490:50e4:7224 with SMTP id 5b1f17b1804b1-49050e474d4mr424196945e9.3.1779949230846;
        Wed, 27 May 2026 23:20:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a817d3sm23909105e9.10.2026.05.27.23.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:20:30 -0700 (PDT)
Date: Thu, 28 May 2026 09:20:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 2/2]
 drivers/misc/pci_endpoint_test.c:292 pci_endpoint_test_bar() warn:
 signedness bug returning '(-61)'
Message-ID: <202605281200.z115VoHV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   7d38f5b0e4b0d06970e261174e220a997a0908e7
commit: f615e8d2dec6746127d4667c3cae81bfd6a1ed3a [2/2] misc: pci_endpoint_test: Give disabled BARs a distinct error code
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260528/202605281200.z115VoHV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605281200.z115VoHV-lkp@intel.com/

smatch warnings:
drivers/misc/pci_endpoint_test.c:292 pci_endpoint_test_bar() warn: signedness bug returning '(-61)'

vim +292 drivers/misc/pci_endpoint_test.c

2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  282  static bool pci_endpoint_test_bar(struct pci_endpoint_test *test,
                                                              ^^^^

2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  283  				  enum pci_barno barno)
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  284  {
2a35703a6a00e8 Niklas Cassel          2024-03-22  285  	int j, bar_size, buf_size, iters, remain;
2a35703a6a00e8 Niklas Cassel          2024-03-22  286  	void *write_buf __free(kfree) = NULL;
2a35703a6a00e8 Niklas Cassel          2024-03-22  287  	void *read_buf __free(kfree) = NULL;
cda370ec6d1f7b Kishon Vijay Abraham I 2017-08-18  288  	struct pci_dev *pdev = test->pdev;
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  289  
f615e8d2dec674 Niklas Cassel          2025-01-23  290  	bar_size = pci_resource_len(pdev, barno);
f615e8d2dec674 Niklas Cassel          2025-01-23  291  	if (!bar_size)
f615e8d2dec674 Niklas Cassel          2025-01-23 @292  		return -ENODATA;

This is return true;

f615e8d2dec674 Niklas Cassel          2025-01-23  293  
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  294  	if (!test->bar[barno])
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  295  		return false;
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  296  
834b9051992580 Kishon Vijay Abraham I 2017-08-18  297  	if (barno == test->test_reg_bar)
2a35703a6a00e8 Niklas Cassel          2024-03-22  298  		bar_size = 0x4;
834b9051992580 Kishon Vijay Abraham I 2017-08-18  299  
2a35703a6a00e8 Niklas Cassel          2024-03-22  300  	/*
2a35703a6a00e8 Niklas Cassel          2024-03-22  301  	 * Allocate a buffer of max size 1MB, and reuse that buffer while
2a35703a6a00e8 Niklas Cassel          2024-03-22  302  	 * iterating over the whole BAR size (which might be much larger).
2a35703a6a00e8 Niklas Cassel          2024-03-22  303  	 */
2a35703a6a00e8 Niklas Cassel          2024-03-22  304  	buf_size = min(SZ_1M, bar_size);
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  305  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

