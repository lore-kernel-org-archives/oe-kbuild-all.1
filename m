Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCA6331A6F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 18:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033276; cv=none; b=Th+oampU/OI/vX/ZSnqkzPyPG41BQ3l6rB8gVjPu3+YiPoHTRjnHpnU4RiXqQPhenOg+jfKinGiPsnxBj18y4tKpYZO8q3VRdP7bxC7RAKcyMY0GDKNjLfcB7ZnS/18hAOLkizKjPn1tyuso/6iaC4jfzGtnlpves5Oh6K/LSVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033276; c=relaxed/simple;
	bh=GQ7xMVEZLD5NQxyvJoFkD8bBJ5jvx+31KpCya6b10Og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NmfzU8x0E5R02WNTjepfsV2jNa7Ve/tWSJwS8+tbaEx3IxidwFUdNI9WW/h9yXQm/DlcGPWSVJX+yvKoQyumjpXlzyzS0oNHkpLTUrqA78hjWAJHfBoD3qWnP+N3qKByRniICA+WM3vsU7xuKkBOf0r2OI6LLXUeg/98V8wGZ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SKvVnuwE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SKvVnuwE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47774d3536dso74482495e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 10:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767033273; x=1767638073; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nr91K70rt3WmdtNfcY0q62ndrh71Bv97ILpFFhRlS8k=;
        b=SKvVnuwEZOkl3GQls/3o74KPJXmMcLfeKhdXZ4WnpXCbOCpxYU4uWKPAMLrb5bs+GE
         1FqBqMAB8gPYpWpp9IHhuFCU8lpOC6TNIcBpjwKAP+Lb8/QXM+WEY3m92gqYgQ4I0o0B
         A8DJ3aUE3AehGovv5WkdBr4WW+onMAKFWn+QpiLyc6UXFoj0FMvQ8KxKt7fquWX8m4gT
         +gkob/YgsGVsfK+NtYnCxCpDgih3GsYX+XCT58hO+xvtttEzoI8beNyk5HbD3nZeWp+k
         VxA6ehgpCHwvfs3UqTA/eTktXA/XzUg0ASvnzflfn5edxUtK+zsn6aJd7VhujEdCY88M
         STWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033273; x=1767638073;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nr91K70rt3WmdtNfcY0q62ndrh71Bv97ILpFFhRlS8k=;
        b=XJhTvlmA/Sz03dpFbgBuPCbKIXTvu7AkwhJ1qaFIsHRWsrHxGdWUQus7mrzqTkMp07
         NvKHZdM16OscDnMAdcw2RdHOGHutrWfdITuMYzVwvWHxsgUUNZD9kIl+nspfFvnceF+V
         owwnrhFfsVll8wIJh3eZrG33pbOSSDGAKpCv0QaiU23EaMR2qutgmaUjfxl+RHSiQ1XO
         tRZB7buRktEnbFRzMwG3pGMUEBfyDbQtTucBm+JY4NQCOe58RxX5if0gAaUvJVd7MQxk
         JIeDhqKzR7nKiQ7fD/4rESkgl0Kg0fWw/DtFjZrDQNuy9YHxMdQOgcVa/lk+nSndUED8
         e72Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDfQIGEPZvTcQqgCQrMKYDnG4l52dzQ7NqXKD3m5PqkM79sT7IrdPkVxas58rOFvun2ZERL6ZZHcFosL+F@lists.linux.dev
X-Gm-Message-State: AOJu0YxFLo6lQKSjevM524caDIf3KyElTMa3ONjNuYcpcDUqLxAeBm3X
	7yYo53dCJtIsR628SOet/CG9KUUsG9QjrM3FBbE3lfqBCO8lVPzEKV41uBRW0jK0Vf0=
X-Gm-Gg: AY/fxX7qId9Liu+DMWMAeSvw+QSYhOwsAX8Kd9uT0HrZPrCLG4qVwd8VWMgaN8k3eO9
	qKeKwcHrtirWHdabHWtR2v+cdy5HtVG2Eszg1z8kq5o4E47T+VAKjcmmhlhV/grvXiPN14Sd7Cg
	42rlClm1wiFV5RkjbFsTAa4XpFegTnIHPP483JuPPygLhjoEu3kYRflFygGgzSilRs1jcFGrWQq
	xYsQ4q7397LZMJ4SwPF7yUG1ksCrauzky88SlStRgb7JsnRkLpw5SxhcQkBApQQ1brO+ti1RRDL
	PTn4Fcw+JcRtAprlNclk2x5H2VVPwEvtchaGo1smqpEWIrzG5QIBYTj68925Q5dKkrlIvTFYFlr
	LP8ORJFUdP2JMnbdoob68+WG/xnXxVyax1qxaa9yjwkbjXcm/NVNhsW2PugzdmogLyZ9BHZTGM6
	U08qHFqItym5bD/62G
