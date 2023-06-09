Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBED23403
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 22:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686348232; x=1717884232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+2xVNeqjnD9Ski4v/Ks+Qt2Pj5ibDVUosXWfxdUk9J8=;
  b=TtqqcYH6pB30c4CRL1MzUFnP/qnxlotaOuAGP25+u98hZ9bCnUgzl3/U
   kU3VgOFdQgjRBdfJGIApNNODJokvkG0QfW3Rt2zgnzh48n33teAhJqcZT
   ZyJO26jFCMF2nGnp7A/pfnGYrl/AruplC0J+XLnZoNlZ3kCxAibNcTxGa
   NbjeQzYS0YttlnvpMdN/pMFR69TNxK9GXEuraCGyIV9xtSuql+xFV9xGr
   1r/XmiyNtU3lLUKL5/DKEIpoPd4pvBLXASd7LqenNSjrYNATXRaRyrPY8
   Ecgde7fa1nr6J53mfZ063H8CBfCt1KXvWFWuRjtgdmSc5RmgLl9QZPqUj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="342373512"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="342373512"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 15:03:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="713663922"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="713663922"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Jun 2023 15:03:49 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7kCy-0009Ri-2d;
	Fri, 09 Jun 2023 22:03:48 +0000
Date: Sat, 10 Jun 2023 06:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: net/netfilter/../../fs/proc/internal.h:51:9: error: unknown type
 name 'proc_write_t'
