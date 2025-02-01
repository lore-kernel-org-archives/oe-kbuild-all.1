Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF25912C7FD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738393014; cv=none; b=ObKhU1Dptu7qxthlcXPFWF8o08XSRkEt9tynSjELyjtcF3egWobVr2HoRda8KKSxrOCCozHHP+4yXDPGTYXnfL/xLszOLsnTfR3Kz642eGNCo17DS/11aByX/2LlbInEvv+mfa6z5CvJPoT56k0xVuHIawIYPyOD66fsMitrnsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738393014; c=relaxed/simple;
	bh=eYlKP2B2cpDt8OnJBkKZxKSWwya6JrV5Qz46c5KwCGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDrjTCcbF3jOUeBXK06gpXjsOSiWTw5l5IKPDqROzsgKd+IvG8Op7O9mdvmryrYTxmGkOa8hqp4VHKfEVKuQQMY/BRNdDGIiyb3CNnGmxvHZmchgmtaTy09iSL4Eq5nraP9VN5jp5SPQpxle498nen2qRdZm0Qd1PlDTnzorV3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gmvJA/cX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gmvJA/cX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361815b96cso18475785e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 22:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738393011; x=1738997811; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GDwKIy2KstlfHVvLKKYjOhFWwCKZwirsNmdSwytNJuY=;
        b=gmvJA/cXedgtJVkKuiYpkB8oWscTCZFUfZvrspjw6UmcmqwWu21OWBOERpbod02w1W
         Icd9W3F/KvQXMdrF/2mt1MfQ3aXtoUFoh2CDIWXujovtY+28Q7xTJpEmhCoTf8GI4Ljp
         +JJzRZJ3Q4eynqrKiIpp6THfAvYlfug0pGOfVgWMmUkvQQvTY5fhLX7AO1RTNB7WxoBL
         0el6UGiQqB1u45VC/VIfyX0D2SssFXwpB/kDH5XAO6zNG3x+3ZxyiVUDdYVDJEqAa4UU
         Ykqzo60GrxIHXthud/Ph2JTOJoYhdTzvfTmsad0XDBaeBekDmlc+9tJlkGBP9jFOyAcl
         X+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738393011; x=1738997811;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDwKIy2KstlfHVvLKKYjOhFWwCKZwirsNmdSwytNJuY=;
        b=OX6jV1kdivXliLpwAs87sEpuz98p56qNHU9OLcVOH9nGVB7iAY9VtqIlDqLjTJ59sD
         q8OAGhGYHW/9wwqL5I9MpXLPNWKSgY0y1y5TDwSAqN0FIeS/MtbxlR4eCNVPJrekj7BK
         wk0duNe3QZeRHrz5aqQiq3GJvfsYmfnuzwniZKvZtaoTHx0HsZ7j78qTgW4oWa7L9JUy
         b0/kwJ/j0BY1ev554YIUgaZtYqfLW22vyRoupLFGxKMDPoWwMiuZASb8ioUY8pC2u2o2
         iqHBGONLLRBBuX80qkZiWz5C+6Buw8QC8EMJUp9AeK/Ty776Mtzt5cBev0tNdfWQw2hA
         S4AA==
X-Forwarded-Encrypted: i=1; AJvYcCWgl0Sn+9XgnABGJDnlKJADXzNuMLzGh3iJzwgOdlwkyy76uUFZAqV1g1lI4hyICGQl8odtuIMMI6Hg64Gx@lists.linux.dev
X-Gm-Message-State: AOJu0YzYPc3a1s5OgSktpH9IZMqbB4fMbUYpO72AB8cb0KICOI6qODMT
	XzsMvml6DpWRDxi7Lz4T5G04/SVBj31tCfHzOKp1BgIFUvko/czLpogeeALr7BU=
