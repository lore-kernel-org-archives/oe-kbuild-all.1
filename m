Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00C9163
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747388557; cv=none; b=nyMTCwvwpj3rdkQeaQyUsYwpgHoPq3tcjqU78rD1vFnI8DMFoSdVB1fvausoVI2HahaSpmg6VJkSFTzh2XHVXYqfSWocvKS+CyAg4aY7kdSr/+8zALrgj33dJLohkmbyd7zpio1hxeEn1KejZ5scQk+k1EC18rHUSyLXHRwAiK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747388557; c=relaxed/simple;
	bh=TYCG91TdTMJv8FtgfS2PmI7E5ph9Lqco3luQ4iFQ610=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbDdC6jfkC7OT/pcLdVHfVTJ8dJIXiUMopwoMF88OW3N8b/D52uKDQSlLI3eoUU4aHsEPL6hE2NxxYYdbrspbkmo9+UVrU+Mexsikuu3AgxC0qXol8CsDjm6hMKaDbOS404TCipBiiUy0STvzu64rljq9+I0Lh4aO1akwhLvqhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMMggD3W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMMggD3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747388556; x=1778924556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TYCG91TdTMJv8FtgfS2PmI7E5ph9Lqco3luQ4iFQ610=;
  b=YMMggD3WqsYeeqP323JCJeEIpAW6VDxsspOcnLg9nJQriJ+iGPlMv0sC
   Ez8uSP5oPBHP+LxjyI18RxmKUJ8PqVFOcc8SPcd2mkI2/yoDc43r46DAs
   2g3yhz4MJ+JjZ39Jbu9oiIWtxsgocLod3mj2tuGNEOYrtv5HI4f7JMJ95
   Yu/31bnOMh353CW4zZg6vzgdPQRMiiOTLNPsxQVd/Xq7L8Wy9Tys8nYWZ
   3NL3HJHGKEjEs58szyncZoPQmShoM54F+a87MfOCZuUnFavd0eHRKcTbe
   Bw5yvbGizM2UkVatII/heZ/2fQpealq5GD+etaXTta/oFhYNynlgDqpRY
   Q==;
X-CSE-ConnectionGUID: HNbu7DnfRXmDssoRsYyQQA==
X-CSE-MsgGUID: 7b32vN0zRZ2St+XqWQo83w==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53169279"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="53169279"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:42:29 -0700
X-CSE-ConnectionGUID: xOCwkfpRSg6ODIgntfYb3Q==
X-CSE-MsgGUID: zFZqrgT+QUeb06Henmk97A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="139033106"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 May 2025 02:42:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFraA-000JCF-2S;
	Fri, 16 May 2025 09:42:22 +0000
Date: Fri, 16 May 2025 17:42:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Harmstone <maharmstone@fb.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 09/10] btrfs: move existing remaps before relocating
 block group
Message-ID: <202505161726.w1lqCZxG-lkp@intel.com>
References: <20250515163641.3449017-10-maharmstone@fb.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515163641.3449017-10-maharmstone@fb.com>

Hi Mark,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on next-20250515]
[cannot apply to linus/master v6.15-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Harmstone/btrfs-add-definitions-and-constants-for-remap-tree/20250516-003914
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20250515163641.3449017-10-maharmstone%40fb.com
patch subject: [RFC PATCH 09/10] btrfs: move existing remaps before relocating block group
config: i386-buildonly-randconfig-002-20250516 (https://download.01.org/0day-ci/archive/20250516/202505161726.w1lqCZxG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161726.w1lqCZxG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161726.w1lqCZxG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [fs/btrfs/btrfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
