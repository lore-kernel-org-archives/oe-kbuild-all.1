Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0414E18018
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 May 2023 11:50:44 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f41dceb9c9so13442275e9.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 18 May 2023 04:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684410643; x=1687002643;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4GbFMPjUFF9uuaXdP1MBvbLG15PgOtEOYz2afufGOGY=;
        b=ZyycZsK+W7vqKI/wajkBrmb/IKov5NEyGA5ouG/8DGclQF038y5DfFqsrTMB+s4fkr
         eUGu+Ty4MdnljIQAFZHjHlNj5slsxBed0cCB2uYNy+OMtI6nCu9EW6DI1l5AikSkH83j
         TFtIKlbT4Ngy4x1gS3WQ4N72Pf+MZUIEmW29/lCRvFkn6rUUjaKXF0hV+hXaT/JGoCzz
         nDOwhQrTzZwqw0r09ybNpIqPF5gzKuwopKPShlBduTJtb02FvXh0PizifEpErC/5pnHt
         Ney4bxUFVy45qSHTUHoHiQY0XE+FMUjrlyCjmTiXDsnXsq0o/gcleEFBM5B1FlyfZi1x
         qe9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684410643; x=1687002643;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GbFMPjUFF9uuaXdP1MBvbLG15PgOtEOYz2afufGOGY=;
        b=ZOTCdRJujr5AQPcuxmY75t9h+qr/+wsW7gMv2//w1mI1Ld9LlO5jfuTn3/R5cT55+R
         TbXkOaUUHw4PF813QaL/0K0QvhiLTMPBx67fRZFUox/fVYYAklzcGEiY+Sw2b3AiSSQ+
         ihjU5jsdu53m6AOmH+pZjcakU9gsEnEsia2LKtKjP87yn86c2kpNE24wexDyhE5pSFY0
         aNTc8O8r3SStv2sM/OgjCer3Z9dhMn+GW4LDJcEJiR+om051uIlASqD6Kbit8IeJJMba
         QWxWRTsmu5/vStW+wn1//oKwgQMqfuo6MGH1wS1KPQSBfOYxLA/xbaP8dC389soz1jyY
         sqnA==
X-Gm-Message-State: AC+VfDwHJtzNKSd3pUG2LFW95pFIYng+cHdXu3y4+zeBM/D7Gr/2g+hY
	UxANunRV953JXqpprgGgJIKKtg==
X-Google-Smtp-Source: ACHHUZ4qI1udVkiV6/Ew6tml0v++zojqe1Evt5p7G+qZ1+mBqq0DfzHz64PbkWrAGEdbtJ+FKGlc6Q==
X-Received: by 2002:a7b:c847:0:b0:3f5:42e:7229 with SMTP id c7-20020a7bc847000000b003f5042e7229mr1035527wml.41.1684410643102;
        Thu, 18 May 2023 04:50:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v14-20020a1cf70e000000b003f1751016desm1822077wmh.28.2023.05.18.04.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 04:50:41 -0700 (PDT)
Date: Thu, 18 May 2023 14:50:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tinghan Shen <tinghan.shen@mediatek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v12 07/11] remoteproc: mediatek: Control SCP core 1 by
 rproc subdevice
Message-ID: <11b3ab8d-1264-4143-8eec-b2ef9f691814@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517043449.26352-8-tinghan.shen@mediatek.com>

Hi Tinghan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tinghan-Shen/dt-bindings-remoteproc-mediatek-Improve-the-rpmsg-subnode-definition/20230517-123659
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20230517043449.26352-8-tinghan.shen%40mediatek.com
patch subject: [PATCH v12 07/11] remoteproc: mediatek: Control SCP core 1 by rproc subdevice
config: csky-randconfig-m041-20230517
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305181957.ZMXChgJV-lkp@intel.com/

smatch warnings:
drivers/remoteproc/mtk_scp.c:891 scp_core_subdev_register() warn: can 'scp_c0' even be NULL?

vim +/scp_c0 +891 drivers/remoteproc/mtk_scp.c

69e1791d92cfa0 Tinghan Shen 2023-05-17  884  static int scp_core_subdev_register(struct mtk_scp *scp)
69e1791d92cfa0 Tinghan Shen 2023-05-17  885  {
69e1791d92cfa0 Tinghan Shen 2023-05-17  886  	struct device *dev = scp->dev;
69e1791d92cfa0 Tinghan Shen 2023-05-17  887  	struct mtk_scp_core_subdev *core_subdev;
69e1791d92cfa0 Tinghan Shen 2023-05-17  888  	struct mtk_scp *scp_c0;
69e1791d92cfa0 Tinghan Shen 2023-05-17  889  
69e1791d92cfa0 Tinghan Shen 2023-05-17  890  	scp_c0 = list_first_entry(scp->cluster, struct mtk_scp, elem);
69e1791d92cfa0 Tinghan Shen 2023-05-17 @891  	if (!scp_c0)
69e1791d92cfa0 Tinghan Shen 2023-05-17  892  		return -ENODATA;

This NULL check isn't right.  Use list_first_entry_or_null() if the list
can be empty.

69e1791d92cfa0 Tinghan Shen 2023-05-17  893  
69e1791d92cfa0 Tinghan Shen 2023-05-17  894  	core_subdev = devm_kzalloc(dev, sizeof(*core_subdev), GFP_KERNEL);
69e1791d92cfa0 Tinghan Shen 2023-05-17  895  	if (!core_subdev)
69e1791d92cfa0 Tinghan Shen 2023-05-17  896  		return -ENOMEM;
69e1791d92cfa0 Tinghan Shen 2023-05-17  897  
69e1791d92cfa0 Tinghan Shen 2023-05-17  898  	core_subdev->scp = scp;
69e1791d92cfa0 Tinghan Shen 2023-05-17  899  	core_subdev->subdev.start = scp_core_subdev_start;
69e1791d92cfa0 Tinghan Shen 2023-05-17  900  	core_subdev->subdev.stop = scp_core_subdev_stop;
69e1791d92cfa0 Tinghan Shen 2023-05-17  901  
69e1791d92cfa0 Tinghan Shen 2023-05-17  902  	scp->core_subdev = core_subdev;
69e1791d92cfa0 Tinghan Shen 2023-05-17  903  	rproc_add_subdev(scp_c0->rproc, &scp->core_subdev->subdev);
69e1791d92cfa0 Tinghan Shen 2023-05-17  904  
69e1791d92cfa0 Tinghan Shen 2023-05-17  905  	return 0;
69e1791d92cfa0 Tinghan Shen 2023-05-17  906  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

