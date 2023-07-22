Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ADAECE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 22:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690066231; x=1721602231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hnQp2gHxi2HfIdxof7pIr5A7+bvzXRMtAJxDf/cvalo=;
  b=BoONIIkVMRAuSQ/pwRrPkpPqtSZWeDT9wEFScFwweWut5zuNgPo9JRlD
   Sg6L+CSQVsy8+6HOUNxP2Zn1h+EfCi+UeUgHLCaVPnswdljxA8ubbgPTB
   enXR5o/yVv503OSWB/vBKFBu/SuhXQqJ8+jW0uNAsoo2zhIDA/jQTJUsO
   D7lpGM8Q3dF52WRLi6LMxr/KPDzcjnH6pD5veyx1nXB6HoPUc3f5z7Ojy
   ZZ2KqlCbTzbVwADZ8lrv1eHxhAFjz0jq1B52xHzNcVSfKnQOUFor65Snv
   C7PNho1RDb90BMnPqHzl+khu93XsvETqUM20x4bmF/3U79HjzWIPo+8a9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="367261189"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="367261189"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 15:50:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="1055968597"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="1055968597"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Jul 2023 15:50:27 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNLQh-0008ez-0R;
	Sat, 22 Jul 2023 22:50:27 +0000
Date: Sun, 23 Jul 2023 06:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/virtio/virtio_wl.c:737:41: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202307230635.6rmWxKYf-lkp@intel.com>
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
config: i386-randconfig-r081-20230723 (https://download.01.org/0day-ci/archive/20230723/202307230635.6rmWxKYf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230635.6rmWxKYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230635.6rmWxKYf-lkp@intel.com/

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
   drivers/virtio/virtio_wl.c:734:54: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] *id @@     got restricted __le32 * @@
   drivers/virtio/virtio_wl.c:734:54: sparse:     expected unsigned int [usertype] *id
   drivers/virtio/virtio_wl.c:734:54: sparse:     got restricted __le32 *
>> drivers/virtio/virtio_wl.c:737:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] kind @@     got int @@
   drivers/virtio/virtio_wl.c:737:41: sparse:     expected restricted __le32 [usertype] kind
   drivers/virtio/virtio_wl.c:737:41: sparse:     got int
   drivers/virtio/virtio_wl.c:834:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:834:29: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:834:29: sparse:     got int
   drivers/virtio/virtio_wl.c:837:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:837:37: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:837:37: sparse:     got int
   drivers/virtio/virtio_wl.c:848:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:848:27: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:848:27: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:849:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_count @@     got unsigned int [assigned] [usertype] vfd_count @@
   drivers/virtio/virtio_wl.c:849:30: sparse:     expected restricted __le32 [usertype] vfd_count
   drivers/virtio/virtio_wl.c:849:30: sparse:     got unsigned int [assigned] [usertype] vfd_count
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

