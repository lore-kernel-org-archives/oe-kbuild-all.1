Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47AE3D3CFA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424331; cv=none; b=rateeP1RkvN03nXPoxjk/0xPvaQKEa87kjrqD8NmX5NclX4w0yy659UBxStdRF164ncGMxaCb7NenP+cLyOGOh2PrwUyVNAfUp1b3uJ54q7VRbGcOh0nQbbtdBHUZ/0zL+1TqgAr4KhMbtQdhL9wCaAPNpSHl01t/QlCSmI4Utw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424331; c=relaxed/simple;
	bh=vfrRQR+JpQYLSHtZyqbjbuFN1gFOZoHwi5oXGFGrSRw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jNs8oUQvaDcbRD4N7eYE0D7z276htN8aoBA9TpMhuS0lV+SryXHXdNY8KJisWhTjKyVBcTERp02fDlzen8MOg+gGvmjOxAlOlPOwwvv2WI9UVCMUzIfQah6W6DU/NtE27EgFQR+z2LqBjbM7D8+RdG47yu1Cq2RUd9A0nTYKfG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bLkuDNwY; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bLkuDNwY"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-829b8bb5173so1336604b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 10:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773424327; x=1774029127; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4NBAuTsPtZw2mEjZqDawFjkhVE0UFfzabotF/tS63ZE=;
        b=bLkuDNwYyOYWEATN2I344R/x9Gfu4lOKGmcdKY9PEfH5SSkFGUNeYyIoHtneITJ9hN
         qS20/12IciqxwD2jYHJDvaSDy9mPfNQ0r7OY1tO8KymeswYC+cB/MPX4w+eIFvrt00NL
         fExTsl1A4NXwA0B/t5OLM/JtP0nn3BB9qcbij7cHw+si/2GDD2I8qeolFCxOsnu7wQqY
         UrMRnmOpQGLrIpTGZwgaxr+WAnP870Q86gDFFSGX4agjE0avDXTqIZP5/ZgDmNss7OM/
         IimMa2E/ttCDR8N5JAblaaPzzTMxGUcx8TBG9Qr4WNHagUrAYBNtHSLfFoNgmYIG0Qio
         UF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773424327; x=1774029127;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NBAuTsPtZw2mEjZqDawFjkhVE0UFfzabotF/tS63ZE=;
        b=ODT8e7rvSGTHD/oljnqFLuQkL2WcaoNWRxy8WdTYocmUawhcGaT0U1T0y3zjwu6kFP
         vr+GAEP2ENiOkrrPsp5vevLvCf4wSfHbDOXo83E6GKVCDKl986AdBP7X9+M8VHKu9Dmw
         fHX28cu3lF2a3rI2udm3vLMUFgIrqLoFc4X66rr2chNjIkiXQG1gSJWEHuX20UCbDVaC
         N+HldUbmqjOajJ4y3pEnlV5fNGZef3MEewZ3HAliJpjRcnnhUhfcIkZMx7MD90/KIJG4
         emK3y3pLgWQuAZoryMFzLQBddQP9LlkpXqrBwz74608nvnAxFeC+ic0Hiud9zjo5pp3S
         KN1A==
X-Forwarded-Encrypted: i=1; AJvYcCVvJOiDioFnqVZoMoXY7OVic+iAGwlSz4fZZzf7a9S5AzKkgEsS4luaRONbMYKXD9GOoNJDelzzMPt1Ouvy@lists.linux.dev
X-Gm-Message-State: AOJu0Yxiz9FHdkumMiran9SmhylxvtiK9olcI2KNKSVOTlH5AbHHuIWQ
	uHVibfxbqetq5CUvRJk8bLjw4Zf4eqi+t5THFxThOkBKTOHJHEt4U1WgJwkytKFUk9E1ByW+AA3
	BnwgozorU5/vA5wWzKA==
X-Received: from pfnp5.prod.google.com ([2002:aa7:8605:0:b0:829:7d34:ff8b])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:22c4:b0:827:3093:9026 with SMTP id d2e1a72fcca58-82a198fb819mr3435913b3a.48.1773424326549;
 Fri, 13 Mar 2026 10:52:06 -0700 (PDT)
Date: Fri, 13 Mar 2026 10:51:53 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260313175153.235681-1-tjmercier@google.com>
Subject: [PATCH] kernfs: Add missing documentation for kernfs_put_active's
 drop_supers argument
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org
Cc: lkp@intel.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	devel@driverdev.osuosl.org, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

The drop_supers argument was added to kernfs_put_active to control
whether the kernfs_supers_rwsem is temporarily dropped along with the
kernfs_rwsem, but no documentation was added for it.

Fixes: eea5d2bb34ba ("kernfs: Send IN_DELETE_SELF and IN_IGNORED")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603130112.2FcCzv1g-lkp@intel.com/
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 fs/kernfs/dir.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 715b651e35a0..7f355316704c 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -481,6 +481,8 @@ void kernfs_put_active(struct kernfs_node *kn)
 /**
  * kernfs_drain - drain kernfs_node
  * @kn: kernfs_node to drain
+ * @drop_supers: Set to true if this function is called with the
+ *               kernfs_supers_rwsem locked.
  *
  * Drain existing usages and nuke all existing mmaps of @kn.  Multiple
  * removers may invoke this function concurrently on @kn and all will

base-commit: e7ccc9e054beb4c366228d24786f67c738206605
-- 
2.53.0.851.ga537e3e6e9-goog

