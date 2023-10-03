Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11544EA3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 03:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696304839; x=1727840839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y3SKa/eOggYmqF6ykXHZOo+O2koRhgX0DR6MdgCfaV8=;
  b=fTwX5ks6HvTsZV9b99GkQuNUTDj1YE1P3H1dxU4f9SGWsORXNL1QQFN2
   Mi/XLQhHbBs6FzGRftjQd2XVhN092iXI+g/disEvimqqZuPM2iK9cgj72
   p0Avokjef7HJ+22rRCctdufGuQrF7hxcIhC/JkaUHANmsYkwIekMy1ak9
   4WfKd5YgZnMMzphdpKNhX1J68Bv6UmvsQ5MWz6BkCKfT2KdOmirm2ZVnM
   vCmrVokdNFYWbOT7w3q1y36FWKW15571fOSist4/G1TwVpFGkWkeZThNr
   ckOz7VfjeTu9q/hCcG1u1/FjlFNbSEg0tNA1fnj+prMLeqgKKN69cBwny
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="4351311"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="4351311"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 20:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="754254026"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="754254026"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 02 Oct 2023 20:47:16 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnWNN-0006k5-30;
	Tue, 03 Oct 2023 03:47:13 +0000
Date: Tue, 3 Oct 2023 11:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:eh-rework.v5 35/40]
 drivers/message/fusion/mptscsih.c:1917: warning: Function parameter or
 member 'shost' not described in 'mptscsih_bus_reset'
Message-ID: <202310031121.NmU2hNPg-lkp@intel.com>
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
commit: d298d1ee9389ef2aab6252dd45c094ea66fae827 [35/40] scsi: Use Scsi_Host and channel number as argument for eh_bus_reset_handler()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310031121.NmU2hNPg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031121.NmU2hNPg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031121.NmU2hNPg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/message/fusion/mptscsih.c:1917: warning: Function parameter or member 'shost' not described in 'mptscsih_bus_reset'
>> drivers/message/fusion/mptscsih.c:1917: warning: Function parameter or member 'channel' not described in 'mptscsih_bus_reset'
>> drivers/message/fusion/mptscsih.c:1917: warning: Excess function parameter 'SCpnt' description in 'mptscsih_bus_reset'


vim +1917 drivers/message/fusion/mptscsih.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  1904  
cd2c61911dfe0d Eric Moore       2007-01-29  1905  
^1da177e4c3f41 Linus Torvalds   2005-04-16  1906  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=*/
^1da177e4c3f41 Linus Torvalds   2005-04-16  1907  /**
^1da177e4c3f41 Linus Torvalds   2005-04-16  1908   *	mptscsih_bus_reset - Perform a SCSI BUS_RESET!	new_eh variant
^1da177e4c3f41 Linus Torvalds   2005-04-16  1909   *	@SCpnt: Pointer to scsi_cmnd structure, IO which reset is due to
^1da177e4c3f41 Linus Torvalds   2005-04-16  1910   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  1911   *	(linux scsi_host_template.eh_bus_reset_handler routine)
^1da177e4c3f41 Linus Torvalds   2005-04-16  1912   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  1913   *	Returns SUCCESS or FAILED.
cd2c61911dfe0d Eric Moore       2007-01-29  1914   **/
0d0c79747e362f Moore, Eric Dean 2005-04-22  1915  int
d298d1ee9389ef Hannes Reinecke  2023-10-02  1916  mptscsih_bus_reset(struct Scsi_Host * shost, int channel)
^1da177e4c3f41 Linus Torvalds   2005-04-16 @1917  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  1918  	MPT_SCSI_HOST	*hd;
466544d8898fc8 Moore, Eric Dean 2005-09-14  1919  	int		 retval;
958d4a32077f1d Eric Moore       2007-06-15  1920  	MPT_ADAPTER	*ioc;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1921  
^1da177e4c3f41 Linus Torvalds   2005-04-16  1922  	/* If we can't locate our host adapter structure, return FAILED status.
^1da177e4c3f41 Linus Torvalds   2005-04-16  1923  	 */
d298d1ee9389ef Hannes Reinecke  2023-10-02  1924  	if ((hd = shost_priv(shost)) == NULL){
29dd3609f2fc70 Eric Moore       2007-09-14  1925  		printk(KERN_ERR MYNAM ": bus reset: "
d298d1ee9389ef Hannes Reinecke  2023-10-02  1926  		   "Can't locate host!\n");
^1da177e4c3f41 Linus Torvalds   2005-04-16  1927  		return FAILED;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1928  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  1929  
958d4a32077f1d Eric Moore       2007-06-15  1930  	ioc = hd->ioc;
d298d1ee9389ef Hannes Reinecke  2023-10-02  1931  	printk(MYIOC_s_INFO_FMT "attempting bus reset!\n",
d298d1ee9389ef Hannes Reinecke  2023-10-02  1932  	       ioc->name);
^1da177e4c3f41 Linus Torvalds   2005-04-16  1933  
2f187862e579f1 Kashyap, Desai   2009-05-29  1934  	if (ioc->timeouts < -1)
2f187862e579f1 Kashyap, Desai   2009-05-29  1935  		ioc->timeouts++;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1936  
1ba9ab2eb2c53d Kashyap, Desai   2009-05-29  1937  	retval = mptscsih_IssueTaskMgmt(hd,
1ba9ab2eb2c53d Kashyap, Desai   2009-05-29  1938  					MPI_SCSITASKMGMT_TASKTYPE_RESET_BUS,
d298d1ee9389ef Hannes Reinecke  2023-10-02  1939  					channel, 0, 0, 0,
1ba9ab2eb2c53d Kashyap, Desai   2009-05-29  1940  					mptscsih_get_tm_timeout(ioc));
^1da177e4c3f41 Linus Torvalds   2005-04-16  1941  
d298d1ee9389ef Hannes Reinecke  2023-10-02  1942  	printk(MYIOC_s_INFO_FMT "bus reset: %s\n",
d298d1ee9389ef Hannes Reinecke  2023-10-02  1943  	    ioc->name, ((retval == 0) ? "SUCCESS" : "FAILED" ));
466544d8898fc8 Moore, Eric Dean 2005-09-14  1944  
466544d8898fc8 Moore, Eric Dean 2005-09-14  1945  	if (retval == 0)
466544d8898fc8 Moore, Eric Dean 2005-09-14  1946  		return SUCCESS;
cd2c61911dfe0d Eric Moore       2007-01-29  1947  	else
466544d8898fc8 Moore, Eric Dean 2005-09-14  1948  		return FAILED;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1949  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  1950  

:::::: The code at line 1917 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
