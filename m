Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08BC3232
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 13:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680356911; x=1711892911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8oS+p238lsGSBoojsf5XnJRdBiFikz5SFXZOUgRkTRw=;
  b=SgzNBsYaKa22H10fVxCSE+sRPPAgAeHvBfnJ5g5zHiuW8MKvagA189cf
   w7ygFlpeUF63iG0DW3CJHWJHMrlyHlg8UYTisooZylKv3esUEGFDla6HO
   I6RAfgQBJsss73l6Uvaktyswci54mMPwTCEBJqWfJeAnZYWFLXADlqO8z
   Zf/IHe6dwhhVFacbbqLkYDkcXlOFFeynwuNsof+t0LptJZHNZatlyGGOS
   WyV6fmujljvLu2PhD/rcLuO6EehGZgBI9Izuc/UZLnUk3MoNtQOrP8Nq6
   GJYJomV7KqaT4CHWsAK0EMgQYgyRMFuz42VYrmkNjRVhUtF1zhJEcf2kx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="322044158"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="322044158"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 06:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="715759394"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="715759394"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Apr 2023 06:48:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pibam-000Mow-29;
	Sat, 01 Apr 2023 13:48:28 +0000
Date: Sat, 1 Apr 2023 21:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.4
 2812/9999] drivers/dma-buf/heaps/deferred-free-helper.c:23:19: sparse:
 sparse: symbol 'freelist_waitqueue' was not declared. Should it be static?
Message-ID: <202304012144.H2qez0Nc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi John,

First bad commit (maybe != root cause):

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-5.4
head:   09417023d02f21d46d6a239c93a6ae0f45a1b1e7
commit: e3919bfeb0066ab9b5f9765e5610b95672990e64 [2812/9999] ANDROID: dma-buf: system_heap: Add deferred freeing to the system heap
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/20230401/202304012144.H2qez0Nc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/e3919bfeb0066ab9b5f9765e5610b95672990e64
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-5.4
        git checkout e3919bfeb0066ab9b5f9765e5610b95672990e64
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dma-buf/heaps/ init/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304012144.H2qez0Nc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/heaps/deferred-free-helper.c:23:19: sparse: sparse: symbol 'freelist_waitqueue' was not declared. Should it be static?
>> drivers/dma-buf/heaps/deferred-free-helper.c:24:20: sparse: sparse: symbol 'freelist_task' was not declared. Should it be static?

vim +/freelist_waitqueue +23 drivers/dma-buf/heaps/deferred-free-helper.c

bd1639945c3029 John Stultz 2020-12-09  20  
bd1639945c3029 John Stultz 2020-12-09  21  static LIST_HEAD(free_list);
bd1639945c3029 John Stultz 2020-12-09  22  static size_t list_nr_pages;
bd1639945c3029 John Stultz 2020-12-09 @23  wait_queue_head_t freelist_waitqueue;
bd1639945c3029 John Stultz 2020-12-09 @24  struct task_struct *freelist_task;
bd1639945c3029 John Stultz 2020-12-09  25  static DEFINE_SPINLOCK(free_list_lock);
bd1639945c3029 John Stultz 2020-12-09  26  

:::::: The code at line 23 was first introduced by commit
:::::: bd1639945c30298e4bea2b611d6b0cd08d3cdd98 ANDROID: dma-buf: heaps: Add deferred-free-helper library code

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: John Stultz <john.stultz@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
