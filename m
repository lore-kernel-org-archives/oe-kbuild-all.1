Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F6418452C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 10:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727520076; cv=none; b=I/McchRJ6LXfjSvxVWHIHmR5v4gVirLi+aRS9PSN+yX9bjtszCCRjwLRenHoHmQmdaI7JUqblRcOvFWULIzzTN4RqdSBYRUJXPijREe0FFjUy3TdXy/bCAw9OZqhffitVri9zMFusd4BCDZzSgENF1bxNwf5QcHNCXChAzSl74k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727520076; c=relaxed/simple;
	bh=EhGdNXQgOxnT/0nSNau2L8k2+O6TvfXSPmVh/NfccpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oBHXUgr1QdgyH7JbpwKDuyhimsU8G5idHxKS/wKlQgsyyJ/N0a8alXLv53bWL/P1h3XEKFP9CYdayqrG9JrQ1gL8qi8YnTxKuHHl+u4chjkzYkGA+iKqOK86zS6vpaULuHU0tK7m7t2OiXsoB1kSB0bZ0LsbMpX8YB+SG7/hChc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnxbK2qG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnxbK2qG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727520073; x=1759056073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EhGdNXQgOxnT/0nSNau2L8k2+O6TvfXSPmVh/NfccpY=;
  b=BnxbK2qGH7OEAWnMJ66v3tZdDQ/1jgu8mEvgKgwxN3DUv+Zom3opfxve
   1mAieig8eJMMpjDbsqmTdTLdAXHCwV0eKqG0WxYNIVGooGH86rgaY5dDJ
   i5yQYWdGt+OrYFSeIG2wF7Z9o8DmWx3VXunBGQ0qcMX036H1TA1XuRFUB
   8df0nqfhnIehX6fBAbj31MyP6qaup7titzv1R5jNjwMBOeq3eq/GmFnE9
   xuhMsm4WyZzdX93sl2iNXZKCJSQnNYunvHi893B/t81T4UNQfn91e/tLI
   1Gg6JS55iiZUuj3Efe5B+oaXZDTJPQgj5a4F6LDV/tlC5X9BCHgfI39Bg
   g==;
X-CSE-ConnectionGUID: Vi/wpAG0RZWDPJb4CpJ3xg==
X-CSE-MsgGUID: bhvTPPI8QXS49H4FZdVteQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26792771"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26792771"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 03:41:13 -0700
X-CSE-ConnectionGUID: nRihJ/PDQ2KP+rqnu7RWuA==
X-CSE-MsgGUID: 6gQAED1ETd+gxTb7jfywKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73084884"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Sep 2024 03:41:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suUsv-000NB5-1V;
	Sat, 28 Sep 2024 10:41:09 +0000
Date: Sat, 28 Sep 2024 18:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 22/25] drivers/fwctl/cxl/cxl.c:82:17: sparse:
 sparse: restricted __le16 degrades to integer
Message-ID: <202409281851.cNoTT2QX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   501038e38bf9bf6d0c736b32b0b60703057a35f8
commit: aa01c45c9fe58890491dca08b099b796f10830ea [22/25] fwctl/cxl: Add support for fwctl RPC command to enable CXL feature commands
config: parisc-randconfig-r113-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281851.cNoTT2QX-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240928/202409281851.cNoTT2QX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281851.cNoTT2QX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/fwctl/cxl/cxl.c:82:17: sparse: sparse: restricted __le16 degrades to integer
   drivers/fwctl/cxl/cxl.c:89:17: sparse: sparse: restricted __le16 degrades to integer
   drivers/fwctl/cxl/cxl.c:93:18: sparse: sparse: restricted __le16 degrades to integer
   drivers/fwctl/cxl/cxl.c:94:18: sparse: sparse: restricted __le16 degrades to integer

vim +82 drivers/fwctl/cxl/cxl.c

    53	
    54	static bool cxlctl_validate_set_features(struct cxl_mailbox *cxl_mbox,
    55						 const struct fwctl_cxl_command *send_cmd,
    56						 enum fwctl_rpc_scope scope)
    57	{
    58		struct cxl_feat_entry *feat;
    59		bool found = false;
    60		uuid_t uuid;
    61		u16 mask;
    62	
    63		if (send_cmd->size < sizeof(struct cxl_set_feature_input))
    64			return false;
    65	
    66		if (copy_from_user(&uuid, u64_to_user_ptr(send_cmd->payload),
    67				   sizeof(uuid)))
    68			return false;
    69	
    70		for (int i = 0; i < cxl_mbox->num_features; i++) {
    71			feat = &cxl_mbox->entries[i];
    72			if (uuid_equal(&uuid, &feat->uuid)) {
    73				found = true;
    74				break;
    75			}
    76		}
    77	
    78		if (!found)
    79			return false;
    80	
    81		/* Currently no user background command support */
  > 82		if (feat->effects & CXL_CMD_BACKGROUND)
    83			return false;
    84	
    85		mask = CXL_CMD_CONFIG_CHANGE_IMMEDIATE |
    86		       CXL_CMD_DATA_CHANGE_IMMEDIATE |
    87		       CXL_CMD_POLICY_CHANGE_IMMEDIATE |
    88		       CXL_CMD_LOG_CHANGE_IMMEDIATE;
    89		if (feat->effects & mask && scope >= FWCTL_RPC_DEBUG_WRITE)
    90			return true;
    91	
    92		/* These effects supported for all scope */
    93		if ((feat->effects & CXL_CMD_CONFIG_CHANGE_COLD_RESET ||
    94		     feat->effects & CXL_CMD_CONFIG_CHANGE_CONV_RESET) &&
    95		    scope >= FWCTL_RPC_DEBUG_READ_ONLY)
    96			return true;
    97	
    98		return false;
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
