Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB22289E06
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 07:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762500653; cv=none; b=LBtpgFuGYFCX+Iu82S9ZvAuArl+ijWSeq7WFjuSOjbvcvQu0ERR2g/2lzrsuSaiRXjESHXa7XIdrm0jfB3HApyHRGy8ta+MLFeqAPBuBmYb/UXjDBWxXiVVcAYvT0c1jb/uRMcdW4zUgCBTZlVM1fhBTu6Z8+TzQPJYv66c6EOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762500653; c=relaxed/simple;
	bh=f35DbpZpPqMDzZoRIqs7Osgf1PM69yqyjWw/dglp96Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlFv27PHZ9oPz2AfK/d/NHHbfeiAr+a9vBpNDV/0x4DOa5tZVUTAART9+5aWWbW3VCGpgTxyPDhe/u/ffFV4NKxd6YQrkvIblOU3itR0spZNbxC9Ddbazd+ihxRB/oWV0d67cKmU1+CId3A1hP0nkJTsW9m8dKQ8TLTx23uMDr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzQykOAJ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzQykOAJ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-378e0f355b9so2821211fa.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 06 Nov 2025 23:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762500649; x=1763105449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4M6PwHQesX19scpYMiKXrQJ0jxJ0uMLe/ADSgAzPkxs=;
        b=WzQykOAJLgOH8bdAYKRQPvmxAXq1DMOt3LglzGB+BjB14wHWN3lKWDpbehm/THKYYy
         OxnHE6x/cw7IxzlOZ8ZllTSTQlWR5CvFJB1prC2wjbwk1BBN1bHv1Sx5Ua98ArY3X6Dl
         aFqlkaX+otPEWUx3VdblyMjDJGfLQkFSnn5RRyqsd+OxJqKZqD6nTPVCbvgvGoaFun/U
         GrlzjWG44VF+noEzOee69Meq0dvh+iKIUHUoP+0ffLaBsi0VDgK3XVjUR/weaqWshBKK
         /MzJBVtAoxO10dyIX2o4nAS3o7Twv+7/brnbBLvDk3kH4mg53JUpbG0yOw6S+jDsh33z
         ty5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762500649; x=1763105449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4M6PwHQesX19scpYMiKXrQJ0jxJ0uMLe/ADSgAzPkxs=;
        b=ZakGzdQLSm2Bgs5rg5arnTd81b2KWXBFiif5BFWwOC7rx5vszBBXX8udEpcbXyo5oH
         +6O5QsxMZGh3flQg3x7y+9NJwlA19csfMUUb/S+CcFfp2D4Wjxrl9X1tn+PFA2faIcHv
         tO53Qo5OU9ZA577GdQLNit/6RyLaASpbizld6U9LRt5ISIP8P/110HIP2tTmvog4+uHx
         pft4zkfn/mzc08xtXc064uINbQ/7RPhCg2AyDESBdCEHOJqFXPLz+2PjTbTRgPRHXdXs
         qr2KZabSdXJoR22HtCvL09bamrz1ef+QSh+h4OpBc8NPmh33+TABUoRglm++Gs4acM2B
         EZ2g==
X-Forwarded-Encrypted: i=1; AJvYcCXWg/wrfrBp6uBEaSWszJg0Yi9Jr4o//huLPggXR/5t/86fsVfHGonFHCkuoFtdeAPIL9WajxKqumlT2DFR@lists.linux.dev
X-Gm-Message-State: AOJu0YwIfAA2gA/TbgR1U4mtbZFPSEU699yRfHebM51eSsE0ndDlkYUV
	FTh0BbqeCudyzLGqbvYwLQ08oXvsc8rHlwmyPITnSY4O0vAxNDbXWHkY
