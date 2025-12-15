Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910B32DF6F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765815921; cv=none; b=jonNAYcLXMoWFRT9Xwf1Vi8ZMpgfrILgV/EqPLILWod6+XwCEmlv6T3jTxZGNYbN/a9MAeaSsOJ7LCQVWEmE2ZYBo3RNKB7p2N1FKngO7Jbiln2eLcXZZe5/eqVxdaJf9N8Tu2rs6NL0L5bZpxlyoNvWlTJnwSaHE/q1K6AbgGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765815921; c=relaxed/simple;
	bh=UPK2/IhYBGUqf0IljntM2APIbO9l4vXSuTzpdBTmyn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GXtheGsBeFhUhxK9oXqTBvQn6ZN6tSS0jCac8Tk9mG6cmHmka3+gYqr9xszgHcM0iarLeo+ExqDwQIVSThxAqyzrtowMElo4CEilJtUybHphb678XQqSdcS1RDKhSwYej/lwL//fbIjKxKGbdTlo+ShdY8SV9fEOTjypIrek5rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpF+uzxu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpF+uzxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765815920; x=1797351920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UPK2/IhYBGUqf0IljntM2APIbO9l4vXSuTzpdBTmyn8=;
  b=FpF+uzxuNBoJRrcoSAVzVEoXkBNJYQA1lIzBSKXsHvzJKWkvS8mWesDR
   IWhC7lq/UBmT1AlvZU0uhgb8/WyckBQl63he7yRlY4Bdum1kzW0gMedGw
   6KgkMLF13pVdVN1p3gUg7RteIMMr4x/T8VyveLTQheqVNBOfLNO1n8siN
   JIOtIpbfx9D5K5Z5YpYzWoTZlZYFaWnuZUDPY2sxPLcvRKp89wOnrJzBJ
   RCBwiEvKQFyT5F1Gd19zQGLqTod3LucOCJUohJ8Syhgv6/QVkbBgd/nQK
   FfBaoDi8RV3AAeYnS5yXqbyyvEYJSGO/dwZF3a+Q7GIuyqEQfij1dXKam
   A==;
X-CSE-ConnectionGUID: qtEeURvHQk+kmn48u2tShA==
X-CSE-MsgGUID: GpuigYcNTcyHgnnm7v8khA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85131846"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="85131846"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 08:25:19 -0800
X-CSE-ConnectionGUID: LZrIuvi6S/mJMEIQPFJQ8w==
X-CSE-MsgGUID: hmbdX0RJTsmBCvRCjJbNpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="201944223"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Dec 2025 08:25:18 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVBNr-000000000UP-3Abp;
	Mon, 15 Dec 2025 16:25:15 +0000
Date: Tue, 16 Dec 2025 00:24:39 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 drivers/net/ethernet/netronome/nfp/nfp_main.c:1128:6: warning: no previous
 prototype for 'nfp_pci_error_reset_prepare'
Message-ID: <202512160003.ZEouzSvr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   0bcb74c919819123b737554f5d35edefa0555d65
commit: c3f08cf3e17600da0dcf2c945de2287b1ea616ff [11/11] anolis: nfp: add pci_error_handler callback
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512160003.ZEouzSvr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160003.ZEouzSvr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160003.ZEouzSvr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/netronome/nfp/nfp_main.c:1128:6: warning: no previous prototype for 'nfp_pci_error_reset_prepare' [-Wmissing-prototypes]
    1128 | void nfp_pci_error_reset_prepare(struct pci_dev *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netronome/nfp/nfp_main.c:1144:6: warning: no previous prototype for 'nfp_pci_error_reset_done' [-Wmissing-prototypes]
    1144 | void nfp_pci_error_reset_done(struct pci_dev *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/nfp_pci_error_reset_prepare +1128 drivers/net/ethernet/netronome/nfp/nfp_main.c

  1127	
> 1128	void nfp_pci_error_reset_prepare(struct pci_dev *dev)
  1129	{
  1130		struct nfp_pf *pf = pci_get_drvdata(dev);
  1131	
  1132		if (pf) {
  1133			if (pf->multi_pf.en && pf->multi_pf.beat_addr) {
  1134				/* Pause heartbeat timer so it can't happen during FLR */
  1135				del_timer_sync(&pf->multi_pf.beat_timer);
  1136				/* We need to write keepalive to keep firmware alive
  1137				 * during frequent FLR.
  1138				 */
  1139				writeq(jiffies, nfp_get_beat_addr(pf, pf->multi_pf.id));
  1140			}
  1141		}
  1142	}
  1143	
> 1144	void nfp_pci_error_reset_done(struct pci_dev *dev)
  1145	{
  1146		struct nfp_pf *pf = pci_get_drvdata(dev);
  1147	
  1148		if (pf)
  1149			if (pf->multi_pf.en && pf->multi_pf.beat_addr)
  1150				add_timer(&pf->multi_pf.beat_timer);
  1151	}
  1152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
