Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBCB277C86
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 17:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765733922; cv=none; b=LS2HyGKvLKasKeIGHGnd1yNmYjm+y4lAR+tXzZ/70cnb0gKhcbSlJCqF/Lrc3cQQs766HRUqvO0oGw1rE6wqcl1DZzhtwOodKSHVnfdKdOzi0mKvy0bie6z6x5dwv20NbWRULrzrupNOLpBjLxGy45bx4Y4SFjaN8jhJc6kaTsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765733922; c=relaxed/simple;
	bh=MRXLW/9KNeJ+eDgwQs0Va/Dd81Q1aKulGhXXMRTGuG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qDX4zLofQfFB1lgFDyildWWaOOxEv5ktqT9wkUWmuguxQFsYavsXtfzhg3s2WMxabDQA8IfPZANwPK6P0A22Ic7ZB0phxlPjZTegkbjLULqxjMM6q99L0AZaIHbbP2UuKc0m6asjm5emtXrtrUY//wUHIPDEdoFCFPtXojHm71k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5mo8F3l; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5mo8F3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765733920; x=1797269920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MRXLW/9KNeJ+eDgwQs0Va/Dd81Q1aKulGhXXMRTGuG4=;
  b=X5mo8F3lKCM0YEu4Y1OIPQDrMlX/twvKx6px1o1LS710lJMhL1wabdFi
   od6qnbTML3oC0s8sbv5xyL9Q13FoQ3NGHga0iAR51ttYYUgQzlRGCGbU2
   cEP2+6/fkopI9RO/gx3/T+DPG7/lXPDxPYePoK5CfQ/VUXRdWn0ZwgSr+
   YV/nezXk2DFqCtySnXnacNLJrikcRkk2ts9NE6ShINUY6v9LG6gwd95Bp
   EKYqs7l8yBXjL6Uz8BxiqMzuhjLLx9PHQELgBwErfCfW4OvmSFk1a9u9A
   1nOnJ+X0Q+DrEZAqesw0VMy+2Wm27bjxbR+Ey8eqfZ53nlDgmOkzVQ4SB
   Q==;
X-CSE-ConnectionGUID: jLNZ1jO9SmmO4uCLzHSvcA==
X-CSE-MsgGUID: mnhYdghmSuCUB3YYndrpNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66831408"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="66831408"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 09:38:37 -0800
X-CSE-ConnectionGUID: T48M39glR1uMo7wvvG5PfA==
X-CSE-MsgGUID: ynLMwMBJTu+HdKy6K+TxAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228608426"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2025 09:38:36 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUq3F-000000009Et-1qTo;
	Sun, 14 Dec 2025 17:38:33 +0000
Date: Mon, 15 Dec 2025 01:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: arch/um/drivers/vector_transports.c:337:40: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202512150116.TCRGxLH3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tiwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: b555cb66583e99158cfef8e91c025252cefae55b um: vector: Eliminate the dependency on uml_net
date:   7 months ago
config: um-randconfig-r131-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150116.TCRGxLH3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150116.TCRGxLH3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150116.TCRGxLH3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/um/drivers/vector_transports.c:73:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:73:38: sparse:     expected unsigned int [usertype]
   arch/um/drivers/vector_transports.c:73:38: sparse:     got restricted __be32 [usertype]
   arch/um/drivers/vector_transports.c:90:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:90:34: sparse:     expected unsigned int [usertype]
   arch/um/drivers/vector_transports.c:90:34: sparse:     got restricted __be32 [usertype]
   arch/um/drivers/vector_transports.c:109:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:109:35: sparse:     expected unsigned int [usertype]
   arch/um/drivers/vector_transports.c:109:35: sparse:     got restricted __be32 [usertype]
   arch/um/drivers/vector_transports.c:254:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] arptype @@     got restricted __be16 [usertype] @@
   arch/um/drivers/vector_transports.c:254:37: sparse:     expected unsigned short [usertype] arptype
   arch/um/drivers/vector_transports.c:254:37: sparse:     got restricted __be16 [usertype]
   arch/um/drivers/vector_transports.c:273:52: sparse: sparse: invalid assignment: |=
   arch/um/drivers/vector_transports.c:273:52: sparse:    left side has type unsigned short
   arch/um/drivers/vector_transports.c:273:52: sparse:    right side has type restricted __be16
   arch/um/drivers/vector_transports.c:274:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] rx_key @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:274:36: sparse:     expected unsigned int [usertype] rx_key
   arch/um/drivers/vector_transports.c:274:36: sparse:     got restricted __be32 [usertype]
   arch/um/drivers/vector_transports.c:275:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] tx_key @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:275:36: sparse:     expected unsigned int [usertype] tx_key
   arch/um/drivers/vector_transports.c:275:36: sparse:     got restricted __be32 [usertype]
   arch/um/drivers/vector_transports.c:288:52: sparse: sparse: invalid assignment: |=
   arch/um/drivers/vector_transports.c:288:52: sparse:    left side has type unsigned short
   arch/um/drivers/vector_transports.c:288:52: sparse:    right side has type restricted __be16
   arch/um/drivers/vector_transports.c:336:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] tx_session @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:336:40: sparse:     expected unsigned long long [usertype] tx_session
   arch/um/drivers/vector_transports.c:336:40: sparse:     got restricted __be32 [usertype]
