Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D66C1C36
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 09:09:16 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id ek18so147717914edb.6
        for <oe-kbuild-all@lists.linux.dev>; Thu, 06 Apr 2023 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680772155;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=izMJqOm2fG4oRXUj5e1mXGYopn3LP+t07f1iwKL2lDs=;
        b=jpyS0sEPtAjX6jHwwG0Znx+OXlwZMWpNahThE4ZTFowRjzNnLV4wMeGvE1hpiMEokW
         3ASVFl/cFJoWXW3CJM33UoVQKNQ4UJPsfXGvlrConzD0c2xGE/Av26bb48LSE6PnfeDC
         yJIKDhnjXLxhGXZZ8G2C2bn5QqTDSUZu8J0MN/40Z3f8+xKeayi/fhTnCvvYhW/bqHmT
         5KFM5HzoLQmp31D59S2b0RNjJgR5Ai/AoasaxrTRtLfSfuxmoeUDYmsz/PdtYqrrBJ2o
         88+kvQiePvB8AqQRegJiONW/Vk5p/MTmvOf7AvJOMuT1oT1WbrAwuS/Ehat+YimlgVa+
         pXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680772155;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izMJqOm2fG4oRXUj5e1mXGYopn3LP+t07f1iwKL2lDs=;
        b=MsUbQsvmfwL9Gjr1TkSBJ4NpKcpyfgYpOfwja6aH8UyieCdroOr6O+SyoNNS2O/E62
         GvfWvTTOAJJRTLrm7trPJIVOPPAmkTlLIfUg0R8QYwLfYne3vUQsPgCYVKwbYv1+Pw6l
         u4LqwEvCC03r5U0gKsgmPgx+C9jiP3bpCnY49+iJc5YM+QnqM+bHYIhK/xfXSmDH6YfY
         zLwtG9tyLektvY0JEfdp0nEJ/2Lwy4iaeadE7PEFz4v54Ul01Ak7t+OoZVGBKAFp4iJo
         ms2Mi29GlK7YIq7x0qFFPC5JF5H6Lmd0MjNL35tHE/s/JNk2AM1Mk1lH0mWbK6tG1ye4
         rEMg==
X-Gm-Message-State: AAQBX9cfq5iJwb19o2rDau4800QS1Z8gqMoVdTlHOrlWy6jMVBYFdPg1
	ayG6+xNfkrm4NH/MdkNmKf+AhQ==
X-Google-Smtp-Source: AKy350YcMK0ROtIKMKDvk83j0RJTTgNDHiMGHbohCizOHb4zVyDvKIR/xKZLNKVoThLvO6HY7haang==
X-Received: by 2002:a17:906:d54b:b0:920:7827:302 with SMTP id cr11-20020a170906d54b00b0092078270302mr5500516ejc.18.1680772154753;
        Thu, 06 Apr 2023 02:09:14 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id rj13-20020a1709076c8d00b00947ccb6150bsm413109ejc.102.2023.04.06.02.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 02:09:13 -0700 (PDT)
Message-ID: <2def10dd-a27e-72b1-c451-b7367da4c8ed@linaro.org>
Date: Thu, 6 Apr 2023 10:09:11 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [ambarus:s25hx02gt-v3 27/31] drivers/mtd/spi-nor/sfdp.c:1310
 spi_nor_parse_sccr_mc() warn: impossible condition '(params->n_dice > 255) =>
 (0-255 > 255)'
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <ee3873b7-d3da-4ce9-a01b-df1f5dab2d71@kili.mountain>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ee3873b7-d3da-4ce9-a01b-df1f5dab2d71@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/6/23 09:50, Dan Carpenter wrote:
> tree:   https://github.com/ambarus/linux-0day s25hx02gt-v3
> head:   6b55d2284b55c6de88e5722bb756fad85487d3db
> commit: 89b7eb9508b28a48c4d0a8b1ef46983202a0d360 [27/31] mtd: spi-nor: sfdp: Add support for SCCR map for multi-chip device
> config: arm-randconfig-m041-20230403 (https://download.01.org/0day-ci/archive/20230406/202304061615.oiFHKH9Y-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202304061615.oiFHKH9Y-lkp@intel.com/
> 
> smatch warnings:
> drivers/mtd/spi-nor/sfdp.c:1310 spi_nor_parse_sccr_mc() warn: impossible condition '(params->n_dice > 255) => (0-255 > 255)'
> 
> vim +1310 drivers/mtd/spi-nor/sfdp.c
> 
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1284  static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1285  				 const struct sfdp_parameter_header *sccr_mc_header)
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1286  {
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1287  	struct spi_nor_flash_parameter *params = nor->params;
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1288  	u32 *dwords, addr;
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1289  	u8 i, n_dice;
>                                                         ^^^^^^^^^^^^
> 
> Declaring the iterator as u8 will lead to problems if we ever increase
> the max to higher than 255.
> 
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1290  	size_t len;
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1291  	int ret;
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1292  
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1293  	len = sccr_mc_header->length * sizeof(*dwords);
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1294  	dwords = kmalloc(len, GFP_KERNEL);
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1295  	if (!dwords)
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1296  		return -ENOMEM;
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1297  
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1298  	addr = SFDP_PARAM_HEADER_PTP(sccr_mc_header);
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1299  	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1300  	if (ret)
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1301  		goto out;
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1302  
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1303  	le32_to_cpu_array(dwords, sccr_mc_header->length);
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1304  
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1305  	/*
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1306  	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1307  	 * additional die. Hence, length = 2 * (number of additional dice).
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1308  	 */
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08  1309  	n_dice = 1 + sccr_mc_header->length / 2;
> 89b7eb9508b28a Takahiro Kuwano 2023-02-08 @1310  	if (params->n_dice > SCCR_MC_MAX_DICE) {
> 
> If "1 + sccr_mc_header->length / 2;" is larger than SCCR_MC_MAX_DICE,
> the value of n_dice will still be <= because of truncation.

Indeed. I'll handle it, thanks!
