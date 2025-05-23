Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F4C297130
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 17:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748022021; cv=none; b=KAFN3eJyjo5ZSPouDMXQsdYYsB1jvlfosgIYRJKhk0d7sfi8bAfrfz1mCdVgedIjzxwJ38GEA1BF+gDN+ZHcCcveymvrDn27uSyeqZAXloL8HYDTUb9Zl0GCbNdRU7UMvggjDtRqyFkO7z2X4NzBTlHczJR8KaP+Ti7JLlHxqFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748022021; c=relaxed/simple;
	bh=3IqCzY3VQXQx5VM/tdGIovzSklefXyPJoGsX7op7NR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HYUzdFw75JD5gGeFjl7P+XcZUGob5AvkVhNzsNnNdpfbVPxKeagHtmaotqjym8WcRVPT7l4mgLCIUN2RRyJq3lbaiknUTyBbUxMCN4Zia1yDYIiZgylL3h/zGyS0ti/RIP+FPkMcTzK4nNN5aeVv3+NoWsShAAQuVH2jQ6mcsEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKM788lS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKM788lS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748022020; x=1779558020;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=3IqCzY3VQXQx5VM/tdGIovzSklefXyPJoGsX7op7NR4=;
  b=LKM788lSIHx1o4rQjXlQg+6E6YfQMtwLnfU+IFqvrBWHbZpHnXNbeRtH
   AfoGjJoNK3PVkRxhridSma2tGfJXN5F9obqJjUxYkw+F8uVMfmQuSjUuH
   7sN7D0CmOlDRtb15C348GnxRc92m9TN8+WqTH5PKAUtwoPdSv7JgS4y1n
   4niqjSvvM3PQqs8Rj+MmCGHGtLaIPeGBpEuQysCYiO6Xnz7kJeJYBYptr
   RQtKHw3O/FOXqxlHdr9Zfmq/YeRQu/DeVtBjb0R4WRi6Ls4yfnjPQIKzs
   zM1gn/DWxq7smHOT0qFKH+rNMuS+Zh3/7PJNxEulIW2Pgl599fEQ7Ov0h
   g==;
X-CSE-ConnectionGUID: ty/utlHxS3KH1T7IKby3Ug==
X-CSE-MsgGUID: AIuMBkisRwq9nos96ZX9tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49968252"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="49968252"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 10:40:18 -0700
X-CSE-ConnectionGUID: v+bG2cJtRTS/53useQODMg==
X-CSE-MsgGUID: 7TzarW26RbyxwBcA33jTAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="178353148"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 May 2025 10:40:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIWNS-000Qcu-31;
	Fri, 23 May 2025 17:40:14 +0000
Date: Sat, 24 May 2025 01:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/4] arm64: dts: imx8mp-venice-gw71xx: fix TPM SPI
 frequency
Message-ID: <aDCy9iVMaaOK2Lfh@bdd6ecf8f309>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523173723.4167474-1-tharvey@gateworks.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 1/4] arm64: dts: imx8mp-venice-gw71xx: fix TPM SPI frequency
Link: https://lore.kernel.org/stable/20250523173723.4167474-1-tharvey%40gateworks.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



