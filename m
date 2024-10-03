Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0CC19E83D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727965216; cv=none; b=Hk0VLUKFOzJ2DKxZjKXKfAACg1wkCKzkcFX0W/MFxjBCdkOqxS0iJUQaVsRNkvdY1oi69BVNueTHrPmRIfrSgCYpsKNRZK+WboA5MnoT+uRUTp0YvOYJogWzBaTgeGopnelMSJjuyI+UZJD5Irbfq1OmaGttZnFIDHJF/IKBrxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727965216; c=relaxed/simple;
	bh=MTBMAJpXm1pHcmzbDM+XtEXr3jCyoJ1nEuQscnYO1H8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHZOwYXdap04T45Fg3MTvbg3wmvCckJx/6+EL6/xSAcTsgw4idJsRYljVwVBCZ1/oMc8W7pPVxHeIQ+YcBKcDUGdoul9ZoBlHJ+dbPKMUIhCltb8L73JJ3sXHEIe7FB9aaqhPuQpGQ+1hRSTeAnn5sb3i+FndRaCBJyJ8UoTOOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dhXpVKtR; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dhXpVKtR"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-710e1a48130so485421a34.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 03 Oct 2024 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727965213; x=1728570013; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W0xXnRccwICf3nQQCN6F6qfdjv2N+ArvTxSpI1D+3TY=;
        b=dhXpVKtRarmcb5xb2d0qEglPopJtjlac5v2bbqxjPpv4jD1AaFcUYpWZDU1EfWnbsJ
         /b79ed2tPvflcWTaD1m8RmIL4G2NWPUUJD1Mtwf+PAY1mWCwC/oILEbNvUbJQ7q5ISJm
         zvV+x8JLYDTDEY2M7vQjv1h0zyp3HB2N2930hjDsVd2KZ0+/tR96dWMmS6YZdKDGysgS
         SZ4kcZpwBp9ecyPjFwC5k67/ybeXtRXi/KNGWlQaG3tm3t7vNsTjK4KTh7BJ36uJcsph
         pIHQxIslBYe1QDeJ2w/GFmWDQOPatdl1eOK60yV/+7xm9cS9J5M1CTR1DmpMfemrVA/N
         bPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727965213; x=1728570013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W0xXnRccwICf3nQQCN6F6qfdjv2N+ArvTxSpI1D+3TY=;
        b=tp4YTxCDNcFvmDZdLtMyHJh11ROdFr4vljzzhrTLCnoGhH4MtP96pRJjX7WROzcscj
         QUoaPjfzBA+sAzhSBcYBQx0Kdu/sjH9ZBgndTOWoWfbTf3givGQ5YBOWZuMhv3W8EE+O
         jeLLMwALM5Bf76nWb++Gfj/Z8VkNSEEWoTtp1RYRf1VQnxmS0mRGDCItfGSzeBfGA/0c
         2v6oBprzsGgVk4kibpAbd5MAdDm4AFm7B59kdm/6GWGbpoRCBIqFjwtbS7RzumwFXGgq
         Y3JXl51BpZi60JWKMt+tBiOYbnsGw+n6QgI9E5rU4e2D+ASMXb0ZuUPtk9AmWqPy/xNX
         JX9g==
X-Forwarded-Encrypted: i=1; AJvYcCUwDwqYdLVwh7dqQxU7Z2aGGgGSPR1PaiSu4DuxzVbjWz1ELjEC2s/1MsbsPGBqxCKfb4U7Fgdjn1AlPJ9Q@lists.linux.dev
X-Gm-Message-State: AOJu0YxadONgBd5Q2DhIe3lsA6gZY43DOnIapir8FF3dPDB9PIoRYK3g
	1gm51SaqND61ULVNgl1AiHWke11OTMbaDA52NxKGcYfetsg0MlARDIeyvGLZ+dA=
X-Google-Smtp-Source: AGHT+IEWwNUWz4nQ2IndJUC/CzrU5KetlvJmNaXTu3CLm7H2k6yOjFPj8tQXSEF6utrDP8q+MGltcQ==
X-Received: by 2002:a05:6830:438b:b0:713:76ea:6be9 with SMTP id 46e09a7af769-7153cd796b0mr6532950a34.11.1727965213475;
        Thu, 03 Oct 2024 07:20:13 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71547f893a9sm337467a34.77.2024.10.03.07.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 07:20:11 -0700 (PDT)
Message-ID: <193a517c-dd4e-4ed1-ba4e-a0aa6028beec@baylibre.com>
Date: Thu, 3 Oct 2024 09:20:09 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iio: adc: ad7380: use if_not_cond_guard for claim
 direct
To: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <michael.hennerich@analog.com>,
 linux-iio@vger.kernel.org, linux-cxl@vger.kernel.org
References: <20241001-cleanup-if_not_cond_guard-v1-2-7753810b0f7a@baylibre.com>
 <202410031253.vjAMDYuX-lkp@intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <202410031253.vjAMDYuX-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/3/24 12:35 AM, kernel test robot wrote:
