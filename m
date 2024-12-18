Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57270149C4D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 04:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734497230; cv=none; b=ObaOsmtS40b8mp501BjVaUpljbNAYE+jo5dwWhvJ+2hHOE9QJn8lhhdP3ORqO4NgdbnVs9qQtq2E2LzFza66Tz5/p0uxMtVwuVvwaUT0cgrnuj3GwtAxgaUK9Dn59SRF2hwRfWhCxmW4fdTk9bREqJsTcCQWeNkQl+TSsuWNrUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734497230; c=relaxed/simple;
	bh=YgZQh4Buuax4ff0caJJIJ8NYmxHAGz4eKoykefuLtwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tJ/LLpQg59eEilVClHpteSxf+MEiaefWG+QKbc1W/Arv/CKK6bIl/XSC39ShnI1Y6K922G0STwJhxVso9XV2tcYjSjIF+nC6hry5FUl6R8aGbRSPnIdjbo9otdg6309PHGvLVrxr2aeyJPNYmYqJm9YhCNhEHt63jZ+UzDbwQBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+DObWEO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+DObWEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734497229; x=1766033229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YgZQh4Buuax4ff0caJJIJ8NYmxHAGz4eKoykefuLtwE=;
  b=I+DObWEOEO131F786EvRi/8/bz1v9ss72zsabQ4PARKrefDpBWUwHJNd
   DS1lTRdvadyc4ZUHH0biZiRYFVYfK04JoIjDBPEZfQUmDAoaAjAuUdsOO
   75mVJtQsabClA2NFMRfFZQSELhTKyYPYhK1MunoLAyoZ4LRJg3cUJdk2q
   YqjCvmnm69wzSa7aT816R4rvcDtgeMIuUeS7I2He2VqkIwPYy4zrUF9Vf
   gzoYaD1cpPWDJUVcHyDugRBINN4fbbrhClG+eX/lbSHkWpB+OiB2LI5Id
   hQOo4OJVO0/f/CtuqL+ACM7vrSGdkTLmsodRXBAVmls+nFSiV1mVUWhQb
   w==;
X-CSE-ConnectionGUID: zH3GN9jhSlu+tigBBsMXDw==
X-CSE-MsgGUID: Sx4K21EoQt++uObzQJG9AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="60344350"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="60344350"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 20:47:05 -0800
X-CSE-ConnectionGUID: KaK4kSHCTm2h/yTD9iq47g==
X-CSE-MsgGUID: PqEOxueeTriM1T6afBovkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="102747426"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Dec 2024 20:47:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNlxd-000G4i-39;
	Wed, 18 Dec 2024 04:47:01 +0000
Date: Wed, 18 Dec 2024 12:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Subject: [linux-next:fs-next 73/561] vmlinux.o: warning: objtool:
 .text.netfs_retry_reads: unexpected end of section
Message-ID: <202412181239.0w5msWs4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git fs-next
head:   753cde7214be7bf7f212d85f2caed8f5bcae481e
commit: b4f239c91f9bf643f3e5f0977c9eff2c809eeddd [73/561] netfs: Change the read result collector to only use one work item
config: x86_64-randconfig-101-20241210 (https://download.01.org/0day-ci/archive/20241218/202412181239.0w5msWs4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181239.0w5msWs4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181239.0w5msWs4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .text.netfs_retry_reads: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
