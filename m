Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79587EA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 00:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685580288; x=1717116288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RiFnUNlsnq/3I5td0/M8EalsN+fmDjuZTEsFh4zgPZI=;
  b=lhhF7/tfCcbfZIrNLipwwo+78OayOu+03zzcLso67TwT3hbNT3gihGjj
   3VlvJK97CI0Pz6gpmlxyreMMbbGuMOtQN4n/l02+QwIWWQ97QZS9nzPMb
   b/hzRnStF2izPqKJ0Fa1Qb0tGTZ2JGXPGNPHW3PYMahVhqgxwoqZfGbGe
   Mw7UbLYNh0Flt/kbFI3EokxARWhYir0yR6lL2LLPjYYGdQUMUUsaA4F+o
   oAI8b5pvBGOjm3SUmbdyNwZwO1TZ2fvp96eUuU973uv9YHsJtlltIVRZY
   3ZUJb/+jnyY5Y6Od0FinlRv4bhACqb/Vsw79xrN3+L9Jno/PcvjMlxLTP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="383676436"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="383676436"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 17:44:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="710273448"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="710273448"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 May 2023 17:44:46 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4WQn-0001il-2i;
	Thu, 01 Jun 2023 00:44:45 +0000
Date: Thu, 1 Jun 2023 08:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: Anton Protopopov <aspsk@isovalent.com>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Anton Protopopov <aspsk@isovalent.com>,
	Joe Stringer <joe@isovalent.com>,
	John Fastabend <john.fastabend@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: add new map ops ->map_pressure
Message-ID: <202306010837.mGhA199K-lkp@intel.com>
References: <20230531110511.64612-2-aspsk@isovalent.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531110511.64612-2-aspsk@isovalent.com>

Hi Anton,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Anton-Protopopov/bpf-add-new-map-ops-map_pressure/20230531-190704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230531110511.64612-2-aspsk%40isovalent.com
patch subject: [PATCH bpf-next 1/2] bpf: add new map ops ->map_pressure
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230601/202306010837.mGhA199K-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/025cc7c86c6c7e108ba5b9946a0f50e0cc082f9b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Anton-Protopopov/bpf-add-new-map-ops-map_pressure/20230531-190704
        git checkout 025cc7c86c6c7e108ba5b9946a0f50e0cc082f9b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010837.mGhA199K-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/hashtab.c: In function 'htab_map_pressure':
>> kernel/bpf/hashtab.c:189:24: error: implicit declaration of function '__percpu_counter_sum'; did you mean 'percpu_counter_sum'? [-Werror=implicit-function-declaration]
     189 |                 return __percpu_counter_sum(&htab->pcount);
         |                        ^~~~~~~~~~~~~~~~~~~~
         |                        percpu_counter_sum
   cc1: some warnings being treated as errors


vim +189 kernel/bpf/hashtab.c

   183	
   184	static u32 htab_map_pressure(const struct bpf_map *map)
   185	{
   186		struct bpf_htab *htab = container_of(map, struct bpf_htab, map);
   187	
   188		if (htab->use_percpu_counter)
 > 189			return __percpu_counter_sum(&htab->pcount);
   190		return atomic_read(&htab->count);
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
