Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933581;
	b=d23vU236fDca7iCCY5yilvP4SryREk7SLu9ztlCqR63p38aB26sIrZD+wtA8EgNMgXsZ
	 xjaxlVvU2lJ3qN8tz0hTuLUhwhgRUN9nA2exalySUjnbhWa6zMlWEUVW1ZxxFDZBlrjEG
	 /w5ZhWitxnH0yQbybxYogZpq3A1SRCrTdQI0DRIB0uVVAB+nvQ1CAmkILMpL/o8tYdj2m
	 mLXMc8nA2wXXLpSCY33PCONFfEzXCWkT8azjSGgAJsAzA5s7yvJB6EWVtWEygvnFcdAfU
	 zzPjtM5G/bByk5oQOqjGzEjmdSODrblTd3PXFan498kKT2znUWbkgmV44XnJcw6KqNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iMc4CFcXOWr3ZfmZEHkTdrVLJyWhK9ZAZAwwufof5Hc=;
	b=11AcQWWypt9BiKHSandUArMobCk9b6+dup512zLk2XjwhD6BYtnlsFbdMlqBoyV+ILsT
	 eqpbRjgv2gwPL1mroEhBNt13SLhLKIMid0hxcewGRX6KKSsapwmz+smWmAGkVf4jcw/SV
	 N8LiHp8b2uOvrK+oz2gElPbLrtr1ycW+dKSCcnfuDRZuQRYbgSS3JD9IcGsXJaGezlXFv
	 ysM/klp7VhH2c6OOyXbblc/4uJYrC4KW3Gybmy5h5gDV2JnRGWWXtgo91aZOK7K8j0UKh
	 Qei+C8HMZHlCaZJxNMGp35D+ot6FW0r7GVOMS1ou9aFPUOxl4pfIe+XMnX89gw+Xd5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0efcaFdH;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A41606A882
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 16:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A41606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0efcaFdH
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso510245e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 08:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933579; x=1795538379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMc4CFcXOWr3ZfmZEHkTdrVLJyWhK9ZAZAwwufof5Hc=;
        b=0efcaFdHG1kGrU65LtQC6A9Qwu2Ofl2z39UlKX2UcZ4ZkNG9Y0/MgiSazPOP/wfKYr
         j4nWIMO9CAc9G4g7X+BMbZ1uEynP5t6nDvZun5QuA1D+UQ8ZgiHOmTMrJ3pdX5KpIThN
         /1LyPpTOUmmhxcj4aIxpVEX3YhGNzMEGnxhxW8FZvfhK4z8/Su+L7wM1CC1yev6ccto/
         xejEq/e5tKHVd+hfUSikM6FOvtObuAH8s/7JbJHB0t9rSr0NVqfvGccAluwIFO3lPs/M
         D81dFnFgAAne3GHtJzfkyVvLN47b7ek5vBKJ0DlFbuH4fg8WLgzKSYwR3TXAYRRckolq
         lkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933579; x=1795538379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMc4CFcXOWr3ZfmZEHkTdrVLJyWhK9ZAZAwwufof5Hc=;
        b=XMNgLmnP8jjQgA5LqNP5d3F1LfVCX6oVpc85f8ZdGxjCGhNQgQNHCbr8GbMHVRr4Nz
         M1Eg3fvefl8BpslRZ7BqtjntTTquLXH9ytOPfXR1BNgpxXFww5SMY9Pd+JC0z4DlAhWv
         eXQRt/0aH1hO/Cuz0D3fu/IYmBDvbCyI33CQIcsvA7k6IUiAvnHod6FjG/NwVUaXjy2J
         rqDNTyTaG54IgtBK3v5aFWBMr0rE+YEsY37AadfQpzlIrwODnROG1xuYv7073E0nunbP
         IYamENy17n6rK3WNuGVvLhj4kQLlkYVQbiiiA6Y1O+NqN5VCZt84k3Yg+/NgT4pbnBUu
         Utlw==
X-Forwarded-Encrypted: i=1; AL+hErEetqWNQwTbGEu3jKkX/yOYSF55u5bfpTDh0awiRb9eiFg5hwPJBNZk9au+eDDmXPpY0LP78glZyfx0fQYS@lists.linux.dev
X-Gm-Message-State: APuU4Z8mk2VtR/0u0Bm7KIpBJEfVIuOoNWXZi5cuvRabwnKTBqukpZ8c
	asrhrpxFKci6yhfMw8YXyCna+4OMb11yg71Xyw5Of3m50MbdprHtU9ZTqs3OjA==
X-Gm-Gg: AYBFou3dCAxHcCXUdUGnXya1Mq54dxqdY+m78s7hbA0QnjIcr04j5YPtFwWXLWhRjm2
	kB96zZZNiGC0TmDBRNIvSx/hfdX7AntjNMFK+5qFYwaiubQtt2WzFU1+AZs9MTkzuJxujhIEeaK
	8t1/VDGaW0r6M/ex9TzlQEqTyJoQvTWsnQve5RH6qzoMbIEWncngvphIdeMkle+jY3t9+bm7O60
	gajf7KvwFkchWiS0sEHfhrAFF9b4tm9p23kjqLnoMTqfWwiDW2OqVnrox4gXsL0n0CuFYd5mkGo
	TaKr1V8Y9IYMBOGhc50S47iVgX7/8TRsaj9/U1VQCDvkyyDYKc43b82bWcUJZhMY+GZa38Qldq0
	s2D9uaXXCHK3jDERX7Tgr5P1ZxpAKFD0pjNevfeA1xgOJL6m9z0ASz7I7p0DEbvcZ5dYGXJ694W
	x4X9qc1TytkS2avDUllI3JgCK0diWfWxCVIZzLWeuZYtyoNlC4roMbHmYV3u2DTg8eDgUh+GnuZ
	r5sm5kX59WpncWUd1qvu4yh57EkGhzNKOjLE2yNXDBumf4jlb5Hp9WXH8Elrhe/A/swZ4shGXfi
	o74VNcirqxB0gx/Ud75FBiQSaIHItAKFzLLKx0+We759eo4WduceQ4cY1P8I5EoDOJnU6FKOZr3
	uZOIv6383iVtgL5xzeuWIhOvSDCib27LtHc7+ABEdE4QJyYc=
X-Received: by 2002:a05:600c:470d:b0:4bb:6b59:aac3 with SMTP id 5b1f17b1804b1-4bb6b59adeamr179333065e9.29.1794933579138;
        Tue, 17 Nov 2026 08:39:39 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783e9288sm80817565e9.15.2026.11.17.08.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:39:38 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH RESEND] usb: octeon-hcd: fix the kernel-doc of struct octeon_hcd
Date: Tue, 17 Nov 2026 16:39:37 +0000
Message-ID: <20261117163937.3727045-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
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
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
RESEND: no change but the Assisted-by tag, now dropped (an LLM helped
write this patch). The warning is still there in v7.4-rc1, and this
applies to it unchanged.
v1: https://lore.kernel.org/all/20261015194043.1597422-1-orgads@gmail.com/

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

