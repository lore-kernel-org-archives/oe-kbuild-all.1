Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0DA10F0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 06:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688537655; x=1720073655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EKeGi3s9lQ/3qKhohZs1w4V2QuHBYiMKNwJwhq2cgwo=;
  b=TCqZgbtje5+wn2+1tQd3yoZAL71ja1lJZFiGd1wJNm4Ob/3plG2crLLz
   jZm5uLinaN+wqukDrBuu5uMf09DaurCQGBsTxIBqcAcqzn/Ak7OQtVFrT
   2g9ZWGzW/Cu6Xhuwm+hCSS7DqsUjEpRz0z+YdFchl6T8PN4Kc7QD0+TVr
   26gplzVNCHxpbBmlzdXj9MoGCUAbAp0Zdgv2kQMtS5bGk+a5RECYoDKpP
   f2IJd+LyIiXMnbsLbzmv0bI6FVBXCZtVprcP0IxbbVjQI0ZYTgVa+7/KL
   hz5v6P31Nv76zcXxeYBGqf9QVy1X8yb2LaXDylLviAM2DafQdDuOEYazZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="394008865"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="394008865"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 23:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="696342052"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="696342052"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Jul 2023 23:13:50 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGvlt-0000QE-1o;
	Wed, 05 Jul 2023 06:13:49 +0000
Date: Wed, 5 Jul 2023 14:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 15032/28660]
 drivers/virtio/virtio_wl.c:938:39: warning: assignment to 'struct dma_fence
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202307051436.FxEGsWlg-lkp@intel.com>
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
head:   f525b45859c737549efe5a735c935e0ee895e875
commit: 6686780d2960d81b608e66938266602d276ea4d1 [15032/28660] CHROMIUM: virtio-wl: add support for host fences
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230705/202307051436.FxEGsWlg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307051436.FxEGsWlg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307051436.FxEGsWlg-lkp@intel.com/

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
