Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895BB5683
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 13:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680527365; x=1712063365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AjwJxutXjFKP2JH3i4+K1ttL14PjK32OR1A2A6hGn7E=;
  b=bpR5QzRYiY5fVKolAeQwrOHxfqw2MyD4DWNZ1D77ArU5ChVGE0iCEA4W
   QdMzccycRLfB9B4G/lbjGMzBtZaLYi/JK3ms45XtEjCzzXBGEmlMP+azJ
   eg5LZdLpmgijs1TNq/ahYE6isRP/lprIk1h3T3KjJghDuWOKYk3leIyYw
   IsJm3pG172IS6+vdISeTxhHjEhxbKjL8RgZj174oBR3iFNvt/A736OpVm
   htD3JK0TYtTmUtdbYux3P9l1K5AmAoO5DpLPIty68AbxN4GA5+Q45CVdT
   tMqU0NUTGVHJ/zK6O72wHmN8GDI0SBjqsa2T+13MChoAs2+6fPpfpm+Ef
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="369699711"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="369699711"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 06:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829559964"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="829559964"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2023 06:09:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjJvn-000OIn-23;
	Mon, 03 Apr 2023 13:09:07 +0000
Date: Mon, 3 Apr 2023 21:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2/2]
 arch/arm64/kvm/hyp_trace.c:595:36: warning: unused variable 'hyp_trace_ops'
Message-ID: <202304032118.mnGC2rgS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   78eb8a33c0da0245cde221c96996e7d3efe7b8ac
commit: 78eb8a33c0da0245cde221c96996e7d3efe7b8ac [2/2] ANDROID: KVM: arm64: Remove the non-consuming hyp trace interface
config: arm64-randconfig-r003-20230403 (https://download.01.org/0day-ci/archive/20230403/202304032118.mnGC2rgS-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-5.15
        git checkout 78eb8a33c0da0245cde221c96996e7d3efe7b8ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304032118.mnGC2rgS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp_trace.c:245:6: warning: no previous prototype for function 'hyp_poke_tracing' [-Wmissing-prototypes]
   void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
        ^
   arch/arm64/kvm/hyp_trace.c:245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
   ^
   static 
>> arch/arm64/kvm/hyp_trace.c:595:36: warning: unused variable 'hyp_trace_ops' [-Wunused-const-variable]
   static const struct seq_operations hyp_trace_ops = {
                                      ^
   2 warnings generated.


vim +/hyp_trace_ops +595 arch/arm64/kvm/hyp_trace.c

575dd1da644e642 Vincent Donnefort 2022-08-25  594  
575dd1da644e642 Vincent Donnefort 2022-08-25 @595  static const struct seq_operations hyp_trace_ops = {
575dd1da644e642 Vincent Donnefort 2022-08-25  596  	.start	= ht_start,
575dd1da644e642 Vincent Donnefort 2022-08-25  597  	.next	= ht_next,
575dd1da644e642 Vincent Donnefort 2022-08-25  598  	.stop	= ht_stop,
575dd1da644e642 Vincent Donnefort 2022-08-25  599  	.show	= ht_show,
575dd1da644e642 Vincent Donnefort 2022-08-25  600  };
575dd1da644e642 Vincent Donnefort 2022-08-25  601  

:::::: The code at line 595 was first introduced by commit
:::::: 575dd1da644e642dd122a5af1e81c4171af0f842 ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
