Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E76EA31
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 20:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725825697; cv=none; b=UXJy4TTmNxq4lkg7CREkrDPtf6zw/IeIvJdqZ0MMwmhd8U0RFZOdrJ7anEFRTvFyezX80XX7SvmECAn+Ci3ULTSlMGP+S/Ufhz0DRl3PhEPM0oNfHnoPwxS+wdEqll2Exd9I4dyKz8IiCrkNei5GaJaaFA49NtjSnLTyx9UflB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725825697; c=relaxed/simple;
	bh=2D+UcsbTQm0Pl1w0qPJN3RzMlbN2lpXc/QcHAp0lQUc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ndJSF47kLmVBNA9vZ+XszJdiu2i1Jhoac8vlt/4nw4hIN+0F8s3x5xLuEeiDAmh1ARHqvZfU2E7cFBferT18ejU1iqYnmanza+3Xj5AN9Q3oaOVxvBjf7MAmR7ZyDqKLinw9n7hic98hMFZbGnN36XiJfw6HLb496Id5MREBAcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uAUSPxnw; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uAUSPxnw"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-a8a87c7c719so82136766b.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 08 Sep 2024 13:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725825694; x=1726430494; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ug9eaffYhqFA0PC6wFkjKlxNmNfpvwkr9YdUbFvwzDk=;
        b=uAUSPxnwA0HiIlR2TxwedzzGhz8VpvojcPs/mlyUR9sUOqkbilLZVLvDbBk3IeEwR6
         4b8QCOBsYojfpemQ04VsM6o1Q2fMr/Y5erq7YbLHrtgV6y8wP7P6iiT/kB93E/tKNDdB
         cZSUDevIoe2xSTFtydwkt59sxzk860Uar1taLpaLh7wyeTu3GHdodPIonft/tdR6/tfD
         QTfVAjOnhKzgF31KilPNubygYF7HeVUQuKtbAjZbCTy4qPkss3w6wlUA5Jdh2/CZvRIV
         WbV7glAQ2oidhMFXxfguNCqAqAoPQpCbD6M0C1mIp+VlDUMHnu3i3AhLU7lXEMzRsw0L
         CGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725825694; x=1726430494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ug9eaffYhqFA0PC6wFkjKlxNmNfpvwkr9YdUbFvwzDk=;
        b=QQED/8Yv2qJnxmDw6B90o/3jn8nokRCI6f7hKzne5OKrbPwqg8mZLByV4NWpMp3TNS
         0D1GeASn7RsZB54H8LteBjprMa5djUckVyaLYltZTP1TgH5i7tRGQQGjAasSE0B6OyN+
         g8uth6sias+AURaE26wRVOofACbGMxKc198LT3L9BlDJvN0sTEJCy+15q8w0HVNrtjvs
         aIEB6VoGsWs/wy522ZA1oLG8DYueKOaY+58hUHhWCqV7TlUmn9sZ5N7hU3BpEKndcyvz
         1dx/QNGtasIo5lT38FpBXlArdxehA5wm1+rHp4ABPeRczftmpugHkRFA/VlawgsXFwOK
         lJmA==
X-Forwarded-Encrypted: i=1; AJvYcCXdxWbab/Wr0p0dGgTZSkk+ehckjuB5B7hZMH/ycngyOfut6ztw1t3eh6KmCpMBpeY7lNqB2iCpeuQT9tlX@lists.linux.dev
X-Gm-Message-State: AOJu0YyvP+58RKD8WHYFl1Oj/b8qvOwdq6uZUxndE7//pX6HukYDNRv4
	EMUeZuAUqQslVfvbN9V84i6O+qWHeqTydrUbUVPdmIQzS30LCyr16hEFwtU5Lj/C9/6b/ce2fda
	prEUsJSOqMe4A3g==
