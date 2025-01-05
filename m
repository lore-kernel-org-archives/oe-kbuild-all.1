Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8651F931
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736069847; cv=none; b=GK91/Dev5YRtHzBk28uZD8OYU+JVODBURYv6p6WVwUhTFzjhiWrLB9EDmCEWWJrCPt/t0J59nHxyXX7GThNZIRRnam2ZxSNpCVuStD1MTnmpgAfdK8KFUPoj2BfDo6hKb0ALp5P1JPnjDOgvdhUTXtLiMMeXZ9HYYm/bvqUwYKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736069847; c=relaxed/simple;
	bh=PRRhCmOzTn4fE8n481sm+KRL313OyeXbI6dprnU9/ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mZYfib1efQC1evuZiWbdrnSdbObWx6apLKd/plHYSk+IiQmvQgDK4O9mt2bLMwqTFC0QADmT8dhR5Tc5EP+U4AhTzuUe/zqvmyrher1QU9W/0qFLvEuH3Em8uwGfrwqraE2h9vEFSXP0s+ISfNjh1fhsgz1YxchREC23cpuFm8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4MPG3oO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4MPG3oO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736069846; x=1767605846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PRRhCmOzTn4fE8n481sm+KRL313OyeXbI6dprnU9/ks=;
  b=I4MPG3oO8eMYN/rJTuNyV2QEW6qdqf1DHehwFcu1BfL4YxjLh0Hf/iP0
   10skdstxtnHKvf61wT//rksPHfdf9egrCxy++NDWb2+ELOMrIfnX3mHTG
   X4oxjQaYo7UdvLriFHvNH/5b5g63VMJBM3MrYY7SXTp2rJiyZ4skJ+CAC
   TLNcIzCritatzu5gQJaiheFpETpKJz4TEBDnxkA7OrSliirmWXF23JIut
   LaQExRRE5civwJaqDsDoj67o3yvzeCLXzteUyZU9B9tO0+YN3obBLeQ6G
   cyLv7OQXWAQtYIbKZh4E882/I7Xg3khbkJzrPjLbIG5KRr8gqamHEZ8ZX
   Q==;
X-CSE-ConnectionGUID: K9tgxXxXRRm3R3AiwQQD7w==
X-CSE-MsgGUID: H4QJ3eWlSLOn1SWcBa/9BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="39928711"
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="39928711"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 01:37:25 -0800
X-CSE-ConnectionGUID: yexddpYeR1C2uGW367ScBA==
X-CSE-MsgGUID: MD10MnvYSrSzjKKOhP+8vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="102695201"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jan 2025 01:37:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUN4T-000Bb7-3B;
	Sun, 05 Jan 2025 09:37:21 +0000
Date: Sun, 5 Jan 2025 17:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1367/1367]
 drivers/media/platform/qcom/camss/camss.o: warning: objtool: missing symbol
 for section .init.text
Message-ID: <202501051713.LBoKPNXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   21eb7b92f86861232fed9eff3c46634d7535ef8a
commit: ec6859b23f2212275fbd476df14d7a94839c2a35 [1367/1367] media: Rename CAMSS driver path
config: x86_64-buildonly-randconfig-005-20250103 (https://download.01.org/0day-ci/archive/20250105/202501051713.LBoKPNXw-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501051713.LBoKPNXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501051713.LBoKPNXw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
