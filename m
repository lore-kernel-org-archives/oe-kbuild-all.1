Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AAA2D948A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769764391; cv=none; b=rws+nV3xlGXFsK9OSqMR8FC5qLawoQ4RcYDw1oCp6PWccJgBHUfzeUXootOQBDsxExCrrGNmCZX0Lg//guSxidP/0A6BJwHxRrr/boPDE7YYWpn9ykgveFydJdf9MJmxzdQdJa7mhS4zjAdgPFSFDpyMj2amixdC9wn3iTi0bj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769764391; c=relaxed/simple;
	bh=t8UYww+TDiGcHieMgXdolrfxPtPok197UtAdeEyMnlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdoJKYimf9iVfYzLIzPm/umfg/BQbdl/D54JimIM0Jd3YgQ49rYb4hnHBsmCD8oaHsOr/wN00sInR9lk+7NfuC8Bx6Z2067GfyBYqi4QOba/UphrGpSa9sTglVdl075oZDGuyNAkHXbMB4DsZo5fIq4oWLcvrUXa6ppN0uJ+HA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aA4ncO4U; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aA4ncO4U"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4359a316d89so1495909f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 01:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769764388; x=1770369188; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PaTB+iouQq5ulcy+7adL4mJjTEinFro96cQPMg4Cjk=;
        b=aA4ncO4U4gAqMoFCmH/55fmswx7Ck/nX9Kqlqx+O5EegMz1sg5ZdeIrkNxrDJcsj0+
         NMyFj9Ir/rVNU2bmdrNsKzkRx+KwjvSquxbHBbJHRJXC8jhet6i4lkzIjbwtiK1XqWew
         BCEJWSssDnz3oBivyPCtmMgzxY2i6bemY/nC+i3QSI/tNYtPyho7MjTh/C8zVxnGMZ0a
         JvKRC8fkGjd6NlkWC2ro9JpzFuRrCzKSxCfPUoYKDJn8o9Dd0Xggn8SyZyEsPchgPLCS
         M3RNKxZuVFU215En/eycEYSWd3SqPBwiFSm6KmIpqBBaOxpLGsdGi1Et8cDuOhATeRph
         WFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769764388; x=1770369188;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PaTB+iouQq5ulcy+7adL4mJjTEinFro96cQPMg4Cjk=;
        b=tfwy7i/sBvCgTpuNmWjdjumRqESwynxslMMGy79sFpWdfDHQ+CQAmZdxyEMfL3/K5A
         axO1i8mYqOqKvtuqyLT8pa43vcYS5wis/u2IeTqyczRtf3iRkQOE2bTXsmDS0ATZohbI
         m5Adzx6QHBbSta3BLbRsTPoOqtx4DaeniXRIqrQikCgTZ7fyW/YUjEzMwIytk4ZusD8H
         vNADzyxVwZzhboSeILBIOacP3aCejPusEhVf28XAoanEX4pEkRBL8TcA1iTUP6ZNZdob
         YVBgMA4+56B63IPUnuanbsb2TiaJbZTSCwlFzqq4PjqRlbHqjzboob2pK4THpOZG2mlU
         mTCg==
X-Forwarded-Encrypted: i=1; AJvYcCWcnCqiWvOlnYUV1PlZFb2BrTeranakPmHBODw7oGEfATyQlbi1IyKeLBGg3A2SV76u3SU1I6TXoed1Aehf@lists.linux.dev
X-Gm-Message-State: AOJu0YwNV05fCyID9daKdwmBM9Cu1uMJj4qvtWsWZRUY3XZmEiD3D+YD
	plHh48XZhv+T0m/FSz1lGDj9rgeQu3Z6NXRRih9X44H/LnEuLmh2z2LM3ExWJIAiTGA=
X-Gm-Gg: AZuq6aJiwKqFEQ8HgQqKJsujAFTDOPrs3nJntxkSl8gMj2JkfHiSKT9I+1+C4lGI/D/
	KwonhAZ9oy5un/hcpHzzt/mG0dBNnikv70Ni1s+8n35YOHwGaSCO+IuFhQIHJNcAF1hbmN0R5D8
	uaeZ3aUPIVD0/W+jE6+MNrxzlbUPX6etPH5otj4ljsv78BEC9z/1kYFzgJ9mqA5Da3GN/DvnrbJ
	nk/LWvO2aJ1qHpxaaewkXIakao93LnsNpNUFaCN5DfI9tL9SczpoTfvFUocWbpDMdRILUyQKsM5
	xGnANMzgUIErpvjbFzgAaMsGYPYr4o0/MXKjhf37bawX3sv0lpQ0G8kiKYWhxuTmQ9PhwHOLwrH
	sqQcjvijfMNp7vrAtyuG2zpiNtUHpJ/k683REf/GJ6S/OWIV0fr468qedzAdBhlTESGyBTX2EkZ
	FoBK3RQgkQwmmQdrnm
