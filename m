Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E706E58D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 21:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bs1TqVUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701810956; x=1733346956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WQsr5Kx9HyvcqVwvVzdwRXlli3GNCOiV8OWI6NQPYxQ=;
  b=bs1TqVUEwAWztaPRk/Mwg7Kb2bz71H1UJstH5LHczkunotzrLLrV3lVP
   KqeFA9W2Ln9bZN7TYuJrL0GUn0TAyq2jXaYeElsuV0aewJsV2h0tGFwmV
   TrKBBSnOI4wKtpFxS5MBw3LCBQtHQj+WHcWhePWh38Dp+UD963whZ5D0E
   Fu0ZquG8S26TttE4SdKSicZ0FMMQHM52j5RIRMu4hh+zXm6bFTzqjlfgx
   9/7gcFDpaNtAqBko+a3JtC+XrcCNlcZFzMi4Nc/2YIthEBpmG3HZwDP1d
   c1qPGa+weYc+ZOJsPVLE2SsqG5Y/jHg143yP/l5FwLHobEN+jn2YK5yKX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393693393"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="393693393"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 13:15:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="894508907"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="894508907"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Dec 2023 13:15:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAcli-0009kM-1p;
	Tue, 05 Dec 2023 21:15:50 +0000
Date: Wed, 6 Dec 2023 05:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 933/1887] drivers/virtio/virtio_wl.c:930:30:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202312060531.UWiA9YgZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6d80872de59701b0cfed9ff913eb6c4d6b153143
commit: 2e18aa079d2b82c701951c6405388decad433b57 [933/1887] CHROMIUM: virtwl: add virtwl driver
config: arm-randconfig-r111-20231206 (https://download.01.org/0day-ci/archive/20231206/202312060531.UWiA9YgZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060531.UWiA9YgZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060531.UWiA9YgZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/virtio/virtio_wl.c:217:21: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:217:21: sparse:     expected unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:217:21: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:243:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:243:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:243:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:244:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:244:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:244:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:245:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:245:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:245:20: sparse:     got restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:258:39: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:258:39: sparse:     expected unsigned long id
   drivers/virtio/virtio_wl.c:258:39: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:292:42: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:292:42: sparse:     expected unsigned long id
   drivers/virtio/virtio_wl.c:292:42: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:320:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:320:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:320:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:498:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:503:26: sparse: sparse: cast from restricted __le32
   drivers/virtio/virtio_wl.c:505:46: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:529:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:538:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:574:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:580:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:618:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:618:30: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:618:30: sparse:     got int
   drivers/virtio/virtio_wl.c:619:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:619:28: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:619:28: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:905:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:905:29: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:905:29: sparse:     got int
   drivers/virtio/virtio_wl.c:929:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:929:27: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:929:27: sparse:     got unsigned int [usertype] id
>> drivers/virtio/virtio_wl.c:930:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_count @@     got unsigned int [assigned] [usertype] vfd_count @@
   drivers/virtio/virtio_wl.c:930:30: sparse:     expected restricted __le32 [usertype] vfd_count
   drivers/virtio/virtio_wl.c:930:30: sparse:     got unsigned int [assigned] [usertype] vfd_count
   drivers/virtio/virtio_wl.c:963:45: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:963:45: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:963:45: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:998:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:998:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:998:36: sparse:     got int
   drivers/virtio/virtio_wl.c:999:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:999:34: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:999:34: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:1000:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned int [usertype] flags @@
   drivers/virtio/virtio_wl.c:1000:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1000:33: sparse:     got unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1169:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:1169:26: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:1169:26: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:1172:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1172:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1172:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1173:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1173:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1173:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1176:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1176:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1176:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1177:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1177:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1177:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1181:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1181:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1181:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1182:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] size @@     got unsigned int @@
   drivers/virtio/virtio_wl.c:1182:32: sparse:     expected restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1182:32: sparse:     got unsigned int
   drivers/virtio/virtio_wl.c:1185:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1185:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1185:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1186:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1186:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1186:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1189:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1189:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1189:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1190:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1190:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1190:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1195:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1195:44: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1195:44: sparse:     got int
   drivers/virtio/virtio_wl.c:1217:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:1217:44: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:1217:44: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1221:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:1221:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:1221:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1222:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:1222:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:1222:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:1223:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:1223:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1223:20: sparse:     got restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1449:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/virtio/virtio_wl.c:1449:17: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/virtio/virtio_wl.c:1449:17: sparse:     got unsigned int ( * )( ... )

