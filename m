Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8AA1DFFD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 12:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bf5ObZrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697717233; x=1729253233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rbsBJpmkS47G9tV6+xTsrI+g7quKxqgTbZfC3LaxFAw=;
  b=bf5ObZrvRh/DBAz+6igAuH5sO+nl8JwNVShu/p9Z/ky6h9QWADm3XuIW
   q+5uSjCz7UOJMiDGc1T2kxd+JME54n1u6FvkmUx7sW6me4Jx8oXuqsSyy
   ibYybFsXg2NJs5YQTe/kqBQ/+0Djh2i0uwKFKIHWhLYPiruUuhr2Fed/F
   zpr+COOmtOBu8jkk754q0akMUSPAoLzlmNf6GIx72l0j8249+/yiBiUKH
   h+I421LWkvtfTn/y8ye4ocfDoPdvSz8igkZgo4mQ/+XQN3AsvM62r3/EF
   zDvxjet+FWmE6xupduLt5QFb117uGnSkJu44rt0fExQSKpzXsG1sDTzw/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="366473289"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="366473289"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 05:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="1088342758"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="1088342758"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Oct 2023 05:07:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtRnv-00025W-0K;
	Thu, 19 Oct 2023 12:07:07 +0000
Date: Thu, 19 Oct 2023 20:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, virtualization@lists.linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 5/5] x86/paravirt: remove no longer needed paravirt
 patching code
Message-ID: <202310191909.USSRXzXc-lkp@intel.com>
References: <20231019091520.14540-6-jgross@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019091520.14540-6-jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/x86-paravirt-move-some-functions-and-defines-to-alternative/20231019-171709
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20231019091520.14540-6-jgross%40suse.com
patch subject: [PATCH v3 5/5] x86/paravirt: remove no longer needed paravirt patching code
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310191909.USSRXzXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191909.USSRXzXc-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#327: FILE: arch/x86/tools/relocs.c:69:
 	"__x86_cpu_dev_(start|end)|"
+	"__alt_instructions(_end)?|"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
