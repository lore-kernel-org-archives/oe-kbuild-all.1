Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBBE1D517B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736159864; cv=none; b=hP0rWWI/ANqWXzEo5vvzs6HwTrdWSWgZy6F7MsCuRlMlmA0iFICrGCFkbmRpLKaWdCDy8vEaftNLwT8vakwxDeqtqiG3udUQH+op1gLQgHlo9gmp4IldUlszx1gxSAdBCqljPf5gLxzqQ4YuyfXUQ1sr85xbd8AwLvqp6NO9wOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736159864; c=relaxed/simple;
	bh=quRPf5+PfHdlHnEA5M8N5dGuP+LWwVuW1Fda+pYW0vU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HB9Szv6wOzWKbhtyCljALBS6+PcCQhwD/nsPUS+QIJL7DCi+K5p8WRjOpPA9vMcOfc6md3tBmBgy9o3M2vUV72UzeY4Jn9j8yXCN1qaDLVObJIM+lLsl8aRKmug6DOes99eoNh1W6JH3WLvEx5KO3NKdDUTU5ULtLcdp67O15AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cf0PvqNi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cf0PvqNi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43618283d48so102578685e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 02:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736159859; x=1736764659; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jw5iGf3snAWQVAPigHDpYqiFBGsnJPk5BPWBWM1emNU=;
        b=Cf0PvqNivqoJBAfHyVdiAXeeohWSzQqQhFD3L9dmP4+nSIEHRxcql+bsojck1RILnm
         qGJ56zEDf1B82N8Z0gUY2qde6zOb58/LhTE4wPmqI8iWgSkchSorNQm9FCzebYJ8zPz+
         0aVhI0nZjB637+NAGy2VlgR4OCCaDS1OTrjt0aq6SQ2uBvk3IMWJguWpEsgi9GWRSzf4
         +7bapVDp41VP4/ChpHVN06IsluCTNrwEBHT5rGhUnLDafZA+AOHNUE7QbceMowNVP3i1
         9IPU35obDX7Z+dGi+qCIw/32DycBoxGqRygbFObnjLh4HResBz7FyOcQpoxSo8Azz+lo
         9u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736159859; x=1736764659;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw5iGf3snAWQVAPigHDpYqiFBGsnJPk5BPWBWM1emNU=;
        b=TvJxyKmRJ60hJff3Cim5avo8NiLsfUUGFZSiBS3zHJXSXdcW3Y+mvzis0s3lJQvJPl
         nCcmF6sbV2sGcGU06vnscuN3Uao/nhc8rTwrTE/y8G7zoZ+qUedXPD7Xh/QAck0rwU4p
         GXhshLHtgH2VPSvaHjDXSbjbl2pBHydzMwqHmDMw9WqFISV9QXmspynXswIiDjC5EHCe
         gzt8Z7NMuWpsyAg9k+P3l1InO6XXiHmcCvsJHpu2jhVj7QU4N2c+t7A++z2NXyqX3c8n
         MsGO+rEspwBr6e/jZ219j71KiytS3sYC7xzlBS1PwI7QkDELyJLUeeGgR02M+J6Zqy7/
         ofVw==
X-Forwarded-Encrypted: i=1; AJvYcCWrTB/UTM+lTgFyFWD/ZVovui8H+xyANgttCBk1vtMbC5oQKb8u36BsC4bVjnwzslFlg67rALnl3P7SJh13@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ8FgsL9V2ko2zUpowFp6lb6+j6HwtCls3Z3d1ngngeavfVCke
	sENYXWzuVWw5zWKWfXsbfL1xyYbOram3+ItVB+Qu8m8QHW57+jLK6yi0x2plGDQ=
X-Gm-Gg: ASbGnctAtMS/5Skaq/savMlrV0is9pUVqegz6CQHxrWK7R3ND9OLwwPIpIHD20lMf2J
	iMEVLss92QUtyN2nKn6PJtngs9FfipxlXiMdwXEfNx4YEjaG8a1sRBKMV54mbjfvJOwr06fk3xS
	RPgvDPb5CqQbjCXR35geBOxLUWmYBm2UtKa2tQrm7gotYVt0pd7Tk1H/l1ggpdmXwmyCxZLHf+2
	J1ORwzzU9ioNTH4tO3+rzg9AL71iCX+UAlw4QZaiaWZ9ivA9qdBRS2SjHpFeQ==
X-Google-Smtp-Source: AGHT+IEePWXQ2gEoZC/gxUJ3HOXj7WQzEIrzqvnWBH0X6zcyQZd2MJ+n/a8TkfuQDGr42U2R1w+nPQ==
X-Received: by 2002:a7b:cd95:0:b0:436:30e4:4590 with SMTP id 5b1f17b1804b1-43668b7a1d0mr424647475e9.32.1736159858799;
        Mon, 06 Jan 2025 02:37:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm592162175e9.12.2025.01.06.02.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:37:38 -0800 (PST)
Date: Mon, 6 Jan 2025 13:37:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Kishor408 <kishorx.buchi@intel.com>,
	Aravindhan Gunasekaran <aravindhan.gunasekaran@intel.com>
Subject: [intel-lts:6.12/linux 1/1] net/core/rtnetlink.c:1593 rtnl_xdp_fill()
 warn: missing error code 'err'
