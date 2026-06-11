Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3BF3DCDA4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176800; cv=none; b=nZv3YlcYaP6DiaXAZGgt1wIn1feV7k1vb1S0bsM/urMDQgZg+D8T+5ZxPBMFxzvbNqfVN5R+3NGZUmdmo0/yQTsVaFq3etCocp4E1Dxd3RBXnUDyysRw0PkFQKu8FOhgBQVH2kslKU1LRdYQCbs6ZhjgUur3IRZ76AN+2aVxGQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176800; c=relaxed/simple;
	bh=fxYLO9HD2iCGubfv3LFtpfQozDHJ4rIXVNR9DeiomaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kMYhLJgedQh6wlnE6PZo9nS7n4G1YrL3igcLqd5JCH0XTitXVgJ7I/AQnaF7b4Aba3/qncz+PLysRcBf09BsNwX4SEVY04CldY+D+y9Bo0UeGNsooFqhOFEzNWIdnFN2xJR1W+glgcISmuQdcGrgB3x9S6GOxWnDLi/b8zdJOj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dmrc6lmb; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dmrc6lmb"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-91591f19c30so1141847285a.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 04:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781176798; x=1781781598; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6t9UzwtLsdthmiUIXMFdRm3409bQDOGnzbrc7Xpt57Y=;
        b=Dmrc6lmbHBc+O5+Zn9+eT4KQXOWoXiA0vG/s3bD+iGJgG8moNyg7gMXjS9YsrP9/+Y
         baV0pjDdxfNcvhV0+w4F2CMad/v+EQHn1QxkzmsvfmaC6hN336fLRFBXSsHv2LWlk8VS
         A5LlXaXT3kVCKt09Udrtwmf/gHKk4byjNCd9T7GlGryC6NLprPWbQx6OeZeNXYR0XZKK
         DlbarZLDG21ekBWPDcLx96+UnSAZ35wGPJX7STEzxa1YU/BF9UL2MK2htzQtg3tfaA3E
         yW6vSQayLmWOSnDHL9OynpPSfDvWU9JWYMK9v7qYOhU2TKMXgx7PkFvXAIxlrs1RXS82
         TljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176798; x=1781781598;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6t9UzwtLsdthmiUIXMFdRm3409bQDOGnzbrc7Xpt57Y=;
        b=bZ0sT3CrZJDnSPl+eQ8ftdI+rZV8LLSRl8O2QEKDCeP57n2GEYLTnzJuYi1QhIWMga
         A+NeNoWBpU/R+RojnM7CHp9+TmqMM+hFjHOcrTJiDitrALYN0mw4Kf+9ptr/e56QcX46
         ZnJ0RpaJGJNK06cwiIyCXlKEXauogqczwn8SMANDLAsSOMu3n7r2QF/JUCiVbAGtBFqa
         SHz8LN+8ut7HbFt3RwR0PXuOF5JNp5LGVusQd2schVkDdLxypLLPxJHAiy9gspg1YbhP
         M7uiUsMXQql5iPMehjgcPhKX/WLEdIa9C//l5V5sMWbwqXfiAmE60EZag4OWJonhfapm
         /MCw==
X-Forwarded-Encrypted: i=1; AFNElJ930corjoO1WH8e5IeoKx68wKKkiLkYZma07mknD4wt1m5/2uYgYKPakt/sdyKGwDIddquEKpt1VaqLHdIn@lists.linux.dev
X-Gm-Message-State: AOJu0YzYCYZwdh/nOyUQwkoqy5+A+HPkYZau7s/Rvt0SijmM545GYH78
	YUgVDRqYa4DcgPrB+vJsZkIur34hJL62PW8ux/GMMvYz8mYrrIX5meIA
X-Gm-Gg: Acq92OFO41y9pLTGJejn988cUAT8EmngKlf5t6tZ6bOtiON4BOk67dORsKGlVd+NnMt
	nAoXk5QVFxF4Supam5opxw246cMG7NtP+2GB+l6/ZHRpUz56Rg6KxFSBlggYMRd+bCi4JvJKir7
	EA9gyTKBx6Zq2XBs+dZ1NORHDZ6gI0ZraUwHMoiNPlxX/7i22ShISv9UGdf8hqI0EYVugdYQFDM
	tKzaeTPoKF+VSRYSdRSvDRn6vs44PotR+RSp9jko13h8Cg46Gt3AxQqO0fptrAZeIZjmA94rVfL
	NIfkqPCyQdN2TEhKjz+WdV7AGXbpReJN/fLn5ePVkCq3MvooyfmTxJH057xTahU2haI0YRIW/Ia
	Q9SSyKq56YhjO0RkxFiafGnZF0AHGMM+0QUtNoJYo7pNY4UQ2v1uxiPAtGjGZPXWAa5eBAQbkBb
	ZLowSh5H6SNogBo6aPBCwHF2fdFQQ=
X-Received: by 2002:a05:620a:1a28:b0:915:80e8:67d1 with SMTP id af79cd13be357-9160b09ebdamr307941385a.56.1781176798572;
        Thu, 11 Jun 2026 04:19:58 -0700 (PDT)
Received: from localhost ([149.40.50.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d1eadaea6asm15010306d6.40.2026.06.11.04.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:19:57 -0700 (PDT)
Date: Thu, 11 Jun 2026 14:19:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, T Pratham <t-pratham@ti.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn: can
 'dev_data' even be NULL?
Message-ID: <202606111933.69GGTKxr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ I don't know why the zero data bot doesn't include T Pratham in the
  CC list...  -dan ]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 35c5097f737a164b3afe23d07698db95061f0db8 crypto: ti - Enable compile testing for dthev2
config: s390-randconfig-r072-20260611 (https://download.01.org/0day-ci/archive/20260611/202606111933.69GGTKxr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35c5097f737a ("crypto: ti - Enable compile testing for dthev2")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606111933.69GGTKxr-lkp@intel.com/

smatch warnings:
drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn: can 'dev_data' even be NULL?

vim +/dev_data +44 drivers/crypto/ti/dthev2-common.c

52f641bc63a4665 T Pratham 2025-08-20  35  struct dthe_data *dthe_get_dev(struct dthe_tfm_ctx *ctx)
52f641bc63a4665 T Pratham 2025-08-20  36  {
52f641bc63a4665 T Pratham 2025-08-20  37  	struct dthe_data *dev_data;
52f641bc63a4665 T Pratham 2025-08-20  38  
52f641bc63a4665 T Pratham 2025-08-20  39  	if (ctx->dev_data)
52f641bc63a4665 T Pratham 2025-08-20  40  		return ctx->dev_data;
52f641bc63a4665 T Pratham 2025-08-20  41  
52f641bc63a4665 T Pratham 2025-08-20  42  	spin_lock_bh(&dthe_dev_list.lock);
52f641bc63a4665 T Pratham 2025-08-20  43  	dev_data = list_first_entry(&dthe_dev_list.dev_list, struct dthe_data, list);
52f641bc63a4665 T Pratham 2025-08-20 @44  	if (dev_data)

This check doesn't make sense since list_first_entry() never returns
NULL.  Maybe list_first_entry_or_null() was intended?

52f641bc63a4665 T Pratham 2025-08-20  45  		list_move_tail(&dev_data->list, &dthe_dev_list.dev_list);
52f641bc63a4665 T Pratham 2025-08-20  46  	spin_unlock_bh(&dthe_dev_list.lock);
52f641bc63a4665 T Pratham 2025-08-20  47  
52f641bc63a4665 T Pratham 2025-08-20  48  	return dev_data;
52f641bc63a4665 T Pratham 2025-08-20  49  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

