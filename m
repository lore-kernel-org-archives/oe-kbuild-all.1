Received: from mail-m49194.qiye.163.com (mail-m49194.qiye.163.com [45.254.49.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D421DDC33
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763284707; cv=none; b=L4BmUtOtymFgO9Uae0c6ICNTKFW+t4StMHOS24go2p3b5O4ranU0TIFS2knYSFP2Snnv4z9NcoQD9OP6s80I4RkuI/DhcPuABdmyNeI43HQuW4qQ55kVqGSZQGRYHONp+oq+wgLIP7JRCbzlPJLuasHABsT9R2Yp1zW/FXP9WcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763284707; c=relaxed/simple;
	bh=C2xsmL5bH+8CkFWkuHry3z2ElIXPFHHpG8npGc7YLBM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SLiEmc/aeCN7hhEJJLrGixqrFDFHGPk0MPc4RDDWdo9+XrNCcjNk6ZMY7vRdW3WvSkdmnrwi5olvWjs27ZOtdYOQ/57YQzpdP7MRe4pB0pHcVEAgrtwyKONKFHKBXakvSd1hPL+NSFqfJ7eE+/moymq3r85ts0sRqC8O1tzXVZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=flht3GDX; arc=none smtp.client-ip=45.254.49.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="flht3GDX"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29ba5697b;
	Sun, 16 Nov 2025 17:18:16 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: lkp@intel.com
Cc: alexs@kernel.org,
	doubled@leap-io-kernel.com,
	linux-doc@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	ke zijie <kezijie@leap-io-kernel.com>
Subject: [PATCH] docs: zh_CN: scsi: fix wrong reference to Configure.help
Date: Sun, 16 Nov 2025 17:18:14 +0800
Message-Id: <20251116091814.1791491-1-kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202511130032.gevVvSte-lkp@intel.com>
References: <202511130032.gevVvSte-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a8bf53c3b09d8kunm78c509dc329c51f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHx9IVhhKTkpMTUJJT0tNSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=flht3GDX8qH6PFE2jAWJzhrnS+OqRwZCZzpR5oYwECR3oMLxRQa6qrrEh3DlazXRVSzKCAvj3tguQJHOXMXjdU+wbzQCTEvESPDj+bFu3UjJM0EJzOA3KzcN/MYkmfb2Qtqy1THSYcO/W2Nph2ZcdXqnP1NdpWJqrMxsD9Ca9pXxR5RVFr5czNHX33YfolRAGb/kyHELr0GyN4/GsqL7+gDvYZGYWc9A/bkfh2B9YhSA/JHu1C2QYM+B+W1QSvKwcicTN02ckAsSzTmwxOYLrMhDTmRqcHFCQ34nnhA12JRLFLQiMBv63kRS+jKEHD15TUHXsrv+qJtkmSp/JjcIHA==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=C2xsmL5bH+8CkFWkuHry3z2ElIXPFHHpG8npGc7YLBM=;
	h=date:mime-version:subject:message-id:from;

0day CI reported that scsi_mid_low_api.rst references a file
Documentation/Configure.help, which has been removed long ago.

The documentation text should wrap this filename in Sphinx literal
markup (`` ``) and avoid producing a broken file reference.

This patch fixes the incorrect reference.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511130032.gevVvSte-lkp@intel.com/
Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
---
 Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst b/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
index f701945a1b1c..30ac3bb5b57c 100644
--- a/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
+++ b/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
@@ -1144,7 +1144,7 @@ struct scsi_host_template::use_new_eh_code标志
 也已经被移除。

 在Linux内核2.4中，SCSI子系统的配置描述与其他Linux子系
-统的配置描述集中存放在Documentation/Configure.help
+统的配置描述集中存放在 ``Documentation/Configure.help``
 文件中。在Linux内核2.6中，SCSI子系统拥有独立的配置文
 件drivers/scsi/Kconfig（体积更小），同时包含配置信息
 与帮助信息。
--
2.25.1

