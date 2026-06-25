Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8431714AA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jun 2026 23:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782430390; cv=none; b=GwvjARIQDYvd9v1+ajUmKs5k2qUUUjDpWhfRuqzSo0JBBzq1q3x/ydjduiWIvqcmzoA+ljIrRVMJx7SRonUfXkX1hfiZWQE2ilzPJBBy1co3570pgzrGPFbD7mY0R7mbL9k/yIDZozOYR+DfhFvWLIvk3swSi2jBzZ6nIU02/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782430390; c=relaxed/simple;
	bh=nlfAnlunjSrrdXiCkRsGCPybK2WUIbBi7OjNhv82kpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nT7tV9vT7mPSAgWFUPl0/yHWNHE2PZYjcMoQj71SRUYoprB1fFDuuRFKJnuXLbrJzq+fNTKqadKrSQgcT8Joy6DVjQeZrB4i02Ga71PQZeIgTIOyEPr80ufpm6RhCloe/WMPnOSc4Uz3aWG9jsA6RWOOzKveqox1sUjUfKwORTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=K6vFUoe5; arc=none smtp.client-ip=45.157.188.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="K6vFUoe5"
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gmZqJ0yJVzXHx;
	Fri, 26 Jun 2026 01:33:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1782430379;
	bh=TKV+kANJDtpt3zL+RSHUUUTQ3uk0yKp8euFAUk8BHUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K6vFUoe5B45+G/2DPP6NZlXxUDBGVdmu2a0sgx9eTsZvTJ9JXCL0l4H6z1Q4ZyBn8
	 P77yUTrqwgXysBBYzhjeTUBoiIXHRbci8Dic9lb67LLd7Gg6NDRX5bdmBHwPPSgM0C
	 8/B/XTp4ngy8MUsGKwKriVjxWdt6Q7WVM+wi5bhAOWBBuSsFfcSohPIYy6JZPBiLGv
	 m8XHUuPwfICSaYoMY7t585GPG1HjSW+pXFDdHS+pQFQu0CcIF7i0v/2IZjrCEgAzcg
	 w4OFr9D8KZX+ie48lubd+HXWLCET7W/6H9Stku708Q2UudKzwt+FhG/0qJmII5wQCW
	 V1LOMd70fiDXg==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gmZqH0H5SzvSr;
	Fri, 26 Jun 2026 01:32:58 +0200 (CEST)
Message-ID: <586ae889-2716-4a72-8e86-5428149fe34b@gibson.sh>
Date: Fri, 26 Jun 2026 01:32:58 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/platform/x86/amd/pmc/pmc.c:717:37: warning: '%s'
 directive argument is null
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <202606251540.Nr2BtaNu-lkp@intel.com>
Content-Language: de-DE, en-GB
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <202606251540.Nr2BtaNu-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Infomaniak-Routing: alpha

Hi,

On 25.06.26 09:22, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ab9de95c9cf952332ab79453b4b5d1bfca8e514f
> commit: 428b9fd2dce50b4dc5cd9ade10b92efcf57ce7aa platform/x86/amd/pmc: Add delay_suspend module parameter
> date:   2 weeks ago
> config: x86_64-buildonly-randconfig-006-20260625 (https://download.01.org/0day-ci/archive/20260625/202606251540.Nr2BtaNu-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606251540.Nr2BtaNu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 428b9fd2dce5 ("platform/x86/amd/pmc: Add delay_suspend module parameter")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606251540.Nr2BtaNu-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/device.h:15,
>                     from include/linux/acpi.h:15,
>                     from drivers/platform/x86/amd/pmc/pmc.c:13:
>    In function 'amd_pmc_want_suspend_delay',
>        inlined from 'amd_pmc_s2idle_check' at drivers/platform/x86/amd/pmc/pmc.c:763:6:
>>> drivers/platform/x86/amd/pmc/pmc.c:717:37: warning: '%s' directive argument is null [-Wformat-overflow=]
>      717 |                 dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
>          |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
>      110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>          |                              ^~~
>    include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
>      160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
>          |                                                          ^~~~~~~
>    drivers/platform/x86/amd/pmc/pmc.c:717:17: note: in expansion of macro 'dev_info'
>      717 |                 dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
>          |                 ^~~~~~~~
>    drivers/platform/x86/amd/pmc/pmc.c: In function 'amd_pmc_s2idle_check':
>    drivers/platform/x86/amd/pmc/pmc.c:717:279: note: format string is defined here
>      717 |                 dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
>          |                                                                                                                                                                                                                                                                                       ^~
> 
> 
> vim +717 drivers/platform/x86/amd/pmc/pmc.c
> 
>    691	
>    692	static bool amd_pmc_want_suspend_delay(struct amd_pmc_dev *pdev)
>    693	{
>    694		/*
>    695		 * Some Lenovo Laptops (like different IdeaPad 3 Slims) need some
>    696		 * me-time before sleeping or they get uncooperative after waking
>    697		 * up and don't send events for keyboard and lid switch anymore.
>    698		 *
>    699		 * Unfortunately this doesn't entirely fix the problem: It can still
>    700		 * happen when resuming with a timer (wakealarm), but at least the
>    701		 * more common usecases (wakeup by opening lid or pressing a key)
>    702		 * work fine with this workaround.
>    703		 *
>    704		 * See https://bugzilla.kernel.org/show_bug.cgi?id=221383
>    705		 */
>    706		if (amd_pmc_quirk_need_suspend_delay(pdev)) {
>    707			/*
>    708			 * delay_suspend=1 force-enables this, otherwise it can be
>    709			 * disabled with disable_workarounds or delay_suspend=0
>    710			 */
>    711			if (delay_suspend == 1 || (delay_suspend == -1 && !disable_workarounds)) {
>    712				dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
>    713				return true;
>    714			}
>    715			dev_info(pdev->dev, "Not delaying suspend because of module parameter, even though your device is assumed to need it!\n");
>    716		} else if (delay_suspend == 1) {
>  > 717			dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
>    718				 dmi_get_system_info(DMI_SYS_VENDOR),
>    719				 dmi_get_system_info(DMI_PRODUCT_NAME),
>    720				 dmi_get_system_info(DMI_PRODUCT_FAMILY),
>    721				 dmi_get_system_info(DMI_BOARD_VENDOR),
>    722				 dmi_get_system_info(DMI_BOARD_NAME));
>    723			return true;
>    724		}
>    725		return false;
>    726	}
>    727	
> 

Ok, so dmi_get_system_info(DMI_*) can return NULL (not sure if this is
more of a theoretical possibility or if it actually happens).

Is this a problem?

As far as I know printk() will just print "(null)" or similar then,
which IMHO is fine for this usecase.

Cheers,
Daniel

