Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7DC2620E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 18:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765650136; cv=none; b=LJ6bAuZXkGic/Petrj3iHmVX4omVXuxqbkCPEWczo90qWwTssB1FHTppcb0pA2t3EonK6a16d5iWB7Q0FWQXnSS3qHFUpb57Z/orwIln++xkoGs4XnisbABA6HuIp0YmUJOqJCrq6jXbNd5UKXashYdR4Wevldf1sHMpcB9nsF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765650136; c=relaxed/simple;
	bh=dcTeo3OMOx2ZQnUI6MTeuAFMKJq5uWP43jekUAymMDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q0eVnIXFgT1CWBGdKaGBoTTkBShdL2aTZsfyTVSED0Quw6lCvf8Tx1+RvMzL2HU5QKlTNRgoGHwVjCOzG2ZDyj/4PgMONNbTDZCLvpYHqYeOa/qGg5/lotiWV8qoy6xJT61WudnBcqHgHnd7LdXmEux2OEoSTBIBPkQ9jTP/cao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcRJi47M; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcRJi47M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765650135; x=1797186135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dcTeo3OMOx2ZQnUI6MTeuAFMKJq5uWP43jekUAymMDw=;
  b=VcRJi47Mfw8BTiwqqPuFYBqrXBqhOPUV8YiOXMbhgR2VE+04K3FRN/aQ
   F6wDM2622wchuSfHtDfwEXT2g7UxGuBUyrcznU8lSKE/mSF7N1luNt4IV
   S9sepNfcGMq7rKqXKvvJnt7UnJO44Kv7vDF0A5XFsr38t0lmdSMpogw1D
   FcpnWU5sCm/Awts81BDNMzp+fSlp/xWsfxgfVsn+cLAt2kUcWTJh8331N
   fSW+L6prmMyMrry2LOy21fj+fG27kKkVmOw5gmhJBSsFdu41A2HiRNshR
   PIImQdB6SOYhYIRogzhapE/mNDKozDY7s5WvZXS0+oqfR6et+OGwLE4JZ
   A==;
X-CSE-ConnectionGUID: kUhCZRx8S9CbEoJb9iPYbQ==
X-CSE-MsgGUID: 7ucen1shQ5KCxFpQUD7lMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67775488"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67775488"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 10:22:12 -0800
X-CSE-ConnectionGUID: LgX9aa4SRRywUCIqheS74A==
X-CSE-MsgGUID: wf5jDJ2GSB6ouU6oIglxFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197620803"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 10:22:11 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUUFt-0000000083B-03e3;
	Sat, 13 Dec 2025 18:22:09 +0000
Date: Sun, 14 Dec 2025 02:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942] arch/x86/entry/entry_64.o:
 warning: objtool: .entry.text+0x162: unsupported intra-function call
Message-ID: <202512140208.Qp9EVDfd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josh,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: f3a233591ef81d81ea87a24717d4bee05211a56c [1942/1942] x86/speculation: Fix RSB filling with CONFIG_RETPOLINE=n
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251214/202512140208.Qp9EVDfd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140208.Qp9EVDfd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140208.Qp9EVDfd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/entry/entry_64.S: Assembler messages:
   arch/x86/entry/entry_64.S:1767: Warning: no instruction mnemonic suffix given and no register operands; using default for `sysret'
>> arch/x86/entry/entry_64.o: warning: objtool: .entry.text+0x162: unsupported intra-function call

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
