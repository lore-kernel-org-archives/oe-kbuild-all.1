Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B171CA684
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 19:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726688984; cv=none; b=AqeTU6KrMPP6hJYo6kKsUsCV1QsidA6CpMEb8w0IxqRVoVl2AtQJtjgmt13M7QqjX2PYw+n1d9QV+ylzzvNtfnNdpMYhcQaMOaFR0gBt9RycUWE+Peylqm5XSh9xkg2QYb9CwznUdC3ZXzbY2Lhdp4Kz9Ylz5x3d/gaCF3pHsmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726688984; c=relaxed/simple;
	bh=RVtfQgNNfEp3x0DZ0Gb/UocKckw3YdpwzAGJI09AOlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N9lpxW4dPBmH04++hMhubUUZ6zhtryzWjB85oMQzYZYBkYBztu+/a907gGrf9Qbq7zRAYuqf3TZNNqfXfFNcylaGD+Q8Fmv26paggQ4Ol7eFeZd50BZ2r1yTz9p7orAWdT6k/GiMPfupG+oS74VmGtwRrV9LU64CjYnnXhzz06g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CzBVjewC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CzBVjewC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726688982; x=1758224982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RVtfQgNNfEp3x0DZ0Gb/UocKckw3YdpwzAGJI09AOlI=;
  b=CzBVjewCyMRGSEQUbtOFglRWc0JDMZzTrBvc6nFkUS8sTYFaI7aPoFdD
   jjmM4XnB+Rgk6dA3IEN3bsojkXZ62FAwXZTbi3gxSKHjqBAhbxx/DCk9P
   JnfwQg2FSbQX3YBrJROXdumzsHGJyxmTtRVJGge5gb35w0Ej/TFPB+ejX
   IgCYEVwnAbCCf9Q2YfvZalo9UHFDJEgkwCV+Tw2c77liqGH+dFjSzHR+E
   qxfwZ6B6oMILJAZvAOHql1zkMUnunQKSRmFXbTlGvOvLU7ST9/Lj8Vmid
   YLpqMxihjMdOIXjlAodnGMSbSFth41uNAYHSn+2bMxnLo1lHa9UgimeOb
   g==;
X-CSE-ConnectionGUID: SSIqrvYeT5+UbgKOY547YA==
X-CSE-MsgGUID: eupLgpi+Rwa6ZL5VxDAybg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="13579227"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="13579227"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 12:49:42 -0700
X-CSE-ConnectionGUID: nmvXlu7FTtCT7P5s++3N8Q==
X-CSE-MsgGUID: AyWB9bk3TWm6PbSjR8dQpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="70141829"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Sep 2024 12:49:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr0gE-000CaI-1O;
	Wed, 18 Sep 2024 19:49:38 +0000
Date: Thu, 19 Sep 2024 03:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 2931/14977] versioncheck:
 ./drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c: 6071: need linux/version.h
Message-ID: <202409190302.64coTIF4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   3516b574d9cb19c39dc921a07a37c8a2fcaf0009
commit: d413585a2b8de7c7a700ffa8065bc7902bf3c673 [2931/14977] MGS-6425 [#imx-2711] use default list_head in linux
reproduce: (https://download.01.org/0day-ci/archive/20240919/202409190302.64coTIF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190302.64coTIF4-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: 16473: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c: 6071: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_video_memory.c: 4866: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h: 216: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c: 638: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dmabuf.c: 544: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_gfp.c: 1408: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_reserved_mem.c: 592: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_user_memory.c: 941: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/freescale/gc_hal_kernel_allocator_cma.c: 641: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_allocator.c: 259: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debug.h: 180: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debugfs.h: 117: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: 3088: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c: 1522: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_iommu.c: 236: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c: 7642: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.c: 378: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.h: 151: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/default/gc_hal_kernel_platform_default.c: 449: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c: 1894: need linux/version.h
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 402: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
