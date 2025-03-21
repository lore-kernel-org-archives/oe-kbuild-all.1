Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9D31F1531
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742550999; cv=none; b=Cj/46dwmst/J605LCa0n4ZOU08KH1oxtagvrStnJPPD7M5Yz4Hmf2nC3xoflgigz/FhncsNmi/6M5m4ajjdueWqF/iYrPEeTAJMPwBEvohnqGO57wc+gxRNQtDT8R5uJTXUnJ2ZEClTtsSndEvNRZBCmUyq6eqlvzwI2EMK2tp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742550999; c=relaxed/simple;
	bh=xWatFwpngzVeM+HdADz7k+Xx6TBXz0dAa0QBt3NgBk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IgGwL3/HAJRykro84aD4XxNvo1rDOLUiJmREgOhcURKQTGJvlD+FYu/b/WWgP2GwagHI9JAPLiTbxEsNk5PPgef9zWsEJZRsuT368hiMaC9MhxL6XSgMUiKsJWOYtxkEdi+8dj95XeRG5cNx87K5tyj5mLcahK7JMPua8MqSr18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mG15eRAP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mG15eRAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742550998; x=1774086998;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=xWatFwpngzVeM+HdADz7k+Xx6TBXz0dAa0QBt3NgBk4=;
  b=mG15eRAPt8z3EGUrUo6dQdy/rS0tx99wRQrEXQwguH0C9IwqT2HdrIQB
   S33PjjA754sRt/a/tp+JBC5PnASYeRG8ppfusNfprOHliK14aeBoAfvXM
   V9ejrYXtSz+p0xwDiFj6pfY6ST3mUd9rmpSgVejVUYyyKKvR5XoyXBm35
   bPm0iY0dLmVJ4xvhXiFw4b/5WIpd63PwaD3bdRL0Tn383E3UxuRfmcpIN
   Ua5wuT8cYR2Mjzo+RI9uoM0ZmxLCiTEYQEJaSpyjQEQwbZC9LN2tHKI6J
   /FJMvfFoNXoDXzEUnmIQzJ2/ORHtUu7h5NrSfeEcwAiirps18sW8xS/eX
   w==;
X-CSE-ConnectionGUID: Vy3IchPtRA+DHIqgTTwRqA==
X-CSE-MsgGUID: qh8qXBVUT12+cDw1R69XvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54479292"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="54479292"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 02:56:37 -0700
X-CSE-ConnectionGUID: dzpQIuGhQuGnq1DOBcEopA==
X-CSE-MsgGUID: Oz8hbjUPRxSdcNJ/sxDNGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="123530879"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Mar 2025 02:56:36 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvZ6z-0001FP-2x;
	Fri, 21 Mar 2025 09:56:26 +0000
Date: Fri, 21 Mar 2025 17:55:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ran Xiaokai <ranxiaokai627@163.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V2] tracing/osnoise: Fix possible recursive locking for
 cpus_read_lock()
Message-ID: <Z903jcd6JTJ7DH2-@f921524d7199>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321095249.2739397-1-ranxiaokai627@163.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH V2] tracing/osnoise: Fix possible recursive locking for cpus_read_lock()
Link: https://lore.kernel.org/stable/20250321095249.2739397-1-ranxiaokai627%40163.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



