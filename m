Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B044F30D5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093248; cv=none; b=ByVfaiFppbjUt5cP/Rfy79MMZtmThnPcVFp/L/eC0PmHfu/JvVcp2K8fh7p2kfMEpcGT5KVINRNk46v09ZA6JVy7Amc9qNkdTexVa/o1gC5gqwLG1o/UPFLpm329wrsNescqiLeDLu6BH26KPat2DxLzvljlVI4zy7jenU+MQX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093248; c=relaxed/simple;
	bh=exYz8HojfNFpfT1r/TAXOuBExCBpvaaa/xfi09cNlzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5E+gA1xcbtrBDydLsZslcLo/1XtLWLX8uPvZPT63teg1U0v4pB/9GtXcITg2G5nyzlJzVJpXOCX20YhptR6hmXBQ5CH4MKnrMWl0vieWlL/nCDj9DdDI7Eu7BmRYHyDOio8JJ1JhGPgv6dgxdjuo6R5zjqPn+dc9N1RUuTYOu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b69nWSS1; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b69nWSS1"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso3201133f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 12:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792093245; x=1792698045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REOYRPOTLjq9QJv9FoE0sRCG3Um2XhJ02u8RHdOrcGU=;
        b=b69nWSS1Bbw0NOHyBIdnno/I0fmr3sQZxoh0huULLg6VuSAJgHPU08Zl8vDf158ULD
         D7LF9VN7JH3q28aYgOM3g9oRJsECwKEzY5/d3n1M20IW6bILkrphXbi2NHZJ0aD850kU
         Bcw4XuZb7thvHd/O821zGMj9zJa+Qv6aSEJLckFRJJryz22emJd1INrzMjiMzQMQNvVy
         at6W03RxORso6ne+6WjMN44WM2KwLKF1ioxaZNhs4uSa/+bTzLozjYMLBi4P69LWTkQS
         deOUzDDxYWdWcl3v/B0MmKEFalWdO8IxtiMzz/oUTxAP1x4FIaa9I8hHghoOvoONMJJZ
         S37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093245; x=1792698045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=REOYRPOTLjq9QJv9FoE0sRCG3Um2XhJ02u8RHdOrcGU=;
        b=OGQULLtdZa8C0GdPDE5pPeo8E9GQF67f2/H9Xe2vQCTbJqRpDbvHRxqWQHjAg89YVr
         iGqgGOClHw7XNM4OrmHaopivlGgwjz1YVfKO1ck562N9XjVlio4IKVAAvuCuWhva22cu
         zNgNOWuQu93uperRPZlPm77xEaarF9TDCBzgfDAKmfhGZtxzm1rFXPtvdGsFdkf0uJSK
         RR76M2vAW2XE86M7LsRL87FOBTZpCzhCbNQiEZtJGERkII6T8GG6fqvxNOW707vgjquD
         NfHM/k1q0/z+QVJA2E/X51CAIHBnhv2ArltOx0W7UXbP2MOaX6/HtvTDKuytwkykmBk4
         6xLg==
X-Forwarded-Encrypted: i=1; AKwUvBw2V6sUGmkqG6Xj/wT6TZFnoQ/R/yHRDIFbslfIHQMbZ+9mwja5x52ZXQfKi4uREHtCTwgaGRmjy76j0Y5Q@lists.linux.dev
X-Gm-Message-State: AFq9FYIZBYSJIZbPflQVQw1IN6WgzePro2zhuVX1dwE/ikzhgxUBz3ai
	hRULzk0Ks8b0SIs57xVcleEH/gcQz4NWO76zyMK1GJeKFAtywF9sDG/p
