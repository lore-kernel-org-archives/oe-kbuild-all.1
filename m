Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F03D20B1E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274135; cv=none; b=dMrIL1VY+OtcJv+jsjs20Mcz+sr4D3kXb3ApGG0AxXQ1+8QiysLZ0HG6z7kdo3niIRLZsli5IYvbyYXQElYvFBa5fhcgxzSskHPv3ME8TSbGo8reJUpbSTAlP8Dw/LT237wQCAKFbkvFLg3EnPRUEVEeLkyA6IggCCHbiNkv1y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274135; c=relaxed/simple;
	bh=JdYcK6fAGQtlodFRUy0bhtgD36qMwbdQO7D7iUkLixc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zt3B8mkHMj9FGdf9KztqeQHwhiXFAy/O4zrrIFSajmK4Vu9oprh8ijdQOXMmMsDSsW27UycUwm3+iD5yTX3aK2bOm/9icNUe3FslDY41pGpODbIUCGiGZCLJ1eLU0gYHL1oFIkNRco+PdbPgmBMBgCp3xC64w0f8daZapiog83o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wfdGVXG5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wfdGVXG5"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso249619f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 01:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744274131; x=1744878931; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1+ytBosE9KKYfsxuSA5vHZYEINNgxVHBZaHGuzR0zM=;
        b=wfdGVXG5XQxrio+G2xo59q5pNUTNwrebLMM0WEWJ/RFmEywTJ699cA1tzHPNabVX6y
         b0ntJa+8y2b5IDC/KYv6dKTZFtBqzNzgHCPcmojdi9dru1/XLoINAVmiAZ8U9H8Srh13
         3d9qqihZPH+qF/0X7BJdg4GpDx2GJ8eshwWgeTgUhJQwHhaLUxD4nMCw69MdNSb4D4mT
         3q7UbEZdD7I4+uikrj3V6jPYzvmy9DatKyI+f0JWyA28c8EPsXpnas5awziOR5pM4Kc8
         bfKsuTIF0Fl/Yu7hj9saD//xqPa5u7peFerEfHKggREyNTJwKYHsQOPxYV73GQAxhKtT
         U40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744274131; x=1744878931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1+ytBosE9KKYfsxuSA5vHZYEINNgxVHBZaHGuzR0zM=;
        b=Fat8xqDPgmN2+5vJRoq5yZr+2tZRQwqnGZJ0x5+2XwDdy0CZhm1vyomrQA1iiK7FMV
         p0uDevLSNkxWyx3C46OozTd+EUpg2TynBMCqJdOoiv5puWfcX/2PC81KLnvkvt+BU1gm
         QIo5yn40KZBBE2qtmR4I/aMh0NKfy2rNMKjGkWtzOjUE8/lU1jx63RmIWJMM5hb8ket1
         Ltn19lmrkmDyng5vCeAiXPQmMqseXCe9jWdRCLToKLCfBHtNNVjPji2h407xDPW8BZuB
         gx2iRH71XoK9oXZ/XPzC0KkOaNg8sB9Gkb1lgJPWMSJ6Qaq+pE+OhYiF0cvMME9AttQa
         mlmw==
X-Forwarded-Encrypted: i=1; AJvYcCUpHZM80E0k0gPjOkvwaLM/JTGwJJ2QXoiAI42ARivrHPExgmPFAvIIAC6NcMS/Le2vgAMfcKjxzun/ikRj@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+f97+FpH6ickTQ3nJXDpBEvZsffHW44JmAACb93CP/cLIsf4t
	vfIxtCAUWgGui0OiXWGZp2anDv3MjZB2SoKTvlDMCCL22caAp5wexjY3vmP0JNc=
X-Gm-Gg: ASbGncst3n6wlN82RbFFn8AyPOpuWe02vjk1V0SLjgfyfMshika+YHSCVsqf3Yllhtp
	629RwAt8ihndBA5cvWFTBDGA/kTle6A/EFDkrqQT0Z7pohcdEXqfeD0RT9ObJwhc65As5w3b84T
	fIlwRsVnkDgDMDfhp/A10N8ZqnEpRADVmkl7VPspsa0z70S1z0X39l+Tc/Zj2QygPDE3N7NVGL4
	XC+e2cDkxiPMX4+LvxKcP0vD2QOHkm2TsMO9aRNW0t9hXfEiqU/t3U49AGNFeshekoOr/9p0ted
	5ZBS/gxVhxmYRHhc6ASgLWcn+eV0yjKRQDhnh7cOitezSA==
X-Google-Smtp-Source: AGHT+IG4hFp0SZ/GX5y1K3OD+w9YXQH3jCqLKyFID+cibmYCTQbSECvA/Q29TPvpdqbyjEyE/E8lrw==
X-Received: by 2002:a05:6000:4203:b0:39c:1f02:449f with SMTP id ffacd0b85a97d-39d8f272aa3mr1264796f8f.2.1744274131466;
        Thu, 10 Apr 2025 01:35:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d893fe28fsm4078162f8f.96.2025.04.10.01.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:35:31 -0700 (PDT)
Date: Thu, 10 Apr 2025 11:35:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	kernel test robot <lkp@intel.com>,
	Guenter Roeck <linux@roeck-us.net>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [groeck-staging:hwmon-next 13/13]
 drivers/hwmon/gpio-fan.c:250:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <d80689a3-6055-449d-9475-5e8e4f1ddabf@stanley.mountain>
References: <202504091047.biuX8Kl2-lkp@intel.com>
 <82d98804-e9b6-458e-bb39-3a48c10e9f70@roeck-us.net>
 <2368483.ElGaqSPkdT@steina-w>
 <20250409160250.GB1506425@ax162>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409160250.GB1506425@ax162>

Another option is Smatch.

https://github.com/error27/smatch

:! ~/progs/smatch/release/smatch_scripts/kchecker drivers/hwmon/gpio-fan.c
  CHECK   scripts/mod/empty.c
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC      drivers/hwmon/gpio-fan.o
  CHECK   drivers/hwmon/gpio-fan.c
drivers/hwmon/gpio-fan.c:145 set_fan_speed() warn: potential spectre issue 'fan_data->speed' [w] (local cap)
drivers/hwmon/gpio-fan.c:255 pwm1_enable_store() error: uninitialized symbol 'ret'.

I don't think the spectre v1 issue is real but I don't know very much
about spectre.

regards,
dan carpenter

