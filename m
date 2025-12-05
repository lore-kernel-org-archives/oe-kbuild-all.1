Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FD62D29D6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 17:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764956167; cv=none; b=Vmnxc5jdcj/jou15AttAIv7P0Qxe/WLoZMTemy6WQAOJQds3Ecxs5zLnXshkc8oGjUxxG8y+knX9JtpHq//fTDCjM6U1GtOOsq6GzFzrzV8JVMiqXEqsNXySzFsrtBPXwvMlbK/yLduwgwohjgwgNV0OIB1b71dPmFV6olXl5G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764956167; c=relaxed/simple;
	bh=wHwt1QzklyhxwJr4WGATM8/MeIR7ql5mtknWsgn0Peg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KNdn6+KAhQDAgU0Y1h2ioW0p18XcS50NpK4/87Pom3BQBd5eAyXpV0nbiuFhGTmCo3x5s5co+SlLnlqr/a8vj3VZ7ntvCL1mSgtgpQun3xrw69jyE7NJxQlh6N/lsXpfa3yUnAHAVmqQe5CYkhP9IfU0Nax1YpOgGnNsEpIQni8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHdd+CAR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHdd+CAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764956165; x=1796492165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wHwt1QzklyhxwJr4WGATM8/MeIR7ql5mtknWsgn0Peg=;
  b=XHdd+CAR8v+wRZvlMQjFCLWq+eaJBYv5AapX8FZjMhIWU5+goFfDXo1b
   Q5SiXX3OKtNyJjeu4Hv6Fvt4/FjPZqJMzhgNkhzLpSUP9KDUhuPvs9jG7
   yw+NDQjGqGCFHfso8CWJCQ1ifottTvhmPQcgY1SalZdh5RfKLzxtwddhn
   IpBhJqcqSDhownW74y2rmXGkcRSjlDsuFMc8mMetIAziEbIibzjuZL2lM
   raWZSi3yVIvkaysq57tdZFmF+IFs5aorrSszwQopiOsQ9NmpK7dMTc6HH
   3y/A4mL94tv2vNr0OlFGyM92Yecv9Mv/Y9rw57qOHk1pBupqLHHxsNI28
   g==;
X-CSE-ConnectionGUID: XAR/evbkQJycv1gAi4O3/Q==
X-CSE-MsgGUID: ZWL+/QEGS5eCtFMhsVys9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="69588013"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="69588013"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 09:36:05 -0800
X-CSE-ConnectionGUID: kW0T6lauSqiT3E/VQDBpAQ==
X-CSE-MsgGUID: DRPDVuYmT8Wuj5g2WuE9Qw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Dec 2025 09:36:04 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRZir-00000000FIh-3okU;
	Fri, 05 Dec 2025 17:36:01 +0000
Date: Sat, 6 Dec 2025 01:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.2 5/31] include/linux/bpf.h:1938:34: error:
 field has incomplete type 'enum bpf_cgroup_struct_ops_type'
