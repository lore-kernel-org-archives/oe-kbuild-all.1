Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C9620E6EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 09:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733997178; cv=none; b=TYhANWy48GCfWqEhqkINIGQCTUNBV5RCGjcpQpG9KdTx477K5TlyhY4650iH24E9nuba7hof84CW19Q/hneL27KH1RsS0NnQ5UXWfjVFN1XvRISfurAkgkYniH8jF2/kUItpQYKKT+8ciwpFRVJm5k9EWTwXDdecEeaPE57gKnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733997178; c=relaxed/simple;
	bh=Z2m5/TwSIYTc/ivx0On8nWdm+GHqoAs8bzXWDjNa98E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IucLlgFFCrndiPMQ1kiQ8mdUGUvLcR2WU0zrcfJu02DnH5MsbZBlX9tRxcKyDsZLIeklJQFrTtYXQ5rpHdzX8gMbpNikA8fzZfun0+tnnchscC9Aetoqb2B+ZIfiNczshKFpxVaewOXwhKC7CLOq/RCSdoICnaFB9YZQ0s0Fbyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQ9QqcWz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQ9QqcWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733997175; x=1765533175;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Z2m5/TwSIYTc/ivx0On8nWdm+GHqoAs8bzXWDjNa98E=;
  b=NQ9QqcWzh3F2IVYthSJnfbrAOWzsQl7ibkL2XzTtEBzs7ujWmzftGAVg
   t5UsXdLriMOxXesQHsMoRIMIaRhAhdDPK2OLLGqFwcp86A4HDWdQVrD7Q
   umx+JFzrMq0SmdXsmvbtJ4U0sV9zTBEDvFj3lHOezlJ1v03wID9tI/gEK
   f+3HxWbZLpdU8TvURddIhucL0Aku712hbceS9ldwEegqBgEm/qZxe5Agt
   4mA+xLoOZIaEL59yAIeifgcZ/pAd76Ua67CYKxvMccoAKGYEpZbzrXkVN
   tAdDw65oD6y/qo5ONG3qJExviwCT+x0eX6pmj2Z03EfDsp8t5nLAm4M/c
   w==;
X-CSE-ConnectionGUID: WkRaMgMxRC6aYgqMcK7PBw==
X-CSE-MsgGUID: wpFmr9k+TCy3oHVx0B6ung==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34133435"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34133435"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 01:52:55 -0800
X-CSE-ConnectionGUID: 2Tf/c2xfTceE0UCCTWTyuA==
X-CSE-MsgGUID: 5tWBdDPqRR6M+atqSxQ+9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96979225"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2024 01:52:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLfsI-0007gd-37;
	Thu, 12 Dec 2024 09:52:50 +0000
Date: Thu, 12 Dec 2024 17:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Karol Przybylski <karprzy7@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv2] drm: zynqmp_dp: Fix integer overflow in
 zynqmp_dp_rate_get()
Message-ID: <Z1qyVwAS7diUYFd0@3b9f04db549b>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212095057.1015146-1-karprzy7@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCHv2] drm: zynqmp_dp: Fix integer overflow in zynqmp_dp_rate_get()
Link: https://lore.kernel.org/stable/20241212095057.1015146-1-karprzy7%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



