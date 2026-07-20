Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6B12BE051
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543104; cv=none; b=J0XH45IihMpBLXRZgN/cft1Yu9xwouLvNtaZikTFcFmIp4v3A1A8uLJEfMbolk4lwq0re+/YGi+POAwL75ySKYoatLNFVFFRkwEsZazAsev0usoaY3WjnLHpmo/mSyH05ngH/GoMJTA4T8cfS3zqPg1qzdd1KWmn61e5v4swA8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543104; c=relaxed/simple;
	bh=ckimUR6gwuo+mqkl6gDXD445mZso1swTRhp9PaCagKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WIOt9pg6x5dL4LukBgglAK1uJkV5/0qRUttFgXRHtVOmwVXvYfiRKIMxLvI/wLd+BY6nDWyUonKtUjl+huaRKtVWAno57r9MM1D2ACAFV2Us2aQS1rSmP1GgBHOsSpIgm0zh43G0Xawu+ctz8TxHwB6g09oP9n2XLoyM+hCydu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RE/ztaB7; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RE/ztaB7"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4a466f81a24so4775284b6e.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 03:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784543101; x=1785147901; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYySX44d1oxzkBsIpWJvjCEoBpETNPjFvioJM03AFL0=;
        b=RE/ztaB7LUxRaEfLI1y0Kh7w+fUq//4Uu62S2GoM6kZIOzsFz3XNxKz6bjl+qHb12p
         PAcFJw3WJZiTPB2mu2PuP28lllIzN9Gq6BpGsYe4t5KBlzeqrU7Psqh23pJQmcQzBiN+
         XN+/VZhXGLFNL9GGRNsu/t1EWKxUfOi6b1qTvTc10YdonT6Mbcydq0M757niC28+g6ks
         aQ2So0xQOvBr1S08azNDR+MVRqN4Vp7c/DBNsLB+X2Cc7SqzXGLQul+AS8Xq8bgcvoT2
         Phpr0iTlq/U5g9A23Z4nRcvAQogym9d2h1p3WWl+XQWoEBubkqM4g7bnUSsPjzr49HmF
         rFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543101; x=1785147901;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYySX44d1oxzkBsIpWJvjCEoBpETNPjFvioJM03AFL0=;
        b=qUok5r3lWbgHFF6/by/y6Ul8w8PxEjL0LHk7H8sdTZS9xptkKCci363UCsDSecASLt
         I6OPSyO0eSycCNOZI5Sx9TnB9Cm9mi+KUopcXhRMm415uUSrCzM6jq1gfMJ2Y6gGhEpH
         RNo5nsBN4BnkKnpqGczPdA/LQ7MNGGgEH4S3pR/4WiKJTdnh79ibTqmyW3/ZxHATPbOj
         1EV68IpPaiCeSOSEu4Xv7tca3RNOPdPlSmfZcQL24YaP9vOjw1mYN/ukGaIjaDxU4PN/
         lgiVFo7VR2/xvPzloyHqQ2UZ/ST23UBQGmMWAb2YNAyubYJJnsX5B7SalzwyJWqahlTe
         Wqfw==
X-Forwarded-Encrypted: i=1; AHgh+RoL3iSdlhh2tUsOqZ1MmvIkwa7fojr8YjWWv+yUz/2hvOCpJVL+gZiHJxNT8zK9btLVLO9fphaEDTtEDGoP@lists.linux.dev
X-Gm-Message-State: AOJu0YzOSbBKPrZO+CgPg7jn43ELFU5snBxNfvHbiG816X1xdnD9HSCa
	jMoDVSSQqJmcDKjH2ugfSBAMK6iw4AIri0GkbZXqFO8HfUWIoQDn0sd1
X-Gm-Gg: AfdE7clQ+ED2d7hEjRzVhYzQGI7AgcpecHPF4yv0Q48XbkR3nTDzTbYnvbJQ0uHaWXA
	t4cETy58KTPn3oMg9j4YsX3+A2Q9F/3ziTKMCbtAp78d0xZ3nrOFwZm88lQvl2UvnbWlq2mcMAf
	maDZF2qoH2rXnBOaLGq1ubZGTTISKdOQ03dLMwWzDkZ6Ea+ZokfjBoMsLmzcGjaDN+cnGh7oFTr
	jBATzrZCX2wugNsEOIuMDtNEx2JK9PEpa/K/mnl1UJE4gO8sS3pm08o97bflOPcjR3iZ7mdpb+v
	6Mfamu/6N2ktj6OxYqH3hbqL/vB9B0saeemwXro9qfKYqjWLrwunU1AgrBtX+El5vmnYAJUb0Cv
	yN9D0jV+GtJSkshNMNyQG1Y/metw+iffl7KDKv2iNgv5d9zZormoRNU1qm6QKN5ilolHVVw==
