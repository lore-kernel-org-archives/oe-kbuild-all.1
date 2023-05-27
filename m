Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0151369
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 07:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685172364; x=1716708364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rtZnfUpnN2ut78VxEAah+jBOctkFFbCAPpixVdFcXL0=;
  b=Mt5s94v/+FgAvE9gZBZj54P1ds5eRH2JZgsZyxUeqw9IysgbQdpVbYKW
   Q2fgj+HVxh9uTqp2EJD6cOubP6dZnDpGoxGM+X9DhoZZoDoqw3xCQt6f3
   aI9qexARD3hl6DK3GplLtR4jJIUSkWFnVW7MpD89koD3gXsSVT9greCVX
   PSPl0mj0LCnPqHcO07H9Y76w1Q//8JwpZZ9aHNp/ZqmuQsKsR5Al3fIYn
   +kmLEYNanoFgmeWY4lw6m2F2v/DHmOmgx96itVo58CwQKt2J2o9FDDRpD
   rhmT5wq1DZQ7B0cxLz9VNX2I3atGQR0KxeIMlvCkvIooUewZGvBH5dgAC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="351879287"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="351879287"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 00:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879775117"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="879775117"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2023 00:25:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2oJH-000Jpw-0w;
	Sat, 27 May 2023 07:25:55 +0000
Date: Sat, 27 May 2023 15:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:arcvm12-5.10 15032/27651]
 drivers/virtio/virtio_wl.c:938:11: warning: incompatible integer to pointer
 conversion assigning to 'struct dma_fence *' from 'int'
Message-ID: <202305271558.rNxv2q1s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common arcvm12-5.10
head:   fb8d4193a852c7d62938aaf3a8c58bbc7888bb23
commit: 6686780d2960d81b608e66938266602d276ea4d1 [15032/27651] CHROMIUM: virtio-wl: add support for host fences
config: i386-randconfig-i073-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271558.rNxv2q1s-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common arcvm12-5.10
        git checkout 6686780d2960d81b608e66938266602d276ea4d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/virtio/ drivers/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271558.rNxv2q1s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virtio/virtio_wl.c:938:13: error: implicit declaration of function 'sync_file_get_fence' [-Werror,-Wimplicit-function-declaration]
                                   fence = sync_file_get_fence(vfd_fds[i]);
                                           ^
>> drivers/virtio/virtio_wl.c:938:11: warning: incompatible integer to pointer conversion assigning to 'struct dma_fence *' from 'int' [-Wint-conversion]
                                   fence = sync_file_get_fence(vfd_fds[i]);
                                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_wl.c:939:18: error: implicit declaration of function 'is_local_fence' [-Werror,-Wimplicit-function-declaration]
                                   if (fence && is_local_fence(fence)) {
                                                ^
   drivers/virtio/virtio_wl.c:1417:11: error: implicit declaration of function 'sync_file_create' [-Werror,-Wimplicit-function-declaration]
                           sync = sync_file_create(&fence->base);
                                  ^
   drivers/virtio/virtio_wl.c:1417:11: note: did you mean 'sync_file_range'?
   include/linux/fs.h:2783:12: note: 'sync_file_range' declared here
   extern int sync_file_range(struct file *file, loff_t offset, loff_t nbytes,
              ^
>> drivers/virtio/virtio_wl.c:1417:9: warning: incompatible integer to pointer conversion assigning to 'struct sync_file *' from 'int' [-Wint-conversion]
                           sync = sync_file_create(&fence->base);
                                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_wl.c:1435:14: error: incomplete definition of type 'struct sync_file'
                                   fput(sync->file);
                                        ~~~~^
   drivers/virtio/virtio_wl.c:1402:11: note: forward declaration of 'struct sync_file'
                           struct sync_file *sync;
                                  ^
   drivers/virtio/virtio_wl.c:1438:24: error: incomplete definition of type 'struct sync_file'
                           fd_install(ret, sync->file);
                                           ~~~~^
   drivers/virtio/virtio_wl.c:1402:11: note: forward declaration of 'struct sync_file'
                           struct sync_file *sync;
                                  ^
   2 warnings and 5 errors generated.


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
