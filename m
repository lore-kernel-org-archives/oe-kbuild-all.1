Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FD250A62
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jun 2024 17:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717350517; cv=none; b=AF7K/FAvqKptySdoOo8g9mHHIB8r6tXoShvKaE+BB8cCCIBLg9JJtz2Xslf0LBTNy+j/aIhhFFxoVXANBPzTZQ/sBi43M1edIiBiACoMsktqKuPvR7jJjn87d+ipgRDHVj6x/AhwAlJFGUPwwLngFgyEO6SWVF4qT1SWAMZlwI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717350517; c=relaxed/simple;
	bh=HZBhpsabW3XZ2JWJtKb+cvqE9wv56/ewsCF0Su26CXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ROpTBWZXGAfJf11o9afgqOKLsf9Pz+K3FaEEG1PO8SFD597bgmo8zwCQUseeV0xFG1r+XARNmfn0CSLFgIkPnHL99ld6yMB3LE8DGHZFZg855FZ6PybikhAzpA9jU2c8Ha+WPvZZ6b1uwwe//xFuPtd8kGC/e8OROi2HBYbugRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMN0Q2ci; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMN0Q2ci"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c222e7c94dso65455a91.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Jun 2024 10:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717350514; x=1717955314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z17ZhyH6OHFIWFfmFYlugkpZiR9dmaOSQiVuQJAdc+Q=;
        b=ZMN0Q2ciXT0/vufY4tU3DBH1x5T6RNOHc8jOdjTgQ1a8pGkO6wpt+HDg2an2KXp8fq
         o3T36zVUfyKF+DzDe6ODMiEP6Kv6wz+usIMVRBF7Y932cJtES7dAOuaEulQ/YPT0RxkG
         zdvWiuuiSY/YmH99C/uiFHbVcLmYUREdSDQ1hVK/pEnaWPY48vepMMHtwXbqBcko7Gr4
         34s1oQJumLYUDGQZqgm0M2j3mqwn0J/uOxBm9cB53rHkJ+3CZWGxhi5T3uHO3Nl1L1xq
         qGTgw7VFInRfA7Q1IGmt3gP6xpOlZMp63FAP9vXPtT2TsxWZ5t29nk9FFKD8KAahq6LM
         ekIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717350514; x=1717955314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z17ZhyH6OHFIWFfmFYlugkpZiR9dmaOSQiVuQJAdc+Q=;
        b=ZUrk2sDMW5QPwPAPPAbJvYOlZeLfRnSHs6OrlV4dJWihctTqq/KNTXnPtbe9uuKjCV
         KiXXHdeGCIwxGJzDanQ1pDkSg7w8Tvb/eB9/p0hv3KLdIar7ci1yLlbmgEXKMUzLNyqn
         mhzpArNAG7CdUOIXh++DwEvZSMnuTiSFunHNX7fnsgjABr3qljJ8YL59dhDELIDlSivQ
         cf+VxWGdM4c8JUm8o+Plsrgs+58cFoNpFclXBeDMW+Kuv0dG5VRC8KgUxkuvtGoPKGjn
         V3XGbHsLGxHv3R0Xn7CHtuaIX7Kg2/NGlali3nrtAyntjnmqEYzcmhZ/NWxM+Kxi5SxZ
         77aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW+SzGmkiRuRFDSw6h3pvXSdJE0St0y3bkViiiMoHhTquM78By5hSTkf2dUtL50b0puZHuICSWITK9Qr5PFrrN6mT+OUTaXXCaXaeG0Q==
X-Gm-Message-State: AOJu0Yy0RzORx/gBK7uI0LHgWqYGmu8oXiyAZvBRj1x5xnAfk9gk8FAH
	IjfgRLKbqMBGv3LSIMX9VfE3zVPXF/YLevr5ihOIwt85TJzfN+lU
X-Google-Smtp-Source: AGHT+IENhK8zQltv5hp7mgtlbP2tCvRYnj2FkWlYAQ0CSAUZnV9X/z/Poam/4TpvD/Wzx4pmWG1r2Q==
X-Received: by 2002:a05:6a21:6d9f:b0:1b0:1ce1:e7b2 with SMTP id adf61e73a8af0-1b26f2cc95bmr8041718637.4.1717350513914;
        Sun, 02 Jun 2024 10:48:33 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a775f741sm6481184a91.7.2024.06.02.10.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 10:48:33 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev,
	bfoster@redhat.com,
	irogers@google.com,
	linux-bcachefs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	lkp@intel.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] bcachefs: Fix missing assignment of minimum element before min_heap_pop()
Date: Mon,  3 Jun 2024 01:48:28 +0800
Message-Id: <20240602174828.1955320-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202406030001.jwsq6DZp-lkp@intel.com>
References: <202406030001.jwsq6DZp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When replacing the heap_pop() macro with min_heap_pop(), the original
heap_pop() macro would store the minimum element into 'ret'. However,
after replacing it with min_heap_pop(), the code incorrectly failed to
store the minimum element into 'ret' before deleting it.

Fix the issue by using min_heap_peek() to assign the minimum element to
'ret' before calling min_heap_pop() to remove the minimum element.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406030001.jwsq6DZp-lkp@intel.com/
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 fs/bcachefs/clock.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/bcachefs/clock.c b/fs/bcachefs/clock.c
index 3ec64fe6a064..18fab9c44b1b 100644
--- a/fs/bcachefs/clock.c
+++ b/fs/bcachefs/clock.c
@@ -156,8 +156,10 @@ static struct io_timer *get_expired_timer(struct io_clock *clock,
 	spin_lock(&clock->timer_lock);
 
 	if (clock->timers.nr &&
-	    time_after_eq(now, clock->timers.data[0]->expire))
+	    time_after_eq(now, clock->timers.data[0]->expire)) {
+		ret = *min_heap_peek(&clock->timers);
 		min_heap_pop(&clock->timers, &callbacks, NULL);
+	}
 
 	spin_unlock(&clock->timer_lock);
 
-- 
2.34.1

