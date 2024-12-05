Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EB61917EE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733385437; cv=none; b=LRNs8/HxXmt8sJWD+feqozbBaQV8KIpNsWS6Sl9DVtWVhRmfisP0DTPq9/BHf9yhD+7cDZ/3rpNNKzahqPdKYuBqQUkLsm65w6YsUB2gE80/7toC0FHMIc2hEUWpoquk6ZM6oGoyuVXOMy91Ir01XL7M2Fl99vTQXfKuy4iYtVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733385437; c=relaxed/simple;
	bh=F1vMMuwAFoDkHwZBm++t7q+VR8uPlQsrBpZR8y+yJjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P4cmDIxx9jxzkf/6bvBy+dTz87WXd9MIjnUUaf8Bd/+8rU4MVb3trMP+2uYI9Y1SRHDJl8/eoMvq1cqFJi7ff9E+ksULllXOH9jiSI3pSGtYV5z7/MQWjTiD3SDwUhZ31FcEqSkTT6bvG/raQ/VXhcaNO8AHdZcZa1YWA3CbXS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nkGPNBpN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkGPNBpN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434aabd688fso3642135e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Dec 2024 23:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733385434; x=1733990234; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSsLlOj6OXc23V42BqNW/gh3fvlV9b+0hdUPS+1BG8A=;
        b=nkGPNBpN4+TaV/bgjdjad+aBl7JlhDrCpQNubLNL3w9JhRLGuuHie3BkhdNYOhyR2/
         zo3ISpTDQg2fAM0jgDqW2vWZhyzTtTmugNcKCRjPiG9KtH5p4tPPiLTLbPgvCliFpBOj
         o8k21Mn4EMrZE8fsXr/uripHQM5HT61dgg+VhAJPDZC8KYOe59VQ3zwUVvg28FnbrKg/
         3Mc5e0Alraq6AkE/bkzU6jBMA6S6Sc0GWbCFlU7vk6AatOL7BghgAsEii8nQWGl453Bz
         3xRT6u60w71ofyhT0g4K+wz03ANzYZr8Iikm8MNiWxO166+p3GUQiBHPPPvF7XYFTQE+
         wwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733385434; x=1733990234;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSsLlOj6OXc23V42BqNW/gh3fvlV9b+0hdUPS+1BG8A=;
        b=Vk42hLmOvWHwbq3/sv6Amx0goQnJvrS8vNi2BDuAE3zL55ec5lM4YVGWVkpp0tbvDF
         /Ii3/rw8VX1OtkrIrxv1ttV4OGxAbexyjwzCWEPzUiyIqgitfmUfMzomBYqauVdPYlRk
         4XFK5inApksvLFzTZGDq13Do7t/ed9aIPddWHl2mjoBodiJvZe8gtedJJvi3GdKPpjVw
         fELGOearWCCfhc5MpoTe+UQd5e1461l0CA2/ay1WCMCre3NkPtgiJwlqTiWrnHM/2H+f
         1atENleQnaLsAxCPskFsEN0sUX7AQi0kuoslIQQk9E5fxAR3Ye9VuY7klUEfdfG5A5jW
         DU1w==
X-Forwarded-Encrypted: i=1; AJvYcCXBZwiE1Ep2AZ4O6IgDU/v/yDV6dIeB9BoI6IllOe7DMg44qG+jT3vhZucYVaS2TlhxjBourD+GcL618TeY@lists.linux.dev
X-Gm-Message-State: AOJu0YyjG4kmymompI1N9hCsyJxIXqvdf3xVt9YjZJ2ZX5bKGRFsDvjj
	gJ1ft/katRWUPpZj81m+ze26/bTtU2USzliCwZHxmY/zJg1xzjYGWNVREy/oFsc=
X-Gm-Gg: ASbGnct6Wn6dykZyUS7xoWy/fhRNbXzaZGG8gXsBM65QMrRK+Ow5WaDbUtDyKwiYJfd
	w0fmGy023QGHYHl0YtjZiUmY7e0PciqydeEJxFavnctSh/VAy+Se0X5TGmh2UoI2424zKfyj3fB
	QTpzr4UWG4dVWPwFsnxQ4Z3dB2BR4zIp52Sa+p1pVpG0iQbSrHHrzYOD/Cf5fL33TkznNYyehqQ
	CmDiw/WIg3krwZp1baS3cZ23w7Yodm1vlSaksXNvsuTSeI2u+bkkMo=
X-Google-Smtp-Source: AGHT+IHszvKAEabTDYMNv1rnsllHsMOQgvXUR8bPrFp3c/n+BiGL06Sn7/DHAymKBfj/Q8u/ukzA7A==
X-Received: by 2002:a05:600c:4686:b0:434:a830:936a with SMTP id 5b1f17b1804b1-434d3fcc419mr48440785e9.21.1733385434070;
        Wed, 04 Dec 2024 23:57:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113508sm14706285e9.35.2024.12.04.23.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:57:13 -0800 (PST)
Date: Thu, 5 Dec 2024 10:57:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [bigeasy-staging:futex_local_v4 7/11] kernel/futex/core.c:1364
 futex_hash_is_invariant() warn: signedness bug returning '(-22)'
Message-ID: <3f216cca-7830-4aad-a4c4-21713e185590@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v4
head:   e259acd3e886368666385efb91f818174ea67e7a
commit: f660409ae182f97b143c93355f4bb216db994f62 [7/11] futex: Allow to make the number of slots invariant.
config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051021.huhObpLe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412051021.huhObpLe-lkp@intel.com/

smatch warnings:
kernel/futex/core.c:1364 futex_hash_is_invariant() warn: signedness bug returning '(-22)'

vim +1364 kernel/futex/core.c

f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1355  bool futex_hash_is_invariant(void)
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1356  {
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1357  	struct futex_hash_bucket_private *hb_p;
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1358  	struct mm_struct *mm;
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1359  
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1360  	mm = current->mm;
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1361  	guard(rcu)();
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1362  	hb_p = rcu_dereference(mm->futex_hash_bucket);
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1363  	if (!hb_p)
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03 @1364  		return -EINVAL;

This should probably be return false?

f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1365  	return hb_p->slots_invariant;
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1366  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

