Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B42A385D8F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 02:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791598847; cv=none; b=UaWmcg+wm81D0Q304rmB3FOzJeZYORIEiUj7rCiAH6qO8m+aI29H0q1/Zma/SDFPZxZf0QPSoGjijElA2R0yETBHnWv0p6IkZVZCXL9RKHBPSRzUjHbI4F0gPNEVUTzWTbxvAYhR3KJN9QZqD+RK+1aYrhcjmqvlC2xClOsut4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791598847; c=relaxed/simple;
	bh=ajMR9wriE6H4hnRyZehwGFnQ9zm37m15JPxPCyZmK7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FnEhwxDTdVHFb/018b87ZoSIlAju3QTJClWqC+oX8QRzqA/BLDJwct4M8iNn10awm8OJAEKsCjK4o97wgAsP1o1ZoTWup4Fngj2GzBWcWLGL1QA+QAG80Bm0dcVBI3TGwkaznVhjVRi/U86878sVXDCJsaYnPAwT1X3PYdxyY34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak1CbhTI; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak1CbhTI"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b056d58f2aso1704057b3.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 09 Oct 2026 19:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791598844; x=1792203644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nptkRAMUsiGRhK+Kku+TFYLcLth8GwQXjFMlm17rysQ=;
        b=Ak1CbhTIohJgd+Z2ovxHKhsVP55K5sRi3JY46K4qInteAQVS48rKk6DFQKCk4mqvRd
         xf6/yPSs3D0PW9y1RV1ckTTUW7IH9AIqtZwfRPk4b2zOlGgfJPIzpjxWUCPxkt1ruNSz
         5Z/2lDovC9G88EwbjpYuCeF8KOz61bTU0up4l14R6pGaoETaQsdFB0bYDD7pLqHtIyNt
         BRIBcyK0Evi/s8dd1h5WgGsRgeMGA1rawc3XhxtxcsX8RTYoPq0R63l/IvMMH6QZsWQm
         w6nYODanIcA4o2kX/HJObgOdEyUrc+tFberCgptDcaA6QsPz9qufQGLLbAoyW/4qMeJp
         RGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791598844; x=1792203644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nptkRAMUsiGRhK+Kku+TFYLcLth8GwQXjFMlm17rysQ=;
        b=Rl5OZznVSC3t4tuAmPzN5AEEKx7CwEPdJsf4cpnowZco/CgwSiam/jB6y6xVU5A+WZ
         ynKAwUk+5jmO6+0px+N8o8pD9AYMWyNu/F1yfhv61bIZmvXviwbvlnKCoZ9ToKRiI3Ei
         m9ogolYdXaOZPOHuvTqsWWn5mR/8KHzHBx1Xkg8z6SN3okmoUF4uh+Z2C5OfUsHNUg6t
         LfGrOr7lpAoyCkXoO9eB1DxBggr6I5GbScd4jMqcRnOQBB273W4DepyCBU5r57qQ9Qiw
         XTbSeGsjaGQtfzlVkpFqvCkxfmeqRbl50G6XoglEyJ2PIky2GdY7FfBGpWa/XwOh5/1d
         4lYw==
X-Forwarded-Encrypted: i=1; AKwUvBx2Gm3IWX/C1NiaHeL8VeuGJLGIah9K6qY4Zt4iOEqj9gPY3OkOZN12KOxg174lWE49GQJwSAyMR5kjwktE@lists.linux.dev
X-Gm-Message-State: AFq9FYJ/i82Dfncgt4pcJpB5RF6EssNjO6QGWwTETVAKizSMJjCPoE0A
	AiKybv9k5CtUtX+q3qJxUsjzSIGlzYoBmea9srv9LXgrPF6N8YwPKPFu
X-Gm-Gg: AYBFou0x/j8iYQUB2tAWnQQNak3sonlYBzlSPeaFSmLoZkPzY4N3Z2XoTJl5MFdeLmn
	g8ERttQXTUHQFdsrFxAunqShlq0pF6vKmknxVLD1SqBBbB18SkL4eJMl1ptunlHEITTVK7HBAHX
	1E6rHYjl2m2DZ6MwO1XEckEBo8T0XXFKPCk6qJMhvTi11AuYTxPKivjhoeWND6J68s11yKlB6Lw
	bAEVu/kyLzoIv/mYuoTpXkUnPpDYF1463cM1eL5IUAWI6XIZUEkdCy2qtdXEZ4DHtJR5flVso41
	h31+IvLMQ/8uULOiDpuaHD+Pxp+xIUn4Tp3dzejan7KqG5UxjO9uTeElTQWKmwY/S1DwJFW66hg
	h08opurl8PGn1JEE7hugZ9gdfySpBUfuoZfRXQ3/RSck7lRJ/6DBGohcGG74AeP6eWcAQZRN+f5
	4DA8kyvlUIXIQJH9Ss/+tkTtB0kDh/sPXHXfDUjewh0Wpz8aBPSQ2FAVKELHPSyi99qg6mtwrS9
	hGFXcqeCB1Lh8K0WSOlFPgC2bAh5kfobKJaF2EbrqwX94RuyaZuWL3n
X-Received: by 2002:a05:690c:6b12:b0:8ab:400f:75ca with SMTP id 00721157ae682-8b07ee8393bmr10390787b3.89.1791598843713;
        Fri, 09 Oct 2026 19:20:43 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f281184sm13948507b3.49.2026.10.09.19.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:20:42 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: add 128-bit shift helpers