X-Google-Smtp-Source: AGHT+IFyvtCwCdCWVCPqOLQx86R4c8w12IBiLbJxoWISJne2pV9OsemXk8ywV+RuC9euQFI2K3ppTw==
X-Received: by 2002:a05:600c:8718:b0:477:9d88:2da6 with SMTP id 5b1f17b1804b1-47d18b0ad6fmr351765495e9.0.1767033273011;
        Mon, 29 Dec 2025 10:34:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm63763174f8f.0.2025.12.29.10.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:34:32 -0800 (PST)
Date: Mon, 29 Dec 2025 21:34:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, SeongJae Park <sj@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 39/109] mm/damon/sysfs.c:920
 damon_sysfs_sample_add_dirs() warn: missing error code 'err'
Message-ID: <202512271918.xuSlfGd4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   1d3e0ce41f6d1140a6ca73d505b536f2edc92e40
commit: 4cba4bd330b3be68e2624d824965554e1ba6a48c [39/109] mm/damon/sysfs: implement sample/filters/ directory
config: x86_64-randconfig-161-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271918.xuSlfGd4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512271918.xuSlfGd4-lkp@intel.com/

smatch warnings:
mm/damon/sysfs.c:920 damon_sysfs_sample_add_dirs() warn: missing error code 'err'

vim +/err +920 mm/damon/sysfs.c

381d987c8a405a SeongJae Park 2025-12-02  901  static int damon_sysfs_sample_add_dirs(
381d987c8a405a SeongJae Park 2025-12-02  902  		struct damon_sysfs_sample *sample)
381d987c8a405a SeongJae Park 2025-12-02  903  {
381d987c8a405a SeongJae Park 2025-12-02  904  	struct damon_sysfs_primitives *primitives;
4cba4bd330b3be SeongJae Park 2025-12-02  905  	struct damon_sysfs_sample_filters *filters;
381d987c8a405a SeongJae Park 2025-12-02  906  	int err;
381d987c8a405a SeongJae Park 2025-12-02  907  
381d987c8a405a SeongJae Park 2025-12-02  908  	primitives = damon_sysfs_primitives_alloc(true, false);
381d987c8a405a SeongJae Park 2025-12-02  909  	if (!primitives)
381d987c8a405a SeongJae Park 2025-12-02  910  		return -ENOMEM;
381d987c8a405a SeongJae Park 2025-12-02  911  	err = kobject_init_and_add(&primitives->kobj,
381d987c8a405a SeongJae Park 2025-12-02  912  			&damon_sysfs_primitives_ktype, &sample->kobj,
381d987c8a405a SeongJae Park 2025-12-02  913  			"primitives");
381d987c8a405a SeongJae Park 2025-12-02  914  	if (err)
381d987c8a405a SeongJae Park 2025-12-02  915  		goto put_primitives_out;
381d987c8a405a SeongJae Park 2025-12-02  916  	sample->primitives = primitives;
381d987c8a405a SeongJae Park 2025-12-02  917  
4cba4bd330b3be SeongJae Park 2025-12-02  918  	filters = damon_sysfs_sample_filters_alloc();
4cba4bd330b3be SeongJae Park 2025-12-02  919  	if (!filters)
4cba4bd330b3be SeongJae Park 2025-12-02 @920  		goto put_primitives_out;

err = -ENOMEM;

4cba4bd330b3be SeongJae Park 2025-12-02  921  	err = kobject_init_and_add(&filters->kobj,
4cba4bd330b3be SeongJae Park 2025-12-02  922  			&damon_sysfs_sample_filters_ktype, &sample->kobj,
4cba4bd330b3be SeongJae Park 2025-12-02  923  			"filters");
4cba4bd330b3be SeongJae Park 2025-12-02  924  	if (err)
4cba4bd330b3be SeongJae Park 2025-12-02  925  		goto put_filters_out;
4cba4bd330b3be SeongJae Park 2025-12-02  926  	sample->filters = filters;
4cba4bd330b3be SeongJae Park 2025-12-02  927  	return 0;
4cba4bd330b3be SeongJae Park 2025-12-02  928  put_filters_out:
4cba4bd330b3be SeongJae Park 2025-12-02  929  	kobject_put(&filters->kobj);
4cba4bd330b3be SeongJae Park 2025-12-02  930  	sample->filters = NULL;
381d987c8a405a SeongJae Park 2025-12-02  931  put_primitives_out:
381d987c8a405a SeongJae Park 2025-12-02  932  	kobject_put(&primitives->kobj);
381d987c8a405a SeongJae Park 2025-12-02  933  	sample->primitives = NULL;
381d987c8a405a SeongJae Park 2025-12-02  934  	return err;
381d987c8a405a SeongJae Park 2025-12-02  935  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

