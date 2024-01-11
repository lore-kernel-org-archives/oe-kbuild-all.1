Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ED152F89
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 17:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5cf1f4f6c3dso1259437a12.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 09:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704995757; x=1705600557;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n9arcEUo79iuH5i+dQJ8o/Ftr9e8e+zqckCAA6/vHao=;
        b=cYED7I/7VxuHWYUzub3s1OXz9pDWpvJRWsxY6fFyVLokg31lejtSJ6HWjDgoay+g3W
         S2xJdCPH8s8M1RkeAGydDQqvMgb9K6jiZUmun1ClhrtNwWI5pBoKyYGgjOaaKhGW3ONp
         e+rIblLLIcfzEiFC7tYe4memZUQhkb+/1LYR4eoCXQ6Te3Zp0/Blhar0aL1S1+qb4rKk
         laxM9er8P4krRGBsuqb/tQiMtMHlFRxIHblcX2czy0BcH44utj6AdWDfwBCShgVOMGRs
         AOkeTOqKqv85A6qDaAhN6nOQtjg7dWIa4dMsRuO8uwiSldSlHFtDgXIvwSTBbrxxGske
         m+kg==
X-Gm-Message-State: AOJu0Yy+pVTeG0WzKsUgeManQeHqLqUqJ84DmXrOD3Fvk9gppn8otZDF
	7I5XBUwAwDIEjNHzq7PhAvJZykiKqfg=
X-Google-Smtp-Source: AGHT+IGCKXP/Me2EyaazqGPGYzpfCDrjY+044h6PG7i2KrkVjz4fSS4fq8NYYdUCrD//ET7yh10kZA==
X-Received: by 2002:a05:6a20:3c91:b0:19a:41b2:7d98 with SMTP id b17-20020a056a203c9100b0019a41b27d98mr210749pzj.89.1704995757236;
        Thu, 11 Jan 2024 09:55:57 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:2b84:6ee3:e813:3d8d? ([2620:0:1000:8411:2b84:6ee3:e813:3d8d])
        by smtp.gmail.com with ESMTPSA id u25-20020a62d459000000b006db056542e6sm1500847pfl.190.2024.01.11.09.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 09:55:56 -0800 (PST)
Message-ID: <5b643088-7110-494e-9c5b-dd271c291894@acm.org>
Date: Thu, 11 Jan 2024 09:55:54 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: core: Safe warning about bad dev info string
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chris Down <chris@chrisdown.name>, oe-kbuild-all@lists.linux.dev,
 kernel test robot <lkp@intel.com>
References: <20240111162419.12406-1-pmladek@suse.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240111162419.12406-1-pmladek@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/24 08:24, Petr Mladek wrote:
> Both "model" and "strflags" are passed to "%s" even when one or both
> are NULL.
> 
> It is safe because vsprintf() would detect the NULL pointer and print
> "(null)". But it is a kernel-specific feature and compiler warns
> about it:
> 
> <warning>
>     In file included from include/linux/kernel.h:19,
>                      from arch/x86/include/asm/percpu.h:27,
>                      from arch/x86/include/asm/current.h:6,
>                      from include/linux/sched.h:12,
>                      from include/linux/blkdev.h:5,
>                      from drivers/scsi/scsi_devinfo.c:3:
>     drivers/scsi/scsi_devinfo.c: In function 'scsi_dev_info_list_add_str':
>>> include/linux/printk.h:434:44: warning: '%s' directive argument is null [-Wformat-overflow=]
>       434 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>           |                                            ^
>     include/linux/printk.h:430:3: note: in definition of macro 'printk_index_wrap'
>       430 |   _p_func(_fmt, ##__VA_ARGS__);    \
>           |   ^~~~~~~
>     drivers/scsi/scsi_devinfo.c:551:4: note: in expansion of macro 'printk'
>       551 |    printk(KERN_ERR "%s: bad dev info string '%s' '%s'"
>           |    ^~~~~~
>     drivers/scsi/scsi_devinfo.c:552:14: note: format string is defined here
>       552 |           " '%s'\n", __func__, vendor, model,
>           |              ^~
> </warning>
> 
> Do not rely on the kernel specific behavior and print the message a safe way.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401112002.AOjwMNM0-lkp@intel.com/
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
> Note: The patch is only compile tested.
> 
>   drivers/scsi/scsi_devinfo.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/scsi/scsi_devinfo.c b/drivers/scsi/scsi_devinfo.c
> index 3fcaf10a9dfe..ba7237e83863 100644
> --- a/drivers/scsi/scsi_devinfo.c
> +++ b/drivers/scsi/scsi_devinfo.c
> @@ -551,9 +551,9 @@ static int scsi_dev_info_list_add_str(char *dev_list)
>   		if (model)
>   			strflags = strsep(&next, next_check);
>   		if (!model || !strflags) {
> -			printk(KERN_ERR "%s: bad dev info string '%s' '%s'"
> -			       " '%s'\n", __func__, vendor, model,
> -			       strflags);
> +			pr_err("%s: bad dev info string '%s' '%s' '%s'\n",
> +			       __func__, vendor, model ? model : "",
> +			       strflags ? strflags : "");
>   			res = -EINVAL;
>   		} else
>   			res = scsi_dev_info_list_add(0 /* compatible */, vendor,

Expressions like "model ? model : """ can be shortened into "model ? : """.

Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
