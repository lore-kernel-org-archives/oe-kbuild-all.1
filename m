Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2D917C6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 16:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674923563; x=1706459563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F7iTdF/rwlweCThJuVnLomvzqZ36XGeLVYxV+IgwFmk=;
  b=bKqHUEboNnYzTKnYBf7ma3d/NAXu4dHslpZ/QvkBZZM9GdRbhuOQFKFS
   4IL2Yv9nIFlrprU3uNsnZ1CRzoPCMJQH9azZuji9405cfRAK3GJBOQkha
   CRFUMq1SYVu3cT95z908BG5X0XOJv9A23Opv0etNP3RojRh/+WX4OpbBj
   SQ50Xrhzxi0ZUuKoqoQiSmVqc2Gp3QGGEe6OhZSyP0hZY5kEhYSrQx8Eh
   vIcJCOSbv6JEmIuXfW97rvqlBmRfNMvRWCsriLaEc6HeurF22ySPxMz5/
   JOmymBif3YyIfiEEUNpbCH5qi4ojg6RKxOMqQBVLGEOMKoGVNkMP33slV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="310927849"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="310927849"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 08:32:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="656959294"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="656959294"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Jan 2023 08:32:41 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLo89-0000uT-0S;
	Sat, 28 Jan 2023 16:32:41 +0000
Date: Sun, 29 Jan 2023 00:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6543/6550]
 arch/arm64/kvm/hyp_trace.c:488:5: warning: no previous prototype for
 'hyp_trace_release'
Message-ID: <202301290050.ZdA0BvoP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b5a5282ca964178e46d1adb96ea1c3341303e94b
commit: 34305ad4b1bbf0b1938712ef0070a78d8b2c3583 [6543/6550] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301290050.ZdA0BvoP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 34305ad4b1bbf0b1938712ef0070a78d8b2c3583
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:488:5: warning: no previous prototype for 'hyp_trace_release' [-Wmissing-prototypes]
     488 | int hyp_trace_release(struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~~~~~


vim +/hyp_trace_release +488 arch/arm64/kvm/hyp_trace.c

   487	
 > 488	int hyp_trace_release(struct inode *inode, struct file *file)
   489	{
   490		struct seq_file *m = file->private_data;
   491		struct ht_iterator *iter = m->private;
   492	
   493		ring_buffer_read_finish(iter->buf_iter);
   494	
   495		mutex_lock(&hyp_trace_lock);
   496		hyp_trace_readers--;
   497		mutex_unlock(&hyp_trace_lock);
   498	
   499		return seq_release_private(inode, file);
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
