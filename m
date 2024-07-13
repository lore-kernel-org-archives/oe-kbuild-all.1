Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DD1846F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 07:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720855932; cv=none; b=utL2v0j2BeuI0ZikJBW9R7LnICBdM0glBz3aNdOt8M2LdOfuT33/8Mo3FNRaXZx5hkWRzsYqPj/SnaV18U0atVLS6TjjfVyybtuMcMrQ7K8uMfLGzju9ufbTeQjp+QCS01KEzLhDxmVgbYYjMZO8Ni/uoaeV0IHI4aP153SLO8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720855932; c=relaxed/simple;
	bh=Zhd7VeAoA2ZhVMF7vSIVDPXTQZWIEttpDKFKFP0ameI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ml48k0RT9oUXkdBoIS4n2498tCt8TnpNj+zUfY2JDjcsSDVzNr5hg0kqUjWu/MNH86vgeaavXrIqW4pD+w6D5IZVke5yhLXBtWMMKZzm6+KXhHKNbHD0DHsxsBj6kwCqIZKjyhJr1jHMaEMbOvtXBAuWntRn6jvFl9ewAs7hzfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hF0BcDBW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hF0BcDBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720855930; x=1752391930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zhd7VeAoA2ZhVMF7vSIVDPXTQZWIEttpDKFKFP0ameI=;
  b=hF0BcDBWEEymWhEhhw96jxEpZ2tEZ7RjD151CgXrs1ruUiWqs6zHT/Cw
   slqGutuJvXMa0T9JW1E4/od4aZHWZbpicUglO19wmLbrxT5IqV/MhejT3
   D7P+QGr7eT5bENWNtAH0pROVSexjLNr++Q/rAVpighTZ0x7Z9K6JDR+OJ
   cpVkg70SvCgDroioaSgkUW7Igl6kga9tE05Uz4vFkTLagApVQJvClOsT6
   ikAtznIbQnJlLLNcbOedT859mgNMsjUDspLZ5jGk23/xg+PzELlUCXlU+
   zs2vP9YC3yEPXQDgLmzGLxcUAFRTepxjsQ8Nl8oW5puyO7vJDcprX1xJC
   A==;
X-CSE-ConnectionGUID: WznupZ76Tiqvz223XxcHiQ==
X-CSE-MsgGUID: BycepgQyTN6fMEIyNF3fXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18148807"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="18148807"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 00:32:09 -0700
X-CSE-ConnectionGUID: toYOczTIT8O8vpey96dSbw==
X-CSE-MsgGUID: y1PPaILHSxOrjlmRkkLZNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="49010086"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jul 2024 00:32:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSXEk-000bpw-0B;
	Sat, 13 Jul 2024 07:32:06 +0000
Date: Sat, 13 Jul 2024 15:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-remove-slave-configure 2/3]
 drivers/scsi/lpfc/lpfc_scsi.c:6348: warning: Function parameter or struct
 member 'lim' not described in 'lpfc_device_configure'
Message-ID: <202407131544.tiNF6suN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux scsi-remove-slave-configure
head:   3cf2ba5bb279edd16bd1606f4feb0a3bd87a5700
commit: 32e1b2bc5a1ba0efdc927a21ed513341c7b91660 [2/3] scsi: Rename .slave_configure() into .device_configure()
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240713/202407131544.tiNF6suN-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131544.tiNF6suN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407131544.tiNF6suN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/lpfc/lpfc_scsi.c:6348: warning: Function parameter or struct member 'lim' not described in 'lpfc_device_configure'


vim +6348 drivers/scsi/lpfc/lpfc_scsi.c

dea3101e0a5c89 James Bottomley        2005-04-17  6334  
9bad76719ee4fa James Smart            2008-12-04  6335  /**
32e1b2bc5a1ba0 Bart Van Assche        2024-07-12  6336   * lpfc_device_configure - scsi_host_template device_configure entry point
9bad76719ee4fa James Smart            2008-12-04  6337   * @sdev: Pointer to scsi_device.
9bad76719ee4fa James Smart            2008-12-04  6338   *
9bad76719ee4fa James Smart            2008-12-04  6339   * This routine configures following items
9bad76719ee4fa James Smart            2008-12-04  6340   *   - Tag command queuing support for @sdev if supported.
9bad76719ee4fa James Smart            2008-12-04  6341   *   - Enable SLI polling for fcp ring if ENABLE_FCP_RING_POLLING flag is set.
9bad76719ee4fa James Smart            2008-12-04  6342   *
9bad76719ee4fa James Smart            2008-12-04  6343   * Return codes:
9bad76719ee4fa James Smart            2008-12-04  6344   *   0 - Success
9bad76719ee4fa James Smart            2008-12-04  6345   **/
dea3101e0a5c89 James Bottomley        2005-04-17  6346  static int
32e1b2bc5a1ba0 Bart Van Assche        2024-07-12  6347  lpfc_device_configure(struct scsi_device *sdev, struct queue_limits *lim)
dea3101e0a5c89 James Bottomley        2005-04-17 @6348  {
2e0fef85e098f6 James Smart            2007-06-17  6349  	struct lpfc_vport *vport = (struct lpfc_vport *) sdev->host->hostdata;
2e0fef85e098f6 James Smart            2007-06-17  6350  	struct lpfc_hba   *phba = vport->phba;
dea3101e0a5c89 James Bottomley        2005-04-17  6351  
db5ed4dfd5dd01 Christoph Hellwig      2014-11-13  6352  	scsi_change_queue_depth(sdev, vport->cfg_lun_queue_depth);
dea3101e0a5c89 James Bottomley        2005-04-17  6353  
875fbdfe9b1b4c James.Smart@Emulex.Com 2005-11-29  6354  	if (phba->cfg_poll & ENABLE_FCP_RING_POLLING) {
45ed119035b27f James Smart            2009-10-02  6355  		lpfc_sli_handle_fast_ring_event(phba,
895427bd012ce5 James Smart            2017-02-12  6356  			&phba->sli.sli3_ring[LPFC_FCP_RING], HA_R0RE_REQ);
875fbdfe9b1b4c James.Smart@Emulex.Com 2005-11-29  6357  		if (phba->cfg_poll & DISABLE_FCP_RING_INT)
875fbdfe9b1b4c James.Smart@Emulex.Com 2005-11-29  6358  			lpfc_poll_rearm_timer(phba);
875fbdfe9b1b4c James.Smart@Emulex.Com 2005-11-29  6359  	}
875fbdfe9b1b4c James.Smart@Emulex.Com 2005-11-29  6360  
dea3101e0a5c89 James Bottomley        2005-04-17  6361  	return 0;
dea3101e0a5c89 James Bottomley        2005-04-17  6362  }
dea3101e0a5c89 James Bottomley        2005-04-17  6363  

:::::: The code at line 6348 was first introduced by commit
:::::: dea3101e0a5c897d2c9351a7444e139db9f40247 lpfc: add Emulex FC driver version 8.0.28

:::::: TO:  <jejb@titanic.il.steeleye.com>
:::::: CC: James Bottomley <jejb@titanic>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
