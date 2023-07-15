Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B81628
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 00:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689381589; x=1720917589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XJChVpI/qCdntQVn7a7QNC3ZA/lLjn7W5e9z2OtS+gU=;
  b=V71CxQ8QsYwpPZKs5dxOZFGYJB+N7BPW3N2L0bPi+wnFx5ZpPKA/nP8R
   gg5BUjPgrsGLiRi5LwL/mRE0yAcKwAhb+zuXWcp9QiHma04W+2GzxjAp2
   neJDJNg1awKrhpRdpe/iFeC1yyQPWs7KkBPuHyOSRwkQAM33l6r/i7jn8
   nCZQb/bY16VvZ6Z7Ybd5tGN7wsmmo6yE3qT382kfRcgfsuJjqul0rH4Mt
   KgWH3noSjBU+Qg46RO1Cn3pxJ5peQyvilmj/trDTJwS3KweBVyueFLtyT
   KO50B0sMOhkq7QD1MtkNaBHey5ax+rIIwjs9BVwqcMSZgXUPKRv6fPbvc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="350482242"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="350482242"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 17:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="725891640"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="725891640"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jul 2023 17:39:47 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKTK6-0007n5-1E;
	Sat, 15 Jul 2023 00:39:46 +0000
Date: Sat, 15 Jul 2023 08:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2m 14/22] lib/dynamic_debug.c:1075:1: error: function
 definition is not allowed here
