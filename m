Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77D014EC5B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 04:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747715270; cv=none; b=Cb9IvaDd5kYulPl33gZX8rYuwPp7ZYKnuOousgTH0kYUTNYZ8/tub13gdvVe9h3duQWS2BPJbcIGnmWPDfzEYxSMgPVEZT5jTufDtdtKZY3f2htS/GTbYlWjFiAZi3dcS/vyIEn/p28VTMKST50DIBrbcavIoYLJN6kDfT5dj+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747715270; c=relaxed/simple;
	bh=9Hfo3+OFrQG8XzNKgekWroEBYuwq3HLBZQT/8xY+aXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yw6JMBR2Yfzl7PcCsJcFOFXo45gwOwRZVRU26aFyiodFEwfT44v+MocTSfQJFcCKQJ6efuwnrL9GTsQUmA0m1h5e94olxEKungdxIuIWyGDjAqe8O0Xtjq5iIhAv0R4C4sLP1RcYPv+27AdrYJaaNoghSII6sw+YWKT3RDW/4mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcL5QTtS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcL5QTtS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747715269; x=1779251269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Hfo3+OFrQG8XzNKgekWroEBYuwq3HLBZQT/8xY+aXk=;
  b=OcL5QTtShnIUjKuZZAZO4MV/pNDmhoYWzELcmwfxFqQ2JEywjZLddwFO
   vzNJXCo/OBFPD40WEmaqcGRtM6lZMCDEqNCIEpkI4IE+isEYtXIUoskhY
   e5MbkDP8yZoCS9c8gB+saYuKkv2sTPzpnADkmfYaGPWdMzw4JRRpcvocJ
   P46fc8sN2KLJGpC1pPuyhZz8QyD3Ulei5xoQ4KtLruf1Y3Cz/PltUILVN
   yPcz/esy3l4dqM/Z+7kofnyXgoPWnFWlqMqIbEGWjruW2EQWbBWT4LBzE
   O0QMPpm17bZPp9uOTbZOuoMa7nxNm6k8++mCKYBBq13Nydy2L3bLJMnCN
   w==;
X-CSE-ConnectionGUID: SWQlCjqRT52Ml5/DfXwO0A==
X-CSE-MsgGUID: VknftedrTziq+FfcKDdX/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60670212"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60670212"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 21:27:48 -0700
X-CSE-ConnectionGUID: cMMxNgzYQnqLd0nw8Po3/g==
X-CSE-MsgGUID: O1BeHbybRJGTrg1N7PK8bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140578101"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 May 2025 21:27:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHEZs-000M9c-2z;
	Tue, 20 May 2025 04:27:44 +0000
Date: Tue, 20 May 2025 12:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.2 10/15] include/linux/bpf_psi.h:36:10: error:
 dereferencing pointer to incomplete type 'struct psi_trigger'
Message-ID: <202505201223.AxncgHrZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.2
head:   1078570cd7bf92cc1b6d67e990786cfb9a717785
commit: 343586cf71930a20ccde8c802a02ecdcc5c78a5b [10/15] sched: psi: bpf hook to handle psi events
config: arm-randconfig-004-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201223.AxncgHrZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201223.AxncgHrZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201223.AxncgHrZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:22:0:
   include/linux/bpf_psi.h:19:34: warning: 'struct psi_trigger' declared inside parameter list will not be visible outside of this definition or declaration
     void (*handle_psi_event)(struct psi_trigger *t);
                                     ^~~~~~~~~~~
   include/linux/bpf_psi.h: In function 'bpf_psi_trigger':
>> include/linux/bpf_psi.h:36:10: error: dereferencing pointer to incomplete type 'struct psi_trigger'
     return t->bpf_psi;
             ^~
   kernel/sched/build_utility.c: At top level:
   cc1: warning: unrecognized command line option '-Wno-unterminated-string-initialization'


vim +36 include/linux/bpf_psi.h

    12	
    13	struct bpf_psi_ops {
    14		u64 cgroup_id;
    15		u32 psi_state;
    16		u32 threshold_us;
    17		u32 window_us;
    18	
  > 19		void (*handle_psi_event)(struct psi_trigger *t);
    20	
    21		/* private */
    22		struct bpf_psi *bpf_psi;
    23	};
    24	
    25	struct bpf_psi {
    26		struct mutex lock;
    27		struct bpf_psi_ops *ops;
    28		struct psi_trigger *trigger;
    29		struct srcu_struct srcu;
    30		u64 cgroup_id;
    31	};
    32	
    33	#ifdef CONFIG_BPF_SYSCALL
    34	static inline bool bpf_psi_trigger(struct psi_trigger *t)
    35	{
  > 36		return t->bpf_psi;
    37	}
    38	void bpf_psi_trigger_add(struct psi_trigger *t, struct bpf_psi *bpf_psi);
    39	void bpf_psi_cgroup_free(struct psi_group *group);
    40	void bpf_psi_event_handle(struct psi_trigger *t);
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
