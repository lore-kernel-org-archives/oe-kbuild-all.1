Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34223345745
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 14:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488315; cv=none; b=QBycwyPOMSwHCcnE/36C9qh4tWk6AfUnO19GucPms6TDVb0x/fO8891U9oqQfBD1/W3Vn2KhsS+jpXk63awFLECBL3Y7LHLQB/L8rBbkCji0BWCpCiSae7UycA3AZA4r8ZDsLe3Wq2B7Q6dhkAlE6jgdaF+VP+yjqrNKi+rzN80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488315; c=relaxed/simple;
	bh=B2iBTAqd+92QUVdKHEudgLsM4Ixdh1i8Ne91BRZmkWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uheZq7BZBeWjx+jOan3ImJNTwGWK5uMS2yQFSdFMn1l4s6RVz7cKDNMjyRAb6LIqV0lcefHfJsnISzqdRwNL/laznpB/oTMbqu2ormgDdIJgWy8hGFQB49ZzMHFz6t7kiR2di3ModRr1PrT1pnlDFE5g5rG54Y5DGxvVWMu/k3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeeQDkjH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeeQDkjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768488313; x=1800024313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B2iBTAqd+92QUVdKHEudgLsM4Ixdh1i8Ne91BRZmkWc=;
  b=AeeQDkjHQG70i6BocW35beyqQh2K4tHeO4O7vf9rd+iCRsrnqPaQ1UdO
   tQ4n8wfIE8KVTbis5bw79qUbZqoidJ6qUYBZKOqcQT3R4Lm3TvP/3E0vG
   LnNfAEaEiF51oqmvFtvIrsflnAsZ4KibDXV7zoelwnWsBnVbUn9xI76b9
   1j3zYf0oSxhSIqoSt7cMsfGYrGxY10yUEtsHI8ugouaDw3BDMmwZhf9U1
   k0sGltloZaRLQfIk67ER058obdhDSB17taxDzpUC5pr8gmWX7F9E8w0oo
   UQrBflPx0/IS1QKXrgzGsCeSe5T9QgDuPXARgQwGAyKU2gYWhCZfvr6YT
   g==;
X-CSE-ConnectionGUID: 9brwgT33QYCXcx3ME9kj0A==
X-CSE-MsgGUID: z2KUJR3NRpWEHsGbWVQVGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69692640"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69692640"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:45:11 -0800
X-CSE-ConnectionGUID: qYuCflEbShOL2btXXrSAJg==
X-CSE-MsgGUID: txZz/H7lSFSDv1N246P90A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jan 2026 06:45:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgOaw-00000000I5E-4AC1;
	Thu, 15 Jan 2026 14:45:06 +0000
Date: Thu, 15 Jan 2026 22:44:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: [linux-next:master 3548/6771]
 ./usr/include/linux/vbox_vmmdev_types.h:254:6: error: field u within 'struct
 vmmdev_hgcm_function_parameter64::(anonymous union)::(unnamed at
 ./usr/include/linux/vbox_vmmdev_types.h:249:3)' is less aligned than 'union
 (unnamed union at ./usr/include/linux...
Message-ID: <202601152258.8RPQcl59-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9b7977f9e39b7768c70c2aa497f04e7569fd3e00
commit: e3970d77ec504e54c3f91a48b2125775c16ba4c0 [3548/6771] kbuild: uapi: drop dependency on CC_CAN_LINK
config: arm-randconfig-r064-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152258.8RPQcl59-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152258.8RPQcl59-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152258.8RPQcl59-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   ./usr/include/linux/vbox_vmmdev_types.h:239:4: error: field u within 'struct vmmdev_hgcm_function_parameter32' is less aligned than 'union (unnamed union at ./usr/include/linux/vbox_vmmdev_types.h:223:2)' and is usually due to 'struct vmmdev_hgcm_function_parameter32' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     239 |         } u;
         |           ^
>> ./usr/include/linux/vbox_vmmdev_types.h:254:6: error: field u within 'struct vmmdev_hgcm_function_parameter64::(anonymous union)::(unnamed at ./usr/include/linux/vbox_vmmdev_types.h:249:3)' is less aligned than 'union (unnamed union at ./usr/include/linux/vbox_vmmdev_types.h:251:4)' and is usually due to 'struct vmmdev_hgcm_function_parameter64::(anonymous union)::(unnamed at ./usr/include/linux/vbox_vmmdev_types.h:249:3)' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     254 |                         } u;
         |                           ^
   2 errors generated.
--
   In file included from <built-in>:1:
   In file included from ./usr/include/linux/vboxguest.h:14:
   usr/include/linux/vbox_vmmdev_types.h:239:4: error: field u within 'struct vmmdev_hgcm_function_parameter32' is less aligned than 'union (unnamed union at usr/include/linux/vbox_vmmdev_types.h:223:2)' and is usually due to 'struct vmmdev_hgcm_function_parameter32' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     239 |         } u;
         |           ^
>> usr/include/linux/vbox_vmmdev_types.h:254:6: error: field u within 'struct vmmdev_hgcm_function_parameter64::(anonymous union)::(unnamed at usr/include/linux/vbox_vmmdev_types.h:249:3)' is less aligned than 'union (unnamed union at usr/include/linux/vbox_vmmdev_types.h:251:4)' and is usually due to 'struct vmmdev_hgcm_function_parameter64::(anonymous union)::(unnamed at usr/include/linux/vbox_vmmdev_types.h:249:3)' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     254 |                         } u;
         |                           ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