X-Gm-Gg: ASbGnct4wOuN4OhVp2KwTU2cUyeTcVEbCxXDiFQmREOJxhi6blX2Q1BkNxT2oUFoAsy
	gyVgVW0OHDkajeKH02RmWlI1b4Od0hZPQbzP0fTzIXixJttzjwhkp2mQ5E1bqHUDHqDD/yM+ht8
	4+eQpfon/R+kZZAPHMyKk8MCVmgrPyn8DzcmB2mNG9TsAHpG+ofWMSE945WQ2KzuNre8t+LnZck
	k77gDTrakM/FgkgdI4P5/QCxrayzckF1jjJy9m2vkPT1X2iyz/0RQfrzyVZz8MuzZTAGWkrjyvY
	o6/XKlFAvQQd9P+/ibgtJO0oXUT44A86qScOgeH84GznbiQZ3EetcAJich/mXRj1G2crJsatg9D
	5uqgmQp4otSO3s6MESS86JRBPK68FcG64iFHF4GJTh9ay5n7Bo77pldkoBUQDWBw9cq7Uk/0myq
	CEUA4raFc/e602cuVS
X-Google-Smtp-Source: AGHT+IEM6jJW7S0zoNmv87VOalpMKNhTySFhZbseoiHIzvl3ywyxFEtICW2fvawnuW/rzdA1JD3pIA==
X-Received: by 2002:a05:651c:4194:b0:37a:2e2a:da6f with SMTP id 38308e7fff4ca-37a742ce607mr4452981fa.44.1762500648643;
        Thu, 06 Nov 2025 23:30:48 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a013bd8sm1284123e87.1.2025.11.06.23.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 23:30:47 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: a.shimko.dev@gmail.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3] i2c: designware: Replace magic numbers with named constants
Date: Fri,  7 Nov 2025 10:30:39 +0300
Message-ID: <20251107073039.2646048-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202511071402.qHS6LLi9-lkp@intel.com>
References: <202511071402.qHS6LLi9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace various magic numbers with properly named constants to improve
code readability and maintainability. This includes constants for
register access, timing adjustments, timeouts, FIFO parameters,
and default values.

The change makes the code more self-documenting without altering any
functionality.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511071402.qHS6LLi9-lkp@intel.com/
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hello

--
Best regards,
Artem Shimko

ChangeLog:
  v1:
    * https://lore.kernel.org/all/20251105161845.2535367-1-a.shimko.dev@gmail.com/T/#u
  v2:
    * Move register-related constants to i2c-designware-core.h
    * Remove unnecessary comments to reduce clutter  
    * Keep only essential timeouts and default parameters in .c file
    * Use FIELD_GET() for FIFO depth extraction as suggested
  v3:
    * Add missing include for linux/bitfield.h

 drivers/i2c/busses/i2c-designware-common.c | 33 ++++++++++++++--------
 drivers/i2c/busses/i2c-designware-core.h   | 13 +++++++++
 2 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 5b1e8f74c4ac..3bc55068da03 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -12,6 +12,7 @@
 #define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW_COMMON"
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -34,6 +35,14 @@
 
 #include "i2c-designware-core.h"
 
+#define DW_IC_DEFAULT_BUS_CAPACITANCE_PF	100
+
+#define DW_IC_ABORT_TIMEOUT_US			10
+#define DW_IC_ABORT_TOTAL_TIMEOUT_US		100
+
+#define DW_IC_BUSY_POLL_TIMEOUT_US		1100
+#define DW_IC_BUSY_TOTAL_TIMEOUT_US		20000
+
 static const char *const abort_sources[] = {
 	[ABRT_7B_ADDR_NOACK] =
 		"slave address not acknowledged (7bit mode)",
@@ -106,7 +115,7 @@ static int dw_reg_read_word(void *context, unsigned int reg, unsigned int *val)
 	struct dw_i2c_dev *dev = context;
 
 	*val = readw(dev->base + reg) |
-		(readw(dev->base + reg + 2) << 16);
+		(readw(dev->base + reg + DW_IC_REG_STEP_BYTES) << DW_IC_REG_WORD_SHIFT);
 
 	return 0;
 }
@@ -116,7 +125,7 @@ static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
 	struct dw_i2c_dev *dev = context;
 
 	writew(val, dev->base + reg);
-	writew(val >> 16, dev->base + reg + 2);
+	writew(val >> DW_IC_REG_WORD_SHIFT, dev->base + reg + DW_IC_REG_STEP_BYTES);
 
 	return 0;
 }
