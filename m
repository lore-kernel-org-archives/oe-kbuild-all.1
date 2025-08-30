Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68EE1A2387
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 00:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756515049; cv=none; b=TGwTeQh/h5K1NTw6mWO/f6NPHpyttufRULEinw3m9pNb44j12UYVLLxyt2BMw8I6oNu0Mammkb1pzV9ueEOi7dW4LDTvDDekW5g4ZVg1YIenaoCBrQz5ju4Us1HRfTkLMMT8eax65GjDmhp+qyoKMtNu89g5TnaipX6pucyKGdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756515049; c=relaxed/simple;
	bh=nyBd3svYSA8ZWsKGuTLD0ccws/tYPuOWANWLsrbj49M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uFuK6qggU0e4lc4vG6wMH9cme/H9+APhcpbiAGSNwWZ5xlgWvADv6mITY4rmBg45o+t3t+g2O5TNws+iEqdt5iWmIyucyNUZ61QRIwUsAVLMa1W860ln9odlrE0g3f5qVImTkt57FjWyRiJYAlqIL47iI9hCyxKnTzt/oxo11Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=YHvADfSK; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="YHvADfSK"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b4c3d8bd21eso1745731a12.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 17:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1756515046; x=1757119846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2SbNmp2jN3W5ifKkr2ZRQIsE+bXPrNXTTlRWUPsyEw=;
        b=YHvADfSKocKLpY3mPaWXOr/hkhsnHNMkrc+hWOcXPxIAheU1n2MAVt7YKJSrdj3QP4
         8f+zM/VFw6xC5gUoRqSn5/FUPc4PXwkSKHZe23+drHYzWx7AXQAhi2K3BGr+WJ92zH7E
         xKSFk3HdgNNNfKhP/KucoOgICEaJbau9HYYI0Jbot+C+kXNL4wdF3RTCOwJvQxUzNqnu
         m3+vqPS+x+agwaDTlXhfB0LbjRDrsUhxbHdfNgd0UTy+3hf32hlxyqg3ovbHBRMwte9K
         3AvWkFI6TjEXDS75NWd75tGkQUs4jmMtfkJkOYdMuRaJg4vA3VZ7qy+0FLQqfYCOVX8/
         Dnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756515046; x=1757119846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2SbNmp2jN3W5ifKkr2ZRQIsE+bXPrNXTTlRWUPsyEw=;
        b=CSwkmIA3C9yKh3j2K31jI4ZePYxxU8juswMlRx6JCw2ZyFCMDhKNkPPAOfv8tkosXr
         4lc2n5U04Nft5CniN7uLmnEeCR+Si33ye5kigwtzi5bAKi2pud1lUH4Azm41Qnx11LSH
         F6pLfLG/r4KS4QCjc0tT/M5g7MHSEwtyEZQov841bxzYH4XnGViO3skn8jc3wO882pW4
         rMpHSrf8eRvrFAhu4u9T2e+waJLCUtVFjvL0n33ZA8y8zoj+0PymnJg81QZJ3tF2Pr34
         ZzsgkdDnaJ7vBhRL9pmA+CvQYd8se4XDYe1fLf8mS+3DfcEG1+f3rnHJlJtB07xFx6Vo
         rNtg==
X-Forwarded-Encrypted: i=1; AJvYcCV7ZR/IICqT0SGRUvI9s8XrYKyCmDAhOwvAcbfazmCEj8jROok87zMd1yit4cvvaBtNGfpJMGqeNOvrSUQj@lists.linux.dev
X-Gm-Message-State: AOJu0YwgtO1M6Rkhf9s8qUT7i7Fp6HB1SI/az/8EUhRglLiErHvmrKGC
	BOsQZUFIGqm9MSKn6HMHb89OQtIQ5TcTlsIEzK3/KzBHt22ieYmaHPMbP+G2laQIhno=
