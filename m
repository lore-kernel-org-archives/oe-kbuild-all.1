Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D5280B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 12:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632592; cv=none; b=I9EDxxmck/G9iu70Pj7+eNqVPIg803Vb6M1W5CX/cjt3EXSDEg1ZJJII7qfINX51sDz2n+x6iSwx42xLcTJpG/wMtiEX/A8jrIAEbg30CZTgnzsi2ypfXKWjKcuvjtKrnjr2fmWMX2FTTUvAuMRBge0xsWbu+4aePZzc+dyrfd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632592; c=relaxed/simple;
	bh=AnZECDH63/Sx09OClwV5T1VAh2M07OMoa79dpLKTWJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LI/SOvR3pegUeS8tVuy2IOiURqleCP78pl+wG79mSm7axXbbC7iUuW+X+om/PgBaHsuI0KlGIz3Y0oWwCHN4DOTb5eMRtIN16sHQR9LoR3MNxCmdN0Zd3X8pL77U76OJrtJky6NQywjvgHkzmWSM17y75m+WD5zPJIGTjVQfuvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Writ673D; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Writ673D"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so34340015e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 05:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744632589; x=1745237389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zE3/vIaDDm49Ow0awT1xfzab8Kaog4yG+YjbBkNm2n8=;
        b=Writ673DdgheYoA5LkV8qrRAlSpthdUjijEDTyVaYIlzObP94EW77i3ftvtFiX881c
         959o5lt6KqMTuIaovCfFN3yBFHS/E+C+GV2dcwwjig9EiDbCgUmsNAtLscxpEytJb9op
         fvbM/FUYZ9OEClHcA+pDn7Z1m1JwXjlxs/yf1nz4n8YTLdxNmDE3Oc2TmZLXe+bPUnEf
         UHHAK8h2IogK9D8pBtA9ELwieeyy9OfQwqiQWrSq1HqCz5Xary4VBkbsawtYs5otFD7h
         7UlelPb2sPgO5C6KONwyRrZxsmxwqUbtwQDps797oMTWSrSkb6BpNPLmW+6rgAXCFUxr
         w++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744632589; x=1745237389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zE3/vIaDDm49Ow0awT1xfzab8Kaog4yG+YjbBkNm2n8=;
        b=AWRr7/J6UycQ+DA+bKKLC7Aa2uCvyjnh+JiboGjUarsX9lpqssvpNVOTYacLv8FtBm
         DKu8FePX6BvO9r+OPO6OLMnDmJomri9Sv/Ck1Jjul4+ciQ0AwwrP/2sINXXeaEjS0d90
         DEzMh1blupZV5KHvb897KPtIU7Dyzk7RrLjuCApcrew0b9vyaeAukNZChG+1Z7i5SG1C
         rcT3vPk5p1tpEKOFKoILkZHorKDRPntqY/IC+swt1KDi1nRbhPn9vLPDMCeIgjw0jm4a
         sWMy00mSB1tHbtP8++s7vl+oTh+1xYbg42d0dQ4E8QJJXTi+2LVSlUlHZRn6ree34BfA
         xyOw==
X-Forwarded-Encrypted: i=1; AJvYcCUKv5ebOYE/+nHY8hqTfncNIGqc/uAMGGlUpcQkrGcsvn71uPsYSKW0ltLS02+9QlVlo443bUGTA7AmlffO@lists.linux.dev
X-Gm-Message-State: AOJu0YzBPsMlTFeyVv/u/ofr9s+hbe1LxFEM0IQLsWcMsoxZQGoM0TrA
	bTyJxu3v52QiPtLB/BzdeNvinpHudjESsOZa/UTG6aWqDpGwh4NcF/tFMpmexs8=
X-Gm-Gg: ASbGnctfvNG8wSLfr/cxhK/H3LAuKS7X28Qup6M/+sLiLdOjbA04Lkb/KOm5WyJsK7o
	3Y428poIEocer4eJ0ncdfipC05Ann+HHUOKNkN75pvywEhgYpEPu8OFoklXDe/xfSEOocI9EbnW
	kdnkd22Zu3KHqGNvINHH+rtr5OyFtJtf5/kspGCP/eL/d52krzg7/BltGgNsx+bXtf2W/vV0dwJ
	743M0dCH0JCyfQ1YXNJcjazLLqvaWo7SW/0G1CXUHJpnoVUSyBisYofdc1YURq38/OHllkM8c4a
	Sak4k/LTqql8EZdYbIQzq7XuO2lk
X-Google-Smtp-Source: AGHT+IFNxS0Xit/RMmUSHhm4BTUKEcgXGGkLi80tu1FflJzbof+IkBnb8Wny7dyxa/mkRZ1Jg7nFRw==
X-Received: by 2002:a05:600c:1da1:b0:43c:fb5b:84d8 with SMTP id 5b1f17b1804b1-43f3a95de2cmr125882165e9.16.1744632589124;
        Mon, 14 Apr 2025 05:09:49 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2c46sm174308315e9.13.2025.04.14.05.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:09:48 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	conor.dooley@microchip.com,
	oe-kbuild-all@lists.linux.dev,
	charlie@rivosinc.com,
	samuel.holland@sifive.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: Provide all alternative macros all the time
Date: Mon, 14 Apr 2025 14:09:48 +0200
Message-ID: <20250414120947.135173-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to provide all six forms of the alternative macros
(ALTERNATIVE, ALTERNATIVE_2, _ALTERNATIVE_CFG, _ALTERNATIVE_CFG_2,
__ALTERNATIVE_CFG, __ALTERNATIVE_CFG_2) for all four cases derived
from the two ifdefs (RISCV_ALTERNATIVE, __ASSEMBLY__) in order to
ensure all configs can compile. Define this missing ones and ensure
all are defined to consume all parameters passed.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504130710.3IKz6Ibs-lkp@intel.com/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/alternative-macros.h | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 721ec275ce57..231d777d936c 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -115,24 +115,19 @@
 	\old_c
 .endm
 
-#define _ALTERNATIVE_CFG(old_c, ...)	\
-	ALTERNATIVE_CFG old_c
-
-#define _ALTERNATIVE_CFG_2(old_c, ...)	\
-	ALTERNATIVE_CFG old_c
+#define __ALTERNATIVE_CFG(old_c, ...)		ALTERNATIVE_CFG old_c
+#define __ALTERNATIVE_CFG_2(old_c, ...)		ALTERNATIVE_CFG old_c
 
 #else /* !__ASSEMBLY__ */
 
-#define __ALTERNATIVE_CFG(old_c)	\
-	old_c "\n"
+#define __ALTERNATIVE_CFG(old_c, ...)		old_c "\n"
+#define __ALTERNATIVE_CFG_2(old_c, ...)		old_c "\n"
 
-#define _ALTERNATIVE_CFG(old_c, ...)	\
-	__ALTERNATIVE_CFG(old_c)
+#endif /* __ASSEMBLY__ */
 
-#define _ALTERNATIVE_CFG_2(old_c, ...)	\
-	__ALTERNATIVE_CFG(old_c)
+#define _ALTERNATIVE_CFG(old_c, ...)		__ALTERNATIVE_CFG(old_c)
+#define _ALTERNATIVE_CFG_2(old_c, ...)		__ALTERNATIVE_CFG_2(old_c)
 
-#endif /* __ASSEMBLY__ */
 #endif /* CONFIG_RISCV_ALTERNATIVE */
 
 /*
-- 
2.49.0

