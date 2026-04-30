Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ACD39F17E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 22:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777588845; cv=none; b=Iozg69NQDH2ZD/EVAu//k/raBIs12hBsWIeqOaWBkZRn/sMKbaL9kBNZtva3scnbgOfEQxbBWlsnDNfee/K3y2wDRO/wwAGsp4V7Wgn3FzfLJpoFKI5JJKF5ZXYvULW1mNj/n2/Zl2BPwhfz1iXzU6VXgZ8og4HUlvINq9WtpIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777588845; c=relaxed/simple;
	bh=V406TqVoKHgAuicekRKpsJmx5/5UDrii8AdfdX/zISw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nV52Ievd2pSAcG3rI5jEgnlgb9nhBzSjf4syPdiH/FvpPJeW0q8LR7sL2sT5PwOhgNSH5hVBv4PXYxz2TypWM44atZYY3/lLXjb1uQCBE15pflDyZTL2Smd6xc8X0ARUV89Tt5eyzDNiFLKhQGqQp9tGzTC34Ei/rpiUmSDu6iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cis2bmaL; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cis2bmaL"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c156c4a9efso2846238eec.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 15:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777588843; x=1778193643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rIQVUIY7rOHf6FAYreUm24KryRFVFOuXAkyabTl3TY=;
        b=Cis2bmaLlibc+6Bc9BhJAXpmXV/uhTinwOqdIdiDPExjh8IgzGbhGTk2hms0X0OnUU
         MUapD3ApUjvHnY12/shnHlncsB4RVgvDjP9FO/ffbEmDQppjJPQBN8xb2vGp0o5gW5L9
         r80xPzmyONf1pqrvRRIbytUieoxyeDvCyijgHMaZRO2j1VQmpNWC4mzb5spd9NdTllTB
         BcNiySoiMV/AN8wf6QvupaZD/R9Vs8XjDjzowclNR7IYteJAxrBTTh6qcJs0LXozFc6O
         N2zDlH2XNTsfjfKE0cTGlozEip7FXbkbt8KDquGgMbndjRphCepyoz1Re/LiLf4mPE6/
         AH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777588843; x=1778193643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/rIQVUIY7rOHf6FAYreUm24KryRFVFOuXAkyabTl3TY=;
        b=LrGj977xPrJfliLVp/xNa4OMjeNnkwx5vDavhDVcua+yo2/WJMY70qqIv6CuKc2Ok4
         X/2tb7EEip0ilTzwGshDmEKWfsiX4mAWVQYkqXkfiCKktyeEWTr+g9XmXSvjBLU0YEAJ
         woA8gUZfUMn6fj8p4qzO10ybpOh83FbVaXQargNrelXLvNbfLZhufM/w49E8vyixix0b
         b9eAahn8umRWsjuPmWTs+rOZ69LHoLiRFuEaf4p9kEj/CzVEK7fd1KyZcjapYo1Iahs6
         XpZSA5vM3yYvF9f5tDUpzQy5O8aoTaCUFpV0vtaIL5WIW7YRiTBWR6Q3wVowf05YAtbh
         fpDw==
X-Forwarded-Encrypted: i=1; AFNElJ+3yPnp+eksJjXz5gMfEA53jvsCWV1BclM67lbK7D59cq9JFzC/zlHWkw2+SHr+ALceYYlngy0CHB/lko3U@lists.linux.dev
X-Gm-Message-State: AOJu0YyM5YYyMxgTUQGAPyCfhAGgIfBFnOsyjvOGyINR6U3AeoR0h/yT
	bcyV9G7cmaHPjYUqJ2xqbL6xUs2t9ABRWbTrewXhZK0h3/aaurGrPJwy
X-Gm-Gg: AeBDievU6xmU2VcnRBamJELdoOF831HDC+Rm7qpI3KjytWzMPdUbCN+kSFfLwsZp4Ms
	N4ejHzP0BzAmsvmsN876aZsHADe3KWVKqSJRoHV5hLoHaDXG4uTj+a9q6qZS7C/zIUlXZGWQkH7
	Dth5uY8OhH51YVq31L0T9R4EcaHUtHWo27TuSOfxcXqT+1Vtydqm0J7v2Dnj24CInSpAE1ysqoO
	Anvv0PP50MGP2OJn9O2KJ9ZaZsQlPAvMeNxlHG2Ex3+uXG8q5OXjZcWqmRcZjH2NUxAYB2qjj6R
	l0iUT+Rt0olSsymHkdogmATT461pe4QeMxGQja7xXLV+SkE5fKsXhtAf2CEnDSzkdYwDNxexFih
	NkxpUzhcgS8s6hHu4LoWU4FookINoxhccys4qDBTAw4KUyjnkLMx/ZpDreR3R2dyVV+m+ZyYHU0
	+7xrWkivzT45RaRypyj+BeXpYa7gc1mqBCfHBA
