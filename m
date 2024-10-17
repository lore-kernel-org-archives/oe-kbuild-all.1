Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5181DF74F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 16:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183661; cv=none; b=XDSkJ6xzUlwyL6npS8M+Cq24ug7eNkck0+1MR/qOvJGYoWviFKvhiPGy0N0TM7c0TYIT9HQo7VBD7cshBA/Gu9PPBbVDsH4dVz4DXkArO4FsznDRlDldxKwDED4u8tKss1T+glpPdHlB2ZDavv1wq/nq8/SSeYT4RWsRVGtqH5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183661; c=relaxed/simple;
	bh=63PjJPQaJcNnKG9XeRJChAWS7cbMnGS28of/JausEro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ugpVdjav91hZtjOaVuBevZ4OSfxuB7mKjkJp8qFMlffAG3kNBjcEgk6EF47MVAGXu2Rkj9KBog0ZvbLbiq8hA6h+HKPS547VdM9I/zNelQ8JhoUMrGdcHw4U6U0VbRraC7oQKUiCXax5hDhzvvCsRqrxPOHoH5J4dcVtoFShK+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O47REVLe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O47REVLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729183656; x=1760719656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=63PjJPQaJcNnKG9XeRJChAWS7cbMnGS28of/JausEro=;
  b=O47REVLe+ba+uZe9CrnYiXqk4XFzhRKti99V6UmQvI0Y1Dvf05GbaNVx
   OP9EWRat5afRhJ+IltUGf+xB+3FDK3G8j2Yhy8b3R2lV3OLNUHluFBPG3
   s6uF3vqHMP89dzjsaNBwDsVro93jfAgl4VA0/Y6GWGScUpAArE6JJHUB5
   TrS6JBEmwIl6Q4U+qfR15+kXIy1FpZsW+OU9F1pXQCg0lCen3HT1GxpA4
   fdcbUDRHmaKp9VRI/9XGuzUR6qiRBJyDqKqa2vkGhKRAiLwncMl8Zah+U
   yUj/wZis/8ZvS+ZTYxkyywAMng9oMVKf2MNn0u/fyc6bzSLIbAcZ3T2OR
   g==;
X-CSE-ConnectionGUID: Q6rVIgmcSKeBm3L8Gd7aaQ==
X-CSE-MsgGUID: iM3XRLXETRaxMeafGgOFXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="54096857"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="54096857"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 09:47:35 -0700
X-CSE-ConnectionGUID: NfD2OPkXR7OwK8Af0VXyQQ==
X-CSE-MsgGUID: VehQZu9ZQUKg9ohONmif/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="78632468"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Oct 2024 09:47:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1Tet-000McB-2Q;
	Thu, 17 Oct 2024 16:47:31 +0000
Date: Fri, 18 Oct 2024 00:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 11/16] kismet: WARNING: unmet
 direct dependencies detected for FUNCTION_GRAPH_TRACER when selected by
 FPROBE
Message-ID: <202410180003.35Uet09j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   36aa7422f5b4c5a064a78590cb58482f5bf424c9
commit: 32f999ced5d222fee0e23a34fb9356362d0e1ef7 [11/16] fprobe: Rewrite fprobe on function-graph tracer
config: i386-kismet-CONFIG_FUNCTION_GRAPH_TRACER-CONFIG_FPROBE-0-0 (https://download.01.org/0day-ci/archive/20241018/202410180003.35Uet09j-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241018/202410180003.35Uet09j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180003.35Uet09j-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FUNCTION_GRAPH_TRACER when selected by FPROBE
   WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE_WITH_ARGS
     Depends on [n]: FTRACE [=y] && DYNAMIC_FTRACE [=n] && HAVE_DYNAMIC_FTRACE_WITH_ARGS [=n]
     Selected by [y]:
     - FPROBE [=y] && FTRACE [=y] && HAVE_FUNCTION_GRAPH_FREGS [=y] && HAVE_FTRACE_GRAPH_FUNC [=y]
   
   WARNING: unmet direct dependencies detected for FUNCTION_GRAPH_TRACER
     Depends on [n]: FTRACE [=y] && HAVE_FUNCTION_GRAPH_TRACER [=y] && FUNCTION_TRACER [=n] && (!X86_32 [=y] || !CC_OPTIMIZE_FOR_SIZE [=y])
     Selected by [y]:
     - FPROBE [=y] && FTRACE [=y] && HAVE_FUNCTION_GRAPH_FREGS [=y] && HAVE_FTRACE_GRAPH_FUNC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
