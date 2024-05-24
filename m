Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3085B1F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 08:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716539657; cv=none; b=lF+lgeL7M9kREBqTyiAeGWSgStZNmNMWUDfxOBvEcFPumrhO59mQZh8sGn9/UdEBLCPwjBcE2da4iR4A3VTlF2kpGyNjlNYDjxF/z3LGVVuy94DICIB7iU98nY0d1EsSHCp2/x7g6uyktqCn/A56XRBA0NmK8zaHImD6yQIijbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716539657; c=relaxed/simple;
	bh=3dWkaxRhHzN5U8n/pMZ/kvLfFRSKDKKG/GcnjVXYLMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Om5gLfp4TV0gxCipzkda8To912D2C/vx8sM9xq6op8WFW6EO0xDM7mnIlasJcV3JdwxCi4ost4xrTtJDO7sKAEyFO2DHyL3vSC8hJm/LhGGafA/JFjmeFopEIriQddxlbBio3XBHLizePqhe7/x3JI9Hm0FeiwvyFLd4oNDnqJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NsO+N95+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NsO+N95+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716539656; x=1748075656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3dWkaxRhHzN5U8n/pMZ/kvLfFRSKDKKG/GcnjVXYLMY=;
  b=NsO+N95+X4QXqug7kbC7ou94yjjBrwtzfT4hV9VRpK0U+Sr45+e1dODf
   0uf5LFmpk8vA12emjpF4rLSUBSxsKHwx9KYj1epDZxb6fu2QkrVW/iIKo
   GL1K53sISlspCFi0xOxvww2+3LfAzZ7g9lrDMoluQuS4Jyoz4xkHMr8yp
   MiHgFEO6BGTYwx0qEaxf5wbgSRsmxnK23IIZNo+8GvJN0t2JWga+EDQlh
   X1/XckBodGma3HKB5rGEJWPZMwi90ysKU265fujm+3pi4aHL7FdXXOk9V
   fntT6PviADVirf52DNoxV8yEjQLxlRCInEI7iOAb5nX1XJ+5TMv6yM9qa
   w==;
X-CSE-ConnectionGUID: /Ck6rBiuREq/6TIvolA8iQ==
X-CSE-MsgGUID: x2lnQZfvQ4W4+8gU1R8knA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="23575534"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="23575534"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 01:34:15 -0700
X-CSE-ConnectionGUID: fT+zCRvmT7KjEBHZ8KMfAA==
X-CSE-MsgGUID: vIDGzd86QrenpFmOlHjFJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="34556225"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 May 2024 01:34:13 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAQNO-00049f-0A;
	Fri, 24 May 2024 08:34:10 +0000
Date: Fri, 24 May 2024 16:33:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v5 5/7] /usr/bin/ld: tpm2_key.c:undefined
 reference to `sprint_oid'
Message-ID: <202405241607.cim7mLfL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v5
head:   6792a0a1349f0af45bcde20fb31454bbb249fc80
commit: b6a7a78fec52559fb6a14b9b3696f96eec3a1458 [5/7] KEYS: trusted: Move tpm2_key_decode() to the TPM driver
config: um-randconfig-001-20240524 (https://download.01.org/0day-ci/archive/20240524/202405241607.cim7mLfL-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405241607.cim7mLfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405241607.cim7mLfL-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/char/tpm/tpm2_key.o: in function `tpm2_key_type':
   tpm2_key.c:(.text+0x122): undefined reference to `look_up_OID'
>> /usr/bin/ld: tpm2_key.c:(.text+0x163): undefined reference to `sprint_oid'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
