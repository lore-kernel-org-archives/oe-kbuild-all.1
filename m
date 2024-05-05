Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B52D79D2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 16:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714926520; cv=none; b=uyPGyxD+5z+Ihif3jYuIQjhmpSH3kzwCnxKjkNg76jdXdmkw8wE2prYSRFeORpyKAVv09Ic3+WzLF9C8xdK1ev5o7f+/EQJIkCL8fccAAuOdDqfVTPDhB6avb9gLqiQqpHL/n6Gv673Oco+Kzp/KryzURQql1oa9KlVnH9XyRVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714926520; c=relaxed/simple;
	bh=pGZSdgD5t9eRqk9GmC08GN1FsMMaDS5CHVzyg8KBP/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lriuvRuC/1Vy69hYEmDdDw8oONIiDEm/eZeK9QKTXQLC3MqUaqQwOfG6ayt67kjtuUf6yu0a9hqWzpjYvL2dPReV6v2weEsB7TKtB5UsDOkF438ZYjTTAAWxfJms1JbuxAQlEmEOIVjN9BMxcnSr7JKdYzGalSiVQ0lMrsMYdf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVFpLs0E; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVFpLs0E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714926518; x=1746462518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pGZSdgD5t9eRqk9GmC08GN1FsMMaDS5CHVzyg8KBP/U=;
  b=XVFpLs0Ed48C4Vn16HOEGbIZ8NCe/ZJnFrqey3prYIaooSiXU2wgjJ1x
   9VvaGGZwArHXtSRkUE1lUmEhKS32o8Z5g/cJY9OxAYfFSKMGQm+ou2MJO
   6LIz/HJg9L4h5IZLpArV9Z+xqGUCHpNPrRrGyC9XVovEJK4jVIOucEWh8
   4sjStMIiDnbfVWH8I72r+FMKnGhgvnGFKN63ssXxb6R3pg9EWulK/xZKT
   dSyLw7Kra8RrUEAdq3ifg9iQWi2tHpBJT2AK5Wa+HZ73s4X6xH+1gVnk+
   i1L5UrXWgwyF82oxhivFkZHVc5lIWW73wK1lniFAP2IOtWzILukVg2ACj
   g==;
X-CSE-ConnectionGUID: uTJ8wNNcRpGWIvyLrp+wjw==
X-CSE-MsgGUID: kiEMo4NXSc+HtY7vypnNeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10890633"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="10890633"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 09:28:37 -0700
X-CSE-ConnectionGUID: 5s6Iu+16Rx2nf2Vw7Wjx0w==
X-CSE-MsgGUID: II8n+igXTte6jwG6WXtPFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="27957036"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 May 2024 09:28:36 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3ej3-00003I-33;
	Sun, 05 May 2024 16:28:33 +0000
Date: Mon, 6 May 2024 00:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 8796/10967] rtl8366rb.c:undefined reference to
 `devm_led_classdev_register_ext'
Message-ID: <202405060055.ZWEObHxN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9221b2819b8a4196eecf5476d66201be60fbcf29
commit: 32d617005475a71ebcc4ec8b2791e8d1481e9a10 [8796/10967] net: dsa: realtek: add LED drivers for rtl8366rb
config: mips-buildonly-randconfig-r005-20230209 (https://download.01.org/0day-ci/archive/20240506/202405060055.ZWEObHxN-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060055.ZWEObHxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060055.ZWEObHxN-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/net/dsa/realtek/rtl8366rb.o: in function `rtl8366rb_setup_led':
>> rtl8366rb.c:(.text.unlikely+0x25c): undefined reference to `devm_led_classdev_register_ext'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
