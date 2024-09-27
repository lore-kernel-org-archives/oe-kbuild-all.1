Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F241F94A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 01:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727398806; cv=none; b=p1zx35ump4i1VaxyaWVvCxbdyeDZpqLAcoGptnt/gr5gtIYyD814nykXc4kF2INhYK1I0z3N/AbnFqV2YY1tgpCBYaYToUs5MyIDTJGG6uvzRAEjOAYqRpHTRenupdYvG1Luzy77PysIVeiEMMTRDdbog4iRXHfW0VPffNt7Bi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727398806; c=relaxed/simple;
	bh=mF2i5hDmnJy5w3bQh/tUhLT8nPEuFphjhigl/hYXbv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VyKtnciBonlfQMe6qV68qjXOs0eZT5/2MFIGS8Q6sN8OPzITiqSPuhQrzRundiHOiXKKe2Wsl4O/PgkiDkl/Yh+ObNZsA8cX7K0KzDd2OXpTxYC7iAPPkU1b0qzK9mhAy4fFPHwZ2XngzADnOyPCtWOBuVu6ZnCGvM17JagtdRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n10O+MW3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n10O+MW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727398805; x=1758934805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mF2i5hDmnJy5w3bQh/tUhLT8nPEuFphjhigl/hYXbv4=;
  b=n10O+MW3KpyIuhdmLyVeOIgUMC82zOyLw8NZdO5tjRB5/AqRdos8yLk7
   Cr71VRoeylX9yvl9sl9Jjj8dGKA82VFaRg7yZ9IAKtMFWKKy1KetQb38P
   eP4RLvpRcxq5IRuyt1hwJysDTYYRI++vWQ5PBOph1o1/J3TSOah7hQxX0
   08DipthGdg59bwBBxfIpCQoWJ98ewviBZK0MRhZBRVNt4Ug8OnSBogkJW
   8A5oPDl0/UDFh/P+BCwu2+SkyGa59HsUn55EJQ43dR/jKQMUJLkEuOv3/
   IVQ6UdfFZaTc+q2UBeQgQ1WZJBDLXjQvoAOAK/1YAOXNj5WoYOjxuEazw
   Q==;
X-CSE-ConnectionGUID: RICedifGTfCFltSI30ITKg==
X-CSE-MsgGUID: vlRGNUzSRcyWBf6OQqSqIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26663615"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26663615"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 17:59:51 -0700
X-CSE-ConnectionGUID: PkHrBv6HQUeyMmNBHLV4Eg==
X-CSE-MsgGUID: 25cxRsloSV2Us+tRsyE04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="72350801"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Sep 2024 17:59:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stzKm-000LLL-00;
	Fri, 27 Sep 2024 00:59:48 +0000
Date: Fri, 27 Sep 2024 08:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 22/25] drivers/fwctl/cxl/cxl.c:132:2-3: Unneeded
 semicolon
Message-ID: <202409270824.a5T8NzDb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   b4f2900f53c72de8fc639b62e44763c6a9695d3b
commit: a35b1a880d87c874f47a8acd68bad9e251a342fd [22/25] fwctl/cxl: Add support for fwctl RPC command to enable CXL feature commands
config: loongarch-randconfig-r051-20240927 (https://download.01.org/0day-ci/archive/20240927/202409270824.a5T8NzDb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270824.a5T8NzDb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/fwctl/cxl/cxl.c:132:2-3: Unneeded semicolon

vim +132 drivers/fwctl/cxl/cxl.c

    99	
   100	static bool cxlctl_validate_hw_cmds(struct cxl_mailbox *cxl_mbox,
   101					    const struct fwctl_cxl_command *send_cmd,
   102					    enum fwctl_rpc_scope scope)
   103	{
   104		struct cxl_mem_command *cmd;
   105	
   106		/*
   107		 * Only supporting feature commands.
   108		 */
   109		if (!cxl_mbox->num_features)
   110			return false;
   111	
   112		cmd = cxl_get_mem_command(send_cmd->id);
   113		if (!cmd)
   114			return false;
   115	
   116		if (test_bit(cmd->info.id, cxl_mbox->enabled_cmds))
   117			return false;
   118	
   119		if (test_bit(cmd->info.id, cxl_mbox->exclusive_cmds))
   120			return false;
   121	
   122		switch (cmd->opcode) {
   123		case CXL_MBOX_OP_GET_SUPPORTED_FEATURES:
   124		case CXL_MBOX_OP_GET_FEATURE:
   125			if (scope >= FWCTL_RPC_DEBUG_READ_ONLY)
   126				return true;
   127			break;
   128		case CXL_MBOX_OP_SET_FEATURE:
   129			return cxlctl_validate_set_features(cxl_mbox, send_cmd, scope);
   130		default:
   131			return false;
 > 132		};
   133	
   134		return false;
   135	}
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
