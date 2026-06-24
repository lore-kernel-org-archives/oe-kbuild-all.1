Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20033BBA09
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782314533; cv=none; b=lPtSQMtW1LmPl0KPZRIjmVDBo6Uie7qxLCS7go1hjE9Xz+sDK/Vz1BZQryIUV79hSmNNDK5UkmGazBPf8tSKTjxkSg+gbyc2BuuwtUraDVE2kBkwIPpjuj/hvibdOgAzzFw59cdKDQdf/tQnfatc7Wd0DAO7eNnAghKXqOxhRG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782314533; c=relaxed/simple;
	bh=1vDioE5om9BTHnF5Ptleppxof7IPvB2tyho0K0OkmOc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J1UmMYN3bEbMiwCmdNZc7kRUrIYZjmn1DvkUOmuk1FccF91/65njAChL5jduoix56dN5yXUl0Erdq3gXe/f47h43dndvRdnlMCAKXb5Hhm4HfHuilN1LGWOsiGpF8oBDXC7ovOP6R3XX0hn1opQYu027m60M7x3hNA8xS8m/rFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xw1AW0Ji; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xw1AW0Ji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782314532; x=1813850532;
  h=date:from:to:cc:subject:message-id;
  bh=1vDioE5om9BTHnF5Ptleppxof7IPvB2tyho0K0OkmOc=;
  b=Xw1AW0JiM+7Cy7kuRPqxMQdfOQw1ARm8fd427A4MYEt3uCV/kBMLuOaR
   n8MVUKKAjvsnBpT7ESHjEuXFc9chqEs+ufNpNzVbkJYLn0g6xEJCGYTRP
   inTpD5imvnpN0A5lMLnKAqhH1jcH4/byWosvyFQ3pXb6FigLnV4sUbv3n
   viiLzOswa22b7MwId2bfrZ7U63exn3rj8Y9FOVF3ng6xp2Bu7SaV9eKnM
   5V3EJQRJV7XOWLDdO0SUfn398NqC1W04UabT3QFYWXXyUX0tFSt+Cg3JB
   YrxVc6NcroPRJShC99awt85tnhkzFszXTJNxQ5mY0sTqGZ196ygBaMaem
   Q==;
X-CSE-ConnectionGUID: x3xNzB2EQ5a+Eb3jEuT1Cw==
X-CSE-MsgGUID: KK93apcuTaaV4CxLOQHpVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="108627843"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="108627843"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 08:22:11 -0700
X-CSE-ConnectionGUID: HxHRZjuPTRWFFiENB4rPow==
X-CSE-MsgGUID: wiEWM1CETUmc02AzpduJcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="245817915"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jun 2026 08:22:10 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcPQW-000000006M1-23oi;
	Wed, 24 Jun 2026 15:22:08 +0000
Date: Wed, 24 Jun 2026 17:21:16 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:abi-test 34/34] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202606241747.PdxJ6sZu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git abi-test
head:   741e95c4b46803e113402223592189848b0ac9c8
commit: 741e95c4b46803e113402223592189848b0ac9c8 [34/34] uapi: all other changes
reproduce: (https://download.01.org/0day-ci/archive/20260624/202606241747.PdxJ6sZu-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5549: FILE: include/uapi/linux/mptcp.h:139:
+	__u16 :16;				 /* sizeof(mptcp_full_info) needs to be padded to
+						 * 64 bits, but the mptcp_info member on m68k is

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
