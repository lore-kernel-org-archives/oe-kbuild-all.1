Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7E616D321
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182077; cv=none; b=kY4ClcA/x3wsED/Qwcnsyo8mb5I3ulga19rc1lBxRMm6KHZELCARsS603J+D8PxPc5WskJsOs7iUD9T8ZTNt+8XmnD4bJyENCC3dZDjJUlgt65rm+/pbmJrLoknp52xojyn9jPoshScaLMaiEbaLzJ2lqT9eOUeZmDWZyaPCLqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182077; c=relaxed/simple;
	bh=+KoR7BLQjFg060/MJnmJIHze0Onhpd6qTOZM109E19k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VSqWRnwKfWnQtq2/a27eZfOhhiJnsQuzLh7eA40YeK4Keyha6GPZGhC/cfatmR+mdrEECtbDGKxGML0DvPWT2fPNYdrZWl0sGxgm3us+ncbaG0cbeBllafguLUjI4hjqRC2dSNU84pysbu0Ac2rx0/y9kcYKzdBsKDyovKxLOi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ra3tBa+a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ra3tBa+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718182075; x=1749718075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+KoR7BLQjFg060/MJnmJIHze0Onhpd6qTOZM109E19k=;
  b=Ra3tBa+aBxbtjX4ZUH81StAtRQjVv6HFhJukkXE+QSNI72iYEvlmmSV5
   rFOfSTvDkbgagp+vRVUgldF2coBio3Nua8W9HMaphTV62goH3BNQUPPg1
   HGqBwgA6GEmGC+4hkZn7YMLgIMHXDbX5WJSlueWup557lEZYcGCsX5jS9
   0bODJXo5DLWPVPOTQkIZewjgBflOc9XSAYb2gcawMiVAOEugnvjG/FRMu
   hA4F7W2WQlGM9S0rIaN/ZYWbTqAIEA0afqaxtYS20p+Jymdzfdmaqx0P4
   qPv181MwsJ7KxR/J+NhEfXtkJwD3CFDqjRZjSt3eGnWTidIGEiV2+lmHR
   A==;
X-CSE-ConnectionGUID: 1LgKmzkGQBGvwvcVm7l0mg==
X-CSE-MsgGUID: qGLkFqkyTrmlUvNj46Wfpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26339579"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="26339579"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 01:47:42 -0700
X-CSE-ConnectionGUID: 6SpfQktcTvulu1BncO1V5Q==
X-CSE-MsgGUID: jsw4OjPPRdylePkGdkFVzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="40426030"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jun 2024 01:47:40 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHJdp-0001Nq-1v;
	Wed, 12 Jun 2024 08:47:37 +0000
Date: Wed, 12 Jun 2024 16:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 1/3] htmldocs: Warning:
 klp-test-oneline.patch references a file that doesn't exist:
 a/drivers/staging/greybus/Documentation/firmware/authenticate.c
Message-ID: <202406121615.NaoQO977-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   8d7a4a25d5c44f7e03ab4145e1957f0b0cdb8c13
commit: 2b5c0e4bee32aa92e186b0fc146d728f2715d01a [1/3] tests
reproduce: (https://download.01.org/0day-ci/archive/20240612/202406121615.NaoQO977-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121615.NaoQO977-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>> Warning: klp-test-oneline.patch references a file that doesn't exist: a/drivers/staging/greybus/Documentation/firmware/authenticate.c
>> Warning: klp-test-oneline.patch references a file that doesn't exist: a/drivers/staging/greybus/Documentation/firmware/authenticate.c
>> Warning: klp-test-oneline.patch references a file that doesn't exist: b/drivers/staging/greybus/Documentation/firmware/authenticate.c
>> Warning: klp-test-oneline.patch references a file that doesn't exist: a/drivers/staging/greybus/Documentation/firmware/firmware.c
>> Warning: klp-test-oneline.patch references a file that doesn't exist: a/drivers/staging/greybus/Documentation/firmware/firmware.c
>> Warning: klp-test-oneline.patch references a file that doesn't exist: b/drivers/staging/greybus/Documentation/firmware/firmware.c
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
