Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C3C299AB5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756827830; cv=none; b=ZlOxmcMHtzIXlBlilFo2B9V0JrN7y/V32tbAHcr3y2JVPbCVr31j2tbwNFYMbBZDIQ+PAFPDCK7e65qOMoVCLiMFRFTNrEv/ypTZHh9hgpXeeyGo4WZT6fdmWYg9CivUR257a9YIPAg8ha9kBGyQbVwqQLqt/dXCzPhjqzEFX54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756827830; c=relaxed/simple;
	bh=uBSaj1nJUmnyVjV9iB6505ljdKzXL6ViqWhA8JBUUkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOGJZdRs3yTmRE1X+BsZh6osskp8DY94UwKQrVMaHSbRnUd/Jy8IWZPG9krvaeT9O1lwwW+oGeGk6ETO3Puu59V5O6TZmPl+cC8okjZ78FFITIMVpIiNNQgaZf/3zh4dQUv2raqFeAgGkp0UeTlBwAIf28L4hxlwR2lyGaiaSmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=BN6pFgoI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="BN6pFgoI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-248df8d82e2so45949315ad.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Sep 2025 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1756827828; x=1757432628; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkt6jh8He1kXHojoNOHUR+RVSUvV3fJpjiiQf61S0dw=;
        b=BN6pFgoI1kiqTwGxUzaAYnDIw3B3h8W9VzeDNCDAva1232+A6VAIq1WRGeO9h9M4jv
         xgIA7Tne8Kdkm4eQh93hJ/y3U+GxGYkLEbZDeHjv8x4ucE9DHAwuqVHo0xAnTImtZ4C2
         boXj35aY7uEi6u+refQ74j5bpO1lrD8WNXSBKb70IJ+uvZne7F4e1OC1dLl0Y/jod817
         ClpRs3DyYBcVJ/vcnONQJe0rfQFpB1RDv6vOviDNgWEvuGTk4UDISM78nNysr9736e/t
         fWqvvxO1KM+vgDeXaAbZ5ieOonTuFv9RSQh8RXkVEzGWG/N2vCKfmVHGejVX54fROQFE
         lMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827828; x=1757432628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkt6jh8He1kXHojoNOHUR+RVSUvV3fJpjiiQf61S0dw=;
        b=LPHpNmleRtcAzUXhwvnoNVax4IFbigbAnluxYiDQiuSAGGW1pvvnMbiFurGo53MT9h
         5L5aR9mRGPbLWnl60JFvsbcYipzVI9Gk+ZbwRtW9mH+AKwXL8Km0esJDhhKtV0HiISyx
         nlmgbkKjkkZWukQlNnSCyXNQXJwXsBfsT2BFllMszgo3FGVkCwLACej+eB1u+w3XqGbu
         5Ld6PcnfdNmwfnaChhu6NcaQebgmptcUo0gW3eopzTsGoR68A8QwJ2ndm28hhoaTenuJ
         jwjMlSq0MMbeD7iMF0vphhRFDytJKTycEI0aXpbb/x+Z9pOBMBeYjPJFc1cwjjSVQwpu
         drHg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9K3a+sdzmlNEZGuqrX9T/TI3nqiRsVEzLgbAssJSsW0USSTAGk7+VVvWM+pDeL6cyip2tR80VGTOMmLr@lists.linux.dev
X-Gm-Message-State: AOJu0Yzyo29rzPurQTaVzBnXzldyiQNSRh5vvYItmeTOqnFx83pzkcSx
	E8fbveuOhYztT+hal5TAUfP7Cia5yO+T/7VMZnSsbfkRTsj3QcA8kq89FLyfxb3Tfrztn6VBo6a
	lqAlb
X-Gm-Gg: ASbGncv/3/gNtPd2Z6zTzEFDD5gwUGvKZfk3d2+VLBe4npM5VjIgpm3guIO2CJuWUgB
	s5HycDr/clCmg7Z4i//s791UDlRSDBqshKnPjuIMR2Kwt++MjznRcTwl4s9kkkpwFkF1l0JjiPY
	bPdHaCe9xuY5uWuTmY2uYBZY0HMLtR8ita/kQZSh0Ud8OwTsX+1iz7AMIPkhQumRtV1bNiUTK8h
	P/khuV4WgBqE+KfNwILdWYzkT43mvp5KEyEP8yR65/uNSEhJknA/JJkmj8RK8oNNYIjRvmgAO+M
	c1O2VhHEie8occ+A7AERn0aE7vIgRhCMDotkuZmxreCDsZ0P8y2bJU8Mkf648HGoQBCZL4H/WCI
	9ONdNy+xuSV/3ZQSofhQIVWTv6vlT4TCZZuTQA+IFSUqV8Q==
X-Google-Smtp-Source: AGHT+IGlZIJUkPm51/UzPGDsdAct3krCic7IzLREXEY9/oW76ewvmB7K7S3GcX3yQJ4WmturI/w3dQ==
X-Received: by 2002:a17:903:186:b0:248:6d1a:430f with SMTP id d9443c01a7336-24944a173famr145263995ad.25.1756827828044;
        Tue, 02 Sep 2025 08:43:48 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3278f881f21sm9364227a91.2.2025.09.02.08.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:43:47 -0700 (PDT)
Date: Tue, 2 Sep 2025 08:43:44 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Marcel Holtmann <marcel@holtmann.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org, naresh.kamboju@linaro.org
Subject: [PATCH v2] Bluetooth: Fix build after header cleanup
Message-ID: <aLcQsE3x9o4BzXxp@mozart.vkv.me>
References: <202508300413.OnIedvRh-lkp@intel.com>
 <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
 <84fd4012-966b-4983-b015-ffce06509b5e@molgen.mpg.de>
 <aLNRvzXE4O9dKZoN@mozart.vkv.me>
 <CABBYNZJBDgQHwmx82H2XJ-LCeOsxc77PPo6NA4zzT0dt7Uxddw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABBYNZJBDgQHwmx82H2XJ-LCeOsxc77PPo6NA4zzT0dt7Uxddw@mail.gmail.com>

Some Kconfig dependencies are needed after my recent cleanup, since
the core code has its own option.

Since btmtksdio does not actually call h4_recv_buf(), move the
definitions it uses outside the BT_HCIUART_H4 gate in hci_uart.h to
avoid adding a dependency for btmtksdio.

The rest I touched (bpa10x, btmtkuart, and btnxpuart) do really call
h4_recv_buf(), so the dependency is required, add it for them.

Fixes: 74bcec450eea ("Bluetooth: remove duplicate h4_recv_buf() in header")
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

