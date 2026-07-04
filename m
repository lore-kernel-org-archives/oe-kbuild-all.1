Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22D239B4A5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 08:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783154498; cv=none; b=nFdr/9A5A9k+JapopkiRnyJHWp+LzH4rp1YNE5cMT28ayyFRXmI1i/VMQUx0Rt25/gP37RNJ7y2br4bzVw8xP4KQ7ZJ3Vu/l+0mm31i/LpKUAirynkKN/E2L6XJSWgZEVC1/uDERAmdcgP9u9QImi0/KsbU7yKku0XREkSwC2ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783154498; c=relaxed/simple;
	bh=Gy+dRhyxucoXfw7UnF8+YYDrnre5sYD78ZuVYjnQOn0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PcTTmJO0xy4yrrZFO/EyngBPewpCaxaqnjbvv6X2gIu3xzOTuLEL8deUvdexFb5xLN8ZYvCZubr7HNuuT4B7lF5jDAzPnLPCJZsq+MZwxuNgpwgLP87sdC5flQ16S6xpnFUdFnTZ7v/m4HIOCfCXmXM0YJw6KcQZbxUmsvlQ4Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6vQBU8l; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6vQBU8l"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4728c12ba97so755005f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 04 Jul 2026 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783154495; x=1783759295; darn=lists.linux.dev;
        h=content-transfer-encoding:reply-to:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2PKlx1RZlE0eFooFNfeW6nXm/sxrhaIM7NVbZ8hGbT4=;
        b=e6vQBU8l/h3aOsZM4hndIC4D8Baby7PRhXc+ivbTbn3+v8SUukdnW9Yzz/kd9VkaOU
         YoefDn/e+0Ab7fXNWT5N19BW3nK5EbKIp4oY5EtZs0JOeF7LSYbv8lyUYPChe0K/tF9l
         Bh6vMbS4uk/eVt2hpe4ajbL16lVLhbX3xFQkKjJ6DZlIiP9i22d+V5NhCKW0knFxngNo
         QSyDPzcY8f0xeBYWOvADHXN6sPVQwwEWceH4BYzun1nsLrRHECDdpZDYiWVEDaZEFJL/
         0TG1ehGer/huY36nUAqcZWxXZ0QcQOW8Hh7kU/OUPzJK1L9tcVFZqGDCLbnehyMM3732
         3XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783154495; x=1783759295;
        h=content-transfer-encoding:reply-to:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PKlx1RZlE0eFooFNfeW6nXm/sxrhaIM7NVbZ8hGbT4=;
        b=J3fmA1Xl17UHs3oClDTcTA73IaXBv98fCZMrrbq5bqCnfTCl7U0s+SkPpYSMUe7vle
         dUvB3UXB1GMhuVMfYflzsP2Q5A9gLjE4O3tuM5f1gM9+/h/0J0YNZiICdaOESRjwsOeY
         /N2WcYzBknASowiwl4PYqD7Vnj+TJOuB2EjLRyU6kn4T9NXTEM1IKLfmePmoHj98mZ42
         Kaf92DiTAK78abT3Jz6vkQtZNBe2KyZ4Wt4JcE8l3Z/lZ5/eU0jNGq1i9nhA04C/YQFE
         G+Lb8ohxTDSJRECz4gjWHJnFvhYPlA3nSVfNDV5DGFko5JVvNVHYLjl8hnxgmFcBL6ox
         Kk8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpNzJFeU8MQZAaCI4HZhu9AnJvFkW6l/rIuBTLjp+T5F6CEWZ4wXC/fUzdusod5AV0tTy1zt9FQpIMZLFiE@lists.linux.dev
X-Gm-Message-State: AOJu0YxfDtfcvmjb+gWNOdl4wW6ph9E9NgvCbP1CRnr4/FtRnbF7Qpbi
	3Q18xMtXEpHenQbXIk12UgdSzwJrg/MWior0xm+Xv5Mjyz7HOOdk0ord
X-Gm-Gg: AfdE7ck0qMGJWVCoweuJjAS77ld5C+SRD8DxlPXgQlnzOcs4wPvfZtP+jMqlEmIJGol
	Prtd4F3CR6u4nQfqkKplgVndJZ7KQlzupLHlzBZiNV5g6UuRBSFwhHwg4Q6J2v/i38mmQvly6i+
	1G/Ar3CRZmq5/Zx4VwbJ3DNDjzbPJ2Oykez6a1y++FJvQtAV7+4iRJpswsgD1CTvHcKEJBtou4V
	9U5ZDm+pKt2mg/XGvhCak4qiOluAVf9c30005a9EMC0MQvBbMaMOEx3+QRtpG2PvPNBJELBv22u
	+F2RM2NAH3nrlYX+igl0N2hRypH2Y2+ca+WEFfSLr+yoxXKK7Ug/qi4uN+uF//hzOqCSoehni80
	LuB+mfMQRGZ44tjsryIz9LESaHSqH+HdXN1wyBr8pybeV8fBXFM0GvcOmDZdi1oHpRhMv1z8biA
	RvZAbHNfPtKSu2m4i+0tHYxazxyA==
X-Received: by 2002:a05:6000:469b:b0:46e:624e:3c2f with SMTP id ffacd0b85a97d-47aab77082bmr1649075f8f.47.1783154494914;
        Sat, 04 Jul 2026 01:41:34 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15be:2e00:3669:f2aa:a674:f340])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm6519563f8f.21.2026.07.04.01.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:41:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: mikhail.v.gavrilov@gmail.com,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/drm_exec: avoid indirect goto
