Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FA820408E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 12:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584499; cv=none; b=FcTiL0YZE/DVN4bl6cuIY39qxePe9cht/gSZlL0I0jJgiuAh3n6IYSB3KfG3K2QE7D9NHBvgemZXTcPTG3Num4yNC83OhMGFDLFuTg6dWJZdahnfReAHs9MgYtQOM5Jl/EQJ0I9kbzB88khplfYwsD35lJRH3fvgrHHOQMcl4oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584499; c=relaxed/simple;
	bh=Jq+Ko1RPKlrDwtKFvVOTAACALwTV26Kr1joQfpRL7EA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=r/JhGlI5vUqTpm2WwlnEeqpEJ3vqx7VQzJTvGmhJ/otI/H+TFhJiWyEw+xvmtjeGdJr+VHl7+bMt1Uy/ZlH5H05SxELb9p8gvcMiSmns7/Q0ebOmuESTI1OuAV+FFmSod71BGif1dgtRK2i4fK309X/aWjMPkSa+ibc3A1SR5eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MkFFi2OZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MkFFi2OZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738584497; x=1770120497;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Jq+Ko1RPKlrDwtKFvVOTAACALwTV26Kr1joQfpRL7EA=;
  b=MkFFi2OZkFmdPA86kkGsbIGyo9eevf0nq5ZWQwpCGKn9nkIwNlVuDadY
   u17Lrk3WQT7tEkeMdDVQkqE5KPhMLHI2tVuC0JrcESLQtg7vF8+BHa5Yl
   y2wAMYS9LrI2AWz6qtxuuAYNNskDfJ3PxtsA7BQqs6IcaR/PLMjMBwLCj
   wHVVlb02nP1m+R+bO+6vsbvCcKeniwP8FtnwVnH37QPoRQoReQnzZQeij
   3ALfl49dVBaBQ1sx7pFuF7ofmUoY/k2H5T9Q2FTjYoFrYPyd9eyvJKfHl
   apzpVJpFAiixC3W5tbOGURMzvCniA7yvdZcNCkMDuneTGdwLoU2jId2mX
   Q==;
X-CSE-ConnectionGUID: /XztStddQaOLwC5KGjj9sA==
X-CSE-MsgGUID: MnhlCjN1RcCB+2YYgr1jeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56609829"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56609829"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:08:17 -0800
X-CSE-ConnectionGUID: chMNEhk3TpSeu4ytM7/bnw==
X-CSE-MsgGUID: 5UhwIlo0RG2aJA98cFc9Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110099785"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Feb 2025 04:08:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tevFN-000qtH-2m;
	Mon, 03 Feb 2025 12:08:13 +0000
Date: Mon, 3 Feb 2025 20:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: nb@tipi-net.de
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] usb: xhci: Restore Renesas uPD72020x support in xhci-pci
Message-ID: <Z6Cxjv7b88r59ITi@f9d63055f2c6>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203120026.2010567-1-nb@tipi-net.de>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] usb: xhci: Restore Renesas uPD72020x support in xhci-pci
Link: https://lore.kernel.org/stable/20250203120026.2010567-1-nb%40tipi-net.de

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



