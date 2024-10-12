Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609554315F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 06:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728714238; cv=none; b=l9h+5rC82h/rPn+9ZytZ2BCpraXYBrVEFoEVoktu6NLnD8kXzyhY5hjeXy2LQxJkx5JIP+Q3rm0Bl+e9If2ZMkR2P8L1z7T8zz9rqrKjax2Lw/ykTvrHxCJuBszmgPbQ+0EXfIbUjza9F3raJkBhqL4tJqZO3adiBQocR28oOm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728714238; c=relaxed/simple;
	bh=rgt91gdkFpVxISsDdQdo5APb3AQpvierKD2R8ESAxZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bOJdgDiR/qbdDsrGLyPwO1pH/SusQSd7F5k6lk9geTORxx3znyo3U+qGQQviOpTDqbo0TuZ33ma1e4A2k964yo6TnJ5nQ54VEPWYHmRAnex+W9k7tEhjLPhK0IuuMWziMfgfXUzMbCH0waUy/Ces1K6a6uMOgY0hzkAcJuNCQYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpWQk1pj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpWQk1pj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728714236; x=1760250236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rgt91gdkFpVxISsDdQdo5APb3AQpvierKD2R8ESAxZo=;
  b=BpWQk1pjVfIqSicRJRQJJQHD1oGfIkAGa9sRMdVW1GWptRBtnLaddrTg
   GvzzBW04Pfb4mPOHDYQk5V6cIsKHY8mOGPXbY53NDY18A8+IruRzxg5wp
   faqPDGu6Da3S3T9zUwm3o78D3bzAv0vZ/c6kNcf84RS4zl5/T7yujR4ai
   geN2JMg2BInsrq+W6Jexze5nmnwKCosaIW0KosfbttgStd6EALkDxLJln
   ZhiVu9HZU0iY3nbtecTPUh2tSgjERctUMI0hINBYyOrrqhOi5E5cE3EyX
   G/5fVCINULZ1PteLYDtG2kTTNGijt/I2vpBii9YPLmM4cBJYINAqboNlr
   A==;
X-CSE-ConnectionGUID: nWGV79XmSjSnVf5c0mJTCw==
X-CSE-MsgGUID: zlEZYgaoQeep8U9PcuU2LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39503145"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="39503145"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 23:23:56 -0700
X-CSE-ConnectionGUID: Q6HuHsk0QTubj7AEBFyiJA==
X-CSE-MsgGUID: yF0iVpwIRv+wX/lMtKectA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="81926393"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Oct 2024 23:23:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szVXc-000D75-11;
	Sat, 12 Oct 2024 06:23:52 +0000
Date: Sat, 12 Oct 2024 14:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 9527/30000]
 drivers/virtio/virtio_wl.c:938:41: error: implicit declaration of function
 'sync_file_get_fence'; did you mean 'sync_file_range'?
Message-ID: <202410121450.OP2Dotzd-lkp@intel.com>
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
head:   a008d597f5ebedde0d000d27364ddb38be189ae4
commit: 6686780d2960d81b608e66938266602d276ea4d1 [9527/30000] CHROMIUM: virtio-wl: add support for host fences
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241012/202410121450.OP2Dotzd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121450.OP2Dotzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121450.OP2Dotzd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_wl.c: In function 'virtwl_vfd_send':
>> drivers/virtio/virtio_wl.c:938:41: error: implicit declaration of function 'sync_file_get_fence'; did you mean 'sync_file_range'? [-Werror=implicit-function-declaration]
     938 |                                 fence = sync_file_get_fence(vfd_fds[i]);
         |                                         ^~~~~~~~~~~~~~~~~~~
         |                                         sync_file_range
   drivers/virtio/virtio_wl.c:938:39: warning: assignment to 'struct dma_fence *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     938 |                                 fence = sync_file_get_fence(vfd_fds[i]);
         |                                       ^
>> drivers/virtio/virtio_wl.c:939:46: error: implicit declaration of function 'is_local_fence' [-Werror=implicit-function-declaration]
     939 |                                 if (fence && is_local_fence(fence)) {
         |                                              ^~~~~~~~~~~~~~
   drivers/virtio/virtio_wl.c: In function 'virtwl_ioctl_recv':
>> drivers/virtio/virtio_wl.c:1417:32: error: implicit declaration of function 'sync_file_create'; did you mean 'sync_file_range'? [-Werror=implicit-function-declaration]
    1417 |                         sync = sync_file_create(&fence->base);
         |                                ^~~~~~~~~~~~~~~~
         |                                sync_file_range
   drivers/virtio/virtio_wl.c:1417:30: warning: assignment to 'struct sync_file *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1417 |                         sync = sync_file_create(&fence->base);
         |                              ^
>> drivers/virtio/virtio_wl.c:1435:42: error: invalid use of undefined type 'struct sync_file'
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
