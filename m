Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87704368
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 00:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693268969; x=1724804969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pm+zvhQ2M2yBB2/9mqHXcQt5+VqlLoqBNfGuJwnKkBQ=;
  b=LEh0oFmljfmPkd/pNvv6/pmwx8n1Ri9fLN9dOhnA64k00aoiC38xXiaG
   bqzVeAj5Jr46d1cuiyDnGYT6GunGlCcIRTO4JCghdfURc1qq25mDlvMD3
   kl2dOkcR1aUpfy/XAg8zFp/14hEJC4E7lEvT2yX6ilWEZV51wM6D9iNDJ
   A8lYk0BpZ6hiMSOmIRCRNRpujAAQI9AC33WAk48aonzvSoc6C8Q0alpBt
   xaS1ZN+xdH35LsjivYJ+3pY24Z8awCuZA7nGMjMeE8YnlZkAP8NyycHC5
   OdxPs5W8OJ4dBvwAKDHnjangbcRrJyPjwh33PrI+t/19IknK2MKNWAqVv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="360243610"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="360243610"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 17:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="741609049"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="741609049"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Aug 2023 17:29:27 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qambm-0008ER-2A;
	Tue, 29 Aug 2023 00:29:26 +0000
Date: Tue, 29 Aug 2023 08:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: Nilesh Javali <njavali@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [linux-next:master 12741/13109]
 drivers/scsi/qla2xxx/qla_nvme.c:1183:20: warning: unused variable 'fcport'
Message-ID: <202308290833.sKkoSSeO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ee82481c392eec06a7ef28df61b7f0d8e45be2e
commit: 27177862de9676c8c35b86bf89c38864fbe5ed71 [12741/13109] scsi: qla2xxx: Fix nvme_fc_rcv_ls_req() undefined error
config: microblaze-randconfig-r024-20230829 (https://download.01.org/0day-ci/archive/20230829/202308290833.sKkoSSeO-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308290833.sKkoSSeO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290833.sKkoSSeO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/qla2xxx/qla_nvme.c: In function 'qla2xxx_process_purls_pkt':
>> drivers/scsi/qla2xxx/qla_nvme.c:1183:20: warning: unused variable 'fcport' [-Wunused-variable]
    1183 |         fc_port_t *fcport = uctx->fcport;
         |                    ^~~~~~


vim +/fcport +1183 drivers/scsi/qla2xxx/qla_nvme.c

875386b9885782 Manish Rangankar 2023-08-21  1167  
875386b9885782 Manish Rangankar 2023-08-21  1168  /*
875386b9885782 Manish Rangankar 2023-08-21  1169   * qla2xxx_process_purls_pkt() - Pass-up Unsolicited
875386b9885782 Manish Rangankar 2023-08-21  1170   * Received FC-NVMe Link Service pkt to nvme_fc_rcv_ls_req().
875386b9885782 Manish Rangankar 2023-08-21  1171   * LLDD need to provide memory for response buffer, which
875386b9885782 Manish Rangankar 2023-08-21  1172   * will be used to reference the exchange corresponding
875386b9885782 Manish Rangankar 2023-08-21  1173   * to the LS when issuing an ls response. LLDD will have to free
875386b9885782 Manish Rangankar 2023-08-21  1174   * response buffer in lport->ops->xmt_ls_rsp().
875386b9885782 Manish Rangankar 2023-08-21  1175   *
875386b9885782 Manish Rangankar 2023-08-21  1176   * @vha: SCSI qla host
875386b9885782 Manish Rangankar 2023-08-21  1177   * @item: ptr to purex_item
875386b9885782 Manish Rangankar 2023-08-21  1178   */
875386b9885782 Manish Rangankar 2023-08-21  1179  static void
875386b9885782 Manish Rangankar 2023-08-21  1180  qla2xxx_process_purls_pkt(struct scsi_qla_host *vha, struct purex_item *item)
875386b9885782 Manish Rangankar 2023-08-21  1181  {
875386b9885782 Manish Rangankar 2023-08-21  1182  	struct qla_nvme_unsol_ctx *uctx = item->purls_context;
875386b9885782 Manish Rangankar 2023-08-21 @1183  	fc_port_t *fcport = uctx->fcport;
875386b9885782 Manish Rangankar 2023-08-21  1184  	struct qla_nvme_lsrjt_pt_arg a;
27177862de9676 Nilesh Javali    2023-08-24  1185  	int ret = 1;
875386b9885782 Manish Rangankar 2023-08-21  1186  

:::::: The code at line 1183 was first introduced by commit
:::::: 875386b98857822b77ac7f95bdf367b70af5b78c scsi: qla2xxx: Add Unsolicited LS Request and Response Support for NVMe

:::::: TO: Manish Rangankar <mrangankar@marvell.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
