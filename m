Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D1E2367A8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 20:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636337; cv=none; b=P+cBWO+bhSIKe6M31DFqOfszLVGV6sWMYuZ4tJCQ/L38uqxWC2EQlbYS8D+sTbJieCwBPfX0E0XBDOATY7Op7AtFS9MGCsrE832CbsP3XO9dwq/BQVF3vTDRuCy7mFxc1R161KYUJ0MAjKnuYC85yHKbtxxdOxn0hszoi9rFSoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636337; c=relaxed/simple;
	bh=TsgzG3Siem+ZVZDw0dpx4KwtjEDzRLPVNTomrJNMVxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jHQ6ygPWMrXTH2jawvroiSMV+f24LJoqDR+GDp4b6UNtgWSa5CXy6hshwNtX0vBfjVAjvP6k32pa08eqAJk758zHgeekkT1edlWsiv8uwJMCvtMr3WuouV/dtCP44vqSkcJt6YW+vD7MpR/+GCzYMS7BXbf0AZGu6YuwuEb1S6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rty9AqU2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rty9AqU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748636337; x=1780172337;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=TsgzG3Siem+ZVZDw0dpx4KwtjEDzRLPVNTomrJNMVxM=;
  b=Rty9AqU2N89H1HgpxLFtEL7h0sFGHKo8WJA4H4n8d+1IboC04tmnzEav
   mEM+XVje5cp6yvw3Ha04VaTpuFcuHnB/y/lqha6rz/grzKmkWbDS0dT54
   wn5C4XQXtBhk6eyW3RKM/3tp3CNgseiB1eVdgy06TeNlZcYGGu/io2B21
   hEYCPyztQnXrKocb+YW1Bk+wPhTMM0vf0UfsoUCn4kFrjQECDw+75AYpZ
   SPaHnOr5tFz8awJvpY46T0VWZvoH+N8cC9YOOLAOjoHJF3HZ1pNYvanVd
   fNHb2JHnjHUIBcRjNv7rBzsdUsk52rR+HXyw4ygSTLgG26/F7LCWjqyiA
   Q==;
X-CSE-ConnectionGUID: BUf1O7pRS0mg2LlhVzGSGA==
X-CSE-MsgGUID: n9vqXOuRRzeW8/WFt8FS3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50789605"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="50789605"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:18:56 -0700
X-CSE-ConnectionGUID: uxk+OHYnQA2jvHA7IeTLpw==
X-CSE-MsgGUID: F/kbG2q6SZ6xu/N6tM6EKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="167149943"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2025 13:18:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL6Bo-000XwC-05;
	Fri, 30 May 2025 20:18:52 +0000
Date: Sat, 31 May 2025 04:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm: userfaultfd: fix race of userfaultfd_move and swap
 cache
Message-ID: <aDoSlYVIa8rtJupb@679c1d4e5b58>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530201710.81365-1-ryncsn@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] mm: userfaultfd: fix race of userfaultfd_move and swap cache
Link: https://lore.kernel.org/stable/20250530201710.81365-1-ryncsn%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



