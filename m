Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF5D2030A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742913959; cv=none; b=bu2m3O4Y8mgXLNUCzfFGngcdh7e/EywWS8MWsXNaFOHdhhB841iLwMm2OpZvSRWdrVULr2GkqP2+02qK9FYhCNDUodibdKAkZHsfgCeCQOAZJJ7kmRtqA8H504PpFV/3gS2ZH+91hE4ZMKwfHWHIetyP+84xdgADO/HKUB4meIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742913959; c=relaxed/simple;
	bh=PvqNCBny/Kzjy104UIuft2JNIuckY5hwNOd6IS1Gx+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n0yRcf8sXsZfOJibFOw6hLkx7OJ88vX6hfUM2AMvJlrbSFStEFqXV0miZy5GvYe5nHLdhRuue08uyIkRu4vtDaSNORog8wtG/ykjIi/hNzySpGw8j01CJb6/uG5SEh2ZhW+mtkovqNsQLhWa/4LYtTR2M1ANZSHLhobFPQRqXGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBmP69Q1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBmP69Q1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742913957; x=1774449957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PvqNCBny/Kzjy104UIuft2JNIuckY5hwNOd6IS1Gx+Q=;
  b=UBmP69Q1EVrwSsQpV988lOpvWmsbFTbS45F6+lzapqYRetIUh1LMCLiy
   fAVNnoZpmh0QXEi78FC8+fakyoj94bEGSIqZJdoKbozdG5aRYaY4j8DWC
   FGhvu29bkWtdlrxyTWcA2XEnFIoDnq7w+DwSGO2qV9Dy5bw7ZrnMsHizb
   2BPIQlOAVfh3KtJCrJ7f/sAqK8d8jcv2fV9LXvnc1EFawwIpjDkq64DCr
   3vb14MHohU4dE9Zp8dn2HspN5N/XIKUUSBjo5O4/3meu1lG6qxnMoWCgN
   wynAvaI5QgtljtCKi8OW76oR8gzh2ECrGTfnMW0w+L6B32DvK0Am+NVHk
   g==;
X-CSE-ConnectionGUID: nDbbisO3RzKyWwsmHcK8tQ==
X-CSE-MsgGUID: +BvVbfLfSKmO1vyJPexeWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43891013"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="43891013"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 07:45:57 -0700
X-CSE-ConnectionGUID: xtRpsVO5RkqMtDPf+I5iJQ==
X-CSE-MsgGUID: jhklE6fyQoSQspH35QBltg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="124351654"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Mar 2025 07:45:56 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx5XJ-0004ws-2u;
	Tue, 25 Mar 2025 14:45:51 +0000
Date: Tue, 25 Mar 2025 22:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1514/1514]
 include/linux/bpf-cgroup.h:274:41: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202503252213.JKA9UxCh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a0f7a942ef42e73c8748687d469ed61f380bf0cf
commit: f42ee093be2980f2689ea7a170d580364820f48b [1514/1514] bpf/test_run: support cgroup local storage
config: x86_64-randconfig-122-20250325 (https://download.01.org/0day-ci/archive/20250325/202503252213.JKA9UxCh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503252213.JKA9UxCh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503252213.JKA9UxCh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/bpf/test_run.c: note: in included file (through include/linux/cgroup-defs.h, include/linux/cgroup.h, include/net/netprio_cgroup.h, ...):
>> include/linux/bpf-cgroup.h:274:41: sparse: sparse: Using plain integer as NULL pointer

vim +274 include/linux/bpf-cgroup.h

fdb5c4531c1e0e Sean Young     2018-06-19  267  
aa0ad5b0391e26 Roman Gushchin 2018-08-02  268  static inline void bpf_cgroup_storage_set(struct bpf_cgroup_storage *storage) {}
de9cbbaadba5ad Roman Gushchin 2018-08-02  269  static inline int bpf_cgroup_storage_assign(struct bpf_prog *prog,
de9cbbaadba5ad Roman Gushchin 2018-08-02  270  					    struct bpf_map *map) { return 0; }
de9cbbaadba5ad Roman Gushchin 2018-08-02  271  static inline void bpf_cgroup_storage_release(struct bpf_prog *prog,
de9cbbaadba5ad Roman Gushchin 2018-08-02  272  					      struct bpf_map *map) {}
de9cbbaadba5ad Roman Gushchin 2018-08-02  273  static inline struct bpf_cgroup_storage *bpf_cgroup_storage_alloc(
de9cbbaadba5ad Roman Gushchin 2018-08-02 @274  	struct bpf_prog *prog) { return 0; }
de9cbbaadba5ad Roman Gushchin 2018-08-02  275  static inline void bpf_cgroup_storage_free(
de9cbbaadba5ad Roman Gushchin 2018-08-02  276  	struct bpf_cgroup_storage *storage) {}
de9cbbaadba5ad Roman Gushchin 2018-08-02  277  

:::::: The code at line 274 was first introduced by commit
:::::: de9cbbaadba5adf88a19e46df61f7054000838f6 bpf: introduce cgroup storage maps

:::::: TO: Roman Gushchin <guro@fb.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
