Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4D9337BBB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772104263; cv=none; b=LoSMKXunRGPBWj64wG8FpYJiaLgAHU6rOKxMzKa2jbcNU/DTyiRCV549/lJHNXqva5IXkEO4za6Du+rdOJQRS8yIVcPox7VYAS3nTJ+PauYYat9tSpbfE75SeTqyMRxhrByLrnkDC6R/jxyJpkM0jCti9DZJdmfceWPmld14hLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772104263; c=relaxed/simple;
	bh=4sZeRwWTGucXXv7V8BktgYs/8Ex25F+jBbGc7nbQxQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dT1M0uicLH9m3yfI0l5mxaOCPGEMPcLm6uw7d3rVHb19IXlOgxcdLl6KSkto9fpVT782b4DCX+SV/nGZ5VcLTrU08Qn00MB+ePCmyUpulKM3GFL/qGhiuAX5u2zQkB+gAWEQ56pM4hIMvhY44rp0z9NrMG0MA2Ek2mOr1oUfg1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2FkrUQ3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2FkrUQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772104259; x=1803640259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4sZeRwWTGucXXv7V8BktgYs/8Ex25F+jBbGc7nbQxQE=;
  b=e2FkrUQ3JKOhGAuGC3ESF3pWmhM6r0Bh//dKF1UH9z7u6zIhRnku0G1r
   /6Tht6h1H5gr3ylrKTDE+tTBevvZqo2+gSK1OL0spIy/AOIVO8DWD5tE6
   P7RxRA/NzUfr20NehVVPfYDRsVUqnUpwG4UlJutl7E3B8SHFzWlMhpUH6
   khKwrWypuNKoCyWfSaTIFO5EUFYR12L16e9uFEyx8t6GDWXipmDEMHOyD
   +OQjJ5TH9tCChHejHGlcK5Q+QlOzev6ckhaKWOlQvkolRDNw/tMZp9Gaz
   U3pLJoFNpUobMC0rCKQl4AMNGXa9aTNlWPyNc9+ufv/d0Bb8xyY8+2E8o
   g==;
X-CSE-ConnectionGUID: S+LcjG+BSWqEjDSdaRSzwA==
X-CSE-MsgGUID: i4ZuaPy7RDCzMSf6ogN9JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="76998124"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="76998124"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 03:10:58 -0800
X-CSE-ConnectionGUID: QB6gElg4SwSdv50iWbmrTA==
X-CSE-MsgGUID: gJqH3XGwQZyr3yrqCBPjkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="214779713"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2026 03:10:53 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvZGd-0000000097t-0hGa;
	Thu, 26 Feb 2026 11:10:51 +0000
Date: Thu, 26 Feb 2026 19:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Sam Creasey <sammy@sammy.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH] kbuild: Split .modinfo out from ELF_DETAILS
Message-ID: <202602261957.dducGrGl-lkp@intel.com>
References: <20260225-separate-modinfo-from-elf-details-v1-1-387ced6baf4b@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225-separate-modinfo-from-elf-details-v1-1-387ced6baf4b@kernel.org>

Hi Nathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/kbuild-Split-modinfo-out-from-ELF_DETAILS/20260226-060503
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260225-separate-modinfo-from-elf-details-v1-1-387ced6baf4b%40kernel.org
patch subject: [PATCH] kbuild: Split .modinfo out from ELF_DETAILS
config: arm-randconfig-003-20260226 (https://download.01.org/0day-ci/archive/20260226/202602261957.dducGrGl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261957.dducGrGl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602261957.dducGrGl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/workqueue.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/locking/locktorture.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/locking/test-ww_mutex.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/printk/printk.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/irq/spurious.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/rcu/update.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/rcu/rcutorture.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/dma/map_benchmark.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/module/main.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/time/test_udelay.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/configs.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/torture.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/scftorture.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `mm/dmapool_test.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `mm/page_reporting.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/crypto/crypto.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/binfmt_misc.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/mbcache.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/configfs/mount.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/ext4/super.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/jbd2/journal.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/fat/inode.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/fat/namei_vfat.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/fat/namei_msdos.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/exfat/super.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/exportfs/expfs.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_base.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp437.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp850.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp861.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp864.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp932.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_euc-jp.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp936.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp950.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp1251.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_ascii.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_iso8859-4.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_iso8859-5.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_iso8859-6.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp1255.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/mac-centeuro.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/mac-croatian.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/mac-cyrillic.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/mac-iceland.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/mac-turkish.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/unicode/utf8data.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/ntfs3/super.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nilfs2/super.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/debugfs/inode.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/btrfs/super.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/btrfs/sysfs.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/gfs2/main.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/gfs2/ops_fstype.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/zonefs/super.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/api.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/algapi.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/aead.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/geniv.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/skcipher.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/bpf_crypto_skcipher.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/seqiv.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/echainiv.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ahash.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/shash.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/akcipher.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/sig.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/kpp.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/rsa.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/rsa-pkcs1pad.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/rsassa-pkcs1.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/acompress.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/scompress.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/algboss.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/testmgr.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/hmac.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/xcbc.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/sha256.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/sha512.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/sha3.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/streebog_generic.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ecb.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/cbc.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/cts.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/xts.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/chacha20poly1305.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/aegis128-core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/blowfish_generic.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/blowfish_common.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/aes.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/cast_common.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/cast5_generic.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/cast6_generic.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/chacha.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/deflate.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/crc32c.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/authenc.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/authencesn.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/rng.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/drbg.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/jitterentropy-kcapi.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/zstd.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ecc.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ecdh.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ecrdsa.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/xor.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `block/bsg.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `block/blk-cgroup.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `block/mq-deadline.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `block/kyber-iosched.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `block/bfq-iosched.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `block/blk-crypto.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `block/blk-crypto-fallback.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/test_hexdump.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/find_bit_benchmark.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/dhry_run.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/test_firmware.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/test-kstrtox.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/test_xarray.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/test_free_pages.o' being placed in section `.modinfo'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
