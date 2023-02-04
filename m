Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7247F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675502865; x=1707038865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3xsu+FR6FIiHPRGUbxYXElXG/+VyAlp4QKF9DGlFVk0=;
  b=GCcShfQ2ckHaxUwJJqyuphlJ8ey4ipZr5jlUudKyWmnUArD848UARS4j
   uLk1tbVLoxuP6T0K4d+Lv8nks6eiSXB9vAZmg0Qs/KppqlgeWpi9rOnq7
   nd55wP3W7u1iGmobzYfS+1eAxvjEmNSE1qlSauwQPkyM7etDXEn1chSzt
   1xOq4aeu9kyXGTLy9ezm94bLWDgHNphPO+3JRk2QPEGbhRaPFmY0bCoE8
   GetEL4zPi9h7bWKE2V7F9870R8CoauJmXClm9jL4OYLxO5QF/Ahbh0nZN
   Jopfygd0Z1XbqViPz5gc7ryIEK89uYJaXW+SjgQuwf4MFHtcrEVUXJ1Bz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="415145379"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="415145379"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 01:27:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="911426682"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="911426682"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Feb 2023 01:27:44 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOEpe-0001CM-1u;
	Sat, 04 Feb 2023 09:27:38 +0000
Date: Sat, 4 Feb 2023 17:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Reizner <zachr@google.com>
Cc: oe-kbuild-all@lists.linux.dev, David Riley <davidriley@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 4274/6555]
 drivers/virtio/virtio_wl.c:723:68: sparse: sparse: incorrect type in
 argument 3 (different base types)
Message-ID: <202302041737.9jyX23fb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 11a93b73abe7df1fb77b5ec4ee151676457a3cd9 [4274/6555] CHROMIUM: virtwl: send foreign id support
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230204/202302041737.9jyX23fb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/11a93b73abe7df1fb77b5ec4ee151676457a3cd9
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout 11a93b73abe7df1fb77b5ec4ee151676457a3cd9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/nvme/host/ drivers/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
   drivers/virtio/virtio_wl.c:493:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:498:26: sparse: sparse: cast from restricted __le32
   drivers/virtio/virtio_wl.c:500:46: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:524:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:529:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:567:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:573:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:611:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:611:30: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:611:30: sparse:     got int
   drivers/virtio/virtio_wl.c:612:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:612:28: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:612:28: sparse:     got unsigned int [usertype] id
>> drivers/virtio/virtio_wl.c:723:68: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] *handle @@     got restricted __le32 * @@
   drivers/virtio/virtio_wl.c:723:68: sparse:     expected unsigned int [usertype] *handle
   drivers/virtio/virtio_wl.c:723:68: sparse:     got restricted __le32 *
   drivers/virtio/virtio_wl.c:726:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] kind @@     got int @@
   drivers/virtio/virtio_wl.c:726:41: sparse:     expected restricted __le32 [usertype] kind
   drivers/virtio/virtio_wl.c:726:41: sparse:     got int
   drivers/virtio/virtio_wl.c:823:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:823:29: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:823:29: sparse:     got int
   drivers/virtio/virtio_wl.c:826:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:826:37: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:826:37: sparse:     got int
   drivers/virtio/virtio_wl.c:837:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:837:27: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:837:27: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:838:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_count @@     got unsigned int [assigned] [usertype] vfd_count @@
   drivers/virtio/virtio_wl.c:838:30: sparse:     expected restricted __le32 [usertype] vfd_count
   drivers/virtio/virtio_wl.c:838:30: sparse:     got unsigned int [assigned] [usertype] vfd_count
   drivers/virtio/virtio_wl.c:856:45: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:856:45: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:856:45: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:886:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:886:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:886:36: sparse:     got int
   drivers/virtio/virtio_wl.c:887:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:887:34: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:887:34: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:888:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned int [usertype] flags @@
   drivers/virtio/virtio_wl.c:888:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:888:33: sparse:     got unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1056:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:1056:26: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:1056:26: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:1059:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1059:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1059:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1060:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1060:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1060:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1063:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1063:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1063:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1064:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] size @@     got unsigned int @@
   drivers/virtio/virtio_wl.c:1064:32: sparse:     expected restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1064:32: sparse:     got unsigned int
   drivers/virtio/virtio_wl.c:1067:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1067:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1067:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1068:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1068:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1068:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1071:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1071:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1071:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1072:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1072:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1072:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1077:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1077:44: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1077:44: sparse:     got int
   drivers/virtio/virtio_wl.c:1099:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:1099:44: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:1099:44: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1103:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:1103:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:1103:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1104:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:1104:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:1104:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:1105:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:1105:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1105:20: sparse:     got restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1331:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/virtio/virtio_wl.c:1331:17: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/virtio/virtio_wl.c:1331:17: sparse:     got unsigned int ( * )( ... )

