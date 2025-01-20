Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83447DA82
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 05:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737351397; cv=none; b=Kor6wQDZ/fvNIvU18j6T5is9LxIqu7i5tPK6VvU3iFubxI1umLvy2T+TB8lHmLyZlfLbmwmgNKiA0ckZKblAo8N3TGpmiWLRRNioHrYJpOwYYFF6CIcam+x7NGXXGq4OwZ1HDTx2PyuivV0HsdFm2umafvMK3mUyT5hy/TbppxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737351397; c=relaxed/simple;
	bh=TN1J20OqsPCnlpFGpwKbUj9FxpUmA8DCf1YGKRzdFxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EnAE2CF0gsV2VHCpDGFwgvPVB5k4AzMe+p1OhKrFwtOb6yF8k6dPOU+3KAqTUPqYgvVaw2uKY2mgCT9dvVLkRr6IasPsAXnLN9wELn48v3WZYkHLlN0QH68jrDWeN6u8QkZt0xttSjPgyZCh6IgZMXc96qz4T/uZjsB/1awhkn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DPNfLsjY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DPNfLsjY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso30949965e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 21:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737351394; x=1737956194; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YRfUWZpbf8cWtc9oMicz6yb5E+BBg8/UYzv2sjHBlV4=;
        b=DPNfLsjYZpcUO+BhZS7F5aNHCP9A2TgpCN7c7LYl9fx0+8Ih+b6FxT2yJBEuOmyt3w
         jUz5L6xuFOfY2xoMNOKgsHn1OC2GVw4w0Jj5FWZxtFmX8aa6CwyJV4krpY9UF+b9UHZg
         FgHEm9Wu015isTnoeU03azsty08KP6K2grzHyVg+uxrvIbAMJ9rU9CVHDQCpVs/Pqw1x
         t1NgZcQl6NYV403ZOTCz33tFCOnb4TkUJtl0SUHJteaTVFHsFZLGjVeoG7r5HtidNxBD
         yxBr8Nn4900MZOgXCSMiy0ERlRY4fpjrkgLxY6xS2nojD6ZsH78o/ChZgrh6Xsf38/hZ
         4YYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737351394; x=1737956194;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRfUWZpbf8cWtc9oMicz6yb5E+BBg8/UYzv2sjHBlV4=;
        b=I4OvIh19Fwzgw4ZDYa5/Q694pUSPrqIp+UbWByBirJh2vVCHHluTvtgaGGNIvOdKAr
         0ulzqcZ6rL8f/zJJ6nXuBUq7Kwzpx8h6F50JHhSws3VAP8mOB8nYPfLT8jdxTtVFA3JY
         qJ2UooJFuJSPlw6V87Et5ifFFAv4mLwEW+1fQPFPwlYO1un4tlq+PrMCRKOZqKPsk8HW
         BYfwqRGThjTWch+HGtSGvyvvRIZbqoAx7w1owvHTKoDAb7NH7VOnfqmho8Zf0CT9/GmH
         czCl44SFZZHlCuF2muCeXBQ8M3U2GxuIDR6rCQIultn3C3ENoVUjGAu/S1zca0lMmLQ/
         eDdg==
X-Forwarded-Encrypted: i=1; AJvYcCXHGsfIzkJk2A+aqr3OM71MrH9OPMu9lT6Ha3+1yZrlrEy/IJ472IpHO75O80uumbWcpwOPowgDfU7mwyPC@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0V/Nogwk2KrETKfwgKJ6ImBoFBCVyQvrU2Y9WodHWvRKVhkUI
	KX8EDcSaZskWvth8EQglipNcvoiL7FYjfqdaTW7Lhu/3AOw6yguMmwFAHpRoQVw=
X-Gm-Gg: ASbGncuSiE41THDNaXX1HmgYELhW2m0MN40M6KgXZBNi/5hwQ7mv3lvoTakCQfUS5Tx
	TMf/bqVlisSLs+TfWmX8/7oQE6qfwIo8snX0+IBv1hSmQmsaN88McIIx4nANi79feAaKBtGBy0a
	C+QM6PQ2/dzz9ScXzcfwvbASWqmNihJ52ZJSVS/MUrR+rdO8LCygBmEQlZo75KJDmucWBXYOCtl
	ufsZV2thHIQfJkrlARWTFrHTaIq7G/s+VmJZYH1MPaPasdrMSBhSqx4GPhL5scg5ocfi5bskqI=
X-Google-Smtp-Source: AGHT+IHum6raKE7C+EQJtkh5Jmin6g67lfMxt2Yz4BCC3IaBf3pp2ELEhj/S2dGKkOGfT2Xpx9cH8w==
X-Received: by 2002:a7b:cc06:0:b0:437:c453:ff19 with SMTP id 5b1f17b1804b1-437c6b4707cmr173652975e9.14.1737351394063;
        Sun, 19 Jan 2025 21:36:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046226asm123020455e9.31.2025.01.19.21.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 21:36:33 -0800 (PST)
Date: Mon, 20 Jan 2025 08:36:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [wens:mtk-wip 24/48] drivers/gpu/drm/bridge/analogix/anx7625.c:2658
 anx7625_typec_mux_set() error: 'port' dereferencing possible ERR_PTR()
Message-ID: <a7c24973-cebe-44e0-a5f4-9c2497dd3206@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   a2f8143f6e1e6b3d8dac24f675646fbfdfc03202
commit: d62036e150e84eff425756d90cf8f060d86beb17 [24/48] drm/bridge: anx7625: Register Type C mode switches
config: arm-randconfig-r071-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180409.LUg1bFSN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501180409.LUg1bFSN-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/analogix/anx7625.c:2658 anx7625_typec_mux_set() error: 'port' dereferencing possible ERR_PTR()

vim +/port +2658 drivers/gpu/drm/bridge/analogix/anx7625.c

d62036e150e84e Pin-yen Lin 2023-03-31  2654  static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
d62036e150e84e Pin-yen Lin 2023-03-31  2655  				 struct typec_mux_state *state)
d62036e150e84e Pin-yen Lin 2023-03-31  2656  {
d62036e150e84e Pin-yen Lin 2023-03-31  2657  	struct drm_dp_typec_port_data *port = typec_mux_get_drvdata(mux);
                                                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^
typec_mux_get_drvdata() this returns ERR_PTR(-EOPNOTSUPP) if CONFIG_TYPEC
is disabled.  I assumed that the Kconfig specified that CONFIG_TYPEC had
to be enabled unless COMPILE_TEST was enabled but I didn't find that in
the KConfig when I looked.

Does the Kconfig have a depend/select/imply on CONFIG_TYPEC that I missed?

d62036e150e84e Pin-yen Lin 2023-03-31 @2658  	struct anx7625_data *ctx = port->data;
d62036e150e84e Pin-yen Lin 2023-03-31  2659  	struct device *dev = ctx->dev;
d62036e150e84e Pin-yen Lin 2023-03-31  2660  	struct drm_dp_typec_switch_desc switch_desc = ctx->switch_desc;
d62036e150e84e Pin-yen Lin 2023-03-31  2661  	bool new_dp_connected, old_dp_connected;
d62036e150e84e Pin-yen Lin 2023-03-31  2662  
d62036e150e84e Pin-yen Lin 2023-03-31  2663  	if (switch_desc.num_typec_switches == 1)
d62036e150e84e Pin-yen Lin 2023-03-31  2664  		return 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

