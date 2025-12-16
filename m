Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E57D327BE4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765878739; cv=none; b=mnv/ID13O79ODbOUALSERPeKgByiil8iaT6yf4DBIKgkxjE/00OSaKQRnGHfVEDPyKq80nr4EEwChQ7g7fXCTdm+amojVVxrMIGoDVHkWTMuQr7Ymg/5amyr57tPa6/kyCmijrrjpC9Dv3UxcBl4SnNS4Yr7O/ettOV6gFmgXkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765878739; c=relaxed/simple;
	bh=9bSR9kV/DhCjo2XOrJ/tg9QS+Sn9BtVEaEfVjCiTQlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cf7RfZESFXfshSszadhPl0LtXUpOa8nUpiEYWmQ1ofW4MOzdNASQ3T9nsFOn+PnHVGAGOJed2r27JrDF3ADfpfANviIiXvQ1m4qVmczkSuk2a4Vs0C/Q6B7pProzxgrQnVzBjo7Cf6O3atAksoY3849tKoz5bwhPNQAvbKhYdhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhxC85pg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhxC85pg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765878734; x=1797414734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9bSR9kV/DhCjo2XOrJ/tg9QS+Sn9BtVEaEfVjCiTQlU=;
  b=LhxC85pgGgpfo869Q3kfEXzeX9xAhXckNP2ZYwqfFdeyvG3xRGKJcO5x
   518EqoNj6d9vrSgMoDYipZfx0NoHocLr3eGNR5wtdUhZL6+d2CVEB+1Ke
   Q1jySF6RbrCNxgYj0L2eRs7cenR6xhq+4jPOzfeCgzvL4kljLFIHmpjs+
   ZgfU0pKjtwkAq372aXmEt4yvmflg+hbOyNwO7EivrneosNiIicNC+xZ/z
   wOhVz9CvhIAYuFltGXHHWAewbXaOPOpFyU5Y/OUHz1aZYL0DoVOHNdGi8
   RMO3Edh0mXLpL/SoTu0pDPT1fvVdUDmuJ1TfQpyXcisWGSXv2/2gsbgs0
   A==;
X-CSE-ConnectionGUID: XFoiiZ04RPWQH5voq14yaA==
X-CSE-MsgGUID: PR8KCkPeQvOCDVkxHp4uuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85205211"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="85205211"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 01:52:13 -0800
X-CSE-ConnectionGUID: KzPAOIBYR8e0NMtbiQxADQ==
X-CSE-MsgGUID: ge6Lk7YnT/i+nr+M+55h1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="203079166"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 16 Dec 2025 01:52:13 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVRj0-000000001TD-2dbP;
	Tue, 16 Dec 2025 09:52:10 +0000
Date: Tue, 16 Dec 2025 17:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941]
 sound/soc/codecs/simple-amplifier.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202512161723.lgbkIZyg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   05226913813ed71f46a7f726a6c73813d8d0b0d7
commit: 4aa5db22d35588e1a5d2ee88472348ea73d9fb23 [1941/1941] Merge branch 'asoc-4.19' into asoc-next
config: x86_64-buildonly-randconfig-006-20251212 (https://download.01.org/0day-ci/archive/20251216/202512161723.lgbkIZyg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161723.lgbkIZyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161723.lgbkIZyg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/simple-amplifier.o: warning: objtool: missing symbol for section .init.text
--
   sound/soc/codecs/es7241.c:206:33: warning: unused variable 'es7241_chip' [-Wunused-const-variable]
     206 | static const struct es7241_chip es7241_chip = {
         |                                 ^~~~~~~~~~~
   1 warning generated.
>> sound/soc/codecs/es7241.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
