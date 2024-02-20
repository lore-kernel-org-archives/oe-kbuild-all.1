Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C7123BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 00:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708389290; cv=none; b=YfLJwPq52/iluicldoPVmttUeDUlhBSDPnZUa/m3VqO+kdgeKafBkK2SwkBlhKY87Y6setP7GctQlowWHFZzo/NRPnQ2j1ZYYTw6X28v+UFaJmZDPBw83WvBRuwn+5VadxkvHblct2ulvDln+yuBGxJUX9WSDE3FKXEYhwCxaG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708389290; c=relaxed/simple;
	bh=twysEfuQ4T/0w/2qh6F2Tm91ScgbJMClrcyBk8mU50U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J92BtKkuveKTL5WHZeBVJmiNaWgPScoczZbq7kXrcwRmlFHQdak5U7Ihb9Ear8BrQsw+uJrJNmSPR1xfggNqe5MRXnjQTSqHmr7t6+VTa8RVcdleAFpPl+3BSJM0YLKmC+9jWDOpgSDvnuJtyPzwf8cAwunO8bGqd3azVXRTNDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bzW8n8NL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bzW8n8NL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708389284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uJszGoDmcJ/e3cfaUrhP/NITyUlid6+ei0fLVW+ftlI=;
	b=bzW8n8NLXGrE0OfhLwnfm0Swp/rhHEzZd//wvbdtw9XdjgEy6nSyjKeFXOVjd/GG/mjB3E
	a/JEt2uU3eBb2oi2qNhMJP1Gv7Jg+op0ZNFQ+0SSo18zzIh47B9Ql5TlLd/W8YIXNw0xVu
	UKCzmqy4R/chg8bCkHB+OzVnVs6YsyQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-l6CfZHNUP-OaFarQLeCrzQ-1; Mon, 19 Feb 2024 19:34:41 -0500
X-MC-Unique: l6CfZHNUP-OaFarQLeCrzQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-41225d3b3d1so23871785e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 16:34:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708389280; x=1708994080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJszGoDmcJ/e3cfaUrhP/NITyUlid6+ei0fLVW+ftlI=;
        b=Q6RhxIKj24AMYS4HLLXxeae1tCH1hoKh41CWgIbwEUrmyhBXohOp0hFwk3WjiSAEh5
         QQ4+meznigiN5khp//KHBQJmvylVOqZq4+NQw+/8cFpREZXZmRqZZY2VMUX4KFm1Tam5
         7d8jcLhJlzu6KjR7vZ3IbRxarlYEJhFgAD/TBoM17tOOwGYmc0h4d4Qu1zvj8Sg1VZlD
         MGiRmX+vpysLInLkP+RsRnAOBtOi/so3ozxIvLRoZ9XG1RDDxMBuKeHHVQQ0g3ZdTxzQ
         gflnhHt/sKyHHRwF6qVjji6m3P6unVznK0cmfWLDQ7+85kGptE7R4K02DCVlK4xKwbFf
         MyDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO3+2ZD5WnAJ4SinnxxXOH7j64VFpmPbsnYhpB4T5vaX0wWKBkT2Gtk1S+Kjcx8TKm7xAzUU7InP/6cFtaR01ksbwC5hImA3A+kQvr5w==
X-Gm-Message-State: AOJu0YwwDqgjEazGo3cV7MedB9p1K/KqTwMZyTJfPeDKoJbQcsyLPac7
	7lxPbMhy5t+iiKErEtBuZFbaK0YIKtGDx/IH/r1EimFdw4KYauKQFTjfu2KIilztLnmzTngAN2a
	NqqCFTWKL9e9SE2Dnm+JL4gnRUGrbF5iKe0lHgMlmzrIDBm3K7dzy7Z5fbwpusZo=
X-Received: by 2002:a05:600c:198f:b0:412:6d41:920d with SMTP id t15-20020a05600c198f00b004126d41920dmr434589wmq.38.1708389280277;
        Mon, 19 Feb 2024 16:34:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGscKC/h+165pWPIQGiFVK1k+j+cPntLp690DOup1A66feMphWpMObuy7g/A9wibrQFwsUJhA==
X-Received: by 2002:a05:600c:198f:b0:412:6d41:920d with SMTP id t15-20020a05600c198f00b004126d41920dmr434581wmq.38.1708389279984;
        Mon, 19 Feb 2024 16:34:39 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l12-20020a05600c4f0c00b004122b7a680dsm12803198wmq.21.2024.02.19.16.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 16:34:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	sparclinux@vger.kernel.org
Subject: [PATCH] sparc: Fix undefined reference to fb_is_primary_device
Date: Tue, 20 Feb 2024 01:34:30 +0100
Message-ID: <20240220003433.3316148-1-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Commit 55bffc8170bb ("fbdev: Split frame buffer support in FB and FB_CORE
symbols") added a new FB_CORE Kconfig symbol, that can be enabled to only
have fbcon/VT and DRM fbdev emulation, but without support for any legacy
fbdev driver.

Unfortunately, it missed to change a CONFIG_FB in arch/sparc/Makefile and
that leads to the following linking error in some sparc64 configurations:

   sparc64-linux-ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_fb_registered':
>> fbcon.c:(.text+0x4f60): undefined reference to `fb_is_primary_device'

Fixes: 55bffc8170bb ("fbdev: Split frame buffer support in FB and FB_CORE symbols")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202401290306.IV8rhJ02-lkp@intel.com/
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

I don't have a sparc64 toolchain to test this patch, but I'm pretty sure
that this is the correct fix for the linking error reported by the robot.

 arch/sparc/video/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/video/Makefile b/arch/sparc/video/Makefile
index 6baddbd58e4d..d4d83f1702c6 100644
--- a/arch/sparc/video/Makefile
+++ b/arch/sparc/video/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-obj-$(CONFIG_FB) += fbdev.o
+obj-$(CONFIG_FB_CORE) += fbdev.o
-- 
2.43.0