Message-ID: <202512060156.OgvRxMsI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.3.2
head:   84259bf628dec5381b7deb4cd8932b28fd6b7ea3
commit: 329bfa7db2033020125db1424d8c72751604a5c2 [5/31] bpf: Allow attaching struct_ops to cgroups
config: i386-buildonly-randconfig-002-20251205 (https://download.01.org/0day-ci/archive/20251206/202512060156.OgvRxMsI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060156.OgvRxMsI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060156.OgvRxMsI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
>> include/linux/bpf.h:1938:34: error: field has incomplete type 'enum bpf_cgroup_struct_ops_type'
    1938 |         enum bpf_cgroup_struct_ops_type cgroup_attach_type;
         |                                         ^
   include/linux/bpf.h:1938:7: note: forward declaration of 'enum bpf_cgroup_struct_ops_type'
    1938 |         enum bpf_cgroup_struct_ops_type cgroup_attach_type;
         |              ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1 shuffle=4191228516
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=4191228516
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=4191228516
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=4191228516
   make: Target 'prepare' not remade because of errors.


vim +1938 include/linux/bpf.h

  1873	
  1874	#define BPF_STRUCT_OPS_MAX_NR_MEMBERS 64
  1875	/**
  1876	 * struct bpf_struct_ops - A structure of callbacks allowing a subsystem to
  1877	 *			   define a BPF_MAP_TYPE_STRUCT_OPS map type composed
  1878	 *			   of BPF_PROG_TYPE_STRUCT_OPS progs.
  1879	 * @verifier_ops: A structure of callbacks that are invoked by the verifier
  1880	 *		  when determining whether the struct_ops progs in the
  1881	 *		  struct_ops map are valid.
  1882	 * @init: A callback that is invoked a single time, and before any other
  1883	 *	  callback, to initialize the structure. A nonzero return value means
  1884	 *	  the subsystem could not be initialized.
  1885	 * @check_member: When defined, a callback invoked by the verifier to allow
  1886	 *		  the subsystem to determine if an entry in the struct_ops map
  1887	 *		  is valid. A nonzero return value means that the map is
  1888	 *		  invalid and should be rejected by the verifier.
  1889	 * @init_member: A callback that is invoked for each member of the struct_ops
  1890	 *		 map to allow the subsystem to initialize the member. A nonzero
  1891	 *		 value means the member could not be initialized. This callback
  1892	 *		 is exclusive with the @type, @type_id, @value_type, and
  1893	 *		 @value_id fields.
  1894	 * @reg: A callback that is invoked when the struct_ops map has been
  1895	 *	 initialized and is being attached to. Zero means the struct_ops map
  1896	 *	 has been successfully registered and is live. A nonzero return value
  1897	 *	 means the struct_ops map could not be registered.
  1898	 * @unreg: A callback that is invoked when the struct_ops map should be
  1899	 *	   unregistered.
  1900	 * @update: A callback that is invoked when the live struct_ops map is being
  1901	 *	    updated to contain new values. This callback is only invoked when
  1902	 *	    the struct_ops map is loaded with BPF_F_LINK. If not defined, the
  1903	 *	    it is assumed that the struct_ops map cannot be updated.
  1904	 * @validate: A callback that is invoked after all of the members have been
  1905	 *	      initialized. This callback should perform static checks on the
  1906	 *	      map, meaning that it should either fail or succeed
  1907	 *	      deterministically. A struct_ops map that has been validated may
  1908	 *	      not necessarily succeed in being registered if the call to @reg
  1909	 *	      fails. For example, a valid struct_ops map may be loaded, but
  1910	 *	      then fail to be registered due to there being another active
  1911	 *	      struct_ops map on the system in the subsystem already. For this
  1912	 *	      reason, if this callback is not defined, the check is skipped as
  1913	 *	      the struct_ops map will have final verification performed in
  1914	 *	      @reg.
  1915	 * @type: BTF type.
  1916	 * @value_type: Value type.
  1917	 * @name: The name of the struct bpf_struct_ops object.
  1918	 * @func_models: Func models
  1919	 * @type_id: BTF type id.
  1920	 * @value_id: BTF value id.
  1921	 */
  1922	struct bpf_struct_ops {
  1923		const struct bpf_verifier_ops *verifier_ops;
  1924		int (*init)(struct btf *btf);
  1925		int (*check_member)(const struct btf_type *t,
  1926				    const struct btf_member *member,
  1927				    const struct bpf_prog *prog);
  1928		int (*init_member)(const struct btf_type *t,
  1929				   const struct btf_member *member,
  1930				   void *kdata, const void *udata);
  1931		int (*reg)(void *kdata, struct bpf_link *link);
  1932		void (*unreg)(void *kdata, struct bpf_link *link);
  1933		int (*update)(void *kdata, void *old_kdata, struct bpf_link *link);
  1934		int (*validate)(void *kdata);
  1935		void *cfi_stubs;
  1936		struct module *owner;
  1937		const char *name;
> 1938		enum bpf_cgroup_struct_ops_type cgroup_attach_type;
  1939		struct btf_func_model func_models[BPF_STRUCT_OPS_MAX_NR_MEMBERS];
  1940	};
  1941	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
