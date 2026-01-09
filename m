Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42FB2494F0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767946825; cv=none; b=hOaTYpJg0am8JsbhTMH3VNkHfhlh8m35KDwUWyiDbQRDssLPPD1zYRjf4BE0GGwP4/7XSADQNuglyDheRWfGwkKFa7Y1nLzfK7KdwCjTij6VLKzuN4qY0JrXeiUWo2UinwoalxDHyGK+RTW5Mht+bNboe1Z+PKBEeodzjwr178Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767946825; c=relaxed/simple;
	bh=1tZFHv16ZwL+7SKnmUSQAUFEBTMTAOwSnIDQecX4Q3E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uGu/h2RHCeuh3uxRXqcH4/qr8Z2NX27P/JxPRvjUHbPcijtAv+c93hrWYssDfSiP+owZuYoEPZtOwergYCgknH3h7/ohI/Lc3xKDe4cRwKd7LE7SwCEfQWz1o6rBQ6sw4rjEhWLd0Mstc2ZS/Bz+nVnO8H3dQNTpzhZZm9qJkJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g09VJCeY; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g09VJCeY"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477964c22e0so22085075e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 09 Jan 2026 00:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767946822; x=1768551622; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zyry+szf9M9K8ZoJdoLtp8bdGl2dJDUUhxBOiIqV+fg=;
        b=g09VJCeYLe5ueXxpbrLlSIgL3epJobiMWMPjWx9K2Up8ULnNO16zC/UjL6DLOT1FdE
         xcfeW5G+hDVuNLX0929LQkk3Fimz7DyCvWgF2x1wfRGvUqIxrF+OApBgJBBdRtJIoKQY
         1tIOUPwr59EdDNwgcRm9tU7FC3Subos+mwi9qHiQ3poYZT9EPWacf0JlWknnFOYuKfJF
         AtKVkzTb8v0UZqp3M6jV8kCdtvMaBg46rKTm6/TPeD3xERXZQAvQ53veZBvmcR2svSkC
         HhCiXywOlkkGtk9ZihJnoYPO/ABLruTOoT4Ah9o99klCtq8CJd/rVbdQXTFQp6YgFiwz
         bsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946822; x=1768551622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zyry+szf9M9K8ZoJdoLtp8bdGl2dJDUUhxBOiIqV+fg=;
        b=Fi9Yi3YZCdb+WYI0Wze2X6Shh9e5H4tXHlJx0JejJ9cnXB2bKpHY5Mu8RufBd0zYi+
         j3kTipPSz7cKHN9QXKPM5DGJ7c47TDLqMmVYgMrQjUnn6Eg+tuenrs6+bKm6/Idq2KID
         g4kh+mVdqyxHpsgH4RvckqEK6VicpSfHMzMjYANgmWFmnmDmoApRXgAW57ZOYAd2nuxw
         KoUeleAkhrm1GdcP5K+Ydp2RZ6vwJ8jxxD2X/hY3y493ItqRLUk908Cq2IMlVzY6jVes
         fXVOgvVn3hcG944bZHgYZ8a6a14g2ec4ZtmxxVsw6WauxSqWfgfTSaAuqfQYmhrzJzJA
         QdGg==
X-Forwarded-Encrypted: i=1; AJvYcCUbmQ0kqqBplKfdgJPrD6LshzBF1AI/Zkx8uRJClfUaGziyplv0yJhVwnRVHMo1Sic3Dt4Mqgys+qAVBF8I@lists.linux.dev
X-Gm-Message-State: AOJu0YwllF+mrEUKNHzNMAkmDrFHgoOYMJ2ddo39+EoMDcrChGO/eU1k
	uwzGLwGNG9c89/vB299717Ou/0kFc+7/6heaGsXi0JCr3GgFBH6//CwcyrMj8QmdHGloshQR8s0
	l676NZNnjxS9ybgM5gw==
