Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA7E15AB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679827959; x=1711363959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gTd4kdnFmC3wE1GqFWLWq+oWqf5E6pP7lLTXrSlRJHg=;
  b=dN7ppYryuRbRClz8fn6GNiIxT9Ct0ufFgzjJSCiDEYj22kefImjL0+VI
   Ap/U9uU8f2oCwwZ4g/IgfjlVbdrtKmboxNIXJk8cthaTRw1k9pmj+Sup/
   0htKed4UpRFS3gWMzlYLsw8EpSJ/9RyKsh+lkD2SIXLgJ7bAHJaurmSSg
   iiIv433EaPORiLNk8+BhrvWuUQdRLDeazduLWBySd0uui7ppnosHGJ4bD
   O3Nye4XTJIpOI0Ksp0H6hGLN0MGMI4opZ3eAemOnq5uuzzR4yKyLy/sby
   Y7ilC6Vux4lSxfwNfPnOOc5xGKLE80yBMyopomlcajmIrivPXqXDDEzb4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="404994147"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="404994147"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 03:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="685687788"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="685687788"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Mar 2023 03:52:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgNzJ-000H4D-0Y;
	Sun, 26 Mar 2023 10:52:37 +0000
Date: Sun, 26 Mar 2023 18:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 03/13] bpf: Implement bpf namespace
Message-ID: <202303261855.fwn7UyAo-lkp@intel.com>
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
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230326/202303261855.fwn7UyAo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/97c1724462aa56ab051d35da4a23086e98466e40
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yafang-Shao/fork-New-clone3-flag-for-BPF-namespace/20230326-172511
        git checkout 97c1724462aa56ab051d35da4a23086e98466e40
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303261855.fwn7UyAo-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/nsproxy.o: in function `create_new_namespaces':
>> nsproxy.c:(.text+0x164): undefined reference to `copy_bpfns'
   ld: kernel/nsproxy.o: in function `free_nsproxy':
>> nsproxy.c:(.text+0x551): undefined reference to `put_bpfns'
>> ld: kernel/nsproxy.o:(.data+0x24): undefined reference to `init_bpf_ns'
>> ld: fs/proc/namespaces.o:(.data+0x24): undefined reference to `bpfns_operations'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
