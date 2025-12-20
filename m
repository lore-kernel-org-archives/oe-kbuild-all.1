Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C4D153BE9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766243475; cv=none; b=FlxIQt+XJx8vuUAmaW6wHFK6RnDhp7eYTQz+niyxJtBKew8+l020KGog5mKhtyctTfcBHa6ZLg03RqVLGB8ESnFFu2L0n8xqhw3/BCJQhcJ+YJFcqmcIFnMMRqoVnvdDIifpbp+qCOh/SdRWd26Du31w/9kP5rDQsLjc4BqwoFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766243475; c=relaxed/simple;
	bh=8xk2gbBDfoF/YxI6hFN2kK0ktz77Iyr0nP4Tw7Hw4p8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T0vyc6dFrhOGVqc+8Wwuifb95mnVYkVdx4fZsSG2egDEyn2Lc92T48TEaE7EvbrMtSVqsSkvp7JkYcCK+55FnQHN736sxrTEzWO13ocvfRR8/NJGXUTmqoByjt2WvAR/kwMvQf8Dux+7ddJT/OhO8QhLZMwjuKJHvMo8/Y+JD20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcitlZ2e; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcitlZ2e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766243474; x=1797779474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8xk2gbBDfoF/YxI6hFN2kK0ktz77Iyr0nP4Tw7Hw4p8=;
  b=OcitlZ2ehhECnzQORiHDOIn3WSeM06lJv9kQoG0MfO6F/Rpm+Oy+ZHpj
   hPjQnTy4agT6ALjf1Ju/RHZtOZAUiFsJKPbsMo8xr/T+cAs1ffnynoz18
   KWaqZO9SvDSk8qIV0WJpmSHc0FuOtxHhgeHgDjZ+fXWR6tLMnc1jYJH/D
   5MZD3PgJUo3IGKLOSQwBuIvyJJh56j3LpndfVn0npwCiP3Vbxq9aA28RL
   BMV/IdoX73zeVlRRPAlN69hMh/lddVoDht9pOQnU/tUoK4IO9sys76Zqm
   YUvdjjRYekz3SufRzAu3RC7wQKv7hReYynTHdStFJQIm9wI1SRHG9oJn2
   Q==;
X-CSE-ConnectionGUID: IgCyWoP3RfaYbSvaw8cPFg==
X-CSE-MsgGUID: VSEt06PoQnak9GRjd5QLUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68255131"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68255131"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:11:14 -0800
X-CSE-ConnectionGUID: AuDQd9uMSnecp8SEhAzCLQ==
X-CSE-MsgGUID: /ItMsSqDSmmO9kZ8QM/LdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199103073"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2025 07:11:13 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWybu-000000004ir-12eY;
	Sat, 20 Dec 2025 15:11:10 +0000
Date: Sat, 20 Dec 2025 23:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 34/106]
 utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202512202328.yeqxzlQC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   5ee5189ef893fbbb9311f0cdb9f2f382c4a17eb1
commit: 100b39503458bc2608bd484b9e24c9f8dad7636f [34/106] firmware: add r3mini phy firmware
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251220/202512202328.yeqxzlQC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202328.yeqxzlQC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202328.yeqxzlQC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
