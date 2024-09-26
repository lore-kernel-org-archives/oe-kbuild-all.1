Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F75A166308
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727382107; cv=none; b=iZvTXxEYooSXWrIZd25EOD6zGZ3FIWAlR6ataNdzgno3vSOBb6RbizrzCUvqMxFJ+VU6llUKiV9Xn2j656P/YKPdnREBW4ainjwibNamx2r9NJVta4yyJhECdk9zRBmAVXOVxdoTzNfeDs0JzeivkZIedVaT4Voy0wo4c51GxUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727382107; c=relaxed/simple;
	bh=ai1R+Hu6hZVHrKI1bpsJToJJLet2JPS6chOxjRKPn/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQoV209kST+hf6FcmLFdrwJ+41IbaI7UT3UVUxFDXM73GopHf6pPmP/mP9VY/M4RpaPq+72JuRsV2iDIcwrHMTAo9s6y7DODerNnYhpMqk/EkkgQFX1/poSmREcw6hvc2vt4fkCW7HpU+xp5quhLH+OvZGEJlLGaALaME+JH/u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuFewl5N; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuFewl5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727382105; x=1758918105;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ai1R+Hu6hZVHrKI1bpsJToJJLet2JPS6chOxjRKPn/Q=;
  b=iuFewl5NourBTl/It9U8rbtXSB9tY0nXRcIs4KS/eAzDnPRtMjqTua/h
   nDTMJV83I64DdW96JGauM4sg35MBpBV4fcTZ/OL9qqjryjO8VSJ2bXNqB
   kOHArMQ6gKQ6OAnborLXGHTwmmzxBVWRV/OU7d7MZa0KE16oDzzLlMvqF
   9/PL5Envwlfwuhusf4fOMs61kyaPyhvxKRgAJRbS57GI1j2MvQyMzFr79
   ZEbAzT7rTou5KVb0EVZKYigBvdd+DQokC2LVxxw0xpuod08NhS6Zt8fsk
   bDiecJbIkuK219P4ZYhBVGP1YOZOPSpv5Wysq2eCXUzfKPrQarYE27HwE
   A==;
X-CSE-ConnectionGUID: sgjlqHWpTxSLYNFjyVKWIw==
X-CSE-MsgGUID: MQ+zw/34T4eG5sj18D+smw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26457799"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="26457799"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 13:21:44 -0700
X-CSE-ConnectionGUID: n1t9iU4mTsSPZ2ZbQ3IsEg==
X-CSE-MsgGUID: tvjYp4p3RSqFrz0ZjO71mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="72595308"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Sep 2024 13:21:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stuzb-000LAV-0x;
	Thu, 26 Sep 2024 20:21:39 +0000