@@ -165,7 +174,7 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 	if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
 		map_cfg.reg_read = dw_reg_read_swab;
 		map_cfg.reg_write = dw_reg_write_swab;
-	} else if (reg == (DW_IC_COMP_TYPE_VALUE & 0x0000ffff)) {
+	} else if (reg == lower_16_bits(DW_IC_COMP_TYPE_VALUE)) {
 		map_cfg.reg_read = dw_reg_read_word;
 		map_cfg.reg_write = dw_reg_write_word;
 	} else if (reg != DW_IC_COMP_TYPE_VALUE) {
@@ -384,7 +393,7 @@ int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
 	i2c_parse_fw_timings(device, t, false);
 
 	if (device_property_read_u32(device, "snps,bus-capacitance-pf", &dev->bus_capacitance_pF))
-		dev->bus_capacitance_pF = 100;
+		dev->bus_capacitance_pF = DW_IC_DEFAULT_BUS_CAPACITANCE_PF;
 
 	dev->clk_freq_optimized = device_property_read_bool(device, "snps,clk-freq-optimized");
 
@@ -539,8 +548,9 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 
 		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
 		ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
-					       !(enable & DW_IC_ENABLE_ABORT), 10,
-					       100);
+					       !(enable & DW_IC_ENABLE_ABORT),
+					       DW_IC_ABORT_TIMEOUT_US,
+					       DW_IC_ABORT_TOTAL_TIMEOUT_US);
 		if (ret)
 			dev_err(dev->dev, "timeout while trying to abort current transfer\n");
 	}
@@ -552,7 +562,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 		 * in that case this test reads zero and exits the loop.
 		 */
 		regmap_read(dev->map, DW_IC_ENABLE_STATUS, &status);
-		if ((status & 1) == 0)
+		if (!(status & 1))
 			return;
 
 		/*
@@ -635,7 +645,8 @@ int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev)
 
 	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
 				       !(status & DW_IC_STATUS_ACTIVITY),
-				       1100, 20000);
+				       DW_IC_BUSY_POLL_TIMEOUT_US,
+				       DW_IC_BUSY_TOTAL_TIMEOUT_US);
 	if (ret) {
 		dev_warn(dev->dev, "timeout waiting for bus ready\n");
 
@@ -699,12 +710,12 @@ int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
-	tx_fifo_depth = ((param >> 16) & 0xff) + 1;
-	rx_fifo_depth = ((param >> 8)  & 0xff) + 1;
+	tx_fifo_depth = FIELD_GET(DW_IC_FIFO_TX_FIELD, param) + 1;
+	rx_fifo_depth = FIELD_GET(DW_IC_FIFO_RX_FIELD, param) + 1;
 	if (!dev->tx_fifo_depth) {
 		dev->tx_fifo_depth = tx_fifo_depth;
 		dev->rx_fifo_depth = rx_fifo_depth;
-	} else if (tx_fifo_depth >= 2) {
+	} else if (tx_fifo_depth >= DW_IC_FIFO_MIN_DEPTH) {
 		dev->tx_fifo_depth = min_t(u32, dev->tx_fifo_depth,
 				tx_fifo_depth);
 		dev->rx_fifo_depth = min_t(u32, dev->rx_fifo_depth,
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 347843b4f5dd..a699953bf5ae 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -41,6 +41,19 @@
 #define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
 #define DW_IC_DATA_CMD_FIRST_DATA_BYTE		BIT(11)
 
+/*
+ * Register access parameters
+ */
+#define DW_IC_REG_STEP_BYTES			2
+#define DW_IC_REG_WORD_SHIFT			16
+
+/*
+ * FIFO depth configuration
+ */
+#define DW_IC_FIFO_TX_FIELD			GENMASK(23, 16)
+#define DW_IC_FIFO_RX_FIELD			GENMASK(15, 8)
+#define DW_IC_FIFO_MIN_DEPTH			2
+
 /*
  * Registers offset
  */
-- 
2.43.0

