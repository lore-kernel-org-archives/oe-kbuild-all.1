Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DBD2E403
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 01:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718501139; cv=none; b=Ar/7PwRB8hs2qi7/lUaScvxP7t0hG9ISsdRawMkKAAGOcvd6T3XKN8w8WVtWn63zGXfIrGJGcMVDpe7p8Dk/Om0lHc8b1vToguNsRy7Yy3WZ2aPhZ4yCS5cyyoz4rn96gIgMLyoaEt1TXxCb2Jb8VzYosthYSZyDNIQfObd280w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718501139; c=relaxed/simple;
	bh=JHe8PmT8CAiOYlGo1cndu3zZ4OloPw3FeLHc2NnF29Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lxw55NrOMWvaJT3eNQXVYnDDhlEy5B8HPQ0uv7Hhtr5BNZGGjesprM79QZsswpOu88+FeOz+SwKO1BH+fnfdmETE3I5xmatitpZB6u/zieDCs0Xq60sIV+wDe0EgBeRYNy2Em/96t/eW82S9ue1y5nuO2+kMY2F7KwfjCUsszok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eiEDJCiz; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eiEDJCiz"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-797b24b8944so292179285a.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 18:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1718501136; x=1719105936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmh7B10VjitCXi5UnMX7IBHWWNFhALchrxl9IDbnSME=;
        b=eiEDJCizejo81BwpGYugLuCVw6LQSS1hLgjtfvA+xPw7GxJojbLFx5WolQeocMBg7F
         0zgEjHn9NKxdxiPsY3ZKunRE1q1z9yrzTd+X234y0t1iay/w/js88X+siXvtPTumdryQ
         PnKrvZsG4fqD7LYSicE+N187wI4V+5BwTuVKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718501136; x=1719105936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmh7B10VjitCXi5UnMX7IBHWWNFhALchrxl9IDbnSME=;
        b=MLCdnDwFRUTac22Js7Boc+8YFmWwV87eoOFLxiN/fRUiZjwL4KXA4IY4jbhZtJ2lkd
         rcXszA/055qM4G9bNYxaDM0QlAmibMSw7NSBAMWh25+kax8pKTTN2E05To2QDPsd0996
         gcZfa+Z2lWQuFKQD5b41q61KB/tGzlQ9Xe37bow/FYl20/XmTdsVIVQhrhCYd+VwU+s8
         yY8Udoxn9ekmO73RYQRSEtfI0BehY7ZArdbBsGAPUMLppQgFMrcKDIgUPg6wD9orGbav
         L1zhWTKvjv4S/ZLNsONUCb4fB3NSNA4+DMqYzyy6AYjxW3aFJNpJV/Tfw3X7yXaWSN9U
         RU/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuPf0DLv/iV+MachdjP4eBlE7KPX6fP7LHoMwEBziXWz4Xzi28vKFdff68/IILnIz5D0KIvJp0cJ693JKTlDr0Ovo61FFVpDN7Y0DqRg==
X-Gm-Message-State: AOJu0YwhCLByX0+fMpi6M5MRFOyNh9ztOD8xMMthr+VGM594teyaKOWX
	eHvZYzjQdg/AcuQ0P82YQ+uVJ7lpbqzSVnqiRc0cSXJfZnV4g4PhleoGNDmNQQ==
X-Google-Smtp-Source: AGHT+IF3o2n1vuAWzivHA2bQV4+Plh7YsZ6B36O+Td3GL1zNvsydHY+4muaeP2QpJFgYTbtdwi7YNA==
X-Received: by 2002:a05:622a:130a:b0:43a:b542:d1dd with SMTP id d75a77b69052e-44216af8850mr64153021cf.36.1718501136510;
        Sat, 15 Jun 2024 18:25:36 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441f310dae0sm32256121cf.97.2024.06.15.18.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 18:25:35 -0700 (PDT)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org,
	bp@alien8.de,
	bcm-kernel-feedback-list@broadcom.com,
	lkp@intel.com
Cc: zack.rusin@broadcom.com,
	dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	linux-iio@vger.kernel.org,
	jic23@kernel.org,
	lars@metafoo.de,
	nuno.sa@analog.com,
	dragos.bogdan@analog.com,
	anshulusr@gmail.com,
	andrea.collamati@gmail.com,
	oe-kbuild-all@lists.linux.dev,
	x86@kernel.org,
	Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: [PATCH 1/2] drm/vmwgfx: Fix missing HYPERVISOR_GUEST dependency
Date: Sat, 15 Jun 2024 18:25:10 -0700
Message-Id: <20240616012511.198243-1-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.4
In-Reply-To: <202406152104.FxakP1MB-lkp@intel.com>
References: <202406152104.FxakP1MB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VMWARE_HYPERCALL alternative will not work as intended without
VMware guest code initialization.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406152104.FxakP1MB-lkp@intel.com/
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
index faddae3d6ac2..6f1ac940cbae 100644
--- a/drivers/gpu/drm/vmwgfx/Kconfig
+++ b/drivers/gpu/drm/vmwgfx/Kconfig
@@ -2,7 +2,7 @@
 config DRM_VMWGFX
 	tristate "DRM driver for VMware Virtual GPU"
 	depends on DRM && PCI && MMU
-	depends on X86 || ARM64
+	depends on (X86 && HYPERVISOR_GUEST) || ARM64
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select MAPPING_DIRTY_HELPERS
-- 
2.39.4

