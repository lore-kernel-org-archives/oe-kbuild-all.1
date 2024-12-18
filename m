Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C814028EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508927; cv=none; b=SLbXfEymAYbC9JWqIlf9xwSftTlV68VT/N+lApPKfipoDNyVxarEuNk9jrv3ujjdlVwIVgwoJK/YOvOiv2R2SnFNLlEMxpNkuSR7lLgAAiufIEEPD4eBTo/hVj4GK/u1FhiGIZ7lYiv4797Rn8egG56HgH/TtrIwZ+ITKqOvKYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508927; c=relaxed/simple;
	bh=UMuxXBmpsmHCO/vhUXdMl2WDhPOEyrJBHIe1MSZHQVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Onia6HC6LXG57lcwoS39WJvTR/J7H30BW4PFuGqHcTQUaKC3YwvSw1L3qamQCyPBoyihvu12K6Iy4H2JwDKhxNsk/nLhjJ2JBYlE8HyD6NrXvilzm4tNAZ+QPQzjN6QwD9KE0PbAjpmJ9l0WjPvlrxXoZiLhGqVgLr63nkmIeDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XzHmTN7V; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XzHmTN7V"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so1016004766b.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 00:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734508924; x=1735113724; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KlEFEHh3YGobOCHNpL8Xt4rpq8d3KttiitiL/5xBwUY=;
        b=XzHmTN7VHpHKA8sPMP92yqukMjkjtRk9Mla/i8zRxd20gpbk2Qy5IVfrHDcnscdsWa
         FIZ36s7iY+e45iyRh8mzdJ4PBcQvMiyxGFeArFb2XQKk4l0KksiK+wx/tIz7Uw6qy45q
         lG6czn9VNw2iihvZUA9wvdx+M9g3ZpYVU1WYH0TAWuxeub5WRGNbFaOto+cXCB0yA8nN
         bUM/DYn0SJUwxIyOCAyK73iohoJdJ+kKKtD3ZE5hwcltF+UiU0zQqwFR26Ms24ZLXe42
         +00ImrXofTpcCQzo9/Xi+k1+XRoErMy/EvsoA2SycDrbdSzYOFbNSNVkyyS25D66pfwi
         4x/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734508924; x=1735113724;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KlEFEHh3YGobOCHNpL8Xt4rpq8d3KttiitiL/5xBwUY=;
        b=o3IkLGCrszyiR9GsD3ThHxrgyMsQyZYyHr5fjaYONtlJpMt+OYyVaDePxnPvNAxWN4
         Sl4QzhlmMnP1aForyudg0MkWoQctJaPzWeuz5FCgS3NLhgmq+LdoUfv6m0YKMRBcQpEP
         pvIld8Z3frOGcSW4ws0KQL+xkv89hG+3QZynOKc/7wr2O06nDRqjypWI/MNvHgnfaucm
         ncnWtUEVondfWCge2F3f2Ex17ZfaETtbatsvu77wnvSJTClkYWzefkggra+Zs9GVjmkx
         tAAa8D7r/h7M+2OqNXnX+fDdQM0K0bPIqiQfTYHiZ6KkmzymIRy3T3fse4feGPS6sVhm
         vtEA==
X-Forwarded-Encrypted: i=1; AJvYcCVL5JNhP0QqIKKytXV/TFMNWfvc+M9fFUfeHdTv2siFSsP1o4JVczIKmWI1zakWXgsqF6R8gqwCf23z9BxV@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1sBg3KTu2jWFO0TdcPpYW/nIVYLGTAo9ctH9+M6eG7WeRMLP/
	Q04s2dorOFO5WXHfSlS6un8WqTVedswgLemmTnqqllPaZC0Pq1zFYT1yE0EshoS60PqRQ6jT4P2
	Y
X-Gm-Gg: ASbGncuh9j0eAGwuFVpIPr72noRLNRS7eS1839EIZbPysNIf6/cpjQNe/sLhzRzR38v
	FywXuqwNYzEfr7/Azic0BHH58kTQXOCY9jg98C8i/g9BZqmmE6LwdlyP7pS4n6NnNiAPpGYBl2t
	LE+18cpDT7KjxyJ8XzotbSmjrrkRc5Hea5YV12VyvxHL/lGmgaX7pAoMTOSsbe5U1LRJb1uon7k
	+ULIACB5ZpFuURxMAgfh2tf6c3JjSSmZBoPRRrRJDsruxLW+j/E4HefDCu0xQ==
