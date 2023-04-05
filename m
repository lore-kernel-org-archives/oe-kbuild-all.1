Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BF3C950
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 22:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680733364; x=1712269364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KATMCuNWdV1uCyonZgLYLdMUu/aOZNtCzIZbNiN4XNg=;
  b=VKVc9juwCvaiiTzgoClRUEuaqfW/KBn4ByQ1uBM+t7LucJVVtloAkOBC
   o90qh4Qw3CV0a8P1bResB8BcXovns+O9oEsm/Fco2oGsu5lZXZSlKycVM
   Zh6+lcYgfsmAiUG1BXCoCguTdlnVyUyqaQQ/F4Y2gvKlGf9Q8ugJjwdJ1
   J+T8OcGpVYh9RRm7+oZnP0/G90ykg4BzsQC+55o9GbpvAXbGZBd6umtaz
   0XAoLhmn/70i/atexAgZSTL2FLHub+RdtHLEOi4/BnwuqPwKUGfcfvzNX
   XFgrRIACcwGa/8+WNNXaRJPHzcmw0L1hhRlBmBbrZM6NlxxEg8SfKA9UC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="331191944"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="331191944"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 15:22:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="689433960"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="689433960"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Apr 2023 15:22:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkBWN-000QrS-2g;
	Wed, 05 Apr 2023 22:22:27 +0000
Date: Thu, 6 Apr 2023 06:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 103/107] or1k-linux-ld:
 virtio_wl.c:undefined reference to `virtio_check_driver_offered_feature'
Message-ID: <202304060658.ZJ8ibzAt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   7c090ac1e87dd557a76bb026073ba1d62bc977da
commit: fdbfc0b7fd52458bf8cd94a8558961513e03e0f6 [103/107] CHROMIUM: virtwl: add support for shmem region
config: openrisc-randconfig-r034-20230405 (https://download.01.org/0day-ci/archive/20230406/202304060658.ZJ8ibzAt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout fdbfc0b7fd52458bf8cd94a8558961513e03e0f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304060658.ZJ8ibzAt-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/virtio/virtio_wl.o: in function `vq_out_work_handler':
   virtio_wl.c:(.text+0x3a8): undefined reference to `virtqueue_get_buf'
   virtio_wl.c:(.text+0x3a8): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `virtqueue_get_buf'
   or1k-linux-ld: drivers/virtio/virtio_wl.o: in function `vq_return_inbuf_locked':
   virtio_wl.c:(.text+0x448): undefined reference to `virtqueue_add_inbuf'
   virtio_wl.c:(.text+0x448): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `virtqueue_add_inbuf'
   or1k-linux-ld: drivers/virtio/virtio_wl.o: in function `vq_queue_out':
   virtio_wl.c:(.text+0x5f0): undefined reference to `virtqueue_add_sgs'
   virtio_wl.c:(.text+0x5f0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `virtqueue_add_sgs'
   or1k-linux-ld: virtio_wl.c:(.text+0x614): undefined reference to `virtqueue_kick'
   virtio_wl.c:(.text+0x614): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `virtqueue_kick'
   or1k-linux-ld: drivers/virtio/virtio_wl.o: in function `vq_in_work_handler':
   virtio_wl.c:(.text+0x116c): undefined reference to `virtqueue_get_buf'
   virtio_wl.c:(.text+0x116c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `virtqueue_get_buf'
   or1k-linux-ld: virtio_wl.c:(.text+0x11a0): undefined reference to `virtqueue_kick'
   virtio_wl.c:(.text+0x11a0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `virtqueue_kick'
   or1k-linux-ld: drivers/virtio/virtio_wl.o: in function `vfd_qentry_free_if_empty.isra.0':
   virtio_wl.c:(.text+0x12f0): undefined reference to `virtqueue_kick'
   virtio_wl.c:(.text+0x12f0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `virtqueue_kick'
   or1k-linux-ld: drivers/virtio/virtio_wl.o: in function `do_vfd_close':
   virtio_wl.c:(.text+0x1a08): undefined reference to `virtqueue_kick'
   virtio_wl.c:(.text+0x1a08): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `virtqueue_kick'
   or1k-linux-ld: drivers/virtio/virtio_wl.o: in function `probe_common':
   virtio_wl.c:(.text+0x293c): undefined reference to `virtio_check_driver_offered_feature'
   virtio_wl.c:(.text+0x293c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `virtio_check_driver_offered_feature'
>> or1k-linux-ld: virtio_wl.c:(.text+0x295c): undefined reference to `virtio_check_driver_offered_feature'
   virtio_wl.c:(.text+0x295c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `virtio_check_driver_offered_feature'
   or1k-linux-ld: virtio_wl.c:(.text+0x2a60): undefined reference to `virtqueue_detach_unused_buf'
   virtio_wl.c:(.text+0x2a60): additional relocation overflows omitted from the output
   or1k-linux-ld: virtio_wl.c:(.text+0x2ac0): undefined reference to `virtqueue_kick'
   or1k-linux-ld: drivers/virtio/virtio_wl.o: in function `virtio_wl_driver_init':
   virtio_wl.c:(.init.text+0x14): undefined reference to `register_virtio_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
