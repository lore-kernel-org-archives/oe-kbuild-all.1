Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A0C3D411A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 15:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856098; cv=none; b=mpxmKLy/l+ZHSk10erJoUWxtkZ2jgT29CUV7mjFTeCFy1fwcWshnnGOAJ0HIiP4PJnOZ4I27vlNdgKSGdYO7xqCBdhw8/yNTgUbphJxnLKuFiQZZEBJwEO0uggRghsJ3ToI6YVHa9F3GlUF2XsQIdMpfwVJDXmEaQ87VN8WkJv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856098; c=relaxed/simple;
	bh=s4p6juCwQ475aHXTn+wYPeV0BPHhmlo0G++9AOmJWt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=inWIZXYpG/BRT+VSFIcHXhJvhcwPLyHEjb4UewhksSUScMHt+M2+j49SPM1CHfQGqxP2K0TS7vzWyg3rIjbjHOvWgZqmvkspoh8io96K40TEedjDdUCobUE8hCx2J/ucBi+Un2Gki/URwJ/D/kSaNuAuuQNjIaYxEsVBLEDzEjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDtdfUMy; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDtdfUMy"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-848761b5897so3274619b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Aug 2026 08:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785856097; x=1786460897; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4Qg2o+emc3m6rF47B2E/svsOXDIcQrkgOFSzKR4MaY=;
        b=mDtdfUMyuT6MlSdnBif0V1bHxHyf6TD3YzcRo8FXsSFb6XccZMD6giezSh9X1z+igx
         uwVdVbMIEKIXN2gyaHfKxbbxI/dKGUYNwf3v37vbj4tV2O8jjW8T+udgPsS8ZPxkLpWO
         NWtJclD/itsCmgPwpiDRj5Z5rFt9sgO6Ix4iaxtWhA9AwiBMCmZnHaA0fuJLqYS8Lj/G
         /V5oEfJH/jzLNMCT0BDRiM8Uy7ozaanjrjXd3gwAtEdlLxO8VX/SQ9vmbpzNbTo5ZtDR
         sXOBk44qztcpJ5VOLOKI/v6MEnABsOjCfoZCGDNwt3o/gLbvEYGqPSs6rXQd47zr63WT
         Xi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856097; x=1786460897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4Qg2o+emc3m6rF47B2E/svsOXDIcQrkgOFSzKR4MaY=;
        b=iWgsOKiJEZuASz7wgZaGUsuK4EE/ZNv1xJ0rqvcncTn0jXRY+NO2+AhusEPBCGx8nA
         d8SlIA6ngrjjF/GCic/4pcOA1ArNCbwTxVO+/QIWfHb9YNW4UT5HoBo08YBLMx0UHvdE
         QM+N7ZZoRHxsGrZgoVQfqVBRGnV9V38V2KfV86LW4qpVQLGWw+J2Yg17KerQ/ju37YuP
         udjHFM8uXDVXDGhp8piPQmKrw0OddOQHCXlJCj+zDO0MXPoDGpBwmWY9i/EiAvHBdb5g
         o5UTF5JLCwy5YhL5DRTfW24UxBmt7NXpEVzOO7g2UWypxUYeBu4dyUiBxxmVPSbZVieP
         xQqw==
X-Forwarded-Encrypted: i=1; AHgh+RqAtIP20OrEnkrh9axE5vtGgyuhE8HD0LzIRTNzTaMOSG9LLoeEZ2KlsairfNYjTqP8DuAINos72Xk4m/2n@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0kDy8YF+lqBpZBzO0AdYprgCf5/PskxjkYdSxbUUsqS31Q7OP
	O75eg2WXvNaWSvR4vxJ1NegvxYHOyTQjuS63VcCyrEU3UNfiXzXV5Ro=
X-Gm-Gg: AR+sD10I1nB/OtHIPLTSszNBMprxu1o3qYUMAt1rmZTOEuHrhdNt/ai/MpST6U4OEHH
	XBStj5TRlFAXlBcKD3Bmt+urx96+F7B1eV3yHpn8go0jhbbWjM+yGCJYqicYj7Ai7+zAKeJzyTC
	f31Fh3VoDng3X0T3JTdpUwSyyy2//zSebaGmGYBm+3QsOnmWqN/A4l301lQmeUrJ44qFKGjJzc4
	Ld04V0UCDyJydGnXnuT+3NpIuTwfGA8xwetZ9y0FNcQpcsjJ4R9eM2gtJYEWRb9xBSKpJkg1vVQ
	dpnbJKAIN7PYE82bwxr85E0+a1u2YvUVn/NFIcsRdAlk/H23CO0s0PuRIDO8uUHTgQaGAq9NL8Q
	an8szccnJU2EcDHIn1pmaewyk3MXqYFwi3eMi07oy94IdEoqEr1MbSp2I5BnUu9HmXSrZ0oq+VY
	r4xPADf4KSV60831PzBJxJ57Q8NNvEkZ0PqN5rEtCBs+OgWciisqf53OXgCdWhsWXxJU8L6xpib
	BQXiWD1K1NYOMGSKg1CVri6+1Cb6JY1c6vbpjvXRWDdbU43p/Z9ERM+2VUJAeMymDk5lg8YNPZO
	aNd/lKcLGTzZdRL0wC+jkOo=
X-Received: by 2002:a05:6a00:ad1:b0:845:4126:222b with SMTP id d2e1a72fcca58-84ee47d8768mr14159742b3a.28.1785856096851;
        Tue, 04 Aug 2026 08:08:16 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc41ca4dsm5420587b3a.52.2026.08.04.08.08.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 08:08:15 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] drm/meson: clean up KMS polling on register failure
Date: Wed,  5 Aug 2026 00:08:02 +0900
Message-ID: <20260804150802.45262-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260524160657.17802-1-mhun512@gmail.com>
References: <20260524160657.17802-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

meson_drv_bind_master() starts the KMS polling helper before registering
the DRM device. If drm_dev_register() fails, probe unwinds the IRQ and
DRM device without stopping the polling helper.

Call drm_kms_helper_poll_fini() on that failure path before freeing the
IRQ.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Avoid the unused uninstall_irq label reported by the kernel test robot.
- Link to v1: https://lore.kernel.org/r/20260524160657.17802-1-mhun512@gmail.com

 drivers/gpu/drm/meson/meson_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16..bcc36f2cdc 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -351,8 +351,10 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	platform_set_drvdata(pdev, priv);
 
 	ret = drm_dev_register(drm, 0);
-	if (ret)
+	if (ret) {
+		drm_kms_helper_poll_fini(drm);
 		goto uninstall_irq;
+	}
 
 	drm_client_setup(drm, NULL);
 
-- 
2.47.1