Message-ID: <202306100539.6hGSPfK6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JP,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: dac2dd2be24d8fa1bc023a28affc0faf91bc62b9 ANDROID: netfilter: xt_qtaguid: add qtaguid matching module
date:   2 years, 6 months ago
config: nds32-randconfig-r004-20230610 (https://download.01.org/0day-ci/archive/20230610/202306100539.6hGSPfK6-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=dac2dd2be24d8fa1bc023a28affc0faf91bc62b9
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout dac2dd2be24d8fa1bc023a28affc0faf91bc62b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=nds32 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=nds32 SHELL=/bin/bash fs/proc/ net/netfilter/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100539.6hGSPfK6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from net/netfilter/xt_qtaguid.c:40:
>> net/netfilter/../../fs/proc/internal.h:51:9: error: unknown type name 'proc_write_t'
      51 |         proc_write_t write;
         |         ^~~~~~~~~~~~
   net/netfilter/xt_qtaguid.c:424:22: warning: no previous prototype for 'get_uid_data' [-Wmissing-prototypes]
     424 | struct uid_tag_data *get_uid_data(uid_t uid, bool *found_res)
         |                      ^~~~~~~~~~~~
   net/netfilter/xt_qtaguid.c: In function 'iface_stat_create_ipv6':
>> net/netfilter/xt_qtaguid.c:1014:13: warning: variable 'addr_type' set but not used [-Wunused-but-set-variable]
    1014 |         int addr_type;
         |             ^~~~~~~~~
   net/netfilter/xt_qtaguid.c: In function 'prdebug_full_state_locked':
   net/netfilter/xt_qtaguid.c:1821:27: warning: function 'prdebug_full_state_locked' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1821 |                           fmt_buff, args);
         |                           ^~~~~~~~
   net/netfilter/xt_qtaguid.c: At top level:
   net/netfilter/xt_qtaguid.c:2938:30: warning: 'proc_qtaguid_stats_fops' defined but not used [-Wunused-const-variable=]
    2938 | static const struct proc_ops proc_qtaguid_stats_fops = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/xt_qtaguid.c:2917:30: warning: 'proc_qtaguid_ctrl_fops' defined but not used [-Wunused-const-variable=]
    2917 | static const struct proc_ops proc_qtaguid_ctrl_fops = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/xt_qtaguid.c:1502:30: warning: 'proc_iface_stat_fmt_fops' defined but not used [-Wunused-const-variable=]
    1502 | static const struct proc_ops proc_iface_stat_fmt_fops = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/xt_qtaguid.c:783:30: warning: 'read_bool_fops' defined but not used [-Wunused-const-variable=]
     783 | static const struct proc_ops read_bool_fops = {
         |                              ^~~~~~~~~~~~~~
   net/netfilter/xt_qtaguid.c:778:30: warning: 'read_u64_fops' defined but not used [-Wunused-const-variable=]
     778 | static const struct proc_ops read_u64_fops = {
         |                              ^~~~~~~~~~~~~
   net/netfilter/xt_qtaguid.c:125:20: warning: 'iface_stat_fmt_procfilename' defined but not used [-Wunused-variable]
     125 | static const char *iface_stat_fmt_procfilename = "iface_stat_fmt";
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/xt_qtaguid.c:123:20: warning: 'iface_stat_all_procfilename' defined but not used [-Wunused-variable]
     123 | static const char *iface_stat_all_procfilename = "iface_stat_all";
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/proc_write_t +51 net/netfilter/../../fs/proc/internal.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  19  
59d8053f1e1690 David Howells     2013-04-11  20  /*
59d8053f1e1690 David Howells     2013-04-11  21   * This is not completely implemented yet. The idea is to
59d8053f1e1690 David Howells     2013-04-11  22   * create an in-memory tree (like the actual /proc filesystem
59d8053f1e1690 David Howells     2013-04-11  23   * tree) of these proc_dir_entries, so that we can dynamically
59d8053f1e1690 David Howells     2013-04-11  24   * add new files to /proc.
59d8053f1e1690 David Howells     2013-04-11  25   *
710585d4922fd3 Nicolas Dichtel   2014-12-10  26   * parent/subdir are used for the directory structure (every /proc file has a
710585d4922fd3 Nicolas Dichtel   2014-12-10  27   * parent, but "subdir" is empty for all non-directory entries).
710585d4922fd3 Nicolas Dichtel   2014-12-10  28   * subdir_node is used to build the rb tree "subdir" of the parent.
59d8053f1e1690 David Howells     2013-04-11  29   */
59d8053f1e1690 David Howells     2013-04-11  30  struct proc_dir_entry {
163cf548db8887 Alexey Dobriyan   2018-02-06  31  	/*
163cf548db8887 Alexey Dobriyan   2018-02-06  32  	 * number of callers into module in progress;
163cf548db8887 Alexey Dobriyan   2018-02-06  33  	 * negative -> it's going away RSN
163cf548db8887 Alexey Dobriyan   2018-02-06  34  	 */
163cf548db8887 Alexey Dobriyan   2018-02-06  35  	atomic_t in_use;
9cdd83e3100651 Alexey Dobriyan   2018-04-10  36  	refcount_t refcnt;
163cf548db8887 Alexey Dobriyan   2018-02-06  37  	struct list_head pde_openers;	/* who did ->open, but not ->release */
53f63345d893df Alexey Dobriyan   2018-02-06  38  	/* protects ->pde_openers and all struct pde_opener instances */
53f63345d893df Alexey Dobriyan   2018-02-06  39  	spinlock_t pde_unload_lock;
163cf548db8887 Alexey Dobriyan   2018-02-06  40  	struct completion *pde_unload_completion;
163cf548db8887 Alexey Dobriyan   2018-02-06  41  	const struct inode_operations *proc_iops;
d56c0d45f0e27f Alexey Dobriyan   2020-02-03  42  	union {
d56c0d45f0e27f Alexey Dobriyan   2020-02-03  43  		const struct proc_ops *proc_ops;
d56c0d45f0e27f Alexey Dobriyan   2020-02-03  44  		const struct file_operations *proc_dir_ops;
d56c0d45f0e27f Alexey Dobriyan   2020-02-03  45  	};
1fde6f21d90f8b Alexey Dobriyan   2019-02-01  46  	const struct dentry_operations *proc_dops;
3f3942aca6da35 Christoph Hellwig 2018-05-15  47  	union {
fddda2b7b52118 Christoph Hellwig 2018-04-13  48  		const struct seq_operations *seq_ops;
3f3942aca6da35 Christoph Hellwig 2018-05-15  49  		int (*single_show)(struct seq_file *, void *);
3f3942aca6da35 Christoph Hellwig 2018-05-15  50  	};
564def71765caf David Howells     2018-05-18 @51  	proc_write_t write;
163cf548db8887 Alexey Dobriyan   2018-02-06  52  	void *data;
44414d82cfe0f6 Christoph Hellwig 2018-04-24  53  	unsigned int state_size;
59d8053f1e1690 David Howells     2013-04-11  54  	unsigned int low_ino;
59d8053f1e1690 David Howells     2013-04-11  55  	nlink_t nlink;
59d8053f1e1690 David Howells     2013-04-11  56  	kuid_t uid;
59d8053f1e1690 David Howells     2013-04-11  57  	kgid_t gid;
59d8053f1e1690 David Howells     2013-04-11  58  	loff_t size;
710585d4922fd3 Nicolas Dichtel   2014-12-10  59  	struct proc_dir_entry *parent;
4f1134370a29a5 Alexey Dobriyan   2018-04-10  60  	struct rb_root subdir;
710585d4922fd3 Nicolas Dichtel   2014-12-10  61  	struct rb_node subdir_node;
b4884f23331ae3 Alexey Dobriyan   2018-04-10  62  	char *name;
163cf548db8887 Alexey Dobriyan   2018-02-06  63  	umode_t mode;
d919b33dafb3e2 Alexey Dobriyan   2020-04-06  64  	u8 flags;
59d8053f1e1690 David Howells     2013-04-11  65  	u8 namelen;
24074a35c5c975 David Howells     2018-06-13  66  	char inline_name[];
3859a271a003ab Kees Cook         2016-10-28  67  } __randomize_layout;
^1da177e4c3f41 Linus Torvalds    2005-04-16  68  

:::::: The code at line 51 was first introduced by commit
:::::: 564def71765caf65040f926c0783b9c27cc6c087 proc: Add a way to make network proc files writable

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