vim +930 drivers/virtio/virtio_wl.c

   791	
   792	static int virtwl_vfd_send(struct file *filp, const char __user *buffer,
   793						       u32 len, int *vfd_fds)
   794	{
   795		struct virtwl_vfd *vfd = filp->private_data;
   796		struct virtwl_info *vi = vfd->vi;
   797		struct fd vfd_files[VIRTWL_SEND_MAX_ALLOCS] = { { 0 } };
   798		struct virtwl_vfd *vfds[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
   799	#ifdef SEND_VIRTGPU_RESOURCES
   800		struct dma_buf *virtgpu_dma_bufs[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
   801		struct dma_fence *virtgpu_dma_fence[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
   802		bool foreign_id = false;
   803	#endif
   804		size_t vfd_count = 0;
   805		size_t vfd_ids_size;
   806		size_t ctrl_send_size;
   807		struct virtio_wl_ctrl_vfd_send *ctrl_send;
   808		u8 *vfd_ids;
   809		u8 *out_buffer;
   810		struct completion finish_completion;
   811		struct scatterlist out_sg;
   812		struct scatterlist in_sg;
   813		struct sg_table sgt;
   814		struct vm_struct *area;
   815		bool vmalloced;
   816		int ret;
   817		int i;
   818	
   819		if (vfd_fds) {
   820			for (i = 0; i < VIRTWL_SEND_MAX_ALLOCS; i++) {
   821				struct fd vfd_file;
   822				int fd = vfd_fds[i];
   823	
   824				if (fd < 0)
   825					break;
   826	
   827				vfd_file = fdget(vfd_fds[i]);
   828				if (!vfd_file.file) {
   829					ret = -EBADFD;
   830					goto put_files;
   831				}
   832	
   833				if (vfd_file.file->f_op == &virtwl_vfd_fops) {
   834					vfd_files[i] = vfd_file;
   835	
   836					vfds[i] = vfd_file.file->private_data;
   837					if (vfds[i] && vfds[i]->id) {
   838						vfd_count++;
   839						continue;
   840					}
   841	
   842					ret = -EINVAL;
   843					goto put_files;
   844				} else {
   845					struct dma_buf *dma_buf = ERR_PTR(-EINVAL);
   846					struct dma_fence *dma_fence = ERR_PTR(-EINVAL);
   847					bool handled = false;
   848	
   849	#ifdef SEND_VIRTGPU_RESOURCES
   850					dma_buf = dma_buf_get(vfd_fds[i]);
   851					dma_fence = vi->use_send_vfd_v2
   852						? sync_file_get_fence(vfd_fds[i])
   853						: ERR_PTR(-EINVAL);
   854					handled = !IS_ERR(dma_buf) ||
   855						  !IS_ERR(dma_fence);
   856	
   857					if (!IS_ERR(dma_buf)) {
   858						virtgpu_dma_bufs[i] = dma_buf;
   859					} else {
   860						virtgpu_dma_fence[i] = dma_fence;
   861					}
   862	
   863					foreign_id = true;
   864					vfd_count++;
   865	#endif
   866					fdput(vfd_file);
   867					if (!handled) {
   868						ret = IS_ERR(dma_buf) ?
   869							PTR_ERR(dma_buf) :
   870							PTR_ERR(dma_fence);
   871						goto put_files;
   872					}
   873				}
   874			}
   875		}
   876	
   877		/* Empty writes always succeed. */
   878		if (len == 0 && vfd_count == 0)
   879			return 0;
   880	
   881		vfd_ids_size = vfd_count * sizeof(__le32);
   882	#ifdef SEND_VIRTGPU_RESOURCES
   883		if (foreign_id) {
   884			vfd_ids_size = vfd_count * (vi->use_send_vfd_v2
   885				? sizeof(struct virtio_wl_ctrl_vfd_send_vfd_v2)
   886				: sizeof(struct virtio_wl_ctrl_vfd_send_vfd));
   887		}
   888	#endif
   889		ctrl_send_size = sizeof(*ctrl_send) + vfd_ids_size + len;
   890		vmalloced = false;
   891		if (ctrl_send_size < PAGE_SIZE)
   892			ctrl_send = kmalloc(ctrl_send_size, GFP_KERNEL);
   893		else {
   894			vmalloced = true;
   895			ctrl_send = vmalloc(ctrl_send_size);
   896		}
   897		if (!ctrl_send) {
   898			ret = -ENOMEM;
   899			goto put_files;
   900		}
   901	
   902		vfd_ids = (u8 *)ctrl_send + sizeof(*ctrl_send);
   903		out_buffer = (u8 *)ctrl_send + ctrl_send_size - len;
   904	
   905		ctrl_send->hdr.type = VIRTIO_WL_CMD_VFD_SEND;
   906		ctrl_send->hdr.flags = 0;
   907	#ifdef SEND_VIRTGPU_RESOURCES
   908		if (foreign_id) {
   909			struct virtio_wl_ctrl_vfd_send_vfd *v1 = NULL;
   910			struct virtio_wl_ctrl_vfd_send_vfd_v2 *v2 = NULL;
   911	
   912			if (vi->use_send_vfd_v2)
   913				v2 = (struct virtio_wl_ctrl_vfd_send_vfd_v2 *) vfd_ids;
   914			else
   915				v1 = (struct virtio_wl_ctrl_vfd_send_vfd *) vfd_ids;
   916	
   917			ctrl_send->hdr.type = VIRTIO_WL_CMD_VFD_SEND_FOREIGN_ID;
   918			ret = encode_vfd_ids_foreign(vfds,
   919				virtgpu_dma_bufs, virtgpu_dma_fence, vfd_count,
   920				v1, v2);
   921		} else {
   922			ret = encode_vfd_ids(vfds, vfd_count, (__le32 *)vfd_ids);
   923		}
   924	#else
   925		ret = encode_vfd_ids(vfds, vfd_count, (__le32 *)vfd_ids);
   926	#endif
   927		if (ret)
   928			goto free_ctrl_send;
   929		ctrl_send->vfd_id = vfd->id;
 > 930		ctrl_send->vfd_count = vfd_count;
   931	
   932		if (copy_from_user(out_buffer, buffer, len)) {
   933			ret = -EFAULT;
   934			goto free_ctrl_send;
   935		}
   936	
   937		init_completion(&finish_completion);
   938		if (!vmalloced) {
   939			sg_init_one(&out_sg, ctrl_send, ctrl_send_size);
   940			sg_init_one(&in_sg, ctrl_send,
   941			    sizeof(struct virtio_wl_ctrl_hdr));
   942			ret = vq_queue_out(vi, &out_sg, &in_sg, &finish_completion,
   943			    filp->f_flags & O_NONBLOCK);
   944		} else {
   945			area = find_vm_area(ctrl_send);
   946			ret = sg_alloc_table_from_pages(&sgt, area->pages,
   947			    area->nr_pages, 0, ctrl_send_size, GFP_KERNEL);
   948			if (ret)
   949				goto free_ctrl_send;
   950	
   951			sg_init_table(&in_sg, 1);
   952			sg_set_page(&in_sg, area->pages[0],
   953			    sizeof(struct virtio_wl_ctrl_hdr), 0);
   954	
   955			ret = vq_queue_out(vi, sgt.sgl, &in_sg, &finish_completion,
   956			    filp->f_flags & O_NONBLOCK);
   957		}
   958		if (ret)
   959			goto free_sgt;
   960	
   961		wait_for_completion(&finish_completion);
   962	
   963		ret = virtwl_resp_err(ctrl_send->hdr.type);
   964	
   965	free_sgt:
   966		if (vmalloced)
   967			sg_free_table(&sgt);
   968	free_ctrl_send:
   969		kvfree(ctrl_send);
   970	put_files:
   971		for (i = 0; i < VIRTWL_SEND_MAX_ALLOCS; i++) {
   972			if (vfd_files[i].file)
   973				fdput(vfd_files[i]);
   974	#ifdef SEND_VIRTGPU_RESOURCES
   975			if (virtgpu_dma_bufs[i])
   976				dma_buf_put(virtgpu_dma_bufs[i]);
   977			if (virtgpu_dma_fence[i])
   978				dma_fence_put(virtgpu_dma_fence[i]);
   979	#endif
   980		}
   981		return ret;
   982	}
   983	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
