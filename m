Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708632773E4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932164; cv=none; b=YhnPkhdv0VNg13lDKRWTAbXcEOABiPgdY784NYNgvqafncQvtTBS7ltQvXbiglXe/4ksNef2aOpcVWjzjIyfqN3ODFJ3oZyEU0JDHWU0/uTrxj0UsCORXkDjgASbHJCaSYQygmZ5NbTLGrO6vqr+mMI4wGTZiCHp4lN2e8UXSGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932164; c=relaxed/simple;
	bh=n0WVtaprjAHaQRAEoGPLfZo+iOX9h60zmeNYJloiwCw=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmOwEG36wx6YwWvq+mDHtrFYZ+viyH2/eEAvaTclOnIHxuJkzdoFJWJSaRy3vWsdJg3VvNNi1qw3VrLHS3nw1XUhJbqHwioHSpuf0HZbe3sv9xzPHBzXTTLPCiahP4Figcju2v6IXRtwcuOEvk/3zFMO4Nr9s9AfPcT9RQwouGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hdvq0Seg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hdvq0Seg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790932163; x=1822468163;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=n0WVtaprjAHaQRAEoGPLfZo+iOX9h60zmeNYJloiwCw=;
  b=Hdvq0Segi/R7YCzJQw0Kj296zXJbLWxlP+r/iv/8h8gJ2nlpbv0beHbr
   QvU98wN3xZzu57NsS9az4FMxH45ChT824+/CXgfrRfcnSclcJYHYnLljY
   RLOw7/nH1cqHOW2wcb04JxVYgdVBfTtxzRVhCaw6Q94v+TzO42wkDYhQM
   ElR564OP/6nksfM1VzSsoAuq9HOHZYKnvKXglhPpdzRSCEEUdOCYB/DOT
   9GecLXi9Nk/rE2Yu9Bt7NR/DmydMmoz97Knsp67fOEBSVN+lFDA9NF+8L
   wOKk70wEWD7M/bgKIyLjQrWNrBs/sqd7O2wKlonRJ/eFe0YlMYJkLiuRu
   Q==;
X-CSE-ConnectionGUID: KqUdD8sTTMOnG42U64gRGg==
X-CSE-MsgGUID: GbUWpgmTTHKLg5UySq4MPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94185376"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="94185376"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:09:22 -0700
X-CSE-ConnectionGUID: q/NLQZ9QRGqxmvN3M+sKgQ==
X-CSE-MsgGUID: R9schNQVQUOUTpePcMWaPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279494513"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 02 Oct 2026 02:09:21 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCZGY-000000000Tn-3nvZ
	for oe-kbuild-all@lists.linux.dev;
	Fri, 02 Oct 2026 09:09:18 +0000
Date: Fri, 2 Oct 2026 11:08:40 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: bpf: Add gated tracepoints for skb life-cycle
Message-ID: <202610021111.ChGDJ9fP-lkp@intel.com>
References: <202610021111.ChGDJ9fP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610021111.ChGDJ9fP-lkp@intel.com>

Hi Jakub,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Sitnicki/bpf-Add-gated-tracepoints-for-skb-life-cycle/20260928-134018
base:   
patch link:    https://lore.kernel.org/r/202610021111.ChGDJ9fP-lkp%40intel.com
config: powerpc-randconfig-r2107-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021111.ChGDJ9fP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021111.ChGDJ9fP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021111.ChGDJ9fP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/skbuff.c:1610:2: error: call to undeclared function 'skb_maybe_trace_copy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1610 |         skb_maybe_trace_copy(new, old);
         |         ^
   net/core/skbuff.c:1610:2: note: did you mean 'skb_maybe_trace_free'?
   include/linux/skbuff.h:5186:20: note: 'skb_maybe_trace_free' declared here
    5186 | static inline void skb_maybe_trace_free(struct sk_buff *skb,
         |                    ^
   1 error generated.


vim +/skb_maybe_trace_copy +1610 net/core/skbuff.c

  1609	
> 1610		skb_maybe_trace_copy(new, old);
  1611	}
  1612	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
