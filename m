Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16B33BB48
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 01:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786326513; cv=none; b=bBBXsigsMlfPP4KaFyUR1Mv7Ar/06rC7zAn1tKiEHoGBRkS1tmxY8i7iAWSjZ0RoYq3pv1PrjF4ZAuU+xtG+pS3BAD8G0d4i0Q0S2PAnzXc9Tze+HzoRxhhXOOvtZLOEol4amqzUU9lNQ/s3Mm7HYkjJ+rLhDBXq1BnBbtvnP6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786326513; c=relaxed/simple;
	bh=nWSu+oYlcZacBI+C+gb/tv9A8NnsFFeZ/V8ddoPmX/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=trTeFGqI5qDVS0Y8u9XxHaU+i93E0eSFDQThEZBHg2ElxRGEXkuqfMYvItHiH2Spz8OzP/a98zDls4Pf4/2G5RavBaE4SDliTP+wpAos6e8kblEadoeCorOBw/YuM+ReDAQtaG2XmW5m2hbJgFDzMc4A637x4wh7yZJtNkAUhT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 919988da945d11f1aa26b74ffac11d73-20260810
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a8867c01-7a18-442d-a216-c5c43847a70a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:5ff63d3cb04113126e3f22e86d0c96f7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|850|865|898,TC:nil,C
	ontent:0|15|50,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 919988da945d11f1aa26b74ffac11d73-20260810
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1393007563; Mon, 10 Aug 2026 09:48:22 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: lkp@intel.com
Cc: 13667453960@163.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	yijiangshan@kylinos.cn
Subject: Re: Re: [PATCH] lkdtm/core: fix resource leaks on module init error path
Date: Mon, 10 Aug 2026 09:48:15 +0800
Message-Id: <20260810014815.76401-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202608051446.cKZTkVXV-lkp@intel.com>
References: <202608051446.cKZTkVXV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Thanks for the build test report and for catching these section mismatch
warnings:

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
> >> WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_module_init+0x1ec (section: .init.text) -> lkdtm_heap_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_module_init+0x1f0 (section: .init.text) -> lkdtm_heap_exit (section: .exit.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_module_init+0x1fc (section: .init.text) -> lkdtm_usercopy_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_module_init+0x200 (section: .init.text) -> lkdtm_usercopy_exit (section: .exit.text)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

These warnings have already been addressed in the v2 of this patch,
posted at:

https://lore.kernel.org/all/20260730154911.3164527-1-yijiangshan@kylinos.cn/

In v2, the error-handling path in lkdtm_module_init() no longer
references the .exit.text cleanup helpers (lkdtm_heap_exit,
lkdtm_usercopy_exit), which resolves the section mismatch reported
by modpost.

Since the fix is part of a new version of the same patch rather than a
separate commit, I haven't added the Reported-by / Closes tags to
that version. However, your report was very helpful in confirming the
issue — thank you again for the testing.

Best regards,
Jiangshan Yi
