Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A003F823C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791399130; cv=none; b=rGWl46u0vUooN2A4LKH+qw0LmKJQDmRH+xxGfiqAcmzsxgkb69RqlQuetnHYcFpp/6Z3ONFWgNrgDEWHn5rlc3Q58ZzsSd+L8ZlfZ5VMP61lZyD2n579wvPBJhh7qiu05jpplE9goCROoci0V33s2rpc0GJTjPorVD+JzO6ZuvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791399130; c=relaxed/simple;
	bh=BCZlovcaA7VAUXB3vZELaKJl5eqJ8L0/mHaDYXfvg8g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uPDkIfMIDdcd690GINadhsaa+B+bojYkza0ZP6DQT7upkLcq/HhhTFzxv/LdpTwOFLxxwrRNiki7zPx9+3b+Y2paKGwRAiRuzZVrkyj9MeGGQKiyZwlqgt4tL2PDhXhKJMZO8tWaLJXN/7bhcqqKB4ypXB2RCTJKjqXXnjnVUBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GT/h05pi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GT/h05pi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791399129; x=1822935129;
  h=date:from:to:cc:subject:message-id;
  bh=BCZlovcaA7VAUXB3vZELaKJl5eqJ8L0/mHaDYXfvg8g=;
  b=GT/h05piYtJCnZq7Z7TVewH+zDW9e3B4ZKUzZrA2XJn0ic9KtsqMPv7H
   VflwKjfel4fn1jq8Z6gyM6IA7o3L8/GAoSRWF8yJz9RkhbhGNuuClH+OI
   2pWA+ib7tuoszce6J4LgSnl5u8nEdI0kHq1RNoM6hN6JPcKznPMCQPB5n
   OBB7khhExTLbovUKbc+AuBOP+jV5r+jiAercK9paWnyXbAeyunItjJfWF
   jSSW7YXwoRTRdE+pg9YloDdPpMdGgpBpMYd0JXvxv1guNbpLOCRVrY/H4
   RP1+QDMva7bMsIIUtPCWVoUfIGoI36huO/nj6kM2fmq8XlGQMmfEIG16L
   Q==;
X-CSE-ConnectionGUID: HsCcOFsXSG6Ba3kmiXZv8Q==
X-CSE-MsgGUID: oYeQvmWSTHuq3hWOR2Pz/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="172168"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="172168"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 11:52:09 -0700
X-CSE-ConnectionGUID: VaoWR2U6QS+KV+vaUROb/A==
X-CSE-MsgGUID: +vBHigbNQ22rcn6aXjcITw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="119622"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 Oct 2026 11:52:07 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEWkG-000000003pj-1z9f;
	Wed, 07 Oct 2026 18:52:04 +0000
Date: Wed, 07 Oct 2026 20:51:51 +0200
From: kernel test robot <lkp@intel.com>
To: Bill Wendling <morbo@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Martin K. Petersen (Oracle)" <mkp@kernel.org>,
 Mariia Nikitash <nikitash.mariiaw@gmail.com>,
 Bart Van Assche <bvanassche@acm.org>
Subject: [linux-next:master 13578/15025]
 drivers/scsi/bfa/bfa_fcs.c:826:4: warning: '%s' directive output may be
 truncated writing up to 63 bytes into a region of size between 44 and 122
Message-ID: <202610072037.kjdagNH7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b018686719706a781c45a874ed51374a2dc4b767
commit: 0a5b53c1e7276ffacf5153d06d442c4d7ab0c41d [13578/15025] scsi: bfa: Use snprintf() in bfa_fcs_fabric_nsymb_init()
config: s390-randconfig-2001-20261006 (https://download.01.org/0day-ci/archive/20261007/202610072037.kjdagNH7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072037.kjdagNH7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072037.kjdagNH7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/bfa/bfa_fcs.c: In function 'bfa_fcs_fabric_nsymb_init':
>> drivers/scsi/bfa/bfa_fcs.c:826:4: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size between 44 and 122 [-Wformat-truncation=]
       "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR
       ^~~~
   drivers/scsi/bfa/bfa_fcs.c:828:5: note: format string is defined here
       "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR,
        ^~
   drivers/scsi/bfa/bfa_fcs.c:825:2: note: 'snprintf' output between 10 and 151 bytes into a destination of size 128
     snprintf(port_cfg->node_sym_name.symname, BFA_SYMNAME_MAXLEN,
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR,
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       model, (char *)driver_info->version,
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       driver_info->host_machine_name);
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +826 drivers/scsi/bfa/bfa_fcs.c

   811	
   812	/*
   813	 * Node Symbolic Name Creation for base port and all vports
   814	 */
   815	void
   816	bfa_fcs_fabric_nsymb_init(struct bfa_fcs_fabric_s *fabric)
   817	{
   818		struct bfa_lport_cfg_s *port_cfg = &fabric->bport.port_cfg;
   819		char model[BFA_ADAPTER_MODEL_NAME_LEN] = {0};
   820		struct bfa_fcs_driver_info_s *driver_info = &fabric->fcs->driver_info;
   821	
   822		bfa_ioc_get_adapter_model(&fabric->fcs->bfa->ioc, model);
   823	
   824		/* Model name/number, Driver Version, Host machine name */
   825		snprintf(port_cfg->node_sym_name.symname, BFA_SYMNAME_MAXLEN,
 > 826			 "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR
   827			 "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR
   828			 "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR,
   829			 model, (char *)driver_info->version,
   830			 driver_info->host_machine_name);
   831	}
   832	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