Date: Sat,  4 Jul 2026 10:41:33 +0200
Message-ID: <20260704084133.122053-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 8bit

The drm_exec component uses a variable with scope limited to the for() and
an indirect goto to allow instantiating multiple macros in the same
function.

This unfortunately doesn't work well with certain compilers when the
indirect goto can't be lowered to a direct jump.

Switch the indirect goto to a direct goto, the drawback is that we now
can't use the dma_exec_until_all_locked() macro in the same function
multiple times.

The is currently only one user of this and only as a hacky workaround
which is about to be removed.

So document that the __label__ statement should be used when the macro is
used multiple times and fix the tests and the only use case where that is
necessary.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  2 ++
 drivers/gpu/drm/tests/drm_exec_test.c  | 24 ++++++++++++------
 include/drm/drm_exec.h                 | 34 ++++++++++++++------------
 3 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index fee4c94c2585..fc28d0fdad37 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3011,6 +3011,8 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 	is_compute_context = vm->is_compute_context;
 
 	if (is_compute_context) {
+		__label__ drm_exec_retry;
+
 		/* Release the root PD lock since svm_range_restore_pages
 		 * might try to take it.
 		 * TODO: rework svm_range_restore_pages so that this isn't
diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index 2fc47f3b463b..7a374e462348 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -180,19 +180,27 @@ static void test_multiple_loops(struct kunit *test)
 {
 	struct drm_exec exec;
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
-	drm_exec_until_all_locked(&exec)
 	{
-		break;
+		__label__ drm_exec_retry;
+
+		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+		drm_exec_until_all_locked(&exec)
+		{
+			break;
+		}
+		drm_exec_fini(&exec);
 	}
-	drm_exec_fini(&exec);
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
-	drm_exec_until_all_locked(&exec)
 	{
-		break;
+		__label__ drm_exec_retry;
+
+		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+		drm_exec_until_all_locked(&exec)
+		{
+			break;
+		}
+		drm_exec_fini(&exec);
 	}
-	drm_exec_fini(&exec);
 	KUNIT_SUCCEED(test);
 }
 
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index 8725ba92ff91..cc2937185a9f 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -101,17 +101,6 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
 #define drm_exec_for_each_locked_object_reverse(exec, obj)		\
 	__drm_exec_for_each_locked_object_reverse(exec, obj, __UNIQUE_ID(drm_exec))
 
-/*
- * Helper to drm_exec_until_all_locked(). Don't use directly.
- *
- * Since labels can't be defined local to the loop's body we use a jump pointer
- * to make sure that the retry is only used from within the loop's body.
- */
-#define __drm_exec_until_all_locked(exec, _label)			 \
-_label:									 \
-	for (void *const __maybe_unused __drm_exec_retry_ptr = &&_label; \
-	     drm_exec_cleanup(exec);)
-
 /**
  * drm_exec_until_all_locked - loop until all GEM objects are locked
  * @exec: drm_exec object
@@ -119,9 +108,18 @@ _label:									 \
  * Core functionality of the drm_exec object. Loops until all GEM objects are
  * locked and no more contention exists. At the beginning of the loop it is
  * guaranteed that no GEM object is locked.
+ *
+ * A global label name drm_exec_retry is used, if you need to use more than one
+ * instance of this macro in the same function the label needs to be made local
+ * to the block with the __label__ keyword.
  */
 #define drm_exec_until_all_locked(exec)					\
-	__drm_exec_until_all_locked(exec, __UNIQUE_ID(drm_exec))
+	for (bool const __maybe_unused __drm_exec_loop = false;		\
+	     drm_exec_cleanup(exec);)					\
+		if (false) {						\
+drm_exec_retry: __maybe_unused;						\
+			continue;					\
+		} else
 
 /**
  * drm_exec_retry_on_contention - restart the loop to grap all locks
@@ -129,12 +127,14 @@ _label:									 \
  *
  * Control flow helper to continue when a contention was detected and we need to
  * clean up and re-start the loop to prepare all GEM objects.
+ * The __drm_exec_loop check exists to prevent usage outside of an
+ * drm_exec_until_all_locked() loop.
  */
 #define drm_exec_retry_on_contention(exec)			\
 	do {							\
 		if (unlikely(drm_exec_is_contended(exec)))	\
-			goto *__drm_exec_retry_ptr;		\
-	} while (0)
+			goto drm_exec_retry;			\
+	} while (__drm_exec_loop)
 
 /**
  * drm_exec_is_contended - check for contention
@@ -154,12 +154,14 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
  *
  * Unconditionally retry the loop to lock all objects. For consistency,
  * the exec object needs to be newly initialized.
+ * The __drm_exec_loop check exists to prevent usage outside of an
+ * drm_exec_until_all_locked() loop.
  */
 #define drm_exec_retry(_exec)					\
 	do {							\
 		WARN_ON((_exec)->contended != DRM_EXEC_DUMMY);	\
-		goto *__drm_exec_retry_ptr;			\
-	} while (0)
+		goto drm_exec_retry;				\
+	} while (__drm_exec_loop)
 
 /**
  * drm_exec_ticket - return the ww_acquire_ctx for this exec context
-- 
2.43.0

