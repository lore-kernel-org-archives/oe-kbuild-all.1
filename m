Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C3C178370
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725093122; cv=none; b=gr76zRW8CFh+eOXAS7EZ+N7sUnFJHXPPEKMEfRlNsIC48WLRi/YJzmSwQeRkxWL5RoqjYD9Mys5BAYCohDOeP+90c0IsXFZfVySTe4OZ/jmJBVOJViP37kwoMfvqw943waUHDd//XRLRIWub2Pnmy37I0qZDXQ6Msrmf1tcH/So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725093122; c=relaxed/simple;
	bh=ygokJ3EuwP2KVqqlmTrJeAJWWdyXSr8sqWsV9WTAHco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=CDnpsC7epdtS2wSbz+dpo0mi7Rh0XdKhzwQQ5cKdfyZSFwBhd2Gmgb3BZO435PzmzbXc6LUsHU5vIQRZ5Pi2CN8BkjP3aYV8c2Nhugm8HcUC7qHntnbKXL1rLodH5TPube5GCdNl6wbXgjMbxDmTLza4ye9R/iBhOgDyGeRq6+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HgxCdzuq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HgxCdzuq"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3719753d365so1960072f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 01:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725093118; x=1725697918; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYKXU/GRuYajonH8bLwJRIkuKYJn/KULcoZQ/7PWKrE=;
        b=HgxCdzuqTNcNXd9U52XOlQksGSvvUM9nHl/wdVGg2CVLxOhhwHYX0nRKh61rBVOfsw
         eJ6Kqx5qnHDq/oGyu1FzcNTkVWjSYh/FH+VrWLd95v7SDEOqnc+fbdCtOZ4T8f3QUhzB
         OfHFDu/QNOcX6xurXWtaK6i1ZaGTQyZpwusf+pFV5Tob9P6zyy12sqSJgwARm2avFlCM
         dlUUi3ZqPS+1G9zHLGWOBvK48SHpgO+0kptGNsFTYVRuHjeusjHNR1KzxDq9swcxRdxB
         QmRrlTAibCIhFYZkvNYHk+UFVW9r7UvavAMRVa1pJ6STGKPEEyAkyw0zWAzNn/rhPr/R
         QFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725093118; x=1725697918;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYKXU/GRuYajonH8bLwJRIkuKYJn/KULcoZQ/7PWKrE=;
        b=ICLyc0b979eiRhZ3de5X8l5Xt2oETOb+4IRdJ82N6lHka0UrIiGjmDHLDiZFRBP3n1
         Yi3kQM2cudiVaV8GvYeL2cOTWTGIc3KJanbde2nMsReCTa3AB1M6LpeuWVK2KrZWzOKg
         Y61Nao0Wl1kNXSOxKpeUNdhAKc0GARgnRS+tna4zs2cL+ul8DH70xpoLMQ5DWhChltqV
         yA83z9lwegtpWVyuML1CTik0NEdL09L2H1a9KgvEJIKecEFX6H87xgkF1rGfOlUB+c+R
         CyaInrQmNzMd18Nt8WL63YjY+Bd5pKQoamrTQakYUQ/Pot4hvC/yo3DmcOEtTnyjVOGe
         y0Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVJp0thhGgfQLBfMfXnmkLp3Ov+2M2ZuJrc7FPJI6tZ7DJWPgcpQm4rFgT5ehVfRGUI32duObmFTXX0R3Xv@lists.linux.dev
X-Gm-Message-State: AOJu0YzoFAdGywjEHFUf8rW3OdS29rI5TzU8Kp6xY4H5CvjKfA5SHsgE
	LZtj9wwrRDLe/0OyRu22NFRT25F4pQ5YeLU2CPH/3Skrkw+TwvA+GyEMNljNDV8=
X-Google-Smtp-Source: AGHT+IEY8B96yyKAmsk7FOyikce6yeIKfN0PQpvR2+w944msLHKH11XTNcpqiCg0x0+w3FqoiWogJA==
X-Received: by 2002:adf:e5c9:0:b0:374:c2e9:28b8 with SMTP id ffacd0b85a97d-374c2e92d16mr52551f8f.18.1725093118067;
        Sat, 31 Aug 2024 01:31:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c08e07b6sm759594f8f.63.2024.08.31.01.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 01:31:57 -0700 (PDT)
Date: Sat, 31 Aug 2024 11:31:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Scally <djrscally@gmail.com>
Subject: Re: [PATCH v2 2/4] platform/x86: int3472: Simplify dev_err_probe()
 usage
Message-ID: <20dd56f0-78ea-4255-86ac-32151160b83d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822130722.1261891-3-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/driver-core-Ignore-0-in-dev_err_probe/20240826-113856
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240822130722.1261891-3-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 2/4] platform/x86: int3472: Simplify dev_err_probe() usage
config: i386-randconfig-141-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310807.sNPe5Mr2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408310807.sNPe5Mr2-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel/int3472/discrete.c:292 skl_int3472_handle_gpio_resources() error: uninitialized symbol 'err_msg'.
drivers/platform/x86/intel/int3472/discrete.c:292 skl_int3472_handle_gpio_resources() warn: passing zero to 'dev_err_probe'

vim +/err_msg +292 drivers/platform/x86/intel/int3472/discrete.c

5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  270  		case INT3472_GPIO_TYPE_POWER_ENABLE:
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  271  			ret = skl_int3472_register_regulator(int3472, gpio);
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  272  			if (ret)
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  273  				err_msg = "Failed to map regulator to sensor\n";
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  274  
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  275  			break;
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  276  		default: /* Never reached */
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  277  			ret = -EINVAL;
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  278  			break;
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  279  		}
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  280  		break;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  281  	default:
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  282  		dev_warn(int3472->dev,
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  283  			 "GPIO type 0x%02x unknown; the sensor may not work\n",
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  284  			 type);
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  285  		ret = 1;
                                                                                                                                ^^^^^^^^

5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  286  		break;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  287  	}
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  288  
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  289  	int3472->ngpios++;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  290  	ACPI_FREE(obj);
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  291  
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03 @292  	return dev_err_probe(int3472->dev, ret, err_msg);

This is the success path.  "err_msg" is only set for the error path.  "ret" is 1
so it will use the uninitialized data.  But even if ret were zero, it's illegal
to pass uninitialized variables to functions which aren't inlined.

1) It's undefined behavior
2) Linus said so
3) It causes UBSan warnings at runtime.

regards,
dan carpenter

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

