Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7266854913
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716276978; cv=none; b=t521+t6mDmEPkO4BmBleBn0NJlae89C1mOTqabzfH+VUTMkuRpowx9Pgp9FniaR8pjBqat/c+CuU6L2U1ws1nZiwqzmOzpktEUWDRr+Or2sMN8NZl8mrXPMr4szufZmPY+4YOSJ9lm8+YT0ncg8mpiHJ3R1mM9cOzXAyuQYpiJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716276978; c=relaxed/simple;
	bh=Lp6QUlnRg4frSNSGPMpQk806wK5jtOqtIVOAR3GIwak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhUT70TORwT+0Uwd5Pvdc9YAqGE1k2u6X1b2+Z9a8De1TyLLvXlV/FZ8jBLgJ0X1JQit9BCC0hv8C7KdK00DmFxf9v/5sX/g0WArh5IYE+G+Zl6asRuhwJmV/iVtjyhj9UipqMNaYa3LfldbTJJrxevo941Ck3Gc15q1UGc8sGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHFroQxX; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHFroQxX"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7e1b2daaaf9so200325139f.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 00:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716276976; x=1716881776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Dl5ySc+WxtcvHC4Er+YaOFPd7e8bDKfMPgSbVkgwhw=;
        b=BHFroQxXZsLRVLnXVwdg2XtPxQtc2noFeBUaHXFDKr+R9/Cz+9WgXcTzZLHp1NwsfE
         gxHna/nJUT3qUAss+oxaARIUPsSh3PcYUQD44F24GHoJYcgWSFMvQSZOX0kugMhCdeKs
         pT2NQCJzMuEyhLajkImiFtHyhzaxDJ/1vmBHllVjlc32Xh7rQP7lAR0wPsM25pOSuALn
         e0XHDrx20DIuKkw7LCm+m0cDg6eDE3vPASVzYQJTHxI+goz7iFofH1oZZb+efx0XKcXg
         pKFKCI3bD0hKs/Zxyn9xbzKHyJJXedUs7NPBlES7S7fOHSxHGea2e+R80P445En0VGWG
         rTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716276976; x=1716881776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Dl5ySc+WxtcvHC4Er+YaOFPd7e8bDKfMPgSbVkgwhw=;
        b=wFyxVZdNhh3yA+KJwBQPuDicpS6uM8p2qU01KxhFu4Uac03HaX9b4YKtwXXjl2fR1c
         lO+o6TA6SREGKqO5MZ2bfRZl9HKzTn8UERva/YasFTmF4gRBUb3xNdYf1S/K8BRdMalt
         crFE8Jh+0DJa2dXwKbDR5uypVYlW9uqUd/+yaTmFLEDxrAp2wNwi6vFZF2wkBddTbyqu
         ugepSEvkeaohUWHNaFFiN4rmNbPkjGkHBGv++jH2LtOZeA4WA0bl2xHpYsqJNixg/zCW
         P4Efey+SWuaYk1t/BQ1Biz6dt+Nc/gERWSasad/MVpoqJVA3si9Rn702007YUMOv8qVI
         WaOg==
X-Gm-Message-State: AOJu0Yxk3hvyG3PEcagCOgQ0uzsGXfXLX3XQjWyT1CZCrdWKMXtfFqqE
	hTLCmb1buVDtyIMFIT0QdJ2BJ+yaCWsIgo7PHhaVX2VHdB3iXrIA
X-Google-Smtp-Source: AGHT+IFwmLmePJQk0IrgSQXSbihuMd732SUW0OXKjlHJzTYnVdC3M6mVlq7v3hsCXAfgkf2YsRsJnQ==
X-Received: by 2002:a05:6e02:138f:b0:36d:a793:52a with SMTP id e9e14a558f8ab-36da7930e08mr327388635ab.25.1716276976577;
        Tue, 21 May 2024 00:36:16 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-48b9929f67bsm3242918173.9.2024.05.21.00.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 00:36:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: lkp@intel.com
Cc: oe-kbuild-all@lists.linux.dev,
	ukaszb@chromium.org,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 1/2] dyndbg: make __dynamic_func_call_cls_no_desc an expression
Date: Tue, 21 May 2024 01:36:08 -0600
Message-ID: <20240521073609.368036-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <202405210648.p6TPeHNf-lkp@intel.com>
References: <202405210648.p6TPeHNf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xe driver has XE_IOCTL_DBG macro which calls drm_dbg() from inside
an if (expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG
implements the call inside a do{}while(0) wrapper.

Fix it by changing __dynamic_func_call_cls_no_desc macro into an
expression, by replacing the do-while(0) with a ({ }) wrapper.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 19f959f9a6b4..7df67c4a917c 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -296,11 +296,11 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id))					\
 		func(__VA_ARGS__);					\
-} while (0)
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.45.1

