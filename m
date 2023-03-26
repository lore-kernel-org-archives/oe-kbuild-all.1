Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6EC1FBD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 11:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679829343; x=1711365343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0uilKbzBoJYE/dus79G3zvmpqBbBaaDc5KtOq9RWyz8=;
  b=U+paOpvbyjlHFU7Qw1Z7NpsSfNj+1IQramElnMWNBA3j2m77tHttNn/k
   OF2GuNNYz5KrvdWpfn5xx9sFe6dtjzHq6yDaHNHxpyGuF8Yj0VsLgTHRr
   Ae4BlfXawUK7g+i/4uPt0P3T0laJcyZtsjJfqyT1sDdCLUDYV22grwFdD
   85sTYTkwjoOHPv3f6X31TwpyzbRlUhc5goU4odZgFcRU6ooP6xVJBVTHI
   jp8oYdlUblDhoeQ/8P+qCyjv6I5SMlxOKrSy9p2GBqoHnUmW6CzaTaOC+
   o3JK+RTQetxjdPOlfwDR6v9YKC4ahMNk/hyAvnCzYGisBmaAhyGDGzNi6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="328506872"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="328506872"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 04:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="772369177"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="772369177"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Mar 2023 04:15:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgOLa-000H5h-0L;
	Sun, 26 Mar 2023 11:15:38 +0000
Date: Sun, 26 Mar 2023 19:14:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 03/13] bpf: Implement bpf namespace
Message-ID: <202303261942.YXsQCmqk-lkp@intel.com>
References: <20230326092208.13613-4-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230326092208.13613-4-laoar.shao@gmail.com>

Hi Yafang,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/fork-New-clone3-flag-for-BPF-namespace/20230326-172511
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230326092208.13613-4-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next 03/13] bpf: Implement bpf namespace
config: openrisc-randconfig-r004-20230326 (https://download.01.org/0day-ci/archive/20230326/202303261942.YXsQCmqk-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/97c1724462aa56ab051d35da4a23086e98466e40
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yafang-Shao/fork-New-clone3-flag-for-BPF-namespace/20230326-172511
        git checkout 97c1724462aa56ab051d35da4a23086e98466e40
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303261942.YXsQCmqk-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: or1k-linux-ld: DWARF error: could not find abbrev number 31
   kernel/nsproxy.o: in function `create_new_namespaces':
   nsproxy.c:(.text+0x460): undefined reference to `copy_bpfns'
   nsproxy.c:(.text+0x460): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `copy_bpfns'
   or1k-linux-ld: kernel/nsproxy.o: in function `free_nsproxy':
   nsproxy.c:(.text+0x740): undefined reference to `put_bpfns'
   nsproxy.c:(.text+0x740): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `put_bpfns'
   or1k-linux-ld: kernel/nsproxy.o:(.data+0x24): undefined reference to `init_bpf_ns'
   or1k-linux-ld: or1k-linux-ld: DWARF error: could not find abbrev number 99
>> fs/proc/namespaces.o:(.data+0x14): undefined reference to `bpfns_operations'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
