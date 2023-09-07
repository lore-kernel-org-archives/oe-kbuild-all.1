Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0955677
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 10:52:52 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31c3df710bdso775347f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 07 Sep 2023 03:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694083971; x=1694688771; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1wPPunoJweAisiG61XaqfURd25US3DbZZdoZ6G+g2JY=;
        b=TDonnHg1K0dMKQa6BiBdgqChqqSwmOioD0C3Rg+RkTRXJ42wTp61UvcunMxLDgDqnO
         YQNoJldidps6PDcAxz/dLwrm1zDLBLVYZrw18Q1wZJ4SHLnjjWOmbe0S9KlR5z2xAYPD
         JTei7VMBBIm+RNQ5fsTtud6ojF2f2IDGvdTfY5c2j+DMwovmF4gjrt87TCW9hSqA0pvs
         aegdrDwkUVimCvtv6VuoFrxFyxjEaCHmtDou9J+4b7+1PTPpPMPIXXlNji/xXKBSu1fZ
         jm51EhTp2nSPyb5DfoZPwAgSLLlYXrNChZzxO0feZrWhVSAKV6vA+k4qXWZBX5L6/5dS
         Lqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694083971; x=1694688771;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1wPPunoJweAisiG61XaqfURd25US3DbZZdoZ6G+g2JY=;
        b=Q1yHcu0Tt+9b8ME5wnJ/6pgJ2fI12z+Q2RMjDA28BNYyaG2BDXUPWjBI3Ga3NT/z0B
         uU7mwKxW1p5AEqZDIWvRpXhJ/gmgaQvVoxgiNqUjiXR3k3mTLhdSMt/mVbG6vGixDXVK
         A8vzBU/4MuLqKlXaGEPbSFaRXVKze0xCDoInLXb5UIiUhoKa/RadkRBlsTe1Xdjf7G3G
         gqT7evz6h2Z5bBZZtlLy+vTFzoexVIRCyt3AeuLm4QxfS0mrvWQHyLQyodh7SgmZmDuu
         6A06VZ+gI/RC24sJ3QGHebk9MrcQuMD1EJXr5a/RbJTL/fVt2/OPdZdh/n7h5/aGW9cf
         1wZQ==
X-Gm-Message-State: AOJu0Yw5b10QNyqrF7J6QbLcxi7bF7Gen5Eblfx5WnPfymmpq4TX/Dkv
	9MwWirZSMeSL9NCqYEcwKaUHdw==
X-Google-Smtp-Source: AGHT+IFkGoYeNhD80XRXiu4J3BySdBgX4kx7Q/cBAx337ZDivO9FJW07aVYeg6Jxv26gzJ+jFFW2XQ==
X-Received: by 2002:adf:edc9:0:b0:31c:8c93:61e3 with SMTP id v9-20020adfedc9000000b0031c8c9361e3mr4104296wro.60.1694083970810;
        Thu, 07 Sep 2023 03:52:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l10-20020a5d4bca000000b003180155493esm22952369wrt.67.2023.09.07.03.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 03:52:50 -0700 (PDT)
Date: Thu, 7 Sep 2023 13:52:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rob Herring <robh@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: drivers/of/dynamic.c:935 of_changeset_action() warn: possible memory
 leak of 'ce'
Message-ID: <eaa86211-436d-445b-80bd-84cea5745b5a@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   99d99825fc075fd24b60cc9cf0fb1e20b9c16b0f
commit: 914d9d831e6126a6e7a92e27fcfaa250671be42c of: dynamic: Refactor action prints to not use "%pOF" inside devtree_lock
config: x86_64-randconfig-161-20230831 (https://download.01.org/0day-ci/archive/20230901/202309011059.EOdr4im9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230901/202309011059.EOdr4im9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309011059.EOdr4im9-lkp@intel.com/

smatch warnings:
drivers/of/dynamic.c:935 of_changeset_action() warn: possible memory leak of 'ce'

vim +/ce +935 drivers/of/dynamic.c

201c910bd6898d Pantelis Antoniou 2014-07-04  925  int of_changeset_action(struct of_changeset *ocs, unsigned long action,
201c910bd6898d Pantelis Antoniou 2014-07-04  926  		struct device_node *np, struct property *prop)
201c910bd6898d Pantelis Antoniou 2014-07-04  927  {
201c910bd6898d Pantelis Antoniou 2014-07-04  928  	struct of_changeset_entry *ce;
201c910bd6898d Pantelis Antoniou 2014-07-04  929  
201c910bd6898d Pantelis Antoniou 2014-07-04  930  	ce = kzalloc(sizeof(*ce), GFP_KERNEL);
606ad42aa3b1fe Rob Herring       2016-06-15  931  	if (!ce)
201c910bd6898d Pantelis Antoniou 2014-07-04  932  		return -ENOMEM;
606ad42aa3b1fe Rob Herring       2016-06-15  933  
914d9d831e6126 Rob Herring       2023-08-18  934  	if (WARN_ON(action >= ARRAY_SIZE(action_names)))
914d9d831e6126 Rob Herring       2023-08-18 @935  		return -EINVAL;

No kfree(ce).  Probably we move this check before the kmalloc()?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

