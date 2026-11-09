Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202170;
	b=CKpX2FiOrqvcjkGLoGrgtgVWhaBa1xt9Lq96zX6G1ON6a9QEKOYwBIXTd+ONCpc1AjgZ
	 QpK8LK0UnvY2fIZPVAdP5jORsOU5mUgNL9NPigMu9sDu3K+C3X9X7RJigN7Lv4IQwqKnM
	 gUQZBtW1FdYauiZQkoryzj6o291nP+SzftvpHtTJXzuiz924tRxWrLHLvPxU/HyUpmzc+
	 y+E0EDEjMlg6/FSHUxqOChECxXaww3E7j2zfBcF+ydiAY+xPoLnQ6YUFSHdM790XxPFY4
	 K7Hd/QLwhv+PYw8xU9klIjYXfLHwnnrNssaTk9NWXoBqw+VBk0YGnRPY7NfIylxgpDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding;
	bh=HZtw4LLKwVCjVpJ8oCRSNP25Jrr+H/ycvRzjHFYTTiA=;
	b=FFuFCrxaLMyq1WXT38YczHr8ab8h/14jKcznEbpRtdj6yXvnfCjFzhZp0KsBiLzue9Ll
	 6WuYYnPK4rSCv8KF72dWcqg0896WCb2jWv16GfY+vE9jEo4+6bNzqjl/HwtucA3Uqd0w+
	 Gjh+3JHSfywlUVIryGTmHdfs0XJis0ywAFVqG7UcIJNF5z/4+o1+Kwy90Vy8QD0k0lDFs
	 WpJFSk/xlk1M6pDB5jCYvFPjitA3Oe7SQwE5NF5yANyQp/rGzWNrXMCUCPzaHNNLiNajU
	 pDGXfqHJr0mS57emUVQb8FvYYpxVoq9o7f3hY6Y3kDDlnw+hbpO6JPdgCHx+Ca2TzrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGoCwbkh;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BB5606D81B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 05:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08BB5606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGoCwbkh
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a208d93758so4277855e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 08 Nov 2026 21:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202168; x=1794806968; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HZtw4LLKwVCjVpJ8oCRSNP25Jrr+H/ycvRzjHFYTTiA=;
        b=kGoCwbkh0S2MnMS7vQc33Lzu5tYkk8nU9uLS5cvtbXhiAo82IIcKzdq8A5h5vt/ksf
         zCeocyYhKB63kT9J9wBWrt74WDxjcF8W2nHRqeXanq3aG4/6n+yQ+ibrlswb6ZDPA232
         SWdj75fCy7aaGOFAWr7vsCuR0gLxgoeUJ2WGaehpd/ogVn2JdArqY4UT8F44+Kx1IJqI
         pIX3Inqwd5ytDJ4NnhE1UZMzWrI6N8XXXrjEgpPi7ZE3fVVnZMCZlx1ii+jBOT0/dpnc
         uXWIm2DbMfG/RfBbOKHT+CalbI9LwiFXZg9kQYAwCk0/F7EFkORg0RXmN61vrP3bNPUf
         VToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202168; x=1794806968;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZtw4LLKwVCjVpJ8oCRSNP25Jrr+H/ycvRzjHFYTTiA=;
        b=QwXZ2wJsI5WlgKWKL7PetGptD9frJUNxjZ56IELfqDPIt4qBgAfxk2GXSWKcCoTtp4
         awkeUZOnrVDj0xveWrGVpDblL1NPbjM8zudGbG2ij0/pGIJAgYkOGqckbGeH+PLv5ogy
         K0zlIxqiQ52VB/zRj13JNir8l3Pe0CSK+SxsXsSHnaf/MdYBSoH7mqJ04YOdq9GcnIZb
         tuic6XLr2l78VxxCuiBNZwgWJhmpyI2jj7UUQZ/nGVxighkQ4xT2GcQPTULaQZUcOATm
         68sEMSL4HommsJ9GhCXyZRCdTPdqdSfXkoKYfyKQtm3EYyDTKxvp11K4WlDe+uQ8bjB4
         WCbw==
X-Forwarded-Encrypted: i=1; AL+hErGXzRKTsVpT6qy7RZY6Xrw4aAfdIQrhJp8WEmaZJMgkCXVfqMa5858aWiwSk+B4Zq/XI2dxfxZQzC/3QsJs@lists.linux.dev
X-Gm-Message-State: APuU4Z930cQ1RQEmRyk+/JSXe/JFApDZMAcsXsiplBBOU2VWWtqqrtxG
	pnrhHmLJsSTtL7yuH0km2lLLcIYFEnzV6NzVANPKtsPw3CLBfluRHDHeH9kWffs8ja8Da0BI
