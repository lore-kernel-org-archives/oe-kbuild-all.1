Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEEB7E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Jan 2023 01:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672536265; x=1704072265;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=aPS9BbSboRnl0cBvRTtbo1q2WkW4umm/GoXi1etz+9o=;
  b=XVHMhLJe/aLeo6SVDIcM0ougJzn3PjGrkDmyd5wLg4jryYGOa2mA75jn
   2NV4wekvFu20Sxf8A6aZ/BctnEp14tYwOVzuxubxrKa9CygE3ujoI+H1D
   JZgXa7u9QQFvl1ryR3bQhWYoYPEpGkwbwJ1sodKSgDFbLknhv+DkNwJeC
   fJstg4mKi8xrCWRR49wTbA9gT09SyZXVoocVqgT91Bfc+LmAswXbhYAiM
   DwUMcchwdypXM20hzlfZl7usYaBkjJQnGACDeatcRnfHGSpFA3Hv42UvH
   LsCzU1iBzES65yn7k+ans7L+SAaDP46oPt1pQ4EkI/LfNInyJ3Zr429fy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="321411299"
X-IronPort-AV: E=Sophos;i="5.96,291,1665471600"; 
   d="scan'208";a="321411299"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2022 17:24:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="717491472"
X-IronPort-AV: E=Sophos;i="5.96,291,1665471600"; 
   d="scan'208";a="717491472"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Dec 2022 17:24:24 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pBn5L-000ON4-11;
	Sun, 01 Jan 2023 01:24:23 +0000
Date: Sun, 1 Jan 2023 09:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+98 bytes kernel size regression] [i386-tinyconfig]
 [163fc3e77f] mm: Convert page_add_file_rmap() to use a folio internally
Message-ID: <Y7Dgk4VXi9u4qAD7@42f7f79a36c2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221231214610.2800682-8-willy@infradead.org>


FYI, we noticed a +98 bytes kernel size regression due to commit:

commit: 163fc3e77f85510936bc58f67df667a972e89a0e (mm: Convert page_add_file_rmap() to use a folio internally)
url: https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/mm-Remove-folio_pincount_ptr-and-head_compound_pincount/20230101-054709
base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git e4cf7c25bae5c3b5089a3c23a897f450149caef2
patch link: https://lore.kernel.org/all/20221231214610.2800682-8-willy@infradead.org/
patch subject: [PATCH 07/22] mm: Convert page_add_file_rmap() to use a folio internally


Details as below (size data is obtained by `nm --size-sort vmlinux`):

66889e38: mm: Convert page_add_anon_rmap() to use a folio internally
163fc3e7: mm: Convert page_add_file_rmap() to use a folio internally

+-------------------------+----------+----------+-------+
|         symbol          | 66889e38 | 163fc3e7 | delta |
+-------------------------+----------+----------+-------+
| bzImage                 | 495936   | 496064   | 128   |
| nm.T.page_add_file_rmap | 92       | 207      | 115   |
| nm.T.page_remove_rmap   | 249      | 232      | -17   |
+-------------------------+----------+----------+-------+



Thanks


