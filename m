Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5AD36D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 00:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690071810; x=1721607810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bvoYNGFn1dg7yawQ7dQ2SeCRo2dCpdWzRD/wTgrzmLY=;
  b=HsrXkmJMcY5EHN9CRT3Qx8CeVH7bdWb5Z2W0Y8d5f/7//baK7Mj/q9ho
   wpIsnrPA0f6U4F3sCHOavKbldLhqCjaz0Cah1Gp/cdQ6H9o8MJQcDmvri
   KcX7TB9LAinq14sQCCH4VoKCYtjOjbDkTqji5Gq+hI+uUyjjsa2KeXCIH
   zcnSwd3MiIAlCzhFvpcaHqELyYekv9cMxWnNp+g6//Wp6vZizn2pSpa/K
   5WV2GOq9Mp72278ampW5ua/XTgUPfIEJXqKdI9qz7dpoIPGsqJRjL4U8r
   DHa9Mipf7WEoQHnnp1Bz1a64+F2Q66GCOWsi0YH7awt9W98RBuvJMw1n2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="433470771"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="433470771"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 17:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="849214414"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="849214414"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Jul 2023 17:23:29 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNMsi-0008hV-1X;
	Sun, 23 Jul 2023 00:23:28 +0000
Date: Sun, 23 Jul 2023 08:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/virtio/virtio_wl.c:739:31: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202307230811.AiRhTCe5-lkp@intel.com>
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
commit: 4250dbcb9e0e98ab046ec557c02979b07493c691 CHROMIUM: virtwl: support sending virtgpu fences
date:   2 years, 7 months ago
config: i386-randconfig-r081-20230723 (https://download.01.org/0day-ci/archive/20230723/202307230811.AiRhTCe5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230811.AiRhTCe5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230811.AiRhTCe5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/virtio/virtio_wl.c:216:21: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:216:21: sparse:     expected unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:216:21: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:242:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:242:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:242:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:243:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:243:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:243:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:244:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:244:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:244:20: sparse:     got restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:257:39: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:257:39: sparse:     expected unsigned long id
   drivers/virtio/virtio_wl.c:257:39: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:291:42: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:291:42: sparse:     expected unsigned long id
   drivers/virtio/virtio_wl.c:291:42: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:319:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:319:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:319:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:497:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:502:26: sparse: sparse: cast from restricted __le32
   drivers/virtio/virtio_wl.c:504:46: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:528:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:533:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:571:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:577:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:615:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:615:30: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:615:30: sparse:     got int
   drivers/virtio/virtio_wl.c:616:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:616:28: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:616:28: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:735:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] kind @@     got int @@
   drivers/virtio/virtio_wl.c:735:30: sparse:     expected restricted __le32 [usertype] kind
   drivers/virtio/virtio_wl.c:735:30: sparse:     got int
   drivers/virtio/virtio_wl.c:738:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] kind @@     got int @@
   drivers/virtio/virtio_wl.c:738:30: sparse:     expected restricted __le32 [usertype] kind
   drivers/virtio/virtio_wl.c:738:30: sparse:     got int
>> drivers/virtio/virtio_wl.c:739:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] seqno @@     got restricted __le32 [usertype] @@
   drivers/virtio/virtio_wl.c:739:31: sparse:     expected restricted __le64 [usertype] seqno
   drivers/virtio/virtio_wl.c:739:31: sparse:     got restricted __le32 [usertype]
