Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C45286892
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908369; cv=none; b=Pq4pU+ZPH02QRpyBMqoYlRXI30bshNfegD2qxRbO2HXZ1iWivBLir9JYFl8E9sY0fXAW0dsI4xtd92CIvcR3zXkn/ovXpbibEM0Oo08fqpwBrBOmKST5S08Evo2Si+FIRB/I8keFk3hqDgw/zeOExHef+VjZncfH0raplmwjkiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908369; c=relaxed/simple;
	bh=jJvjScnyctCjCrW9uH75zudbESAeHApJCJbWt0aaOPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6kkbHL25lRRaiZqHVZYaN5+1qjrscG7LOwfiCJV+yUGDtJzYF91FIL6hBka1LLqGAsBARnT3+aM2bYDadi1dJgR1ip8uH9+WlBkJxbkqJYaf40p6xohwjhSlnzj3rjL+oQHJ/fIdvBYcCIn0/96TnMaYVKhp3R4VHplUwkRXsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=PhecGjxb; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="PhecGjxb"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-248d5074ff7so7392595ad.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 03 Sep 2025 07:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1756908367; x=1757513167; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MjiZpHaOGAzMnI40BIIZ11hI7GlxfYSDqRw3KpQJVjo=;
        b=PhecGjxb5D6UkdDpj3Emf/NZRgf0odam1LQ9a5wOD/aUu90nfEbyCGcRUb7CY69pEv
         2Y4WRGd/WgscOL5WTF9VbrwH0X1U1Hk5wv7OoAWcu6Dc3+OmSNYIhjK4O8uFCArJJKji
         py2RepMfcZj4mnpS7U9L5FoaEXwyIM3Lmc5r1ZRd9S5tOp+Bykd+NpH/AMc23GQVjiIO
         b+Lt8NQi5APIQuLXWDQWsjRLDSSKY1Xmn6mo4Vmrkk81e3yXsbz1Stia0czbPDZOlWNQ
         pvvoBpLyvsJlfc21WK3KQa19XdcN/x1O0BwJlhYpTBzAOkcSza/z+1u9R3nZueRkTila
         uAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908367; x=1757513167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjiZpHaOGAzMnI40BIIZ11hI7GlxfYSDqRw3KpQJVjo=;
        b=bf7y4Y5MZlRpr+IAuuXEs13ZfEVeBJOZz7rRMGAHz7XpFQW00vPoWthk7Fm2HbOt9O
         l59zopwbMyk85hci3a97dJ6cvtU6vpm+jtn32JyOR3WtVrIWrrHOjEcp7oHI2qviwfBL
         kA/YPSPFbVmOZqHHUnM6u4yQxIb25FAHS/h05MopmnSom77thvcr9oVV6+acuOKx+yiT
         Ak/VnKr01F4TpSaNr+bsQwZbldIq1UTIZanT2EPmWRJErMnN8ze6M8Xdo0SW0/4RCaea
         Q4rN8ZmHh2q4Pdi3OJkNjgFXVCnLcvhSRTT83zP0Tq9L6zXbEYBqptT54r9ORV6zDvr+
         1DZg==
X-Forwarded-Encrypted: i=1; AJvYcCUV8y2IiFu4SJ5mxahk+/SQc18pCEyiD2kHAemYtCwCWDodQMgal4jmkXKik/GnSNqL1LH9Sv7auLclP+Hr@lists.linux.dev
X-Gm-Message-State: AOJu0YzjB4v0dUBPWPyOk4BZUuvnpnHR25U584tzsynLiVDWJvVfvEsu
	858LmHkQpRr+YenH3/V28sMVXt/00Vu1HAGEA35Oyz6eZ9W8zNou7w46EHx0quwx/pE=
X-Gm-Gg: ASbGncusQy4xV/8d48BxfT9Ewpg4mfNg7D51UXGnV1q2Ax1iXRrqyU6wMRdIhoiqHom
	LHMlRzapmjj4wLFZQbETbJhSI++itPLPykB052Gr2+9BQilpzLz3tmcdB96gsTOhSXeioTGah2U
	ajJCkyj8Px30Y2yNZrIVYwtIYTazjcXRF5IrXfL0jEbGMxgv9yiWAIwJBzrVcPaSmk+2KXpcE0I
	M9MvRlmyPdixw2iPUWpoOux9hr+elBOPzfPw9KtaSLnBMrFM0l7vyl1fXMAe8Vepz1CHW+rgXr7
	kpGvL1C01XwfgPU42aHfvK0lgznfWsE4oNrLd2OzBB6OoZY7AdYx0ZXKr54HNeztHLKW5/QokVj
	10jQiRRYPyagNq1VgxrBBeQXa
