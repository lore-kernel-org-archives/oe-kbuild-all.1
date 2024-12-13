Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C4418E054
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734120905; cv=none; b=cpSe768pXkd5o6BdohrfdRrjbKP+Gi6iwe3DwMiIOTZ1EQZptthtADcBz8O7XfUG8FSnXpcHbc8MX+e7BShw6uKwnXCBXobBuSG3ERPZxisiUYJRjk54RdWoU+PQYP8fvqPvqVFXWbyjTvFdiTnDxcFd9WY3WrbFzRX9YCgGALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734120905; c=relaxed/simple;
	bh=mVFNhNssm5GYbWmRNECdS3MApZkXPZWi+LvvIcMDYQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NDFJ21DCEHxKTWm6wR5SYBjsAOtOFZ899gN15KBRJ6vqeZXYqMPA/53Ob0vUk4I+fC9hcD9xQpoYqGYEpV8fiW1hz4KXWWjIZot6fxUnuElc8nyczH5b3M9IL+YPKGnfnX6dBnS4NwLaPGpTzp5fnXTy9v7L6kD7VFwW0UC1cWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SBOa2sCJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SBOa2sCJ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so877622a12.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 12:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734120901; x=1734725701; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbyeVTn0akQOWVmaHujDlsyrhHqpLk6KxXOvye9WaRs=;
        b=SBOa2sCJ1tH/n6MLoCidqpAKYgatZi4yzZTWsebtBOGBKJGOf7TUaR8DCDMbZ/povS
         ncGJf+kftlt39j4jynO3W/oPCqJIszoE27Ol8jnVJgL0mbqxweo/JvMGOcXlptmxL/yi
         DjafS9v1NbadeMNFn94y+zL43J1UhJjYMnvPhRArqK3lQxjYLHgQ6kb4wqccEAja+isA
         RIogFjCw395ki+UB4b6JIY40lbX+xBHhzeh2lxzWFkX6hKcvVeipntviHjz2STt1H6qp
         hDScgSPcju64baCprja9vwudkIT6KCxiVsW9dX+DpuCrgA+320TI+r0kPEptNEvz1Ye+
         7e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734120901; x=1734725701;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbyeVTn0akQOWVmaHujDlsyrhHqpLk6KxXOvye9WaRs=;
        b=a4mjiD5cIbylmmMSmPZ18pWKn0OUYU3JevNTk/1XvhGNV7hIkVOnZyeQu98r2e7Bt6
         sO6JdpDziWeEKGR6b0J+bFhsf2aobj+J/K6i5jMcbzQ96bv5lYS/C4UdhlCBqw5lKgl8
         t/j+4O55jY+dNtbRH6V9DgcfrkkwNodmCHUELAgOGGu9wCAP6Hh00S9p+FcKKmwfINKW
         7vv8OU2mGDBsWpgYNfTb+1dvalGEUcHtd7YKj5702lc+Wo2pk2dr1pg65vJgpNO6kCld
         0BP0yQTYh2BmewBe8sEIoil5QBhpOSQhf4twSguMEsFtMi6BCTtIRRJmLZZoP3ZoG9aO
         AaJw==
X-Forwarded-Encrypted: i=1; AJvYcCWeQKv6cTtW4pp8qlkpFwA5FxjBf/hY2Av8ygH9qY8Tvm7ezXTmVbuWaW3OZ8PoFkFmRde0/OI9+cZMGANM@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyv8epphrAmwaSHE/UGmNogodhnfBuTaQynB44pXM21xv6yUEf
	aZKIyFpBE8G6HnUW4PvHAm8PlD1Mt3wSEuWq6FYldbUkfEnILKEw5o1HabASmFiUpMPd+5v8VWq
	X
X-Gm-Gg: ASbGncuCDKjGU7Wxg17oMi+oPy+sm6wup5DmkQwTW1tf3VX5ouKks9rlZfvymzR0gcL
	IKsciMnehIgrMEnLafMV9Edvmx4wKx/Si6pQnW43fPf3OLt6OesriQzQTUDjEq1mnfeZyNwJHi3
	MleVZnkJQ+hTL0BEMFrcDfJTPHWOPupcqjnLKhngybUAsNhthJzujVEMXjE1jIXFUCCe3mVSt0N
	m059enc3sSs+la5FBSLL5yXwwF3VQUWW3i4UeYvfYzdLPkQ+JbowQe9ll7YhQ==
X-Google-Smtp-Source: AGHT+IGASeFnfwqt+fly8jRgLFop8gYvWkPu1Qr5DGjecdtgQkcPsBcE4VhsCfrWoKaLixITYBN7TA==
X-Received: by 2002:a05:6402:358d:b0:5d3:bc03:cb7a with SMTP id 4fb4d7f45d1cf-5d63c3b170dmr4011736a12.27.1734120901635;
        Fri, 13 Dec 2024 12:15:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ad1929sm178661a12.31.2024.12.13.12.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 12:15:01 -0800 (PST)
Date: Fri, 13 Dec 2024 23:14:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/power-supply-extensions 8/8]
 drivers/power/supply/power_supply_core.c:1409
 power_supply_unregister_extension() error: dereferencing freed memory 'reg'
 (line 1406)
Message-ID: <0a1e2e1f-8d3a-4a3b-b621-efa173f52089@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/power-supply-extensions
head:   e3b31151b3d4283ae04910bec3e7688b7a6bf375
commit: e3b31151b3d4283ae04910bec3e7688b7a6bf375 [8/8] power: supply: core: add UAPI to discover currently used extensions
config: x86_64-randconfig-161-20241213 (https://download.01.org/0day-ci/archive/20241213/202412132302.wpJdjWnk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412132302.wpJdjWnk-lkp@intel.com/

smatch warnings:
drivers/power/supply/power_supply_core.c:1409 power_supply_unregister_extension() error: dereferencing freed memory 'reg' (line 1406)

vim +/reg +1409 drivers/power/supply/power_supply_core.c

ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1397  void power_supply_unregister_extension(struct power_supply *psy, const struct power_supply_ext *ext)
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1398  {
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1399  	struct power_supply_ext_registration *reg;
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1400  
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1401  	guard(rwsem_write)(&psy->extensions_sem);
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1402  
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1403  	power_supply_for_each_extension(reg, psy) {
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1404  		if (reg->ext == ext) {
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1405  			list_del(&reg->list_head);
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02 @1406  			kfree(reg);
                                                                        ^^^^^^^^^^^
This needs to be done after

e3b31151b3d4283 Thomas Weiﬂschuh 2024-12-08  1407  			sysfs_remove_link_from_group(&psy->dev.kobj,
e3b31151b3d4283 Thomas Weiﬂschuh 2024-12-08  1408  						     power_supply_extension_group.name,
e3b31151b3d4283 Thomas Weiﬂschuh 2024-12-08 @1409  						     reg->ext->name);
                                                                                                     ^^^^^^^^
this dereference

ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1410  			power_supply_update_sysfs_and_hwmon(psy);
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1411  			return;
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1412  		}
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1413  	}
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1414  
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1415  	dev_warn(&psy->dev, "Trying to unregister invalid extension");
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1416  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

