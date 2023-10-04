Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6588FA35
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 03:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696389748; x=1727925748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p39IM9oHrXbax5zEiapVvwAt62yeqfzc9cAuFUzl4rc=;
  b=Wg/GGecJw1JiDU3zLFm8B7xBnUR+8XxGFZXrSKjhuAnU80lnr12kI6Yb
   i+yIXx/CAivwVBm7wncQn9XxM8/z88su/WFmf4ZOYT5i27IQ1NJm6cP8a
   rucpqWvemA+OAkeA17VNiZwoAWHJoxOIdUb78T3FSyz1EjKgT6J2GKowz
   zbLsjLSQPI+4yaU/8jJxze0F6VM6NXXjeSahvwxv9w+W7utw9u2knguXB
   Gqg3w7OvSzgY8atI6l+0hGFH6WHJSt2uLOokwOyfE5fn+eA1plKz5Aa1o
   aU6fqgrghUkjMj8hBpito8S6vD5+6BJ4bJIDss95TyKTNHY+Y3DJuqOMV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="368095661"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="368095661"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 20:22:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1082292867"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="1082292867"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 03 Oct 2023 20:22:24 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnsSs-000AW2-2X;
	Wed, 04 Oct 2023 03:22:22 +0000
Date: Wed, 4 Oct 2023 11:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2023-04 1705/20109] ld:
 drivers/media/v4l2-core/v4l2-mem2mem.c:789: undefined reference to
 `vb2_dqbuf'
Message-ID: <202310041157.a0aQFhSO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maheshwar,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2023-04
head:   4eb6ee1f90d5af0cba8cc2f09a7381641b97e401
commit: 1d74cced13c8a1bc8c2808697d4ffe73bdab9b19 [1705/20109] ANDROID: Kconfig.gki: Enable media controller configs
config: x86_64-randconfig-104-20231004 (https://download.01.org/0day-ci/archive/20231004/202310041157.a0aQFhSO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310041157.a0aQFhSO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310041157.a0aQFhSO-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/power/hibernate_asm_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: orphan section `.data..decrypted' from `arch/x86/kernel/cpu/vmware.o' being placed in section `.data..decrypted'
   ld: warning: orphan section `.data..decrypted' from `arch/x86/kernel/kvm.o' being placed in section `.data..decrypted'
   ld: warning: arch/x86/power/hibernate_asm_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_poll':
   drivers/media/v4l2-core/v4l2-mem2mem.c:924: undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:935: undefined reference to `v4l2_event_pending'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ctx_release':
   drivers/media/v4l2-core/v4l2-mem2mem.c:1207: undefined reference to `vb2_queue_release'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:1208: undefined reference to `vb2_queue_release'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:796: undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_reqbufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:578: undefined reference to `vb2_reqbufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:796: undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_reqbufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:578: undefined reference to `vb2_reqbufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_querybuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:596: undefined reference to `vb2_querybuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamoff':
   drivers/media/v4l2-core/v4l2-mem2mem.c:851: undefined reference to `vb2_streamoff'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:851: undefined reference to `vb2_streamoff'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamon':
   drivers/media/v4l2-core/v4l2-mem2mem.c:831: undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:831: undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:831: undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:831: undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_qbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:750: undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:762: undefined reference to `vb2_qbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:810: undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:810: undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_expbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:820: undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:820: undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:820: undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:820: undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:810: undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:810: undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_dqbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:789: undefined reference to `vb2_dqbuf'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:789: undefined reference to `vb2_dqbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:800: undefined reference to `vb2_prepare_buf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:800: undefined reference to `vb2_prepare_buf'
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   drivers/media/common/videobuf2/videobuf2-core.c:2044: undefined reference to `v4l_vb2q_enable_media_source'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
