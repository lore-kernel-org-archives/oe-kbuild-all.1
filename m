Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB885F470
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708422880; cv=none; b=sRUK8GOVwPG8vS9WYduthTIDhRfq8EilW4HZHrnHUReEzaIPmRK4xAGj0gRErpBFbOyVAErh8e0DOHKXGmNWsYpRYMXepK+Nar2Ud/K3cyyP9kuAsRelKqeVDPZH4s+1BGxoIeaiUraF+HONE1dIhp7EBTmqTQF9dnx17Z4Tdws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708422880; c=relaxed/simple;
	bh=peQw3BQe60+8GuD9nJijD6XR4JghW7VvoUyslLSQVK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ganVhqr6HNKSn4Czc4YNe+RVvpp7ksZ/aLO9tw2mBnV8K9BnmcKBz9551DgmR4tT38rHd89Aq/x1TJf2LUeubTND1BrzLMs2Y8J3j2rzNjtu3H/cLfWGdWabhYMcD+N1osrGQqAJCvi+xdlvxKcSrARYrfWGZA8dfpbtf88ucRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hVIwfn2Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hVIwfn2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708422877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EYsCgQEb9/Kdo66E4LvnbORIVEe0BX1Dio1aMiZdh0w=;
	b=hVIwfn2YvA7OlsI67ME0ttdZNO6AIwX+LeYgVV41Lo77ErpM/Su/Jq2vFY8lMTLHk74frs
	6ggfa2RfA5GYibv+tFscS8B60KBn2uBCyu+udTFrexyt+m6E8P81sNPnAeBY1+kuAbROqy
	uhMqpEbfp9G0ylQx/17Danjf566Frzc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626--8yuMNYtPhKQGpWMInp6SA-1; Tue, 20 Feb 2024 04:54:36 -0500
X-MC-Unique: -8yuMNYtPhKQGpWMInp6SA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5113b77ff80so3652485e87.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 01:54:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708422871; x=1709027671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYsCgQEb9/Kdo66E4LvnbORIVEe0BX1Dio1aMiZdh0w=;
        b=gJ+bjb/HPKueQqc5JQ+pn14gq/aOlVVi0AFB1GAVLhoJf9k9bl+a3buSYX9mFt5RPz
         yrwED7sjQ151HohSx7pNQPugPXmE2+Jv77emXnVMDVYAUbK366tFbHMBm6li8MThF9ii
         Rrf/QE2Ni8drqZkIsxaEHuyKry4WnWHQEaWM35ooLIOYchkeQoOW3P4TS5Sq8lFM//60
         Qy9exbhPAttVLmUWII4vbaU1wziwEICjArH9ck0C36udosckNMahOZ/mhuZINO70bRk0
         JI04NJCZ2T6ngcdCh7q04Va+EiT68JDPib8b2p8VRCQqnxTGlX30bOJFApFYIwzelThd
         c5Nw==
X-Forwarded-Encrypted: i=1; AJvYcCULeO31ZVjdN4JRqbHGqi+OJsbnbEpzk3J0nSY1E/Zb+JELfZaVievpEvdVKFEp02zFMVadOtikO+Ex1VHM7eJsHl8eO1F2cqZzeWinMA==
X-Gm-Message-State: AOJu0Yw01duYfGdaTIg4IgsyuglB2gYv18DOAP6AiDcNTJmO0IXuMVB6
	lIr5fWctI04y0K/qEKCf+huYkP9GOf8o10JPKeWhOpcDIvjX3xtkMCN9k5xE53IcrNXpZ90Fst3
	3gr/bOt43Flo6pXiJEb1HAGbTGPBNMMExIKxvlOvHKzS1zwxBqc4X+SD8hnpjwB8=
X-Received: by 2002:a05:6512:5d2:b0:511:a819:2c5d with SMTP id o18-20020a05651205d200b00511a8192c5dmr8362465lfo.28.1708422871326;
        Tue, 20 Feb 2024 01:54:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8fRzgqIWa5YVdSnomCIS6IrRbiiN2cG7VrVXeWQpTvBhTw4p6B+zLzNoWj2miSn7fcrbEVg==
X-Received: by 2002:a05:6512:5d2:b0:511:a819:2c5d with SMTP id o18-20020a05651205d200b00511a8192c5dmr8362454lfo.28.1708422871002;
        Tue, 20 Feb 2024 01:54:31 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c314700b004126170a23csm8120499wmo.7.2024.02.20.01.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:54:30 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>,
	Helge Deller <deller@gmx.de>,
	sparclinux@vger.kernel.org
Subject: [PATCH v2] sparc: Fix undefined reference to fb_is_primary_device
Date: Tue, 20 Feb 2024 10:54:12 +0100
Message-ID: <20240220095428.3341195-1-javierm@redhat.com>
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

Unfortunately, it missed to change the CONFIG_FB in arch/sparc makefiles,
which leads to the following linking error in some sparc64 configurations:

   sparc64-linux-ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_fb_registered':
>> fbcon.c:(.text+0x4f60): undefined reference to `fb_is_primary_device'

Fixes: 55bffc8170bb ("fbdev: Split frame buffer support in FB and FB_CORE symbols")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202401290306.IV8rhJ02-lkp@intel.com/
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---

I don't have a sparc64 toolchain to test this patch, but I'm pretty sure
that this is the correct fix for the linking error reported by the robot.

Changes in v2:
- Add collected tags.
- Also fix arch/sparc/Makefile (Thomas Zimmermann).

 arch/sparc/Makefile       | 2 +-
 arch/sparc/video/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
index 5f6035936131..2a03daa68f28 100644
--- a/arch/sparc/Makefile
+++ b/arch/sparc/Makefile
@@ -60,7 +60,7 @@ libs-y                 += arch/sparc/prom/
 libs-y                 += arch/sparc/lib/
 
 drivers-$(CONFIG_PM) += arch/sparc/power/
-drivers-$(CONFIG_FB) += arch/sparc/video/
+drivers-$(CONFIG_FB_CORE) += arch/sparc/video/
 
 boot := arch/sparc/boot
 
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

