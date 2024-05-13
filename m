Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C9B42070
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 20:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715632917; cv=none; b=BchmJGPFsJpGyeTTSUSGNPfwW14fmW8CdqVPsRxRIuhuX1LKyOaybzT8qG6RxIdrvyom3wJ6u5j5Z+0lxV2FYYIuL6uudFO8R5pJU5zYqPOhfUjBnQN6GR++Nf9u93L+wCw2dhF39CIEjKVaUeFUGjT3YUmF0MHIWVQ7/MklHMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715632917; c=relaxed/simple;
	bh=QnhpsRt/F6us9exlYSEzLX1QU5AaVa1UmY0psYQB7jU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uVfjce9QmkPpcr6bHLArzkJ/9sfjk6DkegRh8wJrz0ls1XSquLb7hlTDmdWIJgDKWwiJtEUz3fsiwSO7m7ux9VhC3isrPQmssLxOF90RVjI9jtsFaB+JBV1x1qC+2ZauXkw45B2cerdiiGgkvpHgdSEBL9i0X5gQgJ3RtYGKY9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+eI4gag; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+eI4gag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715632916; x=1747168916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QnhpsRt/F6us9exlYSEzLX1QU5AaVa1UmY0psYQB7jU=;
  b=F+eI4gagp5Ih8u3m93xIDdqbfX5fW/l+SeEhq1y0jrzOyRQFX+c5c/At
   GvciRGCnZiyQuM56iKQYaHM2qs/mSI+sBbKhOoUCA/EKkn7qDpu3qNwAa
   ChQpDPayingDuzEZYBPTqWYuO+d5ss1SNTqxsIEsAhx0PxzbVTQ5c1Omo
   XFJ98hE25zQ7gr1vFXE6EHK7EnefLBZQFXxJElIYvbWrkv+uGRNKEEWK2
   fv79nK91owFBnuxrWSqYjBpmjFDbPieb7Ra//gPJdVvQEs9h3+IPkFbSX
   Z5dM100OvMVt6zv+AUDRWM4RU9dTwbQYagPFaa8UvDJDXO/UAJolch62a
   g==;
X-CSE-ConnectionGUID: Ag9iSM5pRDu5a7ii+8SFYQ==
X-CSE-MsgGUID: txDBYOYAQ/imXBHMoxPAMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11750800"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11750800"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:41:55 -0700
X-CSE-ConnectionGUID: HLJ8PYUITfGsUvOwZXhl8A==
X-CSE-MsgGUID: ik6+zDzqRSuwIyEDZhHFmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30455789"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2024 13:41:54 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6cUa-000Agn-0V;
	Mon, 13 May 2024 20:41:52 +0000
Date: Tue, 14 May 2024 04:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2_key 39/39] mips-linux-ld: tpm2_key.c:undefined
 reference to `asn1_encode_integer'
Message-ID: <202405140411.ds33krlP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2_key
head:   3ab444ea2fe8b38de7ffe05aacbf22b664c8f115
commit: c9b223b1ac3db418fc3ab49d007b5a12f8b091aa [39/39] crypto: Add foundations for TPM2 asymmetric keys
config: mips-randconfig-r081-20240513 (https://download.01.org/0day-ci/archive/20240514/202405140411.ds33krlP-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405140411.ds33krlP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405140411.ds33krlP-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/char/tpm/tpm2_key.o: in function `tpm2_key_encode':
   tpm2_key.c:(.text+0x200): undefined reference to `asn1_encode_oid'
>> mips-linux-ld: tpm2_key.c:(.text+0x238): undefined reference to `asn1_encode_integer'
>> mips-linux-ld: tpm2_key.c:(.text+0x24c): undefined reference to `asn1_encode_octet_string'
   mips-linux-ld: tpm2_key.c:(.text+0x260): undefined reference to `asn1_encode_octet_string'
>> mips-linux-ld: tpm2_key.c:(.text+0x274): undefined reference to `asn1_encode_sequence'
>> mips-linux-ld: tpm2_key.c:(.text+0x2e8): undefined reference to `asn1_encode_boolean'
>> mips-linux-ld: tpm2_key.c:(.text+0x314): undefined reference to `asn1_encode_tag'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
