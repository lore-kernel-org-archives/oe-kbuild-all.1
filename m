Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111E53C463
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 03:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743046714; cv=none; b=qHlohXbDnMcdEsJExuraJ61WjWOcxL8QQvX5PGZczjTwovKcgxw3Z7dV3BKLnJ44vL2SlDqvHHdUBNaL8Z2efYm6Wpz/Kml8BTbqB8qW7rm4rQwx4iMUcPD+AyLbzjJWv5JRXVPv8M+/5EfQIcGv088kMlfYehdvn+JE5I9zWnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743046714; c=relaxed/simple;
	bh=GanYbABjnyFvDBvlDkCQrPUbi71BK1WBemPF+KREl5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ofyL/8hrayMfw/eWAlPlWUExQEDsI47VzNreHWf1ZAvhKWYzvy+kEx/2SWsyY9mn3MjmyybxXfh0ZMteHcRsS3dhRbmgksMGbe6+Bt1mdzi90upiGpmCxW8a4RlPMmF0dXyWdgfLpYzFxN9LKtA3r9VdtU1EzAHewmNjTADgk9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fE3RwaWE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fE3RwaWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743046713; x=1774582713;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=GanYbABjnyFvDBvlDkCQrPUbi71BK1WBemPF+KREl5g=;
  b=fE3RwaWEpZvSS6wI791aSTviJoMIPA4TwFnIFC2mbeXkEnAMjkl9aEvL
   BvO3lqfDVXd6hy6y1FZ7qvZCxyma8UGosSwK6Segu0ecQU30w9BSWQc7B
   u3mro/CV+cXZxjxWCvVoQIN9+ErJH96B0vnTEMOT0WLdXEG+HdZ4Rei44
   XQd/eCCJy10Any56CgiIdLxh0aJoJZ70z/QeNKDgBH6agIsNdTJjSG3Kv
   GcU9z/fTGeuSjF4cUYZxYhzpGQ6Eu5SrKqpiWLl/7mTE/X94t46LcfQjp
   16jzodT0TZdGOJ7550GJNsoSeycEfvMOywPw873o3uFfDoiFa5MYVCDoG
   g==;
X-CSE-ConnectionGUID: BtkZX53GRrC4qCkUe4brFQ==
X-CSE-MsgGUID: cjkoq2loQwilZmW1aw/lHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44481321"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="44481321"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 20:38:32 -0700
X-CSE-ConnectionGUID: y02+3yFkTNa6L+1h8HMOIQ==
X-CSE-MsgGUID: UklW+tDWSyS25P4CdN4w7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="156000360"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Mar 2025 20:38:31 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txe4b-0006KR-1H;
	Thu, 27 Mar 2025 03:38:29 +0000
Date: Thu, 27 Mar 2025 11:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] gpio: tegra186: fix resource handling in ACPI probe
 path
Message-ID: <Z-TIEgLtBPiPupAe@06395982a548>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327032006.73798-1-kanie@linux.alibaba.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] gpio: tegra186: fix resource handling in ACPI probe path
Link: https://lore.kernel.org/stable/20250327032006.73798-1-kanie%40linux.alibaba.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



