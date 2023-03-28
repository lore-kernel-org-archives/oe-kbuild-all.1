Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E21D28FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 12:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680006432; x=1711542432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iE+sP7gn/ZbtTvsuBQGNWds6PLAatGi9yPYsvJjS1rs=;
  b=WZLJlDMu9fQbRDWuJT1jqwIYXyLiYENnnsVfGI8c6l+c9ZXHX61v3GQf
   bpBiqPw2musNPG7dWhX5OKfhiwPyRRdkBp5is5Q3/vKUrxZ4HeVmt7Nit
   LuAFFjAUt2aFTvbAdxk9hNWFZviv3tl9SE0P58QOvKY9M0+TdxcGLK+Tv
   QkHZrrhy+H0rv9jZ85bO7N5cnc6G7VoAJR3T5lhKGSl2gVFFFBTlEy37w
   cU4f/x9GdQdIizmgJZIp3nHlRc7w2NzWaqFuJJMOMNTBzElFEgKmXE1iA
   Thj454N98vp++8L84aKJjvJWqEmPCpj47TXvDGE44fW5GW8rI//sSkMKJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="339273777"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="339273777"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 05:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="773136748"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="773136748"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Mar 2023 05:27:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph8Pm-000IWV-2h;
	Tue, 28 Mar 2023 12:27:02 +0000
Date: Tue, 28 Mar 2023 20:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 14/21] include/linux/acpi.h:491:1: error: expected
 identifier or '(' before '{' token
Message-ID: <202303282017.1iuVV8nk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   a3ffd388575a5401efc468d0673218aeb0df5148
commit: 259dcd218ef004d6ba80e19e7bfc83052c71816f [14/21] ACPI: NUMA: Add helper function to retrieve the performance attributes
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230328/202303282017.1iuVV8nk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=259dcd218ef004d6ba80e19e7bfc83052c71816f
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 259dcd218ef004d6ba80e19e7bfc83052c71816f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/firmware/efi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303282017.1iuVV8nk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/efi/efi.c:31:
>> include/linux/acpi.h:491:1: error: expected identifier or '(' before '{' token
     491 | {
         | ^
   drivers/firmware/efi/efi.c:176:16: warning: no previous prototype for 'efi_attr_is_visible' [-Wmissing-prototypes]
     176 | umode_t __weak efi_attr_is_visible(struct kobject *kobj, struct attribute *attr,
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:490:19: warning: 'acpi_get_genport_attrs' declared 'static' but never defined [-Wunused-function]
     490 | static inline int acpi_get_genport_attrs(u8 *device_handle, u64 *val, int type);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/tpm.h:21,
                    from include/linux/tpm_eventlog.h:6,
                    from drivers/firmware/efi/tpm.c:14:
>> include/linux/acpi.h:491:1: error: expected identifier or '(' before '{' token
     491 | {
         | ^
   include/linux/acpi.h:490:19: warning: 'acpi_get_genport_attrs' declared 'static' but never defined [-Wunused-function]
     490 | static inline int acpi_get_genport_attrs(u8 *device_handle, u64 *val, int type);
         |                   ^~~~~~~~~~~~~~~~~~~~~~


vim +491 include/linux/acpi.h

   489	
   490	static inline int acpi_get_genport_attrs(u8 *device_handle, u64 *val, int type);
 > 491	{
   492		return -EOPNOTSUPP;
   493	}
   494	#endif
   495	extern int acpi_paddr_to_node(u64 start_addr, u64 size);
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
