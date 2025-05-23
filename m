Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2280D22E3FC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989010; cv=none; b=HT4zG6HG7KqCHFSJ0N4uxEmU7zfTNjL6DkSo+dUcbKy/+HCRPTlQx+21u0hHHEOzgQVLtWXwJGawMCfbXjXd5cenE6jQdP1F5wHVCL3x6nHvjbpp/fSHilR8yJzHsLGKnsab5vdXt7hKsAHi3bZ0TjnhZH52GzBCc575yrNen40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989010; c=relaxed/simple;
	bh=4+BeMEmjSAWATjFZHg65BHSXSzofLaF78b0i1a+pcM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dfmbe/KB4Ql1FeAqX0ajDK+ugiAAc/7NsRLzpAksqLHd6oVhhU2/367SsLal8ReQB5xCYu8G9RQTOwCCyxzG98cBV0yFwu1RNLOB4JAW/Gnljw5245ZUlKQv+wElZ6/pLLvW+CiPMYsU+amr+0XK0C172FXuSz1+lvaw90u8b64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wCQNBYV8; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wCQNBYV8"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4c4e6a0ccso136529f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 01:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747989006; x=1748593806; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hzu/331svahbTes/8aRYkVNN0812xz1z5KDadrw01g=;
        b=wCQNBYV8ccTv1Yj+gwCAzS7i0t4wNJT1j3tnddS7KfZ9I6ImgVT2qtcz37CYDy6NqG
         FHF2FeKceH5Dwkxd3cphCzLZ6NzGjaX0XS7W91+1ZwqmCBVheCD9UZUsW0jBp8eW11qu
         4HN7rg897tcGymVFG1NSj7AsLHn/kQzF/Gy0SDxo0hubgMuyeA2+FaeylH1V+OwO8GkV
         duSCEPNwL2u4plPBT+IsRHUpQs+TbD2302zfZH11nMlLxZoLtCjndoE0H30iDL9BcPCw
         9/SzA71YIMIaonRfxFdndARpc2NMfkG5kCdJKl5vdcObzB98EfYtXme1KpJjH8eMV1eV
         HIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989006; x=1748593806;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hzu/331svahbTes/8aRYkVNN0812xz1z5KDadrw01g=;
        b=Y4xhlCpImgbf96Si0uWXrqu3clyp3/VHOqlNuUJCa8//M1sdRrkBBkUdEbjv09h7i9
         059Jlp7uZXSPcnjXhDEQmGj73ImOAGo8+s08YjmnYG+JQxTBp2to2WO5TDj+iqi2xG/9
         R/Q0poxIXT7Wi3PUNgQGVa5qFIKuIo7DkjIYW+xn0tKWkeFyVl9cis/d7CXSs425F2GS
         +nBfA5yhZSHp151TqDYYkS6UDS08FbxB4Z+7XkcwxzsArwKxYWsIS835cblbYNA3GaaT
         UgY04uyAyHVAqf/7ezqVbTxXe4KHPQ9Tx676CC8MhBIZp7BlsyTo77s1Pt4WmOaJaNsJ
         rWMw==
X-Forwarded-Encrypted: i=1; AJvYcCWmjL2wCM8UQAXTWN81u7j74GZK9a/ynQkULhBjw1AU/9RundxVI82JQoGUAVL1BcvDGwfxBU9IZ1NCLZMG@lists.linux.dev
X-Gm-Message-State: AOJu0YzWHqmKxSLrPT0DHCLNS+oFGMqT1VCcb56+PVGd9quJ5ufJsdl3
	UDdi5XeVpl8mlBk0jsesDby5mALQ5zfayg7x70NFjH2HgcS7nqrkTqkodGhuUbiGyrA=
X-Gm-Gg: ASbGncu9vBI1zfDhfeIsZt8EVilPnQ20fbWIcNJkt9VWv2SzJI1FvTZUpM67F0hqEA3
	lHrdYXqJDmLbEYI2yYzb5+JTUKGHAWpovyt3RqY4WFVhamzCxjke6fnra6HVhYRWgv7mVKOZd15
	CgTxEIbm7TNzQCe9on+3EmAgzfTd+hxrTh0/RPxWbPAWHvzZL8Kusf16P11Obx/kd7420ybxYRB
	KF35up7zXxmdSeRWuNhjbz/WLvNl21cRliu8ZGq/hUhwYAz/fwZTHa8p6O9VpevMBSKswQ0+Su4
	DdwaijIgEQCCJA3u9TsO4+JVJmRBsoyE4lw2/qtR/ImGx8mXqMM31uhd
X-Google-Smtp-Source: AGHT+IE06BDQgHT8K2b8PLVbznX7v0nJNrz2nHMEuKTcFYYfVpza79W+ry5W8H8nR5LU1oDBKpzmDw==
X-Received: by 2002:a5d:64c4:0:b0:3a0:b565:f1ea with SMTP id ffacd0b85a97d-3a4c1faad0dmr3219661f8f.5.1747989006250;
        Fri, 23 May 2025 01:30:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca8874bsm26117801f8f.67.2025.05.23.01.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:30:05 -0700 (PDT)
Date: Fri, 23 May 2025 11:30:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Baochen Qiang <quic_bqiang@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [ath:pending-deferred 23/61]
 drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env()
 error: buffer overflow 'local_non_psd->power' 5 <= 15
Message-ID: <202505180703.Kr9OfQRP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-deferred
head:   52c1e49f8c69a630f3dbe7dd79c52979cdad19d2
commit: cccbb9d0dd6ab9e3353066217e9ab5b44bd761d3 [23/61] wifi: ath12k: add parse of transmit power envelope element
config: x86_64-randconfig-161-20250518 (https://download.01.org/0day-ci/archive/20250518/202505180703.Kr9OfQRP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505180703.Kr9OfQRP-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15

vim +9812 drivers/net/wireless/ath/ath12k/mac.c

cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9802  	} else {
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9803  		tpc_info->is_psd_power = false;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9804  		tpc_info->eirp_power = 0;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9805  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9806  		tpc_info->num_pwr_levels = max(local_non_psd->count,
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9807  					       reg_non_psd->count);
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9808  		if (tpc_info->num_pwr_levels > ATH12K_NUM_PWR_LEVELS)
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9809  			tpc_info->num_pwr_levels = ATH12K_NUM_PWR_LEVELS;
                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
tpc_info->num_pwr_levels can be ATH12K_NUM_PWR_LEVELS (16).

cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9810  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9811  		for (i = 0; i < tpc_info->num_pwr_levels; i++) {
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18 @9812  			tpc_info->tpe[i] = min(local_non_psd->power[i],
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9813  					       reg_non_psd->power[i]) / 2;
                                                                                       ^^^^^^^^^^^^^^^^^^^^^
So i can be 15 but there are only 5 elements in the array.

cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9814  			ath12k_dbg(ab, ATH12K_DBG_MAC,
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9815  				   "non PSD power[%d] : %d\n",
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9816  				   i, tpc_info->tpe[i]);
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9817  		}
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9818  	}
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9819  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

