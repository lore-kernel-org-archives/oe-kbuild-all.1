Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B94B388
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 02:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688349738; x=1719885738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ecbu0SPk9flX9mFlAxU04hxaHEIRn/m52Owm/S0UlDA=;
  b=Dg/hmQ/adMatr5NhBOT5spWNy47cODjm0SR784iorMrlNDKyPaRyJQTP
   7YbevniVfe4dDfvzvTkrQMXBwhmbli0F4StqnTSkNQOl5HQ8eQOF2MgAF
   4EkWwPYb/ep9VbqtziYIaypxYsVsb/w87Dc9x1ETgNXigd6DeMO8g92Dy
   BuBOwgtkC3uvy+XGrp5dN3607dc9nslp96q1MnibNQnDqYWsYqNKKcrwI
   VVrUIwDKxFLUKu84FsyyfJ29NxHqTnhOeZuKYOJybeAAFdTB8vW57j8a1
   fWNNHq5sEn5IvvEJPAQfrXNmsIXBeGgFaQEw6hsZKAG13apixUVzyl4lB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="343104635"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="343104635"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 19:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="748003800"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="748003800"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Jul 2023 19:02:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qG8tL-000H2z-0y;
	Mon, 03 Jul 2023 02:02:15 +0000
Date: Mon, 3 Jul 2023 10:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yhs@fb.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 07/13] bpf: Add kernel/bpftool asm support
 for new instructions
Message-ID: <202307030905.un0sidl5-lkp@intel.com>
References: <20230629063756.1652245-1-yhs@fb.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629063756.1652245-1-yhs@fb.com>

Hi Yonghong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yonghong-Song/bpf-Support-new-sign-extension-load-insns/20230629-144251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230629063756.1652245-1-yhs%40fb.com
patch subject: [RFC PATCH bpf-next 07/13] bpf: Add kernel/bpftool asm support for new instructions
config: x86_64-randconfig-x061-20230702 (https://download.01.org/0day-ci/archive/20230703/202307030905.un0sidl5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307030905.un0sidl5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307030905.un0sidl5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/disasm.c:90:12: sparse: sparse: symbol 'bpf_alu_sign_string' was not declared. Should it be static?
>> kernel/bpf/disasm.c:95:12: sparse: sparse: symbol 'bpf_movs_string' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
