Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCA1372661
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 06:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219164; cv=none; b=B9CwpUmA3gX3PyGLZrUFLq5oLzTxljujOLEIe6tH0v7oX44wGzO5Seoeoa3O/KJetOUDJO7kc67FtKIXQ+0VI5h7VxM2fHWhSlhcBkfJRFE27gsAWoX/whQWJ1jEEyR/wEHGlBgrxz7pzpG5n4Gn16hJ7r2cw3sUzFimrW774gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219164; c=relaxed/simple;
	bh=pjnlBt6SURk1oSIhuBRAGZbjZC0/tpixdjHKFgL1qUc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lNmXsWbmTXXo39I78QEeVMKh5YKqiYk93nUJ51WRTpVteXD+SshifBBZwMGlpPntyVth7D1rTm2laTeDSpMV8SYUOuMTMV8cvJwERg7g58DjsWSP2flIzS1+T1dx2Dxz60u5XzdKwye4XwipJ1dOuRMS0UTcrD0Eh9x5K36CxV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZxFpiq5X; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZxFpiq5X"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f9ae25143so2941873f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 23:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785219160; x=1785823960; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YYU5bHS/Z+eLCg56qrZqUFxZjeORsRv275njWXY2pHQ=;
        b=ZxFpiq5X750JWa5bxmw5sNPmIOSPHrZIHa0saRz3eaaerAXQnce+kATmfUYHDEaec/
         oiA60C2XdazpnHvX++3CklmsZ6ZnO9RdAwQDdZawaF5LR/8FLvZevI5KNiqJvnW447RE
         UCoS/FpU/MUot4SeZf2zgEoEjofDAkgDVCs9pEM7yoZCbKF71rE6AeNJkhlgG6YZovJE
         xFEZS7VNV4ii6cP66wUnfMvnGe6PEQqbCKsOe1cf+Jb77P3CflEeu3N+e2ySfdiLKR3J
         3XcddZ19xzwNIt8cbG2ByaqVoL/iqglRpiyUNljJH8ENM/mdrYQx9zqea3C++jinmp5R
         +jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785219160; x=1785823960;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYU5bHS/Z+eLCg56qrZqUFxZjeORsRv275njWXY2pHQ=;
        b=fkkgjF1Uo/+ZPrmg43KIpiqBSCood2Tz89CNMMWRFH15v39vgMOyGvgdy7vo1bCQDs
         3Bbrqv2jg40qGcZjjTf/Na+iraI+pg7vIfh2wLgt3Ssp3AJbJt8g/hwxZImJFP44A3Ci
         ACVDiCP9PuOVKqrg6GaF4bkBNogfQ9DlGp/Y7uCsi76MA+ginhg9n9SSSH+gmvaJnqvl
         cvuXpYpF6CFc4Q7IPsivEOnmYXVl4QUc0lvdTT87kgcJnYF4xmRJOSKudhCau12AvO5/
         5Pnuite+U1NYBpo0MbV49ZwermI9P/wcATueU1aoHtWtAwczKZyrkjd2pFSst1Sn0jF5
         asUA==
X-Forwarded-Encrypted: i=1; AHgh+RouW3QZ37w8c2yWH2a6CvC5MB3LFjO2Qw+Hxw61I2tHxydeuFvCK1LBLGIRLR0VAfwuYzqszUI1wPgPdKqp@lists.linux.dev
X-Gm-Message-State: AOJu0YzslbZqjtShQmHEyEPyeE+Mm/OHbc+SDmlnFjgCMZEGlsePfLGQ
	VYGjC70b5RzF4V+Abym5jkD7txg1dq2MAfexsiH1/wQW4HhdYLIElkiz82pX0Go4OX8vpm9VNId
	NkoXMuO9/lnabizMJEw==
X-Received: from wmbbi11.prod.google.com ([2002:a05:600c:3d8b:b0:493:bf32:b461])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1388:b0:495:4689:1e98 with SMTP id 5b1f17b1804b1-496c6432146mr8465075e9.10.1785219160427;
 Mon, 27 Jul 2026 23:12:40 -0700 (PDT)
