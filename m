Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606A1311C33
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 01:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769130576; cv=none; b=XQCA/YsJsd+6tXkSuqVCqZcahu2e6pErPGOnzNF5VMyYvH+iA17NeifS2WKNOpH8UxR/vIrPEAd4KpLQyf4jvadMcnHOoP+aniXSJlqUW717UY9GjbHpLdcNRt3FoFib0zVTlUqdbJes27Jmgp4Mt0sTM+aQv+hNC2tGQzH4hIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769130576; c=relaxed/simple;
	bh=VO/88RYwsVYIOREqx/P75XgWAQqZ8h6ys+ayqIZ0B/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITnmxhY6U5KUC8OsNNtDEDWDi5oem0XJgAXUvRWdJi0hGppIZu8loZCISmA7+Oe8/3M9Tk+z6wnBBfS9VlI2VMiCQFtWUl4huWlqVGFh3o0Ofwrhtl7W8THgq0lWMRRwXAizca3EO/N48ItpyPVOFBlh3c267fvHQrAFcigWZfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lq7qIdX1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lq7qIdX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769130573; x=1800666573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VO/88RYwsVYIOREqx/P75XgWAQqZ8h6ys+ayqIZ0B/c=;
  b=Lq7qIdX1JtEG+xh/yQ9i2wMLqoIV1e4eLG0qhezf7/L9Jzkduyv2JoKK
   G3x6a/RnJNOgwxFH/iclEWbwBqRKFc+niJBxqjnxoYJsdQrl9Xpso9LAZ
   XM5C3MAzQoOZmXygU/CaSfyiiChO5TPLF6CM13L514gmT6SF3zuIF4PJ5
   Vj1NKiW6ddwBiSDtLU0D2pjyoBRA0Do2DokCi5LMuICc7wrkwWRINeX/Z
   xseJn/LWOg591jcEzCAzuFJHYwhXVoTmeg4d6wkMK6urH/4piw0xDAc5J
   7GlPtPMab0PfpLc3Gqlv7AnaU8c0N5IgKJ6KjcEfQYfuf1LDh7a3FO2Vh
   w==;
X-CSE-ConnectionGUID: omtnJ4BUQ2+eqAeUqatpnA==
X-CSE-MsgGUID: g4IrC44WS1qEWELoaVt6bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70298335"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="70298335"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 17:09:29 -0800
X-CSE-ConnectionGUID: YXFkaPoxSb+2TnsImG9/TQ==
X-CSE-MsgGUID: VrQOBAAfRtSFlSuGaCCQow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="207142867"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jan 2026 17:09:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj5fw-00000000TO6-1JRl;
	Fri, 23 Jan 2026 01:09:24 +0000
Date: Fri, 23 Jan 2026 09:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: Pnina Feder <pnina.feder@mobileye.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, pmladek@suse.com, bhe@redhat.com,
	linux-kernel@vger.kernel.org, lkp@intel.com, mgorman@suse.de,
	mingo@redhat.com, pnina.feder@mobileye.com, rostedt@goodmis.org,
	senozhatsky@chromium.org, tglx@linutronix.de, vkondra@mobileye.com
Subject: Re: [PATCH v8] panic: add panic_force_cpu= parameter to redirect
 panic to a specific CPU
Message-ID: <202601230908.0vB3SoHM-lkp@intel.com>
References: <20260122102457.1154599-1-pnina.feder@mobileye.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122102457.1154599-1-pnina.feder@mobileye.com>

Hi Pnina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pnina-Feder/panic-add-panic_force_cpu-parameter-to-redirect-panic-to-a-specific-CPU/20260122-182657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260122102457.1154599-1-pnina.feder%40mobileye.com
patch subject: [PATCH v8] panic: add panic_force_cpu= parameter to redirect panic to a specific CPU
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260123/202601230908.0vB3SoHM-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230908.0vB3SoHM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601230908.0vB3SoHM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/panic.c:79:14: warning: 'panic_force_buf' defined but not used [-Wunused-variable]
      79 | static char *panic_force_buf;
         |              ^~~~~~~~~~~~~~~


vim +/panic_force_buf +79 kernel/panic.c

    77	
    78	static int panic_force_cpu = -1;
  > 79	static char *panic_force_buf;
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
