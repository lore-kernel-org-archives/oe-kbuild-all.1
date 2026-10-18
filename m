Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682D32E719B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 21:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792359938; cv=none; b=h1vLLg8wFwMgWi7aErhD7+dPv9h4m/rGUa7+4nihiuFgZ9bUXkAFU1bmuMxtxR7KgwjqLgFcdXnV5v6WazBpZflPdcK8thunmQ4ri8RgUytqGfUoFwfRgUyOwFmjwv/CdsQgC7nuo0YE0xDo1hUs75FBooKio756qodLT335Zzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792359938; c=relaxed/simple;
	bh=/VgoG+WSXG0PQSSuXP0upnRpqgzsQLNsA9YNiPd8SYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PJP3jbZnkv1AlpMU312CSF8OBpSjh2WTjZ3qwJaKM0tZcBGt88Fj44D5ihkCp0kZueeXEhE/IA3cx9UWT2rAVMbShx5J6a3o+2a5RtEs7tvhnYXs4LQMNO87ldng7VV0XMortcaQzv0SMEW/t5ogUemjAYxsFVH0ibGGGrruVEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBZBdVup; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBZBdVup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792359936; x=1823895936;
  h=date:from:to:cc:subject:message-id;
  bh=/VgoG+WSXG0PQSSuXP0upnRpqgzsQLNsA9YNiPd8SYA=;
  b=ZBZBdVupwiPCLPu/LqgL/sXm4phmP32fkolad3CQaqLOfCT+eaZohogF
   N/HE1B0te7+w38qfT2UbxKNqbxab2eryztxrsAO1n61qvbogEYeqt0zRd
   eK1TolyNgDDwJ3y3xm09ffsH6mlzGYSOhapd7URrIAlWqeHVaCrSJFBqv
   UYDBiErm5944czvJRZMkqpFMgwdE6ya2mXbAfqhrnFXjISBiyUrGq6mS4
   k/6kB73UFiUBtf86FZBK2xxuuSlmUFXgUdVCBe6yE8f6MReOXvNjbzKge
   7gZtsEgK2n5kHjy3JxjkaUdrI03VypiUcHEA7vcFYxSaVCiMx+3dMih9U
   A==;
X-CSE-ConnectionGUID: E6Ly8lfsTTqUgq0gkTYRNA==
X-CSE-MsgGUID: 4QP4N9wVQhC3T48gWjjr9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1048130"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1048130"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 14:45:36 -0700
X-CSE-ConnectionGUID: zyVqJeipQjavV8q2I4TSOQ==
X-CSE-MsgGUID: cpEgrK/PSDS3lCwZ+nHkpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2256819"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 18 Oct 2026 14:45:34 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIYh9-000000005I7-3ecw;
	Sun, 18 Oct 2026 21:45:31 +0000
Date: Sun, 18 Oct 2026 23:45:02 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-09 2/2]
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:70: warning: Function
 parameter or struct member 'lock' not described in 'idpf_vc_xn'
Message-ID: <202610182322.WlNQQa8z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Emil,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-09
head:   9257cac5f5440a3f5492477d5ac82dd722703da9
commit: b448529f2f2921c6fe82fd4e985cc7c05cbf02a3 [2/2] idpf: fix PREEMPT_RT raw/bh spinlock nesting for async VC handling
config: i386-randconfig-2301-20261018 (https://download.01.org/0day-ci/archive/20261018/202610182322.WlNQQa8z-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610182322.WlNQQa8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610182322.WlNQQa8z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:70: warning: Function parameter or struct member 'lock' not described in 'idpf_vc_xn'


vim +70 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c

34c21fa894a1af Alan Brady    2024-02-22  36  
34c21fa894a1af Alan Brady    2024-02-22  37  struct idpf_vc_xn;
34c21fa894a1af Alan Brady    2024-02-22  38  /* Callback for asynchronous messages */
34c21fa894a1af Alan Brady    2024-02-22  39  typedef int (*async_vc_cb) (struct idpf_adapter *, struct idpf_vc_xn *,
34c21fa894a1af Alan Brady    2024-02-22  40  			    const struct idpf_ctlq_msg *);
34c21fa894a1af Alan Brady    2024-02-22  41  
34c21fa894a1af Alan Brady    2024-02-22  42  /**
34c21fa894a1af Alan Brady    2024-02-22  43   * struct idpf_vc_xn - Data structure representing virtchnl transactions
34c21fa894a1af Alan Brady    2024-02-22  44   * @completed: virtchnl event loop uses that to signal when a reply is
34c21fa894a1af Alan Brady    2024-02-22  45   *	       available, uses kernel completion API
34c21fa894a1af Alan Brady    2024-02-22  46   * @state: virtchnl event loop stores the data below, protected by the
34c21fa894a1af Alan Brady    2024-02-22  47   *	   completion's lock.
34c21fa894a1af Alan Brady    2024-02-22  48   * @reply_sz: Original size of reply, may be > reply_buf.iov_len; it will be
34c21fa894a1af Alan Brady    2024-02-22  49   *	      truncated on its way to the receiver thread according to
34c21fa894a1af Alan Brady    2024-02-22  50   *	      reply_buf.iov_len.
34c21fa894a1af Alan Brady    2024-02-22  51   * @reply: Reference to the buffer(s) where the reply data should be written
34c21fa894a1af Alan Brady    2024-02-22  52   *	   to. May be 0-length (then NULL address permitted) if the reply data
34c21fa894a1af Alan Brady    2024-02-22  53   *	   should be ignored.
34c21fa894a1af Alan Brady    2024-02-22  54   * @async_handler: if sent asynchronously, a callback can be provided to handle
34c21fa894a1af Alan Brady    2024-02-22  55   *		   the reply when it's received
34c21fa894a1af Alan Brady    2024-02-22  56   * @vc_op: corresponding opcode sent with this transaction
34c21fa894a1af Alan Brady    2024-02-22  57   * @idx: index used as retrieval on reply receive, used for cookie
34c21fa894a1af Alan Brady    2024-02-22  58   * @salt: changed every message to make unique, used for cookie
34c21fa894a1af Alan Brady    2024-02-22  59   */
34c21fa894a1af Alan Brady    2024-02-22  60  struct idpf_vc_xn {
34c21fa894a1af Alan Brady    2024-02-22  61  	struct completion completed;
b448529f2f2921 Emil Tantilov 2026-04-13  62  	spinlock_t lock;
34c21fa894a1af Alan Brady    2024-02-22  63  	enum idpf_vc_xn_state state;
34c21fa894a1af Alan Brady    2024-02-22  64  	size_t reply_sz;
34c21fa894a1af Alan Brady    2024-02-22  65  	struct kvec reply;
34c21fa894a1af Alan Brady    2024-02-22  66  	async_vc_cb async_handler;
34c21fa894a1af Alan Brady    2024-02-22  67  	u32 vc_op;
34c21fa894a1af Alan Brady    2024-02-22  68  	u8 idx;
34c21fa894a1af Alan Brady    2024-02-22  69  	u8 salt;
34c21fa894a1af Alan Brady    2024-02-22 @70  };
34c21fa894a1af Alan Brady    2024-02-22  71  

:::::: The code at line 70 was first introduced by commit
:::::: 34c21fa894a1af6166f4284c81d1dc21efed8f38 idpf: implement virtchnl transaction manager

:::::: TO: Alan Brady <alan.brady@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
