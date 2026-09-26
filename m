Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBBD3630BF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790411515; cv=none; b=ILh2B7HRoZpjXtnCGcwvWwwkMEv8T78FNd6vn5Kxzw9eyJUxFMIeNf3SUfaSALFqfyagyci6gV8Y21bv0/dgBo5Gc34XVfVnJiNGAXyxVlXshplpcqgM9g71xPWySyQJbNCrdyx+vT9JZRvJ54wKBlMntpN8ZxXcffCn7g4LcNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790411515; c=relaxed/simple;
	bh=NiEos67o1uV/oekg83nF62AWMR/EP7PlYL9a/WOwnWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CADx0Q1VgcB8zR8y1V6vLDc/0ymOk5ssZ+yXepxWPs6rbq2VQ2Ka4Fk5JHUK/fJqQfiURizbrmad+L3gdtd5lOjTP5x/plNqtouuxZt8xHCwMiFcOOQhiIoSFQ7+YqRQJCdQZZfFcwU6OqDr+PgzswCtnwEdLKLFhmb5IjA+t+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OX7R2nAn; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OX7R2nAn"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so17706615e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 01:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790411512; x=1791016312; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V1uNkkv6u3fjmZgc8we/Y10DE/uAYX60y02iebyfGzU=;
        b=OX7R2nAnac6oLiDOKyv3qEqJVYtRdmJ4kOVQUrHu/SVsDSDjbNO8FB/v39F6eToLXU
         HUpkv8uXCSaG0y9oyhZsMypm1p6N7Te0yzR64YJkxp4fV5hW26DeP9J4kziPhes48Ea9
         dL539pkOvl5slJjqkL1010H9JGD/ePr5VoegAXTxFn7p0S4CWcsg1W7aEiu9HGD1xHXQ
         yseNsGjmkQd7BdRPgFNpRcFNnKYs11OwzC8yzMTbPdW9wSiqr3N5g4NENbSr1jK2nFF5
         +KqNI31WsbcAXDcfojLVS4CxubMqIYDIK835NuB1AlQ1VSvJ/HmX/GYWH2oIQwcJj9Du
         NySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790411512; x=1791016312;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V1uNkkv6u3fjmZgc8we/Y10DE/uAYX60y02iebyfGzU=;
        b=xnG8w4KZRVzTXA/CHoS3ebQfePKJtaT9nw7MbMshd8CzjV8Z62qjLzo+32onvSVu7i
         mVM1LWfS8RKEcUMXPo/VvnXsW7iRUd3n9JtsUaNPqTTffRoaeQR5DxJI+8kkMG4K97xT
         12MMKyxbQfpchcKKhnDnIw6RTAcQZF8eiXT/FlI7zEndPVeZmTM6875YemLwNPqWxhko
         W9l2IdSHFiY3Hr5au3xquQYu2UtCaPPRUDlTk2h3UchVdBA3KnIkyp8Vei8fn7dUBS4z
         s9frtkopY15Ncb+kSjUZeK/LrGxJ/BDW/jQs76NiBtXwrTVFgr+AK2V9c1LB46yeRhm7
         jspg==
X-Forwarded-Encrypted: i=1; AKwUvBwOs32L6WZL8vg4kLPFc0V41eWhH9lP+oaP5pvJY9clVEhDFpiEXzk2XyJrXti7d5Dpa/dwbxK4AtA6Ftr6@lists.linux.dev
X-Gm-Message-State: AFuF++lLBwB1NyAYlDuBrNEKqOa7H4Di+4KFHaUHHisq1UZrU/EID29x
	drUHzuP1CU5YrtAOv3zMhMs2rC9pBHLSw7KUVdqhw5nBJ29sHOkAuiGE+vAu9j+7alrdnQ==
