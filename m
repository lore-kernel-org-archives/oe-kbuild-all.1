Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FA37B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 04:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681619524; x=1713155524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z8x+/0VHhdhz3hlyITWYBi0KQKi25SsWnrQQAjnJJwg=;
  b=RFyToCzBzTXyrIS5b+rNa2F8MaYvFcJ9Ocq58BdopLv9ls16OgwQ2ahO
   etkwknmCtebeeH4DF/SwnJFbdn/azyRHC5NQsKY4Pit4+UFVHW0fAgVC7
   L8GWtV02rp4wJmhPCfVYSfIhI8kQMh6yl7kIgwGbtLg9sT2cFB4GOuVCy
   1qO2TheRxP9tJQIkz4PTrZskUCp+XMFW576onUVLXqQl9JAClPKjIjRJo
   /TJlqsIRbhW177RKvvSEC0FramoQBkUqTAjh6IvmM01pJpKK11jK6qTgg
   5KFO3zj8MxtDyYryxFrAxCk+YZ0ALL0ghpxF+8l7zbnJkfcdXPafVacdL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="346546718"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="346546718"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 21:32:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="667743560"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="667743560"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 Apr 2023 21:32:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnu3U-000bW7-2Q;
	Sun, 16 Apr 2023 04:32:00 +0000
Date: Sun, 16 Apr 2023 12:31:47 +0800
From: kernel test robot <lkp@intel.com>
To: Xingui Yang <yangxingui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Qi Liu <liuqi115@huawei.com>, John Garry <john.garry@huawei.com>
Subject: drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:2168:43: sparse: sparse:
 restricted __le32 degrades to integer
Message-ID: <202304161254.NztCVZIO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3e7bb4f2461710b70887704af7f175383251088e
commit: 62413199cd6d2906c121c2dfa3d7b82fd05f08db scsi: hisi_sas: Modify v3 HW SSP underflow error processing
date:   1 year, 2 months ago
config: ia64-randconfig-s043-20230416 (https://download.01.org/0day-ci/archive/20230416/202304161254.NztCVZIO-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=62413199cd6d2906c121c2dfa3d7b82fd05f08db
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 62413199cd6d2906c121c2dfa3d7b82fd05f08db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/scsi/hisi_sas/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304161254.NztCVZIO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:2168:43: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:2169:46: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4427:35: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __le32 [usertype] *[assigned] ptr @@     got unsigned int * @@
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4427:35: sparse:     expected restricted __le32 [usertype] *[assigned] ptr
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4427:35: sparse:     got unsigned int *

vim +2168 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c

  2144	
  2145	static bool
  2146	slot_err_v3_hw(struct hisi_hba *hisi_hba, struct sas_task *task,
  2147		       struct hisi_sas_slot *slot)
  2148	{
  2149		struct task_status_struct *ts = &task->task_status;
  2150		struct hisi_sas_complete_v3_hdr *complete_queue =
  2151				hisi_hba->complete_hdr[slot->cmplt_queue];
  2152		struct hisi_sas_complete_v3_hdr *complete_hdr =
  2153				&complete_queue[slot->cmplt_queue_slot];
  2154		struct hisi_sas_err_record_v3 *record =
  2155				hisi_sas_status_buf_addr_mem(slot);
  2156		u32 dma_rx_err_type = le32_to_cpu(record->dma_rx_err_type);
  2157		u32 trans_tx_fail_type = le32_to_cpu(record->trans_tx_fail_type);
  2158		u32 dw3 = le32_to_cpu(complete_hdr->dw3);
  2159	
  2160		switch (task->task_proto) {
  2161		case SAS_PROTOCOL_SSP:
  2162			if (dma_rx_err_type & RX_DATA_LEN_UNDERFLOW_MSK) {
  2163				/*
  2164				 * If returned response frame is incorrect because of data underflow,
  2165				 * but I/O information has been written to the host memory, we examine
  2166				 * response IU.
  2167				 */
> 2168				if (!(complete_hdr->dw0 & CMPLT_HDR_RSPNS_GOOD_MSK) &&
  2169					(complete_hdr->dw0 & CMPLT_HDR_RSPNS_XFRD_MSK))
  2170					return false;
  2171	
  2172				ts->residual = trans_tx_fail_type;
  2173				ts->stat = SAS_DATA_UNDERRUN;
  2174			} else if (dw3 & CMPLT_HDR_IO_IN_TARGET_MSK) {
  2175				ts->stat = SAS_QUEUE_FULL;
  2176				slot->abort = 1;
  2177			} else {
  2178				ts->stat = SAS_OPEN_REJECT;
  2179				ts->open_rej_reason = SAS_OREJ_RSVD_RETRY;
  2180			}
  2181			break;
  2182		case SAS_PROTOCOL_SATA:
  2183		case SAS_PROTOCOL_STP:
  2184		case SAS_PROTOCOL_SATA | SAS_PROTOCOL_STP:
  2185			if (dma_rx_err_type & RX_DATA_LEN_UNDERFLOW_MSK) {
  2186				ts->residual = trans_tx_fail_type;
  2187				ts->stat = SAS_DATA_UNDERRUN;
  2188			} else if (dw3 & CMPLT_HDR_IO_IN_TARGET_MSK) {
  2189				ts->stat = SAS_PHY_DOWN;
  2190				slot->abort = 1;
  2191			} else {
  2192				ts->stat = SAS_OPEN_REJECT;
  2193				ts->open_rej_reason = SAS_OREJ_RSVD_RETRY;
  2194			}
  2195			hisi_sas_sata_done(task, slot);
  2196			break;
  2197		case SAS_PROTOCOL_SMP:
  2198			ts->stat = SAS_SAM_STAT_CHECK_CONDITION;
  2199			break;
  2200		default:
  2201			break;
  2202		}
  2203		return true;
  2204	}
  2205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
