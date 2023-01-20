Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66DBBD22
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 05:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674193303; x=1705729303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zVZNyEKhnP4v9fnnUUqI04r0Zofc35qyB6UHvnrF+Ko=;
  b=YfUS9q+xm3yiOOAzOTaul9zXeOmna2WPkf/hSssvYQAXt+HFdJ+kTH5X
   2FTlIvY9HrMa/rqrK6JOwqnpAVK1B2UzzE8FvW52+pfjRi6t0YN9JZKec
   LeuqPv/6m69gKFt/vFErPGhCz03QldXwKJDYEq2O8rQbOneVydRJTblrP
   qRuK3W6iCm3R34ZRiMiopUHXg/4jONgqqL6BkWYn7nM6Pz6XDsbDtc64V
   wRE60l4F+qgjmiT2h/Fagzy633ruWHe232bfUzN56zXYkr+uQNXB3cojl
   oJAYYboO+4K1qo4XWV6LQsBTC5LzHLNljtKx7fC/+P/pxuZotZHV7+gw0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="327603667"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="327603667"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 21:41:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="662427885"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="662427885"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jan 2023 21:41:42 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIk9l-0002EG-1D;
	Fri, 20 Jan 2023 05:41:41 +0000
Date: Fri, 20 Jan 2023 13:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] docs: accel: Fix debugfs path
Message-ID: <202301201318.aas5dLTt-lkp@intel.com>
References: <1674145568-31513-1-git-send-email-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674145568-31513-1-git-send-email-quic_jhugo@quicinc.com>

Hi Jeffrey,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v6.2-rc4]
[cannot apply to next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Hugo/docs-accel-Fix-debugfs-path/20230120-002706
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/1674145568-31513-1-git-send-email-quic_jhugo%40quicinc.com
patch subject: [PATCH] docs: accel: Fix debugfs path
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/00ab1f89d5d2402717f79d2c6b7101f035aa1cf2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jeffrey-Hugo/docs-accel-Fix-debugfs-path/20230120-002706
        git checkout 00ab1f89d5d2402717f79d2c6b7101f035aa1cf2
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/accel/introduction.rst:72: WARNING: Inline emphasis start-string without end-string.

vim +72 Documentation/accel/introduction.rst

    69	
    70	- device char files - /dev/accel/accel*
    71	- sysfs             - /sys/class/accel/accel*/
  > 72	- debugfs           - /sys/kernel/debug/accel/*/
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
