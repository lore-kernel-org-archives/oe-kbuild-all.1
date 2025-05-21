Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF60B23817E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 08:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817261; cv=none; b=Y0FvxMsfue5dG66Xic5o+a9c3lxCgWnLWlYIurn8wZqEIHpK/0u4lG4DCcI/8BnHQIacqx3YLPzQQ/4ZQb7vAyTvBb2tAReu9U9ZUkbmasBqBeb/7nTRWv0zZoM79OBS711egWfmYVQP+BMpfqqWEoSDGRUyO4+SxXA1hYHrOno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817261; c=relaxed/simple;
	bh=M3dTLcTu/FhHkXYJBOeGigZCeCM5uSZbstK7r4690R8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQtfUU5Dnyq1yf2NOnagTJszhIfCxAEGADCyyCIcsLitcPoSpINDHNbAOt0QgKh6NDbZzb8iO7yHj3Ny66ETeid/HF/WsH2SrTFpcx8XkJCP5/agDZsebL3WJ13QmTQhTPrzbZ4hvfDm7WDQ6eSiswJXykLpegmrJaBr4732adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1DXhJfA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1DXhJfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747817259; x=1779353259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3dTLcTu/FhHkXYJBOeGigZCeCM5uSZbstK7r4690R8=;
  b=O1DXhJfAOy6HgdGwG7o0avLM98WtEB/9J+wmfQJYl0uMtu4Iy54qWI7V
   hkxWnXRKdhMzcHmQHpEPTqaqKJzV9ph/uisCK86s1My1DyeDYCvKOpCR8
   rTj0AE3vp5+/tkZbO6sc5/u+jMsEIE5osJE8ApIu6zrOcW4/Zyv0szROf
   XOVnNmovMYjfEVf1btiw1fzGFFq4lHJe0b39V7k8yPJveTVW/ONXMoUs/
   SRvCmmRXc6lITxzLohVYW+j8kD9NyXSxArUFSUas2k9VjqGkMeBb2f9jA
   LYHZ166532+KnJO2p1aYzJsfRxbYOx1OH9XzuEqN+Ar+fAQ0CCu93Osul
   w==;
X-CSE-ConnectionGUID: orM15ytCS7GrWZlgtDjgDg==
X-CSE-MsgGUID: tNagyn3FQWaELY2OzI6KMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49688975"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49688975"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 01:47:39 -0700
X-CSE-ConnectionGUID: LmvQDOi+Q7yl+VLdhB46mg==
X-CSE-MsgGUID: 0a/OMyXsSOKPdW+wtI7wwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="145106633"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 May 2025 01:47:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHf6t-000O3e-1C;
	Wed, 21 May 2025 08:47:35 +0000
Date: Wed, 21 May 2025 16:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev 17/20] lib/kunit/kprobes_stub.c:25:12:
 error: conflicting types for 'kprobe_handler'; have 'int(struct kprobe *,
 struct pt_regs *)'
Message-ID: <202505211628.5ilrGWdY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git dev
head:   13ac901a15c34decc881c9ad9fbe22443d06258e
commit: fb2fcf633f76a6be13b50c7477f3aaff9cd111d4 [17/20] kunit: Expose 'kprobes stub' API to redirect functions
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250521/202505211628.5ilrGWdY-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211628.5ilrGWdY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211628.5ilrGWdY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/kunit/kprobes_stub.c:25:12: error: conflicting types for 'kprobe_handler'; have 'int(struct kprobe *, struct pt_regs *)'
      25 | static int kprobe_handler(struct kprobe *kp, struct pt_regs *regs)
         |            ^~~~~~~~~~~~~~
   In file included from include/linux/kprobes.h:31,
                    from lib/kunit/kprobes_stub.c:9:
   arch/powerpc/include/asm/kprobes.h:88:12: note: previous declaration of 'kprobe_handler' with type 'int(struct pt_regs *)'
      88 | extern int kprobe_handler(struct pt_regs *regs);
         |            ^~~~~~~~~~~~~~


vim +25 lib/kunit/kprobes_stub.c

    24	
  > 25	static int kprobe_handler(struct kprobe *kp, struct pt_regs *regs)
    26	{
    27		struct kunit_kprobes_stub_ctx *ctx = container_of(kp, struct kunit_kprobes_stub_ctx, kp);
    28	
    29		instruction_pointer_set(regs, ctx->replacement_addr);
    30		return 1;
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
