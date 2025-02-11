Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6611F9EC0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274364; cv=none; b=ICK674Flgh0ScMM3LNdyfq37YiwGWu5zKoptJg1qAcAJe/+S13/1DHQL+coZ256HS47qGa6sz5yvBEIyIsnk2jKF/Xu23LYzaXYGGIBh6FmZK3vSKMo8RoSrDSfRTyzU5W5p5bW9gPJ1+zk+eYBVEKC34bkx3U58A1JBDGCzuvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274364; c=relaxed/simple;
	bh=gnuqqG4BjCT66e1CLKP9DAkZ9H1lWDHNNAyJ27FTVnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NH2IB/PEIVRGt7ynEc57+hCBwpmBw8ctH0isviiQ1KxGw4vLNdvJ5zllQWYfi55rqnRwZ7we3TIzzh8YLOriuTWjJ6z10GinzNEjKC1kywX8iRRrJNgQyLyTyhvvkErCr2HX23Rx8SZSPVManx50oqhwel/CRUSCtZZxTCE3lxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORW5INM4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORW5INM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739274363; x=1770810363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gnuqqG4BjCT66e1CLKP9DAkZ9H1lWDHNNAyJ27FTVnY=;
  b=ORW5INM4N5jqK/gfG+BT0NOn6o7PZpKc0PqNhfKOQMoZW7KEj/RylP8M
   O0+zgus8ohR/RhV3EFHZHHqvp5NcQpr5S+vuc/ja6rYepKsUaqSjkdg7S
   b88nQ9XS3q4XOgTC4S6z4zRFpQkGuBWrTjJa/0utay9u0Sspwkfbz3Oq1
   ZfobbMWX+coHkbz5NMMnbL4vAAH/u+x0XOLy5usqNRhfHxJGQtriwKA7A
   8NmQJ1pcjaqVw8xOQNySlPRkPBeXsXtUatS0wlBnVvVtvAlIc5cM8tAPW
   Kd8loAFDXvv79dk+KJkXc5pHlUKb5FL3gpF+V4qvF5TyrACX/WyktelmI
   A==;
X-CSE-ConnectionGUID: pRUMVDWyT4WfhO6VF548gw==
X-CSE-MsgGUID: cus86MuqSEW0VVZ9kGft1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="40011810"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="40011810"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 03:46:02 -0800
X-CSE-ConnectionGUID: Z5cYZgHhSfC+5xMR2L0pow==
X-CSE-MsgGUID: GCk06eKQSDmQqvTQ0wimLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="112321584"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Feb 2025 03:46:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thoiE-00147X-2O;
	Tue, 11 Feb 2025 11:45:58 +0000
Date: Tue, 11 Feb 2025 19:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/4] ACPI/MRRM: Create /sys/devices/system/memory/rangeX
 ABI
Message-ID: <202502111909.Q3IwnJzE-lkp@intel.com>
References: <20250210211223.6139-3-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210211223.6139-3-tony.luck@intel.com>

Hi Tony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a64dcfb451e254085a7daee5fe51bf22959d52d3]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Luck/ACPICA-Define-MRRM-ACPI-table/20250211-051427
base:   a64dcfb451e254085a7daee5fe51bf22959d52d3
patch link:    https://lore.kernel.org/r/20250210211223.6139-3-tony.luck%40intel.com
patch subject: [PATCH 2/4] ACPI/MRRM: Create /sys/devices/system/memory/rangeX ABI
config: x86_64-kismet-CONFIG_ACPI_MRRM-CONFIG_X86_64-0-0 (https://download.01.org/0day-ci/archive/20250211/202502111909.Q3IwnJzE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250211/202502111909.Q3IwnJzE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111909.Q3IwnJzE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_MRRM when selected by X86_64
   WARNING: unmet direct dependencies detected for ACPI_MRRM
     Depends on [n]: ACPI [=n] && MEMORY_HOTPLUG [=y]
     Selected by [y]:
     - X86_64 [=y] && 64BIT [=y] && MEMORY_HOTPLUG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
