Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC8515A1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 06:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IeNKa4v2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697957213; x=1729493213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nv9YCU+zDyRa1em5ZHtOZSpUwaVLFPKxDwfHZ1FF//U=;
  b=IeNKa4v2ejvDAw5+3quB38HBk3dezhDbywrORvAEEabCDC7HExTRK+r1
   U93+xpHVxs/mgusIEXqck0I8zIMBjQfUsDTFXRc1uiKiDcWk2f4BozX8D
   KldZXmCA4c7FgXi9y/SW+bBGK/3xdKeImCpyH91MHoFniXYxCXBjG/90Z
   SyULAsxBTQjUFE/HAmwrQBQNTc+X5PMQHswzT0FK2PbWRhCKB/etEhNgi
   XSUt2jiCz1j5Gn3MmaFHzOM+IF+IpdTNPw4R/uh5TzkrOSRYur5BfEiOC
   0mnSpzkgd21mMSvjStByCOnGXRquJ7B6kVYn9rOidTG8ieGaHM7vy1GvA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="472903877"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="472903877"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 23:46:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="5755948"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Oct 2023 23:46:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quSEU-0005fy-23;
	Sun, 22 Oct 2023 06:46:42 +0000
Date: Sun, 22 Oct 2023 14:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: thinker.li@gmail.com, bpf@vger.kernel.org, ast@kernel.org,
	martin.lau@linux.dev, song@kernel.org, kernel-team@meta.com,
	andrii@kernel.org, drosen@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v6 07/10] bpf, net: switch to dynamic
 registration
Message-ID: <202310221421.WsGCmmEc-lkp@intel.com>
References: <20231022050335.2579051-8-thinker.li@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231022050335.2579051-8-thinker.li@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/thinker-li-gmail-com/bpf-refactory-struct_ops-type-initialization-to-a-function/20231022-131121
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231022050335.2579051-8-thinker.li%40gmail.com
patch subject: [PATCH bpf-next v6 07/10] bpf, net: switch to dynamic registration
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221421.WsGCmmEc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221421.WsGCmmEc-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#192: FILE: kernel/bpf/bpf_struct_ops.c:80:
+extern struct btf *btf_vmlinux;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