vim +723 drivers/virtio/virtio_wl.c

   514	
   515	static ssize_t vfd_out_locked(struct virtwl_vfd *vfd, char __user *buffer,
   516				      size_t len)
   517	{
   518		struct virtwl_vfd_qentry *qentry, *next;
   519		ssize_t read_count = 0;
   520	
   521		list_for_each_entry_safe(qentry, next, &vfd->in_queue, list) {
   522			struct virtio_wl_ctrl_vfd_recv *recv =
   523				(struct virtio_wl_ctrl_vfd_recv *)qentry->hdr;
   524			size_t recv_offset = sizeof(*recv) + recv->vfd_count *
   525					     sizeof(__le32) + qentry->data_offset;
   526			u8 *buf = (u8 *)recv + recv_offset;
   527			ssize_t to_read = (ssize_t)qentry->len - (ssize_t)recv_offset;
   528	
 > 529			if (qentry->hdr->type != VIRTIO_WL_CMD_VFD_RECV)
   530				continue;
   531	
   532			if ((to_read + read_count) > len)
   533				to_read = len - read_count;
   534	
   535			if (copy_to_user(buffer + read_count, buf, to_read)) {
   536				read_count = -EFAULT;
   537				break;
   538			}
   539	
   540			read_count += to_read;
   541	
   542			qentry->data_offset += to_read;
   543			vfd_qentry_free_if_empty(vfd, qentry);
   544	
   545			if (read_count >= len)
   546				break;
   547		}
   548	
   549		return read_count;
   550	}
   551	
   552	/* must hold both vfd->lock and vi->vfds_lock */
   553	static size_t vfd_out_vfds_locked(struct virtwl_vfd *vfd,
   554					  struct virtwl_vfd **vfds, size_t count)
   555	{
   556		struct virtwl_info *vi = vfd->vi;
   557		struct virtwl_vfd_qentry *qentry, *next;
   558		size_t i;
   559		size_t read_count = 0;
   560	
   561		list_for_each_entry_safe(qentry, next, &vfd->in_queue, list) {
   562			struct virtio_wl_ctrl_vfd_recv *recv =
   563				(struct virtio_wl_ctrl_vfd_recv *)qentry->hdr;
   564			size_t vfd_offset = sizeof(*recv) + qentry->vfd_offset *
   565					    sizeof(__le32);
   566			__le32 *vfds_le = (__le32 *)((void *)recv + vfd_offset);
   567			ssize_t vfds_to_read = recv->vfd_count - qentry->vfd_offset;
   568	
   569			if (read_count >= count)
   570				break;
   571			if (vfds_to_read <= 0)
   572				continue;
   573			if (qentry->hdr->type != VIRTIO_WL_CMD_VFD_RECV)
   574				continue;
   575	
   576			if ((vfds_to_read + read_count) > count)
   577				vfds_to_read = count - read_count;
   578	
   579			for (i = 0; i < vfds_to_read; i++) {
   580				uint32_t vfd_id = le32_to_cpu(vfds_le[i]);
   581				vfds[read_count] = idr_find(&vi->vfds, vfd_id);
   582				if (vfds[read_count]) {
   583					read_count++;
   584				} else {
   585					pr_warn("virtwl: received a vfd with unrecognized id: %u\n",
   586						vfd_id);
   587				}
   588				qentry->vfd_offset++;
   589			}
   590	
   591			vfd_qentry_free_if_empty(vfd, qentry);
   592		}
   593	
   594		return read_count;
   595	}
   596	
   597	/* this can only be called if the caller has unique ownership of the vfd */
   598	static int do_vfd_close(struct virtwl_vfd *vfd)
   599	{
   600		struct virtio_wl_ctrl_vfd *ctrl_close;
   601		struct virtwl_info *vi = vfd->vi;
   602		struct completion finish_completion;
   603		struct scatterlist out_sg;
   604		struct scatterlist in_sg;
   605		int ret = 0;
   606	
   607		ctrl_close = kzalloc(sizeof(*ctrl_close), GFP_KERNEL);
   608		if (!ctrl_close)
   609			return -ENOMEM;
   610	
   611		ctrl_close->hdr.type = VIRTIO_WL_CMD_VFD_CLOSE;
   612		ctrl_close->vfd_id = vfd->id;
   613	
   614		sg_init_one(&in_sg, &ctrl_close->hdr,
   615			    sizeof(struct virtio_wl_ctrl_vfd));
   616		sg_init_one(&out_sg, &ctrl_close->hdr,
   617			    sizeof(struct virtio_wl_ctrl_hdr));
   618	
   619		init_completion(&finish_completion);
   620		ret = vq_queue_out(vi, &out_sg, &in_sg, &finish_completion,
   621				   false /* block */);
   622		if (ret) {
   623			pr_warn("virtwl: failed to queue close vfd id %u: %d\n",
   624				vfd->id,
   625				ret);
   626			goto free_ctrl_close;
   627		}
   628	
   629		wait_for_completion(&finish_completion);
   630		virtwl_vfd_remove(vfd);
   631	
   632	free_ctrl_close:
   633		kfree(ctrl_close);
   634		return ret;
   635	}
   636	
   637	static ssize_t virtwl_vfd_recv(struct file *filp, char __user *buffer,
   638				       size_t len, struct virtwl_vfd **vfds,
   639				       size_t *vfd_count)
   640	{
   641		struct virtwl_vfd *vfd = filp->private_data;
   642		struct virtwl_info *vi = vfd->vi;
   643		ssize_t read_count = 0;
   644		size_t vfd_read_count = 0;
   645		bool force_to_wait = false;
   646	
   647		mutex_lock(&vi->vfds_lock);
   648		mutex_lock(&vfd->lock);
   649	
   650		while (read_count == 0 && vfd_read_count == 0) {
   651			while (force_to_wait || list_empty(&vfd->in_queue)) {
   652				force_to_wait = false;
   653				if (vfd->hungup)
   654					goto out_unlock;
   655	
   656				mutex_unlock(&vfd->lock);
   657				mutex_unlock(&vi->vfds_lock);
   658				if (filp->f_flags & O_NONBLOCK)
   659					return -EAGAIN;
   660	
   661				if (wait_event_interruptible(vfd->in_waitq,
   662					!list_empty(&vfd->in_queue) || vfd->hungup))
   663					return -ERESTARTSYS;
   664	
   665				mutex_lock(&vi->vfds_lock);
   666				mutex_lock(&vfd->lock);
   667			}
   668	
   669			read_count = vfd_out_locked(vfd, buffer, len);
   670			if (read_count < 0)
   671				goto out_unlock;
   672			if (vfds && vfd_count && *vfd_count)
   673				vfd_read_count = vfd_out_vfds_locked(vfd, vfds,
   674								     *vfd_count);
   675			else if (read_count == 0 && !list_empty(&vfd->in_queue))
   676				/*
   677				 * Indicates a corner case where the in_queue has ONLY
   678				 * incoming VFDs but the caller has given us no space to
   679				 * store them. We force a wait for more activity on the
   680				 * in_queue to prevent busy waiting.
   681				 */
   682				force_to_wait = true;
   683		}
   684	
   685	out_unlock:
   686		mutex_unlock(&vfd->lock);
   687		mutex_unlock(&vi->vfds_lock);
   688		if (vfd_count)
   689			*vfd_count = vfd_read_count;
   690		return read_count;
   691	}
   692	
   693	static int encode_vfd_ids(struct virtwl_vfd **vfds, size_t vfd_count,
   694				  __le32 *vfd_ids)
   695	{
   696		size_t i;
   697	
   698		for (i = 0; i < vfd_count; i++) {
   699			if (vfds[i])
   700				vfd_ids[i] = cpu_to_le32(vfds[i]->id);
   701			else
   702				return -EBADFD;
   703		}
   704		return 0;
   705	}
   706	
   707	#ifdef SEND_VIRTGPU_RESOURCES
   708	static int encode_vfd_ids_foreign(struct virtwl_vfd **vfds,
   709					  struct dma_buf **virtgpu_dma_bufs,
   710					  size_t vfd_count,
   711					  struct virtio_wl_ctrl_vfd_send_vfd *vfd_ids)
   712	{
   713		size_t i;
   714		int ret;
   715	
   716		for (i = 0; i < vfd_count; i++) {
   717			if (vfds[i]) {
   718				vfd_ids[i].kind = VIRTIO_WL_CTRL_VFD_SEND_KIND_LOCAL;
   719				vfd_ids[i].id = cpu_to_le32(vfds[i]->id);
   720			} else if (virtgpu_dma_bufs[i]) {
   721				ret = virtio_gpu_dma_buf_to_handle(virtgpu_dma_bufs[i],
   722								   false,
 > 723								   &vfd_ids[i].id);
   724				if (ret)
   725					return ret;
   726				vfd_ids[i].kind = VIRTIO_WL_CTRL_VFD_SEND_KIND_VIRTGPU;
   727			} else {
   728				return -EBADFD;
   729			}
   730		}
   731		return 0;
   732	}
   733	#endif
   734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
