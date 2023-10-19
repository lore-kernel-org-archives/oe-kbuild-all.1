Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1D0208B8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 20:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OC2oE6L3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697748873; x=1729284873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Up9u6kqath4IN4sOz2KOqEBzCO1cvT+/95yte1nqXcA=;
  b=OC2oE6L3gn3GZqKJQ+AYT6Bptuivu36kGM9yferm2VkyQuBk2UIpGjb6
   59vfpZ8g7UQeyoZWjkcd1/V0ZgyVOT/Txc4vfOlWnI+Anroshz/AaHmWi
   K+4N3s25Iasepsh6PyFCTwvASy5aUgJ0KPxpyTqLr34ikK/y2XnJyqd4z
   g55m05kyFLxVfiNZn62k98oe554slnGDFMMGSeIh1gGuHrdqmjF3IImFN
   qX/MCMHT7Wwj2G96QpBTdUkt9TaMC6fGa7gimlH09gP0C/sfBDeVo3ajl
   QMuUtm4jhK7q9jCzXF7rtqPsKJB5ZOsZQ72rU/BJknLwgTb1xnHcuJo0e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="4974246"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="4974246"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 13:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="822978412"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="822978412"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 19 Oct 2023 13:54:30 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qta2G-0002ac-0Z;
	Thu, 19 Oct 2023 20:54:28 +0000
Date: Fri, 20 Oct 2023 04:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:eh-rework.v6 22/26]
 drivers/scsi/scsi_error.c:1277:6: warning: no previous declaration for
 '__scsi_eh_finish_cmd'
Message-ID: <202310200425.uz5gvV0U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git eh-rework.v6
head:   1e93963cdc1f4d2671b12c37a09b861f40313768
commit: 043bb4700d22ea8d579b0e8e24e7fee68e4a11ca [22/26] scsi: set host byte after EH completed
config: i386-buildonly-randconfig-001-20231020 (https://download.01.org/0day-ci/archive/20231020/202310200425.uz5gvV0U-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200425.uz5gvV0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200425.uz5gvV0U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/scsi_error.c:1277:6: warning: no previous declaration for '__scsi_eh_finish_cmd' [-Wmissing-declarations]
    void __scsi_eh_finish_cmd(struct scsi_cmnd *scmd, struct list_head *done_q,
         ^~~~~~~~~~~~~~~~~~~~


vim +/__scsi_eh_finish_cmd +1277 drivers/scsi/scsi_error.c

  1263	
  1264	/**
  1265	 * __scsi_eh_finish_cmd - Handle a cmd that eh is finished with.
  1266	 * @scmd:	Original SCSI cmd that eh has finished.
  1267	 * @done_q:	Queue for processed commands.
  1268	 * @host_byte:	Host byte of the command status to be set
  1269	 *
  1270	 * Notes:
  1271	 *    We don't want to use the normal command completion while we are are
  1272	 *    still handling errors - it may cause other commands to be queued,
  1273	 *    and that would disturb what we are doing.  Thus we really want to
  1274	 *    keep a list of pending commands for final completion, and once we
  1275	 *    are ready to leave error handling we handle completion for real.
  1276	 */
> 1277	void __scsi_eh_finish_cmd(struct scsi_cmnd *scmd, struct list_head *done_q,
  1278				int host_byte)
  1279	{
  1280		if (host_byte)
  1281			set_host_byte(scmd, host_byte);
  1282		list_move_tail(&scmd->eh_entry, done_q);
  1283	}
  1284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
