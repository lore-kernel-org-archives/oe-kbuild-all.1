Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF68938910C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259941; cv=none; b=YtQ5vTbqN4uZRaKlUijEt3f0q0AooQYzLB3Hznn6ninV3GCFxdgljScqPe1kpoT4xyV+3RfMRT356jszRlxrAknI1RabvRLmpNNxC0RiMhiJpCQmIf2jjzaCo2I0pkovl1juRuD3w5wbIRic1EorhKxuvaL7Fmd4Oiv7wZN0Fb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259941; c=relaxed/simple;
	bh=2V/5hjdOqIOki0hxU/OUGni6YNUcrMavoWQV4kuuVjk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y0YpIm5l+HVNkWF8rgACPD/kb8Hcy64pjnSgcj3RY463GoH4eti0txC5uAUdiKtZFWXaKzcga4eovG6zGyPluhSZtzj1KaftwzLfdtgFqcVoJB2t/pEYLOKAUHQ1NiQs8Zozrjox/ftWEHKJilHyoViLFGkFRacPSDDeFcMwsjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAItJyOh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAItJyOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774259940; x=1805795940;
  h=date:from:to:cc:subject:message-id;
  bh=2V/5hjdOqIOki0hxU/OUGni6YNUcrMavoWQV4kuuVjk=;
  b=VAItJyOhq0phgdpntSQIBm8E7DrNyHYqNVgA9DAMIUTO38yGNs8dWdnm
   QtaRTCmiCue8CVu1T428i23ipfrv7KxBrDkAIgjTjuZNFuJvZ+I4wCDfb
   oC81rdIhtdcNMMk4SagnZdbURq4Zsn3NxWbvaUuWHSUzL+XGvpRPlzB35
   /tL3XI3yVm/o3Sx2ET4YAZs1fd5qBmeKyXg5kWH5BmuwJV9hJWfKci2eT
   YvpS/RrzVfAjJjqfJxa0S5faNBi0Qf/3lOxQw2PNLCsYx3nLDi2BeZL37
   YgN59BiEJncbV6B+HENGaslcsEJZcLYGO/hemcPaDGtlY9HbMlLx5PtRj
   A==;
X-CSE-ConnectionGUID: BsMOiFb7RZiRbvvlnJBeKg==
X-CSE-MsgGUID: V371ERWHSgan5pIuRQ4NDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75319693"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75319693"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:58:59 -0700
X-CSE-ConnectionGUID: JtFsfbMdScKwdJCsvHv+2g==
X-CSE-MsgGUID: UazV1mL6RCeCScVQ1vIm7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223174225"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Mar 2026 02:58:58 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4c3j-000000000Jp-2Q2z;
	Mon, 23 Mar 2026 09:58:55 +0000
Date: Mon, 23 Mar 2026 17:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:lib-raid6 32/44] Warning:
 lib/raid/raid6/algos.c:76 function parameter 'start' not described in
 'raid6_xor_syndrome'
Message-ID: <202603231723.k8XPK91E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git lib-raid6
head:   f423762908f818de59bf73cf8f6c1bb45c5e595a
commit: 434f25b115208d66e4b7d7724fa09e6edfa4fc40 [32/44] raid6: provide a procedural public interface
config: loongarch-randconfig-001-20260323 (https://download.01.org/0day-ci/archive/20260323/202603231723.k8XPK91E-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603231723.k8XPK91E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603231723.k8XPK91E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/raid/raid6/algos.c:76 function parameter 'start' not described in 'raid6_xor_syndrome'
>> Warning: lib/raid/raid6/algos.c:76 function parameter 'start' not described in 'raid6_xor_syndrome'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
