Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC3C3A2575
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742264; cv=none; b=agbBcodIlhF3X4kkhJTbkno0nv1ETzqqqlQOp3V/Lb1wJjs2gesbqo8uIglDwD73o9VI7+N4Z/oIwimeiIPS+u0RT4wEGex+qzscLem83iHJpJJDksY7JIj9S4mNNATGYKdlLoUpbmB9lcTzythJtBxy3/RFG/vJiXPFg2UsTy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742264; c=relaxed/simple;
	bh=G8XoS1TYQKC+tZYU4Ara5WZJMLSwIp9nwLYY9towWNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eb0CXELBy5VmqLcwuUI92l0GfrxqkRetRDG4RIEPbwj8JBdsUmo1ZDRAgKpR2Gq9Ed6LWZDphMGRqMwuxY0UAlM8npSbSm47wdOO1oE8mSS3OGmot4RnqhoXty4q8TZ+FknRCPNZCYkLFmXqwUZfOLKL0XupuB8FAZI3BKEKrIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6n1QXn7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6n1QXn7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773742258; x=1805278258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G8XoS1TYQKC+tZYU4Ara5WZJMLSwIp9nwLYY9towWNI=;
  b=j6n1QXn78KXxB6gcAdEbhuPGwPnAuAybiJI4M4kR+8iSne4fDi1Gs0y6
   yOTT/h2bHSZms7F1UKGDt3LAevvADMZSDIByPzE/JhMFV3wkgl7jWSK7h
   fPO+TmuFpllLdmsih9gZZ36u5ZE2+ocvUTQmOxZwPUSZ2L+PhJQ4RUeSf
   BmvXKeI8nv/bDF4hD6BWUrVc1z7tfES2LtZbeAcowSPOkjvI/1+zlei+G
   UMSKSEEaj1BTqLLSSJ/goQl3imxutI3htl2qZo70RR5el2H28xCW6dtVM
   GBSUsdTwOJD2SZngn2Zh5MimygLw1FskAQianGtHVQm/JXIponKQ6aHSv
   A==;
X-CSE-ConnectionGUID: dJzNNsEXStuTg8m7qsuTgA==
X-CSE-MsgGUID: ugIgvME1S9a5re6ju6C/HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74887357"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74887357"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:10:57 -0700
X-CSE-ConnectionGUID: Rxzhb+4DRZ+CCr2qhhaX3g==
X-CSE-MsgGUID: 6LgERUjXRAKl9RGMGj261Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222448493"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 17 Mar 2026 03:10:56 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2RO1-000000004Pz-3AVE;
	Tue, 17 Mar 2026 10:10:53 +0000
Date: Tue, 17 Mar 2026 11:10:28 +0100
From: kernel test robot <lkp@intel.com>
To: John Ousterhout <ouster@cs.stanford.edu>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, pabeni@redhat.com, edumazet@google.com,
	horms@kernel.org, kuba@kernel.org,
	John Ousterhout <ouster@cs.stanford.edu>
Subject: Re: [PATCH net-next v17 01/14] net: homa: define user-visible API
 for Homa
Message-ID: <202603171139.hOLQ0YKl-lkp@intel.com>
References: <20260316223228.2611-2-ouster@cs.stanford.edu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316223228.2611-2-ouster@cs.stanford.edu>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ousterhout/net-homa-define-user-visible-API-for-Homa/20260317-070659
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260316223228.2611-2-ouster%40cs.stanford.edu
patch subject: [PATCH net-next v17 01/14] net: homa: define user-visible API for Homa
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260317/202603171139.hOLQ0YKl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171139.hOLQ0YKl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171139.hOLQ0YKl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/homa.h:11:10: fatal error: netinet/in.h: No such file or directory
      11 | #include <netinet/in.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
