Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E525183CA6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732696151; cv=none; b=mQ2VNF1PxVUd+FpLonpCpffmf1uCV7evLbprcKOj7cf9ARh++QBAdRwRkq48J2f81jsXK7uMXoNSxralhaXOHo6uvBGjVu3mNtXpKFPC3UN79ttPRGufjlGHdbhN+t6DrmlVI+2ZD0Mn74NqEMQUCcnzXrF+bk36I/24povhyxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732696151; c=relaxed/simple;
	bh=Q5NMeIDPmU9fBi6+ephiwaH0SGxu5w9iAPGCHyxrnJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nm9zP6x8RJlvRdAEx9D+Z+CxzZCy440RRXX7rlkd92MAPifMt4pu8ORZmnwXXmZnV2753cgkplnl7fUiaLAvZ4AEJs35bIKcjYBcB5xj8YegE8qmxcxE37paIOteizlXkTBnLGbD5Bp4ZqvLqDCd17OVTzbTd9tqwhn/rNS8ZHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nn0tQlu0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nn0tQlu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732696151; x=1764232151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q5NMeIDPmU9fBi6+ephiwaH0SGxu5w9iAPGCHyxrnJQ=;
  b=Nn0tQlu0hOfdjC3iqRbEvY/uLtY6LtUEJ/72lO6ZH5pSDYe6o0blDfb6
   WB4A7NmHT8UNWdAVD2Uf7jdHhiUrlNiGUYqY1SjKuESExkqNGlAPYhamV
   Nb3o2ST5ww7csODj6vh7m98hK3OuDaCBRmZOPc5vztPCuKBgZVZmTQ+Zt
   GjpVySslMW+R6HxVIV4ApwZYrN1+294JbWRyoVMoBH9y/rKbXH8agGj6x
   bG3Do9KevRcQ0lrgckklEEuxedIejJLKB2FiDIUEOTNK2yFJF4YaV6nvz
   d6XXt+BdivwQ2qG4NvkVK3szcfs+Ltg/GRbxzxGfLOxA3FA6sguZ4PXgQ
   Q==;
X-CSE-ConnectionGUID: sIANwFiZQfConEdpH1G/qw==
X-CSE-MsgGUID: kgbxDrbtTiSClun7nVoT9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43379847"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="43379847"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 00:29:10 -0800
X-CSE-ConnectionGUID: ftCm0qbpQCyb7YWXlpzZzA==
X-CSE-MsgGUID: UtpbsVJRSlCUCEMq2W8dLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="122846740"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2024 00:29:08 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGDQ2-0007qH-0p;
	Wed, 27 Nov 2024 08:29:06 +0000
Date: Wed, 27 Nov 2024 16:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-loongarch 2/4] drivers/platform/x86/wmi.o:
 warning: objtool: wmi_has_guid+0x110: return with modified stack frame
Message-ID: <202411271658.z7TG6JNT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-loongarch
head:   38dcfbe72402b6af003603a662e5720873f3d382
commit: 2a881be2e01ef4c6128b8c82c93347c0adce8d43 [2/4] objtool/loongarch: Simplify frame pointer detection
config: x86_64-buildonly-randconfig-003-20241127 (https://download.01.org/0day-ci/archive/20241127/202411271658.z7TG6JNT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271658.z7TG6JNT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271658.z7TG6JNT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/wmi.o: warning: objtool: wmi_has_guid+0x110: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
