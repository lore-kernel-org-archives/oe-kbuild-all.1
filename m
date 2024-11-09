Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1704A35
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 05:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731131137; cv=none; b=byQ2Dcpa6nenjrBcxvE5H2dacYPiMkyBzXfzPD9diECNYrAh3X1tfLGo3LmXq2X7FbyAvaDDtHzotAuWdO1ZqDmwCdFew4pH/FAQhV/WdxuOeSbleThm5hhRLtK//1Pil94YSeNC8pvUbzHkQpvod3PkQClItM4b64radNvYueE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731131137; c=relaxed/simple;
	bh=OP8nxrzpn1D2SX4sx1OIss/TtRX5HF68noCIiTLBw+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mscCuO4w0TTS3YQLCFe2aYsPjtq7X6ezEEpBnw131zWlCTr8m49gueBwes4RHcDYVyC9R1yQfYea9p65CHem/Of15Xw+qY2duhqYRhynPdDdaYUiKHiY5X60BOkGd2TArKXHHo2+mkN9YnJSdfOcc3AYNlyg25leL25WpqZL0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDNUHCeA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDNUHCeA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731131135; x=1762667135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OP8nxrzpn1D2SX4sx1OIss/TtRX5HF68noCIiTLBw+M=;
  b=IDNUHCeAzIArnrBZRS1frVdgJ8e2OC5aYJwwcxIV/2gH9V/UQUD3nvaw
   hRpe9dKYbmfJqSf3DMxJ/xlpkWF5MrUOf+g+xEGIqemp19EgNdhluD6cP
   MSh2ZeIR6f6feooCuhLZq/C+fBbyrTykgJaZUUPEYuQI0D4+ZCixFYeG3
   xSi367GhoymJxZJcbY/OU3SvkOHlZ691HI/zsdfrCyesywS7hb/IgoMJy
   8rbnMtmCs9FLom1jFwRrlq00H7npleYE0/20o1z0z+pCr9Do4o4xhbLv3
   bIfKyfiIZ7HevnXWLJnaqenqcEmBtzt/Fa6j4WV/WnznCTfQGjpl26C2U
   w==;
X-CSE-ConnectionGUID: 40Dc7K/vRCKcTebR6Lrybw==
X-CSE-MsgGUID: QuZfwCQiRd+CEn8HS4J2hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34805318"
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="34805318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 21:45:35 -0800
X-CSE-ConnectionGUID: AbN6SPDERki3siPt7+WTAA==
X-CSE-MsgGUID: MF4ds1E7TD6Byws1Lv9q5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="90996117"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2024 21:45:34 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9eHr-000s6k-1M;
	Sat, 09 Nov 2024 05:45:31 +0000
Date: Sat, 9 Nov 2024 13:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 19/19]
 kernel/trace/bpf_trace.c:1029:14: error: implicit declaration of function
 'ftrace_get_symaddr'
Message-ID: <202411091313.lSdRtRUF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   45b6f29f12043a3d5cb155ac4e09fa61229ebb00
commit: 45b6f29f12043a3d5cb155ac4e09fa61229ebb00 [19/19] bpf: Use ftrace_get_symaddr() in get_entry_ip()
config: i386-randconfig-141-20241109 (https://download.01.org/0day-ci/archive/20241109/202411091313.lSdRtRUF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091313.lSdRtRUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091313.lSdRtRUF-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/bpf_trace.c: In function 'get_entry_ip':
>> kernel/trace/bpf_trace.c:1029:14: error: implicit declaration of function 'ftrace_get_symaddr' [-Werror=implicit-function-declaration]
    1029 |         if (!ftrace_get_symaddr(fentry_ip))
         |              ^~~~~~~~~~~~~~~~~~
   kernel/trace/bpf_trace.c:1031:1: warning: control reaches end of non-void function [-Wreturn-type]
    1031 | }
         | ^
   cc1: some warnings being treated as errors


vim +/ftrace_get_symaddr +1029 kernel/trace/bpf_trace.c

  1026	
  1027	static unsigned long get_entry_ip(unsigned long fentry_ip)
  1028	{
> 1029		if (!ftrace_get_symaddr(fentry_ip))
  1030			return fentry_ip;
  1031	}
  1032	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
