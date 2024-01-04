Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B8221101
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 11:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGr7DHAQ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a279ce3aab9so48259566b.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Jan 2024 03:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704367648; x=1704972448; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pVTzrfr9GZA3UY//E7UWyLjKPOakT/U+oW4hijSpjQE=;
        b=zGr7DHAQ1tHsvMm7BBU5lqUxxnznSPfdOGe6AstyAGaz5waWitTA/QKGagadLpk/2L
         +8nsAPLQ2/khL7x3fkNO0OOpYQAumJO6C96jdXy/ln8KRYLwtg4MEfBTUOBzkwTIvK5Z
         AuynsIuC878VDDTJYS6vm2gRNt2jAXBKCZfaHl9zmx4jrwFm/CtZs+UOOFLOoJRNhyIC
         YXw+LFgwpJm+oCs42WFleSwM9zVb/TwGJii1BrOt8jOlqkjy+yA9DQbPMItpysgCIs9S
         p9wcL3cTscP847ZXcR++VMQ2xONQsT411x8Kte8D+8oHu8xCyD/CizRGQPs6bq1G6kYA
         ADXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704367648; x=1704972448;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pVTzrfr9GZA3UY//E7UWyLjKPOakT/U+oW4hijSpjQE=;
        b=PFS4Nueq/by9kM24Lh0uW2depHBlNkkj9Cve9i5l+SDw9vACcv7JtiRy573PonsIrW
         eXNlvFW3l3Z3GH4xJx+SbzvsO+TsF77RE1t2Ule0zUivSeGjRMQZN1q414kBrM+8oXvF
         Vhu2NgZ2n/u52lPRc6Ka4OJ/klp/eTsOIrm8XZm1ONfCbVzsoEmjvPhBAL1cTast/Cgd
         fKW8nVU2JKk95bqUEn9f1MTZ8q1bc1nZHJUBfotfYA0npo2mhMRnq2qzM1R+z2BeOoDi
         4bG8tZJaHhmXGGXcYLjfW/+rBMOrFTmsqCM/FV+iOt7WEe0ao/1eEJDNX4LSQnDG/1nR
         McDA==
X-Gm-Message-State: AOJu0Yz1dU25hKC7XPgxOsRpsUPkNQ+uAedCIiErUHr1nVGus5HZOVuw
	jZbbS8XnaG7Ckjl3Fwn/Ilam1+hHfLgmKQ==
X-Google-Smtp-Source: AGHT+IFT8p6ISNDQ7jmYQiJ1bTrzoH7XIlhuJHaj2R3o92vzBUuH89axbBnfHGGum6t63s7MHZT7hA==
X-Received: by 2002:a17:906:2518:b0:a28:a7f4:65dc with SMTP id i24-20020a170906251800b00a28a7f465dcmr110057ejb.299.1704367648507;
        Thu, 04 Jan 2024 03:27:28 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id ka24-20020a170907921800b00a26abf393d0sm13105560ejb.138.2024.01.04.03.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 03:27:28 -0800 (PST)
Date: Thu, 4 Jan 2024 14:27:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/gpio-reset-controller-shared 18/18]
 drivers/reset/core.c:837 __reset_gpios_args_match() warn: variable
 dereferenced before check 'a2' (see line 834)
Message-ID: <a220a7a3-1eef-4e87-836e-44e4eadcbea4@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/gpio-reset-controller-shared
head:   432bf1b2293de8d4f827f6ee3e32da747ddc44a3
commit: 432bf1b2293de8d4f827f6ee3e32da747ddc44a3 [18/18] reset core WIP
config: i386-randconfig-141-20231231 (https://download.01.org/0day-ci/archive/20231231/202312311338.jKP1GdFw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312311338.jKP1GdFw-lkp@intel.com/

smatch warnings:
drivers/reset/core.c:837 __reset_gpios_args_match() warn: variable dereferenced before check 'a2' (see line 834)

vim +/a2 +837 drivers/reset/core.c

432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  829  static bool __reset_gpios_args_match(const struct of_phandle_args *a1,
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  830  				     const struct of_phandle_args *a2)
2a9529168d430a Krzysztof Kozlowski 2023-12-28  831  {
2a9529168d430a Krzysztof Kozlowski 2023-12-28  832  	unsigned int i;
2a9529168d430a Krzysztof Kozlowski 2023-12-28  833  
2a9529168d430a Krzysztof Kozlowski 2023-12-28 @834  	pr_err("%s:%d AAA comparing %pOF == %pOF, r->of_args=%px\n",
2a9529168d430a Krzysztof Kozlowski 2023-12-28  835  	       __func__, __LINE__,
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  836  	       a1->np, a2->np, a2);
                                                                       ^^^^^^
Dereference

432bf1b2293de8 Krzysztof Kozlowski 2023-12-30 @837  	if (!a2)
                                                            ^^^
Checked too late


2a9529168d430a Krzysztof Kozlowski 2023-12-28  838  		return false;
2a9529168d430a Krzysztof Kozlowski 2023-12-28  839  
2a9529168d430a Krzysztof Kozlowski 2023-12-28  840  	pr_err("%s:%d AAA comparing %pOF == %pOF | %u == %u\n",
2a9529168d430a Krzysztof Kozlowski 2023-12-28  841  	       __func__, __LINE__,
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  842  	       a1->np, a2->np,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

