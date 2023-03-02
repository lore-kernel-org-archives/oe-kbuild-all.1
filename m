Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948EAEC4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 03:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677727800; x=1709263800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l44LsQyBJzafawBAdtwM9+bLehEBhTkrMWO8sWInBCQ=;
  b=foFuAUfxqAEa/Ph7qoz4hpXhY2AfDeApfMGznXXPzJBgVwYp3PPijwYl
   18SMUdaaA55RSCM0iAYj1yDWPagBY1RSnwogUqbBC+ngkgWCXMgCYSaZO
   fM0rDhW0s5oTKD60EmN7gX94wLBjxKVVmJlNdKJUwYwWnuIXJreIQi/jJ
   a73QMYdFzPjmvtoWdyT57xWUorp/uXYGFZvZCYsUihOd1U681qr9sfhs4
   GOAZhJPKNbpgy0qND+1z12B+PB5kIYwS988u2gbNdkvTwCF5gx1PARuZm
   8+D+R9cCp3/5XCmer7gX83ozXFgLdWa7WOHWVPzaCDRA/NiHFp73+2gNw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332085158"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="332085158"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 19:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="743674636"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="743674636"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Mar 2023 19:29:58 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXZdm-00009Q-0N;
	Thu, 02 Mar 2023 03:29:58 +0000
Date: Thu, 2 Mar 2023 11:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:sysctl-testing-opt 2/20] fs/proc/proc_sysctl.c:1287:8:
 error: unknown type name 'ctl_dir'
Message-ID: <202303021147.jkbtTaa3-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git sysctl-testing-opt
head:   4ac91d63df04d5f5e9830394b6d266adb2a21585
commit: 16bbd0aea0b8edb87a0133affeaad33820ce81f9 [2/20] proc_sysctl: move helper which creates required subdirectories
config: arc-randconfig-r043-20230302 (https://download.01.org/0day-ci/archive/20230302/202303021147.jkbtTaa3-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=16bbd0aea0b8edb87a0133affeaad33820ce81f9
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof sysctl-testing-opt
        git checkout 16bbd0aea0b8edb87a0133affeaad33820ce81f9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash fs/proc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021147.jkbtTaa3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/proc/proc_sysctl.c:1287:8: error: unknown type name 'ctl_dir'
    1287 | static ctl_dir *dir sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
         |        ^~~~~~~
>> fs/proc/proc_sysctl.c:1287:21: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'sysctl_mkdir_p'
    1287 | static ctl_dir *dir sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
         |                     ^~~~~~~~~~~~~~
   fs/proc/proc_sysctl.c: In function '__register_sysctl_table':
>> fs/proc/proc_sysctl.c:1390:15: error: implicit declaration of function 'sysctl_mkdir_p' [-Werror=implicit-function-declaration]
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


vim +/ctl_dir +1287 fs/proc/proc_sysctl.c

  1285	
  1286	/* Find or the directory for the ctl_table. If one is not found create it. */
> 1287	static ctl_dir *dir sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
  1288	{
  1289		const char *name, *nextname;
  1290	
  1291		for (name = path; name; name = nextname) {
  1292			int namelen;
  1293			nextname = strchr(name, '/');
  1294			if (nextname) {
  1295				namelen = nextname - name;
  1296				nextname++;
  1297			} else {
  1298				namelen = strlen(name);
  1299			}
  1300			if (namelen == 0)
  1301				continue;
  1302	
  1303			/*
  1304			 * namelen ensures if name is "foo/bar/yay" only foo is
  1305			 * registered first. We traverse as if using mkdir -p and
  1306			 * return a ctl_dir for the last directory entry.
  1307			 */
  1308			dir = get_subdir(dir, name, namelen);
  1309			if (IS_ERR(dir))
  1310				break;
  1311		}
  1312		return dir;
  1313	}
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