X-Received: by 2002:a05:6808:170f:b0:497:8f1:df07 with SMTP id 5614622812f47-4a4d0160621mr7327033b6e.7.1784543100628;
        Mon, 20 Jul 2026 03:25:00 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3a57b9bsm7562536b6e.2.2026.07.20.03.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:24:58 -0700 (PDT)
Date: Mon, 20 Jul 2026 13:24:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 drivers/usb/gadget/function/f_hid.c:1276 hidg_bind() warn: missing error
 code 'status'
Message-ID: <202607191041.mUlJ0LSw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   2bfc8fe4015fcf2e39fc5989b95d20d6b5f7b566
commit: c6c0d13db5d0f8d465eabc14bd23d2b6a7247a43 [1/1] usb: gadget: f_hid: don't call cdev_init while cdev in use
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260719/202607191041.mUlJ0LSw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607191041.mUlJ0LSw-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/function/f_hid.c:1276 hidg_bind() warn: missing error code 'status'

vim +/status +1276 drivers/usb/gadget/function/f_hid.c

cb382536052fcc7 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1162  static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1163  {
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1164  	struct usb_ep		*ep;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1165  	struct f_hidg		*hidg = func_to_hidg(f);
5ca8d3ec9970f47 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1166  	struct usb_string	*us;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1167  	int			status;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1168  
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1169  	hidg->get_req = usb_ep_alloc_request(c->cdev->gadget->ep0, GFP_ATOMIC);
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1170  	if (!hidg->get_req)
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1171  		return -ENOMEM;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1172  
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1173  	hidg->get_req->zero = 0;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1174  	hidg->get_req->complete = hidg_get_report_complete;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1175  	hidg->get_req->context = hidg;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1176  	hidg->get_report_returned = true;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1177  
cb382536052fcc7 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1178  	/* maybe allocate device-global string IDs, and patch descriptors */
5ca8d3ec9970f47 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1179  	us = usb_gstrings_attach(c->cdev, ct_func_strings,
5ca8d3ec9970f47 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1180  				 ARRAY_SIZE(ct_func_string_defs));
5ca8d3ec9970f47 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1181  	if (IS_ERR(us))
5ca8d3ec9970f47 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1182  		return PTR_ERR(us);
5ca8d3ec9970f47 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1183  	hidg_interface_desc.iInterface = us[CT_FUNC_HID_IDX].id;
cb382536052fcc7 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1184  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1185  	/* allocate instance-specific interface IDs, and patch descriptors */
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1186  	status = usb_interface_id(c, f);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1187  	if (status < 0)
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1188  		goto fail;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1189  	hidg_interface_desc.bInterfaceNumber = status;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1190  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1191  	/* allocate instance-specific endpoints */
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1192  	status = -ENODEV;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1193  	ep = usb_ep_autoconfig(c->cdev->gadget, &hidg_fs_in_ep_desc);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1194  	if (!ep)
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1195  		goto fail;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1196  	hidg->in_ep = ep;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1197  
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1198  	hidg->out_ep = NULL;
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1199  	if (hidg->use_out_ep) {
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1200  		ep = usb_ep_autoconfig(c->cdev->gadget, &hidg_fs_out_ep_desc);
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1201  		if (!ep)
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1202  			goto fail;
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1203  		hidg->out_ep = ep;
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1204  	}
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1205  
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1206  	/* used only if use_out_ep == 1 */
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1207  	hidg->set_report_buf = NULL;
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1208  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1209  	/* set descriptor dynamic values */
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1210  	hidg_interface_desc.bInterfaceSubClass = hidg->bInterfaceSubClass;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1211  	hidg_interface_desc.bInterfaceProtocol = hidg->bInterfaceProtocol;
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1212  	hidg_interface_desc.bNumEndpoints = hidg->use_out_ep ? 2 : 1;
b3c4ec71ec413c2 drivers/usb/gadget/function/f_hid.c Abdulhadi Mohamed         2017-07-19  1213  	hidg->protocol = HID_REPORT_PROTOCOL;
afcff6dc690e24d drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-07-21  1214  	hidg->idle = 1;
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1215  	hidg_ss_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1216  	hidg_ss_in_comp_desc.wBytesPerInterval =
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1217  				cpu_to_le16(hidg->report_length);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1218  	hidg_hs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1219  	hidg_fs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1220  	hidg_ss_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1221  	hidg_ss_out_comp_desc.wBytesPerInterval =
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1222  				cpu_to_le16(hidg->report_length);
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1223  	hidg_hs_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1224  	hidg_fs_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
f286d487e9283a4 drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2015-03-27  1225  	/*
f286d487e9283a4 drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2015-03-27  1226  	 * We can use hidg_desc struct here but we should not relay
f286d487e9283a4 drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2015-03-27  1227  	 * that its content won't change after returning from this function.
f286d487e9283a4 drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2015-03-27  1228  	 */
74388368927e9c5 drivers/usb/gadget/function/f_hid.c Terry Junge               2025-03-12  1229  	hidg_desc.rpt_desc.bDescriptorType = HID_DT_REPORT;
74388368927e9c5 drivers/usb/gadget/function/f_hid.c Terry Junge               2025-03-12  1230  	hidg_desc.rpt_desc.wDescriptorLength =
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1231  		cpu_to_le16(hidg->report_desc_length);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1232  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1233  	hidg_hs_in_ep_desc.bEndpointAddress =
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1234  		hidg_fs_in_ep_desc.bEndpointAddress;
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1235  	hidg_hs_out_ep_desc.bEndpointAddress =
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1236  		hidg_fs_out_ep_desc.bEndpointAddress;
10287baec761d33 drivers/usb/gadget/f_hid.c          Sebastian Andrzej Siewior 2012-10-22  1237  
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1238  	hidg_ss_in_ep_desc.bEndpointAddress =
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1239  		hidg_fs_in_ep_desc.bEndpointAddress;
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1240  	hidg_ss_out_ep_desc.bEndpointAddress =
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1241  		hidg_fs_out_ep_desc.bEndpointAddress;
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1242  
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1243  	if (hidg->use_out_ep)
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1244  		status = usb_assign_descriptors(f,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1245  			hidg_fs_descriptors_intout,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1246  			hidg_hs_descriptors_intout,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1247  			hidg_ss_descriptors_intout,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1248  			hidg_ss_descriptors_intout);
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1249  	else
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1250  		status = usb_assign_descriptors(f,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1251  			hidg_fs_descriptors_ssreport,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1252  			hidg_hs_descriptors_ssreport,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1253  			hidg_ss_descriptors_ssreport,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1254  			hidg_ss_descriptors_ssreport);
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1255  
10287baec761d33 drivers/usb/gadget/f_hid.c          Sebastian Andrzej Siewior 2012-10-22  1256  	if (status)
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1257  		goto fail;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1258  
749494b6bdbbaf0 drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2017-01-24  1259  	hidg->write_pending = 1;
749494b6bdbbaf0 drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2017-01-24  1260  	hidg->req = NULL;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1261  
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1262  	INIT_WORK(&hidg->work, get_report_workqueue_handler);
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1263  	hidg->workqueue = alloc_workqueue("report_work",
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1264  					  WQ_FREEZABLE |
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1265  					  WQ_MEM_RECLAIM,
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1266  					  1);
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1267  
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1268  	if (!hidg->workqueue) {
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1269  		status = -ENOMEM;
0ab3ae768c48472 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1270  		goto fail_free_descs;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1271  	}
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1272  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1273  	/* create char device */
c6c0d13db5d0f8d drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1274  	hidg->cdev = cdev_alloc();
c6c0d13db5d0f8d drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1275  	if (!hidg->cdev)
c6c0d13db5d0f8d drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27 @1276  		goto fail_free_all;

status = -ENOMEM.  Probably this is fixed upstream?

c6c0d13db5d0f8d drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1277  	hidg->cdev->ops = &f_hidg_fops;
c6c0d13db5d0f8d drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1278  
c6c0d13db5d0f8d drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1279  	status = cdev_device_add(hidg->cdev, &hidg->dev);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1280  	if (status)
0ab3ae768c48472 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1281  		goto fail_free_all;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1282  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1283  	return 0;
0ab3ae768c48472 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1284  fail_free_all:
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1285  	destroy_workqueue(hidg->workqueue);
0ab3ae768c48472 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1286  fail_free_descs:
d12a8727171c770 drivers/usb/gadget/function/f_hid.c Pavitrakumar Managutte    2014-10-22  1287  	usb_free_all_descriptors(f);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1288  fail:
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1289  	ERROR(f->config->cdev, "hidg_bind FAILED\n");
14794d7133d0f16 drivers/usb/gadget/function/f_hid.c Felipe F. Tonello         2016-08-23  1290  	if (hidg->req != NULL)
14794d7133d0f16 drivers/usb/gadget/function/f_hid.c Felipe F. Tonello         2016-08-23  1291  		free_ep_req(hidg->in_ep, hidg->req);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1292  
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1293  	usb_ep_free_request(c->cdev->gadget->ep0, hidg->get_req);
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1294  	hidg->get_req = NULL;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1295  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1296  	return status;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1297  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