>> arch/um/drivers/vector_transports.c:337:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] rx_session @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:337:40: sparse:     expected unsigned long long [usertype] rx_session
   arch/um/drivers/vector_transports.c:337:40: sparse:     got restricted __be32 [usertype]
   arch/um/drivers/vector_transports.c:355:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] rx_cookie @@     got restricted __be64 [usertype] @@
   arch/um/drivers/vector_transports.c:355:47: sparse:     expected unsigned long long [usertype] rx_cookie
   arch/um/drivers/vector_transports.c:355:47: sparse:     got restricted __be64 [usertype]
   arch/um/drivers/vector_transports.c:356:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] tx_cookie @@     got restricted __be64 [usertype] @@
   arch/um/drivers/vector_transports.c:356:47: sparse:     expected unsigned long long [usertype] tx_cookie
   arch/um/drivers/vector_transports.c:356:47: sparse:     got restricted __be64 [usertype]
   arch/um/drivers/vector_transports.c:360:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] rx_cookie @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:360:47: sparse:     expected unsigned long long [usertype] rx_cookie
   arch/um/drivers/vector_transports.c:360:47: sparse:     got restricted __be32 [usertype]
   arch/um/drivers/vector_transports.c:361:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] tx_cookie @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:361:47: sparse:     expected unsigned long long [usertype] tx_cookie
   arch/um/drivers/vector_transports.c:361:47: sparse:     got restricted __be32 [usertype]

vim +337 arch/um/drivers/vector_transports.c

