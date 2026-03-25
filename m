Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0750C3AB276
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 11:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437631; cv=none; b=CjffkNZSQ2ZTc7F82z4Z6FgcK6L5UHcdCq/20SySVlsJuG2Ez/rZO4g+/LdexNT5a3UB8TCxM8DFajd2+U+1wNWN8v/S8NnJoleupDenA/2Fpix+DERy3eXdskATxU2Ognwr7jZNs1OcV3n+Yi3W5LeVpSvtCnqgQ+D9asQ5wU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437631; c=relaxed/simple;
	bh=vv4EsqyO7Y8c/Au6/hoQj5W/GgkVz1uBH1GPvuIWUHE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I2L4hgDZik9GUkXrQPjLWduHtZGq1ULfCzSTerjwdUWAzojqEPtaS7R9WLM7uuajzKMWO5Dk6eoOeqCF94m1K3ke22Jt5pvKcQEaQ1MD5WQy8Bu79nQ7sJFAvF6R4A/68U08J15XAIYd5g5wxIabf5tn46lW40FYWyOO6x3TnL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNycD8DY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNycD8DY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774437629; x=1805973629;
  h=date:from:to:cc:subject:message-id;
  bh=vv4EsqyO7Y8c/Au6/hoQj5W/GgkVz1uBH1GPvuIWUHE=;
  b=kNycD8DYZWT5aYoXwh4vfCqgJQvim7SEoV8j8ifsSdJ6IM8ophQzVpoK
   ragbysQruHIv1sMs+5QjSw/99T0tewDHUQ9E2+nao+ZISGu3VxvFEfZ8u
   o7/pXscqK+VnHb6df12pxeEgEz9fIhjvM+IJ2TJpCyzoykWESlgnJzcIJ
   rWM3K17PO8jztMUskV37XJGf3kZ4lbTw+i6PXeE5sdW8+CwF1usB4wn7e
   z5u9y26/WKL5yUIP591dJzTTc4duEhjRO0arbM/8D7XtJ/1DO5mZUc3tY
   2piCMy43O2nyhEB5nROsnEjMRzzhFyzvyz31w++qtCTRvnFZl42mrStwS
   g==;
X-CSE-ConnectionGUID: VIF2vfFrQTa/GKUMEhF5TA==
X-CSE-MsgGUID: p2kA7wl8SpuKWhhbDG8ojg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79378213"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79378213"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:20:28 -0700
X-CSE-ConnectionGUID: Dq4/hLpJR1WWDf1WOrFkDw==
X-CSE-MsgGUID: z7Scdw5cQqCfSzGbHFHZcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="229115692"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Mar 2026 04:20:27 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5MHg-000000006jD-0Gzv;
	Wed, 25 Mar 2026 11:20:24 +0000
Date: Wed, 25 Mar 2026 19:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:9302:16: warning: variable 'j' set
 but not used
Message-ID: <202603251943.S7kSMdSW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jason,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   36e33448be90aea3d2e98da271b35aac511b8dc6
commit: 0d71df3e40ed0e0c241abf74e861d0a21de7d5d8 [1/1] UPSTREAM: net: allow rps/rfs related configs to be switched
config: x86_64-randconfig-074-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251943.S7kSMdSW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251943.S7kSMdSW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251943.S7kSMdSW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_request_irq':
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:9302:16: warning: variable 'j' set but not used [-Wunused-but-set-variable]
    9302 |         int i, j, rc = 0;
         |                ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_setup_int_mode':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:9010:48: warning: '%s' directive output may be truncated writing 4 bytes into a region of size between 2 and 17 [-Wformat-truncation=]
    9010 |         snprintf(bp->irq_tbl[0].name, len, "%s-%s-%d", bp->dev->name, "TxRx",
         |                                                ^~                     ~~~~~~
   In function 'bnxt_setup_inta',
       inlined from 'bnxt_setup_int_mode' at drivers/net/ethernet/broadcom/bnxt/bnxt.c:9030:3:
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:9010:9: note: 'snprintf' output between 8 and 23 bytes into a destination of size 18
    9010 |         snprintf(bp->irq_tbl[0].name, len, "%s-%s-%d", bp->dev->name, "TxRx",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    9011 |                  0);
         |                  ~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_setup_int_mode':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:8997:62: warning: '%s' directive output may be truncated writing between 2 and 4 bytes into a region of size between 2 and 17 [-Wformat-truncation=]
    8997 |                 snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |                                                              ^~
   In function 'bnxt_setup_msix',
       inlined from 'bnxt_setup_int_mode' at drivers/net/ethernet/broadcom/bnxt/bnxt.c:9028:3:
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:8997:58: note: directive argument in the range [-2147483641, 2147483646]
    8997 |                 snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |                                                          ^~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:8997:17: note: 'snprintf' output between 6 and 33 bytes into a destination of size 18
    8997 |                 snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8998 |                          attr, i);
         |                          ~~~~~~~~


