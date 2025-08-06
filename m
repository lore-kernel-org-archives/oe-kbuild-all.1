Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395E01F3BA9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 11:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754479436; cv=none; b=FSTXGfRQzpRtPPEb+LVGCBAV35FlCTbqAy2n2ZWxQ2cIHn5KfLbYCtetkzuIa/k286HeWU3mP+cJAX8CfcGfh/udjuPz2AlJ40W2PQfU0yCyv6kyP8r6YbynXFcAZje2/1BWNpDHqnE00H+l2QHPR8E6Y50949o3XNiNK2AD1eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754479436; c=relaxed/simple;
	bh=PlnEOhs6atCoKrzuH3UklRF7otCfUAAlM98xK//8Nrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SFbjSAPkYDfkVD///2jzaWRZMbCDhJZZ9qyJYLqsYM6LnmgO5SOSvff+JbPBxZi6O1kJ0UtbOMCqDkNcUW41pgwAVxDOjpbAdnY6EkZd4sZTfDhlVnKqizJ3C7OhhyyVglky15a/w8uSvu/K9iD7X1b+Cg5iMdqiZTgZGjcXcrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HabgUXZ2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HabgUXZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754479434; x=1786015434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PlnEOhs6atCoKrzuH3UklRF7otCfUAAlM98xK//8Nrs=;
  b=HabgUXZ2ZFkixGtHqT3RwR3ixPvzZQ+GygxxqeZBhPkHtyRI57J/d2CG
   vo0OPBIGW9rfzPc/X/FhxhSAN9O3Lfp4Kqpbw9h4jVOpXCYZwoOrDmkfu
   1zJnTVk6H4BttpI4EapDn1CMARyQRxZg5lggXW/+8IudXTipg8PlikGcY
   EzVhxKMKaJrUeGzJPR2X+Kl9VcJ+0drHvqSXjt5uVIKuMe+OOqmTV0bJQ
   t6//g3785y1dJlNneXMiysmm2FdMXOlcUKqZHhWTyLX8LRckXbaJcU1BR
   1SPoeym+XU25nOyQaMqJD0N08M5Y3JKkjnOSVjV2pUfgwkD5E0IEH+uSt
   Q==;
X-CSE-ConnectionGUID: fuVYRD2/TxSJkcGLnos0xQ==
X-CSE-MsgGUID: I0jAhIdITm2qqxnjI74aAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68165049"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="68165049"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 04:23:53 -0700
X-CSE-ConnectionGUID: 3MXzBWPvTHSL7co8YrHt2w==
X-CSE-MsgGUID: +vIfNsPOQ7anorJzVZy1ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="169201452"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2025 04:23:52 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujcFK-0002CJ-0s;
	Wed, 06 Aug 2025 11:23:50 +0000
Date: Wed, 6 Aug 2025 13:23:25 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743] drivers/net/phy/ax88796b.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202508061308.PqhzSJTN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   58693b1f5fa8f02b34ab9a02096472232731e864
commit: 56e625aa545a24e8d3fa44b5fbcdedd88e443dcc [1743/1743] net: phy: rename Asix Electronics PHY driver
config: x86_64-buildonly-randconfig-2001-20250802 (https://download.01.org/0day-ci/archive/20250806/202508061308.PqhzSJTN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061308.PqhzSJTN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061308.PqhzSJTN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/ax88796b.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
