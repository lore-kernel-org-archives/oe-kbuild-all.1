Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771AE3D9674
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 11:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781523668; cv=none; b=sIpCvqp9TkiOGlqBSi+RZQ6fzLxYYgtnyForf9rInGlDwZtli5ql9sxzL1PUJriYu3rSu86NC6ghC+TI/oQu4TcctUwO9E9YpKa4UMyDqiDs5oKyxDOtAVg10ej8DqLKBXCYbG+sCsxBYb5SMbMPafeaVCa6VJSd6D9lpyyU0Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781523668; c=relaxed/simple;
	bh=ONT0H6vzMUOv8HF4GGPZONUjiA4KmH8wbnoJpiNRMZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGJIR9RWlgyjXB7uqMqp7qrmEQTc9gLvZ9BqQ0pCZI3zmD+2+GxpLMWEWoihXG1K7m+zcwLmErzOuWeYpad55dQSHu77s0Emi5fBvFM0mrjSahsg7ilJoLJw+N65fOFt+ZAmAcFv9smYxsVVGD1L5SMxO/HEScCmRF25nKqaunc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aB0rb7LX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aB0rb7LX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781523666; x=1813059666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ONT0H6vzMUOv8HF4GGPZONUjiA4KmH8wbnoJpiNRMZ0=;
  b=aB0rb7LXNde8p+IE+q1MQQgs16zUE45mFCFOqz/NKM4p/Ty6V7mEkZwQ
   Ed1y2jq2y8H3nMSpnsXMPRUab1rCcoAZjnLbQU7If+EzaO68K82cBQkTC
   87TTHA3JQzOT3IXmyRcM3aZQnvAOFvUdhMNuD7jrF/av4Eomq6L+C/7If
   S5vJSTZK/odT21ZET6cegPOl7sMa4E8/6N17NbOh3Fg4gggfya9I72hbu
   C099PN5qQNRi/M2uEUwNsEkZ4gtnKjpFlpEVXM6xQt/uqT60fFKk4P7OZ
   JJx1GTvaqg2KVz4ADR8CDa14mX3XFK4fbGRX/eufK0JiQBdfKnKhBVXKr
   A==;
X-CSE-ConnectionGUID: GTRKNM+cTXGskOdthPwoqQ==
X-CSE-MsgGUID: /glx6Y1mTL24RZSf5UFUBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92579739"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="92579739"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 04:41:05 -0700
X-CSE-ConnectionGUID: 1c+o/JF6RymlJ3sadKxMEQ==
X-CSE-MsgGUID: 6hRIC4EySbO2LIINkMXdyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="249340115"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jun 2026 04:41:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZ5ga-00000000Rn0-2ZaG;
	Mon, 15 Jun 2026 11:41:00 +0000
Date: Mon, 15 Jun 2026 19:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: lirongqing <lirongqing@baidu.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Sudeep Holla <Sudeep.Holla@arm.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Li RongQing <lirongqing@baidu.com>
Subject: Re: [PATCH] ACPI: processor: idle: Add __cpuidle to
 acpi_idle_lpi_enter
Message-ID: <202606151932.LNUR0wXJ-lkp@intel.com>
References: <20260615065401.4611-1-lirongqing@baidu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615065401.4611-1-lirongqing@baidu.com>

Hi lirongqing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v7.1 next-20260612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lirongqing/ACPI-processor-idle-Add-__cpuidle-to-acpi_idle_lpi_enter/20260615-150110
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20260615065401.4611-1-lirongqing%40baidu.com
patch subject: [PATCH] ACPI: processor: idle: Add __cpuidle to acpi_idle_lpi_enter
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260615/202606151932.LNUR0wXJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606151932.LNUR0wXJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606151932.LNUR0wXJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: acpi_idle_lpi_enter+0x28: call to acpi_processor_ffh_lpi_enter() leaves .noinstr.text section

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