X-Gm-Gg: ASbGncsTDqQLTa3ngdRLFfyUkkmsaSb91hpsvieVm4vaM7cnG1nHgEMRsdKVxlMK4hD
	GqYMxK1TyHfVkVuTIUFvosjMZuBneLV/qi9GOXA41p+pl+SeQdZkyCKoJZ1t4zV+altp9UpiHRq
	p/sID3sO74seqRNpPt4uUzUX+IJ3CKP01NiuzT9bJOgwUnI4MTJK/Kmi2IVrVg+dZkAj2FfzXuH
	xiHCrU9EioLXjGsCu3ZExvhzpbXtUxw2Kg429iI0BJk9XZir5t4o1NAo0LWv3mRhM4DwXBN60nK
	2BrNqkAvKueiz7oIB0mR+9QICk5yYAcW4cb/jeNsC2Ksew6s4XHBNvf17v7bVrPqKEIBKPk+k//
	ciu1tubVGmeHY722Kat5mKzVY
X-Google-Smtp-Source: AGHT+IEgjacSF3MiNjBgqMzAV1pQjZuDMZIwv0mu4RkXIH4CsWBoPGHGROsvLiA4PPniQpoHC2qUVQ==
X-Received: by 2002:a17:903:190:b0:246:e8cc:8cef with SMTP id d9443c01a7336-24944870a4emr8537915ad.3.1756515046144;
        Fri, 29 Aug 2025 17:50:46 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249063961desm37008335ad.103.2025.08.29.17.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:50:45 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: linux-bluetooth@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	oe-kbuild-all@lists.linux.dev,
	Marcel Holtmann <marcel@holtmann.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btmtksdio: Fix build after header cleanup
Date: Fri, 29 Aug 2025 17:50:29 -0700
Message-ID: <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <202508300413.OnIedvRh-lkp@intel.com>
References: <202508300413.OnIedvRh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Syzbot found a randconfig which fails after my recent patch:

    drivers/bluetooth/btmtksdio.c:442:33: error: array type has incomplete element type ‘struct h4_recv_pkt’
      442 | static const struct h4_recv_pkt mtk_recv_pkts[] = {
          |                                 ^~~~~~~~~~~~~
    drivers/bluetooth/btmtksdio.c:443:11: error: ‘H4_RECV_ACL’ undeclared here (not in a function)
      443 |         { H4_RECV_ACL,      .recv = btmtksdio_recv_acl },
          |           ^~~~~~~~~~~
    drivers/bluetooth/btmtksdio.c:444:11: error: ‘H4_RECV_SCO’ undeclared here (not in a function)
      444 |         { H4_RECV_SCO,      .recv = hci_recv_frame },
          |           ^~~~~~~~~~~
    drivers/bluetooth/btmtksdio.c:445:11: error: ‘H4_RECV_EVENT’ undeclared here (not in a function)
      445 |         { H4_RECV_EVENT,    .recv = btmtksdio_recv_event },

...because we can have BT_MTKSDIO=y with BT_HCIUART_H4=n, and the
definitions used here are gated on BT_HCIUART_H4 in hci_uart.h.

I think the simplest way to fix this is to remove the gate on the
definitions in hci_uart.h. Since the constants are macros, there's no
runtime cost to doing so, and nothing seems to rely on their absence in
the BT_HCIUART_H4=n case.

I let randconfig builds run for awhile in drivers/bluetooth/ and didn't
hit anything else, so hopefully this was the only fallout.

Fixes: 74bcec450eea ("Bluetooth: remove duplicate h4_recv_buf() in header")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508300413.OnIedvRh-lkp@intel.com/
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/bluetooth/hci_uart.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
index 5ea5dd80e297..fd0624988aba 100644
--- a/drivers/bluetooth/hci_uart.h
+++ b/drivers/bluetooth/hci_uart.h
@@ -121,7 +121,6 @@ void hci_uart_set_flow_control(struct hci_uart *hu, bool enable);
 void hci_uart_set_speeds(struct hci_uart *hu, unsigned int init_speed,
 			 unsigned int oper_speed);
 
-#ifdef CONFIG_BT_HCIUART_H4
 int h4_init(void);
 int h4_deinit(void);
 
@@ -165,7 +164,6 @@ struct h4_recv_pkt {
 struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
 			    const unsigned char *buffer, int count,
 			    const struct h4_recv_pkt *pkts, int pkts_count);
-#endif
 
 #ifdef CONFIG_BT_HCIUART_BCSP
 int bcsp_init(void);
-- 
2.49.1

