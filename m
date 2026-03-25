Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B05F4F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 02:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774407046; cv=none; b=J3WsFI3dhPeJNkzQdKbGdI/GP5I4n+xuVxGzoL7xOoA8Wu9hS9n/ve4FnLLLOGjWQ4bG3hQ+S7rMXpxoa5SbSSO5N25K93aWfrdhESBU9y49ukIBRwx2ewtBsyaJhhB8X+JT7wzwkvS/V+qXvH20eDqEWB78JScdmlAHQj/7Dv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774407046; c=relaxed/simple;
	bh=7jNZI7kg0eEiRMfIi2+iHftwRzwtp6g9VXJRx9n3p0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGwXGgza6gEkTptlj0CZOMMeWimlqYoxgqNCixEYZn+EDHlJhOaQ3j/rrvG017PVrNumt7z0UV7kNj1arCnk1RSfiX+MnX0GkuW9tTCNbPD3iVIBETFcOlrhH/MCw/LdvyDYR/BafEkKmovnapmOHFpi3IUE0aT460rYScw757Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1ZyOPvY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1ZyOPvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774407044; x=1805943044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7jNZI7kg0eEiRMfIi2+iHftwRzwtp6g9VXJRx9n3p0s=;
  b=H1ZyOPvYqZje1ed+nXbaCUrLgo7Fe2r90e/ZD6s+tG+ysMaE8kEAZl76
   5xTmvnVuppTdlqvz8mu0iHXsmmE1vHq0eNvAa1Jlp9ntsxykekzDhBbU6
   P/y4qFMDZQwQsoB6w7nIY99mvoZwqQ24Gk5XzAFnSUvwTKAAHZ0PKpGA7
   fJ3DNzquKcdZ340cFR+MSMh4u3WM7l6fHWpWcMPpbdx+rBx9nYcPj/xqk
   LFYf2fPhx8g6+cgMw+2JNvfoBgGsY0wFDDw71Xzf6TWMdMKkPXHhePchI
   oo+OW6B3TLRQ57nJ62Eyoxy7129NCpRwUjlm4Pl6NHrvjYfD1ryZ/kQuv
   A==;
X-CSE-ConnectionGUID: o61B3V14TQGNkR8Hlmeq6g==
X-CSE-MsgGUID: shdAXAJeRaO/0f5ySlxSaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75463632"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75463632"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 19:50:44 -0700
X-CSE-ConnectionGUID: 1LZJ3CvUS/WL0NaCu+7DOw==
X-CSE-MsgGUID: qBTWwGvgRTqRMoqLWejR2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="248087036"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Mar 2026 19:50:43 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5EKO-000000005o9-3gHh;
	Wed, 25 Mar 2026 02:50:40 +0000
Date: Wed, 25 Mar 2026 10:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 1/1] mm/damon: add node_eligible_mem_bp and
 node_ineligible_mem_bp goal metrics
Message-ID: <202603251034.978zcsQ2-lkp@intel.com>
References: <20260320190453.1430-2-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320190453.1430-2-ravis.opensrc@gmail.com>

Hi Ravi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on sj/damon/next]
[cannot apply to akpm-mm/mm-everything linus/master v7.0-rc5 next-20260324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ravi-Jonnalagadda/mm-damon-add-node_eligible_mem_bp-and-node_ineligible_mem_bp-goal-metrics/20260322-011937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
patch link:    https://lore.kernel.org/r/20260320190453.1430-2-ravis.opensrc%40gmail.com
patch subject: [RFC PATCH v4 1/1] mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal metrics
config: arm64-randconfig-r123-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251034.978zcsQ2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251034.978zcsQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251034.978zcsQ2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: damon_get_folio
   >>> referenced by core.c
   >>>               mm/damon/core.o:(damos_calc_eligible_bytes) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
