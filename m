Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D912522BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 09:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760176425; cv=none; b=eDH8yawOvA9AEkUH5V7/2N10sVJbCJPjZGhsV577LA25tHDCUXTVrL5MocAwbrXtrgKeD22j3WCRNa9INTnMo4+OWzVeZeBe/q8MePtqUwf47ArMmsLNyIFknqcBRSWWLwdC+hDPA0TZ6cr81keyHjQ7TtIVBb2zr8Oyuyt1R78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760176425; c=relaxed/simple;
	bh=z7LGzMn4N9AC/A6cVaoGYLEAI5yk2bouLK3Ejle43s0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=al24rubIFTqYrAg9LS3H99JnwXs+o8yyMmO1unCiJPvvrj9AvAFLSuWDspxMzyPdJmYWXrIukD+2dEuru4FHFBR1ZR1I+Xn22mqs69QB1LgERVCWQEyhZPIfjdJ/ETx+6ymGOORq8vx0fYf3OniazhCRDSmZz+3JOYWj5F+zzCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSs1crIB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSs1crIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760176419; x=1791712419;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=z7LGzMn4N9AC/A6cVaoGYLEAI5yk2bouLK3Ejle43s0=;
  b=gSs1crIBFOKeYV9wnC7InqCf/p19cWH4X11sunRgQVSnCFo/0V4st5z4
   KSpvlJJUJd4/NA3qE4BjOhYXfQI6WrXZEFTWdP1VLLMoJBbS/73HWWMUz
   ktu5nlr3Nu4di+gfqmlGU2xA2RpmewRkL6oXJIjciNN/Na947My0VgJx5
   kxRCOz+MND0wcZw/aTF282AAQ45rQnWIfTxE0ERjOe08nBj14Ezfe+S8W
   +psBy/QGNOvgqi+iHMzyGb3JcWynNbiqu3BM9VHKJE5wXqQbqAkI9x5qq
   MlHVgGMd/N5iFsYS7r8/DJ4AsBMpaFnbxt+kiPRIwgUUQ/zRvUnZrtaeD
   w==;
X-CSE-ConnectionGUID: 3JU472l5STuZudJ7QJBjlg==
X-CSE-MsgGUID: C46vUeRkRwirDDsqcpyQXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73487274"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="73487274"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 02:53:38 -0700
X-CSE-ConnectionGUID: 9LLbqgjNSwGU5Yi2OWx5hQ==
X-CSE-MsgGUID: qqD49qW1QLiuYqmTBYM+wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="185427868"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Oct 2025 02:53:39 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7WIB-0003h3-2x;
	Sat, 11 Oct 2025 09:53:35 +0000
Date: Sat, 11 Oct 2025 17:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ALSA: usb-audio: apply quirk for Huawei Technologies
 Co., Ltd. CM-Q3
Message-ID: <aOoo9didj7h3g56G@3b2fe27d8fe3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011-sound_quirk-v1-1-d693738108ee@linux.dev>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] ALSA: usb-audio: apply quirk for Huawei Technologies Co., Ltd. CM-Q3
Link: https://lore.kernel.org/stable/20251011-sound_quirk-v1-1-d693738108ee%40linux.dev

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



