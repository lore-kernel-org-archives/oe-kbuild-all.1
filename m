Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411CF293B5F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772111087; cv=none; b=U5SK2IVjXpzjJAitv7jv85C/Wyn2zlR/f56T9GvsSGEnGPpR7pne/v4wB2k8INY4URBJd+56ac5wASwfRoDOPYjrg+nemKfwyII+i/3GQU8ky+P6BJZ5ZgMXdHFJyGq3tnNyH3te7jgcCm3fexVx5YJTiSQ7ElxLP6GgKHssrUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772111087; c=relaxed/simple;
	bh=CdWL0TyO8p74q6J6gXihKqnJ3B5WPbBX6+r7FhfIuuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUbGphONPCdNCECpgmOHOcjKJspXBI2RutgOemq4nPyH3xSRTjto0Xb7d/e/ffTwXM2ORwUYUOkNCDAYedmjQ3TOogRZPxEc2hIwY6Qzmv+lrKcUiHN/sm4cwLxk5a36u8XzS/MPJPrOsY77s/Nl8wSFmwJ2eGcIct1BFAbAiN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+m9q0H5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+m9q0H5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772111084; x=1803647084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CdWL0TyO8p74q6J6gXihKqnJ3B5WPbBX6+r7FhfIuuw=;
  b=I+m9q0H5dfpy3R6iJFPriAhLiQMXiccqLM5FW/r0q6dBGtTee6vkcXvF
   o5cREbr+fWjvrM9D8LyN/4RfowcQBh5eWGjBlnJKasapkjp2ZbjDOxFix
   AWcK/tTuNLWdk92zO6LaujIoMZGWegE9q7db0kXJQfHC/veIuMp8l8uf4
   nnOTNNGPORjfrCF/piBLHhVulZd6av0ICLlXdTgzl6nWZPIo8rK9OYbBP
   eMo4x47Zb+cyLhbTCsPL3fYT6Wj8Pt36HxBXjwMnWrJPow9nBfaZ8IZhe
   3m//YINwSGBowYB+zbZNVBWDLheIkbTBsaF3bl2bCMJpUN/o8Yi1Sy0WG
   Q==;
X-CSE-ConnectionGUID: gzhQBczxT8y2+Or8J7l0oA==
X-CSE-MsgGUID: Ba3UAb53SwOwpk7z1wn0kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83879554"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="83879554"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:04:42 -0800
X-CSE-ConnectionGUID: cqy9IEUOR2WjchkjgUV3Fg==
X-CSE-MsgGUID: aQt1vRR1Qf+/GwNqTWcUrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="247091292"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Feb 2026 05:04:36 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvb2b-000000009OR-2Id6;
	Thu, 26 Feb 2026 13:04:29 +0000
Date: Thu, 26 Feb 2026 21:03:32 +0800
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
Message-ID: <202602262019.OY1RduM2-lkp@intel.com>
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
config: arm-mvebu_v5_defconfig (https://download.01.org/0day-ci/archive/20260226/202602262019.OY1RduM2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602262019.OY1RduM2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602262019.OY1RduM2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/workqueue.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/printk/printk.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/irq/spurious.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/rcu/update.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/rcu/srcutree.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/rcu/tree.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/module/main.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `mm/slab_common.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/binfmt_script.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/mbcache.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nfs_common/grace.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/ext4/super.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/ext2/super.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/jbd2/journal.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/cramfs/inode.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/fat/inode.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/fat/namei_vfat.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/fat/namei_msdos.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nfs/dir.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nfs/inode.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nfs/namespace.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nfs/fs_context.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nfs/nfs3super.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/exportfs/expfs.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/lockd/svc.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_base.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp437.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp850.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_iso8859-1.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_iso8859-2.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_utf8.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/jffs2/super.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/debugfs/inode.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/api.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/algapi.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/aead.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/skcipher.o' being placed in section `.modinfo'
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
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/cmac.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/sha256.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ecb.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ctr.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/gcm.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ccm.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/aes.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/rng.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ghash-generic.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/asymmetric_keys/public_key.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/asymmetric_keys/x509_public_key.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/asymmetric_keys/pkcs7_parser.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `block/mq-deadline.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `block/kyber-iosched.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `block/bfq-iosched.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/math/rational.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crc/crc16.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crc/crc32-main.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/utils.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/aes.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/arc4.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/gf128mul.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/blake2s.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/des.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/sha256.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/mpi/mpiutil.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/bitrev.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/linear_ranges.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/zlib_inflate/inflate_syms.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/zlib_deflate/deflate_syms.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/glob.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/dim/dim.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/asn1_decoder.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/oid_registry.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/bus/simple-pm-bus.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/phy/marvell/phy-mvebu-a3700-utmi.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/gpio/gpio-mvebu.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/leds/led-class.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/leds/leds-gpio.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/leds/leds-netxbig.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/leds/leds-ns2.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/leds/trigger/ledtrig-timer.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/leds/trigger/ledtrig-heartbeat.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/leds/trigger/ledtrig-default-on.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/pci/controller/pci-mvebu.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/video/fbdev/core/fbmem.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/regulator/fixed.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/n_null.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/pty.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/sysrq.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/vt/keyboard.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/vt/vt.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/serial_core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/serial_base_bus.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/serial_ctrl.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/serial_port.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_platform.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_port.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_pcilib.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_exar.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_fsl.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_of.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_pci.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_pericom.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/serial_mctrl_gpio.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/char/random.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/base/firmware_loader/main.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/base/regmap/regmap-i2c.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/base/regmap/regmap-spi.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/base/regmap/regmap-mmio.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/block/loop.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/misc/eeprom/at24.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/misc/eeprom/eeprom_93cx6.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/scsi/scsi.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/scsi/hosts.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/scsi/scsi_scan.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/scsi/scsi_devinfo.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/scsi/scsi_common.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/scsi/sd.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/ata/libata-core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/ata/ahci.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/ata/libahci.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/ata/sata_mv.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/mtdcore.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/mtdconcat.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/mtdchar.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/parsers/cmdlinepart.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/parsers/ofpart_core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/mtd_blkdevs.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/mtdblock.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/chips/chipreg.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/chips/cfi_probe.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/chips/cfi_util.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/chips/cfi_cmdset_0020.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/chips/cfi_cmdset_0001.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/chips/gen_probe.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/chips/jedec_probe.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/maps/physmap-core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/nand/core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/nand/ecc.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/nand/ecc-sw-hamming.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/nand/raw/nand_base.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/nand/raw/orion_nand.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/spi-nor/core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/spi/spi-orion.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/net/phy/mdio_bus.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/net/phy/phylink.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/net/phy/phy_device.o' being placed in section `.modinfo'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
