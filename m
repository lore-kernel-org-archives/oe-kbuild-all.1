Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE891A267
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 08:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790411446; cv=none; b=Agtm8/ep6Dy3BLOAUbJAQdlE+rVrLGRN5ujllhCmcCtOI/nSPu+Iic9clcguZAb+GDP7TdWtj+yzX6ZIZ2dqUfpauWCrz7O3D78+Quv+uCe7MKt/jkr1m9jIXkSDaqLgFw74szprOyjf4aSghhleFUe4Emj68WwOVAB91EDXEic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790411446; c=relaxed/simple;
	bh=wFUyTKcSxGf8hCqFkGzXTX4w8nNQraXMVczer2UfiF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DLUa1mh2MzDDrkTlTczoCabvq68IMt40vlbdQP8lwoyWHMJJJN9K1BnyYoV7MfCG6UN3ccFNw/zXcFevs8fXQmhG36qRYMPpHQuog73h0YbkjJn0mzfn68a8ROfVN6hgZO9FhAhSOgWPj7XqWgqQrtM85N4aX++H1vA5Txx32PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X15qDuhW; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X15qDuhW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so973913f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 01:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790411444; x=1791016244; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgepCkWhzrCUbBePrewWkZkNqMvah0hcnaeJktodMBg=;
        b=X15qDuhWpUxzgjqcslQTAH2fh4tQRcuSrZzf020zZ2C82qF5digG+rhsTw70uiiXJg
         DYlPGbH3F6pWuiyq4jNwf0V3+fBfJ3cB2F56j07iBjVyAnfpG1aAtitOxRJbrnUnycN/
         RjcZTxSZgSopY48zygUrRxoey2IivxDCASGRL5NfyU+t7YGDoPU0A+H5LT95dBSm+Xug
         3giGYtE5wbOIPa8M7Wamc6Z0ZKCpuOw0wNNy2uzdSNuV/snTlrzvaom85Jrww6AOewXM
         3k8CBqnmTPXsvLRkZHwUMfbjrwWvkjiqgwqw7OQ1+VfeDSak1IYo1gIviRc+/iCz3W/7
         KQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790411444; x=1791016244;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgepCkWhzrCUbBePrewWkZkNqMvah0hcnaeJktodMBg=;
        b=To4KJ3XVr2eNmI+y79PKJeWGSKY/Abi4DmAFBmoQiwsuHY6SHClACnRTvpp8QxO+tn
         8DARHtHeKabVOT+pzZ6Qu2jrUVEwx3uSFVa7prjpJVvGKXB9TG3VbgUp+EWO0hODQADG
         60IAWwSwNKqqN/0/CJ+xs/OWZGESEKJYIlJB2nzpDJKO7GBOhaFvocD7QxWd+UUk8RLr
         NP3XSMX9XXUnl7mkozOfRL69lK/wMcnPdWjhbbGnYTX359WaoEULV58AuDwUtVS4+7IO
         pkESboZGlAw+zgLxCCJpbxZiquY9BLkZzznhXk4UA0wH3Jq40GGNa3dYGbBBx1DxsSc2
         YFRg==
X-Forwarded-Encrypted: i=1; AKwUvBx9ydWU1qH3yODZQhQnDxZqscvsWRCSicC+okCIgFbL2Mj7yK/mPSTervgfk7GuX9bjtJd1fa1bcn2teJb6@lists.linux.dev
X-Gm-Message-State: AFuF++lKjeeq7xfQpYiwbeA6+AeomS/kCsFPJSPEMaHk+79yJKk8nbEi
	eEX1EAhKgUgwA6VM6XAPAS6qUrgT+Z1e6ux/dvIZd+/hpToe/eZBj3d7T7Ts97X9jWhzhw==
