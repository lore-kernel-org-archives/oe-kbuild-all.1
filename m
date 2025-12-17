Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9499364024
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987427; cv=none; b=PD2xz0W4yF9ADb3k5VE5TyDaIi3N6JP2RH4SxzNpYyaUhuMEl2s/SKNwA/6sBB8UMOuKJcD1ksCkW+aVTTtGt+9qKV4lkJkUnWIfWPD2Xhob6879Hwj4D0VD2p/PVA60+m/Te/vwAe7yTB0O86wDOtMyzb5ONLLputB+9YZ1SIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987427; c=relaxed/simple;
	bh=GlIJ5of1Zl2EkqR+zuhItWNm9NIA78SnJpZyxdS0BDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OTe8zisnfk+khds1rLf5gYF13DxyxO4Z5sR7erlRNKN+zeMamuRCThS6l7SsBXN/zFF9JpbgEeF/FJ54VQuowwdEkfo640THz4WDEq7nm4Ubvupg/mFRqskFNe3giCiwDEnGMz+r/hiGjFwq7znOH346Lk+etUi7b3nKq8dI/IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CnzfUStl; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CnzfUStl"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-477563e28a3so4615905e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 08:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765987424; x=1766592224; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oRjU4HeFbLAsTOgZNHTW+iAgENcpj7ArfHAuBzphWhc=;
        b=CnzfUStl4+/qLluRBSj6eukeucHvcf6zRNGXp5jTfn2qL646TldbG7Ua6LyeCAwuFd
         fN6y1zo7JMUzYVBpRBCtW90THylfkpCU7H5pYGJURRPUYlM0wkIfB6y9PqZxKMtX3Ut/
         TO1mwfFnBAAsGsEpPe2TBUWODF2rFLNFOHmkSjYTCPLKXgT2xdLSIzWfCL7Oyqrs0TMT
         tp7gDaYE7Jlcoc6moERJOseAt9+P1SxIOBdolKbLxrSoYsBhyxoYed+HBwFrck+A1lFZ
         DSSvHvVXvN56s4BIUwt6cMDTvKG+GRaoFLhXb6BLdBE9eLCxCb3W0jldsPxbVlArsgKW
         YbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987424; x=1766592224;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRjU4HeFbLAsTOgZNHTW+iAgENcpj7ArfHAuBzphWhc=;
        b=sE1Pfb8td36Ooxk69jmqAIu+sXM38ajHoOyjylXKNa8goU8quMKqR+m/8QohhFCaXp
         S3ikYNyoX1dqzTOmNjbZLBQzd1UMQOqHneE/jTD4wIJ/qlvhcTpCtqke5uHPFTJ7MSCu
         G6zJR+N9cdbXjFCFjIuPk78MGD5lDL3zZ/Mu0xZceBufGfDn5uKE28Pw8E3KvEW/cXIu
         b56egon90jyDuKE0+inNeVmj0sqDoE4mD7PdaQ1XgchdrVuxViECAJku7pAu2jLRINUP
         EdcW+Fop3BrEB459FJGpzfogXQANI9aNG/xRoS6EwXM9rJAMFyyKdu89gpItQYiDpqn7
         PF7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV28nOkV/CQke8U/cU9lfdaM7uVo9WNRUZWbrADmCGM59oV/FheLaeE+ONr7muULhaGECR+24hv+Noz1Kf0@lists.linux.dev
X-Gm-Message-State: AOJu0Yw34qzA0GH1wwm4rZwz/ZKHLHoboR8hE01fta+6KpxKc7M84w3b
	Ufje+v3JGiMqD6x+Cd5eULScLoLDcuy72U6R9STlG6n+OWmIYs/JGGtEvCN19G/d3hA=
X-Gm-Gg: AY/fxX76IMubg8B5mOVmq3jTHlmgm+XZ/D9Le50xlawXnYolfYY3ctzzq0GUf5rJrRk
	tyQGiDpcuX3akTsbV6kp/+CJgOqKXYD0zlXfF1Yeutptt7thBFo/hMexxitl0k+P2IwC60PBgvt
	bVCla2E6y2eDpYxqr8ZnzDP2hqkDj1fnZTKL+ULWeQ7iOi/15axqo5rA+GavBFQNw9RhKnbRJxs
	itSB2Id+G+WjnAhYs/m96aQbl4g/tjMgPBZDJUaIDegsXpG99YYtBH2N6FYlECjkD14tSEU//GX
	SjGisGleahPXHg2p1leVLt3vK9JGzvABXtzU4DV6CzQ7TBCK8DmaVWdz8QKzXGVnFvIahVMTLCW
	kBFnAsc2ROn3RfYQlZGfxQG5sVcKPBK+MIJWubHcpKrvm1alNYogCTaJxE51DMZcc8r3cupvpcd
	p9prCcQztzWVjNlmbZ
