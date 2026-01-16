Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CC122A7E9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 20:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768593740; cv=none; b=oyslqhWfQ3b6Sps7cxF+OVCRejgMnM5ksBbkiobv1n++9dgm/3EP84wmPD05aaSB2tOl/j1I1fb8cBkzMfM6StdYx0c7xcfqA1hwqnJ/cfmoUDAJsZTWys3Yq+H49/H3XNB3hAtfgiFoR7GxSMnJy9r030G1ZjA0V58qoVDC73A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768593740; c=relaxed/simple;
	bh=jZKLSTBDtlB3vyK4nXeMeLUlosBSXxnemCO7Wnm8zUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SI4ksbgwdE0klEEZTBFZ+nEvyLLSQlqOHyidP2g6sxyKJVMUh4PTqS4xDxSn8MPU8C9kgoa/spJoUpRxfaOyhvqLAlLlZQBajaM79gtXMM5mRcL/6zrqqkz4oLfQaaiLkk6YWOibZ7mjf6aUbGqCnvfT73Xsjj3pTPJx63PwuwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dk8MvtDA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dk8MvtDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768593739; x=1800129739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jZKLSTBDtlB3vyK4nXeMeLUlosBSXxnemCO7Wnm8zUQ=;
  b=Dk8MvtDAaJi8al8eKz1F07wb0ZOKq8w0cPXElGkcyg8pZfO/CFHJtf2L
   ODgbSa/qHrN4nBVi84NkDwDivfikEqAJ99XrZ15wcgocJH+Nf0r7+UAkw
   StWwinM0NoZQkQT14XUH9EqYcEUK4Ih5kXIOt01WVLuJet8kOgyauz8Aa
   tTbWsa6sLEutRPQ+fYwqRWcobhT1CHagsu2H73E4TbTgkN7l25mdJmyv7
   iRNJ/8TWaRFgaZAXSOv27jNiW4tIqnJk8rX3UEehXBhVl/EOkkVblNkCS
   XQIvr0h4fyu5/CxidTC/EJeD5vbTQKBSiVqXf1hYQQ7Ym4lSy8xB52KQs
   w==;
X-CSE-ConnectionGUID: RuqEyPVSRzGnwCuL5V9vSA==
X-CSE-MsgGUID: QXks9lczRX2HfjxnsCpJiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69114963"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="69114963"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 12:02:19 -0800
X-CSE-ConnectionGUID: sebInZveTeiLHu0Am+IwWQ==
X-CSE-MsgGUID: aV+DbHlDT22zJd75A98CIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="236017031"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jan 2026 12:02:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgq1P-00000000LCK-14st;
	Fri, 16 Jan 2026 20:02:15 +0000
Date: Sat, 17 Jan 2026 04:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 07/17] firmware: arm_scmi: Use new Telemetry traces
Message-ID: <202601170307.z2PvU3Xv-lkp@intel.com>
References: <20260114114638.2290765-8-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114114638.2290765-8-cristian.marussi@arm.com>

Hi Cristian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on trace/for-next linus/master v6.19-rc5 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Marussi/firmware-arm_scmi-Define-a-common-SCMI_MAX_PROTOCOLS-value/20260114-195913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260114114638.2290765-8-cristian.marussi%40arm.com
patch subject: [PATCH v2 07/17] firmware: arm_scmi: Use new Telemetry traces
config: csky-randconfig-001-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170307.z2PvU3Xv-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170307.z2PvU3Xv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170307.z2PvU3Xv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/telemetry.c: In function 'scmi_telemetry_tdcf_blkts_parse':
>> drivers/firmware/arm_scmi/telemetry.c:1384:46: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1384 |         trace_scmi_tlm_collect(bts->last_ts, (u64)payld,
         |                                              ^


vim +1384 drivers/firmware/arm_scmi/telemetry.c

  1362	
  1363	static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
  1364						    struct payload __iomem *payld,
  1365						    struct telemetry_shmti *shmti)
  1366	{
  1367		struct telemetry_block_ts *bts;
  1368	
  1369		/* Check for spec compliance */
  1370		if (USE_LINE_TS(payld) || USE_BLK_TS(payld) ||
  1371		    DATA_INVALID(payld) || (PAYLD_ID(payld) != 0)) {
  1372			trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, 0);
  1373			return;
  1374		}
  1375	
  1376		/* A BLK_TS descriptor MUST be returned: it is found or it is crated */
  1377		bts = scmi_telemetry_blkts_lookup(ti->ph->dev, &ti->xa_bts, payld);
  1378		if (WARN_ON(!bts))
  1379			return;
  1380	
  1381		/* Update the descriptor with the lastest TS*/
  1382		scmi_telemetry_blkts_update(shmti->last_magic, bts);
  1383	
> 1384		trace_scmi_tlm_collect(bts->last_ts, (u64)payld,
  1385				       bts->last_magic, "SHMTI_BLK_TS");
  1386	}
  1387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
