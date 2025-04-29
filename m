Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0E92192E2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939355; cv=none; b=QNA9NJu6I9kgPOL3z3iPQOWoEv3bVXLek7aeU7MRZjQTpEKbxA+oRLWMw8JEd2qQoM1USgcIf8PErYArgiQbKpCcyYWrzpiu8No6Xb0HQPKu9vR4cj0/qJ4PZzkiPzKflmPJzjfh91Zag6nAqMVrpbfJTPXOZ+sNpU3wsVouwb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939355; c=relaxed/simple;
	bh=Vgadvu82mkBRcPb0qIWnCN+OBXyqJhxWHFZkMyEURqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FXqpZItHfmb+0+otGJh7j6UwVl2sJDU9frUGq1X52V15OlCbi1V4kOCM820Xto2vLzqQ2foZh081uwZmZ7IScU3n2vtWVPhCYhRqEGIVfN/gJ373X43MUrdeHqjeXLouL2GAGq/5xXBs5U30UmjvIqO9YBP3wRetOH5EAZjE0Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYFJ1g3V; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYFJ1g3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745939354; x=1777475354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vgadvu82mkBRcPb0qIWnCN+OBXyqJhxWHFZkMyEURqg=;
  b=GYFJ1g3VUlpduKbFSv+WauKzX9t0HBMDjv4KTpn81n073CbMq1iQxSbY
   tT/MQQfgtxtScZxzhNspe8sYi643548IcwDkEt2pRQYST0swrTy55DL/5
   WVougRyJPoUCCIIH0qIM9u7EAuLHQ9SvYJBigZ3GhNtzBbG9oSEf4nNxa
   9lQ99ksaCh1pTK9m1CItROJnkC9nCBgbJ11iH5Lamgy6PFvJommCycae7
   v9LH7X6W6kZix17o9pXV1eQ0m/3IhSMtIjW26KWhi2ItaXaCVjM2H5oH5
   MkNyEEUuHGqQ05PQEjWdueyGbtW7/Sc/cqfgHlL2BHhqPpV7itPDOfAq/
   g==;
X-CSE-ConnectionGUID: vlWUKiTSR2KFNYY87jXnVg==
X-CSE-MsgGUID: 2U3xCQpuQe+cB9edzyTP3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50228922"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="50228922"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 08:09:10 -0700
X-CSE-ConnectionGUID: 69Z6mil/QvmX+ZUE19QedA==
X-CSE-MsgGUID: Abdbf4+wRIeotbP6sZJPhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="133748424"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2025 08:09:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ma1-0000oF-1J;
	Tue, 29 Apr 2025 15:09:05 +0000
Date: Tue, 29 Apr 2025 23:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alessevan <44125445+Alessevan@users.noreply.github.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [rust:pr/1161 77/195] drivers/net/ethernet/realtek/8139c.c:61:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504292239.yphfXPc5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1161
head:   9f5fa1ba161d636d346f72ba808ce20ee4a3fa70
commit: 9b38723f8040ce8db95558558c52dda3dc826ab8 [77/195] fix(hot): reset errors correctly handled
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250429/202504292239.yphfXPc5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504292239.yphfXPc5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292239.yphfXPc5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/realtek/8139c.c:7: warning: expecting prototype for 8139c.c(). Prototype was for DRV_NAME() instead
>> drivers/net/ethernet/realtek/8139c.c:61: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Reset network card.


vim +61 drivers/net/ethernet/realtek/8139c.c

    59	
    60	/**
  > 61	 * Reset network card.
    62	 * @param drv_priv private driver's data
    63	 * @return zero if failed positive either
    64	 */
    65	static int rtl8139c_reset(struct rtl8139c_priv *drv_priv)
    66	{
    67		writeb(CmdReset, drv_priv->hwmem + ChipCmd);
    68		int i = 1000;
    69		while (--i) {
    70			if ((readb(drv_priv->hwmem + ChipCmd) & CmdReset) == 0) {
    71				break;
    72			}
    73			udelay(10);
    74		}
    75		return i;
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