Date: Fri, 27 Sep 2024 04:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9419/14172] main.c:undefined reference to
 `perf_trace_run_bpf_submit'
Message-ID: <202409270442.VcOKC2UZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2e95e7bae9486cc775ed2aa319bf323f6ba2677b
commit: c03a541494af4fb1504917412d762247b90380da [9419/14172] LoongArch: Fi=
x callchain parse error with kernel tracepoint events
config: loongarch-randconfig-002-20240925 (https://download.01.org/0day-ci/=
archive/20240927/202409270442.VcOKC2UZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240927/202409270442.VcOKC2UZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270442.VcOKC2UZ-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `m=
m/oom_kill.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
oom_kill.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
swap.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `m=
m/vmscan.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
vmscan.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `m=
m/percpu.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
percpu.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `m=
m/slab_common.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
slab_common.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `m=
m/compaction.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
compaction.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
mmap_lock.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
mmap.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `m=
m/rmap.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
rmap.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
vmalloc.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
huge_memory.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `m=
m/khugepaged.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
khugepaged.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
page_isolation.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
cma.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `mm/=
damon/core.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `f=
s/fs-writeback.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `fs/=
fs-writeback.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `fs/=
locks.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `fs/=
iomap/trace.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `f=
s/ext4/super.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `fs/=
ext4/super.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `fs/=
ext2/trace.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `fs/=
jbd2/journal.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `f=
s/xfs/xfs_trace.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `fs/=
xfs/xfs_trace.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `f=
s/xfs/scrub/trace.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `fs/=
xfs/scrub/trace.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `f=
s/btrfs/super.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `fs/=
btrfs/super.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `fs/=
gfs2/glock.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `f=
s/f2fs/super.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `fs/=
f2fs/super.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `fs/=
zonefs/super.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `blo=
ck/blk-core.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `blo=
ck/blk-iocost.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `blo=
ck/blk-wbt.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `io_=
uring/io_uring.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/gpio/gpiolib.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/clk/clk.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/dma/tegra20-apb-dma.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/soc/qcom/rpmh-rsc.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/regulator/core.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/iommu/iommu-traces.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/gpu/host1x/dev.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/gpu/drm/drm_trace_points.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/gpu/drm/scheduler/sched_main.o' being placed in section `_ftrace_event=
s'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/gpu/drm/radeon/radeon_trace_points.o' being placed in section `_ftrace=
_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/gpu/drm/amd/amdgpu/amdgpu_trace_points.o' being placed in section `_ft=
race_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/gpu/drm/v3d/v3d_trace_points.o' being placed in section `_ftrace_event=
s'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/gpu/drm/msm/disp/dpu1/dpu_kms.o' being placed in section `_ftrace_even=
ts'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/gpu/drm/msm/msm_atomic_tracepoints.o' being placed in section `_ftrace=
_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/gpu/drm/msm/msm_gpu_tracepoints.o' being placed in section `_ftrace_ev=
ents'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/gpu/drm/tegra/trace.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/gpu/drm/lima/lima_trace.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/base/regmap/regmap.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/dma-buf/dma-fence.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/dma-buf/sw_sync.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/scsi/scsi.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/scsi/sd_zbc.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/nvme/host/core.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/target/target_core_transport.o' being placed in section `_ftrace_event=
s'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/spi/spi.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/spmi/spmi.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/usb/host/xhci-trace.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/usb/musb/musb_trace.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/input/keyboard/applespi.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/i2c/i2c-core-base.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/i2c/i2c-core-smbus.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `d=
rivers/i2c/i2c-core-slave.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/i2c/i2c-core-slave.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/hwmon/hwmon.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `d=
rivers/thermal/thermal_core.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/thermal/thermal_core.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/mmc/core/core.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_eval_map' from `d=
rivers/ufs/core/ufshcd.o' being placed in section `_ftrace_eval_map'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/ufs/core/ufshcd.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/platform/chrome/cros_ec_trace.o' being placed in section `_ftrace_even=
ts'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/devfreq/devfreq.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/android/binder.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/fsi/fsi-core.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/fsi/fsi-master-aspeed.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/fsi/fsi-master-gpio.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/fsi/fsi-master-ast-cf.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `dri=
vers/interconnect/core.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `sou=
nd/core/pcm_native.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `sou=
nd/core/pcm_lib.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `lib=
/maple_tree.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: init/main.o: in function `.L199':
   main.c:(.text+0x200): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: main.c:(.text+0x250): undefined reference to `perf=
_trace_run_bpf_submit'
   loongarch64-linux-ld: init/main.o: in function `perf_trace_initcall_star=
