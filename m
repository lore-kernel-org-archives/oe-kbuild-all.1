Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF59D13731
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689339940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HdKUk0+bIZvG5Gq1KPvgkZeap0ijZ2nfecp9kkU7oO0=;
	b=emKiJ3L6EP0A4LT0fW7gFhJrUnAMv3lsiOyL9I4YhSqlCGSfHtCjS+i5HzoVZ+8t0QA2mD
	U9G0QX0lzAc7kBlNLDRhUjSrB6SaCYsBmRDuAxO0WL1gnyKnQcDfglJmehEP2O5zzUTet1
	OcO+Gd7iksLfrsX38TtKmQ7hvJKF/jU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-pPZ7KFzDOH6fRkMXNWxLeQ-1; Fri, 14 Jul 2023 09:05:39 -0400
X-MC-Unique: pPZ7KFzDOH6fRkMXNWxLeQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-993dc6fbdaaso106452566b.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 06:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689339938; x=1691931938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HdKUk0+bIZvG5Gq1KPvgkZeap0ijZ2nfecp9kkU7oO0=;
        b=V308Zp+cWpXiqQzhlOrfIZnNQKqlLO4XqOwt2Gg/TU8+4d19LWBYrZhtgYlEh2O/jy
         kDBVnPWxwiEbAYbeqZY54klje+i/eDgk74zpv9uwjszMOlt0OQcQNwbUsa2QwBSrTrC5
         niL012Y5JI1LPY6Jah2PGv3TXK9ZqWgUNwh/cmYEi6QECFobv9Wa+k3LKKyOZYxX0jAz
         Fh4UmL1QWYcMZofkoiQG3iWDJc4R5SZm2GApWUuYePrx41bFbTtx722JBOscUoWRtGzK
         9+EwrG7lX3TNJ+7TrL8vxoTspK5oQFEBZoDzEDA1GAX0Rlr5cPVA4KHoFxmXVCZLj1gI
         ZbQQ==
X-Gm-Message-State: ABy/qLa96nZG6I5YxCrTrADzjoh0iRCylkbxtW7d6xAeHMP8lYnS/iRJ
	8iX2OuXIrU5Ey7GmGFvW44UYNb5AWpz0ILp1zO8u98FBjoyCfaiP4TDURHZVQ2xC6tAsyMQEz4e
	+GYBDsG3TZM+XmeN4S1VOmTmICA==
X-Received: by 2002:a17:906:113:b0:992:764b:90d5 with SMTP id 19-20020a170906011300b00992764b90d5mr3682344eje.71.1689339937899;
        Fri, 14 Jul 2023 06:05:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlESgjYIl+0YMv3J0/RY8w1dem+XJCEQWU7PFW26OzVSojpvJn7zKcVcACL8nngiNY9fcRngjg==
X-Received: by 2002:a17:906:113:b0:992:764b:90d5 with SMTP id 19-20020a170906011300b00992764b90d5mr3682333eje.71.1689339937614;
        Fri, 14 Jul 2023 06:05:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qo11-20020a170907212b00b00992b0745548sm5318999ejb.152.2023.07.14.06.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 06:05:36 -0700 (PDT)
Message-ID: <f635e971-ddf5-b26d-7116-473829c4dc4a@redhat.com>
Date: Fri, 14 Jul 2023 15:05:34 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [pdx86-platform-drivers-x86:platform-drivers-x86-simatic-ipc 3/7]
 drivers/platform/x86/simatic-ipc-batt.c:152:5: warning: no previous prototype
 for function 'simatic_ipc_batt_remove'
To: kernel test robot <lkp@intel.com>,
 Henning Schild <henning.schild@siemens.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <202307141920.qk4FY4D6-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202307141920.qk4FY4D6-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/14/23 14:01, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git platform-drivers-x86-simatic-ipc
> head:   161c6512536100ae4919032ef6f1132621794e01
> commit: ad90535e51415fb636054649b5894447a984496e [3/7] platform/x86: simatic-ipc: add CMOS battery monitoring
> config: i386-randconfig-r021-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141920.qk4FY4D6-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141920.qk4FY4D6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307141920.qk4FY4D6-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/platform/x86/simatic-ipc-batt.c:152:5: warning: no previous prototype for function 'simatic_ipc_batt_remove' [-Wmissing-prototypes]
>    int simatic_ipc_batt_remove(struct platform_device *pdev, struct gpiod_lookup_table *table)
>        ^
>    drivers/platform/x86/simatic-ipc-batt.c:152:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    int simatic_ipc_batt_remove(struct platform_device *pdev, struct gpiod_lookup_table *table)
>    ^
>    static 
>>> drivers/platform/x86/simatic-ipc-batt.c:159:5: warning: no previous prototype for function 'simatic_ipc_batt_probe' [-Wmissing-prototypes]
>    int simatic_ipc_batt_probe(struct platform_device *pdev, struct gpiod_lookup_table *table)
>        ^
>    drivers/platform/x86/simatic-ipc-batt.c:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    int simatic_ipc_batt_probe(struct platform_device *pdev, struct gpiod_lookup_table *table)
>    ^
>    static 
>    2 warnings generated.

This is caused by simatic-ipc-batt.c missing a #include "simatic-ipc-batt.h",
luckily I have not yet created the tag for the pull-request for other
subsystems.

So I'll squash in a fix, do a forced push and then do the tag + pull-req.

While fixing this I've also added "static" to all the struct gpiod_lookup_table
variables in drivers/platform/x86/simatic-ipc-batt-*.c

Regards,

Hans


