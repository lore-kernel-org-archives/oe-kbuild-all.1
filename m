Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920AD63D9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 15:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682435687; x=1713971687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hCanmosjEEaHzsMLRRa/xs06q7TpjmZvHistM5aNiag=;
  b=OnXV5JCAQf4cX5xOrgWkTR2KROwr5G8BCT/GvlEeYnbXWrs+TSC304KP
   93K/CmNg/Z/FrCWFVoQw7kEFjgYShm07+oJG+0KF54ndnbr2v2qMZLvGX
   yi4CptomCtZp8cRPo1KyVYrUlqEQjndtGxhVvkkBF7yFNUzUUGh7oO/3C
   YRN7zxSVp54AWszYuOFpSilockypoEB7lWsQUCBBHE/FxzNg7Q0QOfiiH
   xRO6s9+DTnrSxGxZg/5DynHPN5LLInc7DC5aCVuqI49Bs8vaDKd+LlRPu
   FPmw7H5BQd+8g1BKbskKV0RsKSrYmjcmTivnVO0xab4Qdsyr24W5djggI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="346824123"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="346824123"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 08:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="670919274"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="670919274"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Apr 2023 08:14:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prKNQ-000jU8-11;
	Tue, 25 Apr 2023 15:14:44 +0000
Date: Tue, 25 Apr 2023 23:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [mhiramat:topic/fprobe-event-ext 10/10] htmldocs: Warning:
 Documentation/trace/fprobetrace.rst references a file that doesn't exist:
 Documentation/trace/fprobes.rst
Message-ID: <202304252325.leoH4z6R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-event-ext
head:   356a6c2bfcfb9c9b9149dd63b22b2f1621290b9b
commit: 356a6c2bfcfb9c9b9149dd63b22b2f1621290b9b [10/10] Documentation: tracing/probes: Add fprobe event tracing document
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git/commit/?id=356a6c2bfcfb9c9b9149dd63b22b2f1621290b9b
        git remote add mhiramat https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git
        git fetch --no-tags mhiramat topic/fprobe-event-ext
        git checkout 356a6c2bfcfb9c9b9149dd63b22b2f1621290b9b
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304252325.leoH4z6R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/trace/fprobetrace.rst references a file that doesn't exist: Documentation/trace/fprobes.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
