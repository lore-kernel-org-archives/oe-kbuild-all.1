Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CB4360
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 01:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743297425; cv=none; b=ONKQUWTBGAeYm+V7dpa93gUk9If0csRFViIksN638UdraANS+fn++tHvZGTBLJKglWUwDimYh3vZcPFfV8L3qreEx862oIk7R+aAevWa/j6p5ojDLxpN6TQhyqjrzYx6+hyOSIP4c47bKDuVZhhwcuhlxJNbGvsc+5lozuFY/kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743297425; c=relaxed/simple;
	bh=JH5PhsEjqUV63zXAEJGLPDt8Og1iMsdPVSrpr74+ndc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UwgqSj5l7vqQa+GvbyeItCFMzUAMD9vH2/iwrB057mFsDykfxseyVbhcJe+EKWuWoFz6nVPkNSMu15WJG0eF9kkhJIgWnmwV2ZWggqYA1/BfrLLgmyQNaqhhbuKlj+OtYhLw/4SU4pFpxPIeW5YiASCZcdmWMm+OOYybeHkb7lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSylVVWN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSylVVWN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227cf12df27so49765145ad.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 18:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743297423; x=1743902223; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovcY3FlJhLAlcHfJCYvAAuLol4KahlQ6od7r+edeYnQ=;
        b=kSylVVWNO2PjTM/RX8SI52Xjm56H+1T1KW0M2qjpCUxsfI+N9Nd9JnkJlNShMQe2m2
         rvo7h6TMo9Z7YDTY0j+duzxi/6yiXfnZg1nn0RB7b6B0yBjh6vXubNus+PUKXdL+/qxe
         MMKzvUEZ2O1nS+5VroCUliARwmqJLgao66vrbVBZPJZ3//QX4mB2FDL6QePaG2uJkLUH
         Im1KO7D9LcqTl2YYhiyTEXG+5v88lQHNL38PAgMgys2O0GsSiE7oSdx9IKYNcxULhxeb
         tkw/9szMjahWlGwPtqfZpwpjVJVxdV+mv9rrkTrIzRlsaSICmEMCOqULQufRn3ydi+cz
         TTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743297423; x=1743902223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovcY3FlJhLAlcHfJCYvAAuLol4KahlQ6od7r+edeYnQ=;
        b=uLdppXiO50f2hITJb7LTsav7faioLeUDAq7ssTFg+pGvP+o/vDN1KnQf0N4g1KO793
         8AQEjVM/OCdxZS92zEd3ApC21ni0wCdQ2Whk+KTpQUPBWOh4dMwESSFm1PIy3dt5fdbv
         HEhCTz+8GdL5ySycp9KkIsdXZzw5hGtQu0iSJXxnCx1JTSruPIMGX8QmUPyyJUsLqK1a
         gwGOE3KDPfnR1+zMh/06SdXGmjS23YJHZHXorFsfwy1o6615Qk9iW5ncHJSCEcyjlIGh
         1EZLxnqoJ9HP6bT2UbRtGeEEaMqbyrk5ZqiOFkg7irn4ZfAjtc1O7/r9W0IRC89lkJVX
         Qy0A==
X-Forwarded-Encrypted: i=1; AJvYcCWUkxTFPcIbnedmw7V98BUvV+4YulxqVgGeabntFLS+H/4+ScN3UCERxtoYAE0/ZpSlxLiCE0IyE+eZzd5G@lists.linux.dev
X-Gm-Message-State: AOJu0YwDELbfB334ktyZpBWl0bPp/mXbcqKTPLsVYNQDb5yg6TV7ajyN
	yZqunQgx/i0w94NiIykMLqWcEfoJePFexqTlo5bp4q4UEXsQKrkV
X-Gm-Gg: ASbGncsrvyF02JRES3tT9osYfvXmPNJC/EZI+vitd9dL5r8bSbLcVRfllfj3ICfhLJ/
	7urhC/PeyKSjClmTDyiXjKJXH11k6vg5ROxf1GTh6WhQHpL7G8vzo7QodKsioCxp59NzB707r0J
	LWcnLyvV7RwNde9kQoDZfP87yfMAYHJBpE1vNrm3gLKSz8eRbe8Ttng3iALN/5ipJrszEb8tnt1
	ooxfNqpw8lrsn6PxH3+qfugBvAiuW0aVzKFWlqRv2bP6p9NeD+8DbVhkBrP56026OYE9rdblDw2
	zelhCpzJZ7xqzLvhNx3TRCq69uOf8SKOy9EBZLG8aJi9y0svsqQKo9l80akerrgyEWLZUD1NPm+
	+zwuVQSYcreV+wWi8VYzuv9Ef9aeYO3A=
X-Google-Smtp-Source: AGHT+IExY0Kwk0LiQcVFg3q5/x15pk5JiYTn786iSOPSIwCtGaKXfANA/cjX9M8xUqFQ2DVybK8rug==
X-Received: by 2002:a17:902:e5cd:b0:225:abd2:5e5a with SMTP id d9443c01a7336-22921c7af8dmr108875945ad.4.1743297423271;
        Sat, 29 Mar 2025 18:17:03 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee210csm43496455ad.70.2025.03.29.18.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 18:17:02 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	samuel.holland@sifive.com,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	u.kleine-koenig@baylibre.com,
	lkp@intel.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	stable@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: Re: [PATCH v2 1/2] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Sun, 30 Mar 2025 10:16:10 +0900
Message-Id: <20250330011610.388077-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Z-iSb0ryR-tiUCj0@42be267012b8>
References: <Z-iSb0ryR-tiUCj0@42be267012b8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
The register is also accessed from write() callback.

If console were printing and startup()/shutdown() callback
gets called, its access to the register could be overwritten.

Add port->lock to startup()/shutdown() callbacks to make sure
their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
write() callback.

Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
Cc: stable@vger.kernel.org
---

Hi,

I'm sorry that I wasn't aware of how Cc stable should be done. 

I added Cc for stable but please tell me if this patch should be
resent or if there is any that is missing.

Sincerely,
Ryo Takakura

---
 drivers/tty/serial/sifive.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 5904a2d4c..054a8e630 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -563,8 +563,11 @@ static void sifive_serial_break_ctl(struct uart_port *port, int break_state)
 static int sifive_serial_startup(struct uart_port *port)
 {
 	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
+	unsigned long flags;
 
+	uart_port_lock_irqsave(&ssp->port, &flags);
 	__ssp_enable_rxwm(ssp);
+	uart_port_unlock_irqrestore(&ssp->port, flags);
 
 	return 0;
 }
@@ -572,9 +575,12 @@ static int sifive_serial_startup(struct uart_port *port)
 static void sifive_serial_shutdown(struct uart_port *port)
 {
 	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
+	unsigned long flags;
 
+	uart_port_lock_irqsave(&ssp->port, &flags);
 	__ssp_disable_rxwm(ssp);
 	__ssp_disable_txwm(ssp);
+	uart_port_unlock_irqrestore(&ssp->port, flags);
 }
 
 /**
-- 
2.34.1

