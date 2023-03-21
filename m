Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9406B1FA0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 05:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679377997; x=1710913997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m7tMsLPv9nU1FGdk5g2fbjs/8TTEmzgOm9TDVJ7nlec=;
  b=Y9wRttQ/rOKT7FMYCTySVTB4a6iU8MyYodCZVlgSL/zSeakiKlRI1/uT
   tbfsUhY/36FhW3WKaSH17vPXnHo1a0dLcEdrBy+GFUZLjCvDhw/uJ9H7/
   dRoadgeaJ/VFN60CKuNfjF2gvIPlMoZwmV6r4x2P66p+CqAMtlBNSOVe8
   AvO0ZRtQD0VDg+wX7xNcXL/wqrgbZDIjIF9f8FAaoudEirsVC02Z3wr/l
   7SAlmhDOUZtagL5ttG1lYrskxhjRXzuE9wMZBwJdjtgOIBB6oHgnCPGGb
   /VThfo4nTTMqYlLyn5GDiWMyWvLr+7YVwrdKksno7NBl0lhAKP7y8EwfI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="403727924"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="403727924"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 22:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="631427045"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="631427045"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Mar 2023 22:53:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peUvq-000Be6-2q;
	Tue, 21 Mar 2023 05:53:14 +0000
Date: Tue, 21 Mar 2023 13:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 5031/5297] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/ABI/obsolete/sysfs-selinux-checkreqprot
Message-ID: <202303211332.MILzGUKQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f3594f0204b756638267242e26d9de611435c3ba
commit: a7e4676e8e2cb158a4d24123de778087955e1b36 [5031/5297] selinux: remove the 'checkreqprot' functionality
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a7e4676e8e2cb158a4d24123de778087955e1b36
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a7e4676e8e2cb158a4d24123de778087955e1b36
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211332.MILzGUKQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/obsolete/sysfs-selinux-checkreqprot

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
