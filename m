Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC6D26FD93
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663352; cv=none; b=bgXFxJQNwvtdxirG1GlUNlfbiS3TDX9s514/BlbeDtJb9bOcdCepLEFH4j5XYpYPPWZ4STxo0iqBWdnshIRmc7myN7Yhzm+3Tb9TVWjjSpCXLR43PAZU1jBIXlb5Z8/cAsW2RLI5sWUVGVAi5ENQ3cBpPLViOso80dTd1/WuOuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663352; c=relaxed/simple;
	bh=As/ZjWr0xnFwN1+E6K7la40quQP46oBDgcfNSHxE/Y0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u+uIWCvdh1S5yh7m03FdHPSe2A6lLH3ou00bX3zQZyPCeHZTNN/wfWll7IVGiKVpwWtLhdPHm1M6whT1gDkVhJEdjoB1PvfhUUWeeE1I9CdnGqSSjTYlVuPnkwCysWVqgv4jPg7/gUMW/OrkuFKkC7hVqaf7/Ela87J+QXj+UyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fK8smFvJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fK8smFvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778663350; x=1810199350;
  h=date:from:to:cc:subject:message-id;
  bh=As/ZjWr0xnFwN1+E6K7la40quQP46oBDgcfNSHxE/Y0=;
  b=fK8smFvJFG4kIIltgdnn7VPtcUddA+2UvHQ8/bweTYP8FOI7lzIBMYT7
   NqN5Bzxp+ZE7dMB8pZs1rYh+W7KKhC1THPWWmGGWYFKHudqkMbasITTBG
   BncqBvEhFzS6j0MIMd5DSw80mjxtvJPaieVDMbZLfAQuncyAdejuZ52Nd
   Vx3y3o575ELduyEJtep90blcryyfNzOEUvcGkqcNQDOCnmGSjUBHZc65A
   rYzkPS1uwxvILm88ERzgBkQVU3v6hB7wXCLGRCFBd5CDt4E6Q3+pWJvPF
   DT5qgUqsxAmsslncy/Uq2z+vjJ82t/AXrOCvY3AA4sEvoUz4haOvs3dLY
   w==;
X-CSE-ConnectionGUID: InFDtUXuR8yiwOrB23xzKQ==
X-CSE-MsgGUID: nA170Y8iR/+7UeJWsWoAxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97153231"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="97153231"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 02:09:09 -0700
X-CSE-ConnectionGUID: rp3SiujpQ8ijIOdci1yRWQ==
X-CSE-MsgGUID: dAgk56TSRxqTWj72OwJjTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="234965559"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 May 2026 02:09:08 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN5aT-000000003oL-2T6L;
	Wed, 13 May 2026 09:09:05 +0000
Date: Wed, 13 May 2026 17:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 drivers/virtio/virtio_wl.c:938:13: error: implicit declaration of function
 'sync_file_get_fence'
Message-ID: <202605131735.ZYsZM2ie-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   80e99694479e5e9fe7c6230aad1327bbb9c655be
commit: 6686780d2960d81b608e66938266602d276ea4d1 [1/1] CHROMIUM: virtio-wl: add support for host fences
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260513/202605131735.ZYsZM2ie-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131735.ZYsZM2ie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131735.ZYsZM2ie-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/virtio/virtio_wl.c:938:13: error: implicit declaration of function 'sync_file_get_fence' [-Werror,-Wimplicit-function-declaration]
     938 |                                 fence = sync_file_get_fence(vfd_fds[i]);
         |                                         ^
