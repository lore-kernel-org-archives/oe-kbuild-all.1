Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA8A3A1C9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 02:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785896884; cv=none; b=FeZTFrrGwd29gDlIe97vGhJF/98v4OhlIozMkMnRYS8fzGW343LYh07v7m0wqoe8QcmCrZBARtv9r6o/MM478KvMv8Id1en7Q+sp+ozSdSW2+lltap/fH51SfY5YNZXxtLG44Wijx+PXEJZBh/1LRnQq4G4eLr8cAICkCWHHcMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785896884; c=relaxed/simple;
	bh=tFmxLV8vlB+i2y3J7dYP/NGc6/SLjO6AnBeeS/cpDg4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H6LxGydLVcnkuP3yjAz7Zqcum+6cpsfOHMJfFsDbND+qN7sBuGVQV0ttRzg+xoChpgLrj7mrBn/4UKz1Yr8hmPFvd+OqDef4pVjwKuzMNuzTsjNprP6GCEkCY9GFuGPhHGYnaRmQW7C3XxYH+B7ZktGdWMvBho1lr/I+6+xbFw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 43a03232907511f1aa26b74ffac11d73-20260805
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:774fa5ad-f4a0-4fe6-8cd6-e309d1ab0a04,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:137d8ac4f0e2bc96c200d4d995fbbaf5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|136|850|865|898,TC:nil,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 43a03232907511f1aa26b74ffac11d73-20260805
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 60137469; Wed, 05 Aug 2026 10:27:54 +0800
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
Date: Wed,  5 Aug 2026 10:27:50 +0800
Message-Id: <20260805022750.88966-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202608050915.CRrKhB4T-lkp@intel.com>
References: <202608050915.CRrKhB4T-lkp@intel.com>
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

> > > WARNING: modpost: drivers/misc/lkdtm/lkdtm: section mismatch in reference: lkdtm_module_init+0x221 (section: .init.text) -> lkdtm_heap_exit (section: .exit.text)
> > > WARNING: modpost: drivers/misc/lkdtm/lkdtm: section mismatch in reference: lkdtm_module_init+0x226 (section: .init.text) -> lkdtm_usercopy_exit (section: .exit.text)

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
