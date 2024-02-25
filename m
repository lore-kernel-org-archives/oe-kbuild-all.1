Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7A24439
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 04:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708835846; cv=none; b=EFEBWMpcgXerRvdnd+3u2QV1UxMgg6tQUZus69ewfYpIPkCzMw/8wN739KV1alYCY04mwBdNqwnNllM3tYsTQv6qZkjuJ2uw/+0gp4SFLx+QHd4mR8OpPtTipH3REvUFlcutcdEVi8uInvP/hPvRCz/dRqijmXT+9++S2DA64lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708835846; c=relaxed/simple;
	bh=jrxbNQIdI0MARkZQUcRtwNbfOzZ4Gxxom9UFCqEseP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l9wPxECQ553Rn0e7aUk3lQi+/w/xQ0ZLvS6x/GzXvM1MICjKVoC2Ht+Qh9gRm86fotUQIh77Vj79hD45qjzWTNmWDj3r1XUxXqtyBVTwO4MRC+giRu1Zrzyttg+Ah5D5g3lz6uPIAGO/x2Mw5suxsrmBPhf6HUtW332LorCDeNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SewHxDB6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SewHxDB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708835843; x=1740371843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jrxbNQIdI0MARkZQUcRtwNbfOzZ4Gxxom9UFCqEseP0=;
  b=SewHxDB6A6V1qEXKkJ2IUiIdeuIBso8g5uco3k+x65vATx5fipAWkLiD
   ucAkk81JvZH8SZV8sRvO/ZqTMVFyRqeJ9/oA4CYIjiKZM0K2tENDYzAh8
   2nK7Xxx1XeZOcPq2i1Hxu1M52LsHGghdRzO946c3qVDAujyQesFoSB67d
   TYayTar83aWzSLTfVgUHxQ+JbCP9GmFW4K70k/kAXyPn1ri3nLQa9mhMA
   HRq4+69k3eU7b8P4HL1oQaeldv4tSxQHJQUPUmuY8FCHxfrTqKRbpKG5l
   I0CCnxJiXD1qksQIuUYGU9jECoqaQcEOt12mZ3Ua0iPYRgJVUCtnls127
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="14268851"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="14268851"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 20:37:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="6323234"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Feb 2024 20:37:21 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re6GM-0009Kq-24;
	Sun, 25 Feb 2024 04:37:18 +0000
Date: Sun, 25 Feb 2024 12:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net,
	Miklos Szeredi <mszeredi@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>
Subject: [mszeredi-fuse:for-next 2/20] WARNING: modpost: vmlinux: section
 mismatch in reference: virtio_fs_init+0x78 (section: .init.text) ->
 ikheaders_cleanup (section: .exit.text)
Message-ID: <202402251213.5EH9JYEQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
head:   33771e1143a9944d1a4c8e8457db92cab037563a
commit: a8f62f50b4e4ea92a938fca2ec1bd108d7f210e9 [2/20] virtiofs: export filesystem tags through sysfs
config: sh-randconfig-002-20240225 (https://download.01.org/0day-ci/archive/20240225/202402251213.5EH9JYEQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251213.5EH9JYEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251213.5EH9JYEQ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: virtio_fs_init+0x78 (section: .init.text) -> ikheaders_cleanup (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/test_udelay.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/time_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/sysctl-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ext4/ext4-inode-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp852.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp855.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp860.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp863.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp864.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp869.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp932.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_euc-jp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp936.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1250.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-u.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-ru.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-centeuro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-inuit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-romanian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/bcachefs/mean_and_variance_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_script.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/minix/minix.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/hfs/hfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/hpfs/hpfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/pstore/pstore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/encrypted-keys/encrypted-keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/ecc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/curve25519-generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hexdump.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_firmware.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/cpumask_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hash.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ida.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_list_sort.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_rhashtable.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_dynamic_debug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_printf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_uuid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_maple_tree.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_memcat_p.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_meminit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/list-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_linear_ranges.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/cmdline_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/overflow_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/strcat_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/strscpy_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-raw-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/charlcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/line-display.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/common/usb-otg-fsm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/rc-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-bootrom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-light.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-log.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-loopback.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-power-supply.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-raw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-vibrator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/hisi-spmi-controller.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-i2s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-formatter-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/soc-topology-test.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