t':
   main.c:(.text+0x36c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: init/main.o: in function `.L213':
>> main.c:(.text+0x3a0): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: init/main.o: in function `perf_trace_initcall_fini=
sh':
   main.c:(.text+0x47c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: init/main.o: in function `.L225':
   main.c:(.text+0x4b4): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: init/main.o: in function `trace_event_raw_event_in=
itcall_start':
   main.c:(.text+0x590): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: main.c:(.text+0x5a0): undefined reference to `trac=
e_event_buffer_commit'
   loongarch64-linux-ld: init/main.o: in function `.L236':
   main.c:(.text+0x5e8): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: init/main.o: in function `trace_event_raw_event_in=
itcall_finish':
   main.c:(.text+0x660): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: main.c:(.text+0x674): undefined reference to `trac=
e_event_buffer_commit'
   loongarch64-linux-ld: init/main.o: in function `.L247':
   main.c:(.text+0x6c8): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: main.c:(.text+0x6fc): undefined reference to `trac=
e_raw_output_prep'
   loongarch64-linux-ld: init/main.o: in function `trace_raw_output_initcal=
l_level':
   main.c:(.text+0x754): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: main.c:(.text+0x774): undefined reference to `trac=
e_handle_return'
   loongarch64-linux-ld: init/main.o: in function `.L263':
   main.c:(.text+0x79c): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: init/main.o: in function `trace_raw_output_initcal=
l_start':
   main.c:(.text+0x7f0): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: main.c:(.text+0x810): undefined reference to `trac=
e_handle_return'
   loongarch64-linux-ld: main.c:(.text+0x83c): undefined reference to `trac=
e_raw_output_prep'
   loongarch64-linux-ld: init/main.o: in function `trace_raw_output_initcal=
l_finish':
   main.c:(.text+0x894): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: main.c:(.text+0x8b4): undefined reference to `trac=
e_handle_return'
   loongarch64-linux-ld: init/main.o: in function `trace_event_raw_event_in=
itcall_level':
   main.c:(.text+0x938): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: main.c:(.text+0x954): undefined reference to `trac=
e_event_buffer_commit'
   loongarch64-linux-ld: init/main.o: in function `.L312':
   main.c:(.text+0x9bc): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: init/main.o: in function `.L299':
   main.c:(.text+0xa08): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: init/main.o:(.ref.data+0x18): undefined reference =
to `trace_event_reg'
   loongarch64-linux-ld: init/main.o:(.ref.data+0x40): undefined reference =
to `trace_event_raw_init'
   loongarch64-linux-ld: init/main.o:(.ref.data+0x60): undefined reference =
to `trace_event_reg'
   loongarch64-linux-ld: init/main.o:(.ref.data+0x88): undefined reference =
to `trace_event_raw_init'
   loongarch64-linux-ld: init/main.o:(.ref.data+0xa8): undefined reference =
to `trace_event_reg'
   loongarch64-linux-ld: init/main.o:(.ref.data+0xd0): undefined reference =
to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/fork.o: in function `perf_trace_task_newtas=
k':
   fork.c:(.text+0x178): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/fork.o: in function `.L34':
   fork.c:(.text+0x1dc): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/fork.o: in function `.L21':
   fork.c:(.text+0x258): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/fork.o: in function `trace_event_raw_event_=
task_newtask':
   fork.c:(.text+0x2d4): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: kernel/fork.o: in function `.L39':
   fork.c:(.text+0x30c): undefined reference to `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/fork.o: in function `.L35':
   fork.c:(.text+0x34c): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: kernel/fork.o: in function `.L36':
   fork.c:(.text+0x384): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/fork.o: in function `trace_raw_output_task_=
newtask':
   fork.c:(.text+0x3dc): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: fork.c:(.text+0x3fc): undefined reference to `trac=
e_handle_return'
   loongarch64-linux-ld: kernel/fork.o: in function `.L52':
   fork.c:(.text+0x424): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/fork.o: in function `trace_raw_output_task_=
rename':
   fork.c:(.text+0x47c): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: fork.c:(.text+0x49c): undefined reference to `trac=
e_handle_return'
   loongarch64-linux-ld: kernel/fork.o: in function `.L58':
   fork.c:(.text+0x510): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/fork.o: in function `perf_trace_task_rename=
':
   fork.c:(.text+0x580): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/fork.o: in function `.L72':
   fork.c:(.text+0x5f8): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/fork.o: in function `.L71':
   fork.c:(.text+0x678): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: kernel/fork.o: in function `trace_event_raw_event_=
task_rename':
   fork.c:(.text+0x6bc): undefined reference to `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/fork.o: in function `.L77':
   fork.c:(.text+0x708): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: kernel/fork.o:(.ref.data+0x18): undefined referenc=
e to `trace_event_reg'
   loongarch64-linux-ld: kernel/fork.o:(.ref.data+0x40): undefined referenc=
e to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/fork.o:(.ref.data+0x60): undefined referenc=
e to `trace_event_reg'
   loongarch64-linux-ld: kernel/fork.o:(.ref.data+0x88): undefined referenc=
e to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/cpu.o: in function `perf_trace_cpuhp_enter':
   cpu.c:(.text+0x2dc): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cpu.o: in function `.L35':
   cpu.c:(.text+0x31c): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/cpu.o: in function `perf_trace_cpuhp_multi_=
enter':
   cpu.c:(.text+0x40c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cpu.o: in function `.L47':
   cpu.c:(.text+0x44c): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/cpu.o: in function `perf_trace_cpuhp_exit':
   cpu.c:(.text+0x54c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cpu.o: in function `.L59':
   cpu.c:(.text+0x58c): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/cpu.o: in function `trace_event_raw_event_c=
puhp_enter':
   cpu.c:(.text+0x688): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: cpu.c:(.text+0x6a4): undefined reference to `trace=
_event_buffer_commit'
   loongarch64-linux-ld: kernel/cpu.o: in function `.L70':
   cpu.c:(.text+0x708): undefined reference to `__trace_trigger_soft_disabl=
ed'
   loongarch64-linux-ld: kernel/cpu.o: in function `trace_event_raw_event_c=
puhp_multi_enter':
   cpu.c:(.text+0x790): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: cpu.c:(.text+0x7ac): undefined reference to `trace=
_event_buffer_commit'
   loongarch64-linux-ld: kernel/cpu.o: in function `.L81':
   cpu.c:(.text+0x808): undefined reference to `__trace_trigger_soft_disabl=
ed'
--
   loongarch64-linux-ld: kernel/time/alarmtimer.o:(.ref.data+0x40): undefin=
ed reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/time/alarmtimer.o:(.ref.data+0x60): undefin=
ed reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/time/alarmtimer.o:(.ref.data+0x88): undefin=
ed reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/smp.o: in function `perf_trace_csd_queue_cp=
u':
   smp.c:(.text+0x224): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/smp.o: in function `.L30':
   smp.c:(.text+0x264): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/smp.o: in function `perf_trace_csd_function=
':
   smp.c:(.text+0x33c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/smp.o: in function `.L42':
   smp.c:(.text+0x374): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/smp.o: in function `trace_event_raw_event_c=
sd_queue_cpu':
   smp.c:(.text+0x468): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: smp.c:(.text+0x484): undefined reference to `trace=
_event_buffer_commit'
   loongarch64-linux-ld: kernel/smp.o: in function `.L53':
   smp.c:(.text+0x4e8): undefined reference to `__trace_trigger_soft_disabl=
ed'
   loongarch64-linux-ld: kernel/smp.o: in function `trace_event_raw_event_c=
sd_function':
   smp.c:(.text+0x560): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: smp.c:(.text+0x574): undefined reference to `trace=
_event_buffer_commit'
   loongarch64-linux-ld: kernel/smp.o: in function `.L64':
   smp.c:(.text+0x5c8): undefined reference to `__trace_trigger_soft_disabl=
ed'
   loongarch64-linux-ld: kernel/smp.o: in function `.L65':
   smp.c:(.text+0x5fc): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/smp.o: in function `trace_raw_output_csd_qu=
eue_cpu':
   smp.c:(.text+0x65c): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: smp.c:(.text+0x67c): undefined reference to `trace=
_handle_return'
   loongarch64-linux-ld: kernel/smp.o: in function `.L80':
   smp.c:(.text+0x6a4): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/smp.o: in function `trace_raw_output_csd_fu=
nction':
   smp.c:(.text+0x6f4): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: smp.c:(.text+0x714): undefined reference to `trace=
_handle_return'
   loongarch64-linux-ld: kernel/smp.o:(.ref.data+0x18): undefined reference=
 to `trace_event_reg'
   loongarch64-linux-ld: kernel/smp.o:(.ref.data+0x40): undefined reference=
 to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/smp.o:(.ref.data+0x60): undefined reference=
 to `trace_event_reg'
   loongarch64-linux-ld: kernel/smp.o:(.ref.data+0x88): undefined reference=
 to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L255':
   kexec_core.c:(.text+0x1b10): undefined reference to `machine_kexec_clean=
up'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L296':
   kexec_core.c:(.text+0x1d70): undefined reference to `machine_crash_shutd=
own'
   loongarch64-linux-ld: kexec_core.c:(.text+0x1d78): undefined reference t=
o `machine_kexec'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L383':
   kexec_core.c:(.text+0x2350): undefined reference to `machine_shutdown'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L380':
   kexec_core.c:(.text+0x2360): undefined reference to `machine_kexec'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L128':
   cgroup.c:(.text+0x868): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L129':
   cgroup.c:(.text+0x8d4): undefined reference to `perf_trace_run_bpf_submi=
t'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `perf_trace_cg=
roup_event':
   cgroup.c:(.text+0xa40): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L147':
   cgroup.c:(.text+0xab4): undefined reference to `perf_trace_run_bpf_submi=
t'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L169':
   cgroup.c:(.text+0xd70): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L2=021':
   cgroup.c:(.text+0xdb4): undefined reference to `trace_event_buffer_commi=
t'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L193':
   cgroup.c:(.text+0xe68): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L192':
   cgroup.c:(.text+0xe9c): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L189':
   cgroup.c:(.text+0xefc): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L200':
   cgroup.c:(.text+0xf1c): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: cgroup.c:(.text+0xf44): undefined reference to `tr=
ace_raw_output_prep'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L201':
   cgroup.c:(.text+0xfa0): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `trace_raw_out=
put_cgroup_root':
   cgroup.c:(.text+0xfc0): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: cgroup.c:(.text+0xfec): undefined reference to `tr=
ace_raw_output_prep'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L207':
   cgroup.c:(.text+0x106c): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `trace_raw_out=
put_cgroup':
   cgroup.c:(.text+0x108c): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: cgroup.c:(.text+0x10b4): undefined reference to `t=
race_raw_output_prep'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L213':
   cgroup.c:(.text+0x1124): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `trace_raw_out=
put_cgroup_migrate':
   cgroup.c:(.text+0x1144): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L730':
   cgroup.c:(.text+0x3e5c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L1=025':
   cgroup.c:(.text+0x3ef4): undefined reference to `perf_trace_run_bpf_subm=
it'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L756':
   cgroup.c:(.text+0x4050): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `css_create':
   cgroup.c:(.text+0x40c0): undefined reference to `perf_trace_run_bpf_subm=
it'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L769':
   cgroup.c:(.text+0x4234): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: cgroup.c:(.text+0x4278): undefined reference to `t=
race_event_buffer_commit'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L772':
   cgroup.c:(.text+0x42d4): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L775':
   cgroup.c:(.text+0x4328): undefined reference to `__trace_trigger_soft_di=
sabled'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `perf_trace_cg=
roup_migrate':
   cgroup.c:(.text+0x43c4): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L782':
   cgroup.c:(.text+0x43f4): undefined reference to `trace_event_buffer_comm=
it'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L784':
   cgroup.c:(.text+0x444c): undefined reference to `trace_event_buffer_rese=
rve'
>> loongarch64-linux-ld: cgroup.c:(.text+0x44a8): undefined reference to `_=
_trace_trigger_soft_disabled'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L788':
   cgroup.c:(.text+0x4580): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `perf_trace_cg=
roup':
   cgroup.c:(.text+0x45e8): undefined reference to `trace_event_buffer_comm=
it'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L802':
   cgroup.c:(.text+0x46c8): undefined reference to `__trace_trigger_soft_di=
sabled'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0x18): undefined=
 reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0x40): undefined=
 reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0x60): undefined=
 reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0x88): undefined=
 reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0xa8): undefined=
 reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0xd0): undefined=
 reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0xf0): undefined=
 reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0x118): undefine=
d reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/error_report-traces.o: in function `.=
L12':
   error_report-traces.c:(.text+0xec): undefined reference to `perf_trace_b=
uf_alloc'
   loongarch64-linux-ld: error_report-traces.c:(.text+0x124): undefined ref=
erence to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/trace/error_report-traces.o: in function `t=
race_event_raw_event_error_report_template':
   error_report-traces.c:(.text+0x1f8): undefined reference to `trace_event=
_buffer_reserve'
   loongarch64-linux-ld: kernel/trace/error_report-traces.o: in function `.=
L27':
   error_report-traces.c:(.text+0x20c): undefined reference to `trace_event=
_buffer_commit'
   loongarch64-linux-ld: kernel/trace/error_report-traces.o: in function `.=
L23':
   error_report-traces.c:(.text+0x248): undefined reference to `__trace_tri=
gger_soft_disabled'
   loongarch64-linux-ld: kernel/trace/error_report-traces.o: in function `.=
L24':
   error_report-traces.c:(.text+0x27c): undefined reference to `trace_raw_o=
utput_prep'
   loongarch64-linux-ld: kernel/trace/error_report-traces.o: in function `t=
race_raw_output_error_report_template':
   error_report-traces.c:(.text+0x2d0): undefined reference to `trace_print=
_symbols_seq'
   loongarch64-linux-ld: error_report-traces.c:(.text+0x2e8): undefined ref=