X-Gm-Gg: AYBFou0/YgkxOhwM5L5jm4XOs13uES9Eb7R7FFP8jWJmvchnXzp4C0fTBP6kbmMrWta
	9u6MSNR5D/urqHD8/0yXsOQ0d3TV12X1loy5kqDtcSgc3pZvF7jU/uVtqiZAbP0mqbZ0okk4fBW
	M6VcI9CPLN9yoc1G23RdJp+oMca164QlB6mja0wLvRhOu9syCceByUNSFGr1Bnko/TmEeI16Tm9
	gT3LJ0UoZFbHiHfUx8V0NROKfahqy6RklooG273Ac6SHLRMvoW2VH/BpsKp0s2wBECzqg1l7Zfk
	6IzeDFeXOKjtPJo5qlDI9SEQrcr1Oeh54G8mV3Pqqs1s9FPmf54/G0wraasUl0W42+Cy0FP2c37
	5yB2ZJPZzM3RCSA08SdSPZZnk9LQeS/gYZR/1p4CSHNJUhLyFpjIbBx6zpBa9HkzNRWcZ7PjjlU
	aELvm9L6LnON69NDu6x+0B2O2zAyo4in3Vix3lwIFCM6JCSM8PZGFZYtNRlZ7hiQVECNE=
X-Received: by 2002:a05:600c:4e12:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fe66b6e0emr143497685e9.14.1790411511759;
        Sat, 26 Sep 2026 01:31:51 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdd58sm135523645e9.10.2026.09.26.01.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 01:31:51 -0700 (PDT)
Date: Sat, 26 Sep 2026 11:31:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 562/673]
 drivers/tty/serial/8250/8250_dw.c:591 dw8250_quirks() warn: if statement not
 indented
Message-ID: <202609260659.bEI1s3z6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 065c245ab6ac3537488e5c410d38d4768824dd07 [562/673] random hacks
config: i386-randconfig-2200-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260659.bEI1s3z6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609260659.bEI1s3z6-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/8250/8250_dw.c:591 dw8250_quirks() warn: if statement not indented
drivers/tty/serial/8250/8250_dw.c:686 dw8250_probe() warn: if statement not indented
drivers/tty/serial/8250/8250_of.c:181 of_platform_serial_setup() warn: if statement not indented

Old smatch warnings:
drivers/tty/serial/8250/8250_dw.c:592 dw8250_quirks() warn: if statement not indented
drivers/tty/serial/8250/8250_of.c:184 of_platform_serial_setup() warn: if statement not indented

vim +591 drivers/tty/serial/8250/8250_dw.c

0946efc2255fee drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2021-10-05  590  
4a218b277fdba3 drivers/tty/serial/8250/8250_dw.c Emil Renner Berthing 2022-04-22 @591  	if (quirks & DW_UART_QUIRK_ARMADA_38X)
4a218b277fdba3 drivers/tty/serial/8250/8250_dw.c Emil Renner Berthing 2022-04-22  592  	if (quirks & DW_UART_QUIRK_SKIP_SET_RATE)
aa63d786cea273 drivers/tty/serial/8250/8250_dw.c Phil Edworthy        2022-04-22  593  	if (quirks & DW_UART_QUIRK_IS_DMA_FC) {
                                                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

aa63d786cea273 drivers/tty/serial/8250/8250_dw.c Phil Edworthy        2022-04-22  594  		data->data.dma.txconf.device_fc = 1;
aa63d786cea273 drivers/tty/serial/8250/8250_dw.c Phil Edworthy        2022-04-22  595  		data->data.dma.rxconf.device_fc = 1;
aa63d786cea273 drivers/tty/serial/8250/8250_dw.c Phil Edworthy        2022-04-22  596  		data->data.dma.prepare_tx_dma = dw8250_prepare_tx_dma;
aa63d786cea273 drivers/tty/serial/8250/8250_dw.c Phil Edworthy        2022-04-22  597  		data->data.dma.prepare_rx_dma = dw8250_prepare_rx_dma;
aa63d786cea273 drivers/tty/serial/8250/8250_dw.c Phil Edworthy        2022-04-22  598  	}
173b097dcc8d74 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-03-06  599  	if (quirks & DW_UART_QUIRK_APMC0D08) {
c73942e22aa4a3 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-09-21  600  		data->uart_16550_compatible = true;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

