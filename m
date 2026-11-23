Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420200;
	b=EcQyaKeHxqar6nBz3xFVt5xob+L1gsWUw+bpnsjnuEgiuPfWU7NNI7OdogfbNjAHYaWh
	 KyS82ReEaImUZkKtpBbv+2VQRl8MKpDfRrUJWq2DJ+h0RjXD9LemWnlSLE+rD1g/gOrgA
	 QEWcoE1mM48Kqawqu2tKDap8Ob2soiQZ4FtKcf7469e3zzyJ6/JsnsP61SBlPUQ36pem9
	 YGThbSkEuxtc8d8EW5dAfl0RFEzK4LxMxIj2GcL5dmdlZ19Y29E/LrKWBjG20xR/MI4Pb
	 WS4g6s1afposKTqCFzfUMP+//bx2t+Pp7a1dgPY1KBrZSU8pZpaB48kzaAO8RSyXScA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=OA9zh2lc5i9Juo9pvjEdxXmn7HYwHhrvqPl17zykFvc=;
	b=2mqUc7/GrdC7JyfXeFubxarWsRD3AvikbiSaKGRkwmBKz/0qHuBvdAI1tboOys3HMBqx
	 kMewfua08Hg0vslZWP773gfmbVfdO88Pvvtz1oYxdLpUSLTLYh42CUEE9VAw6WTQBvtnQ
	 U7VzBF2WsmiH5nUGuuDaTsZwtSdLBdTtZ1rNGh6l8rfrvFPUavO0pzty5xMWT2AVHnzli
	 4q90szbDeQov8tSLONKfEn4feQHSZ1bJsgAXnEfYcWcoTgeCW5L3G8qCWvfYpN/B6Iu9E
	 FYksn3+ZAbuIZqbdSnGQMiHUf9xKF83khQputfsta08qvQZPOmcZoRya14bCge4h7tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nxB5lOPA;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8128606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 07:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8128606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nxB5lOPA
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a9be758734so1730787f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 23:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795420198; x=1796024998; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OA9zh2lc5i9Juo9pvjEdxXmn7HYwHhrvqPl17zykFvc=;
        b=nxB5lOPAidXDpfg5G9W/mwJq2zNMZ/1fTOt0E1U8Kk6HTnHzkPxupqJICvlTW/dwDo
         v7ciLV1Pv7cHF/GVCJ9rZQvdxhblVCdQi73Teb0RWGsm95UFcukme6UekDuhHuOPcXQo
         cxQe5canrs5xbcWd+evXmjV6umNGD/XIJLE1fl2Y/9HevE7MRkAfCxOA74d580yC0Yk1
         yYcSWSBcg8z6EK/eaVBcDXwspCd9kK8kWJfR9sljJuEmboaetFBLRWTPRtva2/4dzv6f
         WtO2ARwr1UUblI5YhPFq1J/vgzi6h+VqC6P/qsJMu16b3Je74mEXy8G7Vs7VWOjSaATB
         LAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795420198; x=1796024998;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OA9zh2lc5i9Juo9pvjEdxXmn7HYwHhrvqPl17zykFvc=;
        b=eWdqUKW+b1rLZrQ6y1BZtvuFwTZTRjouADQhnF0U7DQ9xzFJ+yfc2Jdh6M8FsAkCV3
         JSiteQoAwePXOCf7r2crsKKqaGMsvdUWG5R3lz0Xz3HhRUyjPUl1CDZ74gUjkVd1STSg
         sl2x7WG5lwYL+SEU0V3aTwyoPs9WdPyFFJKCl99jg5rjvLNvR6S+nI9H5y4rMa/C8HeN
         hP2M9ruy1o28iK95CCeWlZU/OWxdT0uF10Wt+VO4TuSUrjIeTTJbFEyFEvj/YwPfv9tG
         Cz9Iglzfdp37BhpjrUaJLmdu8WoSawvyBXqntjA9TKekDXflX/k2RcvF/f8ouqYvAK76
         VnKQ==
X-Forwarded-Encrypted: i=1; AL+hErEwxLZh942SwAClul9LnZzl3jbnMMC7qPAR1fpvB6tduNIC/MFdGJ9DZe7MEp2puYQVTG1dh1zyy4pKHUGr@lists.linux.dev
X-Gm-Message-State: APuU4Z8lWtHu8lC4ncqOyx+UC+kh7OFuLztHlx6y3dh8WPk7DI/dEhRz
	+8jYJypxNQGzwJ5VdJccm/v0Icu9usH2d2WlzuFLpb7Q6Q2nO0e4q4Ge
