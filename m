Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23C31990C8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 12:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525081; cv=none; b=UgAgNB6lkfjESspGnga8043UOIapbmyZaAnhSleEBGg+xg8z79WNDuEeiFMOApWQpimlYSPn1p+2Qvdx/9WGcNMV6AJCtYONxhWAzpAS/2VB4t215pT+Lu9nRRCo5zxQgunMXDiYRHaaVNaJxT0ErRADdGd2LVyxkQ1sAmGfhFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525081; c=relaxed/simple;
	bh=IjRLodiTtALwaq7uDCO/sjeo7xc/gv8mPz61vDFVz4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbbGUJu6TU13aWCGS4e+OVjsuEMMXqgklV8XWNGrQASRntV58ABCAW5NjDn1WVwWKpqCVKiLmgtvKeIch0RRZ6dznMiCSklbTbnrGGihfIcFuQ8A69yoJT0ETrgmuNb2t36CDz1jEB3iecI3UlwR3l5woQqs5zcYpIwqgHDoDJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AR67Eh1m; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AR67Eh1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734525078; x=1766061078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IjRLodiTtALwaq7uDCO/sjeo7xc/gv8mPz61vDFVz4M=;
  b=AR67Eh1mkoahw4TPrAnr8An4U0w6d6agKooXorlGL9w9eLesT3ymOfoz
   5XbAkMiZKt32wc57tuiXQOsSn4pI04qk8Yx4qJSVK4Lijcr7Q0D0d41UJ
   usip/mmPiOYPKErmriM6P7W8OX94Khmy6DCOJp25si2tqiIzFxMA4zGsV
   iew5QYhDB6p8DFCnZgLEioApNCWMUP7o9t5XqY9JpUpUBRGoMSXRS54nS
   /G6jidyT+kRJXnQFwO2IH8LA6Ejz5B/Ics8VZoWOtoItpZK00bQhQcIad
   9QhOTxv2kryOE1K78+sXi+kC7lUOMWtnahl43JiPYF2KyV8CctPoxLSGw
   g==;
X-CSE-ConnectionGUID: w8rrUU9+RQ2n7bkEoC3rrQ==
X-CSE-MsgGUID: yDkmCvpyQPm98Ondclfjvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="52517105"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="52517105"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 04:31:17 -0800
X-CSE-ConnectionGUID: If53LohJRHaRWHeM6bRd9g==
X-CSE-MsgGUID: U+8oqX+cTdaATWK4/o9B0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="102839795"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 18 Dec 2024 04:31:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0011B329; Wed, 18 Dec 2024 14:31:14 +0200 (EET)
Date: Wed, 18 Dec 2024 14:31:14 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: drivers/thunderbolt/debugfs.c:532:5-33: opportunity for
 str_yes_no(supports_software ( margining )) (fwd)
Message-ID: <20241218123114.GG3713119@black.fi.intel.com>
References: <alpine.DEB.2.22.394.2412170944390.3436@hadrien>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2412170944390.3436@hadrien>

Hi Julia,

On Tue, Dec 17, 2024 at 09:45:01AM +0100, Julia Lawall wrote:
> 
> 
> ---------- Forwarded message ----------
> Date: Tue, 17 Dec 2024 16:26:31 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: drivers/thunderbolt/debugfs.c:532:5-33: opportunity for
>     str_yes_no(supports_software ( margining ))
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   f44d154d6e3d633d4c49a5d6aed8a0e4684ae25e
> commit: ec6f888ed08aeceaebfdd7d344ae0cd91a1b9a1b thunderbolt: Split out margining from USB4 port
> date:   6 months ago
> :::::: branch date: 14 hours ago
> :::::: commit date: 6 months ago
> config: loongarch-randconfig-r061-20241217 (https://download.01.org/0day-ci/archive/20241217/202412171648.LGwq0U3d-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202412171648.LGwq0U3d-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
>    drivers/thunderbolt/debugfs.c:544:4-25: opportunity for str_yes_no(both_lanes ( margining ))
> >> drivers/thunderbolt/debugfs.c:532:5-33: opportunity for str_yes_no(supports_software ( margining ))

Definitely makes sense. Would you want to make a patch for it?
