Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6C61519AC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 23:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738799099; cv=none; b=IiEm2iESMGTTVgbORBLE04qngHw3kZU2wV22DoV7iSw1mbv6DimfjEu/fKVWF2+AgDqhonykYJ6pE3RIHIK1mIOcY83dhvhLqUukxz0LOdHYHkmXLq8K4cUdGbTVAWy83rmVglhHqXiaaaB2f90eXHgjXpbebGU94Wwitm/xf6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738799099; c=relaxed/simple;
	bh=x6hdut3gjYsgLcjCvskB6vonrBxHATDwIvVZ7nl0dyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ahZomD4TGq+F5qmutSxK1n/kA+yC+3vvQvS/WsXdZ4pX2w6QtobU7vkjkcQUFIy77pwWfC4etPb9Jq8SkgpaxvIYxq3UDnynt509qa51j6/Yl845j/FxnJ3jL3a3KiLeH8FOQDCz66Ip+B5q9WFyuFDWZ4ABVtVI/aqvBEFg/m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vz/cExnb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vz/cExnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738799097; x=1770335097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6hdut3gjYsgLcjCvskB6vonrBxHATDwIvVZ7nl0dyg=;
  b=Vz/cExnbOEWktFycixzZofSiqCD4vEmqbay31C3vKJT3JRRpf6W5FvCU
   cd6u2MQuxYQ9k6BAYoo+ZHqpDrBfVeY2RgwMFYKevicmxK4zT2W16wwCC
   NPVxwyood/wt0pRLCMDwpiEo8FajIt90SvRfU9F7qRTudJX+42enkIG4V
   fhN+UmP86MsS1a4+sYgOgIaWBDabse6EqFVu4uCEiGNg8P0sFYnhl7UHq
   VZTh4pNkiOPxHqUppk3oeqn2of3TKeSr2xxbuk0yBTXR9Rm7w3gqh88fo
   Tmlp9tO/82x0o/qSOZ3ajTPpAIonfvt/GQAYbIrvo9/yrQOlaDNUPswT1
   w==;
X-CSE-ConnectionGUID: gLLYLt5XSA+VCZbawshYLg==
X-CSE-MsgGUID: vEJEIzGsQJ2XUMET6qXtNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38618676"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="38618676"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 15:44:56 -0800
X-CSE-ConnectionGUID: wqgsPKrZTJqo6dkb2q5dLA==
X-CSE-MsgGUID: zu6E3uovRSK85IR3aLE51A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="111630309"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Feb 2025 15:44:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfp4f-000wEA-2C;
	Wed, 05 Feb 2025 23:44:53 +0000
Date: Thu, 6 Feb 2025 07:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 19/23] uapi.c:undefined
 reference to `__kunit_do_failed_assertion'
Message-ID: <202502060751.7dbojH4v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   c5dc664800bcb374e0ea3bcb152167b8dc1715c0
commit: 3fa629ee991a0fc313ed2402ea59462c01c399d6 [19/23] kunit: Introduce UAPI testing framework
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250206/202502060751.7dbojH4v-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060751.7dbojH4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060751.7dbojH4v-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `__kunit_do_failed_assertion'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: lib/kunit/uapi.o: in function `kunit_uapi_run_executable':
>> uapi.c:(.text+0xb3c): undefined reference to `__kunit_do_failed_assertion'
>> powerpc64-linux-ld: uapi.c:(.text+0xe40): undefined reference to `__kunit_do_failed_assertion'
   powerpc64-linux-ld: uapi.c:(.text+0xec8): undefined reference to `__kunit_do_failed_assertion'
   powerpc64-linux-ld: uapi.c:(.text+0xfc4): undefined reference to `__kunit_do_failed_assertion'
>> powerpc64-linux-ld: lib/kunit/uapi.o:(.toc+0x0): undefined reference to `kunit_unary_assert_format'
>> powerpc64-linux-ld: lib/kunit/uapi.o:(.toc+0x8): undefined reference to `kunit_binary_assert_format'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