X-Google-Smtp-Source: AGHT+IGWpXhuggxM6b45Knw0C849qblvhFH2i9u2Vx0XfSWoeEeYDL2GBKZJTuX8RwWmO451J8ANMA==
X-Received: by 2002:a05:600c:1444:b0:477:9d31:9f76 with SMTP id 5b1f17b1804b1-47a89ecc2a7mr176545925e9.12.1765987423867;
        Wed, 17 Dec 2025 08:03:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ade8072sm5700285f8f.25.2025.12.17.08.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:03:43 -0800 (PST)
Date: Wed, 17 Dec 2025 19:03:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, SeongJae Park <sj@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 44/115] mm/damon/sysfs.c:920
 damon_sysfs_sample_add_dirs() warn: missing unwind goto?
Message-ID: <202512141528.AD9GSzHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   4daf22e4c21ef13ee2779580295eb0073dc3163b
commit: f4df9946a1d00c8aa6326f28807efec79af1c2ea [44/115] mm/damon/sysfs: implement sample/filters/ directory
config: i386-randconfig-141-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141528.AD9GSzHJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512141528.AD9GSzHJ-lkp@intel.com/

smatch warnings:
mm/damon/sysfs.c:920 damon_sysfs_sample_add_dirs() warn: missing unwind goto?

vim +920 mm/damon/sysfs.c

4242d70b872082 SeongJae Park 2025-12-02  901  static int damon_sysfs_sample_add_dirs(
4242d70b872082 SeongJae Park 2025-12-02  902  		struct damon_sysfs_sample *sample)
4242d70b872082 SeongJae Park 2025-12-02  903  {
4242d70b872082 SeongJae Park 2025-12-02  904  	struct damon_sysfs_primitives *primitives;
f4df9946a1d00c SeongJae Park 2025-12-02  905  	struct damon_sysfs_sample_filters *filters;
4242d70b872082 SeongJae Park 2025-12-02  906  	int err;
4242d70b872082 SeongJae Park 2025-12-02  907  
4242d70b872082 SeongJae Park 2025-12-02  908  	primitives = damon_sysfs_primitives_alloc(true, false);
4242d70b872082 SeongJae Park 2025-12-02  909  	if (!primitives)
4242d70b872082 SeongJae Park 2025-12-02  910  		return -ENOMEM;
4242d70b872082 SeongJae Park 2025-12-02  911  	err = kobject_init_and_add(&primitives->kobj,
4242d70b872082 SeongJae Park 2025-12-02  912  			&damon_sysfs_primitives_ktype, &sample->kobj,
4242d70b872082 SeongJae Park 2025-12-02  913  			"primitives");
4242d70b872082 SeongJae Park 2025-12-02  914  	if (err)
4242d70b872082 SeongJae Park 2025-12-02  915  		goto put_primitives_out;
4242d70b872082 SeongJae Park 2025-12-02  916  	sample->primitives = primitives;
4242d70b872082 SeongJae Park 2025-12-02  917  
f4df9946a1d00c SeongJae Park 2025-12-02  918  	filters = damon_sysfs_sample_filters_alloc();
f4df9946a1d00c SeongJae Park 2025-12-02  919  	if (!filters)
f4df9946a1d00c SeongJae Park 2025-12-02 @920  		return -ENOMEM;

goto put_primitives_out;?

f4df9946a1d00c SeongJae Park 2025-12-02  921  	err = kobject_init_and_add(&filters->kobj,
f4df9946a1d00c SeongJae Park 2025-12-02  922  			&damon_sysfs_sample_filters_ktype, &sample->kobj,
f4df9946a1d00c SeongJae Park 2025-12-02  923  			"filters");
f4df9946a1d00c SeongJae Park 2025-12-02  924  	if (err)
f4df9946a1d00c SeongJae Park 2025-12-02  925  		goto put_filters_out;
f4df9946a1d00c SeongJae Park 2025-12-02  926  	sample->filters = filters;
f4df9946a1d00c SeongJae Park 2025-12-02  927  	return 0;
f4df9946a1d00c SeongJae Park 2025-12-02  928  put_filters_out:
f4df9946a1d00c SeongJae Park 2025-12-02  929  	kobject_put(&filters->kobj);
f4df9946a1d00c SeongJae Park 2025-12-02  930  	sample->filters = NULL;
4242d70b872082 SeongJae Park 2025-12-02  931  put_primitives_out:
4242d70b872082 SeongJae Park 2025-12-02  932  	kobject_put(&primitives->kobj);
4242d70b872082 SeongJae Park 2025-12-02  933  	sample->primitives = NULL;
4242d70b872082 SeongJae Park 2025-12-02  934  	return err;
4242d70b872082 SeongJae Park 2025-12-02  935  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

