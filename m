Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD27A30C63C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 14:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767624257; cv=none; b=hwZE4teN15A5cWJtLPtSSre0Vk5CbVRo1k9faaPQmeUIvYmg/eagzsJz5Ksx99s4wG7OKEc1ukWkQaNn9yuqDHn7OPhxHzGVkvkb3sB7eqlN5ScxvfC3nPjwSoKloGjB/4H/XUc9JPQut/Hg8IVJxyHW6zMUXlkH5YBmBASGtUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767624257; c=relaxed/simple;
	bh=O4oHg1x7/FVeYZEjDjsJe5dUJQNff9knQPeiTY9yq70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fiHDPb5SZ2CIUtwltFTK701ry3E18PT5HivVbErc23MmRj51PwdRYiz05zAeupzuil7+aAwvv6R7sjRTJ389DPy79M1npVYnbrQyJUBptX5CAARa4Hnu2qE+dVJAmOTQeFi4bMX1SRqUY966CcoZxzGcjECEni/+41fVZT967yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/Zg6CQO; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/Zg6CQO"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so112422465e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jan 2026 06:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767624254; x=1768229054; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0s3/W3DhA/SNqTs62gob4briHzwAa6pw4T0S0GTBua4=;
        b=K/Zg6CQOQ3uUTrkQ4b3BoUDzEyNWRFdsfuPb5O5SBAoHlMhPpcGKiDeUGHDwBnJDsw
         Do4SByhH0bSnysOCDSGoCuae5dzMnoES7yklEjSVZ9PfEYPDG3kxSENWLPRvvjDnDKQ3
         uex6xxJyrksdg/ZG2jUUDVZuWD1MjdtsosZImKLDA2FgimMtdixDITTlAdvcaeBd17Oy
         fIbyaYYmU4b+C3rC3n39oITOfp5LlJx+e2dNZlghlge3roLTVAYt6O25Qs7wlwy3J4m9
         wzS6F6HX74x+Fc6o4HTjkVSDB3tqyAmKEpWiUHqqUIpZVeDDYDHhjJpjzEhIU5ttbJ/t
         RQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767624254; x=1768229054;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0s3/W3DhA/SNqTs62gob4briHzwAa6pw4T0S0GTBua4=;
        b=n3J9iFg4y0vhxzk49edfiGFCkWjuU+SGaYELVPIc/nCRW9qTyGpSW9lnI7dUViOvah
         CmJtZ7Ayl+zELd7XYU1BbpslGoQmQbp3Mbu+5Nqc8z71a9A/f9chnJSnguLp3D+L84Lm
         /SDUXP8HtVuGqFYQCv3tj80rMrxjpweRryZVpwBVsfSH8/dd5gltJqvHOGrepO55kASh
         rr5PUnv1UyU/c0VzgahhPUkSId44Iz+f20nJgnJO3KLQcZZRiPp+NYBkJuQNdYNsfyW6
         pOdds0g9hk7iZOct9MmUGJyslVH/sOQctGI6LpD72BNmAclTAApraRWA0T0GXuwi9VuA
         djJg==
X-Forwarded-Encrypted: i=1; AJvYcCWN22nqvF7HBUIyIbV/DWVWqx3Dj2t/YvpAuLX1zmLfcSTw0jAzr3XooH+3oWEi9RR521OzPMKaxVQKPZmi@lists.linux.dev
X-Gm-Message-State: AOJu0YxMIeYMEGi77rTkQhI4eIRfTi1XGTkK3+sUldGc3EcP8u0/fe5C
	uOQgA+OOvE6LO0talAkalNoFY4vk54AIPVGL4XwkkQC6VoiX+1yyhoteVcrg2xXKaYkm77HMzdb
	rS3Uv
X-Gm-Gg: AY/fxX7lWGQYA5VkotDHdfUuL9X7xiwlK+JZKbXxFpAhYtLRI1bdWa++97gL0NFgmeA
	G3KjtiSQIhY8fswb0j65DbhCk0HAvLX6wBHyBhGtb9recenIUPsBdNReKv2mdMHTAu6VoMP1nOB
	d9OpTgmAxkbimWYMlDvQOc+ZRz6KmLfA6MiBmjwPZYrVldPlTxFaCvBHikwSX/oxCeKsRnBnU0R
	qLfEe/EPopR7C69AC228sbiBzBVD3XkBTVOo47VqNWb2wevjuXYVUEY4yXRF5N7kQQJ926t2yfu
	5o5gq/SPFFQ5aUZvH4ZGGtkTJPMUY98eRvMsPiJk8ZMdG8EifwZWkTkkE1qPpxYlZ7muVKpIphu
	MkTQTaqbBW5tc5t9pn6IMwkXh4hQ5G/+ZxN+NILs6FVWFyZRK22aHhBarucaMLIy/HqoccNtV5W
	PR+4fokhfxRsMHzvrX
X-Google-Smtp-Source: AGHT+IF+l6Cm2NJ3PJQH/LSXQb25Qv7DHVtaG9zUkkcbrEv/3wgVnGZ0HtGojBx5Mjv/+tu2QG36nA==
X-Received: by 2002:a05:600c:444a:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-47d1959eae7mr619888515e9.29.1767624253972;
        Mon, 05 Jan 2026 06:44:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432613f7e6esm92348183f8f.21.2026.01.05.06.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:44:13 -0800 (PST)
Date: Mon, 5 Jan 2026 17:44:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zach Brown <zab@zabbo.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 1/1] fs/rpdfs/block.c:312 put_block()
 error: uninitialized symbol 'now'.
Message-ID: <202511040921.YBdsnwZz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   e8e76da7ed715ef67ccc4436f4981a5b39983d9f
commit: e8e76da7ed715ef67ccc4436f4981a5b39983d9f [1/1] rpdfs: initial commit
config: x86_64-randconfig-161-20251104 (https://download.01.org/0day-ci/archive/20251104/202511040921.YBdsnwZz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511040921.YBdsnwZz-lkp@intel.com/

smatch warnings:
fs/rpdfs/block.c:312 put_block() error: uninitialized symbol 'now'.
fs/rpdfs/net.c:301 rpdfs_net_invalid_sizes() warn: impossible condition '(md->ctl_size > 255) => (1-255 > 255)'
fs/rpdfs/super.c:178 rpdfs_parse_param() error: uninitialized symbol 'ret'.

vim +/now +312 fs/rpdfs/block.c

e8e76da7ed715e Zach Brown 2025-08-13  305  static void put_block(struct rpdfs_block *bk)
e8e76da7ed715e Zach Brown 2025-08-13  306  {
e8e76da7ed715e Zach Brown 2025-08-13  307  	s64 now;
e8e76da7ed715e Zach Brown 2025-08-13  308  
e8e76da7ed715e Zach Brown 2025-08-13  309  	if (!IS_ERR_OR_NULL(bk) && (now = atomic64_dec_return(&bk->refcount)) == 0)

If bk is NULL

e8e76da7ed715e Zach Brown 2025-08-13  310  		free_block(bk);
e8e76da7ed715e Zach Brown 2025-08-13  311  
e8e76da7ed715e Zach Brown 2025-08-13 @312  	WARN_ON_ONCE(now < 0);

Then now is unitialized

e8e76da7ed715e Zach Brown 2025-08-13  313  	WARN_ON_ONCE(now == REMOVAL_REFCOUNT - 1);
e8e76da7ed715e Zach Brown 2025-08-13  314  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