>> drivers/virtio/virtio_wl.c:777:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] kind @@     got unsigned int [assigned] [usertype] kind @@
   drivers/virtio/virtio_wl.c:777:45: sparse:     expected restricted __le32 [usertype] kind
   drivers/virtio/virtio_wl.c:777:45: sparse:     got unsigned int [assigned] [usertype] kind
   drivers/virtio/virtio_wl.c:780:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] kind @@     got unsigned int [assigned] [usertype] kind @@
   drivers/virtio/virtio_wl.c:780:48: sparse:     expected restricted __le32 [usertype] kind
   drivers/virtio/virtio_wl.c:780:48: sparse:     got unsigned int [assigned] [usertype] kind
   drivers/virtio/virtio_wl.c:893:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:893:29: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:893:29: sparse:     got int
   drivers/virtio/virtio_wl.c:904:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:904:37: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:904:37: sparse:     got int
   drivers/virtio/virtio_wl.c:916:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:916:27: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:916:27: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:917:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_count @@     got unsigned int [assigned] [usertype] vfd_count @@
   drivers/virtio/virtio_wl.c:917:30: sparse:     expected restricted __le32 [usertype] vfd_count
   drivers/virtio/virtio_wl.c:917:30: sparse:     got unsigned int [assigned] [usertype] vfd_count
   drivers/virtio/virtio_wl.c:935:45: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:935:45: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:935:45: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:967:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:967:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:967:36: sparse:     got int
   drivers/virtio/virtio_wl.c:968:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:968:34: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:968:34: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:969:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned int [usertype] flags @@
   drivers/virtio/virtio_wl.c:969:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:969:33: sparse:     got unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1138:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:1138:26: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:1138:26: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:1141:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1141:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1141:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1142:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1142:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1142:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1145:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1145:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1145:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1146:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1146:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1146:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1150:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1150:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1150:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1151:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] size @@     got unsigned int @@
   drivers/virtio/virtio_wl.c:1151:32: sparse:     expected restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1151:32: sparse:     got unsigned int
   drivers/virtio/virtio_wl.c:1154:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1154:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1154:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1155:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1155:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1155:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1158:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1158:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1158:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1159:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1159:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1159:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1164:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1164:44: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1164:44: sparse:     got int
   drivers/virtio/virtio_wl.c:1186:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:1186:44: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:1186:44: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1190:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:1190:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:1190:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1191:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:1191:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:1191:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:1192:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:1192:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1192:20: sparse:     got restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1418:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/virtio/virtio_wl.c:1418:17: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/virtio/virtio_wl.c:1418:17: sparse:     got unsigned int ( * )( ... )

vim +739 drivers/virtio/virtio_wl.c

   722	
   723	static int encode_fence(struct dma_fence *fence,
   724				struct virtio_wl_ctrl_vfd_send_vfd_v2 *vfd_id)
   725	{
   726		const char *name = fence->ops->get_driver_name(fence);
   727	
   728		// We only support virtgpu based fences. Since all virtgpu fences are
   729		// in the same context, merging sync_files will always reduce to a
   730		// single virtgpu fence.
   731		if (strcmp(name, "virtio_gpu") != 0)
   732			return -EBADFD;
   733	
   734		if (dma_fence_is_signaled(fence)) {
   735			vfd_id->kind =
   736				VIRTIO_WL_CTRL_VFD_SEND_KIND_VIRTGPU_SIGNALED_FENCE;
   737		} else {
   738			vfd_id->kind = VIRTIO_WL_CTRL_VFD_SEND_KIND_VIRTGPU_FENCE;
 > 739			vfd_id->seqno = cpu_to_le32(fence->seqno);
   740		}
   741		return 0;
   742	}
   743	
   744	static int encode_vfd_ids_foreign(struct virtwl_vfd **vfds,
   745					  struct dma_buf **virtgpu_dma_bufs,
   746					  struct dma_fence **virtgpu_dma_fence,
   747					  size_t vfd_count,
   748					  struct virtio_wl_ctrl_vfd_send_vfd *ids,
   749					  struct virtio_wl_ctrl_vfd_send_vfd_v2 *ids_v2)
   750	{
   751		size_t i;
   752		int ret;
   753	
   754		for (i = 0; i < vfd_count; i++) {
   755			uint32_t kind = UINT_MAX;
   756			uint32_t id = 0;
   757	
   758			if (vfds[i]) {
   759				kind = VIRTIO_WL_CTRL_VFD_SEND_KIND_LOCAL;
   760				id = vfds[i]->id;
   761			} else if (virtgpu_dma_bufs[i]) {
   762				ret = get_dma_buf_id(virtgpu_dma_bufs[i],
   763						     &id);
   764				if (ret)
   765					return ret;
   766				kind = VIRTIO_WL_CTRL_VFD_SEND_KIND_VIRTGPU;
   767			} else if (virtgpu_dma_fence[i]) {
   768				ret = encode_fence(virtgpu_dma_fence[i],
   769						   ids_v2 + i);
   770				if (ret)
   771					return ret;
   772			} else {
   773				return -EBADFD;
   774			}
   775			if (kind != UINT_MAX) {
   776				if (ids) {
 > 777					ids[i].kind = kind;
   778					ids[i].id = cpu_to_le32(id);
   779				} else {
   780					ids_v2[i].kind = kind;
   781					ids_v2[i].id = cpu_to_le32(id);
   782				}
   783			}
   784		}
   785		return 0;
   786	}
   787	#endif
   788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
