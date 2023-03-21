Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5541C10780
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 22:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679436538; x=1710972538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=thARaVfHePKJbeIZuLUmupkcwvFt+btiTZU2VSnk6IA=;
  b=h8scmmXB8hLvoTuZswVsHjsxsBVJCrgUTs7vN/gGgKeDIzK9xGwjJ9Ri
   6/tPJnIOilxxjOkhFEDZ/oLh+erbUmhZ40rJJMdRSX3CD2ggmtGWJC2FT
   BZrClLrHKJ8HVDXIDZ6SDVrg2tnPePMecvPGFpecvuyXFh7EBPK4ewQwE
   jE09/0xBbsJEJDLhmM9LXIZpHgVZayt9aP5Q3HRVZhlLWzW8WbQ/EfFAD
   McsluYVjpIqklcHcbHwEMnFeRKnxDNSZ4cZxtiSgxqQc1UEnOf+uAJUge
   fjKNw+IJ9U66Sw7Ht+wS4kTJCpW7gZNeZT6CNr75YfWopjz0ZBWg390UT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="336575526"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="336575526"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 15:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="675027432"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="675027432"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Mar 2023 15:08:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pekA3-000CTE-2N;
	Tue, 21 Mar 2023 22:08:55 +0000
Date: Wed, 22 Mar 2023 06:08:48 +0800
From: kernel test robot <lkp@intel.com>
To: alikernel-developer@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alibaba-cloud:linux-next 8751/9999] fs/io_uring.c:6870:21: error:
 implicit declaration of function 'task_get_css'
Message-ID: <202303220646.ULcZyvfC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alibaba/cloud-kernel.git linux-next
head:   d121e0c25d1a19485d7f293b67901462bb1a6552
commit: 40af84221636ec53d288b4c5ad7033fb7bc6c749 [8751/9999] alinux: io_uring: allow sqthread to inherit cpuacct from its creator
config: sparc-defconfig (https://download.01.org/0day-ci/archive/20230322/202303220646.ULcZyvfC-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/alibaba/cloud-kernel/commit/40af84221636ec53d288b4c5ad7033fb7bc6c749
        git remote add alibaba-cloud https://github.com/alibaba/cloud-kernel.git
        git fetch --no-tags alibaba-cloud linux-next
        git checkout 40af84221636ec53d288b4c5ad7033fb7bc6c749
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220646.ULcZyvfC-lkp@intel.com/

Note: the alibaba-cloud/linux-next HEAD d121e0c25d1a19485d7f293b67901462bb1a6552 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/dma-mapping.h:14,
                    from include/linux/skbuff.h:34,
                    from include/linux/if_ether.h:23,
                    from include/uapi/linux/ethtool.h:19,
                    from include/linux/ethtool.h:18,
                    from include/linux/netdevice.h:41,
                    from include/net/sock.h:51,
                    from fs/io_uring.c:65:
   include/linux/swiotlb.h:124:1: error: expected identifier or '(' before '{' token
     124 | {
         | ^
   fs/io_uring.c: In function 'io_sq_attach_cpu_cgroup':
>> fs/io_uring.c:6870:21: error: implicit declaration of function 'task_get_css' [-Werror=implicit-function-declaration]
    6870 |         css_owner = task_get_css(current, cpuacct_cgrp_id);
         |                     ^~~~~~~~~~~~
>> fs/io_uring.c:6870:43: error: 'cpuacct_cgrp_id' undeclared (first use in this function)
    6870 |         css_owner = task_get_css(current, cpuacct_cgrp_id);
         |                                           ^~~~~~~~~~~~~~~
   fs/io_uring.c:6870:43: note: each undeclared identifier is reported only once for each function it appears in
>> fs/io_uring.c:6873:22: error: invalid use of undefined type 'struct cgroup_subsys_state'
    6873 |         if (css_owner->cgroup == css_sq->cgroup)
         |                      ^~
   fs/io_uring.c:6873:40: error: invalid use of undefined type 'struct cgroup_subsys_state'
    6873 |         if (css_owner->cgroup == css_sq->cgroup)
         |                                        ^~
>> fs/io_uring.c:6883:15: error: implicit declaration of function 'cgroup_path'; did you mean 'cgroup_psi'? [-Werror=implicit-function-declaration]
    6883 |         ret = cgroup_path(css_owner->cgroup, buf + size, 4096 - size);
         |               ^~~~~~~~~~~
         |               cgroup_psi
   fs/io_uring.c:6883:36: error: invalid use of undefined type 'struct cgroup_subsys_state'
    6883 |         ret = cgroup_path(css_owner->cgroup, buf + size, 4096 - size);
         |                                    ^~
   include/linux/swiotlb.h: At top level:
   include/linux/swiotlb.h:123:22: warning: 'swiotlb_max_mapping_size' declared 'static' but never defined [-Wunused-function]
     123 | static inline size_t swiotlb_max_mapping_size(struct device *dev);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/task_get_css +6870 fs/io_uring.c

  6848	
  6849	static int io_sq_attach_cpu_cgroup(int cpu)
  6850	{
  6851		struct cgroup_subsys_state *css_owner, *css_sq;
  6852		char *buf = NULL;
  6853		int ret = 0, len, size = 0;
  6854		struct cgrp_migr_info info;
  6855		struct sq_thread_percpu *t = per_cpu_ptr(percpu_threads, cpu);
  6856	
  6857		mutex_lock(&t->lock);
  6858		if (!t->sqo_thread) {
  6859			mutex_unlock(&t->lock);
  6860			return 0;
  6861		}
  6862	
  6863		/*
  6864		 * if they are in the same cgroup, just return.
  6865		 * two cases lead to the same cgroup situation:
  6866		 * - we've done the cgroup move before
  6867		 * - the cgroup of current task is in root cgroup
  6868		 *   (as sqthread is in root cgroup)
  6869		 */
> 6870		css_owner = task_get_css(current, cpuacct_cgrp_id);
  6871		css_sq = task_get_css(t->sqo_thread, cpuacct_cgrp_id);
  6872		mutex_unlock(&t->lock);
> 6873		if (css_owner->cgroup == css_sq->cgroup)
  6874			goto out;
  6875	
  6876		buf = kzalloc(4096, GFP_KERNEL);
  6877		if (!buf) {
  6878			ret = -ENOMEM;
  6879			goto out;
  6880		}
  6881	
  6882		size = snprintf(buf, 4096, "/sys/fs/cgroup/cpuacct");
> 6883		ret = cgroup_path(css_owner->cgroup, buf + size, 4096 - size);
  6884		if (ret < 0)
  6885			goto out;
  6886		else if (ret >= (4096 - size)) {
  6887			ret = -ENAMETOOLONG;
  6888			goto out;
  6889		}
  6890		size += ret;
  6891	
  6892		len = strlen("/tasks") + 1;
  6893		if (len > (4096 - size)) {
  6894			ret = -ENAMETOOLONG;
  6895			goto out;
  6896		}
  6897		snprintf(buf + size, len, "/tasks");
  6898	
  6899		info.cpu = cpu;
  6900		info.path = buf;
  6901		INIT_WORK(&info.work, io_sq_cgrp_migr_work);
  6902	
  6903		schedule_work(&info.work);
  6904		flush_work(&info.work);
  6905	
  6906	out:
  6907		css_put(css_owner);
  6908		css_put(css_sq);
  6909		if (ret < 0 && buf)
  6910			kfree(buf);
  6911		return ret;
  6912	}
  6913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
