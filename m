Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736C02F8E9D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771953; cv=none; b=lGdcWYEs2JAkycJSmkwTpgcFgQjFU+ozzhZQaUO7qKgYhsRChCEpE7ylgsXQ/95rhWacbaRWEfvFBLtTTuRzzYL+uzFgsQsrMndbdH98/7CXWf79tCUrnC1TRVjVfnvFTkJe/uVylvo3qyMzcxGB4cNXS0+lk63xQYnAdn3om0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771953; c=relaxed/simple;
	bh=UrQdn8MX1TU7wmXTDD2EFY2wMjTxc/oC+jakoqwNiQY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ERO2MZ/JtFKvVeJgLD2XxGLCaDp40cb0hLF4QRFEvyRdGLS65jUEtwW+pg6gk6l5ARVFfWGP/N4VbaRlTZjvttAkKyM9Bm220TjbuUU6+og9Y8n0acKTlkNK+RAA3FYyEPz1t2xB305YnX/WevLnh8/5uNSZNMNeTg0gBdXCYQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBRf4cKm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBRf4cKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785771951; x=1817307951;
  h=date:from:to:cc:subject:message-id;
  bh=UrQdn8MX1TU7wmXTDD2EFY2wMjTxc/oC+jakoqwNiQY=;
  b=DBRf4cKm9Bu+urBOgnd6q7aNnpO7MGIy4bp750CazdgbIPVF2fTKJ+pT
   DMIlC+DQgvY1uvCsvOIxRFTBmaFY63R5KS5tlqIz7P5mY+xwxnr1o8dfm
   vqCKFfji8Y9KaiD2dwUiCqaMIV7jSa+P5NWav2wvS/6geyeWpQqr5iuYZ
   QUk/BU/r4LLyxA4++LCCKlI/zfn4lUvwEWC4GOkgA22yFyDSmyBrosHm8
   GQTrSw91SN1nBs7oBe4lTe60HQwHAxrTA3zdPVh0lTnbORWXz/mgOpW9T
   9J/LGKxKnGvXJVm9u7s05oDxotBZ05uM3tfCWZ3QThKRLPqJ/6kOgOlL8
   Q==;
X-CSE-ConnectionGUID: XgimEd6AQ5q1vDTINrWepw==
X-CSE-MsgGUID: bZ+rBV2FRcmnCj7bZHIIQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86392977"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86392977"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 08:45:50 -0700
X-CSE-ConnectionGUID: Bc+Bu4TkR/WEDBOr34ELJw==
X-CSE-MsgGUID: 4JzkuzJBSeq1tQG36yFaXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="285886701"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 03 Aug 2026 08:45:48 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqurK-000000003y6-0qoJ;
	Mon, 03 Aug 2026 15:45:46 +0000
Date: Mon, 03 Aug 2026 17:45:37 +0200
From: kernel test robot <lkp@intel.com>
To: Rex Lu <rex.lu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Subject: drivers/net/wireless/mediatek/mt76/dma.c:601:39: error:
 'struct mtk_wed_device' has no member named 'version'
Message-ID: <202608031711.ZMiP7iEN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Felix-Fietkau/wifi-mt76-check-txfree-done-event-on-the-WED-hw-path/20260803-182427
head:   261b0cd9ec58080c2f56a5e6d9015b1081d564e7
commit: 027db2aff0a37c106cbda90adb0101e30b4546e8 wifi: mt76: check txfree done event on the WED hw path
date:   5 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260803/202608031711.ZMiP7iEN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608031711.ZMiP7iEN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608031711.ZMiP7iEN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/dma.c: In function 'mt76_dma_dequeue':
>> drivers/net/wireless/mediatek/mt76/dma.c:601:39: error: 'struct mtk_wed_device' has no member named 'version'
     601 |                 else if (dev->mmio.wed.version > 2 &&
         |                                       ^


vim +601 drivers/net/wireless/mediatek/mt76/dma.c

   549	
   550	static void *
   551	mt76_dma_dequeue(struct mt76_dev *dev, struct mt76_queue *q, bool flush,
   552			 int *len, u32 *info, bool *more, bool *drop)
   553	{
   554		int idx = q->tail;
   555	
   556		*more = false;
   557		if (!q->queued)
   558			return NULL;
   559	
   560		if (mt76_queue_is_wed_rro_data(q) || mt76_queue_is_wed_rro_msdu_pg(q))
   561			goto done;
   562	
   563		if (mt76_queue_is_wed_rro_ind(q)) {
   564			struct mt76_wed_rro_ind *cmd;
   565			u8 magic_cnt;
   566	
   567			if (flush)
   568				goto done;
   569	
   570			cmd = q->entry[idx].buf;
   571			magic_cnt = FIELD_GET(RRO_IND_DATA1_MAGIC_CNT_MASK,
   572					      le32_to_cpu(cmd->data1));
   573			if (magic_cnt != q->magic_cnt)
   574				return NULL;
   575	
   576			if (q->tail == q->ndesc - 1)
   577				q->magic_cnt = (q->magic_cnt + 1) % MT_DMA_WED_IND_CMD_CNT;
   578		} else if (mt76_queue_is_wed_rro_rxdmad_c(q)) {
   579			struct mt76_rro_rxdmad_c *dmad;
   580			u16 magic_cnt;
   581	
   582			if (flush)
   583				goto done;
   584	
   585			dmad = q->entry[idx].buf;
   586			magic_cnt = FIELD_GET(RRO_RXDMAD_DATA3_MAGIC_CNT_MASK,
   587					      le32_to_cpu(dmad->data3));
   588			if (magic_cnt != q->magic_cnt)
   589				return NULL;
   590	
   591			if (q->tail == q->ndesc - 1)
   592				q->magic_cnt = (q->magic_cnt + 1) % MT_DMA_MAGIC_CNT;
   593		} else {
   594			if (flush)
   595				q->desc[idx].ctrl |= cpu_to_le32(MT_DMA_CTL_DMA_DONE);
   596			else if (!(q->desc[idx].ctrl & cpu_to_le32(MT_DMA_CTL_DMA_DONE)))
   597				return NULL;
   598			/* on WED v3 the M_DONE bit signals that WED is done reading
   599			 * the txfree descriptor; WED v2 does not set it
   600			 */
 > 601			else if (dev->mmio.wed.version > 2 &&
   602				 mt76_queue_is_wed_tx_free(q) &&
   603				 !(q->desc[idx].ctrl & cpu_to_le32(MT_DMA_CTL_M_DONE)))
   604				return NULL;
   605		}
   606	done:
   607		q->tail = (q->tail + 1) % q->ndesc;
   608		q->queued--;
   609	
   610		return mt76_dma_get_buf(dev, q, idx, len, info, more, drop, flush);
   611	}
   612	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