X-Google-Smtp-Source: AGHT+IH8/dxnFkIPXI5oH6OCxXDjMpSEFjD+Jve3O5XrIh566SkPJXqi/4GrJctYsg/eEDEY2rX+Mxrfi2nwKBM=
X-Received: from wmot14.prod.google.com ([2002:a05:600c:450e:b0:479:2d82:5535])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:198a:b0:477:a289:d854 with SMTP id 5b1f17b1804b1-47d8484a113mr111305585e9.5.1767946822104;
 Fri, 09 Jan 2026 00:20:22 -0800 (PST)
Date: Fri,  9 Jan 2026 08:20:18 +0000
In-Reply-To: <202601091113.0b0WuRML-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202601091113.0b0WuRML-lkp@intel.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1324; i=aliceryhl@google.com;
 h=from:subject; bh=1tZFHv16ZwL+7SKnmUSQAUFEBTMTAOwSnIDQecX4Q3E=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpYLot7X73B4sGZrWfHFlDRnVAcjmhZlZf6QzFU
 f6Z9C0QNSqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaWC6LQAKCRAEWL7uWMY5
 RpkQD/9aqpRA3ZLxzulyknkdjstWLk1KiYjiealHIgUZdFDW0rYeHeBzEfDLpJ8b1GRI6H6zhso
 xESviPCfPyzVhiBR6zyT2Rzn0/PCSM2SDc2aQl1WO3oadL+vEBVdUXN4L4hKwQ6SSxIfCbi6pBZ
 5Dp2ckM4IAXcN1Mh3wbBrT/sjEpNYEXK/9U6TDXfHECzKta3sJ2lysB6C7AEo9gm6CaNAywDVGW
 ZltLkRyUzDvZyIl5ihoJIAl6IhDwA7R8emT3+xH9Tb+gXtrb3ibLq+Y6q1dMYCUQclqLkvGU2UZ
 W+VceUZb3eN5hsVxdYabyWhW7sAspA5t1gnXSKUHvhdU+oEKL7DAdmhkCh4P2/1vrGmSspam/eq
 PWzaI1QU8lrE+G9g+mmlHBw15qqYaeVU/yBCoCz2XyRf4aTkvWvTKzjaQFwAq9Jkmw+7bKPTfg5
 RfdnCiAjN5NRL8eI7wiosZUq43NxW99+KBbaStBVbadsehvcLg8gRiAyPwCFGqAh0yo2G+YzJ9R
 sqAbQgWf/M0PgsF5VYzFVp/SRY1idQrvl53v/MJNeW3+ONCsSlvVX7YfhXlMpicVXy2ZTpxk6wC
 iOlpC+BhEc3zU/hWQ4yIRyCKXpHIFpBf9sFip0cVNB0uR+uMIivNNuuERjcPPvu7eclSSZJMeSF RVGfFz930NlKcSQ==
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109082019.3999814-1-aliceryhl@google.com>
Subject: [PATCH] drm/gpuvm: fix name in kernel doc of drm_gpuvm_bo_obtain_locked()
From: Alice Ryhl <aliceryhl@google.com>
To: lkp@intel.com
Cc: aliceryhl@google.com, bbrezillon@kernel.org, dakr@kernel.org, 
	dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

When renaming this function, the name in the docs was not updated. This
causes a KernelDoc warning. Thus, fix it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601091113.0b0WuRML-lkp@intel.com/
Fixes: 9bf4ca1e699c ("drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Does anyone know what the config option to enable these warnings in my
own build is?

 drivers/gpu/drm/drm_gpuvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0bb115b6b59c..c75b4877ab92 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1815,8 +1815,8 @@ drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_find);
 
 /**
- * drm_gpuvm_bo_obtain() - obtains an instance of the &drm_gpuvm_bo for the
- * given &drm_gpuvm and &drm_gem_object
+ * drm_gpuvm_bo_obtain_locked() - obtains an instance of the &drm_gpuvm_bo for
+ * the given &drm_gpuvm and &drm_gem_object
  * @gpuvm: The &drm_gpuvm the @obj is mapped in.
  * @obj: The &drm_gem_object being mapped in the @gpuvm.
  *

base-commit: ec27500c8f2b65a3be6ce39a5844d6d246d1b2b0
-- 
2.52.0.457.g6b5491de43-goog

