Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C91917C2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 06:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682057767; x=1713593767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xSCjpAaDimE1SGPR/eOjzw4aBFApL0a95zt3Gkzxu+c=;
  b=juaOxoNWDjLCgBSrOGS1A+mEss3TsXPn1MJrOmptAKpjO7Ht+T6XU2PB
   2eVxq/yMlIzBhNMLXSK+p+/pLx6T22tXxdgQrpH40hT8qR3YzCFiDMADH
   uHTyn4DPiSmWOYlrZ6JPRp5z8+fwEAfOY3Vqnm79pxsf+QoxoSpFg9dLi
   fZ4IvTwczQPFauqBi82XSBn1bsshYeJPAsOXqeydFhCY/s0ccmVB354Sm
   VJ0ung6f8xQt5YjNYHykr7jZbAgl8q++ZOqC/CPidgqdnQGIDUBV72abp
   cLB3i8MfB/6g9yGueNMLwP2kkFltri5KupjBc0Z8PHgHcrJVWm0LEsNAh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="344680011"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="344680011"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 23:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="669619661"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="669619661"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Apr 2023 23:16:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppk3w-000gNY-38;
	Fri, 21 Apr 2023 06:16:04 +0000
Date: Fri, 21 Apr 2023 14:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: Scott Mayhew <smayhew@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/5] SUNRPC: store GSS creds in keyrings
Message-ID: <202304211345.dP8dG5I5-lkp@intel.com>
References: <20230420202004.239116-6-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420202004.239116-6-smayhew@redhat.com>

Hi Scott,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.3-rc7 next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Scott-Mayhew/keys-export-keyring_ptr_to_key/20230421-042202
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20230420202004.239116-6-smayhew%40redhat.com
patch subject: [RFC PATCH 5/5] SUNRPC: store GSS creds in keyrings
config: i386-randconfig-s001-20230417 (https://download.01.org/0day-ci/archive/20230421/202304211345.dP8dG5I5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/6a654188690846a7c5e1de83e390a2bce53d79a8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Scott-Mayhew/keys-export-keyring_ptr_to_key/20230421-042202
        git checkout 6a654188690846a7c5e1de83e390a2bce53d79a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash net/sunrpc/auth_gss/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211345.dP8dG5I5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sunrpc/auth_gss/auth_gss.c:1675:6: sparse: sparse: symbol 'gss_key_revoke' was not declared. Should it be static?
>> net/sunrpc/auth_gss/auth_gss.c:1691:6: sparse: sparse: symbol 'gss_describe' was not declared. Should it be static?
>> net/sunrpc/auth_gss/auth_gss.c:1704:5: sparse: sparse: symbol 'gss_key_instantiate' was not declared. Should it be static?
   net/sunrpc/auth_gss/auth_gss.c: note: in included file (through include/linux/cred.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
>> include/linux/key.h:421:45: sparse: sparse: marked inline, but without a definition
--
   net/sunrpc/auth_gss/trace.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/rpcgss.h):
>> include/trace/events/rpcgss.h:629:1: sparse: sparse: Using plain integer as NULL pointer
   net/sunrpc/auth_gss/trace.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, include/trace/events/rpcgss.h):
>> include/trace/events/rpcgss.h:629:1: sparse: sparse: Using plain integer as NULL pointer

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