49da7e64f33e80 Anton Ivanov 2017-11-20  304  
49da7e64f33e80 Anton Ivanov 2017-11-20  305  	struct uml_l2tpv3_data *td;
49da7e64f33e80 Anton Ivanov 2017-11-20  306  	int temp_int, temp_rxs, temp_txs;
49da7e64f33e80 Anton Ivanov 2017-11-20  307  	unsigned long temp_rx;
49da7e64f33e80 Anton Ivanov 2017-11-20  308  	unsigned long temp_tx;
49da7e64f33e80 Anton Ivanov 2017-11-20  309  
49da7e64f33e80 Anton Ivanov 2017-11-20  310  	vp->transport_data = kmalloc(
49da7e64f33e80 Anton Ivanov 2017-11-20  311  		sizeof(struct uml_l2tpv3_data), GFP_KERNEL);
49da7e64f33e80 Anton Ivanov 2017-11-20  312  
49da7e64f33e80 Anton Ivanov 2017-11-20  313  	if (vp->transport_data == NULL)
49da7e64f33e80 Anton Ivanov 2017-11-20  314  		return -ENOMEM;
49da7e64f33e80 Anton Ivanov 2017-11-20  315  
49da7e64f33e80 Anton Ivanov 2017-11-20  316  	td = vp->transport_data;
49da7e64f33e80 Anton Ivanov 2017-11-20  317  
49da7e64f33e80 Anton Ivanov 2017-11-20  318  	vp->form_header = &l2tpv3_form_header;
49da7e64f33e80 Anton Ivanov 2017-11-20  319  	vp->verify_header = &l2tpv3_verify_header;
49da7e64f33e80 Anton Ivanov 2017-11-20  320  	td->counter = 0;
49da7e64f33e80 Anton Ivanov 2017-11-20  321  
49da7e64f33e80 Anton Ivanov 2017-11-20  322  	vp->header_size = 4;
49da7e64f33e80 Anton Ivanov 2017-11-20  323  	td->session_offset = 0;
49da7e64f33e80 Anton Ivanov 2017-11-20  324  	td->cookie_offset = 4;
49da7e64f33e80 Anton Ivanov 2017-11-20  325  	td->counter_offset = 4;
49da7e64f33e80 Anton Ivanov 2017-11-20  326  
49da7e64f33e80 Anton Ivanov 2017-11-20  327  
49da7e64f33e80 Anton Ivanov 2017-11-20  328  	td->ipv6 = false;
49da7e64f33e80 Anton Ivanov 2017-11-20  329  	if (get_uint_param(vp->parsed, "v6", &temp_int)) {
49da7e64f33e80 Anton Ivanov 2017-11-20  330  		if (temp_int > 0)
49da7e64f33e80 Anton Ivanov 2017-11-20  331  			td->ipv6 = true;
49da7e64f33e80 Anton Ivanov 2017-11-20  332  	}
49da7e64f33e80 Anton Ivanov 2017-11-20  333  
49da7e64f33e80 Anton Ivanov 2017-11-20  334  	if (get_uint_param(vp->parsed, "rx_session", &temp_rxs)) {
49da7e64f33e80 Anton Ivanov 2017-11-20  335  		if (get_uint_param(vp->parsed, "tx_session", &temp_txs)) {
49da7e64f33e80 Anton Ivanov 2017-11-20  336  			td->tx_session = cpu_to_be32(temp_txs);
49da7e64f33e80 Anton Ivanov 2017-11-20 @337  			td->rx_session = cpu_to_be32(temp_rxs);
49da7e64f33e80 Anton Ivanov 2017-11-20  338  		} else {
49da7e64f33e80 Anton Ivanov 2017-11-20  339  			return -EINVAL;
49da7e64f33e80 Anton Ivanov 2017-11-20  340  		}
49da7e64f33e80 Anton Ivanov 2017-11-20  341  	} else {
49da7e64f33e80 Anton Ivanov 2017-11-20  342  		return -EINVAL;
49da7e64f33e80 Anton Ivanov 2017-11-20  343  	}
49da7e64f33e80 Anton Ivanov 2017-11-20  344  
49da7e64f33e80 Anton Ivanov 2017-11-20  345  	td->cookie_is_64  = false;
49da7e64f33e80 Anton Ivanov 2017-11-20  346  	if (get_uint_param(vp->parsed, "cookie64", &temp_int)) {
49da7e64f33e80 Anton Ivanov 2017-11-20  347  		if (temp_int > 0)
49da7e64f33e80 Anton Ivanov 2017-11-20  348  			td->cookie_is_64  = true;
49da7e64f33e80 Anton Ivanov 2017-11-20  349  	}
49da7e64f33e80 Anton Ivanov 2017-11-20  350  	td->cookie = false;
49da7e64f33e80 Anton Ivanov 2017-11-20  351  	if (get_ulong_param(vp->parsed, "rx_cookie", &temp_rx)) {
49da7e64f33e80 Anton Ivanov 2017-11-20  352  		if (get_ulong_param(vp->parsed, "tx_cookie", &temp_tx)) {
49da7e64f33e80 Anton Ivanov 2017-11-20  353  			td->cookie = true;
49da7e64f33e80 Anton Ivanov 2017-11-20  354  			if (td->cookie_is_64) {
49da7e64f33e80 Anton Ivanov 2017-11-20  355  				td->rx_cookie = cpu_to_be64(temp_rx);
49da7e64f33e80 Anton Ivanov 2017-11-20  356  				td->tx_cookie = cpu_to_be64(temp_tx);
49da7e64f33e80 Anton Ivanov 2017-11-20  357  				vp->header_size += 8;
49da7e64f33e80 Anton Ivanov 2017-11-20  358  				td->counter_offset += 8;
49da7e64f33e80 Anton Ivanov 2017-11-20  359  			} else {
49da7e64f33e80 Anton Ivanov 2017-11-20  360  				td->rx_cookie = cpu_to_be32(temp_rx);
49da7e64f33e80 Anton Ivanov 2017-11-20  361  				td->tx_cookie = cpu_to_be32(temp_tx);
49da7e64f33e80 Anton Ivanov 2017-11-20  362  				vp->header_size += 4;
49da7e64f33e80 Anton Ivanov 2017-11-20  363  				td->counter_offset += 4;
49da7e64f33e80 Anton Ivanov 2017-11-20  364  			}
49da7e64f33e80 Anton Ivanov 2017-11-20  365  		} else {
49da7e64f33e80 Anton Ivanov 2017-11-20  366  			return -EINVAL;
49da7e64f33e80 Anton Ivanov 2017-11-20  367  		}
49da7e64f33e80 Anton Ivanov 2017-11-20  368  	}
49da7e64f33e80 Anton Ivanov 2017-11-20  369  
49da7e64f33e80 Anton Ivanov 2017-11-20  370  	td->has_counter = false;
49da7e64f33e80 Anton Ivanov 2017-11-20  371  	if (get_uint_param(vp->parsed, "counter", &temp_int)) {
49da7e64f33e80 Anton Ivanov 2017-11-20  372  		if (temp_int > 0) {
49da7e64f33e80 Anton Ivanov 2017-11-20  373  			td->has_counter = true;
49da7e64f33e80 Anton Ivanov 2017-11-20  374  			vp->header_size += 4;
49da7e64f33e80 Anton Ivanov 2017-11-20  375  			if (get_uint_param(
49da7e64f33e80 Anton Ivanov 2017-11-20  376  				vp->parsed, "pin_counter", &temp_int)) {
49da7e64f33e80 Anton Ivanov 2017-11-20  377  				if (temp_int > 0)
49da7e64f33e80 Anton Ivanov 2017-11-20  378  					td->pin_counter = true;
49da7e64f33e80 Anton Ivanov 2017-11-20  379  			}
49da7e64f33e80 Anton Ivanov 2017-11-20  380  		}
49da7e64f33e80 Anton Ivanov 2017-11-20  381  	}
49da7e64f33e80 Anton Ivanov 2017-11-20  382  
49da7e64f33e80 Anton Ivanov 2017-11-20  383  	if (get_uint_param(vp->parsed, "udp", &temp_int)) {
49da7e64f33e80 Anton Ivanov 2017-11-20  384  		if (temp_int > 0) {
49da7e64f33e80 Anton Ivanov 2017-11-20  385  			td->udp = true;
49da7e64f33e80 Anton Ivanov 2017-11-20  386  			vp->header_size += 4;
49da7e64f33e80 Anton Ivanov 2017-11-20  387  			td->counter_offset += 4;
49da7e64f33e80 Anton Ivanov 2017-11-20  388  			td->session_offset += 4;
49da7e64f33e80 Anton Ivanov 2017-11-20  389  			td->cookie_offset += 4;
49da7e64f33e80 Anton Ivanov 2017-11-20  390  		}
49da7e64f33e80 Anton Ivanov 2017-11-20  391  	}
49da7e64f33e80 Anton Ivanov 2017-11-20  392  
49da7e64f33e80 Anton Ivanov 2017-11-20  393  	vp->rx_header_size = vp->header_size;
49da7e64f33e80 Anton Ivanov 2017-11-20  394  	if ((!td->ipv6) && (!td->udp))
49da7e64f33e80 Anton Ivanov 2017-11-20  395  		vp->rx_header_size += sizeof(struct iphdr);
49da7e64f33e80 Anton Ivanov 2017-11-20  396  
49da7e64f33e80 Anton Ivanov 2017-11-20  397  	return 0;
49da7e64f33e80 Anton Ivanov 2017-11-20  398  }
49da7e64f33e80 Anton Ivanov 2017-11-20  399  

:::::: The code at line 337 was first introduced by commit
:::::: 49da7e64f33e80edffb1a9eeb230fa4c3f42dffb High Performance UML Vector Network Driver

:::::: TO: Anton Ivanov <anton.ivanov@cambridgegreys.com>
:::::: CC: Richard Weinberger <richard@nod.at>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
