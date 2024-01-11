Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D2D4F61E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JJpmBrJg"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a28b1095064so609775466b.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 08:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704990470; x=1705595270; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=plL10T18yoNF2cn1blPIOwyBNDgoNEpTCTt3sDg3Bg0=;
        b=JJpmBrJgygKrQl2lvvOyvHW2gF2Mk9eyEPKbr791gHsqPa4GhHddt0rQWrY+cyRScJ
         +IEIZM8su5sygxMnlqHvTiU/5CJt0JxH4Ol2IrN4peedE8+QyDsYVVIiN0aGPux/xKSf
         apY9hUi0lyYjSxqh0ZHmpsrzNT+Zarl+gdgwDDLCQXqWVNAUBTqqh9RPBbRUijGTF8rT
         KGlOjJMGur1rASnJ+3qlbH6hnjmjcaoirv7HDxTbvOOvS6h0IavcqVJymHmxgsq4syu4
         1xpdoH6qDkmBtjEKn69vkDmuKrS7wV5hMllk7k7bM6Q0C1LVOvIwDYag4kfSk5YxqlnG
         qAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990470; x=1705595270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plL10T18yoNF2cn1blPIOwyBNDgoNEpTCTt3sDg3Bg0=;
        b=MvQwCOMYzynYdSrPd6K5uNa3DX9/4dd0zWNYReSMo59djtKz53qJnajtwoc15/vNlR
         NM1n/03Nps1eg5G6uPjw9In0T/Bl087UH+tvKlcTjXa3twkqqvjcJnqRuHrG2zl5dgYZ
         /xAUK1DXrfmefwRLcf6SGCvTur/DguciProNT9Gj1j+RTExFkuDtxpZW2SsdS82MvYn/
         mP465svF5EWhOhrMNp2JCUSCaG81XA+DmcG41Ravug6bPdju+vjzoUYEtg2hP1RmvV4Z
         brTgkkLfpet6AhDQoVo6PqtyTBK7Sob+ruCbT4vWddeee2JWFQGyLwJcnvalFrJoytfV
         1plA==
X-Gm-Message-State: AOJu0YwiQS4dkp6QOFV1+G+N5oZVcUVvVi4VhdRkff1cmUQn2fwgWyjA
	z+70kww4/FmtrJ9Qc4ekUH5fOxhxczIFnA==
X-Google-Smtp-Source: AGHT+IHMaSBFXfruQLkk+kFdLGi/DEBrOwgWv2codSYUyy6UUbGamfDp2bjrOv6DhUdWCNXlsojusQ==
X-Received: by 2002:a17:907:3f25:b0:a2c:33ce:8c80 with SMTP id hq37-20020a1709073f2500b00a2c33ce8c80mr631263ejc.36.1704990470057;
        Thu, 11 Jan 2024 08:27:50 -0800 (PST)
Received: from alley ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id j15-20020a1709066dcf00b00a2a6e8f693esm748186ejt.152.2024.01.11.08.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:49 -0800 (PST)
Date: Thu, 11 Jan 2024 17:27:44 +0100
From: Petr Mladek <pmladek@suse.com>
To: kernel test robot <lkp@intel.com>
Cc: Chris Down <chris@chrisdown.name>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: include/linux/printk.h:434:44: warning: '%s' directive argument
 is null
Message-ID: <ZaAXAGqUJCxmCXzm@alley>
References: <202401112002.AOjwMNM0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401112002.AOjwMNM0-lkp@intel.com>

On Thu 2024-01-11 20:29:05, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   de927f6c0b07d9e698416c5b287c521b07694cac
> commit: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format indexing support
> date:   2 years, 6 months ago
> config: x86_64-randconfig-002-20240105 (https://download.01.org/0day-ci/archive/20240111/202401112002.AOjwMNM0-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401112002.AOjwMNM0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401112002.AOjwMNM0-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/kernel.h:19,
>                     from arch/x86/include/asm/percpu.h:27,
>                     from arch/x86/include/asm/current.h:6,
>                     from include/linux/sched.h:12,
>                     from include/linux/blkdev.h:5,
>                     from drivers/scsi/scsi_devinfo.c:3:
>    drivers/scsi/scsi_devinfo.c: In function 'scsi_dev_info_list_add_str':
> >> include/linux/printk.h:434:44: warning: '%s' directive argument is null [-Wformat-overflow=]
>      434 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>          |                                            ^
>    include/linux/printk.h:430:3: note: in definition of macro 'printk_index_wrap'
>      430 |   _p_func(_fmt, ##__VA_ARGS__);    \
>          |   ^~~~~~~
>    drivers/scsi/scsi_devinfo.c:551:4: note: in expansion of macro 'printk'
>      551 |    printk(KERN_ERR "%s: bad dev info string '%s' '%s'"
>          |    ^~~~~~
>    drivers/scsi/scsi_devinfo.c:552:14: note: format string is defined here
>      552 |           " '%s'\n", __func__, vendor, model,
>          |              ^~

This should get fixed by
https://lore.kernel.org/all/20240111162419.12406-1-pmladek@suse.com/

Best Regards,
Petr
