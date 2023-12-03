Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CE317FD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvxYa0h4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585109; x=1733121109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xmxC3k/P0iHegTjeOHL9XhKrrous5xwLqIeHn99xdCI=;
  b=TvxYa0h4g7fsaUSXYy7bl8Ju6txAnKyQZ3qlpxL8Lay7glMcT+nSDiET
   PJV0a1kEmnaFy2TWj2LOm+jduwwRXLKIlKNYK8w8F6Af2+aIzUGAKpjVm
   fpTvQMH3ODqOu0ryB9RVD+QuOVXuPT3Qaf+5lb9LZcYWyWRwQ4fLElJXS
   F49lGCEfjlZ0KEQseerfOB/6+cboeghLllDNh/eQ9xu5RBW6e5X979ex/
   ybCWFZRz2DNePX5Db423IE782m0kg0dCZGXzMvwLqvUj3c/hV4fhxapP5
   0yJlHcEovUOTkuZ+u4lTuNwkP1N0/h7RqlabJ/9/RTsAQnkYE51eVz/XG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180359"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180359"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:31:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="943556078"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="943556078"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Dec 2023 22:31:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g11-0006KK-1L;
	Sun, 03 Dec 2023 06:31:43 +0000
Date: Sun, 3 Dec 2023 14:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: fs/ubifs/replay.c:71: warning: Function parameter or member 'hash'
 not described in 'replay_entry'
Message-ID: <202312021908.EFRz3PAP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sascha,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 16a26b20d2afd0cf063816725b45b12e78d5bb31 ubifs: authentication: Add hashes to index nodes
date:   5 years ago
config: x86_64-randconfig-x051-20230728 (https://download.01.org/0day-ci/archive/20231202/202312021908.EFRz3PAP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231202/202312021908.EFRz3PAP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312021908.EFRz3PAP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ubifs/replay.c:71: warning: Function parameter or member 'hash' not described in 'replay_entry'
>> fs/ubifs/replay.c:359: warning: Function parameter or member 'hash' not described in 'insert_node'
>> fs/ubifs/replay.c:408: warning: Function parameter or member 'hash' not described in 'insert_dent'
   fs/ubifs/replay.c:792: warning: Excess function parameter 'ref_lnum' description in 'validate_ref'
   fs/ubifs/replay.c:792: warning: Excess function parameter 'ref_offs' description in 'validate_ref'
   fs/ubifs/replay.o: warning: objtool: ubifs_validate_entry()+0x225: sibling call from callable instruction with modified stack frame
   fs/ubifs/replay.o: warning: objtool: replay_bud()+0x4dc: sibling call from callable instruction with modified stack frame

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BACKLIGHT_CLASS_DEVICE
   Depends on [n]: HAS_IOMEM [=y] && BACKLIGHT_LCD_SUPPORT [=n]
   Selected by [y]:
   - ACPI_CMPC [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y] && INPUT [=y] && (RFKILL [=n] || RFKILL [=n]=n)
   - SAMSUNG_Q10 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y]


vim +71 fs/ubifs/replay.c

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  37  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  38  /**
debf12d54182b3 Artem Bityutskiy   2011-05-15  39   * struct replay_entry - replay list entry.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  40   * @lnum: logical eraseblock number of the node
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  41   * @offs: node offset
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  42   * @len: node length
074bcb9b5ce698 Artem Bityutskiy   2011-05-15  43   * @deletion: non-zero if this entry corresponds to a node deletion
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  44   * @sqnum: node sequence number
debf12d54182b3 Artem Bityutskiy   2011-05-15  45   * @list: links the replay list
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  46   * @key: node key
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  47   * @nm: directory entry name
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  48   * @old_size: truncation old size
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  49   * @new_size: truncation new size
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  50   *
debf12d54182b3 Artem Bityutskiy   2011-05-15  51   * The replay process first scans all buds and builds the replay list, then
debf12d54182b3 Artem Bityutskiy   2011-05-15  52   * sorts the replay list in nodes sequence number order, and then inserts all
debf12d54182b3 Artem Bityutskiy   2011-05-15  53   * the replay entries to the TNC.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  54   */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  55  struct replay_entry {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  56  	int lnum;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  57  	int offs;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  58  	int len;
16a26b20d2afd0 Sascha Hauer       2018-09-07  59  	u8 hash[UBIFS_HASH_ARR_SZ];
074bcb9b5ce698 Artem Bityutskiy   2011-05-15  60  	unsigned int deletion:1;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  61  	unsigned long long sqnum;
debf12d54182b3 Artem Bityutskiy   2011-05-15  62  	struct list_head list;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  63  	union ubifs_key key;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  64  	union {
f4f61d2cc6d878 Richard Weinberger 2016-11-11  65  		struct fscrypt_name nm;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  66  		struct {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  67  			loff_t old_size;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  68  			loff_t new_size;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  69  		};
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  70  	};
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14 @71  };
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  72  

:::::: The code at line 71 was first introduced by commit
:::::: 1e51764a3c2ac05a23a22b2a95ddee4d9bffb16d UBIFS: add new flash file system

:::::: TO: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
:::::: CC: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
