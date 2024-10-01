Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7581CCB49
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 18:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727808794; cv=none; b=QFuxl+sIstmPRJ5B98cTJ5gi5kgAIig/vimtu82rrkkWPLNc4mJw7ynjpQl4A1vO/XchaGiZEikDcc3syxKO2+P9YNrJJdxptX1tubZo/pBtpESuwwoUb6CQ6tj99qMz4f4bD+bQ0vsURNvd4uBvwPjKUmwv4Wo0T9YBQJ4TOlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727808794; c=relaxed/simple;
	bh=RKVTxXmu0mJ8vpYz7Lre6M7553GOPvI1y27xIzgs4U4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dprSdyDBFdlgV0euHBQkYmQeRbKgtM3S/bnBvotLtnTWSQl0jaYvvmsYTc5sduFh2DObzLi2IgOb9DiRXGucO26MAzz5kTY94vG5IgpSfuzsZll3CRRuw/O510CESZLWl02Nt/RDyKNnmkn17AuJLoTUfDx6bwJaPY5RHUl5Bw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUfZ7PKH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUfZ7PKH"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42f56ad2afaso63883265e9.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 01 Oct 2024 11:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727808790; x=1728413590; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NFldLmOGhmvEKr3Li539baXXwtjlZVpyKg0aS8EMUXc=;
        b=UUfZ7PKHfHLmL/2qap8hJ+f8d1VTKITM84mFmF5UXZNko6fGNgms5ItCfc3rGcg43q
         HpEYDo6XuC8T0nLXVgnj680EGl9SrNJR+4DA5i24DTR6zYscmexhcxnXbq141FQ0VSE1
         CoQul4szCSn4hwZvQMW+tY7IeWWxaJsNReg/1S8mjvc4LiJeoOL+mEfiUr/38eIzWKSn
         Dzqu2b1aznHN5vSS585ApcSogo6qKE827HNF9BISGbUeOiAUwzVRntFVl0oRGRzDIgp2
         vQdGUBb1olNzLDo3JkPsQUFKt5I0lyDsVyUl2atPGULw9yjDhd/e9ogMjsXE7rrTmOXy
         dr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727808790; x=1728413590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFldLmOGhmvEKr3Li539baXXwtjlZVpyKg0aS8EMUXc=;
        b=M4ponAXGxFdoFdhaYRdGtLm2aaehS3MnVEQqwvPMXMWqoJh4xYaKAzVcaGn3Nn07Pn
         Aewb5BAGkHd40P6QeA5SEunUvJYr2pcglPE4mTZrM8RK460d4V15wmvF1pgkWBWrGjgm
         3xFuSi6rG7KTiKJYG8ZhbXe9TYlYKjp7fxo82ikJeqidbgu/yAJoOk4npug/VVxoU7Qp
         EtH+5qNQ7IVZWWNHHUetzE4IQl72BeCm+hLe8i0qQ2fDOg9ZQBstX36OqIrmgZTa72ll
         MEVsssXa3aoM6yu0P7OCJj+Gztr2lifHbHpX7wGrcm2T4YdFiOhamTY+FStG9wDtUdgU
         +N7g==
X-Gm-Message-State: AOJu0YyTRUph6BJLxbc4aRP6SGu+x0D6n2AD6rjgFsCyiVCYrhaf0Mnl
	bR4V62vbdFqiWALFTcxVW4c1n88X1UfsM8cKWcKWz3g11HFIyFUaR2Woab3u
