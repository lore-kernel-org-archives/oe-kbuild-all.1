Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21BA1FF7A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 17:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732728828; cv=none; b=VpEFnXdOMkKq3+/7wUq+MHQo7KBd3EYP8kjlCQi/NtGwASFTkh4RaeD72JpEt2+GGxNLTa61Lyd/9MNE+rMoZdmStuNr85+KGetneui6QuOpMwr4OgcdzTB/FjUbQMtkN4X2dF8bozM1OPODNiU3gxgX5M/JKziO0GSq4teAX/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732728828; c=relaxed/simple;
	bh=szvJIVifPHE9eXNZeabc25ZUYkJeUb8sdwLKGzm66DU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gHyJZKmkif+0qx8BZhx1UYUtu8CmTPREOAHcXwjSSOnRpRwVT/kYYPayFQzetGy8TJjvmhNypjuKK6WeH/en42ZL+CyXzv5oDKvhhBNqpHmBojouRPy5/XYAUW58mcshMlVgwL8EHp3gq/uuIzO4kA3H4Se02BoS7c7Mko1S508=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZL2ZIaW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZL2ZIaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732728826; x=1764264826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=szvJIVifPHE9eXNZeabc25ZUYkJeUb8sdwLKGzm66DU=;
  b=eZL2ZIaWZyGlaRJbMUBO8wkF2epHhlFr1z1cTkI1CXpvdqnTfnIFz/92
   btxmSoAykn1MhG5UKxuNcbD3vrCLocqnLn7O0T6YG9tzvz3dpW7/JpLyN
   MVxwWWfb+jvKmIGZfCjX77OuicAGOjAuV5MWoqVmRx1hmYUhJNHSa2UH8
   9bLavpnvyjubv/5nbJngfPy6yQqrc9e2/ShAVmWlxJP7eR+BKdcO5KuYA
   xFp07xdaABbsH82ldfUbQb6qBPf9i7DzrvawjeZz++4pRs8rONZtlO0BS
   sWEUP2qOvSwlBk125y9wKPaiVlZC7vTYy8r63s4AVhN0ntHAO40qXsxgE
   g==;
X-CSE-ConnectionGUID: 8LJBVA3cRRqVOx+cC6DoiA==
X-CSE-MsgGUID: //JwvbfXRVCirRDuTpHoMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="58351314"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="58351314"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 09:33:46 -0800
X-CSE-ConnectionGUID: Gvq5CJDvSzGyZidwd/u9Ew==
X-CSE-MsgGUID: jgmKGy6SSBaZxgrY5rewOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="92471872"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Nov 2024 09:33:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGLv5-0008DH-0V;
	Wed, 27 Nov 2024 17:33:43 +0000
Date: Thu, 28 Nov 2024 01:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 6/11] Absolute reference to symbol '.data' not
 permitted in .head.text
Message-ID: <202411280132.JHT6kIwC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   738cca58590ea7415e710f5ee3871b5187d8c2b9
commit: d99fd40540e6dc827584e1aa016eed04378e169d [6/11] x86/boot: Reject absolute references in .head.text
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20241128/202411280132.JHT6kIwC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280132.JHT6kIwC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280132.JHT6kIwC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Absolute reference to symbol '.data' not permitted in .head.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
