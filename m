Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB6835B658
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 23:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776121364; cv=none; b=MCG0EPvrStKpO4OxwbCzhzgwSS3Iit4pAsjWbXtSHfESkitfdQS80KkOZUN3U5h/MZdL3MooxBYya6bBgm7OZAnOGgoBpR38rDqGrhK5mtdEQ7UMNblz0G7bgNsKUG07/9MKdhdRTlfRkMa8m6Zwrfu0ZS8PKOIBCq0tPzKCSKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776121364; c=relaxed/simple;
	bh=JrZIVGcUamh7pitdqZCQDzpglxph8PYNCm2VSAG5rCg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pLxnLhgyFDG0KSKazkV2kBRGoVo5PcB68E+g0rW6BZWSeIPuc7N8K8UK6xF1BoH+7xWc/v0DIRCAcq2yMrwaO5STK9igOZjELUW772KS1U6FfxnM5GvmcXOYZMn24386rLGWEpRmEgHT4lAytkZA3eFJy/0jmQ3ncCmamm9EDNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLaEr3LS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLaEr3LS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776121362; x=1807657362;
  h=date:from:to:cc:subject:message-id;
  bh=JrZIVGcUamh7pitdqZCQDzpglxph8PYNCm2VSAG5rCg=;
  b=LLaEr3LSZZ97lbDC6IKxarFkrIbIY6mm+aMQz1bnjQyDAZ1smH5XcuaS
   HWLKK4MBpSKaN3k4rCkif42eAJOI2Y6tvhNc0ZpGPQNgwxYQDPKzTsjfK
   SQyAGaRWhYWHyA8FIMI9WVYjOl9BWUy82dORuSAO84QUEz09ylYcVLD+n
   XNPyjdn7jMjDwc8SyF02dZr1IYkZXN1SUVwK/Pc8HR7vVJXCofoeI0S6u
   4UQPuDbtpPAm7SS8uqbx9cYfSGpXbG4fkRkdb9Uvr22weSJK6mzQ93cyN
   gXPRyEhOPNkVx7qCBH2S4qmerw017V3T8ao8kPlDoNqwqvZuZyfos0aE2
   A==;
X-CSE-ConnectionGUID: lnJJuCPeR3iBAsb3rdD9IQ==
X-CSE-MsgGUID: +RIT2gtfS2KyrW/x9MvocA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77033686"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="77033686"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 16:02:42 -0700
X-CSE-ConnectionGUID: HFi5c52SRbuPKzEAm7FBkA==
X-CSE-MsgGUID: zk7ygEJBQ42HI8c67EXtbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="230159413"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Apr 2026 16:02:40 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCQIf-000000000wH-2CvA;
	Mon, 13 Apr 2026 23:02:37 +0000
Date: Tue, 14 Apr 2026 07:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Johannes Berg <johannes.berg@intel.com>
Subject: drivers/net/wireless/broadcom/b43legacy/dma.c:178
 priority_to_txring() warn: inconsistent indenting
Message-ID: <202604140729.2mAAGWwP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tiwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f00132132937ca01a99feaf8985109a9087c9ff
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   11 months ago
config: um-randconfig-r071-20260414 (https://download.01.org/0day-ci/archive/20260414/202604140729.2mAAGWwP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a0e2cb6a9063 ("um: Add VFIO-based virtual PCI driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604140729.2mAAGWwP-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/broadcom/b43legacy/dma.c:178 priority_to_txring() warn: inconsistent indenting
drivers/net/wireless/broadcom/b43legacy/dma.c:678 b43legacy_setup_dmaring() warn: check likely/unlikely parentheses

Old smatch warnings:
drivers/net/wireless/broadcom/b43legacy/dma.c:183 priority_to_txring() warn: check likely/unlikely parentheses
drivers/net/wireless/broadcom/b43legacy/dma.c:917 parse_cookie() warn: check likely/unlikely parentheses

vim +178 drivers/net/wireless/broadcom/b43legacy/dma.c

75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  169  
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  170  /* Mac80211-queue to b43legacy-ring mapping */
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  171  static struct b43legacy_dmaring *priority_to_txring(
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  172  						struct b43legacy_wldev *dev,
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  173  						int queue_priority)
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  174  {
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  175  	struct b43legacy_dmaring *ring;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  176  
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  177  /*FIXME: For now we always run on TX-ring-1 */
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25 @178  return dev->dma.tx_ring1;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  179  
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  180  	/* 0 = highest priority */
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  181  	switch (queue_priority) {
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  182  	default:
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  183  		B43legacy_WARN_ON(1);
ce3b6845fc4d96 drivers/net/wireless/broadcom/b43legacy/dma.c Gustavo A. R. Silva 2020-08-21  184  		fallthrough;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  185  	case 0:
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  186  		ring = dev->dma.tx_ring3;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  187  		break;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  188  	case 1:
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  189  		ring = dev->dma.tx_ring2;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  190  		break;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  191  	case 2:
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  192  		ring = dev->dma.tx_ring1;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  193  		break;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  194  	case 3:
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  195  		ring = dev->dma.tx_ring0;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  196  		break;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  197  	case 4:
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  198  		ring = dev->dma.tx_ring4;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  199  		break;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  200  	case 5:
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  201  		ring = dev->dma.tx_ring5;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  202  		break;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  203  	}
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  204  
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  205  	return ring;
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  206  }
75388acd0cd827 drivers/net/wireless/b43legacy/dma.c          Larry Finger        2007-09-25  207  

:::::: The code at line 178 was first introduced by commit
:::::: 75388acd0cd827dc1498043daa7d1c760902cd67 [B43LEGACY]: add mac80211-based driver for legacy BCM43xx devices

:::::: TO: Larry Finger <Larry.Finger@lwfinger.net>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
