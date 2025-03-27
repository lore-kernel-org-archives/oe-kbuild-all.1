Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7608D2116FD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 11:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743074978; cv=none; b=dMefdr+RjPYirKIL2h9YrinMhw42QunSBomxx3jTOAx9FeSamHLGO7PFFk4JvKueuijW9RGF3Yns1PGeIW4NmuU26YTOrMOEu2yDhzavcKbu9MpgCewFptdjg+8S2QjSM/qCiwbruc8+KfG6LkZppYqycpKeKXVa+i+fsbXKSuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743074978; c=relaxed/simple;
	bh=6LWSWBpkPrQW4IYf5zDsEILowIO6XhHZRpzO09snwhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQy8mPlPSl72Eh8lVdq4E77JqkSqOpHeo2xAcrCRG35Jk64fLIp0O/uNHZXRSfzGbqF9Kyw/0VMaLNClql5HJ1Xd0+QnOysyCvv/GoO6E6d0qiNf+wpHVotafjXqMmlrxy67P6nYbraWzR4paBhSny0FePGpgVLzwmhAJs3Jr74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dUgnFwcC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dUgnFwcC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe574976so6127195e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743074975; x=1743679775; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zZ+3xAr/weJucKnkN/ZzUO48S98jjHi3abVGsFfKd4g=;
        b=dUgnFwcCKEgmvWJkCw7V4jgdVOaU/pTp6W0JZITb3ZeRIZD3PFTqE2Wv4DvVUq79C9
         J8P4p0ILhbmY/F0hbmkglt0O2RZLv0sCyw/RUdXDs47h9SyssQQz5BhMvukyloiPgmPf
         7ur13qadayUpMlbfy/o5XfYCuGKQHSdgGgPhlrABtFjNid1RS3QbMI3VBVOwVBuZt8Ms
         ba9O+RdQJLTImWKRv1SR+BcmBihQ3Yzj7+qjHcnL09aUNp/zUuKk961zJRlZ/V7By757
         nzzhag4KtSzIjnQKcM8tXasc2KZZwcECO26X09zEAXmR/EddeTl1XIZzlKFriEt3xrw4
         sbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743074975; x=1743679775;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZ+3xAr/weJucKnkN/ZzUO48S98jjHi3abVGsFfKd4g=;
        b=lPa2Dgfx59ZOoWakLkVfGjCOl624yTMAl0Ts1mW2kWyxUDA7F71cXNYoE8u0xfFKYL
         SRyWoODx6nuCvwSe/4MOqlhUV0HwF/CV6bXRl6YCAZYwwUlHU0lgdACadgo0Dj/K5LFM
         LE2VjSmRhz+H86dwkTnUHO3HmNqpUGEiBL4AAmR5Of06hiCLe2O09AGJ7sMCVqLyyrFG
         my8ugedjmN8aRas3rZJrhufGOrWIaerx+27++JcVes/hkRtxa+Apm9gAC66SlJpnZye8
         DV0W1uhjhKIRHmyXnUUgYZTTOUS3d9nzap45tNf2jVkM0QiMQA8QWgOrqYJvOxatwz2I
         NXIw==
X-Forwarded-Encrypted: i=1; AJvYcCXdI6pN/dNKVwA9IKONNTiYWbhRLxtgmTKKLtQuqKio7yzrUyZi6Ec6GSUNsnU9w7uS7lhkh54EfMGu4RiE@lists.linux.dev
X-Gm-Message-State: AOJu0YxTnPtNyyYGJ1NfvtGvb+Xwt1PMmjUG8B29ZzRbPVaKPwGRBypp
	OZcK967kbZ/JrnUZnWqiqOAX4TrTD9JibXAQ4d+FcQVl1fkd+U8v2W5KlwhQCEE=
X-Gm-Gg: ASbGncv+lCIqqgYfI4DBo0DbVugs+B0jfs0Rwp8yhGekoIsyHvhYG0mJH55BCgsCAU7
	4/Xu+aYcveOVKQhpz5UmFppIACO8cIz1lU6gOVrMM2FjuBMKS1Pks4XRL9aGGtYNEjU+Eqi/Cl1
	5rcnvPb/1450uk3SppdByIYuTGNAOry41h2nss5Gau3HaqsWrraLCM5SlqGDirjMsqwgTMrc/9z
	IPOMhNKD2u4K8QN/+73WlwY4t8jTIo+v+eY6E1jgL/ixwVeuvqkxntA43zvtG+0OamiXBB+gdq0
	TmVHC7HOGXzqJWvhh7mn9lJTqygxKAEPC1BHvymHq6qrrK5gNA==
X-Google-Smtp-Source: AGHT+IHnFVXz1zWLFoVTNLq3A+8aEkQAkczXoO2gAwQgWjk3CvezkR1sU/oqM7u2DjZ74uiNLxNxaA==
X-Received: by 2002:a05:600c:4ca3:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-43d853fdc93mr18089135e9.15.1743074974543;
        Thu, 27 Mar 2025 04:29:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d82a041d4sm36633905e9.0.2025.03.27.04.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 04:29:34 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:29:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2060/2060] drivers/hid/hid-thrustmaster.c:178
 thrustmaster_interrupts() warn: possible memory leak of 'send_buf'
