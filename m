Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20CF7F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jan 2024 04:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1pESpGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704686550; x=1736222550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YR9bIItEQfkURKLadVBM+hI86k+4PVwzc8bk5uTUWPg=;
  b=G1pESpGBt5xixFfy3KrES81d3oEreepKBu7rvl9MQWLMRPfiXgQcpDsK
   0Yk46RCIQK+zXt+u6Y+ZoMM/LNjp65tvKBik3ktysm35JoQ2umt8wD783
   saHfERtm/ykueO59ZjjehQGatBAfKaU2IBA6PHEU9Obf3P3vzpRf45Ug4
   HodWCloEYkaJtEA44C3kQKFsw4nm3DmeyanxsjK1UA/qrHGW9SuEuf7uT
   a2tuTCN6+hrblNfZa7c0TmLnCa8kuRZCaOmL2RGN7jKjP+sVVKn5aJejE
   BcMOBbScqc64AqJxbhCvnEyWT/aMpgdxnGhPx0Uoz9v8TrHupPLA2TIlK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="401580014"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="401580014"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 20:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="900251635"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="900251635"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 07 Jan 2024 20:02:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMgqI-0004SG-27;
	Mon, 08 Jan 2024 04:02:26 +0000
Date: Mon, 8 Jan 2024 12:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] platform/x86: Lenovo sub directory
Message-ID: <202401081121.JE2zLttB-lkp@intel.com>
References: <20240104003726.21277-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104003726.21277-1-mpearson-lenovo@squebb.ca>

Hi Mark,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7 next-20240105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Pearson/platform-x86-Lenovo-sub-directory/20240104-084032
base:   linus/master
patch link:    https://lore.kernel.org/r/20240104003726.21277-1-mpearson-lenovo%40squebb.ca
patch subject: [PATCH RFC] platform/x86: Lenovo sub directory
config: i386-buildonly-randconfig-005-20240106 (https://download.01.org/0day-ci/archive/20240108/202401081121.JE2zLttB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401081121.JE2zLttB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081121.JE2zLttB-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[7]: *** No rule to make target 'drivers/platform/x86/lenovo/ibm_rtl.o', needed by 'drivers/platform/x86/lenovo/built-in.a'.
>> make[7]: *** No rule to make target 'drivers/platform/x86/lenovo/hdaps.o', needed by 'drivers/platform/x86/lenovo/built-in.a'.
   make[7]: Target 'drivers/platform/x86/lenovo/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
