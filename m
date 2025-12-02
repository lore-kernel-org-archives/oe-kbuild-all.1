Received: from smtpout.sipearl.com (smtpout.sipearl.com [178.170.11.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E965279324
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.170.11.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764671304; cv=none; b=YV+lzPof5gBZ04sV/yTKTuaicLr0+kwDNUG+kMsYAwyFOXXODAyKMmUJylPxD6b3P+Y+PhjLhWg2oVp8KT6z2EA/O7uZaX4pntN3Uhg/sxPB/IfkQ78K3fFgTMARyZUgk4Aq799XTRbEbY8lRZbgZ6ATvlaLCb03AyEmAjmAhbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764671304; c=relaxed/simple;
	bh=9nkH54PAXzYHl0h9y3ugydi7vZyKYWS+PMfq77NKzaw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f1MRCCeiICNs8Qe2c5RJhGqYYNPsFtYWgvGm7SqV6C/WK5NVyc9g4NVcYk5fJzlbJWfnN5DG288R36PzzRWZd0plviNz8l2rMLT1VUfb2h/F/m6MxtlO/6nJY95rWU7pKFX9iQNg2M0p6YI1qGVvxde7bU/FW2ELA4Poq0UVqF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipearl.com; spf=pass smtp.mailfrom=sipearl.com; dkim=pass (2048-bit key) header.d=sipearl.com header.i=@sipearl.com header.b=lw2oEANf; arc=none smtp.client-ip=178.170.11.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipearl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipearl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipearl.com header.i=@sipearl.com header.b="lw2oEANf"
Received: from smtpout.sipearl.com ([172.31.29.1])
	by smtpin.sipearl.com  with ESMTPS id 5B2ACsfS007514-5B2ACsfU007514
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Dec 2025 11:12:54 +0100
Received: from dc2pvlnosz001.pub.int.sipearl.com (172.31.65.18) by
 dc2pvwexcz001.sipearl.corp (172.31.29.1) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.36; Tue, 2 Dec 2025 11:12:49 +0100
From: Andrea Tomassetti <andrea.tomassetti@sipearl.com>
To: <sudeep.holla@arm.com>
CC: <andrea.tomassetti@sipearl.com>, <jassisinghbrar@gmail.com>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <olivier.dautricourt@sipearl.com>,
	<olivierdautricourt@gmail.com>, <rafael@kernel.org>,
	<thibault.cantori@sipearl.com>
Subject: [PATCH v3 2/2] mailbox: pcc: add peek_data handler
Date: Tue, 2 Dec 2025 11:12:15 +0100
Message-ID: <20251202101215.2240024-2-andrea.tomassetti@sipearl.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251127-lovely-real-wrasse-b1fbcd@sudeepholla>
References: <20251127-lovely-real-wrasse-b1fbcd@sudeepholla>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dc2pvwexcz001.sipearl.corp (172.31.29.1) To
 dc2pvwexcz001.sipearl.corp (172.31.29.1)
X-FEAS-Client-IP: 172.31.29.1
X-FE-Policy-ID: 2:2:2:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=sipearl.com; s=sipearl2024; c=relaxed/relaxed;
 h=from:to:cc:subject:date:message-id:references:mime-version:content-type;
 bh=8znZMcO+NATS6ahvvZhHgXD6UI5V0auQ7qYQlyQDCjY=;
 b=lw2oEANfvcPu2LagtjfG3LUZWYGzIY/9Ug2SHJZgf3f3588gnmDDQtu5x1tBukt8Z7DRy/JTL2Q/
	7wccEbifN4UgYw8L7K7O3/RKBWxjc8EtOcduciOVeblPC4InsCAjw5Og2thKbB9f0gQr5YpzfwhJ
	mNzZivKOJj5CAsyuTAXbZIUb+wqnZ5VZ4d4iXxJ4WfFtDErPtj/VFKHkUhlSwKmT8FzlhszbP6Yk
	MgXhXsSGqKUAQ3z2wGYQ9zFfkpl8hjwcwGHUpAk0HEKI2eJzkjmQRkf5Oks3uUaHtnZi/OHPwkuV
	2NjxCFATYU5YScqKqgLEo/GIx3oME5NOfVMprw==

peek_data is mapped to pcc_mbox_error_check_and_clear, so that it
returns true if no error occurred while the platform processed last
message, and therefore clients can fetch response data provided by the
platform.

Tested-by: Thibault Cantori <thibault.cantori@sipearl.com>
Co-developed-by: Olivier Dautricourt <olivier.dautricourt@sipearl.com>
Signed-off-by: Olivier Dautricourt <olivier.dautricourt@sipearl.com>
Signed-off-by: Andrea Tomassetti <andrea.tomassetti@sipearl.com>
---
 drivers/mailbox/pcc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index 418007020439..ccd50b33409b 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -502,11 +502,17 @@ static void pcc_shutdown(struct mbox_chan *chan)
 		devm_free_irq(chan->mbox->dev, pchan->plat_irq, chan);
 }
 
+static bool pcc_peek_data(struct mbox_chan *chan)
+{
+	return pcc_mbox_error_check_and_clear(chan->con_priv) == 0;
+}
+
 static const struct mbox_chan_ops pcc_chan_ops = {
 	.send_data = pcc_send_data,
 	.startup = pcc_startup,
 	.shutdown = pcc_shutdown,
 	.last_tx_done = pcc_last_tx_done,
+	.peek_data = pcc_peek_data,
 };
 
 /**
-- 
2.51.2

