Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCD5309DDB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 16:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774109816; cv=none; b=GkVeXEC59L01HWO5oJP6SdUBhwC5U3QeGEeIr64YZRHz+I1lVn7j+vngY88DqCtRHDQHuVt7lMnHSyX2iXDCPVpbaDtjy8C4C37xJ88GpoGqsTE2ohJPeJJ09j+HbrG2PS1d40VVGVl/xyJRF4yThsDfgnFFdk14FeUZ962DIB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774109816; c=relaxed/simple;
	bh=c3qRL3imuSLqfLKrVrWVHgPZXpt9zZvQlaCb2FjoPzY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O+4WsCBtaNxvh9B9L+pG9KnbFC7j6hTtp5Lg9dhqxqLPn4LHMgF631bJz9q7UKZx6ohMPozc2BboBjFow+zCs/5nPDCzY4/8/A6CcmrLKQ7I2PrU8JzCwInwZi9YxKM1Ml+R4QwTsccQx/ygZbWCB3i5yjzLZfFqhGNOQTM1wVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXHZwK4+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXHZwK4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774109815; x=1805645815;
  h=date:from:to:cc:subject:message-id;
  bh=c3qRL3imuSLqfLKrVrWVHgPZXpt9zZvQlaCb2FjoPzY=;
  b=gXHZwK4+joK0df4Qbgrem+/cdFLTZKIgjWoBrlWQzvNwdb2bNk+gss+F
   gs5tZoeN3qUqHTYtiGFve4eEFPe5SqUiZHzFQ5ztfQm9ebkZiL6Dg2i53
   AENWELK/Cui/NzO+Ck7KbEpWnZv9nXHyiS2ff6ZAxyd4XNNR6D+NqU9Ot
   Xm1yvnZmzgxT12ieOmyuSslz43PUR+YuxZ6uueVBvpUBtevtwAYf0RrRG
   oZ6s/JU9T774ClX/iXcl50dyfpB9nO5dTNyMRlUadTrmWLG6W7tD/Napk
   i+onVaW+6fcyGE0pV7m7JNPZTcqX5BilK0BXfw5VOeF4e9RSlTgWD368+
   g==;
X-CSE-ConnectionGUID: iLtIKsnpRMGiMhgpgSLHvA==
X-CSE-MsgGUID: 39A1PK/aQluOyXrEb4pfEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="86539350"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="86539350"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 09:16:54 -0700
X-CSE-ConnectionGUID: Df9UMDznS2KXZet3K1dGdQ==
X-CSE-MsgGUID: 2ztEBIheTAC/+ezP+f8cug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="225417686"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Mar 2026 09:16:53 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3z0M-0000000010X-2W9h;
	Sat, 21 Mar 2026 16:16:50 +0000
Date: Sun, 22 Mar 2026 00:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Subject: hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x406d4): cannot
 reach 00002fa5___trace_trigger_soft_disabled+0, recompile with
 -ffunction-sections
Message-ID: <202603220051.D5o1RcHT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a0c83177734ab98623795e1ba2cf4b72c23de5e7
commit: 5eb4cb18e445d09f64ef4b7c8fdc3b2296cb0702 xfs: convey metadata health events to the health monitor
date:   9 weeks ago
config: parisc-randconfig-r134-20260321 (https://download.01.org/0day-ci/archive/20260322/202603220051.D5o1RcHT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603220051.D5o1RcHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603220051.D5o1RcHT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x406d4): cannot reach 00002fa5___trace_trigger_soft_disabled+0, recompile with -ffunction-sections
>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x406d4): cannot handle R_PARISC_PCREL17F for __trace_trigger_soft_disabled
   hppa-linux-ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
