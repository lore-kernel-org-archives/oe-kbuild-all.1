Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288D7361
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 01:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674265061; x=1705801061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7J6PTzudqg7wBuBvyxU2FxVSRCociPR/AF9fyR8o6G8=;
  b=PEYN5/JmVxwjuYb6m+E6JKTT1s2VdwAJHc+F+BY/5WI5RJnA+HZPhAlY
   R0WgmB3poNJed8tPqA9kbjjaz29jWbRA8ESaJx+lCOUfQ3yxkNVjYYqkR
   677a5zXmYIXgG3pk2IOp1IXkTA0ILQeBqQm5rrzTcYsHme1/Asrl05Fnn
   ugeEQrhKhhgBa0ums7eUvwQEkruDC5KL/+KfmvKZTgJG9Hfdie/q6hwu8
   saXQZ87zGvug3y4KFDJuDvFKMTm5Tnvcy7X+Qa5ljDCoeehECD1bXYDp7
   olO0DpQnvVBv4vQlibn6dxnh+Ncde73KX+eziIbwyEiFbycjhBWGOkPnS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="327016384"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="327016384"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 17:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="989594953"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="989594953"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 17:37:38 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ2p8-0003EE-0w;
	Sat, 21 Jan 2023 01:37:38 +0000
Date: Sat, 21 Jan 2023 09:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-doc@vger.kernel.org
Subject: [coresight:next 28/28] htmldocs:
 Documentation/trace/coresight/coresight-tpda.rst:3: WARNING: Title overline
 too short.
Message-ID: <202301210955.zYxDrLgv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git next
head:   758d638667d474ff6b0a9052a8298f04c7ddf62f
commit: 758d638667d474ff6b0a9052a8298f04c7ddf62f [28/28] Documentation: trace: Add documentation for TPDM and TPDA
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git/commit/?id=758d638667d474ff6b0a9052a8298f04c7ddf62f
        git remote add coresight https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
        git fetch --no-tags coresight next
        git checkout 758d638667d474ff6b0a9052a8298f04c7ddf62f
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/trace/coresight/coresight-tpda.rst:3: WARNING: Title overline too short.
>> Documentation/trace/coresight/coresight-tpdm.rst:3: WARNING: Title overline too short.
>> Documentation/trace/coresight/coresight-tpdm.rst:43: WARNING: Document may not end with a transition.

vim +3 Documentation/trace/coresight/coresight-tpda.rst

     2	
   > 3	==============================
     4	The trace performance monitoring and diagnostics aggregator(TPDA).
     5	==============================
     6	
     7	    :Author:   Jinlong Mao <quic_jinlmao@quicinc.com>
     8	    :Date:     January 2023
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
