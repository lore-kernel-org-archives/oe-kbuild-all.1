Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51141FB3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677837193; x=1709373193;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=9n9zdEsROKI9Acc/Bz81R7p+yqVljz1gnqToUBfzFf4=;
  b=ROoHOUCCNwh1zXfTGQGsc7z1Jn9r9YnWysGN0davCvGwvdonFGxZ22ou
   AEHNvPL8Pj3Li6zCFQQaRD7daXPyIA0XZs+sP33B8Tpq03MbdJBE9ksoH
   0ILRQDmGQY8tM//eIaCxSf8soWOI5LbfBUQukMLQ6hsB23JU2UMQlccRJ
   3xq8RQfY7DOpvYoYm4idD82zKFYGsO3La+4rb8jmj+sh/RaRKFHW2MU6O
   C0xzk/lYk4wafA95Bnke0h4S7Pm3rRw84KaXmy3fiiHgqeoEM+u859flL
   Vfgy9J6gMntmUVic4TGnyg+VAYRGo3QXYXGZ4a2/sKxa7LcB9wHfN9lyq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="318829244"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="318829244"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 01:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="675308462"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="675308462"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Mar 2023 01:53:08 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY267-0001NO-0u;
	Fri, 03 Mar 2023 09:53:07 +0000
Date: Fri, 3 Mar 2023 17:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+165 bytes kernel size regression] [i386-tinyconfig]
 [a4ee841f30] filemap: Add folio_copy_tail()
Message-ID: <ZAHDfBUwX7i9IdNS@8d190a1611c4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303064315.701090-2-willy@infradead.org>


FYI, we noticed a +165 bytes kernel size regression due to commit:

commit: a4ee841f30215e4f7c5dda2ab82007f590a6a62b (filemap: Add folio_copy_tail())
url: https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/filemap-Add-folio_copy_tail/20230303-144359
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
patch link: https://lore.kernel.org/all/20230303064315.701090-2-willy@infradead.org/
patch subject: [PATCH 1/2] filemap: Add folio_copy_tail()


Details as below (size data is obtained by `nm --size-sort vmlinux`):

fbcd6c98: Merge branch 'mm-nonmm-unstable' into mm-everything
a4ee841f: filemap: Add folio_copy_tail()

+----------------------+----------+----------+-------+
|        symbol        | fbcd6c98 | a4ee841f | delta |
+----------------------+----------+----------+-------+
| bzImage              | 501664   | 501856   | 192   |
| nm.T.folio_copy_tail | 0        | 165      | 165   |
+----------------------+----------+----------+-------+



Thanks


