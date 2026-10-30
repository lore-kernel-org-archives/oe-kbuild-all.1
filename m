Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394159;
	b=VNLTODLXXcB7Cu7f+V/0kCsnYVJ+9t8WoXEmdwVJTHu8jd/wSi1zTk72V6EDefZhxZRV
	 VvLxJRSWrSWCVVNqbanfC1eDiVnTup2iCdHRDZtBQj7R2UfT7JKrJHOGyc9i6r3KlGGgk
	 vAXfekMy+jaVAzlmmD+uqFa5HxqYhH9jmfqJBa2nJ6i8bQ61Ii7RsWIfoGFWb6bpjouJn
	 meBTJwQNZ8YXAi7lmAgvlCC4dataoJO+0DSbW9MPdj8UzxkGkCwHXrbn7pf5e2VTK9Qk0
	 tGcAdLPnVcTzvAdXJ3qIo9ydcJtRtwpcI6mr3USeQRcn1MS7BUTTMBfu5OmfM4IxZdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394159;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pPencj9T1jUvcD3mLFcVY2NzvJ01P445Mh1teZmUlcQ=;
	b=naPbznH6qHQx+ky6eHpK+UBWIgjKgjuPJNXkXkERQqcnIcSX/L0xbvk9tq/f2Z+8vHGl
	 TDDO/puNaCanOf0DoJ/RetTAYIG19IkTfrcEo7A5lua6ZFoTpmsYqkbl57hWiT/6iLs81
	 nm/hqHvZ8bVrN6uY3qK1SKcUnZXejU0YgDUbmJs5cFKf7JqW4YIgGH9FUzowq+bnfatMK
	 zbtmwR12QR2KCobucflKLqyAQkQKiW0vZSVOPl7HXuXyarQjWq+WnNkzDoLOHcxVzOdIE
	 3nkCuBVHgDnGx3i+uRjo2XW/BX8Ao02uE8upzqt+V7WK5118HxvmXXJwDWzBf9sN0vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="XILQFy/Q";
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931D5606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 21:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 931D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XILQFy/Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793394158; x=1824930158;
  h=date:from:to:cc:subject:message-id;
  bh=qGtuYytAk3rru4CA6rE3dACS6JD7QZTrhi4HAR8b8+A=;
  b=XILQFy/QWC//7Q9fBmrYpnI8sixzsbyHW9DPCIe5+NFHin6eyMpTl4FD
   UoVRP0sjRPtAa/lhzKOi+fAdSOat1RKoPn/k1RQ3BxfejBelFgHY5dlWs
   mIFxIk0T4qfqn2qm8vNsgUI+lfAnt0DUXbuxQ6aAF4VGsp5gnsPTdBV+0
   9N0Ed5JtTaFpEjsPwdHu3xiwaWvK0EmXqARYK23Wq2H1H5XYpXVORtt0o
   NRm4BbCctqGYS8tHFQGrTtgI4w47VFKLxw8/jmxKpv06GTF4QL8BgwZsB
   7QRCHhOAy83EQ8apuBNkuKwN9M2nQm49CDeIEexh9rQ0TQRZVEY16OMO/
   Q==;
X-CSE-ConnectionGUID: GSgz79bMSxSS/6ejx4oP3Q==
X-CSE-MsgGUID: ceChQPM4QdKYx5f0h8dHsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2269753"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2269753"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 14:02:37 -0700
X-CSE-ConnectionGUID: ashngINcQ2mMK7h8O6Ea0Q==
X-CSE-MsgGUID: qX6cC5nZSPuCqsoeZA0hgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5548151"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2026 14:02:36 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMtk8-000000005hv-2cEx;
	Fri, 30 Oct 2026 21:02:32 +0000
Date: Fri, 30 Oct 2026 22:01:57 +0100
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 105/215] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202610302159.Big0jL6f-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   67065b51dbefd899d6f23f460bf8f7153c0015c0
commit: 81aee0a3ef02dd7f1dcea496cbf15f60f8f97c87 [105/215] drm: apple: Override drm_vblank's page flip event handling [HACK]
reproduce: (https://download.01.org/0day-ci/archive/20261030/202610302159.Big0jL6f-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#69: FILE: drivers/gpu/drm/apple/dcp.c:66:
+	/*
+		* e->event is a user space structure, with hardcoded unsigned

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
