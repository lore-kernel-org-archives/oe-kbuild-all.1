Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C83158218
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 23:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727824951; cv=none; b=bhHjzPkwHjzLOLUXl+0lvjzqTrz4rW36/7iCzVwPNyYcWX/8q8P49rEz4t1WKVGHdlXVbYpEottFWM3ExLb49FDI/RAmiryque3h3DeIPQhD9vkhksnEDt7NYniz78ETrGZhVliInu+BBZKjHLK8zWLvZW6LrN5C1qRwNWW1A9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727824951; c=relaxed/simple;
	bh=t0sgVdCsEU94nzvJkJHqtoIFTGYwqfsUBV/CozImZSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Skutd34z72c6qS2+7cCXWHUTpwAJZRwsS7bJVyC/d+RK98y4T36oVPIZSuPYVZsn0f5Odrx8tg5uscs91nLci016RIjwVb1tsdhNi9/CMjBxp2OUUwLlfmZ1Bz3HFCyv8SYaYgZtw7wpfSi2gqCKqprG6AnWkQdjzkEzfPBEvq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efS7fgCg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efS7fgCg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb60aff1eso55656165e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 01 Oct 2024 16:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727824948; x=1728429748; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e+3roFwqnz7KfzKrcHRy5h+KYJ0F6DpV6iKdleWjAeE=;
        b=efS7fgCgDe4qCKl1wyPqKQ05SrbZxZHpcVCCxDz68mZpeuqKJ11K6zM2beMDIJ0y8V
         Z8kkuRwcTJEJKMmSVqxxHJSA6lgr47NYVS3pcrDhPmpbrnci3pEemtu5bzY1sZRZX0KG
         A8KlfJcNX8TLEuLifi3/JuZT9NXt9DHxcTru1D1k/In0P1Tk6tuwW5TYHk0Dv7V3bxSt
         umhz7sNKNWWWIe6L+KqMIFWusJd68kpp9Ed/tomngMiekAZ8bqNUQK9Yr68ZesGQuJjl
         lgQwUkS0bntDGxtcggXlIGUm22g4OwtqE0Xfvm95CH1fGlXbwRySTSsZPWZxDAmqrctJ
         JkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727824948; x=1728429748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e+3roFwqnz7KfzKrcHRy5h+KYJ0F6DpV6iKdleWjAeE=;
        b=xB/RPmrgQKCTKmBP1KCHkAVctoY7lm7JbnrvTS7N6wG1+/EiuJMxRHSZwK+xjfsX+E
         UyX5KODemh/lBrWTmWvAaKX9cVJhjYJZj6MVGdP3jPEc5KX1KjvqCu3M/eQdfVYrWpaT
         cqyuuYbqtZRfKacwelVWRM1uwGwWIJkhjzAJssIqNlR0VhV0ja4eAgHndvBJ5k417brm
         mZSd4JT6WPXia+ZCMotqus+7nDv6FY/CwKCjX5QK5QdiZBU5m0K11orbKsM2vq/btmRh
         yKwFND/nM0x4wcsr2QG/kICESEuedrvNnC835I+d3xBTxlFU9V11IV30LgSZjvvXXnV/
         KcJg==
X-Gm-Message-State: AOJu0YwV5LYon3Wy6RZprFMi7IMG5KtdoATQl2a3LsLCzVcLrT+G/9f/
	axvRm3r/F3MLXobu+FszOZD/Q7uiXF/1kevm22zJxXJ/ob4VSWsT
