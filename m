Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4875354AF4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762844644; cv=none; b=gOGdoFeC56ahTXzzunW3kwitd4cCA2XN/xFEn3bUAXqXXxyORkBbgW9TEB2g8fmuo8kw2GVU1XooPiZ2VMTJo1ceLKXHB/1V4ASqez0KbzV/6yf4u5ZB1ykYtCVml1E9RRzwBgJBMHsfgH9dtVIEiJigVHaHXNXKEh6hwXMY2/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762844644; c=relaxed/simple;
	bh=3vQc4dPwa/UKdGF3EP9rAzQyng9yyAvbMQ+CZQYtLBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buL4G8pTyvVRE95kz8XVZsic+yrL3DtfSoZpT6I/r7rN3AI2R6f9NVF0JLWxAjquaJgdjNKZHgVjdJ8cI2bLWcmZLxAWGsse37xyMNJbJY963FqZYfW91wQkkACyciJFcKe+OT91wAuHCIyLxA1PTY3zJeCQdhjA2BVgjD6U5os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9e7KoR5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9e7KoR5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762844643; x=1794380643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3vQc4dPwa/UKdGF3EP9rAzQyng9yyAvbMQ+CZQYtLBU=;
  b=a9e7KoR5yEHEGiIHaMBVKiHGrhFUoJu8NP30/L8Vr7BEno8WbTzDPmGt
   r9dOuVNjJ1YU+hOefmemniU//5jTnEjZC0QVqKp2E93ESReKPKhnaHDym
   kiPDA4aCQaBRLCfnIz4l2cdBYXw5RWOa0EUtN84x2urzXwXqkUOiqle5W
   rQfnkpcDFgpLot4eBO3JyrMV87Cj0WIYKavTtT5r1ah3AuBWITsOPpa08
   AIbuPhgkfwzGEeLlR+m9HTYDHO2UQPQT9zdiTA8GYWTP4bsYcbj258w9l
   gGA3IUjKJkd0q9szrepX1QMKyNsQsm6QXhhaj6MVnZ7khbYfqpiyRnZRp
   g==;
X-CSE-ConnectionGUID: GrBF8qSET7a3+ZpjOYXCCQ==
X-CSE-MsgGUID: s0MKNrpyT3GJaTKMOrW1LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="65059306"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="65059306"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 23:03:59 -0800
X-CSE-ConnectionGUID: y1/4i393S3W1T2EJPDeKJw==
X-CSE-MsgGUID: wnNyB14TR8egLjJrb6R1Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="189629488"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Nov 2025 23:03:57 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIiPy-0002t9-2S;
	Tue, 11 Nov 2025 07:03:54 +0000
Date: Tue, 11 Nov 2025 15:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Foster <foster.ryan.r@gmail.com>, selinux@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org, serge@hallyn.com, paul@paul-moore.com,
	Ryan Foster <foster.ryan.r@gmail.com>
Subject: Re: [PATCH] security: Add KUnit tests for rootid_owns_currentns()
Message-ID: <202511111453.e1clsyyc-lkp@intel.com>
References: <20251110143748.4144288-1-foster.ryan.r@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110143748.4144288-1-foster.ryan.r@gmail.com>

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pcmoore-selinux/next]
[also build test WARNING on linus/master v6.18-rc5 next-20251110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Foster/security-Add-KUnit-tests-for-rootid_owns_currentns/20251110-223824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git next
patch link:    https://lore.kernel.org/r/20251110143748.4144288-1-foster.ryan.r%40gmail.com
patch subject: [PATCH] security: Add KUnit tests for rootid_owns_currentns()
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20251111/202511111453.e1clsyyc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511111453.e1clsyyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511111453.e1clsyyc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/commoncap_test.c:45 function parameter 'test' not described in 'test_rootid_owns_currentns_init_ns'
>> Warning: security/commoncap_test.c:63 function parameter 'test' not described in 'test_rootid_owns_currentns_invalid'
>> Warning: security/commoncap_test.c:79 function parameter 'test' not described in 'test_rootid_owns_currentns_nonroot'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
