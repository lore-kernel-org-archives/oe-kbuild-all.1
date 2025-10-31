Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F582D8362
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 07:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761894236; cv=none; b=G2YN35sNU2kpaMUFu758tVFVg6kvV6XtQyQo5vLideC3LTswnMB7GnTkgUWXd2+0Av8SDe0hQEv8M1acCerXmwGcDcTxy/3rEduR1Q7Hsfpdb8r0PdqiLpLqXK5M0ptaXZtXMCaRZx/AK9BfluN5vElO7T9ZmA4dZHH7YTy7nvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761894236; c=relaxed/simple;
	bh=h945/dxqfx1BTBBtl+azCJKqnPUCASnWBKHAoqpp7k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAMwK5gcdAidBnhG4nO/XDNdrhM8PeUnhM447i9bcbOgFo41kMkTU04emAmAakZKkicba7wdkSAHWnl3JzvMT9KakVJ8JFVElJtg1QKI26UVd4IdBdD7AZIuTGkFU29ky2oGm8Xqu5A9FbADVi8mhkTs4iVfCaoqHNXO1IK4qXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmHCN0Tc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmHCN0Tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761894233; x=1793430233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h945/dxqfx1BTBBtl+azCJKqnPUCASnWBKHAoqpp7k4=;
  b=mmHCN0Tcrp/Nq1vjGoiTxnWguZWGuwKnvKN/uxUw3n0U6ELvhBQ3cHtx
   K6IuRuBYhjzt7STToYn2gw0Y8UEY7JamiRg85q6E3hKWK6XhyMSUDfi/y
   anRzLAJzl/MK7w7TeF5rG1O2ytuM25p2cwPFOV5M4ojZVTke8cs1hOhDU
   sTTZg32Apvz+Rm13cRqXGG94/QZXZBSm0jZR/daRxRxyE2/l3vjBJJDo9
   FQfrBgrKgPN7z6hLFCgdC9H878SDUxyW92BIeTqD1WUDUs3z3OQZlAYk+
   coTzBJJz+NiTynRBWzuuy27OBDpSVia0dRjNg5KcHZeI3sT798PJf+Tn4
   w==;
X-CSE-ConnectionGUID: oZMcGasFT4uubR/F7QByUQ==
X-CSE-MsgGUID: CsODGnbWQi209P+U/XqHNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74648520"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="74648520"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:03:52 -0700
X-CSE-ConnectionGUID: INgihif2ThSVR7SAakLYkw==
X-CSE-MsgGUID: NNg+GFeoRGSdSWEX7M7t5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="185850502"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 31 Oct 2025 00:03:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEjAq-000Mqe-11;
	Fri, 31 Oct 2025 07:03:48 +0000
Date: Fri, 31 Oct 2025 15:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Richter <rrichter@amd.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, Gregory Price <gourry@gourry.net>,
	Terry Bowman <terry.bowman@amd.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Robert Richter <rrichter@amd.com>
Subject: Re: [PATCH] cxl/region: Support multi-level interleaving with
 smaller granularities for lower levels
Message-ID: <202510311413.HdTizWHK-lkp@intel.com>
References: <20251028094754.72816-1-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028094754.72816-1-rrichter@amd.com>

Hi Robert,

kernel test robot noticed the following build errors:

[auto build test ERROR on cxl/next]
[also build test ERROR on linus/master v6.18-rc3 next-20251030]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Richter/cxl-region-Support-multi-level-interleaving-with-smaller-granularities-for-lower-levels/20251028-175032
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20251028094754.72816-1-rrichter%40amd.com
patch subject: [PATCH] cxl/region: Support multi-level interleaving with smaller granularities for lower levels
config: i386-randconfig-141-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311413.HdTizWHK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311413.HdTizWHK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311413.HdTizWHK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/cxl/core/cxl_core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
