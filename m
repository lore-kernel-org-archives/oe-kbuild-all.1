Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170002594
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745154106; cv=none; b=qup37fNZtAmBJ90HlJnnG05M5cUKWfTa3JoP6FVWHsTAzsYeQZ4dYGVE26/vJeJbiBmTMHvBaS479n6vicVOTU9ATaLgoU6ZaZnUwodWYhVE5dwfeAcEwwZ6d1LFInkFYWHAOEFx5qbG4moYDEDhO7IADQBdHaEFWPp6mrbjWnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745154106; c=relaxed/simple;
	bh=IYV3aYXEVb6c7Jg06HHuOlln0/CfOyDlDpUTNF4WOmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUh4waNoXPZDk8akOr9tXN+J32tHt8TOc868mI3/WHl/6Go+If08i7Wo+iNHFHwSEcYqYxB/ougNaIJa3viEmK3w3DxXrRDfSgu8j0EQgGNeYxtMpVUehPNJWyGz0U525GfcC50aagochXvkB7XvnHlbjYaFTBy0nfJcJ0jCW2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpb5t6Bv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpb5t6Bv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745154105; x=1776690105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IYV3aYXEVb6c7Jg06HHuOlln0/CfOyDlDpUTNF4WOmg=;
  b=fpb5t6BvA/Leuj8WQjb3tBLpJu+C+qB9dq0UECJfHo1j9JBCLzl1MMpV
   nRXPsNxVSyPTPfX7OWOj9Mf7N2qibCgSQ7ft/T5oNnyGM0HPE355mf9tM
   8yzkpyZpYU+F6vNwB88rHLv3Ewk0b7kDoeUI8szNLryC2dENKUX2sSzeF
   JJBtn+R/XhLtzs0wa9fCnPSifDhwiclggx9Q84JaktY/CDwNPdHzIlyis
   SUwW2Ct1S+YMe1Tvk8WbMiZJm/ABUbnG3WK1g0/wcrPnHqmcrV7jJ+Bng
   HItXBwfADn+ZZKnWU1Sq0vk8/YYNSfldrd3s1BXlVsb73c3TXYyajokBA
   w==;
X-CSE-ConnectionGUID: bSvR7S2jSiaQDzopRlYkDw==
X-CSE-MsgGUID: B3uiSy1SRdSfglcXfWSbug==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46600101"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46600101"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 06:01:44 -0700
X-CSE-ConnectionGUID: p9dx6NoPSsGe0MvYkslc3A==
X-CSE-MsgGUID: lBG7YkRSSTyMfjGYJAlEUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136660635"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Apr 2025 06:01:43 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6UIn-0004eJ-1Q;
	Sun, 20 Apr 2025 13:01:41 +0000
Date: Sun, 20 Apr 2025 21:01:14 +0800
From: kernel test robot <lkp@intel.com>
To: Raj Sahu <rjsu26@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 3/4] bpf: Generating a stubbed version of BPF
 program for termination
Message-ID: <202504202057.1pQiTTsR-lkp@intel.com>
References: <20250420105524.2115690-4-rjsu26@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420105524.2115690-4-rjsu26@gmail.com>

Hi Raj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Raj-Sahu/bpf-Introduce-new-structs-and-struct-fields/20250420-185825
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250420105524.2115690-4-rjsu26%40gmail.com
patch subject: [RFC bpf-next 3/4] bpf: Generating a stubbed version of BPF program for termination
config: x86_64-buildonly-randconfig-004-20250420 (https://download.01.org/0day-ci/archive/20250420/202504202057.1pQiTTsR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504202057.1pQiTTsR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504202057.1pQiTTsR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/bpf_iter.o: warning: objtool: bpf_loop_termination+0x8: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
