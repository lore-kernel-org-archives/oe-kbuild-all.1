Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8472EA158
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761039762; cv=none; b=sotJzkxqsFwAks4batllpIYN5bPDayILF69lAltAPju0O7iJk/4Q0oQO3G7WZnFGRYRDqCVbR4tGUUUrmQoT4asFr2LcQ6db9xp6dS2u4RiukA1WE7rfA1s4Q+vxGBHBzhO3Ww7GkefF/CH1D8cdkChfuqi2g/BaiYmPdUjGSaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761039762; c=relaxed/simple;
	bh=JY3CF+2FP66H5ZXTKxBoAbQmuRj8bLfZ6H68G2I1PCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QySXBkUmatNNVwWFP3m8DwC3lxTuINon9tKxc/xlA7v5irK1yZIyinO3KNwpovTTRC94zYKXDPDaUazWeeK3eJrVtuWBNrHulwgICVm4bxrjifKL6/utXFi1S4i9uOjK0dvq0/s88ks69TPyrYrUMy1885DxkF2ds6XpHeKiysQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 43caf076ae6211f0a38c85956e01ac42-20251021
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9efcfa40-2da7-45ab-92d8-592a550acbed,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:63a0de5be62f8f25bb7fa231967758b2,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 43caf076ae6211f0a38c85956e01ac42-20251021
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 438995428; Tue, 21 Oct 2025 17:42:31 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: lkp@intel.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	netdev@vger.kernel.org
Cc: horms@kernel.org,
	kuba@kernel.org,
	lee@trager.us,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	pabeni@redhat.com,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] eth: fbnic: fix integer overflow warning in TLV_MAX_DATA definition
Date: Tue, 21 Oct 2025 17:42:27 +0800
Message-Id: <182b9d0235d044d69d7a57c1296cc6f46e395beb.1761039651.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202510190832.3SQkTCHe-lkp@intel.com>
References: <202510190832.3SQkTCHe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TLV_MAX_DATA macro calculates (PAGE_SIZE - 512) which can exceed
the maximum value of a 16-bit unsigned integer on architectures with
large page sizes, causing compiler warnings:

drivers/net/ethernet/meta/fbnic/fbnic_tlv.h:83:24: warning: conversion
from 'long unsigned int' to 'short unsigned int' changes value from
'261632' to '65024' [-Woverflow]

Fix this by explicitly masking the result to 16 bits using bitwise AND
with 0xFFFF, ensuring the value fits within the expected data type
while maintaining the intended behavior for normal page sizes.

This preserves the existing functionality while eliminating the
compiler warning and potential undefined behavior from integer
truncation.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510190832.3SQkTCHe-lkp@intel.com/
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/net/ethernet/meta/fbnic/fbnic_tlv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_tlv.h b/drivers/net/ethernet/meta/fbnic/fbnic_tlv.h
index c34bf87eeec9..3508b46ebdd0 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_tlv.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_tlv.h
@@ -80,7 +80,7 @@ struct fbnic_tlv_index {
 	enum fbnic_tlv_type	type;
 };
 
-#define TLV_MAX_DATA			(PAGE_SIZE - 512)
+#define TLV_MAX_DATA			((PAGE_SIZE - 512) & 0xFFFF)
 #define FBNIC_TLV_ATTR_ID_UNKNOWN	USHRT_MAX
 #define FBNIC_TLV_ATTR_STRING(id, len)	{ id, len, FBNIC_TLV_STRING }
 #define FBNIC_TLV_ATTR_FLAG(id)		{ id, 0, FBNIC_TLV_FLAG }
-- 
2.25.1

