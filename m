Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC8D302755
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 20:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755374441; cv=none; b=tY4hd8jwxXhgq+/unI+7J3hqgQmoItLkJUpZaksqOOVvLPuOe6byimyBF0RkA0Qp+skLh5eCIkmPx99zJgIuK8kSonByrb4pVzBU+livpk0Ef88lx08MdBr/gsuh6Cz/zM7rC/J38tiaBLFUxGF7LpEwtiV8n76c/KY1Ic+Izbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755374441; c=relaxed/simple;
	bh=BaGd3TFmxXZqLhVNqE0HXoJjdoYPq8WJYeOb9ewgwmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DyYGTX3N9a8wuS6vDJXe9GqpCT3e0le/6+BfTP9IJRcPoor29S0AJ2IWDPDlFYNXEXUzKvsluu7VHTsnlcPCDr1+czpZX6g+6ZQ/kci055/RITwbYZeKal3O5QU6wZ69BtDVZIi6gmq1sPMvq43GMnZekD+SbwtQwHQN84JkEww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XftzTCNP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XftzTCNP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755374441; x=1786910441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BaGd3TFmxXZqLhVNqE0HXoJjdoYPq8WJYeOb9ewgwmM=;
  b=XftzTCNP2rtMc7IExgglbeCoeXCik0AjSNImukjtG1jKQlTrXzvPP8ik
   0CwDK/56Tv4r/2fyDZZWTJdhZ21gtFBljrjl62DJtOFNhRgO5VFCOF3AC
   u6ZJ7/d3nULzFZ1K8ne6bytJ61GQyw3Q7C6Y9s45QxZkeHq9/vTZyBmzx
   DaT6aqR1cz2zEnlo9oFaI+fDllIUIJWP2cPv1NSjAZc5133J53mp1OAat
   R9pI/RsQzYIiuPGxeU91e43BJk7MxgrnYFB4M4Fdzu3U0zqC/ni19WNRT
   L8UJDVmmZ29VucshfX+lz3JGxpAhpTfgoOVAOVW8pq3uMiIumgWgMoNgt
   Q==;
X-CSE-ConnectionGUID: jzE/fZBmTe2GIlklrRn0QQ==
X-CSE-MsgGUID: OYiuWal5Rg6CnIQx4x7lmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="61492046"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="61492046"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 13:00:40 -0700
X-CSE-ConnectionGUID: ddqG5JUGRjCp5JK2swfFAg==
X-CSE-MsgGUID: Zq51Vt6OT3u6M40m1GdQag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="198110281"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Aug 2025 13:00:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unN4u-000D9Y-2G;
	Sat, 16 Aug 2025 20:00:36 +0000
Date: Sun, 17 Aug 2025 04:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:ethos-v3 5/5] Warning: drivers/accel/ethosu/ethosu_gem.c:679
 function parameter 'data' not described in 'ethosu_gem_cmdstream_create'
Message-ID: <202508170310.JZkH4Hdz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v3
head:   74531049aaf7feda960f5e7d701a417dd7620b2c
commit: 74531049aaf7feda960f5e7d701a417dd7620b2c [5/5] renaming
config: x86_64-randconfig-074-20250817 (https://download.01.org/0day-ci/archive/20250817/202508170310.JZkH4Hdz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508170310.JZkH4Hdz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508170310.JZkH4Hdz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/accel/ethosu/ethosu_gem.c:679 function parameter 'data' not described in 'ethosu_gem_cmdstream_create'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
