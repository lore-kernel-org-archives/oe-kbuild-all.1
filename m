Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E70D1D47AC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883657; cv=none; b=oqSlXipMgQ3+6HcYCTiLQmUQWPVmDIQ45C7eAU1wyK18W4nABdcydN400Fz/x2/FD/Uwo8a6cZIr4wUDgiXfrps9/fdu5hM17lLZtGEkpaYDnfZmrhnSD/4GLgJ5aabUHfJxgckrMoF/8BzbKsVl9Rx74dv5LU1M09pljm18jRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883657; c=relaxed/simple;
	bh=PVFtyo7AqUJYdZkGUhECfmLU7AvkdUZRDwLjQIK4xtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cre8chuRbd3jFlgy1jMvQNiL/knMo2lS/kE6dNJXHXSO0Hjv2zYGVuBOiO/8NHe5UYSyueQzX/ntRhODecOMJ1+ro9aGLIUhuv/tP9RDMWYc8eCEdfetErp+YjFZOuge24wu/EuBBYgHiIg9X4xMz6DubW0fYhsQ4VLOU/wXFVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z4MnMaS7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z4MnMaS7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so75284605e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 06 Nov 2024 01:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730883654; x=1731488454; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5WhAQs2Rk+a7ktNox7f3wDkPBIavOxbjMqIBDoGqfA=;
        b=z4MnMaS7aoR039i+3tyr+CnqHBhNcHQjUa5VodxbsK/f0Im/FMTo1b6pm2fn02S8jx
         Eu/d+WJpsvRUf9GW2aXkYh3akA5fDFfVLBbJ6z2nHt1Bqc2dpLr9DIqe5tpHtGkLTXWS
         aWd/YvihU+hCvJG/oWynx1z3z93TJ3GEa0EK+2mtryK+DMpRUEFIz5ZWrIdhDF1154+H
         0oi4y3A7oBm6S2eZVZifllZF5MQjTMs0xoKFUzX9g64f3EkD31mvTAlYqZVFq6c9wdFO
         FRYVEO68IPUJZD5q2vcpbW2OK7ouYUhN0dIZJ5tDP9gapZQpSqtp2uD5MS7Op4JJ9GO4
         xClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883654; x=1731488454;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V5WhAQs2Rk+a7ktNox7f3wDkPBIavOxbjMqIBDoGqfA=;
        b=fpFlRqhwK3lABG7WmTohpV4xWPKa40pYU/q1gms7Wa2qhhnImk/E/IX2qBq5NnkJvn
         Abf6T9/nLejLfCu8fMfXGDtyGduUB78U4+RM9PwaDlo9BWsZLV/3RqPGOvGaNthzCOgl
         MGqmUE/qXaAsxT7S4XfHnLtaGTX5nSC42AcSnQ6mzaEioQl3/uNH7r/qjSAYpqqPsctl
         AlkLntnYHRdOqIEbJhxe7NmO5/aAElJCyitQNlEH/9/1paVKWlChNNIY9ZvsmvetwnQW
         4rvx8XEvKO9pLt2rc24PZUDG9aZNtK2BK+2mYI72zlOL8Si0N38OugbNFKUeGEekkxUo
         JLZw==
X-Forwarded-Encrypted: i=1; AJvYcCUG4id+7HRVYWVoQnMPiMjx+hvxhPt/pAnHr/gtayrZ2AztSxoXmtQBS+NV3m8+NSF22W5zpJdS9Y3ls8yw@lists.linux.dev
X-Gm-Message-State: AOJu0YwkCIg4UXXIQcQyTzPHMD9L5naP8fVP6PfeKNjwS0H9L2/AsffZ
	LhB1qjoN/9L5kRZ5+ZlbL8wba3w2nf+trDkC4J62JAbjlNCC8l5MnyWD93NM9ao=
X-Google-Smtp-Source: AGHT+IHpt8J8Eo3U9bFQSJ/q72GmUvRShEmdSse40XE8i3rIBGaYIKUpHAhQv9aOs4z2nszHn1XHew==
X-Received: by 2002:a05:600c:4683:b0:431:5ba1:a520 with SMTP id 5b1f17b1804b1-432942dd802mr135724685e9.3.1730883653882;
        Wed, 06 Nov 2024 01:00:53 -0800 (PST)
Received: from localhost ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7a9esm18433470f8f.21.2024.11.06.01.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:00:53 -0800 (PST)
Date: Wed, 6 Nov 2024 12:00:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Jiakun Shuai <shuaijiakun1288@phytium.com.cn>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2284/2284] drivers/gpu/drm/ast/ast_mm.c:116
 ast_pci_host_is_5c01() error: we previously assumed 'child' could be null
 (see line 109)
Message-ID: <95bc6882-d0db-42e3-a320-6ac680f5202c@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f705e909a01ee9ae75542457ca95b055dae177a0
commit: 968ee436e4d0ce09994f74015dc163ef280ccc1e [2284/2284] drm/ast: Fixed display error for ps23xx when using ast bmc card
config: x86_64-randconfig-161-20241029 (https://download.01.org/0day-ci/archive/20241106/202411060612.GYmwZx1k-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411060612.GYmwZx1k-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ast/ast_mm.c:116 ast_pci_host_is_5c01() error: we previously assumed 'child' could be null (see line 109)

vim +/child +116 drivers/gpu/drm/ast/ast_mm.c

968ee436e4d0ce Jiakun Shuai 2024-05-14  104  static bool ast_pci_host_is_5c01(struct pci_bus *bus)
968ee436e4d0ce Jiakun Shuai 2024-05-14  105  {
968ee436e4d0ce Jiakun Shuai 2024-05-14  106  	struct pci_bus *child = bus;
968ee436e4d0ce Jiakun Shuai 2024-05-14  107  	struct pci_dev *root = NULL;
968ee436e4d0ce Jiakun Shuai 2024-05-14  108  
968ee436e4d0ce Jiakun Shuai 2024-05-14 @109  	while (child) {
                                                       ^^^^^
We loop until child is NULL

968ee436e4d0ce Jiakun Shuai 2024-05-14  110  		if (child->parent->parent)
968ee436e4d0ce Jiakun Shuai 2024-05-14  111  			child = child->parent;
968ee436e4d0ce Jiakun Shuai 2024-05-14  112  		else
968ee436e4d0ce Jiakun Shuai 2024-05-14  113  			break;
968ee436e4d0ce Jiakun Shuai 2024-05-14  114  	}
968ee436e4d0ce Jiakun Shuai 2024-05-14  115  
968ee436e4d0ce Jiakun Shuai 2024-05-14 @116  	root = child->self;
                                                       ^^^^^^^^^^^
Dereference

968ee436e4d0ce Jiakun Shuai 2024-05-14  117  
968ee436e4d0ce Jiakun Shuai 2024-05-14  118  	if ((root->vendor == 0x1db7) && (root->device == 0x5c01))
968ee436e4d0ce Jiakun Shuai 2024-05-14  119  		return true;
968ee436e4d0ce Jiakun Shuai 2024-05-14  120  	return false;
968ee436e4d0ce Jiakun Shuai 2024-05-14  121  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

