Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E412EAF7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 14:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMdt4cD6"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6ce2c71c61fso599778a34.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 07:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698330606; x=1698935406; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2n+ghG7acJgH7zVagE61XUCcCU4fU97sE0ZmR2fozaQ=;
        b=ZMdt4cD6jhnzUuNIXYckQfSwl2XWK6xkcGYfXgfbZwJOfr/xypC/M3TtbijzgdXv3M
         ClVs5kh9Uk5CFUL54vObMygYzUfn7gAD7cUWymHCWn7Qqb0jixCJ+7YGFklNfMLnbCc+
         O+GbAJPJbYeAijC0zYaBn+v+eFofc1WzbKHzveetsAMJxsQEOMR6NMNHEpr1s6Zzyd18
         2ZSffA+48qhEQfF5tlsK3lmNwW8CmbyLglE4R71Mh8ZfFmTPgmotayJwzKPmzshedl/W
         mwxZ+kMoZzxLeDnSf6+ggpyhYUAOMS54xvVWqsCY23cEo/4Z+bdASWuKx9bKy723shtn
         rFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698330606; x=1698935406;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2n+ghG7acJgH7zVagE61XUCcCU4fU97sE0ZmR2fozaQ=;
        b=c7JumKuzkw9Jd/nJMadpU4KktZI+UUNURyCDPY6QV9cmd6ooFQD8BS1wiaHzL1IqZy
         PF4f6oANPkaE86bEu7RBm97CFBWymxS83JR2XGYvbNmfEX33GjkmAkBOWpHrWb/T+k0e
         t1/Ocj+Yp+WwdxlPjKfcN90pm/MlHVRWNP5ah28DeNQbT9XZCaYe96bfQCfJkagEoCy3
         QjfuiT4Z7K82UzsTq176Pu06i26WoAHCImNVRQFOVk6Quq1jHCL/eracNlqH98Bgw4RH
         dfRBQPRgser1FWLD+9JRf4oowUZ8LBUixH3WBuw4M2K726B/CnKsuca4TfOkPCREXsBr
         zcVA==
X-Gm-Message-State: AOJu0YwL083dmwUE3eBIGBPwIyaCxGfUSqdKJAQEM73xjTa78oUmePTv
	qSGQB60973T/wIRR+tDcDA5kAn88OqU=
X-Google-Smtp-Source: AGHT+IGiyOf7GmjI4GS4FWrkOukwx3VjyjHz64QTMY+vTcWptuNP0Ud6ZSIWEbl2ytje90JgPeUPKQ==
X-Received: by 2002:a05:6830:2693:b0:6c6:4843:2abb with SMTP id l19-20020a056830269300b006c648432abbmr19827437otu.12.1698330606288;
        Thu, 26 Oct 2023 07:30:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u9-20020a817909000000b00577269ba9e9sm47443ywc.86.2023.10.26.07.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 07:30:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5ad3be17-3011-15bf-26c0-9f9055034d1a@roeck-us.net>
Date: Thu, 26 Oct 2023 07:30:03 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 1/1] watchdog: mlx-wdt: Parameter desctiption warning
 fix
Content-Language: en-US
To: michaelsh@nvidia.com, wim@linux-watchdog.org
Cc: vadimp@nvidia.com, oe-kbuild-all@lists.linux.dev, trivial@kernel.org,
 linux-kernel@vger.kernel.org
References: <20231026082558.12142-1-michaelsh@nvidia.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20231026082558.12142-1-michaelsh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/23 01:25, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Add parameter desription to fix warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310241044.lvqeOGli-lkp@intel.com
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/mlx_wdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/mlx_wdt.c b/drivers/watchdog/mlx_wdt.c
> index 9c5b6616fc87..667e2c5b3431 100644
> --- a/drivers/watchdog/mlx_wdt.c
> +++ b/drivers/watchdog/mlx_wdt.c
> @@ -39,6 +39,7 @@
>    * @tleft_idx:	index for direct access to time left register;
>    * @ping_idx:	index for direct access to ping register;
>    * @reset_idx:	index for direct access to reset cause register;
> + * @regmap_val_sz: size of value in register map;
>    * @wd_type:	watchdog HW type;
>    */
>   struct mlxreg_wdt {