X-Received: by 2002:a05:7300:5341:b0:2d9:77e1:57d4 with SMTP id 5a478bee46e88-2ed3e489086mr2332993eec.29.1777588842546;
        Thu, 30 Apr 2026 15:40:42 -0700 (PDT)
Received: from sergio-82n7 ([169.150.198.75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b11fsm1906281eec.19.2026.04.30.15.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:40:41 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: lkp@intel.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	sergiomelas@gmail.com
Subject: [PATCH] hwmon: (yogafan) fix non-kernel-doc header warning
Date: Fri,  1 May 2026 06:40:22 +0800
Message-ID: <20260430224022.34424-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <202604301429.UUK5MS9i-lkp@intel.com>
References: <202604301429.UUK5MS9i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring.

This driver provides fan speed monitoring for Lenovo Yoga, Legion, and
IdeaPad laptops by interfacing with the Embedded Controller (EC) via ACPI.

The current header comment starts with '/**', which is reserved for
kernel-doc, this triggers a warning so we update it starting to '/*'
to avoid the compile warning.

Fixes: c67c248ca406 ("hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604301429.UUK5MS9i-lkp@intel.com/
Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
v11.1:
  - Fix comment header to resolve 0-day robot warning.
v11:
  - Mapped ACPI paths directly via DMI quirks.
  - Fixed Documentation formatting (0-day robot warnings).
  - Implemented 100ms MIN_SAMPLING to address rapid polling concerns.
  - Removed redundant platform_set_drvdata() in probe.
  - Explicitly defined platform device ID as -1 for cleaner sysfs naming.
v9/10:
  - Implement ACPI handle resolution during probe for better performance (O(1) read).
  - Add MODULE_DEVICE_TABLE(dmi, ...) to enable module autoloading.
  - Refine RLLag filter documentation and suspend/resume logic.
  - Include comprehensive EC architecture research database (8-bit vs 16-bit).
  - Validated efficiency on kernels 6.18, 6.19, and 7.0-rc5: 'perf top' 
    confirms negligible CPU overhead (<0.01%) during active polling.
v8:
  - Replaced heuristic multiplier with deterministic DMI Quirk Table.
  - Added 'depends on DMI' to Kconfig.
  - Verified FOPTD model (1000ms TAU / 1500 RPM/s slew) against hardware traces.
  - Increased filter precision to 12-bit fixed-point.
v7:
  - Fixed Kconfig: Removed non-existent 'select MATH64'.
  - Fixed unused macro: Utilized RPM_FLOOR_LIMIT to implement an
    immediate 0-RPM bypass in the filter.
  - Clarification: Previous "unified structure" comment meant that all
    6 files (driver, docs, metadata) are now in this single atomic patch.
v6:
  - Unified patch structure (6 files changed).
  - Verified FOPTD (First-Order Plus Time Delay) model against hardware
      traces (Yoga 14c) to ensure physical accuracy of the 1000ms time constant.
  - Fixed a rounding stall: added a +/- 1 RPM floor to the step calculation
    to ensure convergence even at high polling frequencies.
  - Set MAX_SLEW_RPM_S to 1500 to match physical motor inertia.
  - Documentation: Updated to clarify 100-RPM hardware step resolution.
  - 32-bit safety: Implemented div64_s64 for coefficient precision.
v5:
  - Fixed 32-bit build failures by using div64_s64 for 64-bit division.
  - Extracted magic numbers into constants (RPM_UNIT_THRESHOLD, etc.).
  - Fixed filter stall by ensuring a minimum slew limit (limit = 1).
  - Refined RPM floor logic to trigger only when hardware reports 0 RPM.
  - Resolved 255/256 unit-jump bug by adjusting heuristic thresholds.
v4:
  - Rebased on groeck/hwmon-next branch for clean application.
  - Corrected alphabetical sorting in Kconfig and Makefile.
  - Technical Validation & FOPTD Verification:
    - Implemented RLLag (Rate-Limited Lag) first-order modeling.
    - Used 10-bit fixed-point math for alpha calculation to avoid
      floating point overhead in the kernel.
    - Added 5000ms filter reset for resume/long-polling sanitation.
v3:
  - Added MAINTAINERS entry and full Documentation/hwmon/yogafan.rst.
  - Fixed integer overflow in filter math.
  - Added support for secondary fan paths (FA2S) for Legion laptops.
v2:
  - Migrated from background worker to passive multirate filtering.
  - Implemented dt-based scaling to maximize CPU sleep states.
  - Restricted driver to Lenovo hardware via DMI matching.
v1:
  - Initial submission with basic ACPI fan path support.
---
 drivers/hwmon/yogafan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 605cc928f..314ee6195 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
  *
  * Provides fan speed monitoring for Lenovo Yoga, Legion, and IdeaPad
-- 
2.53.0