X-Google-Smtp-Source: AGHT+IGsyYD1D6/aUn4N1EIHYIabS5E6UnIMHipZrj3rLPDSYWroUmnExSGeh0SGJtA5HSfUothyNQ==
X-Received: by 2002:a05:600c:5108:b0:42c:b942:1bba with SMTP id 5b1f17b1804b1-42f778f3633mr6763365e9.27.1727824947554;
        Tue, 01 Oct 2024 16:22:27 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:41f4:a392:1d5:d74d? (2a02-8389-41cf-e200-41f4-a392-01d5-d74d.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:41f4:a392:1d5:d74d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79ead833sm2762305e9.13.2024.10.01.16.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 16:22:27 -0700 (PDT)
Message-ID: <a5daf645-8fa0-44b8-a371-2795a34abb25@gmail.com>
Date: Wed, 2 Oct 2024 01:22:24 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/mfd/intel-m10-bmc-spi.c:28:10: error: 'const struct
 regmap_config' has no member named 'reg_bits'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>
References: <202410020505.B2WRKx9B-lkp@intel.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <202410020505.B2WRKx9B-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/10/2024 23:57, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
> commit: 9842c62162858c7b0625dd3e00085b68167257d3 mfd: intel-m10-bmc: Constify struct regmap_config
> date:   5 weeks ago
> config: x86_64-randconfig-001-20231120 (https://download.01.org/0day-ci/archive/20241002/202410020505.B2WRKx9B-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020505.B2WRKx9B-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410020505.B2WRKx9B-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/sched.h:38,
>                     from include/linux/ratelimit.h:6,
>                     from include/linux/dev_printk.h:16,
>                     from drivers/mfd/intel-m10-bmc-spi.c:8:
>    include/linux/mm_types_task.h:19:45: warning: "CONFIG_SPLIT_PTLOCK_CPUS" is not defined, evaluates to 0 [-Wundef]
>       19 | #define USE_SPLIT_PTE_PTLOCKS   (NR_CPUS >= CONFIG_SPLIT_PTLOCK_CPUS)
>          |                                             ^~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/mm.h:2888:5: note: in expansion of macro 'USE_SPLIT_PTE_PTLOCKS'
>     2888 | #if USE_SPLIT_PTE_PTLOCKS
>          |     ^~~~~~~~~~~~~~~~~~~~~
>    include/linux/mm_types_task.h:19:45: warning: "CONFIG_SPLIT_PTLOCK_CPUS" is not defined, evaluates to 0 [-Wundef]
>       19 | #define USE_SPLIT_PTE_PTLOCKS   (NR_CPUS >= CONFIG_SPLIT_PTLOCK_CPUS)
>          |                                             ^~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/mm_types_task.h:20:34: note: in expansion of macro 'USE_SPLIT_PTE_PTLOCKS'
>       20 | #define USE_SPLIT_PMD_PTLOCKS   (USE_SPLIT_PTE_PTLOCKS && \
>          |                                  ^~~~~~~~~~~~~~~~~~~~~
>    include/linux/mm.h:3010:5: note: in expansion of macro 'USE_SPLIT_PMD_PTLOCKS'
>     3010 | #if USE_SPLIT_PMD_PTLOCKS
>          |     ^~~~~~~~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:16:34: error: array type has incomplete element type 'struct regmap_range'
>       16 | static const struct regmap_range m10bmc_regmap_range[] = {
>          |                                  ^~~~~~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:17:9: error: implicit declaration of function 'regmap_reg_range'; did you mean 'remap_pfn_range'? [-Werror=implicit-function-declaration]
>       17 |         regmap_reg_range(M10BMC_N3000_LEGACY_BUILD_VER, M10BMC_N3000_LEGACY_BUILD_VER),
>          |         ^~~~~~~~~~~~~~~~
>          |         remap_pfn_range
>    drivers/mfd/intel-m10-bmc-spi.c:22:21: error: variable 'm10bmc_access_table' has initializer but incomplete type
>       22 | static const struct regmap_access_table m10bmc_access_table = {
>          |                     ^~~~~~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:23:10: error: 'const struct regmap_access_table' has no member named 'yes_ranges'
>       23 |         .yes_ranges     = m10bmc_regmap_range,
>          |          ^~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:23:27: warning: excess elements in struct initializer
>       23 |         .yes_ranges     = m10bmc_regmap_range,
>          |                           ^~~~~~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:23:27: note: (near initialization for 'm10bmc_access_table')
>    drivers/mfd/intel-m10-bmc-spi.c:24:10: error: 'const struct regmap_access_table' has no member named 'n_yes_ranges'
>       24 |         .n_yes_ranges   = ARRAY_SIZE(m10bmc_regmap_range),
>          |          ^~~~~~~~~~~~
>    In file included from include/linux/bitfield.h:10,
>                     from drivers/mfd/intel-m10-bmc-spi.c:7:
>    include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
>       16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
>          |                                                   ^
>    include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
>      243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>          |                                 ^~~~~~~~~~~~~~~~~
>    include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
>       11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>          |                                                           ^~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:24:27: note: in expansion of macro 'ARRAY_SIZE'
>       24 |         .n_yes_ranges   = ARRAY_SIZE(m10bmc_regmap_range),
>          |                           ^~~~~~~~~~
>    In file included from include/linux/kernel.h:16,
>                     from include/linux/cpumask.h:11,
>                     from arch/x86/include/asm/tlbbatch.h:5,
>                     from include/linux/mm_types_task.h:16:
>    include/linux/array_size.h:11:25: warning: excess elements in struct initializer
>       11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>          |                         ^
>    drivers/mfd/intel-m10-bmc-spi.c:24:27: note: in expansion of macro 'ARRAY_SIZE'
>       24 |         .n_yes_ranges   = ARRAY_SIZE(m10bmc_regmap_range),
>          |                           ^~~~~~~~~~
>    include/linux/array_size.h:11:25: note: (near initialization for 'm10bmc_access_table')
>       11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>          |                         ^
>    drivers/mfd/intel-m10-bmc-spi.c:24:27: note: in expansion of macro 'ARRAY_SIZE'
>       24 |         .n_yes_ranges   = ARRAY_SIZE(m10bmc_regmap_range),
>          |                           ^~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:27:21: error: variable 'intel_m10bmc_regmap_config' has initializer but incomplete type
>       27 | static const struct regmap_config intel_m10bmc_regmap_config = {
>          |                     ^~~~~~~~~~~~~
>>> drivers/mfd/intel-m10-bmc-spi.c:28:10: error: 'const struct regmap_config' has no member named 'reg_bits'
>       28 |         .reg_bits = 32,
>          |          ^~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:28:21: warning: excess elements in struct initializer
>       28 |         .reg_bits = 32,
>          |                     ^~
>    drivers/mfd/intel-m10-bmc-spi.c:28:21: note: (near initialization for 'intel_m10bmc_regmap_config')
>>> drivers/mfd/intel-m10-bmc-spi.c:29:10: error: 'const struct regmap_config' has no member named 'val_bits'
>       29 |         .val_bits = 32,
>          |          ^~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:29:21: warning: excess elements in struct initializer
>       29 |         .val_bits = 32,
>          |                     ^~
>    drivers/mfd/intel-m10-bmc-spi.c:29:21: note: (near initialization for 'intel_m10bmc_regmap_config')
>>> drivers/mfd/intel-m10-bmc-spi.c:30:10: error: 'const struct regmap_config' has no member named 'reg_stride'
>       30 |         .reg_stride = 4,
>          |          ^~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:30:23: warning: excess elements in struct initializer
>       30 |         .reg_stride = 4,
>          |                       ^
>    drivers/mfd/intel-m10-bmc-spi.c:30:23: note: (near initialization for 'intel_m10bmc_regmap_config')
>>> drivers/mfd/intel-m10-bmc-spi.c:31:10: error: 'const struct regmap_config' has no member named 'wr_table'
>       31 |         .wr_table = &m10bmc_access_table,
>          |          ^~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:31:21: warning: excess elements in struct initializer
>       31 |         .wr_table = &m10bmc_access_table,
>          |                     ^
>    drivers/mfd/intel-m10-bmc-spi.c:31:21: note: (near initialization for 'intel_m10bmc_regmap_config')
>>> drivers/mfd/intel-m10-bmc-spi.c:32:10: error: 'const struct regmap_config' has no member named 'rd_table'
>       32 |         .rd_table = &m10bmc_access_table,
>          |          ^~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:32:21: warning: excess elements in struct initializer
>       32 |         .rd_table = &m10bmc_access_table,
>          |                     ^
>    drivers/mfd/intel-m10-bmc-spi.c:32:21: note: (near initialization for 'intel_m10bmc_regmap_config')
>>> drivers/mfd/intel-m10-bmc-spi.c:33:10: error: 'const struct regmap_config' has no member named 'max_register'
>       33 |         .max_register = M10BMC_N3000_MEM_END,
>          |          ^~~~~~~~~~~~
>    In file included from drivers/mfd/intel-m10-bmc-spi.c:11:
>    include/linux/mfd/intel-m10-bmc.h:20:41: warning: excess elements in struct initializer
>       20 | #define M10BMC_N3000_FLASH_END          0x1fffffff
>          |                                         ^~~~~~~~~~
>    include/linux/mfd/intel-m10-bmc.h:21:41: note: in expansion of macro 'M10BMC_N3000_FLASH_END'
>       21 | #define M10BMC_N3000_MEM_END            M10BMC_N3000_FLASH_END
>          |                                         ^~~~~~~~~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:33:25: note: in expansion of macro 'M10BMC_N3000_MEM_END'
>       33 |         .max_register = M10BMC_N3000_MEM_END,
>          |                         ^~~~~~~~~~~~~~~~~~~~
>    include/linux/mfd/intel-m10-bmc.h:20:41: note: (near initialization for 'intel_m10bmc_regmap_config')
>       20 | #define M10BMC_N3000_FLASH_END          0x1fffffff
>          |                                         ^~~~~~~~~~
>    include/linux/mfd/intel-m10-bmc.h:21:41: note: in expansion of macro 'M10BMC_N3000_FLASH_END'
>       21 | #define M10BMC_N3000_MEM_END            M10BMC_N3000_FLASH_END
>          |                                         ^~~~~~~~~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:33:25: note: in expansion of macro 'M10BMC_N3000_MEM_END'
>       33 |         .max_register = M10BMC_N3000_MEM_END,
>          |                         ^~~~~~~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c: In function 'intel_m10_bmc_spi_probe':
>    drivers/mfd/intel-m10-bmc-spi.c:76:25: error: implicit declaration of function 'devm_regmap_init_spi_avmm' [-Werror=implicit-function-declaration]
>       76 |         ddata->regmap = devm_regmap_init_spi_avmm(spi, &intel_m10bmc_regmap_config);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:76:23: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>       76 |         ddata->regmap = devm_regmap_init_spi_avmm(spi, &intel_m10bmc_regmap_config);
>          |                       ^
>    drivers/mfd/intel-m10-bmc-spi.c: At top level:
>    drivers/mfd/intel-m10-bmc-spi.c:120:34: error: array type has incomplete element type 'struct regmap_range'
>      120 | static const struct regmap_range m10bmc_d5005_fw_handshake_regs[] = {
>          |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:130:34: error: array type has incomplete element type 'struct regmap_range'
>      130 | static const struct regmap_range m10bmc_n3000_fw_handshake_regs[] = {
>          |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
>       16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
>          |                                                   ^
>    include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
>      243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>          |                                 ^~~~~~~~~~~~~~~~~
>    include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
>       11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>          |                                                           ^~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:142:38: note: in expansion of macro 'ARRAY_SIZE'
>      142 |         .handshake_sys_reg_nranges = ARRAY_SIZE(m10bmc_n3000_fw_handshake_regs),
>          |                                      ^~~~~~~~~~
>    include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
>       16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
>          |                                                   ^
>    include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
>      243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>          |                                 ^~~~~~~~~~~~~~~~~
>    include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
>       11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>          |                                                           ^~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:150:38: note: in expansion of macro 'ARRAY_SIZE'
>      150 |         .handshake_sys_reg_nranges = ARRAY_SIZE(m10bmc_d5005_fw_handshake_regs),
>          |                                      ^~~~~~~~~~
>    include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
>       16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
>          |                                                   ^
>    include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
>      243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>          |                                 ^~~~~~~~~~~~~~~~~
>    include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
>       11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>          |                                                           ^~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:158:38: note: in expansion of macro 'ARRAY_SIZE'
>      158 |         .handshake_sys_reg_nranges = ARRAY_SIZE(m10bmc_n3000_fw_handshake_regs),
>          |                                      ^~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:22:41: error: storage size of 'm10bmc_access_table' isn't known
>       22 | static const struct regmap_access_table m10bmc_access_table = {
>          |                                         ^~~~~~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:27:35: error: storage size of 'intel_m10bmc_regmap_config' isn't known
>       27 | static const struct regmap_config intel_m10bmc_regmap_config = {
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:130:34: warning: 'm10bmc_n3000_fw_handshake_regs' defined but not used [-Wunused-variable]
>      130 | static const struct regmap_range m10bmc_n3000_fw_handshake_regs[] = {
>          |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:120:34: warning: 'm10bmc_d5005_fw_handshake_regs' defined but not used [-Wunused-variable]
>      120 | static const struct regmap_range m10bmc_d5005_fw_handshake_regs[] = {
>          |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/mfd/intel-m10-bmc-spi.c:16:34: warning: 'm10bmc_regmap_range' defined but not used [-Wunused-variable]
>       16 | static const struct regmap_range m10bmc_regmap_range[] = {
>          |                                  ^~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> 
> 
> vim +28 drivers/mfd/intel-m10-bmc-spi.c
> 
> 8169f74ca6f318 drivers/mfd/intel-m10-bmc.c     Matthew Gerlach 2021-03-10  26  
> 9842c62162858c drivers/mfd/intel-m10-bmc-spi.c Javier Carrasco 2024-07-04  27  static const struct regmap_config intel_m10bmc_regmap_config = {
> 876611c493b10c drivers/mfd/intel-m10-bmc.c     Xu Yilun        2020-09-15 @28  	.reg_bits = 32,
> 876611c493b10c drivers/mfd/intel-m10-bmc.c     Xu Yilun        2020-09-15 @29  	.val_bits = 32,
> 876611c493b10c drivers/mfd/intel-m10-bmc.c     Xu Yilun        2020-09-15 @30  	.reg_stride = 4,
> 8169f74ca6f318 drivers/mfd/intel-m10-bmc.c     Matthew Gerlach 2021-03-10 @31  	.wr_table = &m10bmc_access_table,
> 8169f74ca6f318 drivers/mfd/intel-m10-bmc.c     Matthew Gerlach 2021-03-10 @32  	.rd_table = &m10bmc_access_table,
> bcababfc60ccc6 drivers/mfd/intel-m10-bmc-spi.c Ilpo Järvinen   2023-01-16 @33  	.max_register = M10BMC_N3000_MEM_END,
> 876611c493b10c drivers/mfd/intel-m10-bmc.c     Xu Yilun        2020-09-15  34  };
> 876611c493b10c drivers/mfd/intel-m10-bmc.c     Xu Yilun        2020-09-15  35  
> 
> :::::: The code at line 28 was first introduced by commit
> :::::: 876611c493b10cbb59e0e2143d3e744d0442de63 mfd: intel-m10-bmc: Add Intel MAX 10 BMC chip support for Intel FPGA PAC
> 
> :::::: TO: Xu Yilun <yilun.xu@intel.com>
> :::::: CC: Lee Jones <lee.jones@linaro.org>
> 


I followed the "how to reproduce" guide step by step, but it compiled
just fine (gcc-12.3.0 instead of 12.2.0, though).

On the other hand there has been a similar bug in hwmon[1] and it had
nothing to do with making the struct const, wich actually uncovered a
missing select (in that case REGMAP_I2C).

I would say we are facing the same thing here, and 'select
REGMAP_SPI_AVMM' is probably not enough. Is adding a 'select REGMAP_SPI'
for MFD_INTEL_M10_BMC_SPI the right approach? I could not test it myself
because as I said, it compiled without those errors.


Link:
https://lore.kernel.org/oe-kbuild-all/202410020246.2cTDDx0X-lkp@intel.com/
[1]

Best regards,
Javier Carrasco
