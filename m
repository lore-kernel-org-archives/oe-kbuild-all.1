Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9322A3B297
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716648096; cv=none; b=iAnEfXwjfxHtM3hnThtcbUdDz0m9obPEaY3o7VmjmTDIj1h5bStbAFngew4VrBAjr84kvvrbOpa8HL73rQ2DAQ51vT5fn2PGgsc1OlAX9jV3yY0YiEdkr8QJdCpsmQCzcE7RE5JPA1WSbfKHwrdJdnGcWYNiSrfc5baaESHL5J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716648096; c=relaxed/simple;
	bh=/S8zcSwa2dIevd/CgGiKUx6pDaiIZFqFyEZ3lqSOSmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H218+PHHCXiXSgUiPoM4rUM9OHEhgFzTTE1w5x16KPqMacgGNnAlmeCq1PVtzJvKAOKcvFT1HjXG1foYXVx61ibVWRJazlPcaDKTvgfhosEeTR6cjRp8NrXcaDBB9EQJ8JyGJYaIUeJ22UaONHxxziRkWHs0f+o9nlq7reo9IB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cu5cfLX+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cu5cfLX+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716648094; x=1748184094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/S8zcSwa2dIevd/CgGiKUx6pDaiIZFqFyEZ3lqSOSmY=;
  b=Cu5cfLX+7/BH6cJka5sK7k/WpKgd81+FGsdMVPl91kAv2kOLWgtBAVDq
   LV937zd50dKq9apx3k52GkSzaSkOFZongqdDaJLWDfAmDlT9UUKMEDYfD
   QRP+AwgP57dH6/FZbgP0Eaji4NKRkfSUpuowSR8tDt+EHtytCBsxsGL41
   OJNaqhVsLqnE/A2bUTO/N7rwmOivdY/BWZE7ft9HF+LKr/Ok3kFqd9Cdo
   ZDdxo5Rk+2DbjWlALcc8Js3nVU0ZOWdiXl8UjRs1XbcCbGsCsfApfO/U8
   PNGk46iuu3OPt8YY48B48mxRclGbiI8YV3zKRRekkrfiHuFjcAA7GuuVK
   g==;
X-CSE-ConnectionGUID: RdCsMV+oSwuYAOMZPx+5QA==
X-CSE-MsgGUID: 2bZISi38Ql6+aflncdTaHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="35532524"
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="35532524"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 07:41:34 -0700
X-CSE-ConnectionGUID: x6rC1gyPSYWyfJus4gHFLA==
X-CSE-MsgGUID: oiTWaonNTUOh0ZlRItMY0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="65534067"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 May 2024 07:41:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAsaQ-00075F-1v;
	Sat, 25 May 2024 14:41:30 +0000
Date: Sat, 25 May 2024 22:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v6 8/8]
 crypto/asymmetric_keys/tpm2_key_ecdsa.c:214:19: error: expected declaration
 specifiers or '...' before string constant
Message-ID: <202405252206.HX0Vb0uO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   a792222ae295be62032d816584a164ce79c1dffd
commit: a792222ae295be62032d816584a164ce79c1dffd [8/8] keys: asymmetric: tpm2_key_ecdsa
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240525/202405252206.HX0Vb0uO-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405252206.HX0Vb0uO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405252206.HX0Vb0uO-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/asymmetric_keys/tpm2_key_ecdsa.c: In function 'tpm2_key_ecdsa_preparse':
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:83:13: warning: variable 'name_alg' set but not used [-Wunused-but-set-variable]
      83 |         u16 name_alg;
         |             ^~~~~~~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:78:13: warning: variable 'object_attributes' set but not used [-Wunused-but-set-variable]
      78 |         u32 object_attributes;
         |             ^~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c: At top level:
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:214:19: error: expected declaration specifiers or '...' before string constant
     214 | ODULE_DESCRIPTION("Asymmetric TPM2 ECDSA key");
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +214 crypto/asymmetric_keys/tpm2_key_ecdsa.c

   213	
 > 214	ODULE_DESCRIPTION("Asymmetric TPM2 ECDSA key");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
