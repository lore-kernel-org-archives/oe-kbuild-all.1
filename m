Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E803A2F53
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 16:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irwKyNom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697386044; x=1728922044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cYs44IWAByUUbMJL3ot/gvSc0Dh+8EDDc6IU9+JnKBU=;
  b=irwKyNomDAPjSnvUw1splUCWyRX+gHTTlyN7VYoi8x7XM3VFfFudAH0z
   rQkmTykrdsk+ylXMMrffgC28h7KG+9SNfBOpL016Iehl7oC5UFd3Zo976
   aCb+tbVtI7PEJuvhLXf3yAIejOZ5MlCoEecz0mQPADeKPN/5TGCqCs15V
   PjWvT09NA/OEsUEwP1TJ+pCICBcHjHBe0xba191KWUrzQMooB4UpZfZPg
   YFrNSm5VZUTNcQYHn2mtsTh3HG8S1NOEYRoYUBCBFw+jqUenviL+kU6TS
   1ATQCsaI0PY9lFQP9mjaZBeHRGLjt1KBz+lSMx4C6qzJhdocnVhsc+MV/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375764416"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="375764416"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 09:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="749010143"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="749010143"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Oct 2023 09:07:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs3e9-0007XT-1w;
	Sun, 15 Oct 2023 16:07:17 +0000
Date: Mon, 16 Oct 2023 00:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fgraph-multi 5/15] checkpatch: WARNING: void
 function return statements are not generally useful
Message-ID: <202310160013.RSBIZ2yH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fgraph-multi
head:   f89a72328944cb3136c9c44850970a9c8cc7021a
commit: 7b3af032d5b7533a0bddc72d5a8a2fb7ee7889e0 [5/15] function_graph: Remove logic around ftrace_graph_entry and return
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160013.RSBIZ2yH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160013.RSBIZ2yH-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:RETURN_VOID: void function return statements are not generally useful
#48: FILE: kernel/trace/fgraph.c:141:
+	return;
+}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
