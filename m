Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1D43146
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732982502; cv=none; b=CHbXTN0gRsKvRe0c581KQ75dzOZvyARbs7y4zk1PvlDqB3sAi+nFJTvfpsOY9pY28ST+ZXzlK25ChIDfMEa2DrcnGp6mE/MQVTJTPbawxN3tB/KhXe43QGO+BZyWX8AvJqHBJhARcsWjgTpDioz1Zj/gtMoEFxNhtKUUtuOPQBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732982502; c=relaxed/simple;
	bh=8PQ17UtHKWEWFc8bUqxcYRYZlrzIaoJKvd4SBh+fboA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LNvqCnSoG8iwvU0rRyrGZy6P6t9ObkloMCjbECNskz42G35Hl3Y92ySUbY93KrlGvgIHJhNU3OLyn7oXq7fOlY7wPT/zNvK3UEYIjc0a3f4a5iA7kLCFSoMq/vCC8OLVPzeM/guRfgdY2mBcWdWldcY0CxK510PdcbCVH9IFmmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vr315uNS; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vr315uNS"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cfddb70965so3399155a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 08:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732982499; x=1733587299; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LcX4f2MqHn8HzczBZ5vJerxCPkOipukcFDGbVXHsyGE=;
        b=vr315uNSLIQ28liYaAxc25kPLxkLcUUdB+xqSqOgevkSV4l/lvoXWyfl0Yq9s21qYI
         ddM1j89RUDjHrTNGnZqCejkE5fkM0XOna8CtS4Dm6a2fTnNLYzPRUOEQ/NnatrxTTV5/
         Vaaz93mb6qsTy/DrYfZdIbSqmd1+qTnpOFmQJPQZR8JMWuvjHOybr0xKfiiqi1HaqTAC
         1+giQMl/BXAFzSA/f8F6tGEWoCF/nMWLtkRx1AzemeT/7jM/Dnb1N8lxZwyRHa+rSfOW
         lnGGxTfehosP+zV+vFR2sZJhXjjOv73uQ7GzmdnkPPmMLNxDE4jkBe5ncAWw8FfstRuB
         N94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732982499; x=1733587299;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcX4f2MqHn8HzczBZ5vJerxCPkOipukcFDGbVXHsyGE=;
        b=vOrZhixeAmXzRZI3dd/H5GtYgraipqn8QuhCPvHyBg31lXUTxliYNeia2BjBo2Ipzo
         tWBucb0CnIckBAkmj+yJs551UtVLFfpgaRXwRMzk2PqOl71cjdna7xJ6yR62mO2UmX6V
         cLfMvjrNeRVW1CLOMOoKzjY03uuvUYLbOW7MuFzD6MTOyhqLcSk0EEr+BzibEyTaF2vQ
         /W8v4YJZuEPlTw3Ifen9e7Zu/YF92BiLysCm09/TIs6/n8WvEVvA4B8UtHjJ8vdGmCzm
         ZF84upx4NesORsETiCLDCIwBsAUysygI9IF3WmMhK3+bQH8SfuRaExgl8qqxzmRqLsub
         n6Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXpl3J6AkuQVO6lilGYRvHzIj95MMuYhKlSOPFef99E0DwKc5nAsAREHpJqbLJrcGI5FqpXrpenVGo7TLwV@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh+xc7/b0Q2+9xxVmLkXMM6TfW9zY3XJ/p3nf2lPNBHg3/6z1G
	wCipfnOkJmlQyWigoCsH0dw0YlaDc9sTQ1LJDq0+x4iZlkE1+xoevymnojH6yiQ=
X-Gm-Gg: ASbGncsyMAjls1yPxdoEprjw2VINLALwsal7pSzZhqwKI3wM6PNp2HNd8wQpOF5aezE
	jiP9UcOiTLKsp0FdGHh86mVUgaRybEP9S/n97GgJPaqszj6Q6xsy+mYOK3QdYr29e2U9TdOTWhk
	DuyIuG30UsX7Yzv8ZgSBdZvFlp9MJ8jzTkf+DMDEyNKTNLxdhzc+YH3+pzFx6l9a47dKMIW7Z4z
	+XsDRtb7VO5W2wu3BWK1O+aFUncCPEev0ztPEOD7+1ux54BfoSClPEnSOZJiqwD4zW00zof
X-Google-Smtp-Source: AGHT+IG6IKVMxCoqilw91nUdTOtT6PRScXP1YSV7J8UmVDlgsGAp6lswVKcs9LxQNnoyLJYl0yidKg==
X-Received: by 2002:a05:6402:2354:b0:5cf:d5ad:2809 with SMTP id 4fb4d7f45d1cf-5d080c47a10mr13715822a12.24.1732982499332;
        Sat, 30 Nov 2024 08:01:39 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0bf49f159sm1320085a12.0.2024.11.30.08.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 08:01:38 -0800 (PST)
Date: Sat, 30 Nov 2024 19:01:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [linux-next:master 11908/12916] drivers/i2c/busses/i2c-xiic.c:932
 xiic_recv_atomic() warn: variable dereferenced before check 'i2c->rx_msg'
 (see line 930)
Message-ID: <37f714bf-bd1a-4a97-9881-1d1ed2cbb20c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f3d2b5299b0a8bcb8a9405a8d3fceb24f79c4f0
commit: 8bba86687c0b6a22f05ed4a7398c519d3796bc74 [11908/12916] i2c: xiic: Add atomic transfer support
config: i386-randconfig-141-20241121 (https://download.01.org/0day-ci/archive/20241128/202411281318.Ami4hwE8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411281318.Ami4hwE8-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-xiic.c:932 xiic_recv_atomic() warn: variable dereferenced before check 'i2c->rx_msg' (see line 930)

vim +932 drivers/i2c/busses/i2c-xiic.c

8bba86687c0b6a Manikanta Guntupalli 2024-10-11  928  static void xiic_recv_atomic(struct xiic_i2c *i2c)
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  929  {
8bba86687c0b6a Manikanta Guntupalli 2024-10-11 @930  	while (xiic_rx_space(i2c)) {
                                                                             ^^^
The xiic_rx_space() macro dereferences i2c->rx_msg.

8bba86687c0b6a Manikanta Guntupalli 2024-10-11  931  		if (xiic_getreg32(i2c, XIIC_IISR_OFFSET) & XIIC_INTR_RX_FULL_MASK) {
8bba86687c0b6a Manikanta Guntupalli 2024-10-11 @932  			if (!i2c->rx_msg) {
                                                                            ^^^^^^^^^^^^
Inconsistent NULL check.

8bba86687c0b6a Manikanta Guntupalli 2024-10-11  933  				xiic_clear_rx_fifo(i2c);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  934  				break;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  935  			}
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  936  			xiic_read_rx(i2c);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  937  
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  938  			/* Clear Rx full and Tx error interrupts. */
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  939  			xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  940  					XIIC_INTR_TX_ERROR_MASK);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  941  		}
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  942  		if (xiic_error_check(i2c))
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  943  			return;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  944  	}
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  945  
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  946  	i2c->rx_msg = NULL;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  947  	xiic_irq_clr_en(i2c, XIIC_INTR_TX_ERROR_MASK);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  948  
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  949  	/* send next message if this wasn't the last. */
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  950  	if (i2c->nmsgs > 1) {
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  951  		i2c->nmsgs--;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  952  		i2c->tx_msg++;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  953  		__xiic_start_xfer(i2c);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  954  	}
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  955  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

