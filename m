Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340BC20E3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 04:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729137720; cv=none; b=ExeezR3tDoeTxA1dRcfqO+Ufzt4Fd7VbW3B6Sew51lDFrKQhJGoq/AkqxG0LIZXCOnRWujdoSj0gvWxUMJQX8GhuQUWopJCijN/974qTIxVpyQkqtWaiYQWpkn0+DDUEdusp6FFOtsbgM28rW8YHYCdslBwdROc6N3Re7xV4itM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729137720; c=relaxed/simple;
	bh=XK1blgFRm6JfdQRBU5MdR4By2kAFrD314PYtlkNMc9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VaCGgxVDWMcYwL3LYWEkHS4d/s3aqCG4xRpy/AY/0ok8JoI8dehkRQLaFBoNZsPyjFFo/yaVFXuo5ShEnkrsXeExpeoOBi0Qpj/9kdaaJPcDJHdwxaSsR0n8ymd2FS3RadTl16IIFsKtwOXJg8yaBJdO/GodKaej9yofGH6p5xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RuWmeuvz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RuWmeuvz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729137717; x=1760673717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XK1blgFRm6JfdQRBU5MdR4By2kAFrD314PYtlkNMc9I=;
  b=RuWmeuvzTrjUCrVkZaI0uyOHvNke3mgQkAjZtCAaJj0obRsisf/kdW4d
   vUN/Jqn8Y6mheNO8WmxYwhORLAL1aO066huJy9efoZBZdpo65cutHtCZ6
   PvZnP7gAQDISBI5K91Z7hwSJf5FvzDiFAXbbk83NXsJ0zgeZrwnyYOiYl
   x4yyaxPknawGs5zwLixojsbQutC+fETyS4/Tr+QOUMEBXTKhFKnutcGo7
   cppEzghcZh9DToKelLFMNUMjMyY7cAIW+bkouj2PcyIh1L78aSLWTrvyr
   8z+8MAOwuI65SakAWHZKB0F1q1c0DZq1fNPEJFslRMrECxDDViuqgTIw9
   Q==;
X-CSE-ConnectionGUID: iiEuaF8wQ8+PR8g3MVOlLA==
X-CSE-MsgGUID: 3+mJyyWSSPyNNMv6yBYxzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="31474890"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="31474890"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 21:01:56 -0700
X-CSE-ConnectionGUID: bINtJ/PVS0iW9SLfH33/Dw==
X-CSE-MsgGUID: 7fD1piIJQi6RtowIG4bpPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78768387"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2024 21:01:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1Hhx-000Li7-0r;
	Thu, 17 Oct 2024 04:01:53 +0000
Date: Thu, 17 Oct 2024 12:01:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 11/16] kismet: WARNING: unmet
 direct dependencies detected for FUNCTION_GRAPH_TRACER when selected by
 FPROBE
Message-ID: <202410171156.sjtDsFyZ-lkp@intel.com>
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
config: i386-kismet-CONFIG_FUNCTION_GRAPH_TRACER-CONFIG_FPROBE-0-0 (https://download.01.org/0day-ci/archive/20241017/202410171156.sjtDsFyZ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241017/202410171156.sjtDsFyZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171156.sjtDsFyZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FUNCTION_GRAPH_TRACER when selected by FPROBE
   WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE_WITH_ARGS
     Depends on [n]: FTRACE [=y] && DYNAMIC_FTRACE [=n] && HAVE_DYNAMIC_FTRACE_WITH_ARGS [=n]
     Selected by [y]:
     - FPROBE [=y] && FTRACE [=y] && HAVE_FUNCTION_GRAPH_FREGS [=y] && HAVE_FTRACE_GRAPH_FUNC [=y]
   
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
     Depends on [n]: SPARSEMEM [=n]
     Selected by [y]:
     - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]
   
   WARNING: unmet direct dependencies detected for FUNCTION_GRAPH_TRACER
     Depends on [n]: FTRACE [=y] && HAVE_FUNCTION_GRAPH_TRACER [=y] && FUNCTION_TRACER [=n] && (!X86_32 [=y] || !CC_OPTIMIZE_FOR_SIZE [=y])
     Selected by [y]:
     - FPROBE [=y] && FTRACE [=y] && HAVE_FUNCTION_GRAPH_FREGS [=y] && HAVE_FTRACE_GRAPH_FUNC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
