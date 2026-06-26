Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220503EDAAE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 10:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782471230; cv=none; b=hyFQXnT4VSMxC2VTnzLobMaI87fv1ccKTHiNW2/lVW01cAjLknWOKnx4xL9joUzUM4QJvE4DMzi1KfScPec1BzNopPrtG0YX49FxMpqgoi79MJg0cYTFomNLsa+viUSjHH8E2CDQjgCIrB0eNxSMHMfAdHrTH/RsqUIj4zK6BD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782471230; c=relaxed/simple;
	bh=VfDQdDYrO50CsXssQhzqZaLJEWJoeenPY6runjkXSKk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hT0MMssdpkNohpBU8yCHg7CfzSmSeDxiW/cUMalatZ7wRSPicoPtmbkLM/Gx5WdteV7FX6BfgfnBE1DUTzW9whsD4sJsbewTlxX/haUk+iUs+7F6bYlnAIqAuOzpgdv50zsBlkw6RdPr4XebtPcr6zfeZbLaDBTs9Cn8Z0FhMGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/iq1orJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/iq1orJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782471227; x=1814007227;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VfDQdDYrO50CsXssQhzqZaLJEWJoeenPY6runjkXSKk=;
  b=b/iq1orJemB3cbPVJ14otkHUxi1CKrF2pLUf2BS8PQFjp8jTnW3nkxDE
   0vbvQ4Jn73gfhMt1lPmCiEWzh1usWsB8oTUD420/+qteC9TeF514MxLpD
   Us8BySZcQTUm1P5SyG/NA+vrTw7y2a8TnZhk9Sh1NL9dFry0apo3iZism
   TWOZzEDnN7S+NqX4VykHHqqO9D4j+ISx3VYdhHyvUK/VzIRAMhmg+CfRQ
   5mxavbJXS+CdU22eOdhjhCTZiNyNU6a9ejtr7sC+r+Kzu1R1VJ+OAnWNV
   M3E1/MDVegyKiVA9tYP3MAv1eEY/wayOq1f+bUQrOZgcvhGK/T0KM/ZwC
   w==;
X-CSE-ConnectionGUID: 0d4wVsTlSIWwZ/9mnXqJWQ==
X-CSE-MsgGUID: nV9xC7JmQ2ioROIMCa3Prw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83142448"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="83142448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 03:53:46 -0700
X-CSE-ConnectionGUID: sFsmVJ1qTCqWYOHpXdrUJQ==
X-CSE-MsgGUID: Ir4bylGqQYip5ocjvGA5WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="244904464"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.71])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 03:53:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 26 Jun 2026 13:53:40 +0300 (EEST)
To: Daniel Gibson <daniel@gibson.sh>
cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
    LKML <linux-kernel@vger.kernel.org>, 
    Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: drivers/platform/x86/amd/pmc/pmc.c:717:37: warning: '%s' directive
 argument is null
In-Reply-To: <586ae889-2716-4a72-8e86-5428149fe34b@gibson.sh>
Message-ID: <74d8b129-6f7a-9a3c-fb2e-e3f22593f5f1@linux.intel.com>
References: <202606251540.Nr2BtaNu-lkp@intel.com> <586ae889-2716-4a72-8e86-5428149fe34b@gibson.sh>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Jun 2026, Daniel Gibson wrote:

