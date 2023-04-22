Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5607F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682169169; x=1713705169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=siolPaBbzy3Sc50U7pDpe27/YvjBEvisAHA0WNyP5iw=;
  b=KAOskYz07uGkLOxTtg4RVLk2mScVGks0fmysNbOzn2k5a52wUrecq7Z0
   I9VyUoTxrnOms8B/Abpwf+k8hNzll7cKvOFvZFPGtMNx/2SCYPY33SXDE
   VSAOPfeW3zzLM194D8NbGUUBM0OlGHHye6jig/SEi+2KhAnZQGsunO+SH
   9urinOmL8D9xhcqIkLv8bRhNE1Ij0ktQWd1TqB9egzSUegY44oZYmGfHa
   O44qEXY59hC89aT7dziqqgKlTrEn7Di7ubFeRqS4pOjD0W29LgG+t3iVM
   buUQ+R5svZgjAP9NSnZGfdMdYQUd/N8ZmNH0i7Mc3C+SwnbSkY8gT/NXP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="330362807"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="330362807"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 06:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="836441170"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="836441170"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2023 06:12:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqD2i-000hJY-1T;
	Sat, 22 Apr 2023 13:12:44 +0000
Date: Sat, 22 Apr 2023 21:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>, paul@paul-moore.com,
	linux-security-module@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jmorris@namei.org, keescook@chromium.org,
	john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
	stephen.smalley.work@gmail.com, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, mic@digikod.net
Subject: Re: [PATCH v9 04/11] LSM: syscalls for current process attributes
Message-ID: <202304222142.YHgqLhGF-lkp@intel.com>
References: <20230421174259.2458-5-casey@schaufler-ca.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421174259.2458-5-casey@schaufler-ca.com>

Hi Casey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/perf/core]
[also build test WARNING on acme/perf/core shuah-kselftest/next shuah-kselftest/fixes linus/master v6.3-rc7]
[cannot apply to next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Casey-Schaufler/LSM-Maintain-a-table-of-LSM-attribute-data/20230422-024331
base:   tip/perf/core
patch link:    https://lore.kernel.org/r/20230421174259.2458-5-casey%40schaufler-ca.com
patch subject: [PATCH v9 04/11] LSM: syscalls for current process attributes
config: mips-randconfig-s051-20230421 (https://download.01.org/0day-ci/archive/20230422/202304222142.YHgqLhGF-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/78ea54cc31d7bd9e5a5c7fe8cf34fba9516fde95
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Casey-Schaufler/LSM-Maintain-a-table-of-LSM-attribute-data/20230422-024331
        git checkout 78ea54cc31d7bd9e5a5c7fe8cf34fba9516fde95
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304222142.YHgqLhGF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/lsm_syscalls.c:34:48: sparse: sparse: dereference of noderef expression
--
   security/security.c:406:25: sparse: sparse: cast removes address space '__rcu' of expression
>> security/security.c:2196:13: sparse: sparse: dereference of noderef expression
   security/security.c:2203:14: sparse: sparse: dereference of noderef expression
   security/security.c:2208:20: sparse: sparse: dereference of noderef expression
   security/security.c:2218:43: sparse: sparse: dereference of noderef expression
   security/security.c:2218:66: sparse: sparse: dereference of noderef expression
   security/security.c:2263:13: sparse: sparse: dereference of noderef expression
   security/security.c:2265:13: sparse: sparse: dereference of noderef expression
   security/security.c:2269:13: sparse: sparse: dereference of noderef expression
   security/security.c:2269:32: sparse: sparse: dereference of noderef expression
   security/security.c:2275:53: sparse: sparse: dereference of noderef expression
   security/security.c:2275:64: sparse: sparse: dereference of noderef expression
   security/security.c:2275:70: sparse: sparse: dereference of noderef expression

vim +34 security/lsm_syscalls.c

    19	
    20	/**
    21	 * sys_lsm_set_self_attr - Set current task's security module attribute
    22	 * @attr: which attribute to set
    23	 * @ctx: the LSM contexts
    24	 * @size: size of @ctx
    25	 * @flags: reserved for future use
    26	 *
    27	 * Sets the calling task's LSM context. On success this function
    28	 * returns 0. If the attribute specified cannot be set a negative
    29	 * value indicating the reason for the error is returned.
    30	 */
    31	SYSCALL_DEFINE4(lsm_set_self_attr, unsigned int, attr, struct lsm_ctx __user *,
    32			ctx, size_t __user, size, u32, flags)
    33	{
  > 34		return security_setselfattr(attr, ctx, size, flags);
    35	}
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
