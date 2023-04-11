Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC8417E2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 02:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681180852; x=1712716852;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5a3oYJ72HjGL2jvbLstDCD9K/7piGhKtQB40w+SrGuE=;
  b=YEQZr0RXtE3soT68huqxKzb38BMZOwNfQlP6nsa6EWOzMBgO8aNDE9hO
   7pUk6R5qOKYdBgdNWIteFznd4VYL8C3p/mzAxUhduWoov1SlGFQlLdMo7
   Kez2QOti/IpwmYrDTwcly5x1s2VGBbaK152Q7JfOG+a2uRlaN5dhYOtKf
   aSqPpCqT5HTp5CDq+bZmkjevgWTWf7EE6jUymYyhdKzz5a93i0Y8x5Klr
   e2bwcTdRnKW3CKyCH4uBMgyjivHSO0DJTjo4TNLV9yqO9HDoZAjxkFh4l
   INbEY/3PfrmwMcwJApNUnoXPNjAerVzQeqBZgvDnsNpfwTwYax4tAJQ6f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323140794"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="323140794"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 19:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="752978160"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="752978160"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2023 19:40:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm3w9-000Vqz-0M;
	Tue, 11 Apr 2023 02:40:49 +0000
Date: Tue, 11 Apr 2023 10:40:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Brandon Brnich <b-brnich@ti.com>,
	Prasanth Babu Mantena <p-mantena@ti.com>
Subject: [ti:ti-linux-5.10.y-cicd 20507/22025] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/media/cnm,wave5.yaml
Message-ID: <202304111031.ixAc1KG2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: 5f467c5681a6c862441476473030ab03f6b2c27d [20507/22025] media: chips-media: wave5: Add wave5 driver to maintainers file
reproduce:
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout 5f467c5681a6c862441476473030ab03f6b2c27d
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111031.ixAc1KG2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/cnm,wave5.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