X-Gm-Gg: AZFdTZew4IgEQaomN7ZRbslYkEGcxSHOuR4eDh1fFBmYY+0tCFVxOzokBacSk7VFhYZ
	HmaAd3pR61vKlHa1FnuEoRXJfryuTQwJ1amV2NTZtqMPWIfgL1DJphJ+u5kcg8hmOftVud5ER7G
	mxxR7TTWcCp6NyqAab4sWwCd+VA35QSCdkTD/fF8kWy8cFjvthWqvMiEf8oSxe4BxASjfaBzEdf
	zbyr0rqSA22RYDFO+kFYa55Lu51hQBk9c0F+6yIpXgI89/ibxgl8yTl0LRWUDufmI0IDNSevKwz
	AgQkPVCYMzLxmoFaTsv5tMbH6E8Ue9ygIqsnPjv7LRUutkIyMx+2S+sHzH6M6XAJ5UFoW01rZEA
	XmilyRa7NgHo5Fq5qE7NZ3OpJcDwIZ8DQFiAP0skQHPATA28r+2SWZGSxnpJFweneUpIcJND6BS
	yXTnd0BS0HtGtzEoAjb59z8ltnvQoel2i6ZJp8EsMDXb5tto3nue9iP5RuXPWj/dmCWzUxd0L+T
	UQVQ/9G6sz89cAG9rSh1IliJ8OWCvCaaaJ4Towyw7x6s9+g/o55UdQ4C4tjyWg0x9aFSH7QykX/
	tnxorfHCN2co+y1C8u8++ZtV9MmoIGB8LK0ISTCW3u8psJAiQ9xjiOM9df4b6w1NCdo0PxrP1hj
	5ITeLAXdZIfLoDvlJSwHvFMX1mk4iZ4FlxoZajfIwbzJvJbpfmt8uhqlanWW0NMQUw4M=
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb888226c0mr256838175e9.27.1795420197917;
        Sun, 22 Nov 2026 23:49:57 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm178782895e9.4.2026.11.22.23.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:49:57 -0800 (PST)
Date: Mon, 23 Nov 2026 10:49:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Cristian Marussi <cristian.marussi@arm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V16 21/31]
 drivers/firmware/arm_scmi/driver.c:2405 scmi_alloc_init_protocol_instance()
 error: we previously assumed 'pi' could be null (see line 2354)
Message-ID: <20261122034843.dsyXusbp-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V16
head:   2583f5d73857467989b273f5a1a2f7bee48debd9
commit: 7364fc3b21577a5ff21f268186e0deefdae79d4c [21/31] firmware: arm_scmi: Add common per-protocol debugfs support
config: csky-randconfig-2200-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122034843.dsyXusbp-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261122034843.dsyXusbp-lkp@intel.com/

smatch warnings:
drivers/firmware/arm_scmi/driver.c:2405 scmi_alloc_init_protocol_instance() error: we previously assumed 'pi' could be null (see line 2354)

vim +/pi +2405 drivers/firmware/arm_scmi/driver.c

