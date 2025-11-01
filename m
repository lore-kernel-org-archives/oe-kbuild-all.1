Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082A71DED4C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 20:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762030181; cv=none; b=sfoHbGIMieoCOz9ZMKIhOxj0x8+9yu+bpu2jmf06bfVBVsOvK9Y3+h9T4X/NXnGe298np1f028TrTULu/XVvqNT0t+WtsJeqFcnoP9+ZSkVdSayhv/P2JCfIuoTWNtGVE+vAdt+D4g9fzQyU5Ja23OFxQ7hqBS/8gwzfcP8cP+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762030181; c=relaxed/simple;
	bh=vtaJtB6X2iEXQA9donquA8hXG8zxzUSKFQPqkbA63XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujryiO1woiLHmbTZ3nqif6TOvoArrH+kuzXFNulldsJNg5bTRkiGAYytD60HkyeTmsiFSryhGuihqutAJwGpBYk76hzMDAxX2LLFAr4ioTiwu0TF47PLTU5Oc/uUh1zfrss100v8zNjiy4KjsUVUVGrQo06jY9/mA8C9pXI+ZJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQ04z9sL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQ04z9sL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762030180; x=1793566180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vtaJtB6X2iEXQA9donquA8hXG8zxzUSKFQPqkbA63XE=;
  b=cQ04z9sLsR9xnQGjXsfNLvzOrBcIlm6mfje9EDvwOUAMsDEcaJu37O9U
   dXvoOsWDQUspcZMdzqL82kwj3ywwP+/RQvZyVlyTuUQ6laQ9MNOif3M6x
   j/1bCelD0w38tkKuihbmd+JPjWbvw83O9t+EwDs1WTr1aKuLjjPaJi8RH
   BFEAakFvnGT6yxm8ED8ndwb5ULcnijvteXqPayDa/zrJ0hfiG7bhdxay3
   QWL7SV8gPK17pR7NcYLg9DdWF4XmdYCcs9eNAXklYxB1wXvPdhIPnJN5F
   Ek2fL2K5YbgtlWQSG8f+DgFodHvgW36slxk05KPZyB6tJ5Px5bxYESPgr
   w==;
X-CSE-ConnectionGUID: 9CHMP9JIQd6Va9IiWHksMw==
X-CSE-MsgGUID: gKf6C0aERmeHv0joFV70Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="64200684"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="64200684"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 13:49:39 -0700
X-CSE-ConnectionGUID: UxhKeRH/Seus6A1hvxsOHw==
X-CSE-MsgGUID: KEiKZmuNTKqkGWXZYJwJ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186662152"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Nov 2025 13:49:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFIXN-000Og0-23;
	Sat, 01 Nov 2025 20:49:30 +0000
Date: Sun, 2 Nov 2025 04:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Herbert <marc.herbert@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Herbert <marc.herbert@linux.intel.com>
Subject: Re: [PATCH] x86/msr: add CPU_OUT_OF_SPEC taint name to
 "unrecognized" pr_warn(msg)
Message-ID: <202511020456.NiTKb752-lkp@intel.com>
References: <20251101-tainted-msr-v1-1-e00658ba04d4@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251101-tainted-msr-v1-1-e00658ba04d4@linux.intel.com>

Hi Marc,

kernel test robot noticed the following build errors:

[auto build test ERROR on dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Herbert/x86-msr-add-CPU_OUT_OF_SPEC-taint-name-to-unrecognized-pr_warn-msg/20251101-111139
base:   dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
patch link:    https://lore.kernel.org/r/20251101-tainted-msr-v1-1-e00658ba04d4%40linux.intel.com
patch subject: [PATCH] x86/msr: add CPU_OUT_OF_SPEC taint name to "unrecognized" pr_warn(msg)
config: x86_64-randconfig-103-20251101 (https://download.01.org/0day-ci/archive/20251102/202511020456.NiTKb752-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020456.NiTKb752-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020456.NiTKb752-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "taint_flags" [arch/x86/kernel/msr.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
