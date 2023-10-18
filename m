Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F00A15AFE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 11:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aqfzwzy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697628099; x=1729164099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r6dVqWWmSayqUq9Nu7FXUft/lWJCnhEhxmJySsICjcQ=;
  b=Aqfzwzy0yNqELSK2tWA3uew7Jkd247dsrobF55u+uGsIPs+rqztlkAct
   DYK6qt1wcAkZXU3vUYR6lWfxqQihy8b0H/WOxD4P69RTvUZistWSyk2xs
   +wyhwPOH9FIQafQqY8LyI9b9O4n/Assc4BPlByqyOrOLEh51blmppwdtz
   SDdqb0LQZc3nOTxun8usGK058sF+tCzDAIcml/MxUTp7yd3UdY+MIk44C
   uKvU563we+ar0Q7lHRly46AUb68vcL+aEMAgxwrdbxTl03Y6PeKbtZQBa
   dfnhYkgTfRFlmh1OJI2t4CkI20L16r2l9GbyZWJqY2aFF7uJ8HwVhu/i0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="365341507"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="365341507"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 04:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="1003777738"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="1003777738"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Oct 2023 04:21:36 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt4cI-0000Hs-11;
	Wed, 18 Oct 2023 11:21:34 +0000
Date: Wed, 18 Oct 2023 19:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Karan Tilak Kumar <kartilak@cisco.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	Arulprabhu Ponnusamy <arulponn@cisco.com>
Subject: drivers/scsi/fnic/fnic_scsi.c:98:38: warning: array subscript -1 is
 outside array bounds of 'struct scsi_cmnd[23529010298098917]'
Message-ID: <202310181947.fzMfU0gi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06dc10eae55b5ceabfef287a7e5f16ceea204aa0
commit: 514f0c400bde6b62405467daaf2a0a86bcf7794b scsi: fnic: Fix sg_reset success path
date:   3 weeks ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310181947.fzMfU0gi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181947.fzMfU0gi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181947.fzMfU0gi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'fnic_io_lock_hash',
       inlined from 'fnic_fcpio_itmf_cmpl_handler' at drivers/scsi/fnic/fnic_scsi.c:1086:13:
>> drivers/scsi/fnic/fnic_scsi.c:98:38: warning: array subscript -1 is outside array bounds of 'struct scsi_cmnd[23529010298098917]' [-Warray-bounds]
      98 |         u32 hash = scsi_cmd_to_rq(sc)->tag & (FNIC_IO_LOCKS - 1);
         |                    ~~~~~~~~~~~~~~~~~~^~~~~
>> drivers/scsi/fnic/fnic_scsi.c:98:38: warning: array subscript -1 is outside array bounds of 'struct scsi_cmnd[23529010298098917]' [-Warray-bounds]
>> drivers/scsi/fnic/fnic_scsi.c:98:38: warning: array subscript -1 is outside array bounds of 'struct scsi_cmnd[23529010298098917]' [-Warray-bounds]
>> drivers/scsi/fnic/fnic_scsi.c:98:38: warning: array subscript -1 is outside array bounds of 'struct scsi_cmnd[23529010298098917]' [-Warray-bounds]


vim +98 drivers/scsi/fnic/fnic_scsi.c

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   94  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   95  static inline spinlock_t *fnic_io_lock_hash(struct fnic *fnic,
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   96  					    struct scsi_cmnd *sc)
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   97  {
e1c9f0cfac4f2e Bart Van Assche   2021-08-09  @98  	u32 hash = scsi_cmd_to_rq(sc)->tag & (FNIC_IO_LOCKS - 1);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   99  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  100  	return &fnic->io_req_lock[hash];
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  101  }
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  102  

:::::: The code at line 98 was first introduced by commit
:::::: e1c9f0cfac4f2ed2bc6e89f2f4061dcf1538d4cd scsi: fnic: Use scsi_cmd_to_rq() instead of scsi_cmnd.request

:::::: TO: Bart Van Assche <bvanassche@acm.org>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
