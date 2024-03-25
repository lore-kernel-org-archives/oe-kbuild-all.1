Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D257B15E21D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Mar 2024 06:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711348776; cv=none; b=QqZ22Qh5eWdmESFlWeo78t1T9jMY2txDcP9+rLVefrOVrI/Fla0csyi01LPD4GOmoxd3DaJwDw5bnVYPe2mtJm+sqljesIcPsDDZhRTHqnz5O1cHfCydFWPulvImRgIRa92ZLW/8HHPTyZ3+di7W1f4Wv71k6Mca3cnS8y/KXfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711348776; c=relaxed/simple;
	bh=SIV82zi3r5N4BJncoDribDKYTgwGOr42okiGFQsTEkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cdItBYjymPqaa5ehrZ1vXIPK50s+P9MhW8uiOAycBQ+ywvZ7gppTMHMuart1amEnNTeR/gyrFZeJBs/DPKDlQ/ri76KNmBxL4KgomvA8tczBkSyAD3lDYZW6XCLZHAfP3CN0K+Wwjcuxy+VwYMM+AZ8kZmV38voktXjhDeIX0nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpzDM8DV; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpzDM8DV"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56bf6591865so2311415a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 23:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711348773; x=1711953573; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m22bJYCIhfJpGKXzQTNfSbtfeX8K48/PW126gNHuRe0=;
        b=dpzDM8DVKQ09fZSymsk74ZTInJ2whQ+VD8TnG4uTGFsoGuw4MDQZRicSWoe2U/bYtv
         ytk3LnYQ2rftM7tysyvM74Wzn2vUv5qMovXWTuLQ/XFDh5LbjEtSY2zHPAwDRvYCaGc3
         s1T5BoBSI76SWI6eXsrxW8xu+UhF+hnxYymRTOCOGUISfusTxbivWnaW/pW9wievBomU
         1a43c79JyQiBpSz3VAmMR3F882o303bJamqBjsMJQQv1RAX4t0SgDe51jkBN7U5p+g3p
         Zlfn2CbbRXx/6VZ6/Q1QCXgSfpHQcwN5aFhXaA62HwAFBouuLPXJoZczd7t/h+IKfDIn
         x9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711348773; x=1711953573;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m22bJYCIhfJpGKXzQTNfSbtfeX8K48/PW126gNHuRe0=;
        b=AG/hGcuRdOladbVsvjE51Bn58vB1Lrij9DYtvRTWw2QzHAc8Z4ZHLOoh1XrspgqJ33
         Y0QofrkAm5+KZb4my1DXsDIJH+EHfZixJeRAeLPoTtHlbQYjSIEgPtnVcs8/BbOuiVKj
         cf0wsDEWcjdrVcfmTWKvaRrA1v0l5garLdXvzK8DNZHzEDzBnSr4nur8fggPJh0I+NfA
         ZZ6H4ITJ7FNz2G3ocL1B40wUKlSQU21xLpGEHei2Arht6EbsNZK7Rujum+u9F7egNvaf
         wbhpwvYwB8lnFG7Ssc9jErSzmMsAj2ot3TsjD3T2s6FJQIJvmKe/Gd1QmZBkHPSW9IyT
         NaQg==
X-Forwarded-Encrypted: i=1; AJvYcCU3qObf+gTQf2njY1ab5h/HStK5JVvLmOJ2+i2tQBv80NrwhZfDudxyj1IYNb2ItyrhJQjdbFD2mZoGOHzFjtOh7Y2BU5No0k4wDOSWGQ==
X-Gm-Message-State: AOJu0YwDgxK2UyR1kwCYUManXrycYUqv0iuXPsN09i22Prj1VaS9YOty
	KQ7SS0RxEuif/KXuF9IlEpoHNN/p8WvRIMQIwQ+Pbg04I3MnAN/KZyoS4g0x7bI=
X-Google-Smtp-Source: AGHT+IE1VQ7GzJbHXLw2VcEb97uklV8RVWzKvaYoS2n3HMPYdajIqcf7bU37lOn6993gzpguEo3xcw==
X-Received: by 2002:aa7:c249:0:b0:56c:19d2:85b2 with SMTP id y9-20020aa7c249000000b0056c19d285b2mr199406edo.35.1711348773084;
        Sun, 24 Mar 2024 23:39:33 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id b23-20020a056402139700b0056c0d96e099sm845782edv.89.2024.03.24.23.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 23:39:32 -0700 (PDT)
