Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2879820B217
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 15:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595444; cv=none; b=fMHi1OkgPnQxOY+Uo/3x9HyC/hAVYTWn9cGxc6S9Pa/lxMYi7UzCqJ6kpUZdRIxyMR7g3J4/A8YI+qndM+018wUAnKU0bi6gmnPOp/HaaxB6oBDnI4HtfflNA9XMLbYF+D8ZWilmBrh1fRnXAvqQHkO+i+jj13j5+eC6xdJjSr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595444; c=relaxed/simple;
	bh=jE3FAddViLaN6Y6d4a0D+qHNyvu/g+PcseGbB+V4JtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hiXut865iCZvuTeIaLDWnrBf6leJ2pKUcec6MsHQpcw4qcQmnd7ZDvtmt+W9EHUbCbFcwoXTDd5DedzrCjiDQdEuikcT4Osn8Bzo+cnKiKR/fOKzdy6OUPgKeA9Nt78bQaFUH9uKO7AqV92LFC68Io+GDkESbvYBgNdxh+Gt1Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h745wZih; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h745wZih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738595442; x=1770131442;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=jE3FAddViLaN6Y6d4a0D+qHNyvu/g+PcseGbB+V4JtQ=;
  b=h745wZihaoGrLBy7tsHxedgSEn4PQXgqqYLxqhwJ96HcF+GrMviCe/Kd
   HHXE9oTa1d4GA0QBpgdRbwF20OOV53p9BEhE3p26l7TLi3c07nTn7278/
   SOusVyHRue2HN5YLy1BQkIseFR4QMFiYdF46ZLrYvHZA7aerTSrD3ajuD
   FhYG8mflUFqWO4M0TIZDM91pThiIdqa1A52z9vG9kYtxJT/X/QCHAbfS8
   TvQi6c5MRK20C4DahYTTqW8Yy1vJjFs/JzJ/DTxD/a4L9qMrDFd21vBec
   bcGUW1dj5aPQRAwUJzMdzmqfz6IR+KKuzUn2jnJlWyuh8+oQmzqN8gjYB
   A==;
X-CSE-ConnectionGUID: vHgK0fHRRhyUdVDYpsHdSg==
X-CSE-MsgGUID: nJi7hXzHRnmRPagAL9jLFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49745274"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="49745274"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 07:10:41 -0800
X-CSE-ConnectionGUID: w98/blrsRVWxxLno9IoQvA==
X-CSE-MsgGUID: wq1B6jtoSGyaOgkOAdStbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114348254"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Feb 2025 07:10:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tey5u-000r5H-0p;
	Mon, 03 Feb 2025 15:10:38 +0000
Date: Mon, 3 Feb 2025 23:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Nepomnyashih <sdl@nppct.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6.1] efivars: Fix "BUG: corrupted list in
 efivar_entry_remove"
Message-ID: <Z6DcbTbx3qpz45G3@f9d63055f2c6>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203150336.2694569-1-sdl@nppct.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 6.1] efivars: Fix "BUG: corrupted list in efivar_entry_remove"
Link: https://lore.kernel.org/stable/20250203150336.2694569-1-sdl%40nppct.ru

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



