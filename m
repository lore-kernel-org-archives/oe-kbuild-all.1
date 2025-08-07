Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8657F1FE44D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 17:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754589585; cv=none; b=jsuK/AiEvd+wB82WrkkN5/y2ROo1Tt6X65+r7bz0F/SjSy8AHVk1Y6Q6EmjR4O+sLc6dZcvfhKNzJ2owczBhOkAtNcS311eVEOb1UY28dzjaGK1ECI6uIE/abOOqjvr8G1Y4z9OvxIfWR+MxxRPIMnbWthgMJTLJu2jf/VwgzBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754589585; c=relaxed/simple;
	bh=NMp7eAx8M7eQcMBwoZt8BUBNYZEs3Ri7CxhJo5Fm4sk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c3TmfInv7zRP7IrjdCaKtD5+uJNJI6ny20O1SH0sNs1M4vg0c2sG8DE/VmHbHQ7EoueYD2AWZvojfTpN3N2IqZwqVW4GLdD1DzecNljz6TUpL8wSS7xYUR8mXITRI1JawCVksP1b1Xg5bqcT/7dmKg466KmIWVeQB7LT6bd2sZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiwTbE9i; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiwTbE9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754589585; x=1786125585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NMp7eAx8M7eQcMBwoZt8BUBNYZEs3Ri7CxhJo5Fm4sk=;
  b=OiwTbE9iJLiaQcv99T+w4oJxoGIK38rXPaO7JFfttKgcFumOav+Hsv8C
   eYGrDMOzkv+F9FcDUdNmbPWnIAWKosiu7EhIyT1zAnvmVuq+iEn51kLEj
   IP90cttGdw4z5R7YSZKFM1Cm9o4qzLYu7ggpeIPFEIYHP3/IUXMaOpjG6
   WfuZHLL/W7sOaZNL8mAB5UKtObjhWq7iijzrNsTnG//13Tba7HjgfxQ8w
   +9ifmNGp4p4TR9+55/PARhxbQBbKveoDGXRu9+kZTI7kl3piVApeaCuf2
   L9dV8xqwV/62dwoXHPik6fRdvAr6+OpoaUCtLq/znuN6uwcZCoD0Jhdkl
   w==;
X-CSE-ConnectionGUID: 0CZ8lNgdTlmFnsQKSTc3Cw==
X-CSE-MsgGUID: XkmE2R0TSO2qrveS3b2Izg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56142143"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56142143"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 10:59:44 -0700
X-CSE-ConnectionGUID: 1KhGI1EkRy6V6V5fIGrJrQ==
X-CSE-MsgGUID: 8/aPishsRO+9vCYwS42F4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165139937"
Received: from unknown (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 07 Aug 2025 10:59:43 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk4tw-0002VH-2J;
	Thu, 07 Aug 2025 17:59:40 +0000
Date: Thu, 7 Aug 2025 19:59:29 +0200
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [frederic-dynticks:kthread/core-v2 33/33] htmldocs: Warning:
 Documentation/admin-guide/cpu-isolation.rst references a file that doesn't
 exist: Documentation/core-api/irq/irq-affinity.html
Message-ID: <202508071911.GID4tmP2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core-v2
head:   f96c640e8d63f662d0b1c0e29387851b7e9b495a
commit: f96c640e8d63f662d0b1c0e29387851b7e9b495a [33/33] doc: Add CPU Isolation documentation
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508071911.GID4tmP2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071911.GID4tmP2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt-link<../../networking/netlink_spec/rt-link>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
>> Warning: Documentation/admin-guide/cpu-isolation.rst references a file that doesn't exist: Documentation/core-api/irq/irq-affinity.html
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
