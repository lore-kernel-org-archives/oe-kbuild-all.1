Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF83373BF2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278397; cv=none; b=eeNDGVEBP1SIDnKlCxc2U63RHVF9Gzr2N1NZ0Xc8bqo8IC7Il9torWCqRujhzp2nnIFz3WtdAt5SAgsPobgljL91szxJBL1sVr/da+5LV107zo6b99/k/zA4U48VMNrzp3hblU1Y/u+NUOU1Hbo3VLWDN4NymqHiuj3qQsq9BYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278397; c=relaxed/simple;
	bh=D4OPKXNCI2mRzG0TnZ+CzdX2qzo0B7kxu4wIErrqL68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BlQ3o9l4XYlo2SjyGx6fSE+e8pbyj0I1MJZIzjUomOKzyD27p0vW9kKW6luDaYyLFsqq2N7+5XD3uwSHG6/u8t+jEvEw8PAMfSZtWnwVxzt1mjIoJdJ+ZlZ6ywmqxdVTqsVnL/GCjF5E7kut0zPvEZMWXwzh1DzhIRjy4G0sIWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ou04HTEn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ou04HTEn"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44a14580111so3500478f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779278395; x=1779883195; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NvywlcvTDBPY9Q8O/25hv62l6tvsLb0vc03TW80ZQ/M=;
        b=Ou04HTEnF73qPrRvBzIgq6ge9GEpf4yDnougezozOyhkhFI76oc3ApmE/3oKMSGchI
         fp9Ls40IJYoPy4PMPNSUpvTr0ArJU85sFZ+wWT+8Cq3jt7GiEu7Ir3O6s0INaXejInGe
         1So5h6EvfLwkOOI/XoB5fvi7q+HvMgUwZR+0BqwoNEXReLJ8ViKT53gPwYmAPEHXBvrj
         MNwvURq84uX51V8E428IT5JefJHCkJjV8/vXrTK6FCUKV2eY3euWDQMW5Q4McHNPLvcB
         Dkay/EBVzThgpYuGEncQ7NxiYswXrxePa5VkqEw/xw86WU4U9B1EC4f+MFYnVgdYdSQD
         GI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278395; x=1779883195;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvywlcvTDBPY9Q8O/25hv62l6tvsLb0vc03TW80ZQ/M=;
        b=kjN2SxmKZPWAu684C+Q7vleOzbuZrvkG4rd5kx82cSsHH8VzJMwe2oNPuWTqiDJmBd
         /fP+/cswsSx7Zyqu2bj+Qa9fcc9ofTWmxFFjGdrmPhDevr1l/DYhX/nhRKHZ0V0GFL5v
         eeWf63DsAKaSDZxt8DKP+eOjNHZWTbL0jfjHQfCcPlPyfFxtenb6ItTJ4gpMu6pYBgYK
         m3mbdATCuQtmInojbQRvey5sXWimAybosqUxpHYWFOJOoNEMCI7KIznD+4SXwjutkrcl
         +KDnZWAzctBf/jAVUU/uZjp44DAgMXRlYXc+d8bu98xDqgSzsz7SMPowWmQhuNeZERhW
         qhCA==
X-Forwarded-Encrypted: i=1; AFNElJ8/ii0Rhqih5UhlkPYD223eZVVuOQYtQ4f8PWQOpS17INSy/3iw2ecXDE0MgzzkHbfhw/OrjMcYVocjFEPw@lists.linux.dev
X-Gm-Message-State: AOJu0YzpQ1JCzUIoTsx3ZZWTmtAVhR68Xk8V/zFQr2GLNlvdaUxhhD0d
	+anVUZhIttAojkj1AmVYa/Mf3DUcLfRCBuAmymlJuOK6GjgN4OzSwc2x
