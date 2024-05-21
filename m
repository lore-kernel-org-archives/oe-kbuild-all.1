Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F495490A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716276979; cv=none; b=EbjtkXIpURksLj5TH1kFXI5uaa7cTgBT+xV8fS/rTrqWXlN0Em9G5QNs2ME9nGdbLup9q2N94sA3skcmylfoVN4dyQpXp8cSG9XHdP7s0/vLNAIqb30acUv9mhWSuiPECbNMWS0EI+ovapqyZrcHHyzItsNG4RKn9fxjuJrs/Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716276979; c=relaxed/simple;
	bh=WD2EzOL/VSZLgBKtjIN2tu3vmYbgvjdS0/xP3G34Y1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+Ymo8A/v3nZ27Ht4BVHyha7IdritxBLafvdsczpRgYGssh2vsl9Tlw8kPOtVxMDcyZfBK4ZoUEdSwMPRSuoaKgc+9/a7+lM0+JFgjCg+OphHk9G93VBSTd0pGktIDDrZdJwCJPqqov8ZokIaMJe/ybwvxIo8voTPT9h5q41Dr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftDGoWZ4; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftDGoWZ4"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-36c7004daecso14180505ab.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716276977; x=1716881777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkjdQXHTQiwAt72d12+ctB4FMmdpTUKMsUYyBrjcNUk=;
        b=ftDGoWZ4Z95Jf1deHd201XlObNunqF5hPl/7tape2P2hDwKXZGR2jQjPb4up7M/Ren
         bnvvo5OSvtIZZn9+MWa+XVAml7bcferpNyRjn9dtNjF0GHMPe7InyxmAdmeLDiiOzv2e
         hw3Mb/CyQaFEippPgOiOvlIc7GCs/a8CmVo+Cb2Uob3XTS/KnbdRuESmijimSkp6GomN
         WdD7GH25oQV5uPFBKv1zAzdTr6GzaWCZSw5weTbJgL7Nxxx6YUrfC6SheWfbcJ//mkN7
         Av4k1S6MRYDUyoJJG2FBCTEqd7IZrN2uf/n794volTF1eO4QgeMmuyW2oe6Xx5jiXb4B
         b0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716276977; x=1716881777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkjdQXHTQiwAt72d12+ctB4FMmdpTUKMsUYyBrjcNUk=;
        b=kcRasyhCWym0Wu0QeuXTS6aWU/EtUd03tjQpQGrbcXQvufyPar7EQXz8kMDqkm9tx8
         AuB2GNLh886ccrt21QYiRyvEA/ratwofTqtvaZTXei10q9U+bDJgVj1ZBVJjSaQZ5qkr
         ex2sW4U6akij4T0aiSnvh1M33/M8BJIhffySdykdyK8fcF+0AETfbeD3Nhp2ODzjeWho
         y4pWogpmdoD6O1aGBCoc4u7/+GP4eMGlpNbPsoDjBrnKVZkUmS3w3+REIP10/1yDHgR1
         vub1hUkbeHeaFtcJsex6pcUcSGSjFTYQkJb2cjeOwqRzZZWzw2jawZ2oSi7Q59+qBbWM
         GmdQ==
X-Gm-Message-State: AOJu0Yys4IECSBro0yUx0QXDBPfuytpFAPRtOTm36EwOUCR0Q2mWyBjK
	WhGlp//bBOkjp0fOjAgbOc5cCLirvVrXc5tEe5pd7nCPb16zuGqy
X-Google-Smtp-Source: AGHT+IHFWNjE0Nf1yI9SYMAlmQHVvG5voHG0Jf5llvQjxjzb9Z/oWUMkKoMUDUGK6XOmGApUvJsypQ==
X-Received: by 2002:a05:6e02:1a64:b0:36c:4ca4:2871 with SMTP id e9e14a558f8ab-36dd0adfeafmr79811225ab.4.1716276977703;
        Tue, 21 May 2024 00:36:17 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-48b9929f67bsm3242918173.9.2024.05.21.00.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 00:36:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: lkp@intel.com
Cc: oe-kbuild-all@lists.linux.dev,
	ukaszb@chromium.org,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 2/2] drm-xe: add DYNDBG_CLASSMAP_USE to Xe driver
Date: Tue, 21 May 2024 01:36:09 -0600
Message-ID: <20240521073609.368036-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521073609.368036-1-jim.cromie@gmail.com>
References: <202405210648.p6TPeHNf-lkp@intel.com>
 <20240521073609.368036-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Invoke DYNDBG_CLASSMAP_USE from xe_drm_client.c.  When built with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, all the drm_dbg_*() calls are
implemented by dyndbg with JUMP_LABELS, and it needs to be authorized
to adjust the callsites via drm.debug

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 87c10bd7958b..c61163d0d945 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -15,6 +15,8 @@
 #include "xe_drm_client.h"
 #include "xe_trace.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /**
  * xe_drm_client_alloc() - Allocate drm client
  * @void: No arg
-- 
2.45.1

