Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA48B33DE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683037351; x=1714573351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=okhpxlRDEQALG8h9nFGRMtX82IOIMhVCPENvPmmTTwE=;
  b=E0yMuXpV+3tpT37me8Nt+QJbMjIiVfF+6SV23IhVrnjGmeGkw1jKp9YI
   EUczHZdfkRWPpgx8y3ypR9jg5OZoVcx2iS15mODK8TYjx8783HXWDaWLE
   IcbUXg97UWZlBg4BzmQEnE9g27BkkJTHJ4bBTXN9vk20lxZOzHam5o0la
   /QAbaUdWyI/WmMT/NzK8lvqqqg0U8f0nBaCT18PwpKsTEYMROCFNAbLAy
   WgqNKN3xied53+bW4DmLXmYMt5XDwGKD8gaDg0dgIFgsFh3r90bEpfizx
   ffEW47QbPnQgSRKTFWjpBvag6dODLKfXh4TMVlBZ/4tvVkMeb8noQjhDc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="348453633"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="348453633"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 07:22:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="726758659"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="726758659"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 May 2023 07:22:27 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptqte-000165-2O;
	Tue, 02 May 2023 14:22:26 +0000
Date: Tue, 2 May 2023 22:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ajay Kaher <akaher@vmware.com>, rostedt@goodmis.org,
	mhiramat@kernel.org, shuah@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	chinglinyu@google.com, namit@vmware.com, srivatsab@vmware.com,
	srivatsa@csail.mit.edu, amakhalov@vmware.com,
	vsirnapalli@vmware.com, tkundu@vmware.com, er.ajay.kaher@gmail.com,
	Ajay Kaher <akaher@vmware.com>
Subject: Re: [PATCH v2 4/9] eventfs: adding eventfs file, directory remove
 function
Message-ID: <202305022234.nOgIYubz-lkp@intel.com>
References: <1683026600-13485-5-git-send-email-akaher@vmware.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683026600-13485-5-git-send-email-akaher@vmware.com>

Hi Ajay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes linus/master rostedt-trace/for-next v6.3 next-20230428]
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ajay-Kaher/eventfs-introducing-struct-tracefs_inode/20230502-192949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/1683026600-13485-5-git-send-email-akaher%40vmware.com
patch subject: [PATCH v2 4/9] eventfs: adding eventfs file, directory remove function
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230502/202305022234.nOgIYubz-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9a36b39da0c3fbfe15a3c3a0ed71b52013bac292
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ajay-Kaher/eventfs-introducing-struct-tracefs_inode/20230502-192949
        git checkout 9a36b39da0c3fbfe15a3c3a0ed71b52013bac292
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash fs/tracefs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022234.nOgIYubz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/tracefs/event_inode.c:379:6: warning: no previous prototype for 'eventfs_remove_rec' [-Wmissing-prototypes]
     379 | void eventfs_remove_rec(struct eventfs_file *ef)
         |      ^~~~~~~~~~~~~~~~~~
   fs/tracefs/event_inode.c:58:13: warning: 'eventfs_up_read' defined but not used [-Wunused-function]
      58 | static void eventfs_up_read(struct rw_semaphore *eventfs_rwsem)
         |             ^~~~~~~~~~~~~~~
   fs/tracefs/event_inode.c:47:13: warning: 'eventfs_down_read' defined but not used [-Wunused-function]
      47 | static void eventfs_down_read(struct rw_semaphore *eventfs_rwsem)
         |             ^~~~~~~~~~~~~~~~~
   fs/tracefs/event_inode.c:31:29: warning: 'eventfs_dentry_to_rwsem' defined but not used [-Wunused-function]
      31 | static struct rw_semaphore *eventfs_dentry_to_rwsem(struct dentry *dentry)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/eventfs_remove_rec +379 fs/tracefs/event_inode.c

   371	
   372	/**
   373	 * eventfs_remove_rec - remove eventfs dir or file from list
   374	 * @ef: a pointer to eventfs_file to be removed.
   375	 *
   376	 * This function recursively remove eventfs_file which
   377	 * contains info of file or dir.
   378	 */
 > 379	void eventfs_remove_rec(struct eventfs_file *ef)
   380	{
   381		struct eventfs_file *ef_child, *n;
   382	
   383		if (!ef)
   384			return;
   385	
   386		if (ef->ei) {
   387			/* search for nested folders or files */
   388			list_for_each_entry_safe(ef_child, n, &ef->ei->e_top_files, list) {
   389				eventfs_remove_rec(ef_child);
   390			}
   391			kfree(ef->ei);
   392		}
   393	
   394		if (ef->created && ef->dentry) {
   395			d_invalidate(ef->dentry);
   396			dput(ef->dentry);
   397		}
   398		list_del(&ef->list);
   399		kfree(ef->name);
   400		kfree(ef);
   401	}
   402	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