Message-ID: <202307150819.NyFX05op-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2m
head:   5500fe67fcd8b3d2924577403c7996cd47121074
commit: 521d3621f94878ff0c0245f66d4f9fcb83040386 [14/22] dyndbg: add for_each_boxed_vector
config: x86_64-randconfig-x002-20230714 (https://download.01.org/0day-ci/archive/20230715/202307150819.NyFX05op-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150819.NyFX05op-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307150819.NyFX05op-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/dynamic_debug.c:1075:1: error: function definition is not allowed here
   {
   ^
   lib/dynamic_debug.c:1111:1: error: function definition is not allowed here
   {
   ^
>> lib/dynamic_debug.c:1118:10: error: use of undeclared identifier 'ddebug_proc_show'
           .show = ddebug_proc_show,
                   ^
>> lib/dynamic_debug.c:1119:10: error: use of undeclared identifier 'ddebug_proc_stop'
           .stop = ddebug_proc_stop
                   ^
   lib/dynamic_debug.c:1123:1: error: function definition is not allowed here
   {
   ^
>> lib/dynamic_debug.c:1130:10: error: use of undeclared identifier 'ddebug_proc_open'; did you mean 'ddebug_proc_fops'?
           .open = ddebug_proc_open,
                   ^~~~~~~~~~~~~~~~
                   ddebug_proc_fops
   lib/dynamic_debug.c:1128:37: note: 'ddebug_proc_fops' declared here
   static const struct file_operations ddebug_proc_fops = {
                                       ^
>> lib/dynamic_debug.c:1130:10: error: initializing 'int (*)(struct inode *, struct file *)' with an expression of incompatible type 'const struct file_operations'
           .open = ddebug_proc_open,
                   ^~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1138:15: error: use of undeclared identifier 'ddebug_proc_open'; did you mean 'ddebug_proc_fops'?
           .proc_open = ddebug_proc_open,
                        ^~~~~~~~~~~~~~~~
                        ddebug_proc_fops
   lib/dynamic_debug.c:1128:37: note: 'ddebug_proc_fops' declared here
   static const struct file_operations ddebug_proc_fops = {
                                       ^
   lib/dynamic_debug.c:1138:15: error: initializing 'int (*)(struct inode *, struct file *)' with an expression of incompatible type 'const struct file_operations'
           .proc_open = ddebug_proc_open,
                        ^~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1154:1: error: function definition is not allowed here
   {
   ^
   lib/dynamic_debug.c:1168:1: error: function definition is not allowed here
   {
   ^
   lib/dynamic_debug.c:1184:1: error: function definition is not allowed here
   {
   ^
   lib/dynamic_debug.c:1208:1: error: function definition is not allowed here
   {
   ^
   lib/dynamic_debug.c:1238:1: error: function definition is not allowed here
   {
   ^
   lib/dynamic_debug.c:1274:1: error: function definition is not allowed here
   {
   ^
   lib/dynamic_debug.c:1318:1: error: function definition is not allowed here
   {
   ^
   lib/dynamic_debug.c:1339:1: error: function definition is not allowed here
   {
   ^
   lib/dynamic_debug.c:1350:1: error: function definition is not allowed here
   {
   ^
   lib/dynamic_debug.c:1356:1: error: function definition is not allowed here
   {
   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +1075 lib/dynamic_debug.c

a4a2a427413e35 Jim Cromie  2022-09-04  1067  
e9d376f0fa66bd Jason Baron 2009-02-05  1068  /*
e9d376f0fa66bd Jason Baron 2009-02-05  1069   * Seq_ops show method.  Called several times within a read()
e9d376f0fa66bd Jason Baron 2009-02-05  1070   * call from userspace, with ddebug_lock held.  Formats the
e9d376f0fa66bd Jason Baron 2009-02-05  1071   * current _ddebug as a single human-readable line, with a
e9d376f0fa66bd Jason Baron 2009-02-05  1072   * special case for the header line.
e9d376f0fa66bd Jason Baron 2009-02-05  1073   */
e9d376f0fa66bd Jason Baron 2009-02-05  1074  static int ddebug_proc_show(struct seq_file *m, void *p)
e9d376f0fa66bd Jason Baron 2009-02-05 @1075  {
e9d376f0fa66bd Jason Baron 2009-02-05  1076  	struct ddebug_iter *iter = m->private;
e9d376f0fa66bd Jason Baron 2009-02-05  1077  	struct _ddebug *dp = p;
f678ce8cc3cb2a Jim Cromie  2020-07-19  1078  	struct flagsbuf flags;
a4a2a427413e35 Jim Cromie  2022-09-04  1079  	char const *class;
e9d376f0fa66bd Jason Baron 2009-02-05  1080  
e9d376f0fa66bd Jason Baron 2009-02-05  1081  	if (p == SEQ_START_TOKEN) {
e9d376f0fa66bd Jason Baron 2009-02-05  1082  		seq_puts(m,
e9d376f0fa66bd Jason Baron 2009-02-05  1083  			 "# filename:lineno [module]function flags format\n");
e9d376f0fa66bd Jason Baron 2009-02-05  1084  		return 0;
e9d376f0fa66bd Jason Baron 2009-02-05  1085  	}
e9d376f0fa66bd Jason Baron 2009-02-05  1086  
5ca7d2a6c5e4f2 Jim Cromie  2011-12-19  1087  	seq_printf(m, "%s:%u [%s]%s =%s \"",
2b6783191da721 Jim Cromie  2011-12-19  1088  		   trim_prefix(dp->filename), dp->lineno,
e9d376f0fa66bd Jason Baron 2009-02-05  1089  		   iter->table->mod_name, dp->function,
f678ce8cc3cb2a Jim Cromie  2020-07-19  1090  		   ddebug_describe_flags(dp->flags, &flags));
47ea6f99d06e5a Jim Cromie  2022-09-04  1091  	seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
a4a2a427413e35 Jim Cromie  2022-09-04  1092  	seq_puts(m, "\"");
a4a2a427413e35 Jim Cromie  2022-09-04  1093  
a4a2a427413e35 Jim Cromie  2022-09-04  1094  	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
014d92d98931e7 Jim Cromie  2022-12-21  1095  		class = ddebug_class_name(iter->table, dp);
a4a2a427413e35 Jim Cromie  2022-09-04  1096  		if (class)
a4a2a427413e35 Jim Cromie  2022-09-04  1097  			seq_printf(m, " class:%s", class);
a4a2a427413e35 Jim Cromie  2022-09-04  1098  		else
a4a2a427413e35 Jim Cromie  2022-09-04  1099  			seq_printf(m, " class unknown, _id:%d", dp->class_id);
a4a2a427413e35 Jim Cromie  2022-09-04  1100  	}
a4a2a427413e35 Jim Cromie  2022-09-04  1101  	seq_puts(m, "\n");
e9d376f0fa66bd Jason Baron 2009-02-05  1102  
e9d376f0fa66bd Jason Baron 2009-02-05  1103  	return 0;
e9d376f0fa66bd Jason Baron 2009-02-05  1104  }
e9d376f0fa66bd Jason Baron 2009-02-05  1105  
e9d376f0fa66bd Jason Baron 2009-02-05  1106  /*
e9d376f0fa66bd Jason Baron 2009-02-05  1107   * Seq_ops stop method.  Called at the end of each read()
e9d376f0fa66bd Jason Baron 2009-02-05  1108   * call from userspace.  Drops ddebug_lock.
e9d376f0fa66bd Jason Baron 2009-02-05  1109   */
e9d376f0fa66bd Jason Baron 2009-02-05  1110  static void ddebug_proc_stop(struct seq_file *m, void *p)
e9d376f0fa66bd Jason Baron 2009-02-05  1111  {
e9d376f0fa66bd Jason Baron 2009-02-05  1112  	mutex_unlock(&ddebug_lock);
e9d376f0fa66bd Jason Baron 2009-02-05  1113  }
e9d376f0fa66bd Jason Baron 2009-02-05  1114  
e9d376f0fa66bd Jason Baron 2009-02-05  1115  static const struct seq_operations ddebug_proc_seqops = {
e9d376f0fa66bd Jason Baron 2009-02-05  1116  	.start = ddebug_proc_start,
e9d376f0fa66bd Jason Baron 2009-02-05  1117  	.next = ddebug_proc_next,
e9d376f0fa66bd Jason Baron 2009-02-05 @1118  	.show = ddebug_proc_show,
e9d376f0fa66bd Jason Baron 2009-02-05 @1119  	.stop = ddebug_proc_stop
e9d376f0fa66bd Jason Baron 2009-02-05  1120  };
e9d376f0fa66bd Jason Baron 2009-02-05  1121  
e9d376f0fa66bd Jason Baron 2009-02-05  1122  static int ddebug_proc_open(struct inode *inode, struct file *file)
e9d376f0fa66bd Jason Baron 2009-02-05  1123  {
4bad78c5500253 Rob Jones   2014-10-13  1124  	return seq_open_private(file, &ddebug_proc_seqops,
4bad78c5500253 Rob Jones   2014-10-13  1125  				sizeof(struct ddebug_iter));
e9d376f0fa66bd Jason Baron 2009-02-05  1126  }
e9d376f0fa66bd Jason Baron 2009-02-05  1127  
e9d376f0fa66bd Jason Baron 2009-02-05  1128  static const struct file_operations ddebug_proc_fops = {
e9d376f0fa66bd Jason Baron 2009-02-05  1129  	.owner = THIS_MODULE,
e9d376f0fa66bd Jason Baron 2009-02-05 @1130  	.open = ddebug_proc_open,
e9d376f0fa66bd Jason Baron 2009-02-05  1131  	.read = seq_read,
e9d376f0fa66bd Jason Baron 2009-02-05  1132  	.llseek = seq_lseek,
e9d376f0fa66bd Jason Baron 2009-02-05  1133  	.release = seq_release_private,
e9d376f0fa66bd Jason Baron 2009-02-05  1134  	.write = ddebug_proc_write
e9d376f0fa66bd Jason Baron 2009-02-05  1135  };
e9d376f0fa66bd Jason Baron 2009-02-05  1136  

:::::: The code at line 1075 was first introduced by commit
:::::: e9d376f0fa66bd630fe27403669c6ae6c22a868f dynamic debug: combine dprintk and dynamic printk

:::::: TO: Jason Baron <jbaron@redhat.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