erence to `trace_event_printf'
   loongarch64-linux-ld: kernel/trace/error_report-traces.o: in function `.=
L39':
   error_report-traces.c:(.text+0x308): undefined reference to `trace_handl=
e_return'
   loongarch64-linux-ld: kernel/trace/error_report-traces.o:(.ref.data+0x18=
): undefined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/error_report-traces.o:(.ref.data+0x40=
): undefined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `perf_tra=
ce_cpu':
   power-traces.c:(.text+0xdb4): undefined reference to `perf_trace_buf_all=
oc'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L209':
   power-traces.c:(.text+0xdec): undefined reference to `perf_trace_run_bpf=
_submit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `perf_tra=
ce_cpu_idle_miss':
   power-traces.c:(.text+0xec4): undefined reference to `perf_trace_buf_all=
oc'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L221':
   power-traces.c:(.text+0xf00): undefined reference to `perf_trace_run_bpf=
_submit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `perf_tra=
ce_pstate_sample':
   power-traces.c:(.text+0x1010): undefined reference to `perf_trace_buf_al=
loc'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L233':
   power-traces.c:(.text+0x106c): undefined reference to `perf_trace_run_bp=
f_submit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `perf_tra=
ce_cpu_frequency_limits':
   power-traces.c:(.text+0x1154): undefined reference to `perf_trace_buf_al=
