Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633D41D683
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 19:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hn498l9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699125643; x=1730661643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wIvP/MEPbJ+2/7Xa7mxcpx96ze2RTZ4IRXDDPodL+bg=;
  b=Hn498l9X4kykv+qreo7t/Yy2Vf+YDtPQoJtRT8St/haPzt1lZkGIntAl
   0ajd7u3+tQSz1WfGcTUfO0/P4YeYH7iwyoS+P6plFxnW1XQVFGa3dQhjc
   HtzXL/aAOOOi/ZW2nyAk56JWzQHgvTeoR1rYKJ121SBggiNFZ67N8OM0I
   vAOtGJd+JKEEHKQugRydSTlI+FsYWXJERpIqUHE7ZdKUf9Se1RjjfDWrl
   KSRAk0BYN9Hi0VBqbybip32nKpIc7flYLdG7OGt0tnXn1DLjmSkIY4Lpx
   0VJYVWoPMspjz82qtgMpQNNJv9UoFTWlZgpfxm9ps3QwjWsd/aqUVuVUq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="391974126"
X-IronPort-AV: E=Sophos;i="6.03,277,1694761200"; 
   d="scan'208";a="391974126"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 12:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="796925691"
X-IronPort-AV: E=Sophos;i="6.03,277,1694761200"; 
   d="scan'208";a="796925691"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Nov 2023 12:20:41 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzMCF-0004e0-0V;
	Sat, 04 Nov 2023 19:20:39 +0000
Date: Sun, 5 Nov 2023 03:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 bpf-next 4/9] bpf: Add kfunc bpf_get_file_xattr
Message-ID: <202311050351.pQINxu6a-lkp@intel.com>
References: <20231102165432.1769965-5-song@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102165432.1769965-5-song@kernel.org>

Hi Song,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/bpf-Expose-bpf_dynptr_slice-kfuncs-for-in-kernel-use/20231103-032012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231102165432.1769965-5-song%40kernel.org
patch subject: [PATCH v7 bpf-next 4/9] bpf: Add kfunc bpf_get_file_xattr
config: i386-randconfig-062-20231104 (https://download.01.org/0day-ci/archive/20231105/202311050351.pQINxu6a-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311050351.pQINxu6a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311050351.pQINxu6a-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/bpf_trace.c:1490:31: sparse: sparse: symbol 'bpf_fs_kfunc_set' was not declared. Should it be static?
   kernel/trace/bpf_trace.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:778:9: sparse: sparse: context imbalance in 'uprobe_prog_run' - unexpected unlock

vim +/bpf_fs_kfunc_set +1490 kernel/trace/bpf_trace.c

  1489	
> 1490	const struct btf_kfunc_id_set bpf_fs_kfunc_set = {
  1491		.owner = THIS_MODULE,
  1492		.set = &fs_kfunc_set_ids,
  1493		.filter = bpf_get_file_xattr_filter,
  1494	};
  1495	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