X-Google-Smtp-Source: AGHT+IGgllR7abPnG5mVYBFTJjRB4aIBzW/PpB078TBiUQ+5WwP9gxkjuuruJnm0noAZzca8eFWcGQ==
X-Received: by 2002:a17:907:2d26:b0:aa6:834b:d138 with SMTP id a640c23a62f3a-aabf476eb86mr131377466b.19.1734508924075;
        Wed, 18 Dec 2024 00:02:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96087424sm523896166b.83.2024.12.18.00.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 00:02:03 -0800 (PST)
Date: Wed, 18 Dec 2024 11:02:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	LeoLiu-oc <leoliu-oc@zhaoxin.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1640/1640] drivers/ata/ahci_zhaoxin_sgpio.c:36
 ahci_wait_em_reset() warn: variable dereferenced before check
 'sgpio_zhaoxin' (see line 33)
Message-ID: <ba9f75b1-9d49-45f8-83b3-e75f45524689@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   46064348cc445799cf9e8fd030323a0426fbb5e4
commit: fb43492008c11fe89e510dd63383a2d37ea3cf8e [1640/1640] ata: ahci: Add support for AHCI SGPIO Enclosure Management
config: x86_64-randconfig-161-20241217 (https://download.01.org/0day-ci/archive/20241218/202412180610.tvT1b9wN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412180610.tvT1b9wN-lkp@intel.com/

smatch warnings:
drivers/ata/ahci_zhaoxin_sgpio.c:36 ahci_wait_em_reset() warn: variable dereferenced before check 'sgpio_zhaoxin' (see line 33)
drivers/ata/ahci_zhaoxin_sgpio.c:335 ahci_transmit_sgpio_indicator_gp() warn: inconsistent returns '&sgpio_zhaoxin->wr_lock'.

vim +/sgpio_zhaoxin +36 drivers/ata/ahci_zhaoxin_sgpio.c

fb43492008c11f leoliu-oc 2024-06-18  31  int ahci_wait_em_reset(struct sgpio_zhaoxin *sgpio_zhaoxin, u32 retry)
fb43492008c11f leoliu-oc 2024-06-18  32  {
fb43492008c11f leoliu-oc 2024-06-18 @33  	void __iomem *mmio = sgpio_zhaoxin->mmio;
                                                                     ^^^^^^^^^^^^^^^
Dereferenced

fb43492008c11f leoliu-oc 2024-06-18  34  	u32 em_ctl;
fb43492008c11f leoliu-oc 2024-06-18  35  
fb43492008c11f leoliu-oc 2024-06-18 @36  	if (!sgpio_zhaoxin || retry == 0) {
                                                     ^^^^^^^^^^^^^
Checked too late

fb43492008c11f leoliu-oc 2024-06-18  37  		pr_err("In ahci wait em reset, invalid param\n");
fb43492008c11f leoliu-oc 2024-06-18  38  		return -EINVAL;
fb43492008c11f leoliu-oc 2024-06-18  39  	}
fb43492008c11f leoliu-oc 2024-06-18  40  
fb43492008c11f leoliu-oc 2024-06-18  41  	while (retry--) { /*EM_CTL needs reset at least 64ms*/
fb43492008c11f leoliu-oc 2024-06-18  42  		em_ctl = readl(mmio + HOST_EM_CTL);
fb43492008c11f leoliu-oc 2024-06-18  43  		if (em_ctl & EM_CTL_RST)
fb43492008c11f leoliu-oc 2024-06-18  44  			usleep_range(10000, 20000); /*EM_CTL still in reset, usleep 10ms*/
fb43492008c11f leoliu-oc 2024-06-18  45  		else
fb43492008c11f leoliu-oc 2024-06-18  46  			break;
fb43492008c11f leoliu-oc 2024-06-18  47  
fb43492008c11f leoliu-oc 2024-06-18  48  		if (!retry)
fb43492008c11f leoliu-oc 2024-06-18  49  			pr_err("Wait for EM_CTL reset, time out\n");
fb43492008c11f leoliu-oc 2024-06-18  50  	}
fb43492008c11f leoliu-oc 2024-06-18  51  
fb43492008c11f leoliu-oc 2024-06-18  52  	return 0;
fb43492008c11f leoliu-oc 2024-06-18  53  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

