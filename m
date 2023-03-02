Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B253EC4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 02:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677725158; x=1709261158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cajdDCtxH6LIDWXIedmqOyFEr7wc6fXf9nnLuTyx10M=;
  b=IzwFhdRz/UvOfDC8U2XKzsQI3dxUz98paWQNOQ4v2lat9yUX8BOJA7eF
   czlcqzfQ1zdcnRRP0xOJ28Z2gmwvPAACoLpPe9GlFCd7mr7x+6gFpJH6l
   RhjhLXNQRngp+Dj+Vr9ssZ2Sh8Fsc7B9+jElKt4Nm+zuuVjOINCzQEWTI
   gyPK9AsaVIgNcE6aOdRlZ/DHlOsp4xcKwa9AhhmTCAH83xRlNFxe1RkfM
   V4TIgLdcZZuZajKIxaWeaNtRpQb5B4a+zh8d01p50aIwJ1gnPN2yi9Ykx
   EjGzoa65jUhKDvrKP7IUnT0Z0cPl3EuHv8aqK+QnPfF7OjguBs81y5XSk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="397162982"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="397162982"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 18:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="652242796"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="652242796"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Mar 2023 18:45:57 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXYxA-00006h-1F;
	Thu, 02 Mar 2023 02:45:56 +0000
Date: Thu, 2 Mar 2023 10:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:sysctl-testing 2/18] fs/proc/proc_sysctl.c:1390:13: warning:
 assignment to 'struct ctl_dir *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202303021045.Fo2wtkrv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Luis,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git sysctl-testing
head:   6cb58406515372b4ec0a26e7cdbe41db9ac90a15
commit: 16bbd0aea0b8edb87a0133affeaad33820ce81f9 [2/18] proc_sysctl: move helper which creates required subdirectories
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230302/202303021045.Fo2wtkrv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=16bbd0aea0b8edb87a0133affeaad33820ce81f9
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof sysctl-testing
        git checkout 16bbd0aea0b8edb87a0133affeaad33820ce81f9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash fs/proc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021045.Fo2wtkrv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/proc_sysctl.c:1287:8: error: unknown type name 'ctl_dir'
    1287 | static ctl_dir *dir sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
         |        ^~~~~~~
   fs/proc/proc_sysctl.c:1287:21: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'sysctl_mkdir_p'
    1287 | static ctl_dir *dir sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
         |                     ^~~~~~~~~~~~~~
   fs/proc/proc_sysctl.c: In function '__register_sysctl_table':
   fs/proc/proc_sysctl.c:1390:15: error: implicit declaration of function 'sysctl_mkdir_p' [-Werror=implicit-function-declaration]
    1390 |         dir = sysctl_mkdir_p(dir, path);
         |               ^~~~~~~~~~~~~~
>> fs/proc/proc_sysctl.c:1390:13: warning: assignment to 'struct ctl_dir *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1390 |         dir = sysctl_mkdir_p(dir, path);
         |             ^
   fs/proc/proc_sysctl.c: At top level:
   fs/proc/proc_sysctl.c:1000:24: warning: 'get_subdir' defined but not used [-Wunused-function]
    1000 | static struct ctl_dir *get_subdir(struct ctl_dir *dir,
         |                        ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1390 fs/proc/proc_sysctl.c

  1314	
  1315	/**
  1316	 * __register_sysctl_table - register a leaf sysctl table
  1317	 * @set: Sysctl tree to register on
  1318	 * @path: The path to the directory the sysctl table is in.
  1319	 * @table: the top-level table structure without any child
  1320	 *
  1321	 * Register a sysctl table hierarchy. @table should be a filled in ctl_table
  1322	 * array. A completely 0 filled entry terminates the table.
  1323	 *
  1324	 * The members of the &struct ctl_table structure are used as follows:
  1325	 *
  1326	 * procname - the name of the sysctl file under /proc/sys. Set to %NULL to not
  1327	 *            enter a sysctl file
  1328	 *
  1329	 * data - a pointer to data for use by proc_handler
  1330	 *
  1331	 * maxlen - the maximum size in bytes of the data
  1332	 *
  1333	 * mode - the file permissions for the /proc/sys file
  1334	 *
  1335	 * child - must be %NULL.
  1336	 *
  1337	 * proc_handler - the text handler routine (described below)
  1338	 *
  1339	 * extra1, extra2 - extra pointers usable by the proc handler routines
  1340	 * XXX: we should eventually modify these to use long min / max [0]
  1341	 * [0] https://lkml.kernel.org/87zgpte9o4.fsf@email.froward.int.ebiederm.org
  1342	 *
  1343	 * Leaf nodes in the sysctl tree will be represented by a single file
  1344	 * under /proc; non-leaf nodes (where child is not NULL) are not allowed,
  1345	 * sysctl_check_table() verifies this.
  1346	 *
  1347	 * There must be a proc_handler routine for any terminal nodes.
  1348	 * Several default handlers are available to cover common cases -
  1349	 *
  1350	 * proc_dostring(), proc_dointvec(), proc_dointvec_jiffies(),
  1351	 * proc_dointvec_userhz_jiffies(), proc_dointvec_minmax(),
  1352	 * proc_doulongvec_ms_jiffies_minmax(), proc_doulongvec_minmax()
  1353	 *
  1354	 * It is the handler's job to read the input buffer from user memory
  1355	 * and process it. The handler should return 0 on success.
  1356	 *
  1357	 * This routine returns %NULL on a failure to register, and a pointer
  1358	 * to the table header on success.
  1359	 */
  1360	struct ctl_table_header *__register_sysctl_table(
  1361		struct ctl_table_set *set,
  1362		const char *path, struct ctl_table *table)
  1363	{
  1364		struct ctl_table_root *root = set->dir.header.root;
  1365		struct ctl_table_header *header;
  1366		struct ctl_dir *dir;
  1367		struct ctl_table *entry;
  1368		struct ctl_node *node;
  1369		int nr_entries = 0;
  1370	
  1371		list_for_each_table_entry(entry, table)
  1372			nr_entries++;
  1373	
  1374		header = kzalloc(sizeof(struct ctl_table_header) +
  1375				 sizeof(struct ctl_node)*nr_entries, GFP_KERNEL_ACCOUNT);
  1376		if (!header)
  1377			return NULL;
  1378	
  1379		node = (struct ctl_node *)(header + 1);
  1380		init_header(header, root, set, node, table);
  1381		if (sysctl_check_table(path, table))
  1382			goto fail;
  1383	
  1384		spin_lock(&sysctl_lock);
  1385		dir = &set->dir;
  1386		/* Reference moved down the directory tree get_subdir */
  1387		dir->header.nreg++;
  1388		spin_unlock(&sysctl_lock);
  1389	
> 1390		dir = sysctl_mkdir_p(dir, path);
  1391		if (IS_ERR(dir))
  1392			goto fail;
  1393		spin_lock(&sysctl_lock);
  1394		if (insert_header(dir, header))
  1395			goto fail_put_dir_locked;
  1396	
  1397		drop_sysctl_table(&dir->header);
  1398		spin_unlock(&sysctl_lock);
  1399	
  1400		return header;
  1401	
  1402	fail_put_dir_locked:
  1403		drop_sysctl_table(&dir->header);
  1404		spin_unlock(&sysctl_lock);
  1405	fail:
  1406		kfree(header);
  1407		dump_stack();
  1408		return NULL;
  1409	}
  1410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