X-Gm-Gg: Acq92OG0OI2nkwbsSGkRyX48Zb7QccY3Yn0sA2d7VQrjcJg01h2MbrU7PhU+an7DYL/
	6WRlj7Aaaw7XLAp9ZdSrqF/23u1+Qya3GyCAdwRzQMPaEVgYOi9LaAqtuzFdqYU67g0JNF61VMM
	DvMXrq/G4PwvcGqEHXEyU6pC9yAcDNpepFwgs5gvslQgmlT91MCMuZDWJf6sqCbYx9vrshho4Ni
	/goCVlDg6CtPVA/cCPaLU7xzERq/4VVouqpt/p2dJMMVMBwTMZkIbTN6cjwKmPMQIz6UXDoQqMH
	fH+RqD5nL5UATPkkAvjh45Els7YRRohEkBGPispufLDPgildK6TwXyxdBlMDSaMERnPNpb9E7GV
	Hpivw1PDdTFBHF70OaCdnUUThcMACjAyWwv/e3qsLnS5LZrZHvYNVooH4+n3KAjVYHxLWM64ozP
	Tg5UiIFlxhrLiE7HbSRG3bn9Ey7MD6X/j4yQ==
X-Received: by 2002:a05:6000:22c5:b0:43d:6fb7:fedb with SMTP id ffacd0b85a97d-45e5c60a30cmr39828626f8f.36.1779278394553;
        Wed, 20 May 2026 04:59:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm58034649f8f.10.2026.05.20.04.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:59:53 -0700 (PDT)
Date: Wed, 20 May 2026 14:59:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-next 20/24]
 sound/soc/codecs/cs35l56-shared-test.c:681
 cs35l56_shared_test_case_base_init() warn: variable dereferenced before
 check 'regmap_config' (see line 665)
Message-ID: <202605201958.A1xdeuzB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   4ad5b674ca5f0f0bb7db547acc2491fadcf8c51a
commit: a6f7c21accb5fca895ee0d490e395deecaddf12f [20/24] ASoC: cs35l56-shared-test: Subtract reg_base offset in dummy regmap
config: microblaze-randconfig-r072-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201958.A1xdeuzB-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605201958.A1xdeuzB-lkp@intel.com/

smatch warnings:
sound/soc/codecs/cs35l56-shared-test.c:681 cs35l56_shared_test_case_base_init() warn: variable dereferenced before check 'regmap_config' (see line 665)

vim +/regmap_config +681 sound/soc/codecs/cs35l56-shared-test.c

9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  651  static int cs35l56_shared_test_case_base_init(struct kunit *test, u8 type, u8 rev,
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  652  					      const struct regmap_config *regmap_config)
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  653  {
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  654  	struct cs35l56_shared_test_priv *priv;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  655  	int ret;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  656  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  657  	KUNIT_ASSERT_NOT_NULL(test, cs_amp_test_hooks);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  658  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  659  	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  660  	if (!priv)
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  661  		return -ENOMEM;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  662  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  663  	test->priv = priv;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  664  	priv->test = test;
a6f7c21accb5fca8 Richard Fitzgerald 2026-05-19 @665  	priv->reg_offset = regmap_config->reg_base;
                                                                           ^^^^^^^^^^^^^^^^^^^^^^^
regmap_config is dereference here without checking.

9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  666  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  667  	/* Create dummy amp driver dev */
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  668  	priv->amp_dev = faux_device_create("cs35l56_shared_test_drv", NULL, NULL);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  669  	KUNIT_ASSERT_NOT_NULL(test, priv->amp_dev);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  670  	KUNIT_ASSERT_EQ(test, 0,
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  671  			kunit_add_action_or_reset(test,
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  672  						  faux_device_destroy_wrapper,
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  673  						  priv->amp_dev));
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  674  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  675  	priv->cs35l56_base = kunit_kzalloc(test, sizeof(*priv->cs35l56_base), GFP_KERNEL);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  676  	KUNIT_ASSERT_NOT_NULL(test, priv->cs35l56_base);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  677  	priv->cs35l56_base->dev = &priv->amp_dev->dev;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  678  	priv->cs35l56_base->type = type;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  679  	priv->cs35l56_base->rev = rev;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  680  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05 @681  	if (regmap_config) {
                                                            ^^^^^^^^^^^^^
The old code assumed it could be NULL but probably it can't actually be
NULL?

9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  682  		ret = cs35l56_shared_test_case_regmap_init(test, regmap_config);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  683  		if (ret)
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  684  			return ret;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  685  	}
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  686  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  687  	return 0;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  688  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

