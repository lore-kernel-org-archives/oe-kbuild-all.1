Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941593D6E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BllMSNJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697716571; x=1729252571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l7hEz3Co2RbjxtGVRFK3LE/YUuFfRDC66PxtMo30kow=;
  b=BllMSNJfnvGaLF25KH+A2Td84flMVMLd5QCYw7tWDyRdOF+Lf+Y517qs
   6Adzd+98mn/aNZpi/RC5b/kRFe3bu+R0JrsLhWv0Z3DscQPEPiRVk0mXV
   KhjjZGebdqrlUmx4yQ/Jr0Qs/xO1TP7xQOU138Xm/xlp0zyXec+NO0xyQ
   Jle1ClAXfRFoeLJFrJF8gMcAh34ff5QwCJx6FLEUNbjDxAgt3v7iy6/Pj
   nQbmxR9hxgFGW4fhJWJXUFgC06fDJMMfyTMVyo/d4+D7bxpSlxHuv1WhA
   mJcr7SaUhgcJTAMvck8mu6AdDzavZPMgf0n2B5+6+nyIH3oL61PVO67A0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="366471351"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="366471351"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 04:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="1088340277"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="1088340277"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Oct 2023 04:56:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtRdG-00025K-3B;
	Thu, 19 Oct 2023 11:56:06 +0000
Date: Thu, 19 Oct 2023 19:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, virtualization@lists.linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/5] x86/paravirt: switch mixed paravirt/alternative
 calls to alternative_2
Message-ID: <202310191920.R0c39S5h-lkp@intel.com>
References: <20231019091520.14540-5-jgross@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019091520.14540-5-jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/x86-paravirt-move-some-functions-and-defines-to-alternative/20231019-171709
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20231019091520.14540-5-jgross%40suse.com
patch subject: [PATCH v3 4/5] x86/paravirt: switch mixed paravirt/alternative calls to alternative_2
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310191920.R0c39S5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191920.R0c39S5h-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:BRACKET_SPACE: space prohibited before open square bracket '['
#92: FILE: arch/x86/include/asm/paravirt_types.h:281:
+#define paravirt_ptr(op)	[paravirt_opptr] "m" (pv_ops.op)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
