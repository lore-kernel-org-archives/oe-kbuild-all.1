Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E008D188
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Oct 2023 02:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJbvB81G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696733565; x=1728269565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z3hpsvEIE3DeMSOeY9RaYniZBHhSgMe9itY25BsGcYo=;
  b=GJbvB81GDVnI4PNdoFDYTRL7o665+NcOG3VUC+dxxpJi+bZDRs1wpApn
   qdl+KuWssT8KwWNNfCac9PABB5iGHaJ/iHXVXMVPQsfQwOJLm6cVGscvK
   GI/pz8ctGn0AkFeZ9C6LeTXfHBiUBgpGiGq9HwkSLP0B11BYTULhYQRma
   pqlRVZy5IvsI10YKWdHhm111qv3WA8pmjWO9wMCI1kAs6NtRtmRd85ipc
   w4thb8vqSupxSXS8Hg5trSbGOSDH9QajYFWXty8catUelkc2F8CYaLfjb
   +2dicViXzKNHsniFMDhRngcUaBbtUePXLhkGh1QRjoSwcKrhS0UEaGn02
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="450472818"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="450472818"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 19:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="926395578"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="926395578"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Oct 2023 19:52:43 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpJuL-00054T-2a;
	Sun, 08 Oct 2023 02:52:41 +0000
Date: Sun, 8 Oct 2023 10:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5i 11/25] lib/dynamic_debug.c:1249:64: error: 'struct
 _ddebug_info' has no member named 'num_class_users'; did you mean
 'num_classes'?
Message-ID: <202310081058.DmkJgvSo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jim,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jimc/linux.git dd-fix-5i
head:   0a69c097fec09676af8c1850c63b79c8eeacdaf0
commit: c7fb78f17e9048504581711fc74723e693f5646b [11/25] dyndbg: reduce verbose=3 messages
config: x86_64-randconfig-015-20231008 (https://download.01.org/0day-ci/archive/20231008/202310081058.DmkJgvSo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231008/202310081058.DmkJgvSo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310081058.DmkJgvSo-lkp@intel.com/

Note: the jimc/dd-fix-5i HEAD 0a69c097fec09676af8c1850c63b79c8eeacdaf0 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:30,
                    from lib/dynamic_debug.c:16:
   lib/dynamic_debug.c: In function 'ddebug_add_module':
>> lib/dynamic_debug.c:1249:64: error: 'struct _ddebug_info' has no member named 'num_class_users'; did you mean 'num_classes'?
    1249 |                   modname, di->num_descs, di->num_classes, di->num_class_users);
         |                                                                ^~~~~~~~~~~~~~~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   lib/dynamic_debug.c:123:17: note: in expansion of macro 'pr_info'
     123 |                 pr_info(fmt, ##__VA_ARGS__);                    \
         |                 ^~~~~~~
   lib/dynamic_debug.c:128:33: note: in expansion of macro 'vnpr_info'
     128 | #define v3pr_info(fmt, ...)     vnpr_info(3, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~
   lib/dynamic_debug.c:1248:9: note: in expansion of macro 'v3pr_info'
    1248 |         v3pr_info("add-module: %s %d sites %d.%d classes.refs\n",
         |         ^~~~~~~~~


vim +1249 lib/dynamic_debug.c

  1236	
  1237	/*
  1238	 * Allocate a new ddebug_table for the given module
  1239	 * and add it to the global list.
  1240	 */
  1241	static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
  1242	{
  1243		struct ddebug_table *dt;
  1244	
  1245		if (!di->num_descs)
  1246			return 0;
  1247	
  1248		v3pr_info("add-module: %s %d sites %d.%d classes.refs\n",
> 1249			  modname, di->num_descs, di->num_classes, di->num_class_users);
  1250	
  1251		dt = kzalloc(sizeof(*dt), GFP_KERNEL);
  1252		if (dt == NULL) {
  1253			pr_err("error adding module: %s\n", modname);
  1254			return -ENOMEM;
  1255		}
  1256		/*
  1257		 * For built-in modules, name lives in .rodata and is
  1258		 * immortal. For loaded modules, name points at the name[]
  1259		 * member of struct module, which lives at least as long as
  1260		 * this struct ddebug_table.
  1261		 */
  1262		dt->mod_name = modname;
  1263		dt->ddebugs = di->descs;
  1264		dt->num_ddebugs = di->num_descs;
  1265	
  1266		INIT_LIST_HEAD(&dt->link);
  1267	
  1268		if (di->classes && di->num_classes)
  1269			ddebug_attach_module_classes(dt, di);
  1270	
  1271		mutex_lock(&ddebug_lock);
  1272		list_add_tail(&dt->link, &ddebug_tables);
  1273		mutex_unlock(&ddebug_lock);
  1274	
  1275		vpr_info("%3u debug prints in module %s\n", di->num_descs, modname);
  1276		return 0;
  1277	}
  1278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
