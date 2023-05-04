Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4972C142
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 23:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683242037; x=1714778037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XfdmjIEG3WnKLVulWn1GDptAVLTd9JhsBE/iSFzF210=;
  b=nvbb7BZJAUzow4BKLpjVGj6Wl5c/4lGItKn1ZOjmeQxF8M4E+pOaur1+
   gcKRZs72Q53kyf2L9f1pJpuEnRNtav+IC5v6EnKXyRjXhKOjj9EuHNJmJ
   ub3tdAO6+xKs4Kagl1msuE6NVTFGZWw9mQGb2R+tXQiGMBn78ZnEen2Mv
   lZ6ANEMWJv3g+gFFeMK6B+Uz3vzbVHvkzJyz4BFCI4KZAkzQfRpoqJTay
   O+zUgRrVUijSSVV83aKGVNQSzaJ/xwucQFCryMR7vdxYf2WdAATe2GwSj
   cxeZUBQoWlWnvCz6T6AXk3bJHYn6UsYlysPDWTC2bJvkDtZpC7Gzvay7X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="352107032"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="352107032"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 16:13:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="1027172407"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="1027172407"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 May 2023 16:13:55 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pui94-0000Bu-1N;
	Thu, 04 May 2023 23:13:54 +0000
Date: Fri, 5 May 2023 07:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [tip:master 4/4] htmldocs: Warning: arch/x86/Kconfig references a
 file that doesn't exist: Documentation/x86/shstk.rst
Message-ID: <202305050705.5V1x1V3i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
head:   da1c4f07aa4dd227a57103fef1215e7cef3f35a9
commit: da1c4f07aa4dd227a57103fef1215e7cef3f35a9 [4/4] Merge branch 'x86/shstk'
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=da1c4f07aa4dd227a57103fef1215e7cef3f35a9
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip master
        git checkout da1c4f07aa4dd227a57103fef1215e7cef3f35a9
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050705.5V1x1V3i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/shstk.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
