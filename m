Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975972FAE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 16:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676221189; x=1707757189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ck7G91t0brpA6ea1pEZ4W1do4v2u7B6suAMwewl1iDE=;
  b=lERrGM8bfDRD1mCy3OXM+aal4FAVqba7OsjEo9lE+XkfcfTuAGnSBxfa
   QAP4d2LDmwUfnyRJQaMWwHVlJPP1rpHgFyJxBQsJh+6EJz9Sqxu2A7c/b
   WhLEX2LM3/FXErhQsvxL54DDYOLh0qgH17rJaNWBfWTiMJIIdPlWJ/7V5
   BmVOgMPsdrKs+kLmpUD4Swg7rL86CJWL+sZrlEC1/w3l9V2MVAaABW9YB
   o9CBdVOwTHSdmP2rPSIT5M7RLj0y0688UO9DGbyaahfS0t/MF1f2kH47V
   vUzS5QKfUlEZAxahfL5dvo8LcuDDMzpL0TYBQN+w/M+MH9bBMR4Dbf4yJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="314374429"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="314374429"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 08:59:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="698943486"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="698943486"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Feb 2023 08:59:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRFhb-0007JB-1W;
	Sun, 12 Feb 2023 16:59:47 +0000
Date: Mon, 13 Feb 2023 00:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] ring-buffer: Introducing ring-buffer mapping
 functions
Message-ID: <202302130039.AbtnfYQZ-lkp@intel.com>
References: <20230212153250.1099136-2-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212153250.1099136-2-vdonnefort@google.com>

Hi Vincent,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc7 next-20230210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/ring-buffer-Introducing-ring-buffer-mapping-functions/20230212-233420
patch link:    https://lore.kernel.org/r/20230212153250.1099136-2-vdonnefort%40google.com
patch subject: [RFC PATCH 1/2] ring-buffer: Introducing ring-buffer mapping functions
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230213/202302130039.AbtnfYQZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/96cfb7d92682fb5df39febc590fec75748b47e15
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vincent-Donnefort/ring-buffer-Introducing-ring-buffer-mapping-functions/20230212-233420
        git checkout 96cfb7d92682fb5df39febc590fec75748b47e15
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130039.AbtnfYQZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ring_buffer.c:6017:6: warning: no previous prototype for 'rb_put_mapped_buffer' [-Wmissing-prototypes]
    6017 | void rb_put_mapped_buffer(struct ring_buffer_per_cpu *cpu_buffer)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/rb_put_mapped_buffer +6017 kernel/trace/ring_buffer.c

  6016	
> 6017	void rb_put_mapped_buffer(struct ring_buffer_per_cpu *cpu_buffer)
  6018	{
  6019		up_read(&cpu_buffer->mapping_lock);
  6020	}
  6021	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
