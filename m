Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203DD145B35
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443282; cv=none; b=pZqmvcVdKvXZc57TRnBzIT0Dwg9AUS0OdoGJEM3yRBLSWQcdQb0msgfuUUoORS9OWKsslxGoKFgrEMTPIBRgITsL8DijiAptFjv7QL8lit72FGqvB/bCr2HR4+4bCj4kCf17ggvsOPDqi95wT6wtzY55TXPqGGgsjxuPfzxIMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443282; c=relaxed/simple;
	bh=WP8t4BXUJg7dAm3OpE2RSpixMeST54d0bmiaKZz9G28=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DSWC6yavjF9l475YNaDE4tpRz1wU/McyY/pvJLHT/w+Xl4XEwInA41jIIWIhU4XIxBthGOhH+wknDIR6hoeMpWc51iRMQetKaUJ4p9d7rwK3UI1KDTwqoYCjeLuY7ThdWeBnMz0xCJaxIwDkE5zyJEOFfCrwGiwY25QHtAOk59c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UOVCNVNR; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UOVCNVNR"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-42c78767b90so38203315e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Sep 2024 02:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725443279; x=1726048079; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nYlazt98je5OLdJwIQH2r48prJG16q1sBIynapL5APM=;
        b=UOVCNVNRBa+T7SRmnIF13z4ANzjUb+NYY3izKrtw376qEK1ZpN/r4fE4znOdSKoyrw
         eHr+XkrGMlMoYaZcoTazxIHJ74G28MtG7eZLy/2cagTUqYD6ba5KBccC3Yr1bRgIMdhw
         +MgWmyuSiMIxiCHpEKoQ4GtAH+mdQtQk7ugwxWI9XHEIPfgnxj6qt2+Zw9jWHcPJpnji
         AJSHH9J4OOMvZja/Yq4mbQvgtZhnjfW03XKAjkdK4lEPUaIqcAAh3aLzqQkLY42li587
         B8oAsJUcpog7G/qUMmdUg0n1wgNyB65XYy78ujxDB+r3isc6n9rsVWZmxVCOGjGQa+jd
         pmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443279; x=1726048079;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYlazt98je5OLdJwIQH2r48prJG16q1sBIynapL5APM=;
        b=dus+3Z8DJcm3tJ6ngM5BeCqivEHUz5Vbc9tnfcI7RdjIsaA3txMyM+V5jZTNJoUp9n
         LFnrKizK5yFj3lCxYAo7riFhtmbpuuWPcKfCKWsBbowge1570HSS5MnYmIJ3YBbJfXvi
         bH8n+j0sYzjrWP5eavxsn7t4/iBlpsD5shpmL2I9v9pnkGUd3yPhSBlAgfGb3qy7A0nB
         9mhmBHUamFBXaDUuBWvbQVtkAVya9sR61ur2MmxJ1PlxEiDFWns9CovDie7/1eQiPh0w
         rCZQgTwb7EbRWLJ+zIVFs+Kn/YhIeuY6JckwX+A9fDu9TBDMDEctKk/2Psy1Q18g8WZr
         fC0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdABEVkU4jCdaIkVOG1dmbt0WmzzKLPsI4wVMPL7zDhF4nMVWkEqoXH/3GJ2iG20nCl+tnUxrsm81Vj95Y@lists.linux.dev
X-Gm-Message-State: AOJu0YyR06ZQdMslPsRxZY5cmduaVQ3t8Gcw8RiT7LsgSDK+0ScJZNYH
	G4ZuKuqRIBUi9SsdYv7Csxq0xd2Ftam+S6bqwKWukwVHgisyWGSI17suB9DnKONHijV/BzImYBA
	FuJHNetDELPFdXg==
X-Google-Smtp-Source: AGHT+IEZbOrp49fn/uaE9iy1FzWUvCJzMm/0OCvUuCEOfiHNFzpLmlFrzBlHyx/6/s/dYAOjGH0FI9BLoVWCd9A=
X-Received: from mmaslanka2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:b8d])
 (user=mmaslanka job=sendgmr) by 2002:a5d:64a5:0:b0:377:884:4545 with SMTP id
 ffacd0b85a97d-37708844606mr4099f8f.6.1725443279332; Wed, 04 Sep 2024 02:47:59
 -0700 (PDT)
Date: Wed,  4 Sep 2024 09:47:53 +0000
In-Reply-To: <d5e6a9b4-f9e2-4c6a-ac2d-bba1b12d7675@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <d5e6a9b4-f9e2-4c6a-ac2d-bba1b12d7675@redhat.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240904094753.1615549-1-mmaslanka@google.com>
Subject: [PATCH] platform/x86:intel/pmc: Fix comment for the
 pmc_core_acpi_pm_timer_suspend_resume function
From: Marek Maslanka <mmaslanka@google.com>
To: hdegoede@redhat.com
Cc: daniel.lezcano@linaro.org, linux-doc@vger.kernel.org, lkp@intel.com, 
	mmaslanka@google.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Change incorrect kernel-doc comment to regular comment for the
pmc_core_acpi_pm_timer_suspend_resume function.

Signed-off-by: Marek Maslanka <mmaslanka@google.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409031410.a9beukFc-lkp@intel.com/
---
 drivers/platform/x86/intel/pmc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index c91c753b120e..e2b4c74ce7f6 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1209,7 +1209,7 @@ static bool pmc_core_is_pson_residency_enabled(struct pmc_dev *pmcdev)
 	return val == 1;
 }
 
-/**
+/*
  * Enable or disable ACPI PM Timer
  *
  * This function is intended to be a callback for ACPI PM suspend/resume event.
-- 
2.46.0.469.g59c65b2a67-goog

