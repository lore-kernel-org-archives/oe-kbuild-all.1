Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494057C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 09:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676367184; x=1707903184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gtY+FbDXoShbBj7MccCgwOPuQ80WHe2ZAsADdTBsr0s=;
  b=ARNFRcJOwOwjPx+MauhaMO6qp+tHqTSgAK502dQ+sugCiEMogP2b0e4f
   NpLfZPproUXUA+cGn0NkvvVphdTxBHfflTXVXLvIps+onZB17/VNm76UC
   IZuH+aKxFHAasNeknXQqjQEqfwgnBQ01nZUNeZqTzDRo0vMoGQe3wqrjo
   gNO2JVUEQsRNZ4uqsO37nZug7ZtWewzYUSBdOuf+pbx1z47AvuYj6PFFb
   1jdlSdPpLDpcYvwAe/5HWAUk9rexvsdrMEU3FIRzabkdNVJZhV+k7ElDj
   KFNUiqq/o1nTPE84U94+ZiZ4jz8ox+nf9E7NUH10E1yRTTBzYeKFox2Do
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="311479983"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="311479983"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 01:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="699482733"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="699482733"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Feb 2023 01:33:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRrgL-0008Mr-1m;
	Tue, 14 Feb 2023 09:33:01 +0000
Date: Tue, 14 Feb 2023 17:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android14-5.15 6/11]
 arch/arm64/kvm/hyp_trace.c:488:5: warning: no previous prototype for
 function 'hyp_trace_release'
Message-ID: <202302141757.s6T6bgg3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android14-5.15
head:   8e245b4c3a574fbb94b6b655f84e071febc147a6
commit: 575dd1da644e642dd122a5af1e81c4171af0f842 [6/11] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-randconfig-r032-20230213 (https://download.01.org/0day-ci/archive/20230214/202302141757.s6T6bgg3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/575dd1da644e642dd122a5af1e81c4171af0f842
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android14-5.15
        git checkout 575dd1da644e642dd122a5af1e81c4171af0f842
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141757.s6T6bgg3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp_trace.c:38:17: error: use of undeclared identifier 'STRUCT_HYP_BUFFER_PAGE_SIZE'
           backing_size = STRUCT_HYP_BUFFER_PAGE_SIZE *
                          ^
>> arch/arm64/kvm/hyp_trace.c:488:5: warning: no previous prototype for function 'hyp_trace_release' [-Wmissing-prototypes]
   int hyp_trace_release(struct inode *inode, struct file *file)
       ^
   arch/arm64/kvm/hyp_trace.c:488:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int hyp_trace_release(struct inode *inode, struct file *file)
   ^
   static 
   1 warning and 1 error generated.


vim +/hyp_trace_release +488 arch/arm64/kvm/hyp_trace.c

   487	
 > 488	int hyp_trace_release(struct inode *inode, struct file *file)
   489	{
   490		struct seq_file *m = file->private_data;
   491		struct ht_iterator *iter = m->private;
   492	
   493		ring_buffer_read_finish(iter->buf_iter);
   494	
   495		mutex_lock(&hyp_trace_lock);
   496		hyp_trace_readers--;
   497		mutex_unlock(&hyp_trace_lock);
   498	
   499		return seq_release_private(inode, file);
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
