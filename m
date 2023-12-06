Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121C81108
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 04:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jes9XPiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701838497; x=1733374497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oljpuVsayk6Ec4XeX7yIM4B5SO9qL0WwI+IK/g1wjrg=;
  b=jes9XPiKZDTJajVPlgydDT8se/pLnHq1bfw65Lg563M90o6t4Kqa67W/
   S0sFe5BjwbwLOrxu8P2ohKEzSjS8YPs6GPuqTiGnMn+mfBefilpAvcEbs
   YzhbJ0YhZZqfnvUMHmCCUQ5jEjiBRkxdniCLMO1EltoHLf/hFEao9CrNM
   pSMwhXSO2RsxSUqcGP4DwtBdZEmHA+HT9HBsgVkMGO0OqzrlMsxZje6TS
   5rqQoPHEGQTtkQnhmtsZ9A073oXkb0g24V7kUiGPPCaJiuzEF9IbUsp/o
   kl5sDZTo46Cwk3LNm6wCMVxGnRoWdUf3a5L6DCPH1Ra1ir5pTxXv7D8t+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1100652"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1100652"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 20:54:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018450939"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1018450939"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 20:54:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAjvx-000AHw-08;
	Wed, 06 Dec 2023 04:54:53 +0000
Date: Wed, 6 Dec 2023 12:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/extents.c:386:5-8: Unneeded variable: "ret". Return "
  0" on line 392
Message-ID: <202312061232.UwWyjKnI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: b65db750e2bb9252321fd54c284edd73c1595a09 bcachefs: Enumerate fsck errors
date:   5 weeks ago
config: x86_64-randconfig-104-20231204 (https://download.01.org/0day-ci/archive/20231206/202312061232.UwWyjKnI-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061232.UwWyjKnI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061232.UwWyjKnI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/extents.c:386:5-8: Unneeded variable: "ret". Return "  0" on line 392
--
>> fs/bcachefs/snapshot.c:37:5-8: Unneeded variable: "ret". Return "  0" on line 44
   fs/bcachefs/snapshot.c:212:5-8: Unneeded variable: "ret". Return "  0" on line 259

vim +386 fs/bcachefs/extents.c

   380	
   381	int bch2_reservation_invalid(struct bch_fs *c, struct bkey_s_c k,
   382				     enum bkey_invalid_flags flags,
   383				     struct printbuf *err)
   384	{
   385		struct bkey_s_c_reservation r = bkey_s_c_to_reservation(k);
 > 386		int ret = 0;
   387	
   388		bkey_fsck_err_on(!r.v->nr_replicas || r.v->nr_replicas > BCH_REPLICAS_MAX, c, err,
   389				 reservation_key_nr_replicas_invalid,
   390				 "invalid nr_replicas (%u)", r.v->nr_replicas);
   391	fsck_err:
 > 392		return ret;
   393	}
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
