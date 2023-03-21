Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4B829AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 16:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679416240; x=1710952240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jsy1VVQn7tpjW8CEXXvt0gKhugdodBZcYZ4DbUHG08U=;
  b=GUMSxEk1bqjtKTbYycARsiEHPGEh/c37u/zwO+zLGvjMRF7KHAu2qUqR
   TOGJpUJcx8p6IMCiABuuwRsz0W2azOQTa1MQjO69oagLUJvu6uKVfsTFq
   A365z7PaXTtdDMQmGNsW8Kcd1TO+dKzb6TCnarGa8lCmaiAFIBKHb+k4O
   5etP7F0lvw/ATi4euHyCTBF4WxWKglw8MvIC4Mh6z6H+0CZZ1cv5AVOQi
   IU5eUmM9WYErSWs5UrqoyJMkL7WPPbDURHRLLWeGrOnaxS/j4qruFe/XT
   c4F0ZfWRM5FNzlQHxlfA9lrcTokC4oyaQxs1gBcuzLLHBSUQPbtyX9nvm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="319383893"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="319383893"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 09:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="745923373"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="745923373"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Mar 2023 09:30:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peesg-000C9W-3A;
	Tue, 21 Mar 2023 16:30:38 +0000
Date: Wed, 22 Mar 2023 00:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: alikernel-developer@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alibaba-cloud:linux-next 6559/9999]
 drivers/virtio/virtio_balloon.c:163:5: warning: no previous prototype for
 'virtballoon_free_page_report'
Message-ID: <202303220017.b1jaicBC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alibaba/cloud-kernel.git linux-next
head:   d121e0c25d1a19485d7f293b67901462bb1a6552
commit: 671b4f344c85141b26aefca5aa012a58e8f729d1 [6559/9999] virtio-balloon: add support for providing free page reports to host
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230322/202303220017.b1jaicBC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/alibaba/cloud-kernel/commit/671b4f344c85141b26aefca5aa012a58e8f729d1
        git remote add alibaba-cloud https://github.com/alibaba/cloud-kernel.git
        git fetch --no-tags alibaba-cloud linux-next
        git checkout 671b4f344c85141b26aefca5aa012a58e8f729d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/infiniband/core/ drivers/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220017.b1jaicBC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_balloon.c:163:5: warning: no previous prototype for 'virtballoon_free_page_report' [-Wmissing-prototypes]
     163 | int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_info,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/virtballoon_free_page_report +163 drivers/virtio/virtio_balloon.c

   162	
 > 163	int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_info,
   164					   struct scatterlist *sg, unsigned int nents)
   165	{
   166		struct virtio_balloon *vb =
   167			container_of(pr_dev_info, struct virtio_balloon, pr_dev_info);
   168		struct virtqueue *vq = vb->reporting_vq;
   169		unsigned int unused, err;
   170	
   171		/* We should always be able to add these buffers to an empty queue. */
   172		err = virtqueue_add_inbuf(vq, sg, nents, vb, GFP_NOWAIT | __GFP_NOWARN);
   173	
   174		/*
   175		 * In the extremely unlikely case that something has occurred and we
   176		 * are able to trigger an error we will simply display a warning
   177		 * and exit without actually processing the pages.
   178		 */
   179		if (WARN_ON_ONCE(err))
   180			return err;
   181	
   182		virtqueue_kick(vq);
   183	
   184		/* When host has read buffer, this completes via balloon_ack */
   185		wait_event(vb->acked, virtqueue_get_buf(vq, &unused));
   186	
   187		return 0;
   188	}
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