loc'
   loongarch64-linux-ld: power-traces.c:(.text+0x119c): undefined reference=
 to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `perf_tra=
ce_suspend_resume':
   power-traces.c:(.text+0x1284): undefined reference to `perf_trace_buf_al=
loc'
   loongarch64-linux-ld: power-traces.c:(.text+0x12c0): undefined reference=
 to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L267':
   power-traces.c:(.text+0x1394): undefined reference to `perf_trace_buf_al=
loc'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `perf_tra=
ce_cpu_latency_qos_request':
   power-traces.c:(.text+0x13c8): undefined reference to `perf_trace_run_bp=
f_submit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L268':
   power-traces.c:(.text+0x14a4): undefined reference to `perf_trace_buf_al=
loc'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `perf_tra=
ce_pm_qos_update':
   power-traces.c:(.text+0x14e0): undefined reference to `perf_trace_run_bp=
f_submit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L280':
   power-traces.c:(.text+0x15c4): undefined reference to `perf_trace_buf_al=
loc'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `perf_tra=
ce_guest_halt_poll_ns':
   power-traces.c:(.text+0x1600): undefined reference to `perf_trace_run_bp=
f_submit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L292':
   power-traces.c:(.text+0x16d8): undefined reference to `trace_event_buffe=
r_reserve'
   loongarch64-linux-ld: power-traces.c:(.text+0x16ec): undefined reference=
 to `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `trace_ev=