X-Gm-Gg: ASbGncvYctasUq3j+gze3XE20tWiWbbukvpLA58uhoGuT7GHyWAbalPhsX/gRRpm3yO
	6XOlx8EcfyrmwzAVWjY5979I4h8WpaA3RlnZubI6r5eukzOZmk7z+I3t8xmSpLoAdE8FgZ11tea
	Nr4Ny1HTXaRhtSka7Oe6iTKsD8KZjQ+A0kL85tachwl+T0fASHDrA2aq8pCdS23seD9vodYtKAZ
	fv42BCPxuXMcVT7s3nCxHIdu5CkDJX42YwBlEKodmAlliDiGiA4wD4boGkHlppjH9D9ErTzCEtE
	jnjdWV4ZFtPacGWBqHrJ
X-Google-Smtp-Source: AGHT+IF4UcKQ0jIwxmuQ4/Bm/A6nJ7yv9vR7zNW2m+h0N9tyweL4cWUizHBNcIJ3IIMxju7yF+o5oQ==
X-Received: by 2002:a05:600c:c87:b0:434:feb1:adcf with SMTP id 5b1f17b1804b1-438ea3c1cdfmr37427035e9.25.1738393011014;
        Fri, 31 Jan 2025 22:56:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c1b579dsm6531313f8f.78.2025.01.31.22.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 22:56:50 -0800 (PST)
Date: Sat, 1 Feb 2025 09:56:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/wireless/mediatek/mt76/mt7996/main.c:73
 mt7996_stop_phy() warn: variable dereferenced before check 'phy' (see line
 71)
Message-ID: <a0c23bdf-520b-4ebd-bc4d-b93cd587ce2d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd8c09ad0d87783b9b6a27900d66293be45b7bad
commit: 69d54ce7491d046eaae05de7fb2493319a481991 wifi: mt76: mt7996: switch to single multi-radio wiphy
config: alpha-randconfig-r071-20250131 (https://download.01.org/0day-ci/archive/20250201/202502010604.nBhFqzvE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502010604.nBhFqzvE-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:73 mt7996_stop_phy() warn: variable dereferenced before check 'phy' (see line 71)
drivers/net/wireless/mediatek/mt76/mt7996/main.c:357 mt7996_set_monitor() warn: variable dereferenced before check 'phy' (see line 355)

vim +/phy +73 drivers/net/wireless/mediatek/mt76/mt7996/main.c

69d54ce7491d046 Felix Fietkau 2025-01-02  69  static void mt7996_stop_phy(struct mt7996_phy *phy)
98686cd21624c75 Shayne Chen   2022-11-22  70  {
69d54ce7491d046 Felix Fietkau 2025-01-02 @71  	struct mt7996_dev *dev = phy->dev;
                                                                         ^^^^^^^^
Dereference

69d54ce7491d046 Felix Fietkau 2025-01-02  72  
69d54ce7491d046 Felix Fietkau 2025-01-02 @73  	if (!phy || !test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
                                                     ^^^
Checked too late

69d54ce7491d046 Felix Fietkau 2025-01-02  74  		return;
98686cd21624c75 Shayne Chen   2022-11-22  75  
98686cd21624c75 Shayne Chen   2022-11-22  76  	cancel_delayed_work_sync(&phy->mt76->mac_work);
98686cd21624c75 Shayne Chen   2022-11-22  77  
98686cd21624c75 Shayne Chen   2022-11-22  78  	mutex_lock(&dev->mt76.mutex);
98686cd21624c75 Shayne Chen   2022-11-22  79  
d73dab22e7a8a8f Shayne Chen   2023-06-05  80  	mt7996_mcu_set_radio_en(phy, false);
d73dab22e7a8a8f Shayne Chen   2023-06-05  81  
98686cd21624c75 Shayne Chen   2022-11-22  82  	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
98686cd21624c75 Shayne Chen   2022-11-22  83  
98686cd21624c75 Shayne Chen   2022-11-22  84  	mutex_unlock(&dev->mt76.mutex);
98686cd21624c75 Shayne Chen   2022-11-22  85  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

