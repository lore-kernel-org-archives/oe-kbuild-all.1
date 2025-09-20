Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9E426B779
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Sep 2025 20:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758399209; cv=none; b=GlRilPXkFXnTE+zRsqPma7rz3vyZoU1h7/EA1Rwh1iduEbpBYHnbe9cbPi/9HtSRrUNvzMCS1TFJ0z9XgtQh3CRau9bnN7i2KqEDSLduqMQtKkcbqL3rvhXlrY8phtCPH0e6H83owevLbSMbEAK0ZDFmLxKLJpBVUTExtXHnkC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758399209; c=relaxed/simple;
	bh=c/YVOsFfXNOqu7i+KjseJUiqJ+wfyb7OI3iWlQ4bQFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rerZoNh/oXx6Yv5xvWkst3dzeX2EfZ2a6FmwK8FDaB7bkoEt8iCgUUQXVxSgUY8921zNuNS20Q0mTCwLIDJ5FUjJde87vJX8z+x4m+ZPpmHgkFBoBG/fHKTcC/hFM4Wnv4IX1m+r1ac7ermrJNmVKRECXg+yRnCjzgsOlc8IjuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjQ8/Jp8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjQ8/Jp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758399207; x=1789935207;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=c/YVOsFfXNOqu7i+KjseJUiqJ+wfyb7OI3iWlQ4bQFY=;
  b=gjQ8/Jp8myXaCW+QnBJJZwAjJlhuKsab+fju8PM26ssYC3bGNc5zLvkr
   nsYsrGe7PE6whyXrhFvP17wRzRBU/oo/Er8eBCxvMJuV41bJ5wyd0BrjD
   Dvz4dTAzUasHi9b39gHuzt3x00dPFSlezt9Qb4ugHJfeop+jRoNd7opdm
   mRfettfdvuCjxRId2hjJXvHn2m0dADLVwsFjh+HT8q/ml92Cg3lUY9Lry
   enuzTgtcjg8MGmPD/s6Zm7sGhfaI7/7MW5PLqYMDMLvwO4HZItjxj2atJ
   1GTKNd9FKDBX+zxuAFHayqLXFClb2OH2p4oP/lD4TMjj7IBhrNAaT327d
   g==;
X-CSE-ConnectionGUID: pnCzW+z1Tv+memE75n2Eig==
X-CSE-MsgGUID: mgFjEbVqTBSYg0f4c0iDsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60658183"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60658183"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 13:13:27 -0700
X-CSE-ConnectionGUID: mLjYwlPES4KsZwcmhlFZWw==
X-CSE-MsgGUID: CSmZchkeQCaJqEidlsnRjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="207074524"
Received: from lkp-server01.sh.intel.com (HELO 7f63209e7e66) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Sep 2025 13:13:25 -0700
Received: from kbuild by 7f63209e7e66 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v03xT-00004V-0q;
	Sat, 20 Sep 2025 20:13:23 +0000
Date: Sun, 21 Sep 2025 04:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6.17 REGRESSION FIX] gpiolib: acpi: Make set debounce
 errors non fatal
Message-ID: <aM8K4jAPD4rbWOcE@371967cdecd7>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920201200.20611-1-hansg@kernel.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 6.17 REGRESSION FIX] gpiolib: acpi: Make set debounce errors non fatal
Link: https://lore.kernel.org/stable/20250920201200.20611-1-hansg%40kernel.org

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



