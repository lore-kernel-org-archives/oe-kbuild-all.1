Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC6E63A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 19:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690054545; x=1721590545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DksMgcIi1V4HmSH5GE1kfvR/vkJxJYGuJe4ZlmifS0I=;
  b=Qk87l7j0WEenWqmEzpOsHri0+KDo4Zw80KnCGs/khDusqZay54PTBQNo
   0gjfDG1TQUg2rMZLphk33SoUEY8IlB7ef0MDmmHSaVZ5uAiOP1wnVdY+L
   4iS8AmNbPoiy/H0DxL1P8714D+Ja+Tuhr9s8Jeajgn1aRK+fFtWsfXj3Q
   dw1LsO2sHs3v9GwG4ewj0tACnKho6ffFJvIb024TRCwkKzDkHslEr8o/N
   Vy7tYzrdotXkLeqYTZAi3/KceKp0VbkV3CeaSWdhAVV3cjb1NJ++Tz4J0
   IsbLN4lqeNwCRL43soBwWEsfCvGml62eGPHSYUWDey/iEjJUp6fhrrG6W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="364683167"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="364683167"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 12:35:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="790531173"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="790531173"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Jul 2023 12:35:41 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNIOD-0008Y7-12;
	Sat, 22 Jul 2023 19:35:41 +0000
Date: Sun, 23 Jul 2023 03:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/virtio/virtio_wl.c:849:30: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202307230355.iTj3PhOr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: e3c760a99cdc2d62cb7b69ae4fec5ce7e27df4a9 CHROMIUM: virtwl: add virtwl driver
date:   2 years, 7 months ago
config: x86_64-randconfig-r083-20230723 (https://download.01.org/0day-ci/archive/20230723/202307230355.iTj3PhOr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230355.iTj3PhOr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230355.iTj3PhOr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/virtio/virtio_wl.c:213:21: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:213:21: sparse:     expected unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:213:21: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:239:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:239:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:239:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:240:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:240:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:240:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:241:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:241:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:241:20: sparse:     got restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:254:39: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:254:39: sparse:     expected unsigned long id
   drivers/virtio/virtio_wl.c:254:39: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:288:42: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:288:42: sparse:     expected unsigned long id
   drivers/virtio/virtio_wl.c:288:42: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:316:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:316:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:316:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:494:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:499:26: sparse: sparse: cast from restricted __le32
   drivers/virtio/virtio_wl.c:501:46: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:525:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:530:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:568:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:574:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:612:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:612:30: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:612:30: sparse:     got int
   drivers/virtio/virtio_wl.c:613:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:613:28: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:613:28: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:834:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:834:29: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:834:29: sparse:     got int
   drivers/virtio/virtio_wl.c:848:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:848:27: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:848:27: sparse:     got unsigned int [usertype] id
>> drivers/virtio/virtio_wl.c:849:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_count @@     got unsigned long [assigned] [usertype] vfd_count @@
   drivers/virtio/virtio_wl.c:849:30: sparse:     expected restricted __le32 [usertype] vfd_count
   drivers/virtio/virtio_wl.c:849:30: sparse:     got unsigned long [assigned] [usertype] vfd_count
   drivers/virtio/virtio_wl.c:867:45: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:867:45: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:867:45: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:897:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:897:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:897:36: sparse:     got int
   drivers/virtio/virtio_wl.c:898:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:898:34: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:898:34: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:899:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned int [usertype] flags @@
   drivers/virtio/virtio_wl.c:899:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:899:33: sparse:     got unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1068:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:1068:26: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:1068:26: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:1071:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1071:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1071:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1072:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1072:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1072:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1075:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1075:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1075:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1076:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1076:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1076:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1080:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1080:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1080:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1081:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] size @@     got unsigned int @@
   drivers/virtio/virtio_wl.c:1081:32: sparse:     expected restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1081:32: sparse:     got unsigned int
   drivers/virtio/virtio_wl.c:1084:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1084:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1084:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1085:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1085:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1085:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1088:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1088:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1088:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1089:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1089:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1089:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1094:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1094:44: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1094:44: sparse:     got int
   drivers/virtio/virtio_wl.c:1116:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:1116:44: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:1116:44: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1120:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:1120:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:1120:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1121:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:1121:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:1121:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:1122:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:1122:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1122:20: sparse:     got restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1348:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/virtio/virtio_wl.c:1348:17: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/virtio/virtio_wl.c:1348:17: sparse:     got unsigned int ( * )( ... )