vim +737 drivers/virtio/virtio_wl.c

   597	
   598	/* this can only be called if the caller has unique ownership of the vfd */
   599	static int do_vfd_close(struct virtwl_vfd *vfd)
   600	{
   601		struct virtio_wl_ctrl_vfd *ctrl_close;
   602		struct virtwl_info *vi = vfd->vi;
   603		struct completion finish_completion;
   604		struct scatterlist out_sg;
   605		struct scatterlist in_sg;
   606		int ret = 0;
   607	
   608		ctrl_close = kzalloc(sizeof(*ctrl_close), GFP_KERNEL);
   609		if (!ctrl_close)
   610			return -ENOMEM;
   611	
 > 612		ctrl_close->hdr.type = VIRTIO_WL_CMD_VFD_CLOSE;
   613		ctrl_close->vfd_id = vfd->id;
   614	
   615		sg_init_one(&out_sg, &ctrl_close->hdr,
   616			    sizeof(struct virtio_wl_ctrl_vfd));
   617		sg_init_one(&in_sg, &ctrl_close->hdr,
   618			    sizeof(struct virtio_wl_ctrl_hdr));
   619	
   620		init_completion(&finish_completion);
   621		ret = vq_queue_out(vi, &out_sg, &in_sg, &finish_completion,
   622				   false /* block */);
   623		if (ret) {
   624			pr_warn("virtwl: failed to queue close vfd id %u: %d\n",
   625				vfd->id,
   626				ret);
   627			goto free_ctrl_close;
   628		}
   629	
   630		wait_for_completion(&finish_completion);
   631		virtwl_vfd_remove(vfd);
   632	
   633	free_ctrl_close:
   634		kfree(ctrl_close);
   635		return ret;
   636	}
   637	
   638	static ssize_t virtwl_vfd_recv(struct file *filp, char __user *buffer,
   639				       size_t len, struct virtwl_vfd **vfds,
   640				       size_t *vfd_count)
   641	{
   642		struct virtwl_vfd *vfd = filp->private_data;
   643		struct virtwl_info *vi = vfd->vi;
   644		ssize_t read_count = 0;
   645		size_t vfd_read_count = 0;
   646		bool force_to_wait = false;
   647	
   648		mutex_lock(&vi->vfds_lock);
   649		mutex_lock(&vfd->lock);
   650	
   651		while (read_count == 0 && vfd_read_count == 0) {
   652			while (force_to_wait || list_empty(&vfd->in_queue)) {
   653				force_to_wait = false;
   654				if (vfd->hungup)
   655					goto out_unlock;
   656	
   657				mutex_unlock(&vfd->lock);
   658				mutex_unlock(&vi->vfds_lock);
   659				if (filp->f_flags & O_NONBLOCK)
   660					return -EAGAIN;
   661	
   662				if (wait_event_interruptible(vfd->in_waitq,
   663					!list_empty(&vfd->in_queue) || vfd->hungup))
   664					return -ERESTARTSYS;
   665	
   666				mutex_lock(&vi->vfds_lock);
   667				mutex_lock(&vfd->lock);
   668			}
   669	
   670			read_count = vfd_out_locked(vfd, buffer, len);
   671			if (read_count < 0)
   672				goto out_unlock;
   673			if (vfds && vfd_count && *vfd_count)
   674				vfd_read_count = vfd_out_vfds_locked(vfd, vfds,
   675								     *vfd_count);
   676			else if (read_count == 0 && !list_empty(&vfd->in_queue))
   677				/*
   678				 * Indicates a corner case where the in_queue has ONLY
   679				 * incoming VFDs but the caller has given us no space to
   680				 * store them. We force a wait for more activity on the
   681				 * in_queue to prevent busy waiting.
   682				 */
   683				force_to_wait = true;
   684		}
   685	
   686	out_unlock:
   687		mutex_unlock(&vfd->lock);
   688		mutex_unlock(&vi->vfds_lock);
   689		if (vfd_count)
   690			*vfd_count = vfd_read_count;
   691		return read_count;
   692	}
   693	
   694	static int encode_vfd_ids(struct virtwl_vfd **vfds, size_t vfd_count,
   695				  __le32 *vfd_ids)
   696	{
   697		size_t i;
   698	
   699		for (i = 0; i < vfd_count; i++) {
   700			if (vfds[i])
   701				vfd_ids[i] = cpu_to_le32(vfds[i]->id);
   702			else
   703				return -EBADFD;
   704		}
   705		return 0;
   706	}
   707	
   708	#ifdef SEND_VIRTGPU_RESOURCES
   709	static int get_dma_buf_id(struct dma_buf *dma_buf, u32 *id)
   710	{
   711		uuid_t uuid;
   712		int ret = 0;
   713	
   714		ret = virtio_dma_buf_get_uuid(dma_buf, &uuid);
   715		*id = be32_to_cpu(*(__be32 *)(uuid.b + 12));
   716	
   717		return ret;
   718	}
   719	
   720	static int encode_vfd_ids_foreign(struct virtwl_vfd **vfds,
   721					  struct dma_buf **virtgpu_dma_bufs,
   722					  size_t vfd_count,
   723					  struct virtio_wl_ctrl_vfd_send_vfd *vfd_ids)
   724	{
   725		size_t i;
   726		int ret;
   727	
   728		for (i = 0; i < vfd_count; i++) {
   729			if (vfds[i]) {
   730				vfd_ids[i].kind = VIRTIO_WL_CTRL_VFD_SEND_KIND_LOCAL;
   731				vfd_ids[i].id = cpu_to_le32(vfds[i]->id);
   732			} else if (virtgpu_dma_bufs[i]) {
   733				ret = get_dma_buf_id(virtgpu_dma_bufs[i],
   734						     &vfd_ids[i].id);
   735				if (ret)
   736					return ret;
 > 737				vfd_ids[i].kind = VIRTIO_WL_CTRL_VFD_SEND_KIND_VIRTGPU;
   738			} else {
   739				return -EBADFD;
   740			}
   741		}
   742		return 0;
   743	}
   744	#endif
   745	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
