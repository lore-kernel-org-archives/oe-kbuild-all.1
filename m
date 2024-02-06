Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C27F1B95E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 22:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707257666; cv=none; b=m0bSlncN9jDYJHUC4VVimx9LdMjD6VBTdm6mIW9zGXETGuTNLCc7Bu2dBLN3uojBAaIcA+LLh5GUEWmo97vzoOMU54hd+siX2vFqhshMhN/QCUNuDYfnVVeoClrcndXtMMjc/7PS00Mse+fjmmKzwlyK8obkQbELnV5LGBgJvoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707257666; c=relaxed/simple;
	bh=EdNMuL823nKxznGXv0hHFdrFCk7K/tjRGRJ5rhHIQ30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kb9l3leJ4AenfDsohlq6NBkosqNCoNsfCchxPvE/D8s71+XT/ErTdAr56aenEimf6LOxy/2kww2QqHawVSU9jdcvHHRcnALY57PaffT/bNqFWa7TJM+D0jMR06ixel67on6gmM5RX2rafp6ro9LFc5a2swsxUmqrXP5SUARBRQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IdXL5yPD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IdXL5yPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707257664; x=1738793664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EdNMuL823nKxznGXv0hHFdrFCk7K/tjRGRJ5rhHIQ30=;
  b=IdXL5yPDw7YhVL4ZPJinNQywYcuXp0kZ49+C2UnxVmXq+drIBtDTzH9U
   BTDKdMSGJJDyHDUYaaLdiCthJ1z549gFiOp+fEdTz2bqcYpi12LBENgWE
   8w0mWOMnMH8Hlsj4hcyCBEmx0WkfFr6A5KZMrvTP+8RFVZSFMXY9h7xDG
   5VXiJsaCCH07he8gIrxPft3VJqfiCqeWVeWf59DmneMR8huFgvi79APr/
   OctKrW3o6bxwVjRcuHt1S7Yzf7Ot0Rv35MP6OV6PaIqXfCS01+1uZ4ZAp
   zevDacksRfIf90/+aobk1Q9Y4l0R4bATRrX9iWj6V97jHUnbhlAXbbUkj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1018115"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1018115"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 14:14:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1146800"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Feb 2024 14:14:20 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXThq-0001pg-2m;
	Tue, 06 Feb 2024 22:14:18 +0000
Date: Wed, 7 Feb 2024 06:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Subject: security/landlock/ruleset.c:644: warning: Function parameter or
 struct member '' not described in 'landlock_init_layer_masks'
Message-ID: <202402070653.ovMJd41U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   99bd3cb0d12e85d5114425353552121ec8f93adc
commit: 0e7410112964168a65578002269ae3b80b207936 landlock: Move and rename layer helpers
date:   3 months ago
config: i386-randconfig-141-20240206 (https://download.01.org/0day-ci/archive/20240207/202402070653.ovMJd41U-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402070653.ovMJd41U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402070653.ovMJd41U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1518, <IN_FILE> line 182.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1470, <IN_FILE> line 182.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1470, <IN_FILE> line 182.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1576, <IN_FILE> line 182.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1605, <IN_FILE> line 182.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1615, <IN_FILE> line 182.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1615, <IN_FILE> line 182.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1616, <IN_FILE> line 182.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1618, <IN_FILE> line 182.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1619, <IN_FILE> line 182.
   security/landlock/ruleset.c:182: warning: Function parameter or struct member '' not described in 'insert_rule'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1634, <IN_FILE> line 182.
   Use of uninitialized value $parameterlist[2] in join or string at scripts/kernel-doc line 1793, <IN_FILE> line 182.
   security/landlock/ruleset.c:182: warning: Excess function parameter 'layers' description in 'insert_rule'
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1518, <IN_FILE> line 644.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1470, <IN_FILE> line 644.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1470, <IN_FILE> line 644.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1576, <IN_FILE> line 644.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1605, <IN_FILE> line 644.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1615, <IN_FILE> line 644.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1615, <IN_FILE> line 644.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1616, <IN_FILE> line 644.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1618, <IN_FILE> line 644.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1619, <IN_FILE> line 644.
>> security/landlock/ruleset.c:644: warning: Function parameter or struct member '' not described in 'landlock_init_layer_masks'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1634, <IN_FILE> line 644.
   Use of uninitialized value $parameterlist[2] in join or string at scripts/kernel-doc line 1793, <IN_FILE> line 644.
>> security/landlock/ruleset.c:644: warning: Excess function parameter 'layer_masks' description in 'landlock_init_layer_masks'


vim +644 security/landlock/ruleset.c

   626	
   627	/**
   628	 * landlock_init_layer_masks - Initialize layer masks from an access request
   629	 *
   630	 * Populates @layer_masks such that for each access right in @access_request,
   631	 * the bits for all the layers are set where this access right is handled.
   632	 *
   633	 * @domain: The domain that defines the current restrictions.
   634	 * @access_request: The requested access rights to check.
   635	 * @layer_masks: The layer masks to populate.
   636	 *
   637	 * Returns: An access mask where each access right bit is set which is handled
   638	 * in any of the active layers in @domain.
   639	 */
   640	access_mask_t landlock_init_layer_masks(
   641		const struct landlock_ruleset *const domain,
   642		const access_mask_t access_request,
   643		layer_mask_t (*const layer_masks)[LANDLOCK_NUM_ACCESS_FS])
 > 644	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
