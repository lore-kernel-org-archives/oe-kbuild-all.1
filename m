Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282CF171A7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 02:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720061861; cv=none; b=qERyjVIlF0nN9yrF8J1QHwziHTNUmj1OGDxGOkUKAtbQb+hqj7Vud3RPv9NB3ltZyUMT6RDVArQnGEuLsnYZcb7O2LBhpr2w+AKU0TWraUVfsntQVeSHJzG2Eu90thEGS7MnHF7nGQjfoP5sFHNqttwuYBFRO1/X2S/iZlX8g0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720061861; c=relaxed/simple;
	bh=W/KC+KhzpkfKDEdTW3mOu7A5LDn3BsJbEs51/OJkyvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PNWyBIlHbKnwscgJYabpeJnoz31aBYJHOG/A4UH+EcGig2duCp6YpWjoqx0cxdcKTWQ2t7jYJK4L6nT4wfdeCvRM7ZT4Rv3dvLSEzmDSUCLDxUPmE4wnMC5J8SfUqaxEoR7zLUdsT88SPHNki+s9bzhcG4rJ0Qu4Zh6DLom7b28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJryIJBk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJryIJBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720061860; x=1751597860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/KC+KhzpkfKDEdTW3mOu7A5LDn3BsJbEs51/OJkyvY=;
  b=MJryIJBkw+qaq4Nm+PgpvC+RMrUzgLAmJ0llLOvkmnahxYPE9ARJ/AH8
   Op7eUZpnqyFcLIt4dm/ZT/ES3Jr0n+dwydJ2gbC17SaD2pdNj8GEmFiHC
   AhBUavacTrnolw7Ve92gIjxTIzSkPc5lrZC5RcgHjVOcPGzbzy1fyUyxB
   p4dRJ9b1Vv0XEhwWEgV75QptqMDEA3dF239Z6qLa0IGN1oT6ZhC8BlgXd
   yF+4YY/1km0+NTxdyVFHsp/4BVmR2lChRMv2RtydDHfFHIuqocSf4jEXy
   AQ7OfqbaNXVcUL9tYeFZkt5bBFK2FyFd2XqOIrRVi9X0B1iHDBsDWbEDs
   g==;
X-CSE-ConnectionGUID: ipVbtqYFTNqSpviWXFLyyA==
X-CSE-MsgGUID: BGQVT6IAQIiaWK6pDOXAtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="16974030"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="16974030"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 19:57:40 -0700
X-CSE-ConnectionGUID: Z6S1+6RVSkSwTGNkwtv4tA==
X-CSE-MsgGUID: WAJDVA6UTSi4gcct2E9ArQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="69653801"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jul 2024 19:57:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPCfA-000QTC-2c;
	Thu, 04 Jul 2024 02:57:36 +0000
Date: Thu, 4 Jul 2024 10:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:auth-null 6/7] drivers/char/tpm/tpm2-sessions.c:86:12:
 warning: 'tpm2_create_primary' declared 'static' but never defined
Message-ID: <202407041054.2eSgWco7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jarkko,

First bad commit (maybe != root cause):

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git auth-null
head:   864a82f7fbae0628e13654024490290adb4f4540
commit: 504dfb31a7e7566d4a7dca9bbfd3d2d04ba14eb6 [6/7] tpm: Address !chip->auth in tpm_buf_append_name()
config: x86_64-buildonly-randconfig-004-20240704 (https://download.01.org/0day-ci/archive/20240704/202407041054.2eSgWco7-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041054.2eSgWco7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041054.2eSgWco7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm2-sessions.c:86:12: warning: 'tpm2_create_primary' declared 'static' but never defined [-Wunused-function]
      86 | static int tpm2_create_primary(struct tpm_chip *chip, u32 hierarchy,
         |            ^~~~~~~~~~~~~~~~~~~


vim +86 drivers/char/tpm/tpm2-sessions.c

f09fc6cee0dcfc Jarkko Sakkinen 2024-05-28  85  
eb24c9788cd90d James Bottomley 2024-04-29 @86  static int tpm2_create_primary(struct tpm_chip *chip, u32 hierarchy,
eb24c9788cd90d James Bottomley 2024-04-29  87  			       u32 *handle, u8 *name);
eb24c9788cd90d James Bottomley 2024-04-29  88  

:::::: The code at line 86 was first introduced by commit
:::::: eb24c9788cd90db397b3e41322aff4a5557623b4 tpm: disable the TPM if NULL name changes

:::::: TO: James Bottomley <James.Bottomley@HansenPartnership.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
