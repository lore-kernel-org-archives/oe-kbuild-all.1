Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ADD64A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 00:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735604707; cv=none; b=qxrUpi3QOEZ+5jMQPx7nkbL94FF7yIWCr/XrvboFs+cNocw0Pdja/BL+BMzprWKV9ZSTYzFQgpKEhNXL54fcw29E3Hb0TVJMXT5DvRZWgWcve9CC0zdAbvEsoTRqC+GWWEd51aOJDqVMeEvZgstZJnT0CbBemjPunGwnMrqbjIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735604707; c=relaxed/simple;
	bh=nGvG8W8oF12DTHO0g8FN+T7tQlMWLm4pHu+XgJGJKQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dcRLnr8h4mhi4IkQCns7MqkLBPzXKNu+1otpUDKVS9NxmzsPk6FG9Gga3ACpzyCCFcB4tu6OsW+GdTLd+a+R0+ku8Xe6QicVWh6ZL/5xMJ3s0Qp59J7fFU9KrQyNaq2RAvEns8LJwhbOhm/8pkVbVs3qgkHn6KL0kN3cjj3VNTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHy1Oz3g; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHy1Oz3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735604705; x=1767140705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nGvG8W8oF12DTHO0g8FN+T7tQlMWLm4pHu+XgJGJKQU=;
  b=lHy1Oz3gleMEAyWi84YdhaR2cFzejDzxqtCBfVcT8cW59PB4OAsiEShu
   xC77JMMh0Rx4kzWcJQEeLKJXTpHiI/q0sz67J66dvI9xlXpTqCxMvWyna
   O0mvdw/naoAuDZiUCtRIUXQkjjKc3oM89YJyxHP7d4BZeS4PqDR7glOeC
   aQ9gV2zKvhHzGya67nPWJ+RxCzgEZQ3QV5AelkjUbAs/v4YGXNe5jNmtd
   1pKxy685Ps21LaUrQgJ+3MgjvhoIHMRH7a8JopI4DjwOXjFq1q+Jt8AJy
   ZflSSpseIY7oBc2IyQC/0Xpm7Cd2uaXBMGJC7nqmgc3nshmaSlvlUS6vt
   Q==;
X-CSE-ConnectionGUID: aHpV3FahT1eCd1rWXp9XeA==
X-CSE-MsgGUID: Ag+RRuA5TWCA/qVyohlyNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36002382"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="36002382"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:25:05 -0800
X-CSE-ConnectionGUID: uOUXD+/RRLKQPC6XahAdIA==
X-CSE-MsgGUID: JNrcxDldRE2y1sbpYhLVYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105983297"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Dec 2024 16:25:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSQ4E-0006Uc-00;
	Tue, 31 Dec 2024 00:25:02 +0000
Date: Tue, 31 Dec 2024 08:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1359/1359]
 drivers/crypto/zhaoxin-sha.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202412310854.WcNZPiL8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4dc4cec05b40921a3db85d24f97f1142272e4abf
commit: 0f74c26725b8cd5e9b968081850c0303a9fc9137 [1359/1359] crypto: Add Zhaoxin ACE driver
config: x86_64-buildonly-randconfig-004-20241231 (https://download.01.org/0day-ci/archive/20241231/202412310854.WcNZPiL8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310854.WcNZPiL8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310854.WcNZPiL8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/zhaoxin-sha.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
