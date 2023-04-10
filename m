Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201865254
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 19:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681155640; x=1712691640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=laXGmhMf7cZZE1oIv4n1OUjX2M6cnYMAGIDyZh+V4cs=;
  b=XLijjEP6RBOdsFjH4N0FouISt8sLN33ADv+1RZr51JMxugS2r6Y4r32i
   DClYwL22otdfYsjS8VuNzI41Y2+oDCPkLfz/cRLRBeEzcKVxSGUJLE6Yw
   RXiNaOr6lhxosFGaXn6kTV9YS2IkwimX+kfY6VcN8rOcDqVWO+YykM34R
   GcbuMmLQugbi+DjfDB+l6q65pSxSzN2QZ1scrKOhz1jXqPzHFz4GgPEmw
   akyeGB2PnZMuEnHZF65qjn2IzR3NNbVqmnXbr+yZNRCZ8Z56g2LvftIns
   zb09niaz2qL66X1feGN8KTqCWayVndcLvYqljDTZi7WrHPKQV1I36QWPz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="343446212"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="343446212"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 12:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="1018102629"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="1018102629"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Apr 2023 12:40:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plxNV-000Vcz-0l;
	Mon, 10 Apr 2023 19:40:37 +0000
Date: Tue, 11 Apr 2023 03:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Rahul T R <r-ravikumar@ti.com>
Subject: [ti:ti-linux-5.10.y-cicd 20321/22025] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-srggi10 (if the link has no caption the label must precede a
 section header)
Message-ID: <202304110303.2W27i0E0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jai,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: fa80761ddb51ee69efb493838865b1afd7b58afa [20321/22025] media: v4l: Add 10-bit RGBIr formats
reproduce:
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout fa80761ddb51ee69efb493838865b1afd7b58afa
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110303.2W27i0E0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-srggi10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-sgrig10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-sbggi10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-sgbig10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-sgirg10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-siggr10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-sgibg10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-siggb10 (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
