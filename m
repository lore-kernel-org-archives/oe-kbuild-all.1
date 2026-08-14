Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5C83AAF5F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786719054; cv=none; b=E+0op+886nth0K5/CRIuU7gj/0i56zKI8LRyj0hE0pOkkaOresccjMlfb1XXDe67tTOsVf8R84vfeew2gr50dVp+bJodqXDSNbUt1C/g31Q/A0fQd7LrZvOCyb0F+NWOBEtv5N3WzLNweiPJnNivQiucnrtPFjtX0CTNLYMv4sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786719054; c=relaxed/simple;
	bh=92B9TlJsr3BMYc4vrrM7ZIwJPo2f/aTDXkUNIm14iVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJJAV+k5E7so8a9RtTLzPm54oEOBWD1MGHdHmQK6qVOLVX/A3/MfuVzT+q4KZutoi4/wT2ortIT2iDtzBWgVxVe0reyW03VuGhtVWwTnwuKkDuR137l4ezKbAWL0il2GONjG2qKwqTrujrVyRIQT7Bw7xaRoB9UMtGIHJ1gaOhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsrK1GUQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsrK1GUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786719049; x=1818255049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=92B9TlJsr3BMYc4vrrM7ZIwJPo2f/aTDXkUNIm14iVQ=;
  b=JsrK1GUQFTLaRSeC1JwUHXCqWiT3ps0EuFVYG1hNrjMGgkAhfSwSl3Md
   XgvPha+DcM/95TwWLA/HOT1xJRVRF/CwErK/Y+aLEwBrBzXZFWBPMUa6K
   E0GU8ZM6B/WdVlWpt/0bKctUmQ2W4goAezShNktuo2ypNWyaGnFKre9Kq
   bHV4Ta067DUYSbBcEWPJ17MCXOki06gK26q1Tx8laubgnWv1dG9jvNGLL
   OuZEShiX0NzytOv0B8ootOWsMb/gvGK+W0Iu2LQW1p473YH0AbbnoXnHF
   ocNodBTLFjV8TrdYgb6FdqGxR8kvbfe1nMz4JkLGLxn/qjG7Wqf9yENOS
   Q==;
X-CSE-ConnectionGUID: fE+yt395Qduk8/JK1BBANQ==
X-CSE-MsgGUID: 9VEvnB7jR4iCQExTjDaQWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87319033"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87319033"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 07:50:46 -0700
X-CSE-ConnectionGUID: SzcQX8pCT4+6sYgVwfjWBQ==
X-CSE-MsgGUID: wqCE1cKWSeCEx09ysMOEAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="302483635"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 14 Aug 2026 07:50:42 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wutF2-000000006Hf-3RqH;
	Fri, 14 Aug 2026 14:50:40 +0000
Date: Fri, 14 Aug 2026 16:50:17 +0200
From: kernel test robot <lkp@intel.com>
To: Tung Nguyen <tung.quang.nguyen@est.tech>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, davem@davemloft.net, kuba@kernel.org,
	edumazet@google.com, pabeni@redhat.com, jmaloy@redhat.com,
	horms@kernel.org, tipc-discussion@lists.sourceforge.net,
	Tung Nguyen <tung.quang.nguyen@est.tech>, Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>
Subject: Re: [PATCH net v10] tipc: fix NULL deref in tipc_named_node_up() on
 empty publication list
Message-ID: <202608141616.ndguFzxL-lkp@intel.com>
References: <20260804021628.28607-1-tung.quang.nguyen@est.tech>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804021628.28607-1-tung.quang.nguyen@est.tech>

Hi Tung,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Tung-Nguyen/tipc-fix-NULL-deref-in-tipc_named_node_up-on-empty-publication-list/20260807-042503
base:   net/main
patch link:    https://lore.kernel.org/r/20260804021628.28607-1-tung.quang.nguyen%40est.tech
patch subject: [PATCH net v10] tipc: fix NULL deref in tipc_named_node_up() on empty publication list
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260814/202608141616.ndguFzxL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141616.ndguFzxL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
   WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'fast' description in 'page_pool_params'
   WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'slow' description in 'page_pool_params'
   Documentation/networking/tipc:184: ./net/tipc/name_distr.c:261: ERROR: Unexpected indentation. [docutils]
>> Documentation/networking/tipc:184: ./net/tipc/name_distr.c:262: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/userspace-api/landlock:550: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
