Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEF36FBC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 02:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1Tb8t2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697511593; x=1729047593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AmfMhTo9RynZx1wSLsz1oLYkq65cA39gkWfkYPS8GmA=;
  b=m1Tb8t2+pI+l9Qcu6gWHzl6Rtyt3J+j7+lMVF/MCSXTNO/TK2i+I3v1c
   1AwDcYhb+Q4h9z8q39hS3sphLrBNat34/CMLB0jX8OTGIRyPs9ahZoiWT
   eOGA4Uxy+CVEZprixzNpw6lMj9vyT6CdAvSVfgBit1WQ0d/hv8BSVVbbL
   n5i2Jxr7pk1q50xGSzBGwt8vLOuMPCZGEvbaB5W/w5HCx+fQSRWn0feeT
   DwMnYyiuzlu8eU/urecrObkN5WiOV4m0xD1jJJXf9SWY6AclGmuJVwrat
   vvfLju3tX/7U8rRtlhw7YhLuxtYtko6U6wFiH3h0khNaTFtPw/qpJJ2Sj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="7252120"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="7252120"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 19:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="821794627"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="821794627"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Oct 2023 19:59:47 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsaJ7-0008tv-1f;
	Tue, 17 Oct 2023 02:59:45 +0000
Date: Tue, 17 Oct 2023 10:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: [tty:tty-testing 22/24] efi.c:undefined reference to `screen_info'
Message-ID: <202310171049.aNxOKhUY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
head:   6271f1e8c4cb9a46273ae01ff9cb86a022063f75
commit: 934d62223da320b3ec012c85b63a6c250f507096 [22/24] efi: move screen_info into efi init code
config: loongarch-randconfig-001-20231017 (https://download.01.org/0day-ci/archive/20231017/202310171049.aNxOKhUY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171049.aNxOKhUY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171049.aNxOKhUY-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: arch/loongarch/kernel/efi.o: in function `.L6':
>> efi.c:(.init.text+0x1ac): undefined reference to `screen_info'
>> loongarch64-linux-ld: efi.c:(.init.text+0x1b0): undefined reference to `screen_info'
   loongarch64-linux-ld: drivers/firmware/sysfb.o: in function `.L2':
>> sysfb.c:(.init.text+0x60): undefined reference to `screen_info'
>> loongarch64-linux-ld: sysfb.c:(.init.text+0x68): undefined reference to `screen_info'
   loongarch64-linux-ld: drivers/firmware/sysfb.o: in function `.L7':
   sysfb.c:(.init.text+0x74): undefined reference to `screen_info'
   loongarch64-linux-ld: drivers/firmware/sysfb.o:sysfb.c:(.init.text+0x78): more undefined references to `screen_info' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