Message-ID: <1ed61874-c857-46d4-bac3-d021ded1cf44@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b28aab59b06935f0d1c9bce8f013f25b4094764d
commit: 477cfc70d964fafd811f91a889f14c356f937b8e [2060/2060] HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check
config: x86_64-randconfig-161-20250326 (https://download.01.org/0day-ci/archive/20250327/202503271832.WycjTkRa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503271832.WycjTkRa-lkp@intel.com/

smatch warnings:
drivers/hid/hid-thrustmaster.c:178 thrustmaster_interrupts() warn: possible memory leak of 'send_buf'

vim +/send_buf +178 drivers/hid/hid-thrustmaster.c

c49c33637802a2 Dario Pagani     2021-01-31  150  static void thrustmaster_interrupts(struct hid_device *hdev)
c49c33637802a2 Dario Pagani     2021-01-31  151  {
c49c33637802a2 Dario Pagani     2021-01-31  152  	int ret, trans, i, b_ep;
c49c33637802a2 Dario Pagani     2021-01-31  153  	u8 *send_buf = kmalloc(256, GFP_KERNEL);
c49c33637802a2 Dario Pagani     2021-01-31  154  	struct usb_host_endpoint *ep;
c49c33637802a2 Dario Pagani     2021-01-31  155  	struct device *dev = &hdev->dev;
c49c33637802a2 Dario Pagani     2021-01-31  156  	struct usb_interface *usbif = to_usb_interface(dev->parent);
c49c33637802a2 Dario Pagani     2021-01-31  157  	struct usb_device *usbdev = interface_to_usbdev(usbif);
c49c33637802a2 Dario Pagani     2021-01-31  158  
c49c33637802a2 Dario Pagani     2021-01-31  159  	if (!send_buf) {
c49c33637802a2 Dario Pagani     2021-01-31  160  		hid_err(hdev, "failed allocating send buffer\n");
c49c33637802a2 Dario Pagani     2021-01-31  161  		return;
c49c33637802a2 Dario Pagani     2021-01-31  162  	}
c49c33637802a2 Dario Pagani     2021-01-31  163  
fc3ef2e3297b3c Pavel Skripkin   2022-02-20  164  	if (usbif->cur_altsetting->desc.bNumEndpoints < 2) {
fc3ef2e3297b3c Pavel Skripkin   2022-02-20  165  		kfree(send_buf);
fc3ef2e3297b3c Pavel Skripkin   2022-02-20  166  		hid_err(hdev, "Wrong number of endpoints?\n");
fc3ef2e3297b3c Pavel Skripkin   2022-02-20  167  		return;
fc3ef2e3297b3c Pavel Skripkin   2022-02-20  168  	}
fc3ef2e3297b3c Pavel Skripkin   2022-02-20  169  
c49c33637802a2 Dario Pagani     2021-01-31  170  	ep = &usbif->cur_altsetting->endpoint[1];
c49c33637802a2 Dario Pagani     2021-01-31  171  	b_ep = ep->desc.bEndpointAddress;
c49c33637802a2 Dario Pagani     2021-01-31  172  
477cfc70d964fa Karol Przybylski 2024-12-05  173  	/* Are the expected endpoints present? */
477cfc70d964fa Karol Przybylski 2024-12-05  174  	u8 ep_addr[1] = {b_ep};
477cfc70d964fa Karol Przybylski 2024-12-05  175  
477cfc70d964fa Karol Przybylski 2024-12-05  176  	if (!usb_check_int_endpoints(usbif, ep_addr)) {
477cfc70d964fa Karol Przybylski 2024-12-05  177  		hid_err(hdev, "Unexpected non-int endpoint\n");
477cfc70d964fa Karol Przybylski 2024-12-05 @178  		return;

kfree(send_buf);

477cfc70d964fa Karol Przybylski 2024-12-05  179  	}
477cfc70d964fa Karol Przybylski 2024-12-05  180  
c49c33637802a2 Dario Pagani     2021-01-31  181  	for (i = 0; i < ARRAY_SIZE(setup_arr); ++i) {
c49c33637802a2 Dario Pagani     2021-01-31  182  		memcpy(send_buf, setup_arr[i], setup_arr_sizes[i]);
c49c33637802a2 Dario Pagani     2021-01-31  183  
c49c33637802a2 Dario Pagani     2021-01-31  184  		ret = usb_interrupt_msg(usbdev,
c49c33637802a2 Dario Pagani     2021-01-31  185  			usb_sndintpipe(usbdev, b_ep),
c49c33637802a2 Dario Pagani     2021-01-31  186  			send_buf,
c49c33637802a2 Dario Pagani     2021-01-31  187  			setup_arr_sizes[i],
c49c33637802a2 Dario Pagani     2021-01-31  188  			&trans,
c49c33637802a2 Dario Pagani     2021-01-31  189  			USB_CTRL_SET_TIMEOUT);
c49c33637802a2 Dario Pagani     2021-01-31  190  
c49c33637802a2 Dario Pagani     2021-01-31  191  		if (ret) {
c49c33637802a2 Dario Pagani     2021-01-31  192  			hid_err(hdev, "setup data couldn't be sent\n");
c3800eed22d21c Evgeny Novikov   2021-07-30  193  			kfree(send_buf);
c49c33637802a2 Dario Pagani     2021-01-31  194  			return;
c49c33637802a2 Dario Pagani     2021-01-31  195  		}
c49c33637802a2 Dario Pagani     2021-01-31  196  	}
c49c33637802a2 Dario Pagani     2021-01-31  197  
c49c33637802a2 Dario Pagani     2021-01-31  198  	kfree(send_buf);
c49c33637802a2 Dario Pagani     2021-01-31  199  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

