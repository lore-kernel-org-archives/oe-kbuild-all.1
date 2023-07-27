Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C4117AC4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 21:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690494991; x=1722030991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wpk82ysSeFnyUZUShNNBYpi2DaVb+3JvFAnuf4G1l+4=;
  b=D0wlRawEiDlRbzfatpFqCAU6t5NJ4WMnH2iM2EldsY2Ci9FFKpJ7StT8
   0kaWL2DGfZ/B+hTiVHp9E3JvkE8cZPuHLLa6AIU1Y6eKKZj7HV4xqgTMO
   EPQIEgEPwZFxCH7TWrPZkS/p1vNeirLNlQkwTYcDVZWI6pxRHJXqejaV/
   3be6oZ0nE7AGfMrtNIgU2cmaa6ySPvBtOU9m0C6bHGRbkUFj+iJY+etpI
   w8na2EVNd8Kd2z3q5s1tKHEp9VGCaG0tj5FiRNizdbDGW9lGjiN5pVGGm
   J3zplLVQcQ5wM2mZ4GOsvx0Efy9A1hQbU4XjuVXFZHeAg0BBDoALHosGa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353350486"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="353350486"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 14:56:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="900995018"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="900995018"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 14:56:25 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP8y8-0002ct-2W;
	Thu, 27 Jul 2023 21:56:24 +0000
Date: Fri, 28 Jul 2023 05:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>, Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-block@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Avri Altman <avri.altman@wdc.com>, Ming Lei <ming.lei@redhat.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Can Guo <quic_cang@quicinc.com>,
	Asutosh Das <quic_asutoshd@quicinc.com>,
	"Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
	Bean Huo <beanhuo@micron.com>,
	Arthur Simchaev <Arthur.Simchaev@wdc.com>
Subject: Re: [PATCH v4 6/7] scsi: ufs: Disable zone write locking
Message-ID: <202307280537.bj45anmo-lkp@intel.com>
References: <20230726193440.1655149-7-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726193440.1655149-7-bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.5-rc3]
[cannot apply to mkp-scsi/for-next jejb-scsi/for-next next-20230727]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/block-Introduce-the-flag-QUEUE_FLAG_NO_ZONE_WRITE_LOCK/20230727-033820
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230726193440.1655149-7-bvanassche%40acm.org
patch subject: [PATCH v4 6/7] scsi: ufs: Disable zone write locking
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230728/202307280537.bj45anmo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280537.bj45anmo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307280537.bj45anmo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/core/ufshcd.c:4340:6: warning: no previous prototype for 'ufshcd_update_no_zone_write_lock' [-Wmissing-prototypes]
    4340 | void ufshcd_update_no_zone_write_lock(struct ufs_hba *hba,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ufshcd_update_no_zone_write_lock +4340 drivers/ufs/core/ufshcd.c

  4339	
> 4340	void ufshcd_update_no_zone_write_lock(struct ufs_hba *hba,
  4341					      bool set_no_zone_write_lock)
  4342	{
  4343		struct scsi_device *sdev;
  4344	
  4345		shost_for_each_device(sdev, hba->host)
  4346			blk_freeze_queue_start(sdev->request_queue);
  4347		shost_for_each_device(sdev, hba->host) {
  4348			struct request_queue *q = sdev->request_queue;
  4349	
  4350			blk_mq_freeze_queue_wait(q);
  4351			if (set_no_zone_write_lock)
  4352				blk_queue_flag_set(QUEUE_FLAG_NO_ZONE_WRITE_LOCK, q);
  4353			else
  4354				blk_queue_flag_clear(QUEUE_FLAG_NO_ZONE_WRITE_LOCK, q);
  4355			blk_mq_unfreeze_queue(q);
  4356		}
  4357	}
  4358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
