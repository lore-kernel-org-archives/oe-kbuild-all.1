Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6387F20D4F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742303929; cv=none; b=kPoaZ5xYzOsqdYOT9OD8gPdKAt7lw7MEWNVu0T1hdv6kFmp6H4XToZJKSPWmodiEXlAsf5MYW2lzP/N6KAgVprlIGERTse/s5SI9Fa/CyxeIsAm0AG3I/X3Q1cso/V8kcD+vnP9FtkK6mPrF1Io/5N7qG52stF5hZFXUjSImyGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742303929; c=relaxed/simple;
	bh=hz2v0C2mE7ZdxfI3g27x84Iofq4u2FmSHLaMhh75KtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LDfyE0adY6coFZ7OnSw1uA03CDp4XHdk/13+NMgVWrjaSBf3gWBU39uHOZfrehyr8raldddMjbBR2tSkXH+TXUh9FWtp/B3XM41xSUqSz/9Lc44kev9OP00wBIDPSbPnnjyqTH30lCiFLQyItN2MsIHlevtuX9gK6nTkCEVDv0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/X0HjZI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/X0HjZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742303928; x=1773839928;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=hz2v0C2mE7ZdxfI3g27x84Iofq4u2FmSHLaMhh75KtI=;
  b=D/X0HjZI0Px9Tn/7aLDoDlnbmLYxD2RHI/j0yr3TeWAzOVn/UQzHx6hX
   uCH2RFb5ORF4EUPGz+9pH5XVti9qj68wRj+NRNoqkAXLqo8S17MXBMQd9
   qbAgDk+8bkdEz6Tbj0OGjyOhpFoVQmTAHwAUFGmBTagCUypNb+PNv6k1I
   Xm/bSLASqaPhjNDZHWfswl299awSh4E3NxsjPd7hTSeEtPPEK7zjk3wZ8
   nQaoiy/wAIM5Pwxpvy9rURBN3GjG3h1icKFiZm0QoXrmz5wsSLiG7YAIa
   Ne/JEXMV6zoTYVmHmC2BlakTCFGiHm/NUEDuHsSApFuHdg2Y02ptrFKZ5
   A==;
X-CSE-ConnectionGUID: wBgyhjCpT76X7WoZ3N9KOw==
X-CSE-MsgGUID: UYatxtsFQGS5RACjDJkaJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43614710"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="43614710"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 06:18:47 -0700
X-CSE-ConnectionGUID: Nijdv+ukRSeG3ys+mBllpg==
X-CSE-MsgGUID: aVTKrgVUQpm4psfQNxoCCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="122755268"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2025 06:18:45 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuWqB-000Do3-0h;
	Tue, 18 Mar 2025 13:18:43 +0000
Date: Tue, 18 Mar 2025 21:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dhruv Deshpande <dhrv.d@proton.me>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ALSA: hda/realtek: Support mute LED on HP Laptop
 15s-du3xxx The mute LED on this HP laptop uses ALC236 and requires a quirk
 to function. This patch enables the existing quirk for the device.
Message-ID: <Z9lynnWSBAe2fIL5@4d9b5d180ac0>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317083319.42195-1-dhrv.d@proton.me>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] ALSA: hda/realtek: Support mute LED on HP Laptop 15s-du3xxx The mute LED on this HP laptop uses ALC236 and requires a quirk to function. This patch enables the existing quirk for the device.
Link: https://lore.kernel.org/stable/20250317083319.42195-1-dhrv.d%40proton.me

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



