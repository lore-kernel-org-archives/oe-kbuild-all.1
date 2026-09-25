Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69D444065E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 12:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339644; cv=none; b=ErLEF0zhbxmmcOu5dkUIZhERE9J3TXOivlp4oRdSfQKph/hSwIflqzBmq4v/lBibZKwDHWzuNkV3DK2+Cqu085IgU03Ka9028YmBiTxvp9Y3j0n2spu1ldCZoyIKD15n7xaVVvpN3RDhuMZWr8zYw7tgq08/DvK2hBmqXq6y4W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339644; c=relaxed/simple;
	bh=AdRwGsuKjv5EzAltSrqo6/1oKGBUx58TGRQywIsxDkQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bMSLqhx+EFga7oM2phwKtznususpJXvBznfolS7nA6+RuOj0MukTFEmkYI3TgQpA7o9/WlOnr2zPkLIgb6tZ5mfpF6VrsftzS+LOtqC+wkYCRKOf0y9YpbxO6ccZ2iO/Ug3uDYM5WS4mkgK3Ky0oIY30YAuSRfw1hRcRCihlBEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ky/Ki4TS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ky/Ki4TS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790339643; x=1821875643;
  h=date:from:to:cc:subject:message-id;
  bh=AdRwGsuKjv5EzAltSrqo6/1oKGBUx58TGRQywIsxDkQ=;
  b=Ky/Ki4TSJom0A4iyMW50I8yJ9fdmuW0qHjP2jcmzrqlx6h8eix6CDZJY
   /8ry2LzCJJWGX8nih5oa4P500+82VKRzlbe6BTZuFwb98vgPGj6k2kyMr
   i3Vkpc++S+bizT+fhVk9fWL8P11Sq5v/Q3wVNFKpWO/hxyXIJvv6GCLqj
   Vh5GCh3bPN3ZB+OPHe68su48T7vkVT6uOUVWNx83SOuqtANQtOao+1qw5
   lKm0oeF8/n8dM0GFo4k9TQivTKlH+3nJ69LPuVGNkJes8IwBCR6EhbKs+
   97qqCWzKRc5h22HvnH3EempNDzAd0wZpSBnO06o1A1vXEDyLiDnhUygJ2
   g==;
X-CSE-ConnectionGUID: AJkGk0SHQDeqdK8zHjlzaA==
X-CSE-MsgGUID: xnLY2VY2StCDRspZSJX8OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90251234"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90251234"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 05:34:02 -0700
X-CSE-ConnectionGUID: HnItLG0oT2S4ja+Izk2B3g==
X-CSE-MsgGUID: NVqL/2emQWG/foR959vjig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="302276550"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2026 05:34:01 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA57m-00000000Kbu-36IB;
	Fri, 25 Sep 2026 12:33:58 +0000
Date: Fri, 25 Sep 2026 20:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 568/673]
 usr/include/linux/if_pppox.h:72:9: error: alignment 1 of 'union <anonymous>'
 is less than 2
Message-ID: <202609252052.WxQxZGVs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: de6e2753a4e2e61ad06abc40a35348ace8e0ad55 [568/673] m68k: fix up headers for -malign-int
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260925/202609252052.WxQxZGVs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252052.WxQxZGVs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252052.WxQxZGVs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from usr/include/linux/netfilter_bridge.h:12,
                    from ./usr/include/linux/netfilter_bridge/ebtables.h:18,
                    from <command-line>:
>> usr/include/linux/if_pppox.h:72:9: error: alignment 1 of 'union <anonymous>' is less than 2 [-Werror=packed-not-aligned]
      72 |         } sa_addr;
         |         ^
   cc1: all warnings being treated as errors
--
   In file included from <command-line>:
>> ./usr/include/linux/if_pppox.h:72:9: error: alignment 1 of 'union <anonymous>' is less than 2 [-Werror=packed-not-aligned]
      72 |         } sa_addr;
         |         ^
   cc1: all warnings being treated as errors

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