X-Google-Smtp-Source: AGHT+IHfCKC+eeWDq9dZKwzlvtokeIHGAIt79ChWu7WdCD0TyKSo7jV3jlQUVHIkKBaBtAO3y4DaBw==
X-Received: by 2002:a05:600c:4ed4:b0:42c:de34:34d8 with SMTP id 5b1f17b1804b1-42f777ef18emr3763995e9.27.1727808790146;
        Tue, 01 Oct 2024 11:53:10 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:41f4:a392:1d5:d74d? (2a02-8389-41cf-e200-41f4-a392-01d5-d74d.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:41f4:a392:1d5:d74d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57e13944sm141818675e9.30.2024.10.01.11.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 11:53:09 -0700 (PDT)
Message-ID: <dc59e32d-ed4a-43c8-a6f3-e4263d97c95f@gmail.com>
Date: Tue, 1 Oct 2024 20:53:07 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/hwmon/tmp513.c:163:10: error: 'const struct
 regmap_config' has no member named 'reg_bits'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
References: <202410020246.2cTDDx0X-lkp@intel.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <202410020246.2cTDDx0X-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2024 20:19, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
> commit: 4bc82dd20be09fa133bf3116be6afc933497f860 hwmon: (tmp513) Constify struct regmap_config
> date:   3 months ago
> config: x86_64-randconfig-r133-20240215 (https://download.01.org/0day-ci/archive/20241002/202410020246.2cTDDx0X-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020246.2cTDDx0X-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410020246.2cTDDx0X-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/hwmon/tmp513.c:162:21: error: variable 'tmp51x_regmap_config' has initializer but incomplete type
>      162 | static const struct regmap_config tmp51x_regmap_config = {
>          |                     ^~~~~~~~~~~~~
>>> drivers/hwmon/tmp513.c:163:10: error: 'const struct regmap_config' has no member named 'reg_bits'
>      163 |         .reg_bits = 8,
>          |          ^~~~~~~~
>    drivers/hwmon/tmp513.c:163:21: warning: excess elements in struct initializer
>      163 |         .reg_bits = 8,
>          |                     ^
>    drivers/hwmon/tmp513.c:163:21: note: (near initialization for 'tmp51x_regmap_config')
>>> drivers/hwmon/tmp513.c:164:10: error: 'const struct regmap_config' has no member named 'val_bits'
>      164 |         .val_bits = 16,
>          |          ^~~~~~~~
>    drivers/hwmon/tmp513.c:164:21: warning: excess elements in struct initializer
>      164 |         .val_bits = 16,
>          |                     ^~
>    drivers/hwmon/tmp513.c:164:21: note: (near initialization for 'tmp51x_regmap_config')
>>> drivers/hwmon/tmp513.c:165:10: error: 'const struct regmap_config' has no member named 'max_register'
>      165 |         .max_register = TMP51X_MAX_REGISTER_ADDR,
>          |          ^~~~~~~~~~~~
>    drivers/hwmon/tmp513.c:79:41: warning: excess elements in struct initializer
>       79 | #define TMP51X_MAX_REGISTER_ADDR        0xFF
>          |                                         ^~~~
>    drivers/hwmon/tmp513.c:165:25: note: in expansion of macro 'TMP51X_MAX_REGISTER_ADDR'
>      165 |         .max_register = TMP51X_MAX_REGISTER_ADDR,
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/hwmon/tmp513.c:79:41: note: (near initialization for 'tmp51x_regmap_config')
>       79 | #define TMP51X_MAX_REGISTER_ADDR        0xFF
>          |                                         ^~~~
>    drivers/hwmon/tmp513.c:165:25: note: in expansion of macro 'TMP51X_MAX_REGISTER_ADDR'
>      165 |         .max_register = TMP51X_MAX_REGISTER_ADDR,
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/hwmon/tmp513.c: In function 'tmp51x_probe':
>    drivers/hwmon/tmp513.c:726:24: error: implicit declaration of function 'devm_regmap_init_i2c' [-Werror=implicit-function-declaration]
>      726 |         data->regmap = devm_regmap_init_i2c(client, &tmp51x_regmap_config);
>          |                        ^~~~~~~~~~~~~~~~~~~~
>    drivers/hwmon/tmp513.c:726:22: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      726 |         data->regmap = devm_regmap_init_i2c(client, &tmp51x_regmap_config);
>          |                      ^
>    drivers/hwmon/tmp513.c: At top level:
>    drivers/hwmon/tmp513.c:756:1: warning: data definition has no type or storage class
>      756 | module_i2c_driver(tmp51x_driver);
>          | ^~~~~~~~~~~~~~~~~
>    drivers/hwmon/tmp513.c:756:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
>    drivers/hwmon/tmp513.c:756:1: warning: parameter names (without types) in function declaration
>    drivers/hwmon/tmp513.c:162:35: error: storage size of 'tmp51x_regmap_config' isn't known
>      162 | static const struct regmap_config tmp51x_regmap_config = {
>          |                                   ^~~~~~~~~~~~~~~~~~~~
>    drivers/hwmon/tmp513.c:747:26: warning: 'tmp51x_driver' defined but not used [-Wunused-variable]
>      747 | static struct i2c_driver tmp51x_driver = {
>          |                          ^~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> 
> 
> vim +163 drivers/hwmon/tmp513.c
> 
> 59dfa75e5d82a1 Eric Tremblay   2019-11-12  161  
> 4bc82dd20be09f Javier Carrasco 2024-07-02  162  static const struct regmap_config tmp51x_regmap_config = {
> 59dfa75e5d82a1 Eric Tremblay   2019-11-12 @163  	.reg_bits = 8,
> 59dfa75e5d82a1 Eric Tremblay   2019-11-12 @164  	.val_bits = 16,
> 59dfa75e5d82a1 Eric Tremblay   2019-11-12 @165  	.max_register = TMP51X_MAX_REGISTER_ADDR,
> 59dfa75e5d82a1 Eric Tremblay   2019-11-12  166  };
> 59dfa75e5d82a1 Eric Tremblay   2019-11-12  167  
> 
> :::::: The code at line 163 was first introduced by commit
> :::::: 59dfa75e5d82a1e1b3d090a1d51fc14f66844576 hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.
> 
> :::::: TO: Eric Tremblay <etremblay@distech-controls.com>
> :::::: CC: Guenter Roeck <linux@roeck-us.net>
> 


The bug is not in that commit, the Kconfig entry for this driver is
missing a 'select REGMAP_I2C'. I just tested it and then it builds
without any issues.

I can send a patch to fix that, but I would like to know what commit it
really fixes: the one that introduced the driver as it already used
regmap and did not include the required select? Or the one from this
report because it triggered, even though it is not the real source of
the issue?

Thanks and best regards,
Javier Carrasco
