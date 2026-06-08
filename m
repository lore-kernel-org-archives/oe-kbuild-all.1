Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621BB3A7F59
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jun 2026 22:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780957272; cv=none; b=LktCewvD0dMeGSPFWjBtL4MCZ0cQg7qozLT/REkmfLTJPbt4w7cD3C7B/kZ80FOvS/RFaYWFBhneC4O5F49DFiM61RtM6ZyfyzM+pR7NXW8cpo3fTSrihh+XNAYtSS9fzKyYYTyhUx0hGqp2tWe2QSumnsoNj0jl70uBTtCF5VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780957272; c=relaxed/simple;
	bh=nOrvp/K0XgNlq7j+UTPcdpo4z07+p3UJ7MV7HzxAmi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNj4TrlJi2lS09t7CSzPHYCKt7ZOC8BUhFTB7dzN5nMJ9Zw27yM/o9gQrOW2BnfFZGwYvU2iaS5wg4Hz0T0v2qsdPXfOJrozFopDOKzvh+jDIi2kurndlvyHnfxLaEJSv0eJOQnGNbmCzqaec3F2BiAm8zVdBZx2A8oy3DO/at0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Id3YSbXt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Id3YSbXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780957270; x=1812493270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nOrvp/K0XgNlq7j+UTPcdpo4z07+p3UJ7MV7HzxAmi8=;
  b=Id3YSbXtSVNJoeiihWgmWeCthu1WD5NjbkWzDDkg4iJqfmVWXPbDVG6f
   Z2A1czMTT621uRdn890CTOzUanXlwaBFms7+xLwnvwJU0ZA6FcBO7VI6s
   JM1ZebXFgRg+EPDw69RpESFrPM/Exxxm5XJV7CKE9ZAoFHTpNjgoNiUH5
   0ww4oHwTfTQTNmurxFOvN0vY/FH8qKfn04zxI4QVXQQfwmbmVV2n397w/
   xsV2yTRE+PG2sMx8Z/cA7biK5ipclYwkVPO8zT5V/9+jtccF2706HN7Nu
   T4wt3B2P93N7MHKHajGNZNI8rSsuE6dnsWToILZeudyPyzk/R6mM8jg1F
   g==;
X-CSE-ConnectionGUID: Ave/kiLXR5Su2q4o42Ld+w==
X-CSE-MsgGUID: JD9RXTr/Qm2xuut9r5erHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92383231"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="92383231"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 15:21:09 -0700
X-CSE-ConnectionGUID: lJZjgeBlTN6jGd0GB9fJdQ==
X-CSE-MsgGUID: AFyYNntiSUuy9R2WgvdGkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="245774920"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 08 Jun 2026 15:21:07 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWiLA-000000003KT-1yBL;
	Mon, 08 Jun 2026 22:21:04 +0000
Date: Tue, 9 Jun 2026 00:20:52 +0200
From: kernel test robot <lkp@intel.com>
To: david.laight.linux@gmail.com, Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH next] drivers/gpu/drm/vmwgfx/vmwgfx_msg: Use strscpy() to
 copy mks-guest-stat names
Message-ID: <202606090046.Gb27Aell-lkp@intel.com>
References: <20260608095523.2606-25-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608095523.2606-25-david.laight.linux@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260605]

url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/drivers-gpu-drm-vmwgfx-vmwgfx_msg-Use-strscpy-to-copy-mks-guest-stat-names/20260608-175822
base:   next-20260605
patch link:    https://lore.kernel.org/r/20260608095523.2606-25-david.laight.linux%40gmail.com
patch subject: [PATCH next] drivers/gpu/drm/vmwgfx/vmwgfx_msg: Use strscpy() to copy mks-guest-stat names
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260609/202606090046.Gb27Aell-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606090046.Gb27Aell-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606090046.Gb27Aell-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:666 function parameter 'lim' not described in 'mksstat_init_record_time'
>> Warning: drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:666 function parameter 'lim' not described in 'mksstat_init_record_time'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
