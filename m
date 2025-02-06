Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6776F239567
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 17:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863867; cv=none; b=clLGbMkT1FWMHOtxjJ6IKS2UTBE3/wAQp3ml1TXP7WqjEUjdP/7iA8unZ00rQGZN4F87vQx0AGfTQd+jOG/DHpjOxQnaC0xuLTQJwUhesx5ii69uTen/XoCuPAC3gBMtKgNLFXOpnYEnVF7G/+6NRJG+++XUeSxdlSpdmEa28qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863867; c=relaxed/simple;
	bh=t04mXMiHiItj0Pi3sghBZcaTJCY9rUxY39bWgSEMMZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LFtjaw/Tl658Z7gmXGFWOhdpPEmpr9oQBiOfBfTOk0KkUafqUWCay8/34ThSJIpAsCi3Qp3ezaRLYnC5D8wGPpDnJOLOmipGt3U5vfpq7xAba8/GjYgjTFq/4lP9+lwpDKSt4mgW+9rddwEEZIqNNYfGMOsvEyGDxuVH1MARfXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHqNpqeM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHqNpqeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738863866; x=1770399866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t04mXMiHiItj0Pi3sghBZcaTJCY9rUxY39bWgSEMMZY=;
  b=DHqNpqeMSVhnZe57+Fxk7/9vDf444jGHqfQl7pF1rwJ9e32xoQyafog/
   9Y9kgJ4rbLsjYoGF2FOe/0f3RY6ld6B0MOgunNrKgzwXVeh5EUVivfOHl
   X+Pyt/iy0rVgGk+ymXdQR0Wj03AbJ9x5bU1D/9oq5k1JEdnWrYK73TZ+S
   /rtXi16lidukaYIrt5R1AytxWY6KMI/4F3F0/ojvjtjRmEL5lLNsNZ+RC
   kz9L9t0s6j4A6HZacbueu6vLfHJX/A0blOJBRdwiT7wxzksSKGc3nEVYi
   JFfWbmJ711UVqtJDX593pZq/NmfHOatOSTDWsZ131bWIaZBkHzE64G0HZ
   w==;
X-CSE-ConnectionGUID: 0BAqKEVuQxi/jCzYBkYBqw==
X-CSE-MsgGUID: i16AIBgMT5iyHqBg/TbKSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50120618"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="50120618"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 09:43:55 -0800
X-CSE-ConnectionGUID: 3iTOww2LQ4m9YA8p6d/lEw==
X-CSE-MsgGUID: GpbRLcgtRp+9AJqUuox6Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116472753"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2025 09:43:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg5uo-000x9H-2v;
	Thu, 06 Feb 2025 17:43:50 +0000
Date: Fri, 7 Feb 2025 01:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 7/9] kernel/trace/bpf_trace.c:1043:13: error:
 implicit declaration of function 'is_endbr'
Message-ID: <202502070106.2vZwK0DT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   57750f0464beab3927ad570e0c1b5e78c91dd1b6
commit: c5a15175c3560f7ec5cacfca9fd72655b7f55742 [7/9] x86/ibt: Clean up is_endbr()
config: sh-randconfig-002-20250206 (https://download.01.org/0day-ci/archive/20250207/202502070106.2vZwK0DT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070106.2vZwK0DT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070106.2vZwK0DT-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/bpf_trace.c: In function 'get_entry_ip':
>> kernel/trace/bpf_trace.c:1043:13: error: implicit declaration of function 'is_endbr' [-Wimplicit-function-declaration]
    1043 |         if (is_endbr((void *)(fentry_ip - ENDBR_INSN_SIZE)))
         |             ^~~~~~~~
>> kernel/trace/bpf_trace.c:1043:43: error: 'ENDBR_INSN_SIZE' undeclared (first use in this function); did you mean 'MAX_INSN_SIZE'?
    1043 |         if (is_endbr((void *)(fentry_ip - ENDBR_INSN_SIZE)))
         |                                           ^~~~~~~~~~~~~~~
         |                                           MAX_INSN_SIZE
   kernel/trace/bpf_trace.c:1043:43: note: each undeclared identifier is reported only once for each function it appears in


vim +/is_endbr +1043 kernel/trace/bpf_trace.c

  1040	
  1041	static inline unsigned long get_entry_ip(unsigned long fentry_ip)
  1042	{
> 1043		if (is_endbr((void *)(fentry_ip - ENDBR_INSN_SIZE)))
  1044			fentry_ip -= ENDBR_INSN_SIZE;
  1045	
  1046		return fentry_ip;
  1047	}
  1048	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
