Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF12158211
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720527672; cv=none; b=djd/wrrapMh8M82jIRfSztfCfX0WMs20JiqoQ7Bfur/mcGq8G/b9x3qM6F664sqlhOiEHoxiKoDLRQ46pcT+SaERIv3UVpYarb9A6a5Cm3AaVBpnVM5J377pk64GXStCRqBATOnFoThctYaz3pLxGyZcgCO1THVkhFlmQ8tXWmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720527672; c=relaxed/simple;
	bh=NChpUrmDAfQKb6ht03OodoRNyx6YsaFhCzdiW+LA+kI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ftI9Y8BpTYz9DE5m1Xm1il1vDf6hhkjnV38pRuZtPIZqHx1eX6+sOhjZy0JO05GB1nZTuO94ioDllH7X9+4aSYveTqr941jwG+s9eeM4RNq/DrDSP1TnVLUkYGeokJi2vK7ceT/2WdlqeWNGlcfP0h2OS030WoUl2engWwbX6Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMSW2xt5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMSW2xt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720527670; x=1752063670;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NChpUrmDAfQKb6ht03OodoRNyx6YsaFhCzdiW+LA+kI=;
  b=SMSW2xt58nUzlJX5N0WLBWNx3P8jWpB7mmHPTFqHz24lww1Ppc4pWNJ4
   APW6ushUvchinyJF1q6DcV+dUEsZjVscvwW39AH9ZHZMp9RLDpkr1CekC
   NeTxSo5ZhQn7H5WH3zOZ/rOGb1tv/E2f+aWO2YIGKaD/9N3s+kKphQ9td
   8XQ+rJYfmqcsNby4FSTIkRt9vUPw0n0ACnhRjVf1obibmqN8CuA69wNKq
   AEEZiZnu6LgLXWywuw5of0u59uPoXuEbdAyLs+dUFh1e/EWMnudOhauhw
   zfXliQLah6F3CJVexmtXPAqU3ZnHtb4m7CiS4Id3/0pCjTuWtOVOLmfNw
   A==;
X-CSE-ConnectionGUID: iYWiU7qbRWmqOGwteW6+yw==
X-CSE-MsgGUID: qmRMW8WhQpOSkO0FXLno0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21545809"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="21545809"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 05:21:06 -0700
X-CSE-ConnectionGUID: TvcjSoHyQze+8Opo/UiC1A==
X-CSE-MsgGUID: gMMg6VdeSICKkhmF4SFlNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="78578257"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.123])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 05:21:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jul 2024 15:20:57 +0300 (EEST)
To: kernel test robot <lkp@intel.com>, Alexis Belmonte <alexbelm48@gmail.com>
cc: oe-kbuild-all@lists.linux.dev, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [pdx86-platform-drivers-x86:for-next 54/54]
 drivers/platform/x86/hp/hp-wmi.c:271:1: sparse: sparse: symbol
 'active_platform_profile_lock' was not declared. Should it be static?
In-Reply-To: <202407092008.5HtUNn1c-lkp@intel.com>
Message-ID: <50dcfd6d-f7bc-7e4d-ba8f-dd17810fe013@linux.intel.com>
References: <202407092008.5HtUNn1c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Jul 2024, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git for-next
> head:   2282159b33580076235384597df1d62a6a1037ee
> commit: 2282159b33580076235384597df1d62a6a1037ee [54/54] platform/x86: hp-wmi: Fix platform profile option switch bug on Omen and Victus laptops
> config: i386-randconfig-r122-20240709 (https://download.01.org/0day-ci/archive/20240709/202407092008.5HtUNn1c-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407092008.5HtUNn1c-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407092008.5HtUNn1c-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/platform/x86/hp/hp-wmi.c:271:1: sparse: sparse: symbol 'active_platform_profile_lock' was not declared. Should it be static?
> 
> vim +/active_platform_profile_lock +271 drivers/platform/x86/hp/hp-wmi.c
> 
>    266	
>    267	/*
>    268	 * Mutex for the active_platform_profile variable,
>    269	 * see omen_powersource_event.
>    270	 */
>  > 271	DEFINE_MUTEX(active_platform_profile_lock);
>    272	

Since this change was still the HEAD commit, I just added the missing 
static there and force pushed the for-next branch.

-- 
 i.

