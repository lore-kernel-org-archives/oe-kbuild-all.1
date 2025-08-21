Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23AA32C313
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782530; cv=none; b=GKtET9s9bc35RZoPVNv8LWwCiy+sho3i49YEclIbr+TZ6ZqxG218cfhS9BuxkqHdImcdaaSxnVIp9Rxb8X4AWch+j5CzDaxeV/v35bq4+gXnpswuJDtlBGEzHzwmrL/xWFtvuDG+JyAvRg7wo+4hrOVXGB+XlQ3Jk/FsqAYIu4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782530; c=relaxed/simple;
	bh=Zt1nyiK5WSkvv3Xd8A0WsZNCL1xMVFcEyVV3xMAemj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=AQLNfcUbL0Hlf1WclV7J/ZpockAWA3XJlh8YdQZaqqr7jd3txu0pSTAqmsw4atl5QaOS3205Laa8P5XCp0gY9yLxKasZJhdquqdIaAXfBiXYX25s+J21vfiLa6E08jSYKaSs+lTeN4/2coy3XA19JxLDMx/lXsEbc9aAga8kMhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhBFJcg7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhBFJcg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755782529; x=1787318529;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Zt1nyiK5WSkvv3Xd8A0WsZNCL1xMVFcEyVV3xMAemj0=;
  b=AhBFJcg79NWbpfsgrU2nNoMWNJK7e7jOMtzRatmittIl8v0wTGg0oVhF
   mosSzJGpSsmvXHNr7QYgxRDgY5319+9JCJdOHzl0P+0VTJ9/RY/l/jKlY
   MIUp68riGfvxxi/zDLt7RgboO2luX9cB4sOvf1VU8gTsCnRoeFkZeEx3n
   4zquA9Q2NjbyGWLRdoL/id4gh7ueXw6jRHSbWUZv7pT8u+5wjFeZE+uvI
   3YvvjaGLmMl7Wv2SIBGknQXeN1qeCxj4YYPtGncxlNHtmosWxqJY7uge7
   gy9RkufqbJubBUMcXeBX55Ydboa5rvVVeGym69n2HSYIblk1xJ7IZxhL+
   Q==;
X-CSE-ConnectionGUID: RRQedUg8R5qB74AFQsYMiQ==
X-CSE-MsgGUID: S+4OxSTpSI20fY8U87kyjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57781536"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57781536"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:22:08 -0700
X-CSE-ConnectionGUID: 1hg/Fwi3StmLEN/1MaQ1XQ==
X-CSE-MsgGUID: loso2DB1Q7SVJRZ4dyPhaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="167918730"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Aug 2025 06:22:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up5Ey-000KJP-2y;
	Thu, 21 Aug 2025 13:22:04 +0000
Date: Thu, 21 Aug 2025 21:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5.15 2/2] x86/irq: Plug vector setup race
Message-ID: <aKcdVUU18M9Mvo_b@85d67d3e4d56>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821131054.1094506-3-ruanjinjie@huawei.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH v5.15 2/2] x86/irq: Plug vector setup race
Link: https://lore.kernel.org/stable/20250821131054.1094506-3-ruanjinjie%40huawei.com

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



