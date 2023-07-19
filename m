Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CA2156F0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 15:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y2TMEyMiHodt7y9kEdY2Vb3YfikQk2VyUX9Z/39rV4Y=;
  b=TD9Xjds9FNbDjIYTnjHQKjTzsuOMO34ZO+cVgDp4PFf0ZloqEvO4q9Ms
   4zjl4+0TYE/6zH4RGLeiwp8aYXnmwahmRE2oSnNe7geETUmL0N5+voKtz
   IrEVtUQTPoRAEcZBYt30Q201UBzrNYtRW3Z3Bb5wtpNeGmTuvb9i86VWQ
   Q=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,216,1684792800"; 
   d="scan'208";a="61773449"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 17:25:08 +0200
Date: Wed, 19 Jul 2023 17:25:06 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Joel Granados <j.granados@samsung.com>
cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl_remove_empty_elem 38/65]
 drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
 (fwd)
Message-ID: <b68351c-37b2-1195-bde-6161e96e419@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Should device_dir be a flexible array?

julia

---------- Forwarded message ----------
Date: Wed, 19 Jul 2023 21:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [joelgranados:jag/sysctl_remove_empty_elem 38/65]
    drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member
    instead
    (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-
    and-one-element-arrays)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Joel Granados <j.granados@samsung.com>

tree:   https://github.com/Joelgranados/linux.git jag/sysctl_remove_empty_elem
head:   a304fafc8514647e95ddf6cae2bdf2f7cd185ac1
commit: 03ff367f259166790e8982a17498c296193db2e5 [38/65] parport: rm sentinel element from ctl_table array
:::::: branch date: 22 hours ago
:::::: commit date: 23 hours ago
config: microblaze-randconfig-r062-20230717 (https://download.01.org/0day-ci/archive/20230719/202307192154.Ti6lpJ4N-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192154.Ti6lpJ4N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307192154.Ti6lpJ4N-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
   drivers/parport/procfs.c:364:18-28: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +267 drivers/parport/procfs.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  257
^1da177e4c3f41 Linus Torvalds 2005-04-16  258
^1da177e4c3f41 Linus Torvalds 2005-04-16  259  struct parport_sysctl_table {
37e9981e33e4d3 Joel Granados  2023-06-16  260  	struct ctl_table_header *port_header;
37e9981e33e4d3 Joel Granados  2023-06-16  261  	struct ctl_table_header *devices_header;
03ff367f259166 Joel Granados  2023-06-27  262  #ifdef CONFIG_PARPORT_1284
03ff367f259166 Joel Granados  2023-06-27  263  	struct ctl_table vars[10];
03ff367f259166 Joel Granados  2023-06-27  264  #else
03ff367f259166 Joel Granados  2023-06-27  265  	struct ctl_table vars[5];
03ff367f259166 Joel Granados  2023-06-27  266  #endif /* IEEE 1284 support */
03ff367f259166 Joel Granados  2023-06-27 @267  	struct ctl_table device_dir[1];
^1da177e4c3f41 Linus Torvalds 2005-04-16  268  };
^1da177e4c3f41 Linus Torvalds 2005-04-16  269

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
