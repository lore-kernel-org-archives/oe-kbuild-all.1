Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F10911197
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 08:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707121201; cv=none; b=KAoEDMLxOq6hNRRycos7X6NtcA8AJ8JOoPm8F/GM+udjltvDtzPawAv4whr5CDW3UwM2X28IW7CJCYP0vJ2GL3J3HUubQLg0hHd2eYceMLACpWHsXsGyzFMSVk9dyWUXCfw8g9jricnML5J6Wt9pOfVr0gmJtWn4pjzVJ4GSmY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707121201; c=relaxed/simple;
	bh=tOqoNGXqBhxICDKxtTqYvgv3VJJEQe+9seclLdLKod4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4YIbUIL6+Hqkn/eRX86ZoVh1dG3Y3+6x3H+UeVSX/aOkyi/lPwTy/RM2Y+LHw0VTWPcie8+iJkEzm2X0Ja3EgEaA/PJC/1OAUgrupQO0hg9LIiKorSJxm3BcPcoTo0WJnaE6z/itoRDPqvrynGxTUT0aMp75C0eo6Iotl3kc00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OD4VmPOU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OD4VmPOU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40fcb4ef7bcso21469615e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Feb 2024 00:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707121198; x=1707725998; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1beHwRvUo+c6suknt3Ya9p8smHFSNN3X3jkZ95cbKc=;
        b=OD4VmPOU01Y30lCzMtFSSHahBNhNJrZCficjEXW7efY34dAL+kST4FZXZJcku7khKB
         SKdYcH0tio1IOg4O2NInazJFlaENrvjz5exXIj1dM8pFMExb332OiKiTdIzuFyIUFdP6
         FLGWjhi8wHWUW3izHz0A4n1/QG6A5aYTFAC2Qs1ARk2NEIXaCjLbWl2qY7hgE4WCRGes
         +8uplNv03fgkWtnvw0XAvDrTE+cHfwTD8keV+2EspAP1PA7s4ghGaV1L5e2W/KgSJyhZ
         owRMf9O57ELU09uw8etn5l1jgOMODHjgVN/ST3atoE0ff1AxmO3ddoHzF4dO1QhPNPlT
         Gz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707121198; x=1707725998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1beHwRvUo+c6suknt3Ya9p8smHFSNN3X3jkZ95cbKc=;
        b=XLNURHstHiLOrQq+k1axlztBskF7pK85QSm2NF8jYnoIqfw6kdUmXZvq7rMAePDaod
         FHydJhUjBlIOqMhYn9jbzMJkq8125EmhHIgwBZJ+HSyedJZccAm38bLC3wgS3Q3tEEoa
         VrAXG6+vOX0YGaAQt33TWkiumZGiN8FW8CoH6COaDY2yxMLsdVbfrq23IQBlbPRDpLbZ
         4uFnNSy1ANdlIIKTz8X/aRW1ryDa8pXCQll8Wb09YGY6wxvGg+J6xbmA85qX/x06QDbb
         qjs4Nu/8HhdUC0Xa+T5hWQ8OJlq6yRR3GOIfRn5okxOvMqW8hiunUWgNHtqYYaP0j7mQ
         vZGg==
X-Gm-Message-State: AOJu0YxsDb/6CrcihMz+n3bzogmG3M85dTheTXkBZejPCbDY5Cj3STdQ
	k3JKd866fWt9dyhq4WhpHZTMsIHog9ycDth53hIX/K7S5GBiJtyp
X-Google-Smtp-Source: AGHT+IFMEgsIvheRR2q8cMYwsFwhH5zIV4/1dyYzuMJs7dEv/ET9vuLJPBAwsUT1dGndDJTsnDFmtA==
X-Received: by 2002:a05:600c:198a:b0:40e:7232:bdf9 with SMTP id t10-20020a05600c198a00b0040e7232bdf9mr4168836wmq.16.1707121197555;
        Mon, 05 Feb 2024 00:19:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVQqal2vFNLRieBp8lW46CN/u6F4dHt0ePJ4098lQWULtkEk6GaTcoXF2FWP88yzf2YlALlqlbqjM3DtcNxzJRnDKkdAAUatT1BdqFPFNM5vhuBFVZBPbedzli4lIGTK8IiDQrpXSh2pCM4HodNASQrdviV/Xnlf609qLTTJrCG5tg7
Received: from ?IPV6:2a02:8071:b783:140:927c:82ba:d32d:99c1? ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id o37-20020a05600c512500b0040fc5460109sm7794742wms.35.2024.02.05.00.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 00:19:57 -0800 (PST)
Message-ID: <50af81da-779b-4782-9326-043bc204bfe6@gmail.com>
Date: Mon, 5 Feb 2024 09:19:56 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [groeck-staging:hwmon-next 13/34] drivers/hwmon/surface_fan.c:87:
 undefined reference to `__ssam_device_driver_register'
To: kernel test robot <lkp@intel.com>, Ivor Wanders <ivor@iwanders.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>
References: <202402051456.JOjQbD3G-lkp@intel.com>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <202402051456.JOjQbD3G-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/24 07:42, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> head:   fb0833325ac45560e6b62681c77bed56bcfc20a9
> commit: c3747f28ebcefe34d6ea2e4eb2d3bb6b9d574b5f [13/34] hwmon: add fan speed monitoring driver for Surface devices
> config: x86_64-randconfig-121-20240205 (https://download.01.org/0day-ci/archive/20240205/202402051456.JOjQbD3G-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051456.JOjQbD3G-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402051456.JOjQbD3G-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     ld: drivers/hwmon/surface_fan.o: in function `surface_fan_init':
>>> drivers/hwmon/surface_fan.c:87: undefined reference to `__ssam_device_driver_register'
>     ld: drivers/hwmon/surface_fan.o: in function `surface_fan_exit':
>>> drivers/hwmon/surface_fan.c:87: undefined reference to `ssam_device_driver_unregister'
> 
> 
> vim +87 drivers/hwmon/surface_fan.c
> 
>      78	
>      79	static struct ssam_device_driver surface_fan = {
>      80		.probe = surface_fan_probe,
>      81		.match_table = ssam_fan_match,
>      82		.driver = {
>      83			.name = "surface_fan",
>      84			.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>      85		},
>      86	};
>    > 87	module_ssam_device_driver(surface_fan);
>      88	

Missing 'depends on SURFACE_AGGREGATOR' in the Kconfig. Should have
spotted this during review, sorry.

I can prepare a patch once I'm back from my day-job, unless someone else
sent a fix by then.

Regards,
Max