Date: Tue, 28 Jul 2026 06:12:35 +0000
In-Reply-To: <amg8Wqhs5paocBLl@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <amg8Wqhs5paocBLl@rli9-mobl>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2337; i=aliceryhl@google.com;
 h=from:subject; bh=pjnlBt6SURk1oSIhuBRAGZbjZC0/tpixdjHKFgL1qUc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqaEg+5RU1kls1JMrMaJWd2FwH/+elcqGcdPT2i
 xhIwb6VzVWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCamhIPgAKCRAEWL7uWMY5
 Rqr+D/9f+wZdxsXnAZblEjvm2fXK4b/NoDDKXehjkF/hdi4+JEuZk3j/V0AuL/PC1m+p+NuOwFJ
 piO+vtfCnHaESAcCu+8CN+pY5GA92C8/9VGhWYpd1bgqOxNCEBKhWUSw2dpzH27Kqa6vTR6RR+e
 LXt7lFZmiEctnojAa8FA1O0ki1v6GxXXAZ2woWNQwQ7ruLx1huzyH9oWvvqe71BLUxwEj843wmw
 HhFUNjZIDPz1MMB4F1UX+gG7VBZyprq+xc5+71OXPg9q/CJZwDYZlsaBE4KdKTQsmMAiLdhuvgt
 CMW1BODaO7VdmUo1PsEliIGN5LB4cCksaw9w5fg7xzvfV4gWisSgx/EuSdTy2rXvzrEBr/D2Fw1
 uHPGnay7+v8YtQzWM16i6PIJL445S6UbVn/v613KSaUBv8m3EeXv1PlZ2q9YkHtI5mGFYEbrTSw
 TGVo9Er4U9gZvizEyOrn1Od7BllMUJrBvsui/Ypm+F/Lg04ELuDsGgx9DHSoB/xdgj6IVqYeM5R
 wuj60UNCHJgi6KqFOWlmwIA5PKX8kL55+ttVUrbALvcJa4cBOtXbCR1jTAfvXL3JDVeDr2mSMPM
 vcSv3h7P/DyarbnsHrxEcm3pCoa7A7MvQoTSlDF3C0cYLC7/y6lyvLJMOZlByFxtyOn4Z8L4Scr Diik9EmhQuYsoLg==
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260728061236.198267-1-aliceryhl@google.com>
Subject: [PATCH] rust_binder: update indentation of failed transaction print
From: Alice Ryhl <aliceryhl@google.com>
To: philip.li@intel.com
Cc: gregkh@linuxfoundation.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

To properly take the changes from commit bb66b1a34525 ("rust_binder:
only print failure if error has source") into account, the
binder_debug! statement was moved inside the if {} block, and so there
must be one more level of indentation.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/thread.rs | 34 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 9f3b0c9255b3..96e69eb1539e 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1296,23 +1296,23 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
                             ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
                     }
 
-                binder_debug!(
-                    FailedTransaction,
-                    "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
-                    if info.is_reply {
-                        "reply"
-                    } else if info.is_oneway() {
-                        "async"
-                    } else {
-                        "call"
-                    },
-                    info.to_pid,
-                    info.to_tid,
-                    err,
-                    info.code,
-                    info.data_size,
-                    info.offsets_size
-                );
+                    binder_debug!(
+                        FailedTransaction,
+                        "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
+                        if info.is_reply {
+                            "reply"
+                        } else if info.is_oneway() {
+                            "async"
+                        } else {
+                            "call"
+                        },
+                        info.to_pid,
+                        info.to_tid,
+                        err,
+                        info.code,
+                        info.data_size,
+                        info.offsets_size
+                    );
                 }
             }
         }

base-commit: 0957fbab972a9499626ac457fd924b24491c6315
-- 
2.55.0.229.g6434b31f56-goog

