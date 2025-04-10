Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974341F0998
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 06:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265940; cv=none; b=iRbje+jEM/42TgZtnuKLjUARnZSV8iDBYw/q2Xbu56sb1E7nRpmBj73ckuu2Q/lvnjDv36coFLDtHtMtqHVzc3xzEaCER1tRDLzQLe0HiPqZ2kMIW3WzsGnsSBJ9YMDKK8/w/CHqnJr2pjdPhEB7Sngk8gXMXz/ib43eMMQfFco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265940; c=relaxed/simple;
	bh=5FD9HeV5dMdYtycO1IP5ZxNeX6YXzBxjky0WuD8uPFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p7Isfq3rWRJycAJiRosOqX4GMpuN/zIc2vRlYgD9r2qyRBkoDLrV+zBeeQTFvnG1iuw7U+BBRwOAxAyb+2u2SWHXSLhtW6Tvplhvav/gqhLdoBJw7/iahtob+XtoS6klqUPfQBXxn1bKfi3QnuBx5Ou72mwY7Oq+aF3PPsUTnTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nZIreNh1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZIreNh1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe574976so2707755e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 09 Apr 2025 23:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744265937; x=1744870737; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WO0sPvu+NJhcf5FTIP2koNXdzW3VS5n8QUGsSgSnAZw=;
        b=nZIreNh1QobKO21ZZlg5KljI1hZCrh+gBHFlXn/E67fuAh6rgr82VQ76if+SyRrxRt
         qZ7MFF/TxvHNvPORlAb95DHMXSCZhZRPZ+RQBIf4YQk+mN+NxNYh/Y/x2l6827p4cnaW
         Nm3TG7bFX6WzUZzGH1Tc9oFgj9igvZtQzwKlcHuZ6STIweIPe9L4x6abZz/LbMZZv9nB
         0lBqtfZHxmO3eGlwZeRm2lc3KtIvIPO/+xPnCOp81CyBhzcgkbP9+5zIaZUlX5Ya1ZuZ
         QD0wfdHQBA1LuSR5cIwY2KjJZKX2V3ukzCcj+VN0u1SV5aJWMVzTAvxPqrNPhgGGC5Xp
         1YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265937; x=1744870737;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WO0sPvu+NJhcf5FTIP2koNXdzW3VS5n8QUGsSgSnAZw=;
        b=mjMWlRLNlfonsFG9R1kCwZIP1JxVXoXQ0XpO+XQAZn2gIbKwjoGL5YS6Ms7NUzwqGS
         zSAymQETUovdiHulku4mrmXJImMyEMHfuoCfqB7S031c+4iwPBDV5p0tavrgxQYQoza0
         GN94br6s1VreC23tUZWatooh5HEeLXvb5jo3/5+wqEk7AJvXwE03Z1ef8tskrQat4CVi
         9c+ICzyw30icg6ryBT8dwVAAjIYpvc6v8SoDgXW1jbu1JQKDfRrOtN8qDCFqS/gDGVZ1
         t4zVzL+0uFtGKuuwyihX8JQnzyc0iBR4q34yZMIpx/DxF5Y698XxOGlnyOwoj8aEXwVX
         /KMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkUxKrT6MzWDhNTJihlN0AHfvrYDTjehnWx/uOcW41Pqup6ZkRMlLHYrHeC4CWnn3jdVBm4oShDRknUk68@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcd8T6hOmEdywCvHsWQkfSMHzeIT5PYm8NdDt6e7N1KxB/TyuT
	ZHRelYZBNBs8KOcSW3XOPudsA2M+cpD+cYdvMq9+ep4oi/70Tr3f3O5LbsFPZa8=
X-Gm-Gg: ASbGncvMUi94Hwy8D+EmlNNFS5F2Rfykb0YCF41Sv9QD5QgL1WjDwphl/M1LG5Ie5nX
	G13Ay39ToHt3gZSVXTPQy5KHXQ7ID56hD9OKfZpukjKJdtG7UPwLCvfGPAbPaDAJkNmO4iBGuj1
	N5Ftggb9JVoSiYKxi0ZRdwcwS03puA8gWNz7EZqs/FLKB97QGl0WYOOXx7bbJ3wCr9OhHILHY/a
	n2lkBcmsjcY8vKgxNeV2blxkGNuK2M4cLttnpkC1gWu7nOAMlW+rSbfxoPAf7X31niS62Tt07tN
	CDAykSSbifsD6wslado/6gZXZxCn2KL3m8Ru6KwDDylQDtkuq1BB4b09
X-Google-Smtp-Source: AGHT+IE3Vkgj/iD9RCM6QwVVg82nnZ0Xtq80ks64ANuUFiN6dHiXhMD/Y+i1TeQXx08R6wbm0fmQSw==
X-Received: by 2002:a05:6000:2282:b0:39c:30d8:3290 with SMTP id ffacd0b85a97d-39d8f276007mr1149394f8f.7.1744265936819;
        Wed, 09 Apr 2025 23:18:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d893f0b76sm3712417f8f.77.2025.04.09.23.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:18:56 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:18:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/main.c:952
 mt7996_mac_sta_add_links() error: uninitialized symbol 'err'.
Message-ID: <47f95421-75f8-418e-9f0f-47775f615d41@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b07108ada81a8ebcebf1fe61367b4e436c895bd
commit: dd82a9e02c054052b5899872c1f32805428f6131 wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks
config: powerpc64-randconfig-r073-20250409 (https://download.01.org/0day-ci/archive/20250410/202504101051.1ya4Z4va-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504101051.1ya4Z4va-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:952 mt7996_mac_sta_add_links() error: uninitialized symbol 'err'.

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:73 mt7996_stop_phy() warn: variable dereferenced before check 'phy' (see line 71)
drivers/net/wireless/mediatek/mt76/mt7996/main.c:360 mt7996_set_monitor() warn: variable dereferenced before check 'phy' (see line 358)

vim +/err +952 drivers/net/wireless/mediatek/mt76/mt7996/main.c

dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  924  static int
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  925  mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  926  			 struct ieee80211_sta *sta, unsigned long new_links)
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  927  {
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  928  	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  929  	unsigned int link_id;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  930  	int err;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  931  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  932  	for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_NUM_LINKS) {
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  933  		struct mt7996_vif_link *link;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  934  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  935  		if (rcu_access_pointer(msta->link[link_id]))
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  936  			continue;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  937  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  938  		link = mt7996_vif_link(dev, vif, link_id);
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  939  		if (!link)
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  940  			goto error_unlink;

error code?

dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  941  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  942  		err = mt7996_mac_sta_init_link(dev, vif, link, sta, link_id);
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  943  		if (err)
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  944  			goto error_unlink;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  945  	}
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  946  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  947  	return 0;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  948  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  949  error_unlink:
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  950  	mt7996_mac_sta_remove_links(dev, sta, new_links);
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  951  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11 @952  	return err;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  953  }
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  954  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

