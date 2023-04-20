Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1825853B3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 10:18:11 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-2eed43bfa4bso422266f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 03:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681985889; x=1684577889;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pw9A5+zsiMect2+0K0DcF9fBy0AzZZUeAaf+XrZGrao=;
        b=afy9EH6s0rirq7SWDYgJL6ui/k2P9RqWy9PbaDYLOo1XZtV1GwOZ5hsqOcX8Jjj+s3
         I6B9XMrvxHZ7q/Hj4mqiA7aU2GFfJphWAJrcGR470JSGI8mcQvX5b5RPjOjBmY8nPcK3
         hYWoc+AOheBDuCSiD2hZRVKQVk+AAa+p2w+qc4ctGyHYKSQtpTz280CCiNTTC6kqKT6Q
         0Zt/XXkganHv//YTDvErdJMcPv70hgvzmrwxyr7UHgaN46Ki9PiaPPuN/f5IBdo9ovgN
         7tAQn2xVjknqRH9dV9q+6M7CZDLxq1HFMbfRcrlrkOy3Mr6blSpgAnT3X//GUKC6nyJg
         IfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985889; x=1684577889;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pw9A5+zsiMect2+0K0DcF9fBy0AzZZUeAaf+XrZGrao=;
        b=ZgmRgv0OpKv87zy3GjrjIzDb7GO7ytuodURoaLoNLuMbK1rh/0mJt5XCelaBiCJ/6s
         T0shyP3bkQiIGz2QeeYFpO7sGbLwbuhCQ08M6XG7wmKqd+/jxBef930IIAlwDL2xgWmI
         q9tXpU6qIIClhEKQlQ0nW3NxpB3fXEri27JlCsaYdGLPL9H6eRAifhXnMSdHn5YoQ6KX
         F9SNJe173QouA8Blgn/GNoYV/mPoTIfSGZbtAEheoDOYS+fz+Tr7V9z2RYWLpiu5aaNt
         HrCNZVc8ZEbOMwlk+kdMt2G2kyeNq/+hVlgLT31SXjJ5taYkX4B1+Lxt+vp+lWPej9FJ
         arxA==
X-Gm-Message-State: AAQBX9cFbP/Xca7BikOIxsnJBKMo5iT5f3dEKwY3dW/mg/H25b1DfhMA
	JVJiXMtnT/sbKt9yyRvhQlhuow==
X-Google-Smtp-Source: AKy350aJN3ko2EWo+eWfwj+J89HRyw/epA6v2yJ4NbXNS8KwuC16UQVRPDOQLerGiLr2myJzPATEWg==
X-Received: by 2002:adf:efca:0:b0:2f5:5538:2589 with SMTP id i10-20020adfefca000000b002f555382589mr962090wrp.31.1681985889335;
        Thu, 20 Apr 2023 03:18:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w23-20020a05600c099700b003f17af4c4e0sm4925611wmp.9.2023.04.20.03.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 03:18:08 -0700 (PDT)
Date: Thu, 20 Apr 2023 13:18:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sumit Gupta <sumitg@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: drivers/soc/tegra/cbb/tegra-cbb.c:96 tegra_cbb_err_debugfs_init()
 warn: passing zero to 'PTR_ERR'
Message-ID: <531e22c6-39e8-4a39-a190-c752c4d146be@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb0856346a60fe3eb837ba5e73588a41f81ac05f
commit: b7134422146692e096e807751656fc58ee1a717d soc/tegra: cbb: Add CBB 1.0 driver for Tegra194
config: arm64-randconfig-m041-20230419 (https://download.01.org/0day-ci/archive/20230420/202304201719.AnFYgA2p-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304201719.AnFYgA2p-lkp@intel.com/

smatch warnings:
drivers/soc/tegra/cbb/tegra-cbb.c:96 tegra_cbb_err_debugfs_init() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +96 drivers/soc/tegra/cbb/tegra-cbb.c

b7134422146692 Sumit Gupta 2022-05-12   88  static int tegra_cbb_err_debugfs_init(struct tegra_cbb *cbb)
b7134422146692 Sumit Gupta 2022-05-12   89  {
b7134422146692 Sumit Gupta 2022-05-12   90  	static struct dentry *root;
b7134422146692 Sumit Gupta 2022-05-12   91  
b7134422146692 Sumit Gupta 2022-05-12   92  	if (!root) {
b7134422146692 Sumit Gupta 2022-05-12   93  		root = debugfs_create_file("tegra_cbb_err", 0444, NULL, cbb, &tegra_cbb_err_fops);
b7134422146692 Sumit Gupta 2022-05-12   94  		if (IS_ERR_OR_NULL(root)) {
b7134422146692 Sumit Gupta 2022-05-12   95  			pr_err("%s(): could not create debugfs node\n", __func__);
b7134422146692 Sumit Gupta 2022-05-12  @96  			return PTR_ERR(root);
b7134422146692 Sumit Gupta 2022-05-12   97  		}
b7134422146692 Sumit Gupta 2022-05-12   98  	}
b7134422146692 Sumit Gupta 2022-05-12   99  
b7134422146692 Sumit Gupta 2022-05-12  100  	return 0;

Debugfs stopped returning NULL years ago.  Debugfs is weird, it's not
supposed to be checked for errors.  So the correct way to write this
is:

static void tegra_cbb_err_debugfs_init(struct tegra_cbb *cbb)
{
	static struct dentry *root;

	if (!root)
		root = debugfs_create_file("tegra_cbb_err", 0444, NULL, cbb, &tegra_cbb_err_fops);
}

regards,
dan carpenter

b7134422146692 Sumit Gupta 2022-05-12  101  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

