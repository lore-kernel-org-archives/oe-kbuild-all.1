Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA41A08C6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731321654; cv=none; b=NvDfTG38UyrD0fJOzrWi4LeI0yKapuxjwZGbA2z/QoOaMWaBZeptp3OEPBfUAEWxGJbGtFXudJ0MVM9z1ytbdWkISriLnLPCRJTiB6PZqHWDlrS+4ELsAnuTIh2iNLSFmcgS0rqKoem+SWoBr0c7RNkHzDRMU2QzUlL7FzXOsOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731321654; c=relaxed/simple;
	bh=azPrS1j3QByVxN7xXDHIVs7hv/lKTXcrOFUBNbYi97k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dssl/D2NOioEqfysNqD6vB9zRnQVwRSLq6wwwSKEPQvz93jYnpt2yivtsT9tYq0JVO11BjFI0zUSbIsGvPMqMZ1hVTyM7P0GIRUomske5U9nLFBGcRaLsLEmMXGiRzPObBYtTuL0kyBsLKqktSjUQRrYWaotXRClfAt/sSgCO4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=LLyBncN7; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="LLyBncN7"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1731321641; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=ANaj5cw0dJXBW2aHUxAtiqksuPuFswPm45+aKlClaSI=;
	b=LLyBncN77Crt05C3WwEW8Qik6yEc087AVW9emBeuscTEnTUcos97VZif6lrNfujGdFRnbe/E9jGYhfiOgKsLKf8YPyUURYp1GwtYC/pnOdPKvkzn+CP2Dr1xy8N5AFxB+pKZdcknyoHGZ+/m+rk3LdXtER1z2eF4RyZIrcIeifc=
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0WJ9qBV4_1731321635 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 Nov 2024 18:40:40 +0800
From: Guixin Liu <kanie@linux.alibaba.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-nvme@lists.infradead.org,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH] nvmet: fix the error of point math issue
Date: Mon, 11 Nov 2024 18:40:35 +0800
Message-ID: <20241111104035.31770-1-kanie@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the wrong place of parenthesis of ctrl_eds and data point in
nvmet_execute_pr_report(), switch to "void *" first and then do
the addtion.

Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
---
 drivers/nvme/target/pr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/pr.c b/drivers/nvme/target/pr.c
index bef82135a0e7..550effcfb9ad 100644
--- a/drivers/nvme/target/pr.c
+++ b/drivers/nvme/target/pr.c
@@ -848,8 +848,8 @@ static void nvmet_execute_pr_report(struct nvmet_req *req)
 		/*
 		 * continue to get the number of all registrans.
 		 */
-		if ((void *)(ctrl_eds + sizeof(*ctrl_eds)) >
-			(void *)(data + num_bytes))
+		if (((void *)ctrl_eds + sizeof(*ctrl_eds)) >
+		    ((void *)data + num_bytes))
 			continue;
 		/*
 		 * Dynamic controller, set cntlid to 0xffff.
-- 
2.43.0

