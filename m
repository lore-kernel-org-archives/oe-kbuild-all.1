Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DA520B808
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733994696; cv=none; b=KTJBjtr4nMQwzKEpHmFRreLcGrvILtuymjUd4sIbYC/Wxvst1dLkaiXRliGJyQob4kZPBeUupVfZgQpXVIJWPSZccwAuuAw8cysYZdhXXPgIHGcl4Cas/A52hWc0eh32vbDhlsgCyMF8ZbPtgvqGliK2Q2QgcTCRommQg5JgcFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733994696; c=relaxed/simple;
	bh=2VfPTQiNBnw9pmeFwnQyQ5paMiQyCnXyJ9Jq2bLXCdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sERZJAUl5UEuy07CpW20ALqRkcQBRIxVqm9H7WC1rmBFoCcHouuqrDsuU/+C/I6+16fnROKPp5unEd1jK+7Z49epWBDr+DQFuXPEzGSBtEgQiQdEhKPtBuT++2CIdmKMMbTUwz/fpfiPBwQSsjSgmW9u6H8h6lAEwHTf27b0Zgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETq5CNli; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETq5CNli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733994695; x=1765530695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2VfPTQiNBnw9pmeFwnQyQ5paMiQyCnXyJ9Jq2bLXCdc=;
  b=ETq5CNliOPzKtB1ghZ/qUpSWWb/9udgRjDz/aMLMR11+J/iVfp9idBfY
   pcjG1pujppj0gZduEzyRjqgrFQeggndBAYsxw0xEgQGhGqfUZcnu1rES1
   dUgTKQ+hQZVwPJe1nMhRIPG0vKYSKbkhcNRx6KA+xH2yw/kyRePjoBBrL
   5ZY3m8FYG09DfJ5cViypOdVrI5uKVDqyr7405oyZeQ3MqylvlXJbuf3co
   aWExjQI3+QTGhyVf99YcAr37UWUuz2C2ePGfprGIxPr8sLlBViT26buuY
   X1GAol+vGKIivPQtKb7mbEqucAm6LeyjMXEHCLhiulUhkLcvp57uxKWsI
   Q==;
X-CSE-ConnectionGUID: gGM4pb5SSJGBJn+SYJH+gQ==
X-CSE-MsgGUID: ALnU68nOTu+8708rCWKEdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38335430"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38335430"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 01:11:34 -0800
X-CSE-ConnectionGUID: Y9HwJabcSKufCXC0Rvwdzg==
X-CSE-MsgGUID: PjcTqSLBRTK9e/BQZ9KT7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="96595237"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2024 01:11:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLfEJ-0007e1-0M;
	Thu, 12 Dec 2024 09:11:31 +0000
Date: Thu, 12 Dec 2024 17:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 1285/30000]
 kernel/trace/ftrace.c:6781:6: warning: no previous prototype for
 'ftrace_graph_return_stub'
Message-ID: <202412121747.UhllwE4T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sami,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a8bf86a0e0fa05070897a210d706d5c4d83c26ac
commit: b4a47b3387c7e24a60d7f732f5dc7ca5f2e96645 [1285/30000] ANDROID: ftrace: fix function type mismatches
config: x86_64-buildonly-randconfig-005-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121747.UhllwE4T-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121747.UhllwE4T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121747.UhllwE4T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ftrace.c:619:5: warning: no previous prototype for 'ftrace_profile_pages_init' [-Wmissing-prototypes]
     619 | int ftrace_profile_pages_init(struct ftrace_profile_stat *stat)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/ftrace.c:6781:6: warning: no previous prototype for 'ftrace_graph_return_stub' [-Wmissing-prototypes]
    6781 | void ftrace_graph_return_stub(struct ftrace_graph_ret *trace)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:6785:5: warning: no previous prototype for 'ftrace_graph_entry_stub' [-Wmissing-prototypes]
    6785 | int ftrace_graph_entry_stub(struct ftrace_graph_ent *trace)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:4758: warning: Function parameter or member 'ops' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:4758: warning: Function parameter or member 'ip' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:4758: warning: Function parameter or member 'remove' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:4758: warning: Function parameter or member 'reset' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:4772: warning: Function parameter or member 'ops' not described in 'ftrace_ops_set_global_filter'
   kernel/trace/ftrace.c:4800: warning: Function parameter or member 'ops' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:4800: warning: Function parameter or member 'buf' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:4800: warning: Function parameter or member 'len' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:4800: warning: Function parameter or member 'reset' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:4819: warning: Function parameter or member 'ops' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:4819: warning: Function parameter or member 'buf' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:4819: warning: Function parameter or member 'len' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:4819: warning: Function parameter or member 'reset' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:4834: warning: Function parameter or member 'buf' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:4834: warning: Function parameter or member 'len' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:4834: warning: Function parameter or member 'reset' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:4850: warning: Function parameter or member 'buf' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:4850: warning: Function parameter or member 'len' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:4850: warning: Function parameter or member 'reset' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:6683: warning: Function parameter or member 'ops' not described in 'register_ftrace_function'
   kernel/trace/ftrace.c:6705: warning: Function parameter or member 'ops' not described in 'unregister_ftrace_function'


vim +/ftrace_graph_return_stub +6781 kernel/trace/ftrace.c

  6780	
> 6781	void ftrace_graph_return_stub(struct ftrace_graph_ret *trace)
  6782	{
  6783	}
  6784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
