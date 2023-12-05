Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAB7134D0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 06:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTbkVwKH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701759432; x=1733295432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hNMOu/BOQarVCNtXuCbvjvKot05Y6DVsiWZ/fLy6Z18=;
  b=iTbkVwKHJLhx5reUHwYYBQtaIikhjoWVEmhrL8xmOkK0qHCpKhqRzxkx
   rVMBuatQrdj3PxaOkT5joyNMRdqs7/GOvxaz9Z7yY2E5A+2qriA3oZbBu
   usDnB0c8GW/J1yU/lF/KrPtnrCw4ocriskYjpKSRhJ1lr0LSmP9X1RrWl
   ad+GQ0tOnZLwIo9yelArYySSFOyBUzi5GLV5XX3IJmIlfyqp4m3vBUbd+
   UgimbkPWyDLkJy/+kJE6UcxZ5ySRGQEmXm4yQ8XsmLNl4MGNrOUlmN3kc
   mz/YV3IF3sYrI6SX1I6GMCkjmldbnuvSc+p7Rcr6/bV/3eAtK/K5fKGrq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="393588173"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="393588173"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 22:57:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="888822395"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="888822395"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 04 Dec 2023 22:57:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAPMe-0008TS-22;
	Tue, 05 Dec 2023 06:57:04 +0000
Date: Tue, 5 Dec 2023 14:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	syzbot+97a4fe20470e9bc30810@syzkaller.appspotmail.com,
	bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
	Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@chromium.org>,
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>
Subject: Re: [PATCHv3 bpf 1/2] bpf: Fix prog_array_map_poke_run map poke
 update
Message-ID: <202312051420.clYpN744-lkp@intel.com>
References: <20231203204851.388654-2-jolsa@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203204851.388654-2-jolsa@kernel.org>

Hi Jiri,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/bpf-Fix-prog_array_map_poke_run-map-poke-update/20231204-045204
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20231203204851.388654-2-jolsa%40kernel.org
patch subject: [PATCHv3 bpf 1/2] bpf: Fix prog_array_map_poke_run map poke update
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312051420.clYpN744-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051420.clYpN744-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051420.clYpN744-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/arraymap.c:1015:13: warning: no previous prototype for 'bpf_arch_poke_desc_update' [-Wmissing-prototypes]
    1015 | void __weak bpf_arch_poke_desc_update(struct bpf_jit_poke_descriptor *poke,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_arch_poke_desc_update +1015 kernel/bpf/arraymap.c

  1014	
> 1015	void __weak bpf_arch_poke_desc_update(struct bpf_jit_poke_descriptor *poke,
  1016					      struct bpf_prog *new, struct bpf_prog *old)
  1017	{
  1018		WARN_ON_ONCE(1);
  1019	}
  1020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
