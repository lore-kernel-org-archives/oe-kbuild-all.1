Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB52418E06
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gDyXZdyn"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e6ee8e911so8736256e87.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 03 Jan 2024 03:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704280458; x=1704885258; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0rBUePNsfxj9hHc+i24NkBNGZnA/maXpINtsn5yNH/w=;
        b=gDyXZdynsY7E/7O5JVdEU7k3kYJqSK+1euk08hyx8DOU3Wr4nb2iA5xZMZQ8tiya3S
         A9AbDhn9hRhPLWvYP7U9Ust+vXq3epeGeBmoC3iMo7UpzSh3NkEWBR5e4x7F0S20C5v9
         5Owyp/H7fWsoKwp1P4ifH9du6Ssk6fr0op1zNOQcaViuQQh9fBw8dV5+u8bPl6sGlcvS
         WGG887y5muNsVlqH2GMaLKN4RoSiNPMEDuHV1x8521JQmoTp2dR0hQ+qiELqOQNrmeFU
         paFVTPhH22bkZUCYnT1TfA6xKLSGGAlSQx9rJdN/FvHvn6eyjY3DP+9em7uwOA0k95o7
         8MAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704280458; x=1704885258;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0rBUePNsfxj9hHc+i24NkBNGZnA/maXpINtsn5yNH/w=;
        b=N0SxUFW5G5JJIhU8bEbY/ZxE8GFXwAAZ6rIhU5WRLrXH+K3zQbl/mzsQ3IQ1eRs//2
         DeqV17emRsBJIKOvlepUI0qVTSOaPOV6RFVVAJhVj7zmtOsJIFlNNMzbRO8AYEpNsOvU
         3eBJJqQr7D/iBZUNjsDAO1z3xcLW3xLzsFzjK0k6O/SLmrv4Fd4IbWng4ox/GyCjbeDs
         hgYZR3ULsZ7C1zXRTBohO1PmuSn+ufVNluMZ9Qt/hBqIvpqKW+10AVBaacdF4lfs3jnF
         rv0VRhwyTcdydgrusVA+QSjlHYshO5mD2XgbJ9lUFRDge0Eiwh8yFkFzwWidOAic6oSn
         j09A==
X-Gm-Message-State: AOJu0YxhvNuKkl7FoJKSrV2ZV+fWeni/jExeD2Vf34TXH1RhwpliOVT4
	8M5oqZ7ZSFv3Xk95+m8Qjd9xlOhnYbmgJA==
X-Google-Smtp-Source: AGHT+IGXcdzKOo4APAnwLjP9eJMs+N/JZYFhJvm8ONtjm5/eqD4RVyGdW76PjvBXx1B2fSQw05FNUQ==
X-Received: by 2002:a19:2d07:0:b0:50e:76cd:f3f with SMTP id k7-20020a192d07000000b0050e76cd0f3fmr6035129lfj.54.1704280458645;
        Wed, 03 Jan 2024 03:14:18 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id dg24-20020a0564021d1800b00552cf686df3sm17367232edb.52.2024.01.03.03.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 03:14:18 -0800 (PST)
Date: Wed, 3 Jan 2024 14:14:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, davidgow <davidgow@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-next:master 8829/9096] lib/kunit/device.c:138
 kunit_device_register_with_driver() warn: passing zero to 'ERR_CAST'
Message-ID: <309f601b-4af1-4127-a20b-88256203ca1d@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa4db8324c4d0e67aa4670356df4e9fae14b4d37
commit: d03c720e03bd9bf0b784d80b5d3ede7e2daf3b6e [8829/9096] kunit: Add APIs for managing devices
config: x86_64-randconfig-161-20231219 (https://download.01.org/0day-ci/archive/20231220/202312200124.CkSII1FB-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312200124.CkSII1FB-lkp@intel.com/

smatch warnings:
lib/kunit/device.c:138 kunit_device_register_with_driver() warn: passing zero to 'ERR_CAST'

vim +/ERR_CAST +138 lib/kunit/device.c

d03c720e03bd9b davidgow@google.com 2023-12-15  131  struct device *kunit_device_register_with_driver(struct kunit *test,
d03c720e03bd9b davidgow@google.com 2023-12-15  132  						 const char *name,
d03c720e03bd9b davidgow@google.com 2023-12-15  133  						 const struct device_driver *drv)
d03c720e03bd9b davidgow@google.com 2023-12-15  134  {
d03c720e03bd9b davidgow@google.com 2023-12-15  135  	struct kunit_device *kunit_dev = kunit_device_register_internal(test, name, drv);
d03c720e03bd9b davidgow@google.com 2023-12-15  136  
d03c720e03bd9b davidgow@google.com 2023-12-15  137  	if (IS_ERR_OR_NULL(kunit_dev))
d03c720e03bd9b davidgow@google.com 2023-12-15 @138  		return ERR_CAST(kunit_dev);

kunit_device_register_internal() doesn't return NULL.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

d03c720e03bd9b davidgow@google.com 2023-12-15  139  
d03c720e03bd9b davidgow@google.com 2023-12-15  140  	return &kunit_dev->dev;
d03c720e03bd9b davidgow@google.com 2023-12-15  141  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

