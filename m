Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434C822F75D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180544; cv=none; b=C9Vy/54UkdA4r+ktszngYoAcBUuFmQ4r/BGO0fSdhtUyWO1mWWaIf7k3R/VOU1c1kSEytKn6nSdEZuyNxoCz5iffCs66Ad0hCP9lMpvLqllWzvUccmrxwwqFh6Ie/cUYKqihLWcLUACBoG6WkzcAvhUhOgF/Y7RzrTlVbNI29gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180544; c=relaxed/simple;
	bh=G/yQbTWKw5+TnbyriGPn4AE4fOGUPbORB3d2ncVsOCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ue7LDLOuPLplOItDm6f5CRA8ZVz4z1iAqRfNmpApNsdcfBQVveD9ncPLb6GKc3RPsb14fm5qbVYEBmPmy/HU8p05I1Gv5YtT8xmSGOnDcNOKBdpOrwuJvtsTFlsNu7Pm1YhmRPP44ADGjBp4Vdd6leJyVqGCY3dCsJ9ScfmiYsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZV+iOyQj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZV+iOyQj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso16886085e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 02 May 2025 03:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746180540; x=1746785340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1gpbxUH5zKXlvd7Jg421zxuNqN0FwJbinQ6smtKhC/c=;
        b=ZV+iOyQjPu9/fsLxdpbutIBgTsyd3Q9AZEALYeQv1v1P5jPH3H04lSlGHF/zHVRIb8
         3GgqgLRZjPBiXLcRBaUkoyXWAT0xLFplmCjw77QvP/0JIhBfL+/VidYuOH0D9qfzbGLa
         sjw5ibm4/stvqIMClL+0U0A8S5haNIz0aRtAEzfCl307tAfP+odiSARk2MOdsmTHQFzJ
         MBmFZUWmOVzIoWhxoviKQtgv2GKIJUVDVxvvr7hvWabGoUSkmFs1yTo8vEOFYB/Qzzsy
         /0fNKTeQxTfQ/z0DTJbHdwxzrKed1+I/4Z9IZGf4iXSlFVph78++1KuAYWkWt9efQneA
         9K5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180540; x=1746785340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gpbxUH5zKXlvd7Jg421zxuNqN0FwJbinQ6smtKhC/c=;
        b=k3Mzo2PEn/7rDLzsKyoMgZW3uJ4NsR1Qo1agQBl8C+a7kpkz8HgMR6Dg0k8Ijv63iq
         bT3ee5DqPD4Ju7Tr/HSC+roJ0l03E6J5Q1kUG4exMrd+LDPoJbPIMpmQtu+Mvsn0czJ1
         PAvbOy7WeTe4xilj7ebqVh9esf9ANSTAW28AY/Q5SyYUKV4Zh3ttCObql7XOB4Diu6RS
         duqrjNwKNcgSWB1NTM37/QEmbhJguCFV2QnZScW9X03O1RV3GOrFAKGyB++v/VQNeZ25
         mwhfXYdzgnr4COiZTV6SD/HBwP8RRk3yLUVlizW2HgBE49+V5Ct+eBZrZBYl4xyEOOYP
         lbcQ==
X-Gm-Message-State: AOJu0YzszU9JaxU5KJvKn0d2sWarUzZb68CaObMXBg6EbU+DmaTSvWqO
	Cg/aAMbDcMjbGqwELBSBSY+DlNDPcujO9jedNcVce/6Rsbe12OpPsEtkdiF1GrU=
X-Gm-Gg: ASbGncsUjYcUuCPrbEvVB2yakPZg6a23doEeMEtMcIWhYP8My5xGzzWzDNbMFTkfnk8
	+4Wy0xQtu8XBNs8/nembOepUHfdmSwaR/RkmZJzhEUhOcuZD7TWMu1dn02XNDGfqE76lLsHpkR9
	4DlPxTGU/NW19mu+vEs+LbZfhD8lJubkIcoH3Tl/kgzxkw7a7MXzN+3qtkGOzXEvmZEGcta06Nq
	0W+P90mfIWA4TZHoiHVL0raEfcoOSdN3BRxZcA+7q0le1vuwIAL3Ep9FCIjhy4mnRd5Ta68zhXy
	zeNWkTAMYDNr58plB30n9mqOpxxL2K8EUlT1hzp8mg==
X-Google-Smtp-Source: AGHT+IE47vfNWr5eva9bcWEHLRezwNUBG4506xXlFZEBT+W4RLMrhKjqpzQGXO7HfBEF3Nn5qo8n3Q==
X-Received: by 2002:a05:600c:348b:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-441bbf31f09mr16912665e9.25.1746180540381;
        Fri, 02 May 2025 03:09:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ee39esm39361045e9.21.2025.05.02.03.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:09:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: at91: drop unneeded dependency on OF_GPIO
Date: Fri,  2 May 2025 12:08:41 +0200
Message-ID: <20250502100841.113091-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver does not use any symbols from gpiolib-of.c. There's no
reason for it to select OF_GPIO directly. This addresses a kismet issue
reported by the build bot.

Fixes: 8e86af65f39d ("pinctrl: at91: allow building the module with COMPILE_TEST=y")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505010447.kUlI61vt-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index db84d80b7e7d3..33db9104df178 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -107,7 +107,6 @@ config PINCTRL_AT91
 	select PINMUX
 	select PINCONF
 	select GPIOLIB
-	select OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to enable the at91 pinctrl driver
-- 
2.45.2