X-Gm-Gg: AYBFou3mcgtRRLOtZQ+qbIL2B68c6pqIsC7GqwN0F1IaacWOWXmv3f1T/82+QJctZSn
	X9blbovdexttNCyHeFs906PYZoyxu7PMtvZP8MOuLxek402IME2dskmxbCAfiIO6X9TSD49db56
	oft+rQNDhs0jSLmez1DhVI75wyuiuHnqsECsg9DfqR4H9WJlrCweV6i/MljVaH8/1Wn3aVA/r2y
	CYBP3nh3auriV35wYjE/cUD+GYWDiWq4i2TF9tIiJAhD1Vx0+gZCPdMX1ATRfNvOOW6R/HTI4YI
	yuIYquUEeiTbZFNmXtliZp3cdJgiBzObxizTN74waYivg3Dqju9CTDVtmpCe2LC+27nTJ4IXoby
	W2q+8/kTuk47syeufawAi8UbIshXdSV+W7Le9pD7vgXivMxMHGraUSjtc5Di7/QkyzJ/jOPvoJ5
	kGsD81gGiDh5Slb9qD8YPQZUCq8FzJBeP0IbnEND/pjf45bYWT8HkrBQxWQZgM3sEsDsas+Il/u
	aKh5uEXANzer8es8gQhktvndXk/OwGJFfHLhjoic2FvfmgwrMpejByZqx4/bpDTnrNj5CGS38I2
	IRDadEfucgexrw6k
X-Received: by 2002:a05:6000:4288:b0:488:6ed9:b11d with SMTP id ffacd0b85a97d-48dbacf554cmr39361187f8f.52.1792093245329;
        Thu, 15 Oct 2026 12:40:45 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a72sm195253f8f.4.2026.10.15.12.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:40:44 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH] usb: octeon-hcd: fix the kernel-doc of struct octeon_hcd
Date: Thu, 15 Oct 2026 19:40:43 +0000
Message-ID: <20261015194043.1597422-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <202610151637.5srThc2q-lkp@intel.com>
References: <202610151637.5srThc2q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct octeon_hcd comment opens with /** but names its members
without the @ prefix, so kernel-doc sees none of them and warns about
every member. aebbc7d63407 added sof_timer without a line at all,
which the robot reports as a new W=1 warning.

Prefix the members with @, drop "pipe", which is no longer a member,
and describe the three that were missing: periodic, nonperiodic and
sof_timer. scripts/kernel-doc -Wall reports nothing for octeon_hcd
afterwards.

Fixes: aebbc7d63407 ("usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610151637.5srThc2q-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
 drivers/usb/host/octeon-hcd.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
index 4929c6a..d6ba52b 100644
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -348,20 +348,23 @@ struct cvmx_usb_tx_fifo {
 /**
  * struct octeon_hcd - the state of the USB block
  *
- * lock:		   Serialization lock.
- * init_flags:		   Flags passed to initialize.
- * index:		   Which USB block this is for.
- * idle_hardware_channels: Bit set for every idle hardware channel.
- * usbcx_hprt:		   Stored port status so we don't need to read a CSR to
- *			   determine splits.
- * pipe_for_channel:	   Map channels to pipes.
- * pipe:		   Storage for pipes.
- * indent:		   Used by debug output to indent functions.
- * port_status:		   Last port status used for change notification.
- * idle_pipes:		   List of open pipes that have no transactions.
- * active_pipes:	   Active pipes indexed by transfer type.
- * frame_number:	   Increments every SOF interrupt for time keeping.
- * active_split:	   Points to the current active split, or NULL.
+ * @lock:		Serialization lock.
+ * @init_flags:		Flags passed to initialize.
+ * @index:		Which USB block this is for.
+ * @idle_hardware_channels: Bit set for every idle hardware channel.
+ * @usbcx_hprt:		Stored port status so we don't need to read a CSR to
+ *			determine splits.
+ * @pipe_for_channel:	Map channels to pipes.
+ * @indent:		Used by debug output to indent functions.
+ * @port_status:	Last port status used for change notification.
+ * @idle_pipes:		List of open pipes that have no transactions.
+ * @active_pipes:	Active pipes indexed by transfer type.
+ * @frame_number:	Increments every SOF interrupt for time keeping.
+ * @active_split:	Points to the current active split, or NULL.
+ * @periodic:		Pending TX FIFO writes for periodic channels.
+ * @nonperiodic:	Pending TX FIFO writes for non-periodic channels.
+ * @sof_timer:		Polls the block when the next periodic transfer is
+ *			due, so SOF interrupts can stay off until then.
  */
 struct octeon_hcd {
 	spinlock_t lock; /* serialization lock */
-- 
2.53.0

