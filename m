Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABCD36AF9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 16:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cO7N7C67"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701102642; x=1732638642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rGzJ1QaEH/PqUrNDck8MUUtdEmE462mhfXEPR3qma8s=;
  b=cO7N7C67uWp/Ry0CGkcNvBTHwLvIU6ydc68qyD637V43Y+LUEN1K72vj
   gbvBwjSYmOY/cE92sV2OkyrAp7LHR9brW0lrUQLZ1ED2cbMYUcE2LVFjq
   HQI234drkn1NHs/qIXFCb70e/5pBLPtY3QVMgZINtm4t9YylChuo9TshC
   CC7OyHkdTSj53JWrLil9mLV9/a6hcHwMGgjmw1mzo/ouATvcNL+URTiAs
   oOTJBNpsb/K3liCznZb5yVDP9tIbumBDsKQ33/gxApCkEGnaM36yhGp6R
   yRW+FYwPtMb/USPJyVeHjyX9MYnOFtwR2n8Xk8tfVn/iKMJs5m32XEh6j
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="14297141"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="14297141"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 08:30:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="859103289"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="859103289"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Nov 2023 08:30:04 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7eUk-0006Qd-16;
	Mon, 27 Nov 2023 16:30:02 +0000
Date: Tue, 28 Nov 2023 00:26:57 +0800
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
Subject: Re: [PATCH bpf] bpf, x64: Fix prog_array_map_poke_run map poke update
Message-ID: <202311272311.WsiMBsbq-lkp@intel.com>
References: <20231127094525.1366740-1-jolsa@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127094525.1366740-1-jolsa@kernel.org>

Hi Jiri,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/bpf-x64-Fix-prog_array_map_poke_run-map-poke-update/20231127-174900
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20231127094525.1366740-1-jolsa%40kernel.org
patch subject: [PATCH bpf] bpf, x64: Fix prog_array_map_poke_run map poke update
config: parisc-randconfig-r071-20231127 (https://download.01.org/0day-ci/archive/20231127/202311272311.WsiMBsbq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311272311.WsiMBsbq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311272311.WsiMBsbq-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/bpf/arraymap.o: in function `prog_array_map_poke_run':
>> (.text+0x103c): undefined reference to `__bpf_arch_text_poke'
>> hppa-linux-ld: (.text+0x106c): undefined reference to `__bpf_arch_text_poke'
   hppa-linux-ld: (.text+0x1090): undefined reference to `__bpf_arch_text_poke'
   hppa-linux-ld: (.text+0x10c0): undefined reference to `__bpf_arch_text_poke'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
