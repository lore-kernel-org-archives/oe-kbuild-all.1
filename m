Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334632;
	b=C6H6PmDoc9oFPp1WW5xrEKA69pf+Jn5s59hoKokCiOYC/TjW57e0jMrgkkNpG5CC1Y7p
	 cSR4F3MoCDcxTQfdpLv3lD8RnZoy1g5Dk/Pv671K5EKrzyAgo1J4nFH/e/V3BxbPEXqq9
	 t7hlpXb+0obgcbWS+EfGJQ4zUANPpDp2N/baQlZCTtJ+vWHwIWOlT7sFbryyYO7uUhdW5
	 j3FxyqIoHuYSs3GraeuXuRzZiabZApGP2NcswQBpF31brhce+Zyn3ih7cFj0WGJzj8S+D
	 c/hdNlLiRFfUqllFRwAOAd7XK0yd4RB9yJ0V7j2FN+3w16hCcez1NeV1jPhyza8Ofpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334632;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=h3dJdR6q8Gg07FqWwDDcruBAIQmzdQdrIuc+cX+hWH4=;
	b=gm3Y+9TAj26q8YFZ8FtncKg9OJklMQIHXj893YSkyypuMfjb6fe6sgtFvunDizODqL9Y
	 gr6cD+nZHastPLVY/FCY3aFf6rSQzoSZfJoviuFa2Cizzo+K/pwgFiDRj5/jXrXGySYkD
	 MzKdlQMtJfjQEnQcjeN5zZ6i4ZdefuMa1PiZDMnNtG0M4zqWzVe4VcOZ0rNC3b5+LZTko
	 W9w1DXmcCITX+IQ5udT6qQuvAjs/EFNRKtuX3qsYGLojp3qXipr0Bx6MudjzUw66bPqAS
	 RSU7ELxG1fazYRuugtfOIp0oeOL+5w9I26KBMdlecNL+MLZgwag5XX1ZA+O+g/XLtgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GVlK8irN;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64D2606A321
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 18:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E64D2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GVlK8irN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794334632; x=1825870632;
  h=date:from:to:cc:subject:message-id;
  bh=CiwWBG4nAJyYLMBfIQ2Z3DVF1R9ZtH/iEWWaOFVokW8=;
  b=GVlK8irN3vByMKllwom6T8frJjlai23auPLt8TXrZJPRvgs3s2tyKLGv
   vA+mt5sYgt+jhSc/4/7zLhssvIFYCaG3VFBCb43EicfYho3ggKetP21il
   USbYE+jurIY+h/EPKz/gsYH2zIuv9YqSsOpL/K0gBTamm3XWJu/Harihj
   VzXLL1skd68k+Nz7s6bV+wN2MPh3ZJu/xMvBPzlY8KtkGHFZvp/VHNJf7
   Aja9Mzx7GxLMj8SP5LfE7pfX+Pq+Xw+HWCf/YaToN+Tyz2dbsM5QZ/geh
   9u41BXe4xKHjsOzGFBsUCJ0j3nFKlBVaIAbD/a7pxgRzb56yNkDxoz+Y6
   Q==;
X-CSE-ConnectionGUID: kWxIXDOCRcOA5uxeTAJ6Xg==
X-CSE-MsgGUID: Z64/jlRdT3ujT5J4poSX+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3133170"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3133170"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 10:17:12 -0800
X-CSE-ConnectionGUID: pzXXNpGQQbqPmjWjvVA7Iw==
X-CSE-MsgGUID: 5iZ8hf9rRwGb4c/IiVswjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8084624"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 10 Nov 2026 10:17:11 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQqP6-000000000KP-0P6e;
	Tue, 10 Nov 2026 18:17:08 +0000
Date: Tue, 10 Nov 2026 19:16:26 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations 26/40] nios2-linux-ld:
 kernel/bpf/unwind.c:120:undefined reference to `bpf_sk_release_proto'
Message-ID: <202611101909.eGWaYd4t-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Kumar,

First bad commit (maybe != root cause):

tree:   https://github.com/kkdwivedi/linux cancellations
head:   cebd6c9fc9adb0f84623f6e93f543666457c22cd
commit: 5b4b4bea5a56b8a366601921eebec6cc6ae26343 [26/40] bpf: Add frame descriptor tables and release what they list when unwinding
config: nios2-randconfig-2001-20261110 (https://download.01.org/0day-ci/archive/20261110/202611101909.eGWaYd4t-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611101909.eGWaYd4t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611101909.eGWaYd4t-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: kernel/bpf/unwind.o: in function `bpf_unwind_release':
   kernel/bpf/unwind.c:120:(.text+0x258): undefined reference to `bpf_sk_release_proto'
>> nios2-linux-ld: kernel/bpf/unwind.c:120:(.text+0x25c): undefined reference to `bpf_sk_release_proto'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
