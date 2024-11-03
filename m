Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB4A13B791
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 20:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730666746; cv=none; b=TyYthKKwvYAKgUa5dQw/xhTY7zKuE2fUSYDyfnYGwf1rDCy+ojM3z//SDY+uef6SR9R2QrS+7NLcsxTc8uavmGG8So8gZp2GpkpHDQ3AIstBT/FXDKuIPRKsxnmP036MkCIVgOsFxlAjUrK0t3iYV1Q2ch+g4zKLIiGorKa4fgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730666746; c=relaxed/simple;
	bh=R5onLUtkZSWhd/SV3GdRT2X25WHiMWZshPM0L/8m9+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iA3BimgvJINb9APrm/Sw6UkEdUGC1N7gfaeyxLIRWx5UxoqF76tEn6rH0hnbQLcxC2kmaYwEr21Bp0HLzHa1ITlxq6GV+SSDjLyL7Ds6UFyxOclo3XefvBvV33ePjCLtWc/7nmQsR/KUQu5qtWc1Jnfa0o0c9uZ7SyRAOqACF1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDVcTIxE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDVcTIxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730666744; x=1762202744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5onLUtkZSWhd/SV3GdRT2X25WHiMWZshPM0L/8m9+o=;
  b=UDVcTIxEM1fVNWrKO8Br3afMAkmaRmBHeYYr0RO/L6+E1YeRWTE2e1Os
   g0hTB+9QFE8mbrtu04Z2nEhP6o+NePMhmHL34vhMf/uUhWBGeWGoEEWib
   iNvZ1zCJmZCr1redVhVncCGtrhKEXRqr21/XhR/wxZ3jYZ0xtyMMJbBl3
   6jVo9gWHW597q/N55bYdGnPP+RWDzilam3Db2OyWvpDAah/8LnxEdUVGw
   XyynQ2Hf8SeNTEMWQpIgYT9RL7BkjGPrzGvDMBI2nr1ZZs+AdR7c5RstI
   P5oAQ/IXD4gymprGtQNqYd4kUs4Qu+nJdqSIKqVhudYqRdaJAK9RH8VlH
   g==;
X-CSE-ConnectionGUID: b9LEuvztRlegIxwv9pWQDg==
X-CSE-MsgGUID: 7JHndy8zT6aMmdvfFoTLYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="40936092"
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="40936092"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 12:45:43 -0800
X-CSE-ConnectionGUID: tuWAeccZTi29fyLJSgHoPQ==
X-CSE-MsgGUID: NZoKYltxTC2IDvWbTf4Ygw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88230641"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Nov 2024 12:45:42 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7hTf-000kCP-2H;
	Sun, 03 Nov 2024 20:45:39 +0000
Date: Mon, 4 Nov 2024 04:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1245/1245]
 drivers/powercap/intel_rapl_msr.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202411040437.gAyBpy1E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e833cceaa63f729c44be494d90d6ee3bfaf22faf
commit: 0ea5d304521b68fb459c57e55f3f1bd853127bc7 [1245/1245] intel_rapl: abstract RAPL common code
config: x86_64-buildonly-randconfig-005-20241031 (https://download.01.org/0day-ci/archive/20241104/202411040437.gAyBpy1E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040437.gAyBpy1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040437.gAyBpy1E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/powercap/intel_rapl_msr.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
