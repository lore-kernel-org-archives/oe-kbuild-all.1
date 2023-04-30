Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831682F5F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 17:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682875843; x=1714411843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s+Mn6GL6lzrDi541xjlzv+akoj3qHuZrKW6EKC2xTGc=;
  b=XfHJLmg4X+ffU2v/8E6dYSPk89kDMOpNkuWDB2QPeyMpi2Ld4p3WaCjT
   lJAr4akPsfxXYU9Ns1fMFoR1ynqX21AkhO8qjZqAPV8VsFT8STwzZhUF1
   RJVEhJ6IMrivTC475iBeWl9ZCzU2KJwiAqomSGWJB8k8PIfCOo41acABK
   cqWEz36EiL1ye4u3Zd6V9BEejqFuE7kWii+1IFS5/o/iXyg/kVKGaj2r+
   qzgc8GDdlDSsDigoABqx1cBbtnsDhox9LzezYcbzQOQHAj8UQJCoBu8BV
   rYvgaZlQWby2hvKIXWI0jipZLTsZwrDsoYSxH6mFEIEduvrn0jwia7sk5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="411168825"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="411168825"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 10:30:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="869930795"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="869930795"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Apr 2023 10:30:41 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptAsj-00004H-0r;
	Sun, 30 Apr 2023 17:30:41 +0000
Date: Mon, 1 May 2023 01:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Kernel Builder (kathleen)" <ubuntu-kernel-bot@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm1-s3-bug 1/11] htmldocs: Warning:
 debian/rules.d/3-binary-indep.mk references a file that doesn't exist:
 builddir)/tools/tools/bpf/bpftool/Documentation/*.8
Message-ID: <202305010136.bz7pv3az-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm1-s3-bug
head:   16b1299c9762360866dd649a99c6c03f8a213fe4
commit: dfff5e890fa1c6a99c3adba032fdf1925ac658e4 [1/11] base packaging
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=dfff5e890fa1c6a99c3adba032fdf1925ac658e4
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd tpm1-s3-bug
        git checkout dfff5e890fa1c6a99c3adba032fdf1925ac658e4
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010136.bz7pv3az-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: debian/rules.d/3-binary-indep.mk references a file that doesn't exist: builddir)/tools/tools/bpf/bpftool/Documentation/*.8
>> Warning: debian/rules.d/3-binary-indep.mk references a file that doesn't exist: builddir)/tools/tools/perf/Documentation/*.1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
