Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DF32877C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 15:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511875; cv=none; b=r4Wv+FBjvwdzM7K2PD37pJyQbfJGqIaLBKS+nmiEpHIMzKhfwaMjYbFKwi3BLK1jgRHy+iiven6TMLcg4O/U43Ko3T4RkVu7/YWCofjWwgqxmxwIxGtwOcNKzFoR9BVP/vJhGsbrzk0LODB8I8iTvPjxa7C6PKonDrCZMETrjPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511875; c=relaxed/simple;
	bh=L2opb2q3euuro/iYdxyo1hnaLG0Bqu1FzKW4u+8tUuY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B1yyX/h+AvjeCm+D3kG8znP9SDvyDUypPKcmjSoWIPFbGztCmc5R+WDgdfm9cc1qQaSPGbo9SxhGgrvFRG1gScJpj+T1igurySYnMIgUACCFCDHl0yQ69uBVQ9868HI4SEtTNwmh16ieoi1qhtGferUg+7irD3/K19TWHRtuC1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpqL/yxX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpqL/yxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778511874; x=1810047874;
  h=date:from:to:cc:subject:message-id;
  bh=L2opb2q3euuro/iYdxyo1hnaLG0Bqu1FzKW4u+8tUuY=;
  b=YpqL/yxXJ6aAgiZrC2d+/q/ZYUVyuZ6wLUyL2zsQ8whnsOSHEvjpM4VW
   Vn2xT/NW3JFA4ESrVBS75xjD5BK8vSUDyzDWrJNum6974GimSWbj2G0u3
   mCw7CJCWF/luqvBsQWiOusg9Lgn/I21+nJs1TmUJSStPIhvYAx0n7GMSR
   P8uwRkwzL13wEtL3kbrMoToFmKshzf/UVaRCVluMhs7FSEO4mlAK0LUqz
   qXMkspi/toBYwLHnmSJv1JoGtOo/fDwrMASDjsnQweY6d+hzrcqcjUkQ0
   602sQLKqsNdZhDOWl540QuY2rSqpHHEcwLZVRMfCZtBaPgLQpge9NmCdU
   w==;
X-CSE-ConnectionGUID: Cue8ji/9S0WJz69SP7LxzA==
X-CSE-MsgGUID: eawODHooS3mEA7LXtCrPMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90867779"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="90867779"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 08:04:33 -0700
X-CSE-ConnectionGUID: jgcC88rHR7y7DkLWQFzVPQ==
X-CSE-MsgGUID: LvASV92gT1WaiCdGt0yXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="237572144"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 May 2026 08:04:31 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMSBJ-000000000k7-0TQV;
	Mon, 11 May 2026 15:04:29 +0000
Date: Mon, 11 May 2026 23:03:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 drivers/virtio/virtio_wl.c:938:39: warning: assignment to 'struct dma_fence
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202605112221.a4dpMvx8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   80e99694479e5e9fe7c6230aad1327bbb9c655be
commit: 6686780d2960d81b608e66938266602d276ea4d1 [1/1] CHROMIUM: virtio-wl: add support for host fences
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260511/202605112221.a4dpMvx8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605112221.a4dpMvx8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605112221.a4dpMvx8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virtio/virtio_wl.c: In function 'virtwl_vfd_send':
   drivers/virtio/virtio_wl.c:938:41: error: implicit declaration of function 'sync_file_get_fence'; did you mean 'sync_file_range'? [-Werror=implicit-function-declaration]
     938 |                                 fence = sync_file_get_fence(vfd_fds[i]);
         |                                         ^~~~~~~~~~~~~~~~~~~
         |                                         sync_file_range
>> drivers/virtio/virtio_wl.c:938:39: warning: assignment to 'struct dma_fence *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     938 |                                 fence = sync_file_get_fence(vfd_fds[i]);
         |                                       ^
   drivers/virtio/virtio_wl.c:939:46: error: implicit declaration of function 'is_local_fence' [-Werror=implicit-function-declaration]
     939 |                                 if (fence && is_local_fence(fence)) {
         |                                              ^~~~~~~~~~~~~~
   drivers/virtio/virtio_wl.c: In function 'virtwl_ioctl_recv':
   drivers/virtio/virtio_wl.c:1417:32: error: implicit declaration of function 'sync_file_create'; did you mean 'sync_file_range'? [-Werror=implicit-function-declaration]
    1417 |                         sync = sync_file_create(&fence->base);
         |                                ^~~~~~~~~~~~~~~~
         |                                sync_file_range
>> drivers/virtio/virtio_wl.c:1417:30: warning: assignment to 'struct sync_file *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1417 |                         sync = sync_file_create(&fence->base);
         |                              ^
   drivers/virtio/virtio_wl.c:1435:42: error: invalid use of undefined type 'struct sync_file'
    1435 |                                 fput(sync->file);
         |                                          ^~
   drivers/virtio/virtio_wl.c:1438:45: error: invalid use of undefined type 'struct sync_file'
    1438 |                         fd_install(ret, sync->file);
         |                                             ^~
   cc1: some warnings being treated as errors


vim +938 drivers/virtio/virtio_wl.c

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
   939					if (fence && is_local_fence(fence)) {
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