>> drivers/virtio/virtio_wl.c:938:11: error: incompatible integer to pointer conversion assigning to 'struct dma_fence *' from 'int' [-Wint-conversion]
     938 |                                 fence = sync_file_get_fence(vfd_fds[i]);
         |                                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/virtio/virtio_wl.c:939:18: error: implicit declaration of function 'is_local_fence' [-Werror,-Wimplicit-function-declaration]
     939 |                                 if (fence && is_local_fence(fence)) {
         |                                              ^
>> drivers/virtio/virtio_wl.c:1417:11: error: implicit declaration of function 'sync_file_create' [-Werror,-Wimplicit-function-declaration]
    1417 |                         sync = sync_file_create(&fence->base);
         |                                ^
   drivers/virtio/virtio_wl.c:1417:11: note: did you mean 'sync_file_range'?
   include/linux/fs.h:2783:12: note: 'sync_file_range' declared here
    2783 | extern int sync_file_range(struct file *file, loff_t offset, loff_t nbytes,
         |            ^
>> drivers/virtio/virtio_wl.c:1417:9: error: incompatible integer to pointer conversion assigning to 'struct sync_file *' from 'int' [-Wint-conversion]
    1417 |                         sync = sync_file_create(&fence->base);
         |                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/virtio/virtio_wl.c:1435:14: error: incomplete definition of type 'struct sync_file'
    1435 |                                 fput(sync->file);
         |                                      ~~~~^
   drivers/virtio/virtio_wl.c:1402:11: note: forward declaration of 'struct sync_file'
    1402 |                         struct sync_file *sync;
         |                                ^
   drivers/virtio/virtio_wl.c:1438:24: error: incomplete definition of type 'struct sync_file'
    1438 |                         fd_install(ret, sync->file);
         |                                         ~~~~^
   drivers/virtio/virtio_wl.c:1402:11: note: forward declaration of 'struct sync_file'
    1402 |                         struct sync_file *sync;
         |                                ^
   1 warning and 7 errors generated.


vim +/sync_file_get_fence +938 drivers/virtio/virtio_wl.c

   886	
   887	static int virtwl_vfd_send(struct file *filp, const char __user *buffer,
   888						       u32 len, int *vfd_fds)
   889	{
   890		struct virtwl_vfd *vfd = filp->private_data;
   891		struct virtwl_info *vi = vfd->vi;
   892		struct fd vfd_files[VIRTWL_SEND_MAX_ALLOCS] = { { 0 } };
   893		struct virtwl_vfd *vfds[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
   894	#ifdef SEND_VIRTGPU_RESOURCES
   895		struct dma_buf *virtgpu_dma_bufs[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
   896		struct dma_fence *virtgpu_dma_fence[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
   897		bool foreign_id = false;
   898	#endif
   899		size_t vfd_count = 0;
   900		size_t vfd_ids_size;
   901		size_t ctrl_send_size;
   902		struct virtio_wl_ctrl_vfd_send *ctrl_send;
   903		u8 *vfd_ids;
   904		u8 *out_buffer;
   905		struct completion finish_completion;
   906		struct scatterlist out_sg;
   907		struct scatterlist in_sg;
   908		struct sg_table sgt;
   909		struct vm_struct *area;
   910		bool vmalloced;
   911		int ret;
   912		int i;
   913	
   914		if (vfd_fds) {
   915			for (i = 0; i < VIRTWL_SEND_MAX_ALLOCS; i++) {
   916				struct fd vfd_file;
   917				int fd = vfd_fds[i];
   918				struct dma_fence *fence;
   919				struct dma_buf *dma_buf = ERR_PTR(-EINVAL);
   920				bool handled = false;
   921	
   922				if (fd < 0)
   923					break;
   924	
   925				vfd_file = fdget(vfd_fds[i]);
   926				if (!vfd_file.file) {
   927					ret = -EBADFD;
   928					goto put_files;
   929				}
   930	
   931				if (vfd_file.file->f_op == &virtwl_vfd_fops) {
   932					vfd_files[i] = vfd_file;
   933					vfds[i] = vfd_file.file->private_data;
   934					handled = true;
   935				}
   936	
   937				if (!handled) {
 > 938					fence = sync_file_get_fence(vfd_fds[i]);
 > 939					if (fence && is_local_fence(fence)) {
   940						vfd_files[i] = vfd_file;
   941						vfds[i] = to_virtwl_fence(fence)->vfd;
   942						handled = true;
   943					}
   944				}
   945	
   946				if (handled) {
   947					if (vfds[i] && vfds[i]->id) {
   948						vfd_count++;
   949						continue;
   950					}
   951	
   952					ret = -EINVAL;
   953					goto put_files;
   954				}
   955	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