vim +849 drivers/virtio/virtio_wl.c

   745	
   746	static int virtwl_vfd_send(struct file *filp, const char __user *buffer,
   747						       u32 len, int *vfd_fds)
   748	{
   749		struct virtwl_vfd *vfd = filp->private_data;
   750		struct virtwl_info *vi = vfd->vi;
   751		struct fd vfd_files[VIRTWL_SEND_MAX_ALLOCS] = { { 0 } };
   752		struct virtwl_vfd *vfds[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
   753	#ifdef SEND_VIRTGPU_RESOURCES
   754		struct dma_buf *virtgpu_dma_bufs[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
   755		bool foreign_id = false;
   756	#endif
   757		size_t vfd_count = 0;
   758		size_t vfd_ids_size;
   759		size_t ctrl_send_size;
   760		struct virtio_wl_ctrl_vfd_send *ctrl_send;
   761		u8 *vfd_ids;
   762		u8 *out_buffer;
   763		struct completion finish_completion;
   764		struct scatterlist out_sg;
   765		struct scatterlist in_sg;
   766		int ret;
   767		int i;
   768	
   769		if (vfd_fds) {
   770			for (i = 0; i < VIRTWL_SEND_MAX_ALLOCS; i++) {
   771				struct fd vfd_file;
   772				int fd = vfd_fds[i];
   773	
   774				if (fd < 0)
   775					break;
   776	
   777				vfd_file = fdget(vfd_fds[i]);
   778				if (!vfd_file.file) {
   779					ret = -EBADFD;
   780					goto put_files;
   781				}
   782	
   783				if (vfd_file.file->f_op == &virtwl_vfd_fops) {
   784					vfd_files[i] = vfd_file;
   785	
   786					vfds[i] = vfd_file.file->private_data;
   787					if (vfds[i] && vfds[i]->id) {
   788						vfd_count++;
   789						continue;
   790					}
   791	
   792					ret = -EINVAL;
   793					goto put_files;
   794				} else {
   795					struct dma_buf *dma_buf = ERR_PTR(-EINVAL);
   796	#ifdef SEND_VIRTGPU_RESOURCES
   797					dma_buf = dma_buf_get(vfd_fds[i]);
   798					if (!IS_ERR(dma_buf)) {
   799						fdput(vfd_file);
   800						virtgpu_dma_bufs[i] = dma_buf;
   801						foreign_id = true;
   802						vfd_count++;
   803						continue;
   804					}
   805	#endif
   806					fdput(vfd_file);
   807					ret = PTR_ERR(dma_buf);
   808					goto put_files;
   809				}
   810			}
   811		}
   812	
   813		/* Empty writes always succeed. */
   814		if (len == 0 && vfd_count == 0)
   815			return 0;
   816	
   817		vfd_ids_size = vfd_count * sizeof(__le32);
   818	#ifdef SEND_VIRTGPU_RESOURCES
   819		if (foreign_id) {
   820			vfd_ids_size = vfd_count *
   821				       sizeof(struct virtio_wl_ctrl_vfd_send_vfd);
   822		}
   823	#endif
   824		ctrl_send_size = sizeof(*ctrl_send) + vfd_ids_size + len;
   825		ctrl_send = kzalloc(ctrl_send_size, GFP_KERNEL);
   826		if (!ctrl_send) {
   827			ret = -ENOMEM;
   828			goto put_files;
   829		}
   830	
   831		vfd_ids = (u8 *)ctrl_send + sizeof(*ctrl_send);
   832		out_buffer = (u8 *)ctrl_send + ctrl_send_size - len;
   833	
   834		ctrl_send->hdr.type = VIRTIO_WL_CMD_VFD_SEND;
   835	#ifdef SEND_VIRTGPU_RESOURCES
   836		if (foreign_id) {
   837			ctrl_send->hdr.type = VIRTIO_WL_CMD_VFD_SEND_FOREIGN_ID;
   838			ret = encode_vfd_ids_foreign(vfds, virtgpu_dma_bufs, vfd_count,
   839				(struct virtio_wl_ctrl_vfd_send_vfd *)vfd_ids);
   840		} else {
   841			ret = encode_vfd_ids(vfds, vfd_count, (__le32 *)vfd_ids);
   842		}
   843	#else
   844		ret = encode_vfd_ids(vfds, vfd_count, (__le32 *)vfd_ids);
   845	#endif
   846		if (ret)
   847			goto free_ctrl_send;
   848		ctrl_send->vfd_id = vfd->id;
 > 849		ctrl_send->vfd_count = vfd_count;
   850	
   851		if (copy_from_user(out_buffer, buffer, len)) {
   852			ret = -EFAULT;
   853			goto free_ctrl_send;
   854		}
   855	
   856		init_completion(&finish_completion);
   857		sg_init_one(&out_sg, ctrl_send, ctrl_send_size);
   858		sg_init_one(&in_sg, ctrl_send, sizeof(struct virtio_wl_ctrl_hdr));
   859	
   860		ret = vq_queue_out(vi, &out_sg, &in_sg, &finish_completion,
   861					       filp->f_flags & O_NONBLOCK);
   862		if (ret)
   863			goto free_ctrl_send;
   864	
   865		wait_for_completion(&finish_completion);
   866	
   867		ret = virtwl_resp_err(ctrl_send->hdr.type);
   868	
   869	free_ctrl_send:
   870		kfree(ctrl_send);
   871	put_files:
   872		for (i = 0; i < VIRTWL_SEND_MAX_ALLOCS; i++) {
   873			if (vfd_files[i].file)
   874				fdput(vfd_files[i]);
   875	#ifdef SEND_VIRTGPU_RESOURCES
   876			if (virtgpu_dma_bufs[i])
   877				dma_buf_put(virtgpu_dma_bufs[i]);
   878	#endif
   879		}
   880		return ret;
   881	}
   882	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
