Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6131C6B7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 18:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721154255; cv=none; b=CPRws5XJghkvW0RapV9Ff0QoanNBDZ5Q6/o68a7FqIS8QvT5r9QjuDdHpYXIWztfH4J04kMmZ0Y8/HMGeHXTQZXJkEhrJf+z6bG89dxTmKbgRo6kdcRdRiK/JOo9JPRyEIfMqe+bcoNjajpgjF96bd0vmWsUaj+Gq1jSkd5xKbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721154255; c=relaxed/simple;
	bh=t++kYpQmVJzELzR9+TJcnr7/0Y7cbjshFSyEoQ4q2Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iBuN0btJXIqXhl4GbRjMCPqUip3BKjsmR0AClalGVkQiTzFhG2zOw9JBUJjUgY2HcJsvk6QL+V7ngaSdgsn6o6b5iJm107oEawrMKRU2Mzyf9Kgv0nxP4udK6ipUEWXZJL1iCFsIYdzWmMZoMJe9LBpeM3Osjkt/SGuP1mH5GhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eha+oREO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eha+oREO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721154254; x=1752690254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t++kYpQmVJzELzR9+TJcnr7/0Y7cbjshFSyEoQ4q2Xg=;
  b=Eha+oREO0fraeglwqpYw8KfYe6KZBj/A56eHwrBtV/LQy1cVT4271ELE
   uk1cfnUvavZZ+Mtc7K9yyhuXDnNUI+sTricTSaBL9hQVvo7oVphr334tE
   uNWyM3FWkLZQ4JhImkhYSj7cyLmxgeR2ciZ2r8vkpkLbAzAlBaXbQq7zm
   pytFaqp/Be0eHEnd5HrOqSEwz9s3OaTu17U0XnrhRq664FG8Q9/iMfTB9
   wqHL7KFShPFC9KVcdSm5GM7Re0VyzkBhQxjXOFC6dWBuyNCK/bVg8onm8
   9xokUKkxAuCMP9DF4jVD6nuuKoTaqnj2cQAnPuHZOGIiPv9l+H4/Vn10X
   w==;
X-CSE-ConnectionGUID: A7op8KtjQta7/Qc26bGGjA==
X-CSE-MsgGUID: jMiHSq+pS1SbkGuS6RKxMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18762881"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="18762881"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 11:24:13 -0700
X-CSE-ConnectionGUID: okYn8qcJRhmD03Zefm531A==
X-CSE-MsgGUID: IqVsATizQ5224llC4LL0Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="80762371"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jul 2024 11:24:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTmqP-000fWw-1o;
	Tue, 16 Jul 2024 18:24:09 +0000
Date: Wed, 17 Jul 2024 02:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 7/48]
 drivers/net/ethernet/intel/idpf/idpf_lib.c:1880: warning: Excess function
 parameter 'reset_cause' description in 'idpf_initiate_soft_reset'
Message-ID: <202407170208.YB8519KS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   d7007b65e8e03f477584ba66cfece548c88cfd96
commit: a286105996f4307b88eaa526f982817d41d9f9ef [7/48] idpf: fix memory leaks and crashes while performing a soft reset
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240717/202407170208.YB8519KS-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170208.YB8519KS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170208.YB8519KS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_lib.c:1880: warning: Excess function parameter 'reset_cause' description in 'idpf_initiate_soft_reset'


vim +1880 drivers/net/ethernet/intel/idpf/idpf_lib.c

a286105996f430 Alexander Lobakin 2024-07-12  1870  
02cbfba1add5bd Alan Brady        2023-08-07  1871  /**
02cbfba1add5bd Alan Brady        2023-08-07  1872   * idpf_initiate_soft_reset - Initiate a software reset
02cbfba1add5bd Alan Brady        2023-08-07  1873   * @vport: virtual port data struct
02cbfba1add5bd Alan Brady        2023-08-07  1874   * @reset_cause: reason for the soft reset
02cbfba1add5bd Alan Brady        2023-08-07  1875   *
02cbfba1add5bd Alan Brady        2023-08-07  1876   * Soft reset only reallocs vport queue resources. Returns 0 on success,
02cbfba1add5bd Alan Brady        2023-08-07  1877   * negative on failure.
02cbfba1add5bd Alan Brady        2023-08-07  1878   */
a286105996f430 Alexander Lobakin 2024-07-12  1879  int idpf_initiate_soft_reset(struct idpf_vport *vport)
02cbfba1add5bd Alan Brady        2023-08-07 @1880  {
a286105996f430 Alexander Lobakin 2024-07-12  1881  	const struct idpf_netdev_priv *np = netdev_priv(vport->netdev);
a286105996f430 Alexander Lobakin 2024-07-12  1882  	bool vport_is_up = np->state == __IDPF_VPORT_UP;
e4891e4687c8dd Alexander Lobakin 2024-06-20  1883  	int err;
02cbfba1add5bd Alan Brady        2023-08-07  1884  
a286105996f430 Alexander Lobakin 2024-07-12  1885  	if (vport_is_up) {
02cbfba1add5bd Alan Brady        2023-08-07  1886  		set_bit(IDPF_VPORT_DEL_QUEUES, vport->flags);
02cbfba1add5bd Alan Brady        2023-08-07  1887  		idpf_vport_stop(vport);
a286105996f430 Alexander Lobakin 2024-07-12  1888  	} else {
a286105996f430 Alexander Lobakin 2024-07-12  1889  		idpf_send_delete_queues_msg(vport);
02cbfba1add5bd Alan Brady        2023-08-07  1890  	}
02cbfba1add5bd Alan Brady        2023-08-07  1891  
02cbfba1add5bd Alan Brady        2023-08-07  1892  	idpf_deinit_rss(vport);
02cbfba1add5bd Alan Brady        2023-08-07  1893  
a286105996f430 Alexander Lobakin 2024-07-12  1894  	err = idpf_reconfig_queues(vport);
02cbfba1add5bd Alan Brady        2023-08-07  1895  	if (err)
02cbfba1add5bd Alan Brady        2023-08-07  1896  		return err;
02cbfba1add5bd Alan Brady        2023-08-07  1897  
a286105996f430 Alexander Lobakin 2024-07-12  1898  	if (!vport_is_up)
a286105996f430 Alexander Lobakin 2024-07-12  1899  		return idpf_set_real_num_queues(vport);
02cbfba1add5bd Alan Brady        2023-08-07  1900  
a286105996f430 Alexander Lobakin 2024-07-12  1901  	err = idpf_vport_open(vport);
a286105996f430 Alexander Lobakin 2024-07-12  1902  	if (err) {
a286105996f430 Alexander Lobakin 2024-07-12  1903  		netdev_err(vport->netdev,
a286105996f430 Alexander Lobakin 2024-07-12  1904  			   "Could not reopen the vport %u: %pe", vport->idx,
a286105996f430 Alexander Lobakin 2024-07-12  1905  			   ERR_PTR(err));
02cbfba1add5bd Alan Brady        2023-08-07  1906  		return err;
02cbfba1add5bd Alan Brady        2023-08-07  1907  	}
02cbfba1add5bd Alan Brady        2023-08-07  1908  
a286105996f430 Alexander Lobakin 2024-07-12  1909  	return 0;
a286105996f430 Alexander Lobakin 2024-07-12  1910  }
a286105996f430 Alexander Lobakin 2024-07-12  1911  

:::::: The code at line 1880 was first introduced by commit
:::::: 02cbfba1add5bd9088c7d14c6b93b77a6ea8f3bb idpf: add ethtool callbacks

:::::: TO: Alan Brady <alan.brady@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