Message-ID: <ee667823-e39c-4a62-b7ba-f85dad13da5e@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   af28adffb0fe876a7f6b55f145e6cae4861209a9
commit: d422faba40f2b00b944ed5ffa9c365bf904c950b [1/1] rtnetlink: Fix unchecked return value of dev_xdp_query_md_btf()
config: i386-randconfig-141-20241226 (https://download.01.org/0day-ci/archive/20241226/202412261741.KiMk9t5S-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412261741.KiMk9t5S-lkp@intel.com/

New smatch warnings:
net/core/rtnetlink.c:1593 rtnl_xdp_fill() warn: missing error code 'err'

vim +/err +1593 net/core/rtnetlink.c

d1fdd9138682e0 Brenden Blanco            2016-07-19  1554  static int rtnl_xdp_fill(struct sk_buff *skb, struct net_device *dev)
d1fdd9138682e0 Brenden Blanco            2016-07-19  1555  {
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1556  	u32 prog_id, md_btf_id;
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1557  	u8 md_btf_enabled = 0;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1558  	struct nlattr *xdp;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1559  	int err;
4f91da26c81145 Jakub Kicinski            2018-07-11  1560  	u8 mode;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1561  
ae0be8de9a53cd Michal Kubecek            2019-04-26  1562  	xdp = nla_nest_start_noflag(skb, IFLA_XDP);
d1fdd9138682e0 Brenden Blanco            2016-07-19  1563  	if (!xdp)
d1fdd9138682e0 Brenden Blanco            2016-07-19  1564  		return -EMSGSIZE;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1565  
a25717d2b60434 Jakub Kicinski            2018-07-11  1566  	prog_id = 0;
a25717d2b60434 Jakub Kicinski            2018-07-11  1567  	mode = XDP_ATTACHED_NONE;
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1568  	err = rtnl_xdp_report_one(skb, dev, &prog_id, &mode, XDP_ATTACHED_SKB,
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1569  				  IFLA_XDP_SKB_PROG_ID, rtnl_xdp_prog_skb);
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1570  	if (err)
b5cdae3291f7be David S. Miller           2017-04-18  1571  		goto err_cancel;
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1572  	err = rtnl_xdp_report_one(skb, dev, &prog_id, &mode, XDP_ATTACHED_DRV,
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1573  				  IFLA_XDP_DRV_PROG_ID, rtnl_xdp_prog_drv);
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1574  	if (err)
a25717d2b60434 Jakub Kicinski            2018-07-11  1575  		goto err_cancel;
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1576  	err = rtnl_xdp_report_one(skb, dev, &prog_id, &mode, XDP_ATTACHED_HW,
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1577  				  IFLA_XDP_HW_PROG_ID, rtnl_xdp_prog_hw);
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1578  	if (err)
58038695e62b44 Martin KaFai Lau          2017-06-15  1579  		goto err_cancel;
4f91da26c81145 Jakub Kicinski            2018-07-11  1580  
a25717d2b60434 Jakub Kicinski            2018-07-11  1581  	err = nla_put_u8(skb, IFLA_XDP_ATTACHED, mode);
b5cdae3291f7be David S. Miller           2017-04-18  1582  	if (err)
b5cdae3291f7be David S. Miller           2017-04-18  1583  		goto err_cancel;
d67b9cd28c1d7f Daniel Borkmann           2017-05-12  1584  
a25717d2b60434 Jakub Kicinski            2018-07-11  1585  	if (prog_id && mode != XDP_ATTACHED_MULTI) {
58038695e62b44 Martin KaFai Lau          2017-06-15  1586  		err = nla_put_u32(skb, IFLA_XDP_PROG_ID, prog_id);
58038695e62b44 Martin KaFai Lau          2017-06-15  1587  		if (err)
58038695e62b44 Martin KaFai Lau          2017-06-15  1588  			goto err_cancel;
58038695e62b44 Martin KaFai Lau          2017-06-15  1589  	}
58038695e62b44 Martin KaFai Lau          2017-06-15  1590  
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1591  	md_btf_id = dev_xdp_query_md_btf(dev, &md_btf_enabled);
d422faba40f2b0 Muhammad Husaini Zulkifli 2021-07-30  1592  	if (!md_btf_id)
d422faba40f2b0 Muhammad Husaini Zulkifli 2021-07-30 @1593  		goto err_cancel;

Set err on this path?

d422faba40f2b0 Muhammad Husaini Zulkifli 2021-07-30  1594  
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1595  	nla_put_u32(skb, IFLA_XDP_MD_BTF_ID, md_btf_id);
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1596  	nla_put_u8(skb, IFLA_XDP_MD_BTF_STATE, md_btf_enabled);
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1597  
d1fdd9138682e0 Brenden Blanco            2016-07-19  1598  	nla_nest_end(skb, xdp);
d1fdd9138682e0 Brenden Blanco            2016-07-19  1599  	return 0;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1600  
d1fdd9138682e0 Brenden Blanco            2016-07-19  1601  err_cancel:
d1fdd9138682e0 Brenden Blanco            2016-07-19  1602  	nla_nest_cancel(skb, xdp);
d1fdd9138682e0 Brenden Blanco            2016-07-19  1603  	return err;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1604  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

