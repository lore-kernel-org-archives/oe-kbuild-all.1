Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0866D1C36
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 03:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuWvOz1I"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-27ff83feb29so6006929a91.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Nov 2023 19:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699415917; x=1700020717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oW6+TAcsgkVX2L728YvNO81hwlzTKV4x5733S3mNdBs=;
        b=MuWvOz1IfgCbzHoQTUJb45mw3h6LQr5WWhk5jKIhyiSMMfNxp/zr+vCQc0tMUPVF1b
         UroNqtLizMUkNU9VDn7U5Pml66yF+CXCgytfkOPlJIk5kXenO88VYgFlR2utMLRyvGhf
         22dObH9ia6uWGnoAWws1frfbYB9ernpEaXQosJKrt+86HkXHXk8lqY+vamYvv3ZOYoaA
         5167Nfxq71gBso2mUhBUhNb2mD4IQX7TE+325dhux8J69IKoMvVPh+kcDeqOR9HBkc/f
         Ze5D2xHvYgQm8UHdL1kRIB7LUpbZsQtUKzd7n4dRnIn3QuqEq1QSlWULGe1bXyWGGVlr
         /tvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699415917; x=1700020717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oW6+TAcsgkVX2L728YvNO81hwlzTKV4x5733S3mNdBs=;
        b=lzwY92JCqqpudZPyuzBzWZHDI4LlbkOo4fcN+PsHicS0CV5a0NI4krnx5Nqgtlog+b
         IF4JXYoCFxm6JCyc+WEnqbuhTouCT8d2ABC6d7DgaN4ebCP+pOY0qXxJ6CipVLvZEGdr
         wUuvGUQZICfP1ZIggmV9SaI4mHoSzGH2Malj/VxG0j+k+8Ldrb95rP9ZYLsQkQlCUHu3
         XwI1Gz1Tm9KTcfsu6ZL4A860VN5hpEBk2TOJSDyxN9cS6BVGqaMiURZu8hiX/AxM1c0h
         /pVxVx3qVHFIAfDpgVfEL5mK7L1M1cyNbq/M0ZFsUEAJ7fLsTER0bfIoDPIKG/kTxm1D
         OzIA==
X-Gm-Message-State: AOJu0YzvIxL9hLnoXtnP02tfpCvhkBe977TKnz7+BRgaqn9aToLw+ucp
	AIRaJeNYYJiDbxXbmOEZ9fTAA8bOhaA=
X-Google-Smtp-Source: AGHT+IGxy8UqGEjSjO7aF6ymfbOkLNMyr0HazzEN6S/9GhcKtZvRfqbDP14jdiEY+DyyheZBAIs3sw==
X-Received: by 2002:a17:90b:2250:b0:27d:b811:2fe4 with SMTP id hk16-20020a17090b225000b0027db8112fe4mr794680pjb.26.1699415917046;
        Tue, 07 Nov 2023 19:58:37 -0800 (PST)
Received: from localhost.localdomain ([115.99.190.148])
        by smtp.gmail.com with ESMTPSA id 9-20020a17090a018900b002635db431a0sm628102pjc.45.2023.11.07.19.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 19:58:36 -0800 (PST)
From: Jagath Jog J <jagathjog1996@gmail.com>
To: jic23@kernel.org,
	andriy.shevchenko@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev,
	lkp@intel.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: imu: bmi323: Make the local structures static
Date: Wed,  8 Nov 2023 09:28:31 +0530
Message-Id: <20231108035831.5889-1-jagathjog1996@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the local structures static within their respective driver files.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311070530.qKhLTz1Y-lkp@intel.com/
Fixes: b512c767e7bc ("iio: imu: Add driver for BMI323 IMU")
Signed-off-by: Jagath Jog J <jagathjog1996@gmail.com>
---
 drivers/iio/imu/bmi323/bmi323_i2c.c | 2 +-
 drivers/iio/imu/bmi323/bmi323_spi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/imu/bmi323/bmi323_i2c.c b/drivers/iio/imu/bmi323/bmi323_i2c.c
index 0008e186367d..20a8001b9956 100644
--- a/drivers/iio/imu/bmi323/bmi323_i2c.c
+++ b/drivers/iio/imu/bmi323/bmi323_i2c.c
@@ -66,7 +66,7 @@ static struct regmap_bus bmi323_regmap_bus = {
 	.write = bmi323_regmap_i2c_write,
 };
 
-const struct regmap_config bmi323_i2c_regmap_config = {
+static const struct regmap_config bmi323_i2c_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 16,
 	.max_register = BMI323_CFG_RES_REG,
diff --git a/drivers/iio/imu/bmi323/bmi323_spi.c b/drivers/iio/imu/bmi323/bmi323_spi.c
index 6dc3352dd714..7b1e8127d0dd 100644
--- a/drivers/iio/imu/bmi323/bmi323_spi.c
+++ b/drivers/iio/imu/bmi323/bmi323_spi.c
@@ -41,7 +41,7 @@ static struct regmap_bus bmi323_regmap_bus = {
 	.write = bmi323_regmap_spi_write,
 };
 
-const struct regmap_config bmi323_spi_regmap_config = {
+static const struct regmap_config bmi323_spi_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 16,
 	.pad_bits = 8,
-- 
2.20.1