X-Gm-Gg: AYBFou0KvkxHhiH95Wfktlcrb2W/AzW5Ikc4CnW64KjTKxz5IlPl0jYl3S702ElCHO+
	ckU5GTa73kDnhwb95NI9LyiFUNWt4vbNqeMhznCdv5wPEddEHwmGXHwIR8ucsjV/BBStgF6Vv/o
	KofhyqWF6YxxQLAzWA6LrxEhpVJV1sNqU4MDbEoLdlPL8BCcYFXM3RS9ljWgV9HrE3yQ97SCgMj
	QgZyJ6pyly7hjNRh07n6WhD1/EYsKKInizyd800ddpOtuBwhrtyA0xB00FlI2c0RH6MoxCJH4O4
	hqLppWUzlx9nzi/A+zhpPV/WeDgKD1rxwwaU0xgt04MsOH7QXOdoHqypv4m+j172yO4SGGanb4q
	TomMHl0XpV3F/ewzqJSl/VFeKMqwf8ogQ6Lijbv+V2UQbgfJkB9SO0tCciDClHfvsj5s2HmyPRA
	PJaBayZcxubSPHodSoOsRNyvmagLUHyYjbZVykG787RVg8cxHAJWQ/ri51cJM10wR/6ttuKNjMe
	HlFXGpoidCDXK1WoT9OM1+wQwnLE+Aiyt+CKUUaNDFi0GVeVPW/1AP03QdNBKvvdGCOEt82bEfS
	E5e8mKe1u5nE4usWVTOtF7zdrfik+uiB9vWqoJslLZpepXPUehWcGTjyQJrIIjXZURdsL4f24eJ
	1fPXsHttepG2zgnOEg8DXvrhA+oIviq4SSHJ5LDPefE/HiCcnNLbowe94s3X9FLTD7Q==
X-Received: by 2002:a05:600c:4f89:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4b963c97d7cmr60145445e9.26.1794202168374;
        Sun, 08 Nov 2026 21:29:28 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f1117fasm127646105e9.13.2026.11.08.21.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:29:27 -0800 (PST)
Date: Mon, 9 Nov 2026 08:29:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [wsa:i2c/for-andi 13/16] drivers/i2c/busses/i2c-nomadik.c:737
 nmk_i2c_xfer() warn: pm_runtime_get_sync() also returns 1 on success
Message-ID: <202611081308.P8lYvNIg-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-andi
head:   f3adfdab5e653345b7a520776ef9c7885e87de92
commit: e3e199d44d27ceb2f4a104fff8330025823e9e85 [13/16] i2c: nomadik: handle pm_runtime errors
config: alpha-randconfig-2200-20261108 (https://download.01.org/0day-ci/archive/20261108/202611081308.P8lYvNIg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611081308.P8lYvNIg-lkp@intel.com/

New smatch warnings:
drivers/i2c/busses/i2c-nomadik.c:737 nmk_i2c_xfer() warn: pm_runtime_get_sync() also returns 1 on success

vim +737 drivers/i2c/busses/i2c-nomadik.c

3f9900f17cdb03 srinidhi kasagar         2010-02-01  730  static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
3f9900f17cdb03 srinidhi kasagar         2010-02-01  731  		struct i2c_msg msgs[], int num_msgs)
3f9900f17cdb03 srinidhi kasagar         2010-02-01  732  {
e3e199d44d27ce Dmitry Guzman            2026-11-03  733  	int status, i;
ae9977eefc4a1e Théo Lebrun              2024-03-06  734  	struct nmk_i2c_dev *priv = i2c_get_adapdata(i2c_adap);
3f9900f17cdb03 srinidhi kasagar         2010-02-01  735  
e3e199d44d27ce Dmitry Guzman            2026-11-03  736  	status = pm_runtime_get_sync(&priv->adev->dev);
e3e199d44d27ce Dmitry Guzman            2026-11-03 @737  	if (status)
e3e199d44d27ce Dmitry Guzman            2026-11-03  738  		return status;

Use pm_runtime_resume_and_get() instead per the comments to
pm_runtime_get_sync().

a20d23945f30ec Jonas Aberg              2011-05-13  739  
3f9900f17cdb03 srinidhi kasagar         2010-02-01  740  	/* setup the i2c controller */
ae9977eefc4a1e Théo Lebrun              2024-03-06  741  	setup_i2c_controller(priv);
3f9900f17cdb03 srinidhi kasagar         2010-02-01  742  
3f9900f17cdb03 srinidhi kasagar         2010-02-01  743  	for (i = 0; i < num_msgs; i++) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