vim +/j +9302 drivers/net/ethernet/broadcom/bnxt/bnxt.c

c0c050c58d8409 Michael Chan 2015-10-22  9299  
c0c050c58d8409 Michael Chan 2015-10-22  9300  static int bnxt_request_irq(struct bnxt *bp)
c0c050c58d8409 Michael Chan 2015-10-22  9301  {
b81a90d3028af9 Michael Chan 2016-01-02 @9302  	int i, j, rc = 0;
c0c050c58d8409 Michael Chan 2015-10-22  9303  	unsigned long flags = 0;
c0c050c58d8409 Michael Chan 2015-10-22  9304  #ifdef CONFIG_RFS_ACCEL
e5811b8c09df9b Michael Chan 2018-03-31  9305  	struct cpu_rmap *rmap;
c0c050c58d8409 Michael Chan 2015-10-22  9306  #endif
c0c050c58d8409 Michael Chan 2015-10-22  9307  
e5811b8c09df9b Michael Chan 2018-03-31  9308  	rc = bnxt_setup_int_mode(bp);
e5811b8c09df9b Michael Chan 2018-03-31  9309  	if (rc) {
e5811b8c09df9b Michael Chan 2018-03-31  9310  		netdev_err(bp->dev, "bnxt_setup_int_mode err: %x\n",
e5811b8c09df9b Michael Chan 2018-03-31  9311  			   rc);
e5811b8c09df9b Michael Chan 2018-03-31  9312  		return rc;
e5811b8c09df9b Michael Chan 2018-03-31  9313  	}
e5811b8c09df9b Michael Chan 2018-03-31  9314  #ifdef CONFIG_RFS_ACCEL
e5811b8c09df9b Michael Chan 2018-03-31  9315  	rmap = bp->dev->rx_cpu_rmap;
e5811b8c09df9b Michael Chan 2018-03-31  9316  #endif
c0c050c58d8409 Michael Chan 2015-10-22  9317  	if (!(bp->flags & BNXT_FLAG_USING_MSIX))
c0c050c58d8409 Michael Chan 2015-10-22  9318  		flags = IRQF_SHARED;
c0c050c58d8409 Michael Chan 2015-10-22  9319  
b81a90d3028af9 Michael Chan 2016-01-02  9320  	for (i = 0, j = 0; i < bp->cp_nr_rings; i++) {
e5811b8c09df9b Michael Chan 2018-03-31  9321  		int map_idx = bnxt_cp_num_to_irq_num(bp, i);
e5811b8c09df9b Michael Chan 2018-03-31  9322  		struct bnxt_irq *irq = &bp->irq_tbl[map_idx];
e5811b8c09df9b Michael Chan 2018-03-31  9323  

:::::: The code at line 9302 was first introduced by commit
:::::: b81a90d3028af92da61a61e2efd231a585180044 bnxt_en: Re-structure ring indexing and mapping.

:::::: TO: Michael Chan <mchan@broadcom.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
