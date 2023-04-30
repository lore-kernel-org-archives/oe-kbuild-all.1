Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2742F1FA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 18:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682880945; x=1714416945;
  h=date:from:cc:subject:message-id:mime-version;
  bh=X+h1UDtO/gEWXe6p0LSOiugjveAtMbB5WNzQOshesGg=;
  b=IBiZuUj44j5U0MMW5K0wnhjv0kJ/tUrL44iwWhxtXY7dmyixF8kq2ya0
   81jT2bmdPkTaakKTIc40JXl87LonvkdKWkxQzTvpqjqxPtE8bXMlbQKAl
   tnrucT99jUJ2Kx5cYrEC5iXs5B/GTJwEQaDLZ/De5Ua0PzS8xtndOTFi5
   i+Hz7lzAxXkmQ04iVVEhsl7psDZpQOpQrWaSh7xmImjxuY4f/ZS8dmOHX
   Nsbi8JhWQwdM7LnXTymu4CWH7tUSV/6R8fMzK2rqxnquwOOGIa8PCqZ6d
   eQLJ+oTQYmQiSwu4EPzMbx4eV0W0sbNXm7MhPe2jfXErCp8w6YGqYIFYG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="332392397"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="332392397"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 11:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="941814226"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="941814226"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 Apr 2023 11:55:42 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptCD0-00005d-0b;
	Sun, 30 Apr 2023 18:55:42 +0000
Date: Mon, 1 May 2023 02:55:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Sunita Nadampalli <sunitan@ti.com>,
	Darren Etheridge <detheridge@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 58/70] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-ti1210 (if the link has no caption the label must precede a
 section header)
Message-ID: <202305010202.E6pImKVp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   5b69be59af422fe55a3cee133b337b1027cb98c3
commit: 0aab38e37ba8a092e92772e5fabab0d2963dd4db [58/70] v4l: videodev2: Add 10bit definitions for NV12 and NV16 color formats
reproduce:
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 0aab38e37ba8a092e92772e5fabab0d2963dd4db
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010202.E6pImKVp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-ti1210 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-ti1610 (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
