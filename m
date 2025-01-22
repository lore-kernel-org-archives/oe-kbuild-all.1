Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC7E8F7D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 21:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737581793; cv=none; b=mrgnjpCq6QV+K/KNd9AapxK8s4Do1jtV1DZa+C1fnYuT+Mu6Vj7C3SA2quajH5r+aEhCUDCpyJtF67+ricoMwzpYfg0ZMqfI71dUvTTSOv46vwxUqEOWSmiEIFCepK0ODC4fMUpIlbmKwwJwc8IJA9R+NPT4qS60NjrENfbhVh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737581793; c=relaxed/simple;
	bh=cnl9QBHvLr+AS3P+ZA93qrOdWQu8r0p7DMg1DdSgEOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FaS83o2ZCTsLB165uDbvkAg6vyUvCdKBIvRyAEZ6UwhCjTrGechkVjbb6XTfIzLEa1Wvf3jGoDpjEOFmveTPy54qCaWE3mwq59BPfeeath5rnrKGSz4qNzrY1ac3mBeYbq1ELCvT3TXNVZRoUWMegyI8g4pUtrtNdzXjqvrjDWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFPrrrau; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFPrrrau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737581791; x=1769117791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cnl9QBHvLr+AS3P+ZA93qrOdWQu8r0p7DMg1DdSgEOA=;
  b=aFPrrrauuKvE/XSZm8vaonR/krL/i1I+LIiOKZZh0GgaQgVR9T1hNeee
   qdOIcA3UwPblExdc5THT73GIOedWuQ52z9g/p2rsJIJUmdvy63r7YC7+K
   +neHbZraO902FIMTo4oJ469Hsr9mmJQel5Ag5Zk70O41kO37AdKISOJeu
   iGsjd0a+e9qoJ0qdwWOCLX8rVb/8K+5tvt16AjctxNPlfKJOtaItVJw8F
   cg9z/AP+Ts5c8XdqCXtBCMb7MSwwBrjqbWduPEPdhSCc7C8WtvtjhQ0SU
   WkXcLvsE+ahSgfctMc1zAJWT1nbDG4XMESQ0X1oLu7T0LcAiSTnfIgmeN
   g==;
X-CSE-ConnectionGUID: awIR94hJTTmRWRJAQ7jYJg==
X-CSE-MsgGUID: i7jM+4UDSx+dP7vPeHSZEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37939355"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="37939355"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 13:36:30 -0800
X-CSE-ConnectionGUID: KA8HiGWPTZCnibfnZsXx7A==
X-CSE-MsgGUID: zpQWbyRWTx+p7I3g47RXvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108139213"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Jan 2025 13:36:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taiOg-000aKt-2v;
	Wed, 22 Jan 2025 21:36:26 +0000
Date: Thu, 23 Jan 2025 05:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/1]
 drivers/virtio/virtio_wl.c:938:39: warning: assignment to 'struct dma_fence
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202501230538.R3bYKGrj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   f2a45e7307e73a366b48781aa253aec45ff1fd5a
commit: 6686780d2960d81b608e66938266602d276ea4d1 [0/1] CHROMIUM: virtio-wl: add support for host fences
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250123/202501230538.R3bYKGrj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230538.R3bYKGrj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230538.R3bYKGrj-lkp@intel.com/

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