X-Received: by 2002:a05:6000:4023:b0:435:dd87:fc2d with SMTP id ffacd0b85a97d-435f3aac80dmr3152582f8f.45.1769764388409;
        Fri, 30 Jan 2026 01:13:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ed952sm21007737f8f.10.2026.01.30.01.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 01:13:07 -0800 (PST)
Date: Fri, 30 Jan 2026 12:13:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Helge Deller <deller@gmx.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9772/10718] arch/parisc/kernel/drivers.c:928
 qemu_header() error: strcpy() 'boot_cpu_data.pdc.sys_model_name' too large
 for 'name_mpe' (81 vs 64)
Message-ID: <202601300419.4aPdW3N6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33a647c659ffa5bdb94abc345c8c86768ff96215
commit: fd4444b2c07a64576d4bf10f7c58d79882ef3ab8 [9772/10718] parisc: Export model name for MPE/ix
config: parisc-randconfig-r071-20260130 (https://download.01.org/0day-ci/archive/20260130/202601300419.4aPdW3N6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601300419.4aPdW3N6-lkp@intel.com/

smatch warnings:
arch/parisc/kernel/drivers.c:928 qemu_header() error: strcpy() 'boot_cpu_data.pdc.sys_model_name' too large for 'name_mpe' (81 vs 64)

vim +928 arch/parisc/kernel/drivers.c

a77ab0e7ce232a Helge Deller   2018-03-25  915  static __init void qemu_header(void)
a77ab0e7ce232a Helge Deller   2018-03-25  916  {
a77ab0e7ce232a Helge Deller   2018-03-25  917  	int num;
a77ab0e7ce232a Helge Deller   2018-03-25  918  	unsigned long *p;
fd4444b2c07a64 Helge Deller   2026-01-28  919  	char name_mpe[64];
a77ab0e7ce232a Helge Deller   2018-03-25  920  
a77ab0e7ce232a Helge Deller   2018-03-25  921  	pr_info("--- cut here ---\n");
a77ab0e7ce232a Helge Deller   2018-03-25  922  	pr_info("/* AUTO-GENERATED HEADER FILE FOR SEABIOS FIRMWARE */\n");
a77ab0e7ce232a Helge Deller   2018-03-25  923  	pr_cont("/* generated with Linux kernel */\n");
a77ab0e7ce232a Helge Deller   2018-03-25  924  	pr_cont("/* search for PARISC_QEMU_MACHINE_HEADER in Linux */\n\n");
a77ab0e7ce232a Helge Deller   2018-03-25  925  
fd4444b2c07a64 Helge Deller   2026-01-28  926  	pr_info("#define PARISC_MODEL     \"%s\"\n",
a77ab0e7ce232a Helge Deller   2018-03-25  927  			boot_cpu_data.pdc.sys_model_name);
fd4444b2c07a64 Helge Deller   2026-01-28 @928  	strcpy(name_mpe, boot_cpu_data.pdc.sys_model_name);

source array bigger than the dest.

fd4444b2c07a64 Helge Deller   2026-01-28  929          pdc_model_sysmodel(OS_ID_MPEXL, name_mpe);
fd4444b2c07a64 Helge Deller   2026-01-28  930  	pr_info("#define PARISC_MODEL_MPE \"%s\"\n\n",name_mpe);
a77ab0e7ce232a Helge Deller   2018-03-25  931  
b137b9d60b8add Helge Deller   2023-08-31  932  	#define p ((unsigned long *)&boot_cpu_data.pdc.model)
a77ab0e7ce232a Helge Deller   2018-03-25  933  	pr_info("#define PARISC_PDC_MODEL 0x%lx, 0x%lx, 0x%lx, "
b63b4f1a79e6ad Helge Deller   2023-10-23  934  		"0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx\n\n",
b63b4f1a79e6ad Helge Deller   2023-10-23  935  		p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9]);
a77ab0e7ce232a Helge Deller   2018-03-25  936  	#undef p
a77ab0e7ce232a Helge Deller   2018-03-25  937  
a77ab0e7ce232a Helge Deller   2018-03-25  938  	pr_info("#define PARISC_PDC_VERSION 0x%04lx\n\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

