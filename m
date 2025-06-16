Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B5521CC59
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 21:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750110306; cv=none; b=Zao8fXKMiOa0QlYf6mTg2e3Of/px6dUcpvLOHdzYsdaoHlYLBAr/bbwR90pwMRNARI9Gnqp7+teqanrol8zyuWf0cgkE5idU2tHVxiLoWHE7D/zch10OqL2iBlW3I4ns+2Em/90Y3DHm3PNrgnK1SNgdxS7/IIVIOGX1aBJwrVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750110306; c=relaxed/simple;
	bh=MRhrItBTSRnwRcEuQhn+L2n5wFGM2G9Zo6o5pw+x9wk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=REPnP5TV5u1u+6d8GPOVtpCCP4ejwksgT+MpYQeRsdlEZg8OOjCfDYuWcLtwAanjAhq0+0jcJiU+9gbtb67gHXYtr4GkHkrZH18KznWKT77DWP0xk8CQ1USecl4xnIcSdWk1SAV9+K1m01K1SyUo9gLwNdgMBKciMiKHsO7hJOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GASyJ4/Z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GASyJ4/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750110304; x=1781646304;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=MRhrItBTSRnwRcEuQhn+L2n5wFGM2G9Zo6o5pw+x9wk=;
  b=GASyJ4/ZPPyXIjATNbNrgU6JRRyvGVz4seTJSOS5bLGCms32IVpwQJI+
   i8zkX8Vh+PcPbNwLWU1M4t8kxGf4R9qbS+/PDjPgmX8w/X6t0WgePvxpM
   UUFxjsVexJehrnN7U6e9nIYGiejuG3EU5gwlAlF6lzD14VxmlPUu5Gorg
   Bzv76vv3Ru3ZGQ+0/UQgoEtcw/FMAH4MGdz8e94NG391XigW8+r945jlC
   eXsGLfdJrLy65b4+JyihqAcNNbP7Yi7fxqzn57k3Isp+BtCLSKrkB+vEO
   hYAXH1nnZ6h9mOZTvGhBq5QZ4PbDzl66XVV3BDuROpp/1YlnRFqF/QH9b
   w==;
X-CSE-ConnectionGUID: W+iqZnPERBOU+pLGUVo9gw==
X-CSE-MsgGUID: i3CteZ8GQD6cej/8kZi8GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="39873172"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="39873172"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 14:45:04 -0700
X-CSE-ConnectionGUID: 7rAU0FKFR/CzU/2TXXgxGw==
X-CSE-MsgGUID: 6TkMUe48SXa/rm26XgrXyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148420575"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jun 2025 14:45:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRHdV-000FNM-17;
	Mon, 16 Jun 2025 21:45:01 +0000
Date: Tue, 17 Jun 2025 05:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] crypto: ccp: Fix SNP panic notifier unregistration
Message-ID: <aFCQT0eEEkhO8T55@0d39b16ef7df>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616214314.68518-1-Ashish.Kalra@amd.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3] crypto: ccp: Fix SNP panic notifier unregistration
Link: https://lore.kernel.org/stable/20250616214314.68518-1-Ashish.Kalra%40amd.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



