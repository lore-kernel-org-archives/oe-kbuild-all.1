Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6556217B425
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 07:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766041532; cv=none; b=aPldFdoKTailPtg6KQsQ0aSxwV+MGxXXM95xaM9fslauNR9LQ1CK5YRAMUjq/U8L3okTHnyRy0HttoSeUic0hbrOntzwgOSrLjnzYPHf4cOSePZP8xeTd59zv7YwehOrE2emo2t6ZKe5NYVEgLUr/TBQEklM2Ukhi04WL3ZdeTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766041532; c=relaxed/simple;
	bh=jeGPhNX3TRiq6YzX9ol22Y+2GlfVWu1RumkkCJ2pxKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jsXOGzZdk0SyGfMavE9gphwuJxruCZf/gCv7RUND+U4vx4Ve2x/o5GJfcmkq7Xe5OLxLvct2LvGAjf9V8uwrovfnuvz8LSVpbZFfheQphRvhxSV4p/ViJhSVyvDwUYABAuta6GgCgsBgLbzmSYizKNZivn0BD/y4EaMzluYSNRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FMAR6qIZ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FMAR6qIZ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42e2ba54a6fso89659f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 23:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766041529; x=1766646329; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ArDYjTNEnUF4IGjgL6stzEBCxqWfodJ5gdRYTtvI4IY=;
        b=FMAR6qIZto2RiKerUd4QrEmu/1INpF1uyACFvWO/tLMUbv5EXYa3zntuDcYC4ZV1hC
         iPQp1epTfIiuCkTabSHUYE35v6t6MleIcncERdNk/nWU2KPKzEvQiupGl6wb2aAK0W94
         Ri7yMdpUXsoOg+1950KhMnNExtD0i0Qdh8IJ/Rs4EsKWQSCfyUQdORucUOp3xJwCNVFr
         273FEPFDspYW1h1X1iFM5TEmw9EsH64AzJbsglqaMzgn1x1gobVt4W/yVdF22dSWGIJU
         v4xAaY/CLahO53ZW3kBP23TRfpARss4lGvx2Vd8ge3iWq6EK0Ds8u30+rCQnyatR3Vi5
         PUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766041529; x=1766646329;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArDYjTNEnUF4IGjgL6stzEBCxqWfodJ5gdRYTtvI4IY=;
        b=sqP/smEwJCuqSXJ1na3CetF0ExsvUBuv0Vm2MLP/zq11+odEf++9siA2J0vf1X2Zic
         4ICOVmIiYb8O41nUKRsXv8kGlm0IFJY3Gf4lsaXHzwXN6LTqh8fzT6b74w29qxQiDUEI
         D35QkrC9X1t+VignGJetFzKHx1+T/M75DUSJ/fFPU7f3/6Ok8WO+Jrw9O8SiUOh+lAXO
         MxCYHJuEVoT51Yv8WdfrU1+5HCUhHgGt4nU6T4LNa0qUVUcyA2Q2e/NCEzELuJoQnsT1
         ncKqyVuCJ23bh9YTjc29QSMzQDtiPPCVuAIAED1yVSBeTgAcuVNN2Pl4ne6xhsh2RNjM
         67rw==
X-Forwarded-Encrypted: i=1; AJvYcCX3MUjlOwXbmqIt7/XEFw4r41+Wie7deRdbQdXi2E20wMgx2kcwORfugq6W7HpOMPwZ51X3r6yVYY7Akza+@lists.linux.dev
X-Gm-Message-State: AOJu0YySPbIUo3MxtZqCI8t/iH0ARUDNtBxd//L+gGPkUt2plAiniEJt
	rzcTObCEezCd+Nz+uQxAexVGbkc9URt4LhPjN9A5brSS8lgExPHrCUOh20L2wvxlQlE=
X-Gm-Gg: AY/fxX5unzXF+9bqGB4UcDZ47093dNJUknQgW/7y1Ieq+gWWSnLq7fZ6nxXPtpjGZa4
	LDwskEi7fQozOP1dW/+O2SvoQaSa0dM+ctvB62FozXn9dMtANPCxxvR6asdz4Sv7DkO8hZD314H
	RPTqsU8lni8/7AREbmxs6TDuFIKbqKv4iav8hJIrGeX9Qa13eFi0m4YCfUZs7fHnj2zz2RFxmt9
	ifw/ISI9m/qiQX127BHXb2QaAZVm3q/3Gad5838cbOYBa2NlhkTKF2cNvEiCJtqDASzCvXarOVx
	+DdUutnUnxaNGcxXwWneP1S+bpichcVj0CiYKSZksApSzEK9YNYvr3r9RheAVq/j3kKJ5NKumm1
	Zuvy1CRmiMM3P6g3BnfYSfCTzBI58ku0FfaCZJHcJHW3fM23K8ahdM0vvhOUTS0S2aGypNHcUg2
	LlmRo7MDj4ZIDeTj0G
X-Google-Smtp-Source: AGHT+IGKNeIi233kyv1f0hD/iKruunS7x30uHwMXq0eSJaZQnV0D/eoFKL6iRVudXOeGP+Bn3B5+rw==
X-Received: by 2002:a05:6000:2083:b0:430:fc3a:fbce with SMTP id ffacd0b85a97d-430fc3afd23mr16948339f8f.15.1766041528550;
        Wed, 17 Dec 2025 23:05:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43244940148sm3394185f8f.15.2025.12.17.23.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:05:28 -0800 (PST)
Date: Thu, 18 Dec 2025 10:05:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Saeed Mahameed <saeedm@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Parav Pandit <parav@nvidia.com>, Feng Liu <feliu@nvidia.com>,
	William Tu <witu@nvidia.com>, Mark Bloch <mbloch@nvidia.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/eswitch.h:981
 mlx5_esw_vport_vhca_id() warn: signedness bug returning '(-45)'
Message-ID: <202512180851.WNLFBz7t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 1baf30426553efb3ac518b0e9d5c1c3f8ed7762a net/mlx5: E-Switch, Set/Query hca cap via vhca id
config: alpha-randconfig-r073-20251217 (https://download.01.org/0day-ci/archive/20251218/202512180851.WNLFBz7t-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512180851.WNLFBz7t-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eswitch.h:981 mlx5_esw_vport_vhca_id() warn: signedness bug returning '(-45)'

vim +981 drivers/net/ethernet/mellanox/mlx5/core/eswitch.h

1baf30426553efb Saeed Mahameed 2025-06-16  978  static inline bool
1baf30426553efb Saeed Mahameed 2025-06-16  979  mlx5_esw_vport_vhca_id(struct mlx5_eswitch *esw, u16 vportn, u16 *vhca_id)
1baf30426553efb Saeed Mahameed 2025-06-16  980  {
1baf30426553efb Saeed Mahameed 2025-06-16 @981  	return -EOPNOTSUPP;

This should be either true or false since it's a bool function.

1baf30426553efb Saeed Mahameed 2025-06-16  982  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

