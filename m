Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE716136
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 03:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750735048; cv=none; b=an5IbaXFd46XjBI78qpFikZn7JsVzxtcU6607Sp0RWzwBGfRDMK5+e6H/az3ENmMWZe0PdD8gNjSFtctWhb8bMbA2GMoOA8WWBAkWm3HERLbMY7oQfzJaSeax2uMGNxsFUcwtLYtu02eSCmXN+lNmd/68k5jOoXrzziBT+BHieE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750735048; c=relaxed/simple;
	bh=2lgsSiSDVhVvn8xEry5TEui0answQ0NLBijzCjYH/hg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=m8vEMnOjgdQHlRgci5uqqsgHD5Be95oavms/es8L2nraiebGaylBsQtVXiYPYYqSi9Xnib0SsT4mh+dCXjkUjPlR7aZJFAj0Cj6rzo6mirnQhqgVIFBJ0fd+bD41OwB0y+AyqEEAUVtk7LTEvoKA2HMbV5rz9cfLBtOqKOxJZjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mV3FB3gZ; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mV3FB3gZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750735033; bh=e5CddSXqWu8idh7jLesbAOAwyCS96hBKVBtYhIbCOis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mV3FB3gZ/ujL5FgQioCWmPfOasilRC57743cOyjhqtpPPF9rV31tTkOO9aWURgouW
	 LnjqV1otMkMk8mIgPG1BGPICUPdoBj+U2FxWPHn0WRcu2wkdePPrBwIJgTuW2gBgx8
	 A3NKjP6MFVep4PhInT2KIfu4usKKCz2UCrJqo/x8=
Received: from VM-222-126-tencentos.localdomain ([14.22.11.165])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 4333CCA0; Tue, 24 Jun 2025 11:16:51 +0800
X-QQ-mid: xmsmtpt1750735011tvra48o7l
Message-ID: <tencent_FACDDA286D6964B8EFB784FE3C4966EFDA08@qq.com>
X-QQ-XMAILINFO: NyTsQ4JOu2J2sYoc6GuRSGi/RPtT58ss+s1XHr5nfWLCHIxKyly4svic0kOksH
	 7zwcIW37+MpR+3wzQtAIANDUukiaOHjmoBh4GDWsbAPaHJYlO+xx9TIgPZ0on+vnq/aGjejOMJG6
	 0gb8oc5F6MNWngAIQu+G4BItbqf+/5wbUiIsJaj0H5l4Z99NV8anfIBTyngabT79+9v8ITDgTSRr
	 /YW61SOabi9MaGwz+Jjkensj3KWLKqSDoe3hhl6/5EjWUHK5bnfdrI3MieryVgElo77Mim+H7oUv
	 H0kHuZmHOyXFzM3NhrUwQpe7StGdjg+YckF3SViWdgR+j54wgb48EA5A9jxwN5KRvRacs29HtU/v
	 rFZ85eHZH1LXJ0YHNTfg88HWG8PDzNeFGRfrtfkIKFAzDlJb3kK5tLOrP1/UfVHsTYh+qk1c91Qt
	 1d5yssHNwAfT2qSpVIq4a12EkslIPIw72mmHeGsqCsOFZD3qzmPCUSBIIU6nVKjjtzEP/ymj3wS3
	 Ua4UrRbVBO8+HrjDOSVXnEX4XidrBcruqy85q16oGrLUjKLu0cFFm/bplXnzSR+EIP3BWdUiHRdo
	 wMHnoByIzaeR672eOofJ7GdQ7jKXhcFb4I4yHdVxAbduZP7LaYuzthfD23Xl+oV85b44apnTfSp0
	 DYTt0K2dGM+jDbwawuro90tYaMojOqD4v5DqSfr/I2OhTrDYFFssElKpjNe+HBEISE8A6Umf2LAg
	 TAURUfIA/TgfxhZ8mAw/Zn1Is+KUJBx7Wdvd7oF8g0YbsJgcPDn0F8/zqo2TxeKzgAI2HXhVj0ZW
	 MAQ6txox0Zh8TFJNsQ2LxvmxaNQK6RlHmCF9Fzmf8TMU+PLJ79GHA/qafOATPV1mNUWhi9UsWB3y
	 e3JngoevZxkM6KkFdrYUKj/rGujKniwonhi8N7BDoZowI+rfFvTez0CrwzherPvZ0LJ58SuKcCau
	 9JXqOZ+iUMFGvO195htvkNPI2fKlpPh5yt+riZJdbcfv30Uj/v4qv1ZgYWPR8f
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: jackysliu <1972843537@qq.com>
To: lkp@intel.com
Cc: 1972843537@qq.com,
	GR-QLogic-Storage-Upstream@marvell.com,
	James.Bottomley@hansenpartnership.com,
	jhasan@marvell.com,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com,
	oe-kbuild-all@lists.linux.dev,
	skashyap@marvell.com
Subject: [PATCH] [PATCH] scsi: qedf: fix inconsistent indenting warning Fix below inconsistent indenting smatch warning. New smatch warnings: drivers/scsi/qedf/qedf_main.c:2814 qedf_prepare_sb() warn: inconsistent indenting
Date: Tue, 24 Jun 2025 11:16:43 +0800
X-OQ-MSGID: <20250624031643.2205842-1-1972843537@qq.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <202506240340.fv6cXpyc-lkp@intel.com>
References: <202506240340.fv6cXpyc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Old smatch warnings:
drivers/scsi/qedf/qedf_main.c:2816 qedf_prepare_sb() warn: inconsistent indenting

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506240340.fv6cXpyc-lkp@intel.com/

Signed-off-by: jackysliu <1972843537@qq.com>
---
 drivers/scsi/qedf/qedf_main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/qedf/qedf_main.c b/drivers/scsi/qedf/qedf_main.c
index 8767d9de819f..b46fc510557b 100644
--- a/drivers/scsi/qedf/qedf_main.c
+++ b/drivers/scsi/qedf/qedf_main.c
@@ -2810,11 +2810,11 @@ static int qedf_prepare_sb(struct qedf_ctx *qedf)
 	}
 err:
 for (int i = 0; i < id; i++) {
-fp = &qedf->fp_array[i];
-if (fp->sb_info) {
-qedf_free_sb(qedf, fp->sb_info);
-kfree(fp->sb_info);
-fp->sb_info = NULL;
+	fp = &qedf->fp_array[i];
+	if (fp->sb_info) {
+		qedf_free_sb(qedf, fp->sb_info);
+		kfree(fp->sb_info);
+	fp->sb_info = NULL;
 }
 }
 kfree(qedf->fp_array);
-- 
2.43.5

