Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD861772B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695388463; x=1726924463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UFNRja4x6oY/Ope8SMyY8VtxRobnXvO+xfGrOIxFCQw=;
  b=YrHou4QyI+VJYiWbbsOIY6kERqRIQfN/5jQRQr0q1mIy/wbaWgky5ts/
   WV9QY28ee7wrAWNNP5AYCytN38NKhykcyrUo0hkBH0O/Jspk6O+NpZYSa
   8Ot5Hc7RECGShW5PN9DoHMiUwZtTRssT/Pon1GBQagm+oEkuTDMNmPxvU
   nBt5Qqa5/yNpUMu9fzXaZ92V1WKS0d/QkLVhOdxhQBYqCn5otjWjssC3u
   3SafZhbR/CDViaAzln76+6iOlDpi79qFEqkCFKgI4VN1U4bcVUea0Enr+
   48FRL6sfnS7LN2CMdEZrtvWl7Vxd5jfGeIp0qx4wn1ABEUc9JyQYE6Ida
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="365880843"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="365880843"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 06:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="837745231"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="837745231"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Sep 2023 06:14:21 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjfz9-0000kU-0i;
	Fri, 22 Sep 2023 13:14:19 +0000
Date: Fri, 22 Sep 2023 21:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-kunit 6/10] kunit_iov_iter.c:undefined reference to
 `insert_vm_struct'
Message-ID: <202309222104.tHJDVXJU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-kunit
head:   895a7ddefa3e00a497187cac3d4fb5e57d3059fe
commit: 4a57670659b9f9233e49e83ac8ae0c3ef140ae65 [6/10] iov_iter: Add copy kunit tests for ITER_UBUF and ITER_IOVEC
config: sh-randconfig-002-20230922 (https://download.01.org/0day-ci/archive/20230922/202309222104.tHJDVXJU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309222104.tHJDVXJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309222104.tHJDVXJU-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: lib/kunit_iov_iter.o: in function `iov_kunit_create_user_buf.constprop.0':
>> kunit_iov_iter.c:(.init.text+0x6b8): undefined reference to `insert_vm_struct'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