> Hi,
> 
> On 25.06.26 09:22, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   ab9de95c9cf952332ab79453b4b5d1bfca8e514f
> > commit: 428b9fd2dce50b4dc5cd9ade10b92efcf57ce7aa platform/x86/amd/pmc: Add delay_suspend module parameter
> > date:   2 weeks ago
> > config: x86_64-buildonly-randconfig-006-20260625 (https://download.01.org/0day-ci/archive/20260625/202606251540.Nr2BtaNu-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606251540.Nr2BtaNu-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: 428b9fd2dce5 ("platform/x86/amd/pmc: Add delay_suspend module parameter")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202606251540.Nr2BtaNu-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from include/linux/device.h:15,
> >                     from include/linux/acpi.h:15,
> >                     from drivers/platform/x86/amd/pmc/pmc.c:13:
> >    In function 'amd_pmc_want_suspend_delay',
> >        inlined from 'amd_pmc_s2idle_check' at drivers/platform/x86/amd/pmc/pmc.c:763:6:
> >>> drivers/platform/x86/amd/pmc/pmc.c:717:37: warning: '%s' directive argument is null [-Wformat-overflow=]
> >      717 |                 dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
> >          |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
> >      110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
> >          |                              ^~~
> >    include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
> >      160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
> >          |                                                          ^~~~~~~
> >    drivers/platform/x86/amd/pmc/pmc.c:717:17: note: in expansion of macro 'dev_info'
> >      717 |                 dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
> >          |                 ^~~~~~~~
> >    drivers/platform/x86/amd/pmc/pmc.c: In function 'amd_pmc_s2idle_check':
> >    drivers/platform/x86/amd/pmc/pmc.c:717:279: note: format string is defined here
> >      717 |                 dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
> >          |                                                                                                                                                                                                                                                                                       ^~
> > 
> > 
> > vim +717 drivers/platform/x86/amd/pmc/pmc.c
> > 
> >    691	
> >    692	static bool amd_pmc_want_suspend_delay(struct amd_pmc_dev *pdev)
> >    693	{
> >    694		/*
> >    695		 * Some Lenovo Laptops (like different IdeaPad 3 Slims) need some
> >    696		 * me-time before sleeping or they get uncooperative after waking
> >    697		 * up and don't send events for keyboard and lid switch anymore.
> >    698		 *
> >    699		 * Unfortunately this doesn't entirely fix the problem: It can still
> >    700		 * happen when resuming with a timer (wakealarm), but at least the
> >    701		 * more common usecases (wakeup by opening lid or pressing a key)
> >    702		 * work fine with this workaround.
> >    703		 *
> >    704		 * See https://bugzilla.kernel.org/show_bug.cgi?id=221383
> >    705		 */
> >    706		if (amd_pmc_quirk_need_suspend_delay(pdev)) {
> >    707			/*
> >    708			 * delay_suspend=1 force-enables this, otherwise it can be
> >    709			 * disabled with disable_workarounds or delay_suspend=0
> >    710			 */
> >    711			if (delay_suspend == 1 || (delay_suspend == -1 && !disable_workarounds)) {
> >    712				dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
> >    713				return true;
> >    714			}
> >    715			dev_info(pdev->dev, "Not delaying suspend because of module parameter, even though your device is assumed to need it!\n");
> >    716		} else if (delay_suspend == 1) {
> >  > 717			dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
> >    718				 dmi_get_system_info(DMI_SYS_VENDOR),
> >    719				 dmi_get_system_info(DMI_PRODUCT_NAME),
> >    720				 dmi_get_system_info(DMI_PRODUCT_FAMILY),
> >    721				 dmi_get_system_info(DMI_BOARD_VENDOR),
> >    722				 dmi_get_system_info(DMI_BOARD_NAME));
> >    723			return true;
> >    724		}
> >    725		return false;
> >    726	}
> >    727	
> > 
> 
> Ok, so dmi_get_system_info(DMI_*) can return NULL (not sure if this is
> more of a theoretical possibility or if it actually happens).
> 
> Is this a problem?
>
> As far as I know printk() will just print "(null)" or similar then,
> which IMHO is fine for this usecase.

It triggering warning is problematic, and (null) is not exactly 
informative to normal user. Since this is "info" level, the message should 
be compatible with a non-technical user.

Could you send a patch which adds elvis operator to them, e.g.,:
	dmi_...() ? : "unavailable"

If you have better word than unavailable for it, feel free to use it 
instead.

-- 
 i.