X-Google-Smtp-Source: AGHT+IFlIeuwMod5aclkQ/QtX6cKW39pAdUeh1p1zXqs3QyuVJvhTttccp2Nuw4HcUpvwD0nuOddbQ==
X-Received: by 2002:a17:903:186:b0:246:2cb3:5768 with SMTP id d9443c01a7336-24944b4323fmr220781315ad.30.1756908366468;
        Wed, 03 Sep 2025 07:06:06 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c9e39094dsm16821705ad.84.2025.09.03.07.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:06:05 -0700 (PDT)
Date: Wed, 3 Sep 2025 07:06:06 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Marcel Holtmann <marcel@holtmann.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org, naresh.kamboju@linaro.org
Subject: [PATCH v3] Bluetooth: Fix build after header cleanup
Message-ID: <aLhLTiIMRnjHfvOn@mozart.vkv.me>
References: <202508300413.OnIedvRh-lkp@intel.com>
 <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
 <84fd4012-966b-4983-b015-ffce06509b5e@molgen.mpg.de>
 <aLNRvzXE4O9dKZoN@mozart.vkv.me>
 <CABBYNZJBDgQHwmx82H2XJ-LCeOsxc77PPo6NA4zzT0dt7Uxddw@mail.gmail.com>
 <aLcQsE3x9o4BzXxp@mozart.vkv.me>
 <aLhK5wEHgxc3BIgb@mozart.vkv.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLhK5wEHgxc3BIgb@mozart.vkv.me>

Some Kconfig dependencies are needed after my recent cleanup, since
the core code has its own option.

Since btmtksdio does not actually call h4_recv_buf(), move the
definitions it uses outside the BT_HCIUART_H4 gate in hci_uart.h to
avoid adding a dependency for btmtksdio.

The rest I touched (bpa10x, btmtkuart, and btnxpuart) do really call
h4_recv_buf(), so the dependency is required, add it for them.

Fixes: 0e272fc7e17d ("Bluetooth: remove duplicate h4_recv_buf() in header")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508300413.OnIedvRh-lkp@intel.com/
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/bluetooth/Kconfig    | 6 ++++++
 drivers/bluetooth/hci_uart.h | 8 ++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 4ab32abf0f48..7df69ccb6600 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -312,7 +312,9 @@ config BT_HCIBCM4377
 
 config BT_HCIBPA10X
 	tristate "HCI BPA10x USB driver"
+	depends on BT_HCIUART
 	depends on USB
+	select BT_HCIUART_H4
 	help
 	  Bluetooth HCI BPA10x USB driver.
 	  This driver provides support for the Digianswer BPA 100/105 Bluetooth
@@ -437,8 +439,10 @@ config BT_MTKSDIO
 
 config BT_MTKUART
 	tristate "MediaTek HCI UART driver"
+	depends on BT_HCIUART
 	depends on SERIAL_DEV_BUS
 	depends on USB || !BT_HCIBTUSB_MTK
+	select BT_HCIUART_H4
 	select BT_MTK
 	help
 	  MediaTek Bluetooth HCI UART driver.
@@ -483,7 +487,9 @@ config BT_VIRTIO
 
 config BT_NXPUART
 	tristate "NXP protocol support"
+	depends on BT_HCIUART
 	depends on SERIAL_DEV_BUS
+	select BT_HCIUART_H4
 	select CRC32
 	select CRC8
 	help
diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
index 5ea5dd80e297..cbbe79b241ce 100644
--- a/drivers/bluetooth/hci_uart.h
+++ b/drivers/bluetooth/hci_uart.h
@@ -121,10 +121,6 @@ void hci_uart_set_flow_control(struct hci_uart *hu, bool enable);
 void hci_uart_set_speeds(struct hci_uart *hu, unsigned int init_speed,
 			 unsigned int oper_speed);
 
-#ifdef CONFIG_BT_HCIUART_H4
-int h4_init(void);
-int h4_deinit(void);
-
 struct h4_recv_pkt {
 	u8  type;	/* Packet type */
 	u8  hlen;	/* Header length */
@@ -162,6 +158,10 @@ struct h4_recv_pkt {
 	.lsize = 2, \
 	.maxlen = HCI_MAX_FRAME_SIZE \
 
+#ifdef CONFIG_BT_HCIUART_H4
+int h4_init(void);
+int h4_deinit(void);
+
 struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
 			    const unsigned char *buffer, int count,
 			    const struct h4_recv_pkt *pkts, int pkts_count);
-- 
2.47.2