> Hi David,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 431c39f6d3edbab14f48dbf37a58ccdc0ac3be1e]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/cleanup-add-conditional-guard-helper/20241002-063209
> base:   431c39f6d3edbab14f48dbf37a58ccdc0ac3be1e
> patch link:    https://lore.kernel.org/r/20241001-cleanup-if_not_cond_guard-v1-2-7753810b0f7a%40baylibre.com
> patch subject: [PATCH 2/3] iio: adc: ad7380: use if_not_cond_guard for claim direct
> config: arm64-randconfig-001-20241003 (https://download.01.org/0day-ci/archive/20241003/202410031253.vjAMDYuX-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031253.vjAMDYuX-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410031253.vjAMDYuX-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/iio/adc/ad7380.c:823:3: error: expected expression
>      823 |                 if_not_cond_guard(iio_claim_direct_try, indio_dev)
>          |                 ^
>    include/linux/cleanup.h:316:2: note: expanded from macro 'if_not_cond_guard'
>      316 |         __if_not_cond_guard(_name, __UNIQUE_ID(guard), args)
>          |         ^
>    include/linux/cleanup.h:312:2: note: expanded from macro '__if_not_cond_guard'
>      312 |         CLASS(_name, _id)(args);                        \
>          |         ^
>    include/linux/cleanup.h:258:2: note: expanded from macro 'CLASS'
>      258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
>          |         ^
>    <scratch space>:81:1: note: expanded from here
>       81 | class_iio_claim_direct_try_t
>          | ^
>    drivers/iio/adc/ad7380.c:823:3: error: use of undeclared identifier '__UNIQUE_ID_guard799'
>    include/linux/cleanup.h:316:29: note: expanded from macro 'if_not_cond_guard'
>      316 |         __if_not_cond_guard(_name, __UNIQUE_ID(guard), args)
>          |                                    ^
>    include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
>      189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>          |                             ^
>    include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
>       84 | #define __PASTE(a,b) ___PASTE(a,b)
>          |                      ^
>    include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
>       83 | #define ___PASTE(a,b) a##b
>          |                       ^
>    <scratch space>:79:1: note: expanded from here
>       79 | __UNIQUE_ID_guard799
>          | ^
>>> drivers/iio/adc/ad7380.c:935:2: error: cannot jump from switch statement to this case label
>      935 |         default:
>          |         ^
>    drivers/iio/adc/ad7380.c:911:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
>      911 |                 if_not_cond_guard(iio_claim_direct_try, indio_dev)
>          |                 ^
>    include/linux/cleanup.h:316:29: note: expanded from macro 'if_not_cond_guard'
>      316 |         __if_not_cond_guard(_name, __UNIQUE_ID(guard), args)
>          |                                    ^
>    include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
>      189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>          |                             ^
>    include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
>       84 | #define __PASTE(a,b) ___PASTE(a,b)
>          |                      ^
>    include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
>       83 | #define ___PASTE(a,b) a##b
>          |                       ^
>    <scratch space>:90:1: note: expanded from here
>       90 | __UNIQUE_ID_guard800
>          | ^
>    3 errors generated.
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for MODVERSIONS
>    Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
>    Selected by [y]:
>    - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
> 
> 
> vim +823 drivers/iio/adc/ad7380.c
> 
>    808	
>    809	static int ad7380_read_raw(struct iio_dev *indio_dev,
>    810				   struct iio_chan_spec const *chan,
>    811				   int *val, int *val2, long info)
>    812	{
>    813		struct ad7380_state *st = iio_priv(indio_dev);
>    814		const struct iio_scan_type *scan_type;
>    815	
>    816		scan_type = iio_get_current_scan_type(indio_dev, chan);
>    817	
>    818		if (IS_ERR(scan_type))
>    819			return PTR_ERR(scan_type);
>    820	
>    821		switch (info) {
>    822		case IIO_CHAN_INFO_RAW:
>  > 823			if_not_cond_guard(iio_claim_direct_try, indio_dev)
>    824				return -EBUSY;
>    825	
>    826			return ad7380_read_direct(st, chan->scan_index, scan_type, val);
>    827		case IIO_CHAN_INFO_SCALE:
>    828			/*
>    829			 * According to the datasheet, the LSB size is:
>    830			 *    * (2 × VREF) / 2^N, for differential chips
>    831			 *    * VREF / 2^N, for pseudo-differential chips
>    832			 * where N is the ADC resolution (i.e realbits)
>    833			 */
>    834			*val = st->vref_mv;
>    835			*val2 = scan_type->realbits - chan->differential;
>    836	
>    837			return IIO_VAL_FRACTIONAL_LOG2;
>    838		case IIO_CHAN_INFO_OFFSET:
>    839			/*
>    840			 * According to IIO ABI, offset is applied before scale,
>    841			 * so offset is: vcm_mv / scale
>    842			 */
>    843			*val = st->vcm_mv[chan->channel] * (1 << scan_type->realbits)
>    844				/ st->vref_mv;
>    845	
>    846			return IIO_VAL_INT;
>    847		case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
>    848			*val = st->oversampling_ratio;
>    849	
>    850			return IIO_VAL_INT;
>    851		default:
>    852			return -EINVAL;
>    853		}
>    854	}
>    855	
>    856	static int ad7380_read_avail(struct iio_dev *indio_dev,
>    857				     struct iio_chan_spec const *chan,
>    858				     const int **vals, int *type, int *length,
>    859				     long mask)
>    860	{
>    861		switch (mask) {
>    862		case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
>    863			*vals = ad7380_oversampling_ratios;
>    864			*length = ARRAY_SIZE(ad7380_oversampling_ratios);
>    865			*type = IIO_VAL_INT;
>    866	
>    867			return IIO_AVAIL_LIST;
>    868		default:
>    869			return -EINVAL;
>    870		}
>    871	}
>    872	
>    873	/**
>    874	 * ad7380_osr_to_regval - convert ratio to OSR register value
>    875	 * @ratio: ratio to check
>    876	 *
>    877	 * Check if ratio is present in the list of available ratios and return the
>    878	 * corresponding value that needs to be written to the register to select that
>    879	 * ratio.
>    880	 *
>    881	 * Returns: register value (0 to 7) or -EINVAL if there is not an exact match
>    882	 */
>    883	static int ad7380_osr_to_regval(int ratio)
>    884	{
>    885		int i;
>    886	
>    887		for (i = 0; i < ARRAY_SIZE(ad7380_oversampling_ratios); i++) {
>    888			if (ratio == ad7380_oversampling_ratios[i])
>    889				return i;
>    890		}
>    891	
>    892		return -EINVAL;
>    893	}
>    894	
>    895	static int ad7380_write_raw(struct iio_dev *indio_dev,
>    896				    struct iio_chan_spec const *chan, int val,
>    897				    int val2, long mask)
>    898	{
>    899		struct ad7380_state *st = iio_priv(indio_dev);
>    900		int ret, osr, boost;
>    901	
>    902		switch (mask) {
>    903		case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
>    904			osr = ad7380_osr_to_regval(val);
>    905			if (osr < 0)
>    906				return osr;
>    907	
>    908			/* always enable resolution boost when oversampling is enabled */
>    909			boost = osr > 0 ? 1 : 0;
>    910	
>    911			if_not_cond_guard(iio_claim_direct_try, indio_dev)
>    912				return -EBUSY;
>    913	
>    914			ret = regmap_update_bits(st->regmap,
>    915						 AD7380_REG_ADDR_CONFIG1,
>    916						 AD7380_CONFIG1_OSR | AD7380_CONFIG1_RES,
>    917						 FIELD_PREP(AD7380_CONFIG1_OSR, osr) |
>    918						 FIELD_PREP(AD7380_CONFIG1_RES, boost));
>    919	
>    920			if (ret)
>    921				return ret;
>    922	
>    923			st->oversampling_ratio = val;
>    924			st->resolution_boost_enabled = boost;
>    925	
>    926			/*
>    927			 * Perform a soft reset. This will flush the oversampling block
>    928			 * and FIFO but will maintain the content of the configurable
>    929			 * registers.
>    930			 */
>    931			return regmap_update_bits(st->regmap, AD7380_REG_ADDR_CONFIG2,
>    932						  AD7380_CONFIG2_RESET,
>    933						  FIELD_PREP(AD7380_CONFIG2_RESET,
>    934							     AD7380_CONFIG2_RESET_SOFT));
>  > 935		default:
>    936			return -EINVAL;
>    937		}
>    938	}
>    939	
> 

This warning and the "warning: label followed by a declaration
is a C23 extension" from the other bot message are both fixed
with the following modification:


diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index 19a942035e93..34adc5aeb6f3 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -819,11 +819,12 @@ static int ad7380_read_raw(struct iio_dev *indio_dev,
 		return PTR_ERR(scan_type);
 
 	switch (info) {
-	case IIO_CHAN_INFO_RAW:
+	case IIO_CHAN_INFO_RAW: {
 		if_not_cond_guard(iio_claim_direct_try, indio_dev)
 			return -EBUSY;
 
 		return ad7380_read_direct(st, chan->scan_index, scan_type, val);
+	}
 	case IIO_CHAN_INFO_SCALE:
 		/*
 		 * According to the datasheet, the LSB size is:
@@ -900,7 +901,7 @@ static int ad7380_write_raw(struct iio_dev *indio_dev,
 	int ret, osr, boost;
 
 	switch (mask) {
-	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
+	case IIO_CHAN_INFO_OVERSAMPLING_RATIO: {
 		osr = ad7380_osr_to_regval(val);
 		if (osr < 0)
 			return osr;
@@ -932,6 +933,7 @@ static int ad7380_write_raw(struct iio_dev *indio_dev,
 					  AD7380_CONFIG2_RESET,
 					  FIELD_PREP(AD7380_CONFIG2_RESET,
 						     AD7380_CONFIG2_RESET_SOFT));
+	}
 	default:
 		return -EINVAL;
 	}