Date: Mon, 25 Mar 2024 09:39:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:vivid-cec 59/62]
 drivers/media/test-drivers/vivid/vivid-vid-cap.c:1570
 vivid_update_connected_outputs() warn: variable dereferenced before check
 'dev_tx' (see line 1569)
Message-ID: <acdb463e-9a36-4822-a9f8-af1098ca7491@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git vivid-cec
head:   bfe9974b584040f6df7aebada2a3b6a61d0dbb67
commit: 514333e776cd80413971a91ce668634fe7e030c3 [59/62] vivid: drop display_present control, route EDIDs correctly
config: arc-randconfig-r071-20240325 (https://download.01.org/0day-ci/archive/20240325/202403251134.rCvdEVfY-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403251134.rCvdEVfY-lkp@intel.com/

smatch warnings:
drivers/media/test-drivers/vivid/vivid-vid-cap.c:1570 vivid_update_connected_outputs() warn: variable dereferenced before check 'dev_tx' (see line 1569)

vim +/dev_tx +1570 drivers/media/test-drivers/vivid/vivid-vid-cap.c

514333e776cd80 Hans Verkuil 2024-03-22  1554  void vivid_update_connected_outputs(struct vivid_dev *dev)
514333e776cd80 Hans Verkuil 2024-03-22  1555  {
514333e776cd80 Hans Verkuil 2024-03-22  1556  	u16 phys_addr = cec_get_edid_phys_addr(dev->edid, dev->edid_blocks * 128, NULL);
514333e776cd80 Hans Verkuil 2024-03-22  1557  
514333e776cd80 Hans Verkuil 2024-03-22  1558  	for (unsigned int i = 0, j = 0; i < dev->num_inputs; i++) {
514333e776cd80 Hans Verkuil 2024-03-22  1559  		unsigned int menu_idx =
514333e776cd80 Hans Verkuil 2024-03-22  1560  			dev->input_is_connected_to_output[i];
514333e776cd80 Hans Verkuil 2024-03-22  1561  
514333e776cd80 Hans Verkuil 2024-03-22  1562  		if (dev->input_type[i] != HDMI)
514333e776cd80 Hans Verkuil 2024-03-22  1563  			continue;
514333e776cd80 Hans Verkuil 2024-03-22  1564  		j++;
514333e776cd80 Hans Verkuil 2024-03-22  1565  		if (menu_idx < FIXED_MENU_ITEMS)
514333e776cd80 Hans Verkuil 2024-03-22  1566  			continue;
514333e776cd80 Hans Verkuil 2024-03-22  1567  		struct vivid_dev *dev_tx = vivid_ctrl_hdmi_to_output_instance[menu_idx];
514333e776cd80 Hans Verkuil 2024-03-22  1568  		unsigned int output = vivid_ctrl_hdmi_to_output_index[menu_idx];
514333e776cd80 Hans Verkuil 2024-03-22 @1569  		unsigned int hdmi_output = dev_tx->output_to_iface_index[output];
                                                                                   ^^^^^^^^
Dereference

514333e776cd80 Hans Verkuil 2024-03-22 @1570  		if (!dev_tx)
                                                            ^^^^^^^
Too late.

514333e776cd80 Hans Verkuil 2024-03-22  1571  			continue;
514333e776cd80 Hans Verkuil 2024-03-22  1572  		vivid_update_outputs(dev_tx);
514333e776cd80 Hans Verkuil 2024-03-22  1573  		if (dev->edid_blocks) {
514333e776cd80 Hans Verkuil 2024-03-22  1574  			cec_s_phys_addr(dev_tx->cec_tx_adap[hdmi_output],
514333e776cd80 Hans Verkuil 2024-03-22  1575  					v4l2_phys_addr_for_input(phys_addr, j),
514333e776cd80 Hans Verkuil 2024-03-22  1576  					false);
514333e776cd80 Hans Verkuil 2024-03-22  1577  		} else {
514333e776cd80 Hans Verkuil 2024-03-22  1578  			cec_phys_addr_invalidate(dev_tx->cec_tx_adap[hdmi_output]);
514333e776cd80 Hans Verkuil 2024-03-22  1579  		}
514333e776cd80 Hans Verkuil 2024-03-22  1580  	}
514333e776cd80 Hans Verkuil 2024-03-22  1581  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

