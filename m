Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03C81376
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 23:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696287897; x=1727823897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FlUefRAwbRqNEgLlBFlGFpW/fybEZxrmSu+chbPQhk0=;
  b=BEEPeWjghQdCdXOGZRTOHS9zWoMDsSU0YKfZAHwM77/+bNl7mLXJSar9
   z8KSFhdfy+hYaEjMqUl2nMr8b6tM+ciO5UDLSEUrjdDxspqJyNPL9/GYF
   0Rj5OlLeMdzNgM52cky3VX5RAVAjwCHgljO5HvyDvVHAXncj8jRs4W4rB
   lRQh2vGGhOXgPsARmdnFKb/Z1tZAyHwYoOlN2PoUGvFKyGiIWNQpZsdiE
   tZmOb5XksW6ObOVAmxura/AUZ1H8R+O1gNCixf7eu5t3ouqPNgzoJzQvz
   4hJVusO6V2LLoSAOTw0xzOs9rq9kdt2PYIxUsRJWJDRGgy7Rq7PII3K64
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="449246916"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="449246916"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 16:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="866648059"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="866648059"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 02 Oct 2023 16:04:55 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnRy9-0006Ub-2d;
	Mon, 02 Oct 2023 23:04:53 +0000
Date: Tue, 3 Oct 2023 07:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:eh-rework.v5 37/40]
 drivers/scsi/scsi_error.c:1277:6: warning: no previous prototype for
 '__scsi_eh_finish_cmd'
Message-ID: <202310030633.aZa54kUS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git eh-rework.v5
head:   2b7934b02ad769f5384351ef79c4d6b0cde694e3
commit: 14d6e82a8650383a8699e4ed5c8588bf9a07a582 [37/40] scsi: Use scsi_device as argument to eh_device_reset_handler()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310030633.aZa54kUS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030633.aZa54kUS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030633.aZa54kUS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/scsi_error.c:1277:6: warning: no previous prototype for '__scsi_eh_finish_cmd' [-Wmissing-prototypes]
    1277 | void __scsi_eh_finish_cmd(struct scsi_cmnd *scmd, struct list_head *done_q,
         |      ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/scsi/scsi_error.c:1279: warning: Function parameter or member 'host_byte' not described in '__scsi_eh_finish_cmd'
>> drivers/scsi/scsi_error.c:1279: warning: expecting prototype for scsi_eh_finish_cmd(). Prototype was for __scsi_eh_finish_cmd() instead


vim +/__scsi_eh_finish_cmd +1277 drivers/scsi/scsi_error.c

  1263	
  1264	/**
  1265	 * scsi_eh_finish_cmd - Handle a cmd that eh is finished with.
  1266	 * @scmd:	Original SCSI cmd that eh has finished.
  1267	 * @done_q:	Queue for processed commands.
  1268	 * @result:	Final command status to be set
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
> 1279	{
  1280		if (host_byte)
  1281			set_host_byte(scmd, host_byte);
  1282		list_move_tail(&scmd->eh_entry, done_q);
  1283	}
  1284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
