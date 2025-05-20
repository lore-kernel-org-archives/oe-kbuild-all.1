Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE2C1E51FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 04:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747713830; cv=none; b=NmDjelmcGnmtXJRtBwmd9tQTQwmtsTYEN3NXhtFcvTyg+kwjjCiD0zRPG/DJH8rzJ16MZimpxCebaAHeRZB+CMSij6g83g1VAzh05Cge/WR5G05Ew1xuKTQ7mXXKVoPzRTVok8bdI+OBbHd1URD2J7A0kcVgdlfsywLw+FWoEaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747713830; c=relaxed/simple;
	bh=3BSxXLrjVb6zhk6/rua5gnyhtd3MPcC0kIvLbjCs7QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QtEYALR/T9sH0PiqvGfA3SlkTQQzl4izYPhF6V7caVSWFbRaTHbcjPlT4Pu/C8lZttFmnThboYuk7ZWwTRtRrhZ671yH609XOGp9pS85edhn7B4lPEYBCtM8r/DDo+4heWtsAgXHu/2DjiYa0TZJU7cHHdvm4ngyV+U66HH88rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9obrhuc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9obrhuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747713828; x=1779249828;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=3BSxXLrjVb6zhk6/rua5gnyhtd3MPcC0kIvLbjCs7QQ=;
  b=d9obrhucMgqCpmE2io8OscMyGlvekcmXJAVEmKSwftnuuzzlUJeb7n+z
   WE0Z08cwDy/0xjpBEWNthh4oo5MsN04JYmCJ6RiboAcXucbrmd0krdcbd
   mHAqKX6w2osGBj941xPO7X0H2NCIER8nR3DVmtWgwyt6Fz4QT+umpI9u1
   lBPnA4cKL3vZK+5Ey/78qWxlxVFcAmqB5Abip9tjvziiB61WQbEPvTU+k
   dKHy96ZZQWbXhXN0lGNWtBDHSYbuG3M/qVvXDzfh+L7DHutpXf5VcFya2
   0/QmcMYez1Ja/NeNPLsUqAcl8zk+etPKe25/ZbBchoWj3wvYUySFwrjVq
   A==;
X-CSE-ConnectionGUID: Fjr+Q2Y+TT6gGdhFr1cUrQ==
X-CSE-MsgGUID: x+mmJk3wRkmJxn3n6B7s0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49506436"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49506436"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 21:03:47 -0700
X-CSE-ConnectionGUID: XRw5gldAS6GSUKydk1CIJw==
X-CSE-MsgGUID: PSC1XjQATkOjlje704HtSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139454304"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 May 2025 21:03:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHECd-000M92-0l;
	Tue, 20 May 2025 04:03:43 +0000
Date: Tue, 20 May 2025 12:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: mhkelley58@gmail.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/1] Drivers: hv: Always select CONFIG_SYSFB for
 Hyper-V guests
Message-ID: <aCv-5dhgFWrQjuq3@99c60fc626cc>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520040143.6964-1-mhklinux@outlook.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2 1/1] Drivers: hv: Always select CONFIG_SYSFB for Hyper-V guests
Link: https://lore.kernel.org/stable/20250520040143.6964-1-mhklinux%40outlook.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



