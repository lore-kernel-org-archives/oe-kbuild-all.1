Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F495CB8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 14:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676470671; x=1708006671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xZvalW1LSAwslT2jn+j1Tnag8vCCiQTL/sZReESfV8A=;
  b=CA+Mriq6SGQ8diumeGsRl/swyB3VCbaxouY2KWvqjLe8qSV3SsPJW47t
   VG7W/wbP9GwB1Yy/bUi08TyY0ny0OpucEGshxlQuHsB7+NeXS2EZhuHim
   EPZpJdY/d74CHDwxv3LEONPlp5hnvhOuFeZG7hVH2HXECj+GYsutSp5AI
   jXm8QzwmN6X1WreL+jJCsupiDWrLqB/HDbKjYKQkieJym/KWjnLEE9gDT
   xRzAo29jEvnyxH0tpmbuSI3omsPGpvWs1TWvz0T8Z9acBa71k2nfHcMVW
   CCxNKBtOJnLBRnGS6ljtbtufovpzGCkgNvkFApf7NeaveKSjyin9pDeaD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="333577190"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="333577190"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 06:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="793509705"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="793509705"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Feb 2023 06:17:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSIbU-0009R1-1c;
	Wed, 15 Feb 2023 14:17:48 +0000
Date: Wed, 15 Feb 2023 22:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/3] io_uring: enable io_uring to submit sqes located in
 kernel
Message-ID: <202302152202.3aHc65jB-lkp@intel.com>
References: <20230215004122.28917-3-xiaoguang.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215004122.28917-3-xiaoguang.wang@linux.alibaba.com>

Hi Xiaoguang,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf/master]
[also build test ERROR on axboe-block/for-next linus/master v6.2-rc8]
[cannot apply to bpf-next/master next-20230215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoguang-Wang/bpf-add-UBLK-program-type/20230215-084242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20230215004122.28917-3-xiaoguang.wang%40linux.alibaba.com
patch subject: [RFC 2/3] io_uring: enable io_uring to submit sqes located in kernel
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230215/202302152202.3aHc65jB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/0d433a1cf7f666e5596514da7fab92f2691463ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiaoguang-Wang/bpf-add-UBLK-program-type/20230215-084242
        git checkout 0d433a1cf7f666e5596514da7fab92f2691463ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302152202.3aHc65jB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:97:
>> include/linux/io_uring.h:107:5: warning: no previous prototype for 'io_uring_submit_sqe' [-Wmissing-prototypes]
     107 | int io_uring_submit_sqe(int fd, const struct io_uring_sqe *sqe, u32 sqe_len,
         |     ^~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/exit.c:67:
>> include/linux/io_uring.h:107:5: warning: no previous prototype for 'io_uring_submit_sqe' [-Wmissing-prototypes]
     107 | int io_uring_submit_sqe(int fd, const struct io_uring_sqe *sqe, u32 sqe_len,
         |     ^~~~~~~~~~~~~~~~~~~
   kernel/exit.c:1901:13: warning: no previous prototype for 'abort' [-Wmissing-prototypes]
    1901 | __weak void abort(void)
         |             ^~~~~
--
   ld: kernel/exit.o: in function `io_uring_submit_sqe':
>> exit.c:(.text+0x4b6): multiple definition of `io_uring_submit_sqe'; kernel/fork.o:fork.c:(.text+0x5bb): first defined here
   ld: fs/exec.o: in function `io_uring_submit_sqe':
   exec.c:(.text+0x9c5): multiple definition of `io_uring_submit_sqe'; kernel/fork.o:fork.c:(.text+0x5bb): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