X-Google-Smtp-Source: AGHT+IGWEAAdTqy9HWRfpr2zIqIHAZb3LmSQlUJJORnY3nPzO6xcvB7Sly7TPnE3cqwQKWdDXl5RBe1OUtFmtgo=
X-Received: from mmaslanka2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:b8d])
 (user=mmaslanka job=sendgmr) by 2002:a17:906:f14a:b0:a8a:8a31:c47f with SMTP
 id a640c23a62f3a-a8a8a31dc1bmr558966b.1.1725825693954; Sun, 08 Sep 2024
 13:01:33 -0700 (PDT)
Date: Sun,  8 Sep 2024 20:01:27 +0000
In-Reply-To: <202409090259.6vsS5Bni-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202409090259.6vsS5Bni-lkp@intel.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240908200127.1848844-1-mmaslanka@google.com>
Subject: [PATCH] platform/x86:intel/pmc: Encapsulate callbacks registration in
 CONFIG_X86_PM_TIMER check
From: Marek Maslanka <mmaslanka@google.com>
To: lkp@intel.com
Cc: daniel.lezcano@linaro.org, hdegoede@redhat.com, linux-mm@kvack.org, 
	mmaslanka@google.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Encapsulate the code that registers and unregisters the ACPI PM Timer
suspend/resume callback to checks that CONFIG_X86_PM_TIMER is enabled.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409090259.6vsS5Bni-lkp@intel.com/
Signed-off-by: Marek Maslanka <mmaslanka@google.com>
---
 drivers/platform/x86/intel/pmc/core.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 695804ca8de4..0c6392eeacee 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1215,6 +1215,7 @@ static bool pmc_core_is_pson_residency_enabled(struct pmc_dev *pmcdev)
 	return val == 1;
 }
 
+#ifdef CONFIG_X86_PM_TIMER
 /*
  * Enable or disable ACPI PM Timer
  *
@@ -1247,6 +1248,7 @@ static void pmc_core_acpi_pm_timer_suspend_resume(void *data, bool suspend)
 
 	pmcdev->enable_acpi_pm_timer_on_resume = suspend && enabled;
 }
+#endif
 
 static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 {
@@ -1443,9 +1445,11 @@ static int pmc_core_probe(struct platform_device *pdev)
 	struct pmc_dev *pmcdev;
 	const struct x86_cpu_id *cpu_id;
 	int (*core_init)(struct pmc_dev *pmcdev);
-	const struct pmc_reg_map *map;
 	struct pmc *primary_pmc;
 	int ret;
+#ifdef CONFIG_X86_PM_TIMER
+	const struct pmc_reg_map *map;
+#endif
 
 	if (device_initialized)
 		return -ENODEV;
@@ -1502,10 +1506,12 @@ static int pmc_core_probe(struct platform_device *pdev)
 	pm_report_max_hw_sleep(FIELD_MAX(SLP_S0_RES_COUNTER_MASK) *
 			       pmc_core_adjust_slp_s0_step(primary_pmc, 1));
 
+#ifdef CONFIG_X86_PM_TIMER
 	map = primary_pmc->map;
 	if (map->acpi_pm_tmr_ctl_offset)
 		acpi_pmtmr_register_suspend_resume_callback(pmc_core_acpi_pm_timer_suspend_resume,
-							 pmcdev);
+							    pmcdev);
+#endif
 
 	device_initialized = true;
 	dev_info(&pdev->dev, " initialized\n");
@@ -1516,11 +1522,13 @@ static int pmc_core_probe(struct platform_device *pdev)
 static void pmc_core_remove(struct platform_device *pdev)
 {
 	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
+#ifdef CONFIG_X86_PM_TIMER
 	const struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	const struct pmc_reg_map *map = pmc->map;
 
 	if (map->acpi_pm_tmr_ctl_offset)
 		acpi_pmtmr_unregister_suspend_resume_callback();
+#endif
 
 	pmc_core_dbgfs_unregister(pmcdev);
 	pmc_core_clean_structure(pdev);
-- 
2.46.0.469.g59c65b2a67-goog

