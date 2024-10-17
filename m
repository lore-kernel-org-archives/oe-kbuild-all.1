Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72011DED74
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729178676; cv=none; b=VejtapvxwD3MYW9TpW6ky1TBQLryHccjAvTWaYZ+yJXAkGMPviZm/5h0db8SBQPalfH51UnrnSQxB8GF/MAOG/eSlIlLoJHkSPfC08oysbMgtvvrtnEzkxnr3nTWINHBavnGhaQYa/Kt954zdlVvn11IrsTZOuAECnE8O1hbIFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729178676; c=relaxed/simple;
	bh=mIHhosJfdTcAI5yV3udoW/QplBqipXo8dwPDi/91C1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pkbMonlUMbE+IT2oYGnIgKNqCy1si/aNdInStIlj5tc+X0WD5n50hNcnsmQj2KRP7TkBoEIQDoGhtm9zsmBb3/4tWeKVJ1kBW3g4Ctm75KP74tOeYo8F5ErOyL42bV1kQNz2Qfo8Lf8CxKzvsiAJ7MUQt7MlhdWPPw4cmeKGvTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVbwNxGF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVbwNxGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729178672; x=1760714672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mIHhosJfdTcAI5yV3udoW/QplBqipXo8dwPDi/91C1o=;
  b=MVbwNxGFeo09gdbvsLEogcIod28ECZgDH2PEFFuzYr3Yx1rRrX4wBQC0
   dpkuNJiBw8vBLPEAssaAcaGSLpckgqVHsBiLAdrzu+0+mg+WNfzDjeBYF
   xcLO0y3MdKcvLN/wZ2JKSH1fiKEV9piXybGZhN1/5YvaZHvD7BQO+W8V3
   SVAroYGOCtyZ0v1a6UOWJNf9ERereOKjRgINNxCYRQ4CzM9WWzvoMQty1
   dRjZYKudpVjpcXi9k3FfYDw92rb1Pb3eUuUwOsozGU9VLAbAOg/YCpJay
   RWemn8tsdvB9oNsKB5W9CHvlW8RgaCNlT2B/z71lIhYQgLPANVwHGz55S
   g==;
X-CSE-ConnectionGUID: 7662Bk9ISbKs+nwe+TfG1A==
X-CSE-MsgGUID: CFA8QY86TDKmK14mtSZGwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28822728"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28822728"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 08:24:31 -0700
X-CSE-ConnectionGUID: zCYRTHRARJKwW8JG8fynGQ==
X-CSE-MsgGUID: YZxAnHvxSh6JYQVzOlN1dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="78919630"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Oct 2024 08:24:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1SMV-000MVv-2a;
	Thu, 17 Oct 2024 15:24:27 +0000
Date: Thu, 17 Oct 2024 23:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 11/16] kismet: WARNING: unmet
 direct dependencies detected for DYNAMIC_FTRACE_WITH_ARGS when selected by
 FPROBE
Message-ID: <202410172344.kKByFy7r-lkp@intel.com>
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
config: i386-kismet-CONFIG_DYNAMIC_FTRACE_WITH_ARGS-CONFIG_FPROBE-0-0 (https://download.01.org/0day-ci/archive/20241017/202410172344.kKByFy7r-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241017/202410172344.kKByFy7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410172344.kKByFy7r-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE_WITH_ARGS when selected by FPROBE
   WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE_WITH_ARGS
     Depends on [n]: FTRACE [=y] && DYNAMIC_FTRACE [=y] && HAVE_DYNAMIC_FTRACE_WITH_ARGS [=n]
     Selected by [y]:
     - FPROBE [=y] && FTRACE [=y] && HAVE_FUNCTION_GRAPH_FREGS [=y] && HAVE_FTRACE_GRAPH_FUNC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
