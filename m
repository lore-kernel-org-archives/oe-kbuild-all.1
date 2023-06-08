Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3768331EE4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 20:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686256002; x=1717792002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/yltw0atI7Muse4FIpvZqrWzjggBkY0o9W4518/VoY4=;
  b=VPomFI5hxMEEsVn361RCuZMIJmxw4H2qCKbXkAX2eEQRwlzjw7y8/dqM
   R7+83z4ByYh8yPc5zZB0Vwd5qB0/LhPD8pkCyNqYk+sibloiy7Q1uhS5h
   ydX7ugvixtp2INoIXddpIigm8SdiVv/tEIGOBr/SPkacGKkL2P70bCgGY
   m83BlebLm0D5KH9uWu8XrsyuT/t4pSOOiPcHHCWXNLifJ5JF7hCVkQZh1
   vTz3NIqB147VJ8+h2Cn7jYZG6/T68sIk9UBiYOiqfNkp8DnTZTZn6UhbQ
   8PQx4OPc/BMJTD7IiK798lxg8p5v7MKnOLMQa+6J+P03gneSwsN0fUQhi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="359907929"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="359907929"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 13:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="956872025"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="956872025"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2023 13:26:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7MDN-0008Er-1l;
	Thu, 08 Jun 2023 20:26:37 +0000
Date: Fri, 9 Jun 2023 04:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: drivers/acpi/proc.c:139:30: warning:
 'acpi_system_wakeup_device_proc_ops' defined but not used
Message-ID: <202306090452.xsDyLQQZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexey,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   25041a4c02c7cf774d8b6ed60586fd64f1cdaa81
commit: 97a32539b9568bb653683349e5a76d02ff3c3e2c proc: convert everything to "struct proc_ops"
date:   3 years, 4 months ago
config: i386-buildonly-randconfig-r003-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090452.xsDyLQQZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=97a32539b9568bb653683349e5a76d02ff3c3e2c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 97a32539b9568bb653683349e5a76d02ff3c3e2c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/acpi/ drivers/gpu/drm/ drivers/mtd/nand/raw/ fs/nfsd/ kernel/ net/sunrpc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090452.xsDyLQQZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/proc.c:139:30: warning: 'acpi_system_wakeup_device_proc_ops' defined but not used [-Wunused-const-variable=]
     139 | static const struct proc_ops acpi_system_wakeup_device_proc_ops = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> net/sunrpc/cache.c:1636:30: warning: 'cache_flush_proc_ops' defined but not used [-Wunused-const-variable=]
    1636 | static const struct proc_ops cache_flush_proc_ops = {
         |                              ^~~~~~~~~~~~~~~~~~~~
>> net/sunrpc/cache.c:1598:30: warning: 'content_proc_ops' defined but not used [-Wunused-const-variable=]
    1598 | static const struct proc_ops content_proc_ops = {
         |                              ^~~~~~~~~~~~~~~~
>> net/sunrpc/cache.c:1574:30: warning: 'cache_channel_proc_ops' defined but not used [-Wunused-const-variable=]
    1574 | static const struct proc_ops cache_channel_proc_ops = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~
--
>> fs/nfsd/nfsctl.c:160:30: warning: 'exports_proc_ops' defined but not used [-Wunused-const-variable=]
     160 | static const struct proc_ops exports_proc_ops = {
         |                              ^~~~~~~~~~~~~~~~
--
>> kernel/sched/psi.c:1272:30: warning: 'psi_cpu_proc_ops' defined but not used [-Wunused-const-variable=]
    1272 | static const struct proc_ops psi_cpu_proc_ops = {
         |                              ^~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1263:30: warning: 'psi_memory_proc_ops' defined but not used [-Wunused-const-variable=]
    1263 | static const struct proc_ops psi_memory_proc_ops = {
         |                              ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1254:30: warning: 'psi_io_proc_ops' defined but not used [-Wunused-const-variable=]
    1254 | static const struct proc_ops psi_io_proc_ops = {
         |                              ^~~~~~~~~~~~~~~


vim +/acpi_system_wakeup_device_proc_ops +139 drivers/acpi/proc.c

   138	
 > 139	static const struct proc_ops acpi_system_wakeup_device_proc_ops = {
   140		.proc_open	= acpi_system_wakeup_device_open_fs,
   141		.proc_read	= seq_read,
   142		.proc_write	= acpi_system_write_wakeup_device,
   143		.proc_lseek	= seq_lseek,
   144		.proc_release	= single_release,
   145	};
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
