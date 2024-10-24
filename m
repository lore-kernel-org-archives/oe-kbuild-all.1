Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879E9189F3E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 21:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729807107; cv=none; b=NruD8NzCWLRmcffzA/xq/QuN64zxLAZEjavi5crqB+dhkqVDA8tGsXKLc77qzkYhyOUmm1C58iPrZ/+EkfAwl1ABKD3LWWWga41AuUJCWVPJpVqLtpxjmQm2yx2EWP/HMTrJRVAzIwQ4xW65k7l/SvBCIHsFhy0nMy+8d70nzxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729807107; c=relaxed/simple;
	bh=PVNcocISaSHOZlyZThk5JG6/3aSPo8pAJ2cclUZu9pw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H7xO3Nx7RA43SLVDjMzWvXYFvK5S35eCb+SBgUS/e2Tbf1P6RdMFTYwm5VstiH7v10H51MI/2O3COH6IG88MlUicIpIOFLJJpjQQYCmpU2PQT4U/sVgmtaRkZE5a37kP5Wh0S41iZ2SgLV0i5Z+1nTJMRfYn+8N/kxbI9Ugz13Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmMlhDMb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmMlhDMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729807106; x=1761343106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PVNcocISaSHOZlyZThk5JG6/3aSPo8pAJ2cclUZu9pw=;
  b=NmMlhDMbMUnYxaoXqHSA3lOxNNU+67HzhmZKrjiv3xk0Gc1kfQdKnhNI
   aVIGzrgNJDfU/8lAp3mKeHiOx1C4pXfMWdTRCdVMr4qxPsdR/T3nldb+y
   1nhQsh4yE24iJoUC8U3+fkFIY5Q7G4MZpvqzulOoFCQrLANMK5ZhqaYZP
   FEUABBkZvy2OGjXusHyJHjLxEZXtMQKcX/dNQ2L5/5poRGL3JQymUCNY6
   LeTx4H6f9ScBDT9VAufO6KXL8KPwODzU//GHluAUEjDCRZ997051HxFHG
   aN5j6ljMqUGdQwTuz7aQL1JwkUYWFDD3zCbfAiQpCenhnMx0lB6B/Zyc3
   g==;
X-CSE-ConnectionGUID: oKwAo/okROCVeZpuAamaoA==
X-CSE-MsgGUID: DXDyNrz5QVGS/V5B/SZsWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40054993"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="40054993"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 14:58:25 -0700
X-CSE-ConnectionGUID: 9F9zDzqWTFKcpBOJTdHP+A==
X-CSE-MsgGUID: JYKaO5KMSMmsDXFh7dFYMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="85267771"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2024 14:58:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t45qX-000XBc-2n;
	Thu, 24 Oct 2024 21:58:21 +0000
Date: Fri, 25 Oct 2024 05:57:22 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mic:landlock-audit 17/22] security/landlock/ruleset.h:299
 landlock_match_layer_level() warn: always true condition '(layer_level >= 0)
 => (0-u32max >= 0)'
Message-ID: <202410250551.9qhEgicd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git landlock-audit
head:   b3b217bbd19f28ca1b2d9f86cd12a7e590d98a39
commit: 18b218ccea9f1a38329ef95ec9f0899f276295d7 [17/22] landlock: Log mount-related denials
config: xtensa-randconfig-r072-20241025 (https://download.01.org/0day-ci/archive/20241025/202410250551.9qhEgicd-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250551.9qhEgicd-lkp@intel.com/

New smatch warnings:
security/landlock/ruleset.h:299 landlock_match_layer_level() warn: always true condition '(layer_level >= 0) => (0-u32max >= 0)'
security/landlock/ruleset.h:299 landlock_match_layer_level() warn: always true condition '(layer_level >= 0) => (0-u32max >= 0)'

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +299 security/landlock/ruleset.h

   280	
   281	/**
   282	 * landlock_match_layer_level - Return the layer level restricting @masks
   283	 *
   284	 * @ruleset: Landlock ruleset (used as a domain)
   285	 * @masks: access masks
   286	 *
   287	 * Returns: the number of the layer restricting/handling any right of @access,
   288	 * or return 0 (i.e. first layer) otherwise.
   289	 */
   290	static inline size_t
   291	landlock_match_layer_level(const struct landlock_ruleset *const ruleset,
   292				   const struct access_masks masks)
   293	{
   294		const union access_masks_all masks_all = {
   295			.masks = masks,
   296		};
   297		size_t layer_level;
   298	
 > 299		for (layer_level = ruleset->num_layers; layer_level >= 0;
   300		     layer_level--) {
   301			union access_masks_all layer = {
   302				.masks = ruleset->access_masks[layer_level],
   303			};
   304	
   305			if (masks_all.all & layer.all)
   306				return layer_level;
   307		}
   308	
   309		return 0;
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
