Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9B445BE3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 15:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724081332; cv=none; b=AyKnXAuG6YX1HSbYn5E9/9g37KVNWAPZ4N4/eEyVBhh+6bZcrIOWoCbGaXTBgdPNlAybhbh/8wUtGk4bWBdwGRijSN471oPQefksFutgce/0vsk60ymwaC4xrBS+uUEfOcBlieLGZXMAjf8Ou7ocgvTaVGDneVsGd7gBCF5vP3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724081332; c=relaxed/simple;
	bh=LU9bSSpXh0CphCHr3GT2GKucWLeRl8bC1ms0sLI1vBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IMnlg2kmEyWBfY51sCG5vecLfVoSaueZygRmYkVAZE/sbcCn/cHuC3KW2tJCXDsa6UqUwwQ9hNijE6WbYCml1kYjgP9p6kT/ph6P4lCh8gY4bNVjbIXRUcBaJSqSAx68pyLqJj3bLqW/K3Kc9Z+SS7PxfOGlnuua1DGKd8SnZgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnPuqm+7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnPuqm+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724081330; x=1755617330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LU9bSSpXh0CphCHr3GT2GKucWLeRl8bC1ms0sLI1vBE=;
  b=FnPuqm+7MbJHRaWteOG/wXbJ7MvUkwwMSdUeQFJ5qphjbmaCcautTpLy
   uZC0cfsp+NM3pi1a+uSHrm/hk34+FERX3sRjjtKl/f7/cfZYegyM32xR5
   PZciFPr9oafTg2x3YOiWWvppI9oInnMPw99nIlqIVSe+Udog15ozEIAAT
   qSuvkmnqbmVPK3T5hTHoCfmhy04bHaUfXyLiNREPC6tJOG1AuMcGcnw6/
   nXsqN83p43YRQDEZp35LVSLGuLxTBqIQ20NGG275knyivP4/PYlJhbGuq
   yjIOXqq/sGJy0XWesKslGasqMJj7xuFQnE+qtciW8WadaKKw0rbHk/lKl
   g==;
X-CSE-ConnectionGUID: Cfjb2YPVQLOKPdeecQWcVA==
X-CSE-MsgGUID: jRKmlslzRNmibINF37FS6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22510692"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22510692"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 08:28:50 -0700
X-CSE-ConnectionGUID: 8dgZRvsOQ92s5FcIRi0X/g==
X-CSE-MsgGUID: /lt4qnXzTECVF+8UlJyfuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60069312"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Aug 2024 08:28:49 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg4JK-00097q-1O;
	Mon, 19 Aug 2024 15:28:46 +0000
Date: Mon, 19 Aug 2024 23:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sagi Grimberg <sagi@grimberg.me>
Subject: [hare-nvme:secure-concat.v9 3/10] include/crypto/hkdf.h:25:17:
 error: 'ENOTSUP' undeclared; did you mean 'ENOTSUPP'?
Message-ID: <202408192312.PjQK9unz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v9
head:   24817e66fba53d9e2722aec6abd8a00b29bf108a
commit: 07a5113f110b146bff44efafd623d3c0e87d9118 [3/10] nvme: add nvme_auth_generate_psk()
config: arm64-randconfig-001-20240819 (https://download.01.org/0day-ci/archive/20240819/202408192312.PjQK9unz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408192312.PjQK9unz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408192312.PjQK9unz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/common/auth.c:14:
   include/crypto/hkdf.h: In function 'hkdf_extract':
>> include/crypto/hkdf.h:25:17: error: 'ENOTSUP' undeclared (first use in this function); did you mean 'ENOTSUPP'?
      25 |         return -ENOTSUP;
         |                 ^~~~~~~
         |                 ENOTSUPP
   include/crypto/hkdf.h:25:17: note: each undeclared identifier is reported only once for each function it appears in
   include/crypto/hkdf.h: In function 'hkdf_expand':
   include/crypto/hkdf.h:31:17: error: 'ENOTSUP' undeclared (first use in this function); did you mean 'ENOTSUPP'?
      31 |         return -ENOTSUP;
         |                 ^~~~~~~
         |                 ENOTSUPP


vim +25 include/crypto/hkdf.h

7cdb18431a4b69 Hannes Reinecke 2024-07-18  11  
7cdb18431a4b69 Hannes Reinecke 2024-07-18  12  #ifdef CONFIG_CRYPTO_HKDF
7cdb18431a4b69 Hannes Reinecke 2024-07-18  13  int hkdf_extract(struct crypto_shash *hmac_tfm, const u8 *ikm,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  14  		 unsigned int ikmlen, const u8 *salt, unsigned int saltlen,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  15  		 u8 *prk);
7cdb18431a4b69 Hannes Reinecke 2024-07-18  16  int hkdf_expand(struct crypto_shash *hmac_tfm,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  17  		const u8 *info, unsigned int infolen,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  18  		u8 *okm, unsigned int okmlen);
7cdb18431a4b69 Hannes Reinecke 2024-07-18  19  #else
7cdb18431a4b69 Hannes Reinecke 2024-07-18  20  static inline int hkdf_extract(struct crypto_shash *hmac_tfm,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  21  			       const u8 *ikm, unsigned int ikmlen,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  22  			       const u8 *salt, unsigned int saltlen,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  23  			       u8 *prk)
7cdb18431a4b69 Hannes Reinecke 2024-07-18  24  {
7cdb18431a4b69 Hannes Reinecke 2024-07-18 @25  	return -ENOTSUP;

:::::: The code at line 25 was first introduced by commit
:::::: 7cdb18431a4b69e4912fa880449c256e92f3a30d crypto,fs: Separate out hkdf_extract() and hkdf_expand()

:::::: TO: Hannes Reinecke <hare@kernel.org>
:::::: CC: Hannes Reinecke <hare@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