X-Gm-Gg: AYBFou0QhYTWVDI9bVMRkCBn0x8QR3JbBCSvDJzUJ1N9stJVqeMhsxr4V3j+okCJnCj
	HqagP11u+90fyXO/zI89D30Xy7BQXqMMNuprc+5Q20JwJSQL/P3evgmVO7YtONPx2TSDj/uBCf9
	QeXbZiiZh6Z5vZVZlq08jUVkAGvKfHxOXbDwrT9LvEu4alKa96ZBiD7ZjwNui9cUNbNx8quQIfX
	IOvS38KRs9G8dQsp8bHb701ACpKDO1A6CCkXaBjFdc95uPcKyVOjzleWNuB7Wjs8wBhgm/WlMy0
	yp6g0/voah+FelX8aTb55Hv2vB5LpJrjvq/J/KFSOfzFlQEwND0B/Z08ji6+llzO1vK5JMVSHzu
	vjxgduFbPqa+iUbzOF4wmccCSYtXuuCvk9RAwR6FomjxvtgsoGtkLWNs2yobxDirnrIp8N/iv16
	P7qgX7ljAi6who22jgyiWEPdduuqx62d5cmpJkrMJRs61feXgn4uoux18Eje9p2V/u84E=
X-Received: by 2002:a5d:59c4:0:b0:488:6da0:b83d with SMTP id ffacd0b85a97d-4887db39e6cmr9014448f8f.44.1790411443421;
        Sat, 26 Sep 2026 01:30:43 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm13289281f8f.3.2026.09.26.01.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 01:30:42 -0700 (PDT)
Date: Sat, 26 Sep 2026 11:30:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 539/673]
 drivers/tty/serial/serial_port.c:247 __uart_read_properties() warn: if
 statement not indented
Message-ID: <202609260413.K1JgJ8UK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: c859e8d1c0dd5308ff6e4ab5c280b589a191e1a4 [539/673] 8250: port settings
config: i386-randconfig-2200-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260413.K1JgJ8UK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609260413.K1JgJ8UK-lkp@intel.com/

smatch warnings:
drivers/tty/serial/serial_port.c:247 __uart_read_properties() warn: if statement not indented

vim +247 drivers/tty/serial/serial_port.c

e894b6005dce0e Andy Shevchenko 2024-03-04  239  	/* Check for shifted address mapping overflow */
e894b6005dce0e Andy Shevchenko 2024-03-04  240  	if (!use_defaults && port->mapsize < value) {
e894b6005dce0e Andy Shevchenko 2024-03-04  241  		dev_err(dev, "reg-offset %u exceeds region size %pa\n", value, &port->mapsize);
e894b6005dce0e Andy Shevchenko 2024-03-04  242  		return -EINVAL;
e894b6005dce0e Andy Shevchenko 2024-03-04  243  	}
e894b6005dce0e Andy Shevchenko 2024-03-04  244  
e894b6005dce0e Andy Shevchenko 2024-03-04  245  	/* Read optional FIFO size */
e894b6005dce0e Andy Shevchenko 2024-03-04  246  
e894b6005dce0e Andy Shevchenko 2024-03-04 @247  	if (device_property_read_bool(dev, "no-loopback-test"))

Stray if statement.

e894b6005dce0e Andy Shevchenko 2024-03-04  248  
e894b6005dce0e Andy Shevchenko 2024-03-04  249  	/* Get index of serial line, if found in DT aliases */
e894b6005dce0e Andy Shevchenko 2024-03-04  250  	ret = of_alias_get_id(dev_of_node(dev), "serial");
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  251  	if (ret >= 0) {
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  252  	}

Also clearly a draft...

e894b6005dce0e Andy Shevchenko 2024-03-04  253  
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  254  	if (dev_is_platform(dev)) {
e894b6005dce0e Andy Shevchenko 2024-03-04  255  		ret = platform_get_irq(to_platform_device(dev), 0);
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  256  	} else if (dev_is_pnp(dev)) {
18ba7f2d99f698 Guanbing Huang  2024-04-16  257  		ret = pnp_irq(to_pnp_dev(dev), 0);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

