Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968012D617
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 07:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783754050; cv=none; b=cSNZpWTANQ1BFYCe+Af6/5wHSvU8yPe4RNA79j5Dtum5ypuA6eYQ9usPQDwDPu3HjEhDIpZzYfWmhsf80L2L1hRXJ3QT4yZHyxoXxyAlEvrBBhKYdHQLRUd2FsUWwQCLdhbPdYnE5bHJ+VtksC4ahyBDDO2PBzGwP50Y5ADansQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783754050; c=relaxed/simple;
	bh=i7bAYBy1yZBZCnAphxSgOCn/klw0hXauPcaPRMy2EpU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JHXTA85F2SNno6f8tg6xfEFKumNmmguJPT9aALiIzkFCIXu673D9Mcd9zVuUZzlVTInfAdaziibCmp/ZwhE8VHPJQyWrfZ8meltTrOCumz1UntbqmfEvfGVX8dzouc3joqnd4fuB+C+Lw++NljUM8uzZYc5TvXnRXk6AeJ0lq7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SANxukbl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SANxukbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783754047; x=1815290047;
  h=date:from:to:cc:subject:message-id;
  bh=i7bAYBy1yZBZCnAphxSgOCn/klw0hXauPcaPRMy2EpU=;
  b=SANxukblKBOOTUsPLq7bZ7WkS2KIoRXMfNeXX16zShj8E3Uxpt3FXXOH
   XdRF46Jlh7VjtK/Z2XBTjlR3Rl6K25UQAsSQdR/Ik8KLvRxm4T5EYhBQh
   l1ELugjXZ08WsVblq6/+XPTQCQaUUnm/6ZFgPsktJBYZCn+p7y2tIJUO5
   VajuFYJ7N3W87vOj5MP1iNpiAB4fE/9N36DeOa/ouQ07h/4A+fvIR+Bhf
   HL9YzG5psIOOmzOA9rAg1NcDIMNB85CeONfuN8Kv764LDMa5CInXV/F8N
   ssHMXdYzg5NsJ5A0eXzGEZUK+rtl0jC6Mpgn4PBJtMgfyfhrtK7BqhOFi
   Q==;
X-CSE-ConnectionGUID: 2B4EnkF8TtaCPd1wIAnluQ==
X-CSE-MsgGUID: rCeWPYZeTyCDUnLlsksDsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84493359"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84493359"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 00:14:06 -0700
X-CSE-ConnectionGUID: AHvpfeYdSKeHapXLch7ucg==
X-CSE-MsgGUID: 4AprfZolTpSroQAFalYXYQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jul 2026 00:14:06 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiRuW-000000003Jl-01rV;
	Sat, 11 Jul 2026 07:14:04 +0000
Date: Sat, 11 Jul 2026 09:13:16 +0200
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:apei-sashiko-fixes 5/5] ERROR: modpost: module
 acpi_extlog uses symbol cxl_cper_post_prot_err from namespace CXL, but does
 not import it.
Message-ID: <202607110935.W0TPpfLI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git apei-sashiko-fixes
head:   477881d6ab1d71be7860a41b4979a5d8817d3caa
commit: 477881d6ab1d71be7860a41b4979a5d8817d3caa [5/5] ACPI: extlog: Defer CXL protocol error handling to avoid lock inversion
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260711/202607110935.W0TPpfLI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110935.W0TPpfLI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110935.W0TPpfLI-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module acpi_extlog uses symbol cxl_cper_post_prot_err from namespace CXL, but does not import it.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