48dc16e2e52ca3 Cristian Marussi 2021-03-16  2336  static struct scmi_protocol_instance *
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2337  scmi_alloc_init_protocol_instance(struct scmi_info *info,
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2338  				  const struct scmi_protocol *proto)
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2339  {
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2340  	int ret = -ENOMEM;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2341  	void *gid;
7364fc3b21577a Cristian Marussi 2023-03-15  2342  	struct dentry *dbg;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2343  	struct scmi_protocol_instance *pi;
f0e73cee26dd3e Cristian Marussi 2021-03-16  2344  	const struct scmi_handle *handle = &info->handle;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2345  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2346  	/* Protocol specific devres group */
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2347  	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
f5800e0bf6f9b7 Cristian Marussi 2021-03-16  2348  	if (!gid) {
fc110108b98305 Cristian Marussi 2024-04-18  2349  		scmi_protocol_put(proto);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2350  		goto out;
f5800e0bf6f9b7 Cristian Marussi 2021-03-16  2351  	}
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2352  
4dd10fbbeb9c33 Kees Cook        2026-10-28  2353  	pi = devm_kzalloc_obj(handle->dev, *pi);
48dc16e2e52ca3 Cristian Marussi 2021-03-16 @2354  	if (!pi)
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2355  		goto clean;

pi is NULL

48dc16e2e52ca3 Cristian Marussi 2021-03-16  2356  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2357  	pi->gid = gid;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2358  	pi->proto = proto;
d7b6cc563a6007 Cristian Marussi 2021-03-16  2359  	pi->handle = handle;
d7b6cc563a6007 Cristian Marussi 2021-03-16  2360  	pi->ph.dev = handle->dev;
a4a20b0975dc7b Cristian Marussi 2021-03-16  2361  	pi->ph.xops = &xfer_ops;
5c873d120d8676 Cristian Marussi 2022-03-30  2362  	pi->ph.hops = &helpers_ops;
d7b6cc563a6007 Cristian Marussi 2021-03-16  2363  	pi->ph.set_priv = scmi_set_protocol_priv;
d7b6cc563a6007 Cristian Marussi 2021-03-16  2364  	pi->ph.get_priv = scmi_get_protocol_priv;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2365  	refcount_set(&pi->users, 1);
0fac05fdd9afff Cristian Marussi 2025-12-27  2366  
0fac05fdd9afff Cristian Marussi 2025-12-27  2367  	/*
0fac05fdd9afff Cristian Marussi 2025-12-27  2368  	 * Initialize effectively used protocol version performing any
0fac05fdd9afff Cristian Marussi 2025-12-27  2369  	 * possibly needed negotiations.
0fac05fdd9afff Cristian Marussi 2025-12-27  2370  	 */
0fac05fdd9afff Cristian Marussi 2025-12-27  2371  	scmi_protocol_version_initialize(handle->dev, pi);
0fac05fdd9afff Cristian Marussi 2025-12-27  2372  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2373  	/* proto->init is assured NON NULL by scmi_protocol_register */
a4a20b0975dc7b Cristian Marussi 2021-03-16  2374  	ret = pi->proto->instance_init(&pi->ph);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2375  	if (ret)
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2376  		goto clean;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2377  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2378  	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2379  			GFP_KERNEL);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2380  	if (ret != proto->id)
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2381  		goto clean;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2382  
533c7095b1ff92 Cristian Marussi 2021-03-16  2383  	/*
533c7095b1ff92 Cristian Marussi 2021-03-16  2384  	 * Warn but ignore events registration errors since we do not want
533c7095b1ff92 Cristian Marussi 2021-03-16  2385  	 * to skip whole protocols if their notifications are messed up.
533c7095b1ff92 Cristian Marussi 2021-03-16  2386  	 */
533c7095b1ff92 Cristian Marussi 2021-03-16  2387  	if (pi->proto->events) {
533c7095b1ff92 Cristian Marussi 2021-03-16  2388  		ret = scmi_register_protocol_events(handle, pi->proto->id,
b9f7fd907c38a3 Cristian Marussi 2021-03-16  2389  						    &pi->ph,
533c7095b1ff92 Cristian Marussi 2021-03-16  2390  						    pi->proto->events);
533c7095b1ff92 Cristian Marussi 2021-03-16  2391  		if (ret)
533c7095b1ff92 Cristian Marussi 2021-03-16  2392  			dev_warn(handle->dev,
533c7095b1ff92 Cristian Marussi 2021-03-16  2393  				 "Protocol:%X - Events Registration Failed - err:%d\n",
533c7095b1ff92 Cristian Marussi 2021-03-16  2394  				 pi->proto->id, ret);
533c7095b1ff92 Cristian Marussi 2021-03-16  2395  	}
533c7095b1ff92 Cristian Marussi 2021-03-16  2396  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2397  	devres_close_group(handle->dev, pi->gid);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2398  	dev_dbg(handle->dev, "Initialized protocol: 0x%X\n", pi->proto->id);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2399  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2400  	return pi;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2401  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2402  clean:
f5800e0bf6f9b7 Cristian Marussi 2021-03-16  2403  	/* Take care to put the protocol module's owner before releasing all */
fc110108b98305 Cristian Marussi 2024-04-18  2404  	scmi_protocol_put(proto);
7364fc3b21577a Cristian Marussi 2023-03-15 @2405  	dbg = pi->dbg;

Dereferenced

48dc16e2e52ca3 Cristian Marussi 2021-03-16  2406  	devres_release_group(handle->dev, gid);
7364fc3b21577a Cristian Marussi 2023-03-15  2407  	debugfs_remove_recursive(dbg);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2408  out:
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2409  	return ERR_PTR(ret);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2410  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

