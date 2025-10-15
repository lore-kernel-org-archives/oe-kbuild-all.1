Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C955F28D8DA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760545823; cv=none; b=Uttw3L5OcOYKjtbPgUWOqcXuiSCSG1ajAcAn94uSuN9lHZUJEjLn26ZXnYJ7QYW0t2aKIPwrxz3Ai2k9ZMYgXeqEcS9cZdtyjvdSyeS0EA39DrhYc6hONQO9CZoIpMbnfEIxpm9mNiNWT4r/mRDfhZoE9qfz7PJgYA5/96S8u+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760545823; c=relaxed/simple;
	bh=PcnJKfuVQsJGBUH5fjPouCd2YAFL6l73wYup8RCB85Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NcI/Fe2izQ+NnfkUNNPeRQkmH/JfgFMSFxD9KmjyIiWtGhw9mkVhJDc4LTNja0rDe6H42G3wjPWdUdi7jGed5DiB84m/4RzpXwB2nZ+tKmCRIYLWLNfNYcqRgunqzKjgPsFFFqKFUs8OYvcXCFMsVOBq2zSpwwILR56Nxt3UKiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDKzlO4r; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDKzlO4r"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso1082575e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760545819; x=1761150619; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aJFzXPFpDQS87d8LEEXFvQI0doaKVJlFcUZx53QgtSo=;
        b=fDKzlO4raXlJJHTikzAH9TyocuSKZpF+lb1smaHWiPBhz8eEjj9x/dhOPrVNZOKGvA
         Ddfr3hCakyE1wHVx7o8l6EE6sHgPNrJeHbE9z6hCg2OVHIi5U8FjEQBYmKMTQYoRJpgX
         RyBpSTSL6hOyiE7NAEgrGDqyCixqIm4MloEpKC107uX9I2tn/cVpv15Bmp8BEiVmDRtc
         BGCfFaYGAazyAjE4Z47P88WzfdukyhzQdiukfTm9K2Gmbis8BGGPo1rooA9vOn8zBUyY
         lKYR0dRc1SOC2HaHeZ0LVJunUFxKmHUTxeq3sx6m95yvbt/jo0LRsVIx3CSvxzdQTf2/
         NWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760545819; x=1761150619;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJFzXPFpDQS87d8LEEXFvQI0doaKVJlFcUZx53QgtSo=;
        b=tWJFztvawTWmTp4ad+ZQK66rA5RmlnWt+8daAndKQ1kMrq3t7/5HLUH+Ie7s+IXR2f
         G54K94y3MK2mkbnYJxaboQ7puDDZCKYAP7hUMin94EWupsoysMXoqkKsRHpXDYXI6inR
         Lvp61FbmYn7gFs9b28g1/X4sWogu4LKIBvZdLfTdv0nvIhSwXlAJAz5MU4Svwnql3rGv
         9oRDlF8vTbiBC7NVF7zLabiY6DqvuhCLuxZVMCJVGdut31EAxtHdo72GVVeompW3c20a
         YC5j+/a18K17n04WlM0gjWG+mof2B6JtZrcY7zpYgqu80GYNc9LQYRSZPIK5d/AV9xKX
         FjAw==
X-Forwarded-Encrypted: i=1; AJvYcCV2Ah43WCO9RosTUPIhJm0pEgKcHPP7UqJNhn/rDyDNvbDDd6HByp3aNQfGXR9uHpP/0A9Mw8CH8Fr/81Nv@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1KH6VM3bC0OUuv7F71vGnoWnFbN02gI29avTEN4yDihtPa6O7
	La2DgKugbjUuU/1PZTmCNOGVyTKYTkQx13KjRVIPMRhzIbghtxyjaUJBPQpHT6zgyrY=
X-Gm-Gg: ASbGncsHiQnYddK1oqnWZQLmS1D8blB5GhY9b13RdUk1O3okx4BIDLFU45B/s16f4hp
	rRydbpTHOCtLeQ8/xM6uGAza7/e4PGqDOYFqsBIZ0z3GW71JFp3grlc7VGKyZr93wbu+eEefDOd
	zfwNC6U9PuVEcqS7SWmltHuVOTGFG7G4bq1CCIiIA9a4x75uUZYcGqBEyyee/5saF1J85oaCrmD
	TI4IGdJz1ioGEuNFQ3znkKzhva9Qb0GKJUhqZ+dZ7UWsw1rF5Bs8PyhoMNfBqPrd3K+nnhDu07J
	VyXwq4Z4EirEpha7At/sqEE8ABzNxGud5zh9fpR4CBq1HwpD7foqGf8FHueq2ZibVRN2vlfh/1b
	DCHDDdnkmQFGHeTIFIMBA9liHy7NbufBWyITQ67HdTOMpYGZ4m8I=
X-Google-Smtp-Source: AGHT+IHKxHJ3/ojrKYdZz0teR0HP/P40/HKmZyUjoCkTXwzWaHi7eJSIIlIxOO+bIottWYntL9Ie2A==
X-Received: by 2002:a05:600c:4753:b0:46e:1d8d:cfb6 with SMTP id 5b1f17b1804b1-46fa9af0621mr220694465e9.19.1760545818801;
        Wed, 15 Oct 2025 09:30:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce5e10e8sm29963485f8f.39.2025.10.15.09.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 09:30:18 -0700 (PDT)
Date: Wed, 15 Oct 2025 19:30:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 3/8] Bluetooth: ISO: Add support to bind to trigger
 PAST
Message-ID: <202510152336.GJBjPRZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014013308.174151-3-luiz.dentz@gmail.com>

Hi Luiz,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-hci_core-Introduce-HCI_CONN_FLAG_PAST/20251014-094058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20251014013308.174151-3-luiz.dentz%40gmail.com
patch subject: [PATCH v4 3/8] Bluetooth: ISO: Add support to bind to trigger PAST
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251015/202510152336.GJBjPRZF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510152336.GJBjPRZF-lkp@intel.com/

New smatch warnings:
net/bluetooth/hci_sync.c:7286 hci_le_past_sync() warn: inconsistent returns '&hdev->lock'.

Old smatch warnings:
net/bluetooth/hci_sync.c:2622 hci_resume_advertising_sync() error: uninitialized symbol 'err'.

vim +7286 net/bluetooth/hci_sync.c

26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7269  static int hci_le_past_sync(struct hci_dev *hdev, void *data)
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7270  {
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7271  	struct past_data *past = data;
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7272  	struct hci_cp_le_past cp;
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7273  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7274  	hci_dev_lock(hdev);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7275  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7276  	if (!hci_conn_valid(hdev, past->conn) ||
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7277  	    !hci_conn_valid(hdev, past->le))
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7278  		return -ECANCELED;

hci_dev_unlock(hdev);

26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7279  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7280  	memset(&cp, 0, sizeof(cp));
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7281  	cp.handle = cpu_to_le16(past->le->handle);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7282  	cp.sync_handle = cpu_to_le16(past->conn->sync_handle);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7283  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7284  	hci_dev_unlock(hdev);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7285  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13 @7286  	return __hci_cmd_sync_status(hdev, HCI_OP_LE_PAST,
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7287  				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7288  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

