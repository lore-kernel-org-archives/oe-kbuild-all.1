Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0FF135A61
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 23:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708989031; cv=none; b=bsVKAtmasFYn+UMBZ1CXFtnndEAbQvEMBLbpDX3K/b4xVxFZgUi1rlauE/pfQaecNxWJduGYz7KgQiNi4h9bAxZ8h/6Qpef02FotCSq9ji2IldJWdIpDeTzQC7eF1Wx/jTtd+k027+IVnbmDukYwph/gpffnJQKxyWCtO50nRRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708989031; c=relaxed/simple;
	bh=eOfFOhF7dDLMTsMD/3EcHBMJFQNzThtjRJukSCxQFY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFPaXvUaw3qMejU2E5wSyjMgV3ZrGNzTBy2rmgmCQ7gX7uk7viTz80XvkxHBDJPMqKbrY5Nl2KHQFNOjK1LPULseVmw4WxZN57ImWG4ROiStwOVqo80sg2xmKPzgng8Lg2y6PvskvDzYdCzqBOJZtbzWzb9rTnQ8HSzxgAT2fzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvM9janC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvM9janC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708989028; x=1740525028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eOfFOhF7dDLMTsMD/3EcHBMJFQNzThtjRJukSCxQFY0=;
  b=JvM9janCeM7EH9J7qCx0maguNboBl/yc8ZKQtQVv07VbLHKnlU/+PkdV
   Fe+QfdWe76i4BOxPBf1fuqH+n+g6P030POaScuCJHuRyHKW9ozgV4AOfB
   3FUiqOKtcK1DtXQU3xGULG9quQ9fWavba91UDzJmYIJPExlkQx4PGEC/t
   uhkGTt6TBcfctIrdGL/n7loBc45E1lRr9ixqlamzN2sP51r+UBULrl1u7
   1zIdrQhdO2ElkR8Cl393XYw2FZE5USGv6UV4/3KRjKJfJfrr3hA8n5vt/
   0EPDbQh+T0lD7Cd0EhaceUnF6+/pNiPKOvEmnZFXxWcMSEzHUV7lWVber
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3169733"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="3169733"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 15:10:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="6765420"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 Feb 2024 15:10:25 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rek75-000Akt-0y;
	Mon, 26 Feb 2024 23:10:23 +0000
Date: Tue, 27 Feb 2024 07:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/3] virtiofs: export filesystem tags through sysfs
Message-ID: <202402270649.GYjNX0yw-lkp@intel.com>
References: <20240213001149.904176-3-stefanha@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213001149.904176-3-stefanha@redhat.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mszeredi-fuse/for-next]
[also build test WARNING on linus/master v6.8-rc6]
[cannot apply to next-20240226]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Hajnoczi/virtiofs-forbid-newlines-in-tags/20240213-081536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
patch link:    https://lore.kernel.org/r/20240213001149.904176-3-stefanha%40redhat.com
patch subject: [PATCH v4 2/3] virtiofs: export filesystem tags through sysfs
config: um-randconfig-r081-20240226 (https://download.01.org/0day-ci/archive/20240227/202402270649.GYjNX0yw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402270649.GYjNX0yw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402270649.GYjNX0yw-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/backtracetest.o
>> WARNING: modpost: fs/fuse/virtiofs: section mismatch in reference: virtio_fs_init+0x144 (section: .init.text) -> virtio_fs_sysfs_exit (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_script.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp775.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp850.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp862.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp863.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp864.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp865.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp866.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp932.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_euc-jp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp950.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1250.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ascii.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-5.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-7.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1255.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-9.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-14.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-u.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-ru.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-cyrillic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-gaelic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-greek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-inuit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-romanian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-turkish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/encrypted-keys/encrypted-keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/ecc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hexdump.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ubsan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_rhashtable.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_scanf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bitmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_uuid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_maple_tree.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_meminit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_deflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/atomic64_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf857x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_ring.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ttyprintk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-fmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: EXPORT symbol "csum_partial" [vmlinux] version generation failed, symbol will not be versioned.
Is "csum_partial" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "csum_partial_copy_generic" [vmlinux] version generation failed, symbol will not be versioned.
Is "csum_partial_copy_generic" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