ent_raw_event_cpu':
   power-traces.c:(.text+0x1728): undefined reference to `__trace_trigger_s=
oft_disabled'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L304':
   power-traces.c:(.text+0x17a8): undefined reference to `trace_event_buffe=
r_reserve'
   loongarch64-linux-ld: power-traces.c:(.text+0x17c0): undefined reference=
 to `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `trace_ev=
ent_raw_event_cpu_idle_miss':
   power-traces.c:(.text+0x1808): undefined reference to `__trace_trigger_s=
oft_disabled'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L315':
   power-traces.c:(.text+0x18b0): undefined reference to `trace_event_buffe=
r_reserve'
   loongarch64-linux-ld: power-traces.c:(.text+0x18e0): undefined reference=
 to `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `trace_ev=
ent_raw_event_pstate_sample':
   power-traces.c:(.text+0x194c): undefined reference to `__trace_trigger_s=
oft_disabled'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L330':
   power-traces.c:(.text+0x19b8): undefined reference to `trace_event_buffe=
r_reserve'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L326':
   power-traces.c:(.text+0x19e0): undefined reference to `trace_event_buffe=
r_commit'
   loongarch64-linux-ld: power-traces.c:(.text+0x1a2c): undefined reference=
 to `__trace_trigger_soft_disabled'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L341':
   power-traces.c:(.text+0x1ab0): undefined reference to `trace_event_buffe=
r_reserve'
   loongarch64-linux-ld: power-traces.c:(.text+0x1ac8): undefined reference=
 to `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L338':
   power-traces.c:(.text+0x1b28): undefined reference to `__trace_trigger_s=
oft_disabled'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `trace_ev=
ent_raw_event_suspend_resume':
   power-traces.c:(.text+0x1b98): undefined reference to `trace_event_buffe=
r_reserve'
   loongarch64-linux-ld: power-traces.c:(.text+0x1ba8): undefined reference=
 to `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L348':
   power-traces.c:(.text+0x1be8): undefined reference to `__trace_trigger_s=
oft_disabled'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `trace_ev=
ent_raw_event_cpu_latency_qos_request':
   power-traces.c:(.text+0x1c68): undefined reference to `trace_event_buffe=
r_reserve'
   loongarch64-linux-ld: power-traces.c:(.text+0x1c80): undefined reference=
 to `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L359':
   power-traces.c:(.text+0x1cc8): undefined reference to `__trace_trigger_s=
oft_disabled'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `trace_ev=
ent_raw_event_pm_qos_update':
   power-traces.c:(.text+0x1d48): undefined reference to `trace_event_buffe=
r_reserve'
   loongarch64-linux-ld: power-traces.c:(.text+0x1d60): undefined reference=
 to `trace_event_buffer_commit'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=3Dy] && ASYMMETRIC_KEY_TYPE [=3Dn]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=3Dy] && CRYPTO [=3Dy]

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
