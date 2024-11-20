Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6FA1361
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 05:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732079995; cv=none; b=mxAOvFhYh5hF6SQ5P4sUK6N+R9+eIynu2uhXURuRciUeJxyNSZmT3RtZmoQl92shUaYxGJtTcKQWJfQw7/wHA5A6mmKn3UCbX+GVnZN61m6kgnyNNrPoymjA0tTAufaLa4hmcBtRBGmKssHIz/fYweZeNJZVf/rJiS/7PrIgrjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732079995; c=relaxed/simple;
	bh=I6Xix6L/zlqrL+u1HuDL5eX6ZmzECzo8ni/aCFRmoZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NEAJ/BdOrBwAgYIKSHaJNnbU9Ge+mYjvJPPMaW2KbN+2qj4wJP3fPLkk2TsmjouTUloIvpwlzUc8MMtAusWPKV6orXTSxFlQ77xhgc1G2WlOW/bOhYFJAAz3VD6Hogl7rYJSpvEvG93kKXFw3Vdgd9Q5e2zr/u02jyN52iMt9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAaj2HPb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAaj2HPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732079993; x=1763615993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I6Xix6L/zlqrL+u1HuDL5eX6ZmzECzo8ni/aCFRmoZ4=;
  b=CAaj2HPb0HHVXzamdtr9fTEAKeOvll5EFwGCCZjd4/EzU2GorIdbKCni
   2rEIALEFVvnFlAO51Qnd+m3LBn5PkEMSoQ6k1xC3cKUsq2X5+gHW8Okkz
   f3DU/AedfAlQVX9Hz2ZgdWQFj3ufqRoQSGN8fXxCM+QO5k9PWqd1mkJy9
   kJ2dhxceFtcSaMuRT2YWcHpMkhYX+cd+CohzGOtGb4H6295MUy/ZerTXq
   BuWTiXX4HHSkMqxXEg4SxOxdKOt8Uo04RljQsJTIno5Bp9+HyVBnHBQBh
   TOvcmzmc35ptMtyO33VRqdM5yu48WerkWsFIKsgnLqZFJU/cPZV4FcE7p
   Q==;
X-CSE-ConnectionGUID: wxeul9XOQpiwunvC1S5W5g==
X-CSE-MsgGUID: u6TiVDTsTeuPVfY7mHFCdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32177753"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="32177753"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 21:19:52 -0800
X-CSE-ConnectionGUID: IilQlFJvRpi6pI+PJKKUfA==
X-CSE-MsgGUID: 1j9c9l+AQ/SJ4o9M+3i2pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="120744000"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2024 21:19:51 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDd81-0000Up-0I;
	Wed, 20 Nov 2024 05:19:49 +0000
Date: Wed, 20 Nov 2024 13:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 19/23] drivers/fwctl/cxl/cxl.c:135:2-3: Unneeded
 semicolon
Message-ID: <202411201314.0QpSQ8DL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   e4450fb1459bf712009c7cb1461643287e0f9e75
commit: cd685083320fbb36fbe7973406d5001962699335 [19/23] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
config: alpha-randconfig-r063-20241119 (https://download.01.org/0day-ci/archive/20241120/202411201314.0QpSQ8DL-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201314.0QpSQ8DL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/fwctl/cxl/cxl.c:135:2-3: Unneeded semicolon

vim +135 drivers/fwctl/cxl/cxl.c

   102	
   103	static bool cxlctl_validate_hw_cmds(struct cxl_mailbox *cxl_mbox,
   104					    const struct fwctl_cxl_command *send_cmd,
   105					    enum fwctl_rpc_scope scope)
   106	{
   107		struct cxl_mem_command *cmd;
   108	
   109		/*
   110		 * Only supporting feature commands.
   111		 */
   112		if (!cxl_mbox->num_features)
   113			return false;
   114	
   115		cmd = cxl_get_mem_command(send_cmd->id);
   116		if (!cmd)
   117			return false;
   118	
   119		if (test_bit(cmd->info.id, cxl_mbox->enabled_cmds))
   120			return false;
   121	
   122		if (test_bit(cmd->info.id, cxl_mbox->exclusive_cmds))
   123			return false;
   124	
   125		switch (cmd->opcode) {
   126		case CXL_MBOX_OP_GET_SUPPORTED_FEATURES:
   127		case CXL_MBOX_OP_GET_FEATURE:
   128			if (scope >= FWCTL_RPC_DEBUG_READ_ONLY)
   129				return true;
   130			break;
   131		case CXL_MBOX_OP_SET_FEATURE:
   132			return cxlctl_validate_set_features(cxl_mbox, send_cmd, scope);
   133		default:
   134			return false;
 > 135		};
   136	
   137		return false;
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
