Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A073882A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675354422; x=1706890422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZllGm8JM0PggcRthSxs5kphHB8LoTxUj3ORsqNRX1xk=;
  b=hasOWG4DHN+KVCnyHz0stiud67PSv/mFe391HQBQTk26Qwk684f1tzEH
   jbPyZiIta7qiwEGTRfmfkTYslObfqC4gmnejUUDy0uvlCI/RtoD0jLmoh
   2VGqFiDLipdIKei1k1PyAVEO3AVZHvuFDORcwfPySki9ti+yPW6gbGSs+
   kO9P5AjVG5F9C2jxuZeENj4UAUxhsoHQGBqrG/EAih+UcBBDogF01cexw
   M2paLWPUPxRDPLXW9mVHh3EyUC1p8eLBu3PomUbB13LO6UYc0DNssiE5f
   RxEGYVLxGYpfP/MC3CKMBIDoXi386LM+l5jL4pUlGhQZfv4WFaX888a9Z
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="328503616"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="328503616"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 08:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="994149560"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="994149560"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2023 08:13:38 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNcDR-0006eo-2G;
	Thu, 02 Feb 2023 16:13:37 +0000
Date: Fri, 3 Feb 2023 00:13:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 54/63] fs/f2fs/checkpoint.c:1482:55-56:
 Unneeded semicolon
Message-ID: <202302030016.87SfjJbJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   de6b3a5e09b29c014bd04044b023896107cfa2ee
commit: f45b6148e2f1f8f3e9824472a89ba568e418f8fa [54/63] f2fs: simplify do_checkpoint
config: openrisc-randconfig-c031-20230202 (https://download.01.org/0day-ci/archive/20230203/202302030016.87SfjJbJ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cocci warnings: (new ones prefixed by >>)
>> fs/f2fs/checkpoint.c:1482:55-56: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