Date: Fri,  9 Oct 2026 22:20:39 -0400
Message-ID: <20261010022039.1610210-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
References: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Selecting ARCH_SUPPORTS_INT128 lets generic code shift __int128 values by
a variable count. gcc open-codes such a shift when optimizing for speed,
but with CONFIG_CC_OPTIMIZE_FOR_SIZE=y it calls the libgcc routines
__ashlti3, __ashrti3 and __lshrti3 instead. The kernel does not link
against libgcc and Alpha does not provide them, so the link fails:

  alpha-linux-ld: lib/ubsan.o: in function `get_signed_val':
  (.text+0x1c0): undefined reference to `__ashlti3'
  (.text+0x1f8): undefined reference to `__ashrti3'
  alpha-linux-ld: kernel/time/timekeeping.o: in function `delta_to_ns_safe':
  (.text+0x2ac): undefined reference to `__lshrti3'

Provide the three helpers in C, as s390 does, and export them for
modules. They are built into the kernel proper rather than lib.a so the
exports are present even when nothing built in references them.

The 64x64 to 128-bit multiply is always expanded inline with mulq/umulh,
so no __multi3 is needed.

Fixes: fd04433a5bf3 ("alpha: select ARCH_SUPPORTS_INT128")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610090831.DSxrGQRc-lkp@intel.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Magnus, this is an alternative to dropping the select. It applies on top
of for-next (496e328c6107). If you would rather drop "alpha: select
ARCH_SUPPORTS_INT128" for now, I will resend this without the Fixes tag,
followed by the select, as a two-patch series.

Tested with gcc 16: defconfig plus CONFIG_CC_OPTIMIZE_FOR_SIZE=y and
CONFIG_UBSAN=y builds and links (vmlinux and modules, W=1), and the
helpers match the compiler's inline shifts for every count from 0 to 127
in a userspace test. Not boot tested.

 arch/alpha/include/asm/asm-prototypes.h |  6 +++
 arch/alpha/lib/Makefile                 |  2 +
 arch/alpha/lib/tishift.c                | 70 +++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 arch/alpha/lib/tishift.c

diff --git a/arch/alpha/include/asm/asm-prototypes.h b/arch/alpha/include/asm/asm-prototypes.h
index c8ae46fc2e74..672fea15032f 100644
--- a/arch/alpha/include/asm/asm-prototypes.h
+++ b/arch/alpha/include/asm/asm-prototypes.h
@@ -17,3 +17,9 @@ extern void __remlu(void);
 extern void __divqu(void);
 extern void __remqu(void);
 extern unsigned long __udiv_qrnnd(unsigned long *, unsigned long, unsigned long , unsigned long);
+
+#ifdef CONFIG_ARCH_SUPPORTS_INT128
+extern __int128_t __ashlti3(__int128_t a, int shift);
+extern __int128_t __ashrti3(__int128_t a, int shift);
+extern __int128_t __lshrti3(__int128_t a, int shift);
+#endif
diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
index 84046e730e6d..f77d4a46f2e6 100644
--- a/arch/alpha/lib/Makefile
+++ b/arch/alpha/lib/Makefile
@@ -35,6 +35,8 @@ lib-y =	__divqu.o __remqu.o __divlu.o __remlu.o \
 	callback_srm.o srm_puts.o srm_printk.o \
 	fls.o
 
+obj-$(CONFIG_ARCH_SUPPORTS_INT128) += tishift.o
+
 # The division routines are built from single source, with different defines.
 AFLAGS___divqu.o = -DDIV
 AFLAGS___remqu.o =       -DREM
diff --git a/arch/alpha/lib/tishift.c b/arch/alpha/lib/tishift.c
new file mode 100644
index 000000000000..488e1e483d48
--- /dev/null
+++ b/arch/alpha/lib/tishift.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * 128-bit shift helpers.
+ *
+ * gcc open-codes a variable 128-bit shift when optimizing for speed, but
+ * calls these libgcc routines when optimizing for size.
+ */
+
+#include <linux/export.h>
+#include <linux/types.h>
+#include <asm/asm-prototypes.h>
+
+union ti {
+	__int128_t val;
+	struct {
+		u64 low;
+		u64 high;
+	};
+};
+
+__int128_t __ashlti3(__int128_t a, int shift)
+{
+	union ti ti = { .val = a };
+
+	if (!shift)
+		return ti.val;
+	if (shift < 64) {
+		ti.high = (ti.high << shift) | (ti.low >> (64 - shift));
+		ti.low <<= shift;
+	} else {
+		ti.high = ti.low << (shift - 64);
+		ti.low = 0;
+	}
+	return ti.val;
+}
+EXPORT_SYMBOL(__ashlti3);
+
+__int128_t __ashrti3(__int128_t a, int shift)
+{
+	union ti ti = { .val = a };
+
+	if (!shift)
+		return ti.val;
+	if (shift < 64) {
+		ti.low = (ti.low >> shift) | (ti.high << (64 - shift));
+		ti.high = (s64)ti.high >> shift;
+	} else {
+		ti.low = (s64)ti.high >> (shift - 64);
+		ti.high = (s64)ti.high >> 63;
+	}
+	return ti.val;
+}
+EXPORT_SYMBOL(__ashrti3);
+
+__int128_t __lshrti3(__int128_t a, int shift)
+{
+	union ti ti = { .val = a };
+
+	if (!shift)
+		return ti.val;
+	if (shift < 64) {
+		ti.low = (ti.low >> shift) | (ti.high << (64 - shift));
+		ti.high >>= shift;
+	} else {
+		ti.low = ti.high >> (shift - 64);
+		ti.high = 0;
+	}
+	return ti.val;
+}
+EXPORT_SYMBOL(__lshrti3);
-- 
2.55.0

