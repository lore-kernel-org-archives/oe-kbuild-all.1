Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB773EDB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 03:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677728462; x=1709264462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HKN3rOYFVzU7IlzP3RQbdlaNGBpewJPtm/nbiR+zN1g=;
  b=DCN+itOkySzgdF5pGae8HJkhK9RaMInr0XvnUQDBkIU9nSkloywpRR3n
   to4isc6eacon+DfRyQ11sRVg8MLFz56isySrcrOX5eli2ElSl39Lof/w5
   wukeCf5yXu1TBqjMbHJMKve0HTWuPqWtzASJZMM/DZYdtUPJCi9MOSgji
   1vhVK1VLAN84w7Zh//1Qwf+pSj8wvtLBFdRyGwIte+psBwnd9hiFMzbFp
   2wBfKqBLO1cJaiYm5aHPNifeGogIVWai1Q2LOhxaJaZAE/8RcAf+l8Jo/
   hu97OK88q6noQbF1ZY5L4cy/2RCgt6K2AhAX4ser25d5qXR/ESd9EhADm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332087427"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="332087427"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 19:41:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="677027880"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="677027880"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Mar 2023 19:40:59 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXZoQ-00009z-1P;
	Thu, 02 Mar 2023 03:40:58 +0000
Date: Thu, 2 Mar 2023 11:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:sysctl-testing-opt 19/20] fs/proc/proc_sysctl.c:1523:17:
 warning: this 'if' clause does not guard...
Message-ID: <202303021141.2tuBHJoT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git sysctl-testing-opt
head:   4ac91d63df04d5f5e9830394b6d266adb2a21585
commit: 491ac24c0e85eb3c310d397c9f6ae4f75a2282d2 [19/20] fs/proc: optimize register ctl_tables
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20230302/202303021141.2tuBHJoT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=491ac24c0e85eb3c310d397c9f6ae4f75a2282d2
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof sysctl-testing-opt
        git checkout 491ac24c0e85eb3c310d397c9f6ae4f75a2282d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=x86_64 SHELL=/bin/bash fs/proc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021141.2tuBHJoT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/proc_sysctl.c:1319:8: error: unknown type name 'ctl_dir'
    1319 | static ctl_dir *dir sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
         |        ^~~~~~~
   fs/proc/proc_sysctl.c:1319:21: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'sysctl_mkdir_p'
    1319 | static ctl_dir *dir sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
         |                     ^~~~~~~~~~~~~~
   fs/proc/proc_sysctl.c: In function '__register_sysctl_table_with_num':
   fs/proc/proc_sysctl.c:1428:15: error: implicit declaration of function 'sysctl_mkdir_p' [-Werror=implicit-function-declaration]
    1428 |         dir = sysctl_mkdir_p(dir, path);
         |               ^~~~~~~~~~~~~~
   fs/proc/proc_sysctl.c:1428:13: warning: assignment to 'struct ctl_dir *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1428 |         dir = sysctl_mkdir_p(dir, path);
         |             ^
   fs/proc/proc_sysctl.c: In function 'count_subheaders':
   fs/proc/proc_sysctl.c:1524:42: error: too few arguments to function 'count_subheaders'
    1524 |                         nr_subheaders += count_subheaders(entry->child);
         |                                          ^~~~~~~~~~~~~~~~
   fs/proc/proc_sysctl.c:1511:12: note: declared here
    1511 | static int count_subheaders(struct ctl_table *table, int register_by_num)
         |            ^~~~~~~~~~~~~~~~
>> fs/proc/proc_sysctl.c:1523:17: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    1523 |                 if (entry->child)
         |                 ^~
   fs/proc/proc_sysctl.c:1525:25: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    1525 |                         nr_subheaders += count_subheaders(entry->child, 0);
         |                         ^~~~~~~~~~~~~
   fs/proc/proc_sysctl.c:1526:17: error: 'else' without a previous 'if'
    1526 |                 else
         |                 ^~~~
   At top level:
   fs/proc/proc_sysctl.c:1011:24: warning: 'get_subdir' defined but not used [-Wunused-function]
    1011 | static struct ctl_dir *get_subdir(struct ctl_dir *dir,
         |                        ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/if +1523 fs/proc/proc_sysctl.c

6e9d5164153ad6 Eric W. Biederman 2012-01-21  1510  
491ac24c0e85eb Luis Chamberlain  2023-03-01  1511  static int count_subheaders(struct ctl_table *table, int register_by_num)
f728019bb72e65 Eric W. Biederman 2012-01-22  1512  {
f728019bb72e65 Eric W. Biederman 2012-01-22  1513  	int has_files = 0;
f728019bb72e65 Eric W. Biederman 2012-01-22  1514  	int nr_subheaders = 0;
491ac24c0e85eb Luis Chamberlain  2023-03-01  1515  	int num = register_by_num;
f728019bb72e65 Eric W. Biederman 2012-01-22  1516  	struct ctl_table *entry;
f728019bb72e65 Eric W. Biederman 2012-01-22  1517  
f728019bb72e65 Eric W. Biederman 2012-01-22  1518  	/* special case: no directory and empty directory */
f728019bb72e65 Eric W. Biederman 2012-01-22  1519  	if (!table || !table->procname)
f728019bb72e65 Eric W. Biederman 2012-01-22  1520  		return 1;
f728019bb72e65 Eric W. Biederman 2012-01-22  1521  
cb55f27ac9326b Meng Tang         2022-04-11  1522  	list_for_each_table_entry(entry, table) {
f728019bb72e65 Eric W. Biederman 2012-01-22 @1523  		if (entry->child)
f728019bb72e65 Eric W. Biederman 2012-01-22  1524  			nr_subheaders += count_subheaders(entry->child);
491ac24c0e85eb Luis Chamberlain  2023-03-01  1525  			nr_subheaders += count_subheaders(entry->child, 0);
f728019bb72e65 Eric W. Biederman 2012-01-22  1526  		else
f728019bb72e65 Eric W. Biederman 2012-01-22  1527  			has_files = 1;
491ac24c0e85eb Luis Chamberlain  2023-03-01  1528  		if (--num == 0)
491ac24c0e85eb Luis Chamberlain  2023-03-01  1529  			break;
f728019bb72e65 Eric W. Biederman 2012-01-22  1530  	}
f728019bb72e65 Eric W. Biederman 2012-01-22  1531  	return nr_subheaders + has_files;
f728019bb72e65 Eric W. Biederman 2012-01-22  1532  }
f728019bb72e65 Eric W. Biederman 2012-01-22  1533  

:::::: The code at line 1523 was first introduced by commit
:::::: f728019bb72e655680c02ad1829323054a8e875f sysctl: register only tables of sysctl files

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
