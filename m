Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229E7222592
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747414571; cv=none; b=shi8SwAgZfHX0/LQuDhIaMe2bgCnp31nTZOdrH7XO0yQ7W89fv4sx6e2MNtWTS37yp0i87sqKF04mQdGBrJwC9RPnm7NyDyt5vAz5WL8sKMsiTQmr74uZJHhcrq1yeqdZcQJ033V2KHL7+FF4g5cGmGtDzSiV2Wfco2Xh4YNB4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747414571; c=relaxed/simple;
	bh=b0dbjtp3FPrSPO1I5Qi9K1IWGVtM1h62IkY1BWeGYq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CbtDO6eoFmq7/xJyi/qCquDsY3PPlbDVu7p/Mm7ia8+98V98m5N/de29aHDhhM2Ibud6YX3p2oaZFCCzDOIUXmL20fz9BVFRFEXceQKdFlOikRjvbpIGNJNxxTD6SI5fH3URotVuSMI1t7BAEt1rYXiPC9BO323smVLUxb7CoxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQBvWk0n; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQBvWk0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747414570; x=1778950570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b0dbjtp3FPrSPO1I5Qi9K1IWGVtM1h62IkY1BWeGYq0=;
  b=CQBvWk0nJ69pVcSsuLwdBPAo1V5OdwR5HC36EfnbvHsRlybV2GOTsZXl
   VcNnP/LflFOmbMYv8ZAg1VtHTmYXFiNRtyA9c/wYHMXbiqXueWlNfnrbv
   puflSP8e1kqvMasmOgUP8qNmlV5J3+KWQLOGFs3YwdUtfG5FYaaPasWBI
   G+qCs81i6XdztEhrPF/cbJa3458tzBUk4GFRc5qTXIEihUTv5dokUiSFe
   qGpVqXwDcRP/+wMKEz6nArOnIkG5O5K8RMp/mg/Et1I6ewKxf0kcGCzR+
   dPxNIxI+b66rNiAF8+E/XatQ3kxjMuquJnvojf6jnltGznzNcQiEtVPIA
   Q==;
X-CSE-ConnectionGUID: WlPy/edBQnieO1yEa77lLQ==
X-CSE-MsgGUID: 64Su/qInT42OAI8/WWgIZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="59622209"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="59622209"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 09:56:08 -0700
X-CSE-ConnectionGUID: X1pI0rY0QLCSnoUqs9SHbw==
X-CSE-MsgGUID: UQSgWRSARYai816uEI6lvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="142740125"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 May 2025 09:56:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFyLs-000JYD-0y;
	Fri, 16 May 2025 16:56:04 +0000
Date: Sat, 17 May 2025 00:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: John Harrison <John.C.Harrison@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [linux-next:master 11515/11779] kismet: WARNING: unmet direct
 dependencies detected for STACKTRACE when selected by STACKDEPOT
Message-ID: <202505170021.mxubJupm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8566fc3b96539e3235909d6bdda198e1282beaed
commit: 16b7e65d299d56442879405ac85800877fa51355 [11515/11779] drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from
config: alpha-kismet-CONFIG_STACKTRACE-CONFIG_STACKDEPOT-0-0 (https://download.01.org/0day-ci/archive/20250517/202505170021.mxubJupm-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250517/202505170021.mxubJupm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170021.mxubJupm-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for STACKTRACE when selected by STACKDEPOT
   WARNING: unmet direct dependencies detected for STACKTRACE
     Depends on [n]: STACKTRACE_SUPPORT
     Selected by [y]:
     - STACKDEPOT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
