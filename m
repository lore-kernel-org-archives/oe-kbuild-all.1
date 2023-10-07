Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4872F39D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 05:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpQ9IU0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696655870; x=1728191870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fo8PZRMiRAN8hr4sJ2Xca5su6YcnBsG5cQovEXyYMgw=;
  b=fpQ9IU0iKQpAlt0YohSD1ZImTMKQGp8Er55yY+3LjDpaf2mngzKwk9ov
   J3VqTUDNBOx4eNAks8PeIwS+fu9UEW+W+GrodOngZ1v+nCXIVSaS6UMY8
   b3x92h1x60uTl/cLmsJtAOBq6+uAvGoX9x18MjV2wRtu4NGQdXAbIHv0z
   X82UowtKLfjIkBSJo3G5mfz6SXf6Pjy3M3DNSQA2Q7vz8iuoT6SaBJSS2
   oaatPUpWkSGru1hryIl7UM0TVq2fwSC2Kvd8owNQkkPeqFquwudHl69V+
   iNM7QUc2CpmSnzHmG1G0EG3gd3PDk8s2dXja7PAe/lKqbAbGVfGUmdhHM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="383776323"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="383776323"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 22:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="926192176"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="926192176"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Oct 2023 22:17:46 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qozhA-0003zn-2D;
	Sat, 07 Oct 2023 05:17:44 +0000
Date: Sat, 7 Oct 2023 13:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] scripts: Build per module Rust crates
Message-ID: <202310071305.fY4aE9R6-lkp@intel.com>
References: <20231006155739.246381-2-yakoyoku@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006155739.246381-2-yakoyoku@gmail.com>

Hi Martin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes linus/master v6.6-rc4 next-20231006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Rodriguez-Reboredo/scripts-Build-per-module-Rust-crates/20231006-235823
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20231006155739.246381-2-yakoyoku%40gmail.com
patch subject: [RFC PATCH 1/1] scripts: Build per module Rust crates
config: arc-defconfig (https://download.01.org/0day-ci/archive/20231007/202310071305.fY4aE9R6-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310071305.fY4aE9R6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310071305.fY4aE9R6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'crypto/crypto.o', needed by 'crypto/built-in.a'.
>> make[4]: *** No rule to make target 'crypto/crypto_algapi.o', needed by 'crypto/built-in.a'.
>> make[4]: *** No rule to make target 'crypto/crypto_hash.o', needed by 'crypto/built-in.a'.
   make[4]: Target 'crypto/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'fs/ext2/ext2.o', needed by 'fs/ext2/built-in.a'.
   make[5]: Target 'fs/ext2/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'fs/nfs/nfs.o', needed by 'fs/nfs/built-in.a'.
>> make[5]: *** No rule to make target 'fs/nfs/nfsv2.o', needed by 'fs/nfs/built-in.a'.
>> make[5]: *** No rule to make target 'fs/nfs/nfsv3.o', needed by 'fs/nfs/built-in.a'.
   make[5]: Target 'fs/nfs/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'fs/lockd/lockd.o', needed by 'fs/lockd/built-in.a'.
   make[5]: Target 'fs/lockd/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'fs/tracefs/tracefs.o', needed by 'fs/tracefs/built-in.a'.
   make[5]: Target 'fs/tracefs/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'lib/crypto/libcryptoutils.o', needed by 'lib/crypto/built-in.a'.
   make[5]: *** No rule to make target 'lib/crypto/libblake2s.o', needed by 'lib/crypto/built-in.a'.
>> make[5]: *** No rule to make target 'lib/crypto/libsha1.o', needed by 'lib/crypto/built-in.a'.
   make[5]: Target 'lib/crypto/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'lib/zlib_inflate/zlib_inflate.o', needed by 'lib/zlib_inflate/built-in.a'.
   make[5]: Target 'lib/zlib_inflate/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'lib/lzo/lzo_decompress.o', needed by 'lib/lzo/built-in.a'.
   make[5]: Target 'lib/lzo/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'lib/zstd/zstd_decompress.o', needed by 'lib/zstd/built-in.a'.
>> make[5]: *** No rule to make target 'lib/zstd/zstd_common.o', needed by 'lib/zstd/built-in.a'.
   make[5]: Target 'lib/zstd/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'lib/xz/xz_dec.o', needed by 'lib/xz/built-in.a'.
   make[5]: Target 'lib/xz/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'net/ethtool/ethtool_nl.o', needed by 'net/ethtool/built-in.a'.
   make[5]: Target 'net/ethtool/' not remade because of errors.
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
