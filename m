Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165D57E1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678480832; x=1710016832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BBFXx4cjoW6GnOcNTX2FffvDAh6OXqrNSwD+CRLvOGk=;
  b=KCv7X35EOfrX0KGK3kALcdumzwI1xXKmfG+r6YaiDrR5KcRjhwyq/z8C
   n/pYp0X8wxPC2ypPZfqaPksqUj/FVqDMc+x1hML+kr/hshHcx810zbPPa
   paeseKG2aXzTb2SPZP3dLAfv9Y6Zr9q4q3ijDf+Ycw+cLo6tc3WNevTEY
   MbGzcLIyXW3r6LGdFiWkrGxLPQIADVczRXh4V/4IodngywcurrDUqVYUc
   5qv4jL18FaWNQ6Qpq+nSHDZ7Nb24t2+hYSiQvgF4jXvw17lD7GU7DOH7W
   GLfx/JZti/WlnaeVagtqrQg04goJH10thZo3ncLez46YavcTTzBiaIAEb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="325180056"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="325180056"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 12:40:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="852048418"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="852048418"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Mar 2023 12:40:28 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pajXP-000457-2L;
	Fri, 10 Mar 2023 20:40:27 +0000
Date: Sat, 11 Mar 2023 04:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_3 5/11] kernel/trace/bpf_trace.c:2913:25:
 warning: variable 'size' set but not used
Message-ID: <202303110431.Cdr8Bsa7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi_3
head:   e4e32b8d0e93fb058e99e0bb197f155b3b71cf26
commit: d7c8fc41fafecf762d8e6fd76a8363d24051f8af [5/11] bpf: Add multi uprobe link
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230311/202303110431.Cdr8Bsa7-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=d7c8fc41fafecf762d8e6fd76a8363d24051f8af
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_3
        git checkout d7c8fc41fafecf762d8e6fd76a8363d24051f8af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110431.Cdr8Bsa7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/bpf_trace.c: In function 'bpf_uprobe_multi_link_attach':
>> kernel/trace/bpf_trace.c:2913:25: warning: variable 'size' set but not used [-Wunused-but-set-variable]
    2913 |         u32 flags, cnt, size, i;
         |                         ^~~~


vim +/size +2913 kernel/trace/bpf_trace.c

  2909	
  2910	int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
  2911	{
  2912		void __user **upaths, __user *uoffsets, __user *upath, __user *old_upath = NULL;
> 2913		u32 flags, cnt, size, i;
  2914		char **paths, *path;
  2915		int err;
  2916	
  2917		/* no support for 32bit archs yet */
  2918		if (sizeof(u64) != sizeof(void *))
  2919			return -EOPNOTSUPP;
  2920	
  2921		if (prog->expected_attach_type != BPF_TRACE_UPROBE_MULTI)
  2922			return -EINVAL;
  2923	
  2924		flags = attr->link_create.uprobe_multi.flags;
  2925		if (flags & ~BPF_F_UPROBE_MULTI_RETURN)
  2926			return -EINVAL;
  2927	
  2928		upaths = u64_to_user_ptr(attr->link_create.uprobe_multi.paths);
  2929		uoffsets = u64_to_user_ptr(attr->link_create.uprobe_multi.offsets);
  2930		if (!!upaths != !!uoffsets)
  2931			return -EINVAL;
  2932	
  2933		cnt = attr->link_create.uprobe_multi.cnt;
  2934		if (!cnt)
  2935			return -EINVAL;
  2936	
  2937		size = cnt * sizeof(*paths);
  2938		paths = kvmalloc_array(cnt, sizeof(*paths), GFP_KERNEL);
  2939		if (!paths)
  2940			return -ENOMEM;
  2941	
  2942		for (i = 0; i < cnt; i++) {
  2943			if (__get_user(upath, upaths + i)) {
  2944				err = -EFAULT;
  2945				goto error;
  2946			}
  2947			if (i && old_upath == upath) {
  2948				paths[i] = paths[i - 1];
  2949				continue;
  2950			}
  2951			path = strndup_user(upath, PATH_MAX);
  2952			if (IS_ERR(path)) {
  2953				err = PTR_ERR(path);
  2954				goto error;
  2955			}
  2956			paths[i] = path;
  2957		}
  2958	
  2959		for (i = 0; i < cnt; i++) {
  2960			trace_printk("path %s\n", paths[i]);
  2961		}
  2962	
  2963	error:
  2964		kfree(paths);
  2965		return err;
  2966	}
  2967	#else /* !CONFIG_UPROBES */
  2968	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
