Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3517F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 08:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682153142; x=1713689142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OKLVh8xQIvVz2h33ZlYrUsdYNd0jGrEn+uL2RURhDwk=;
  b=bgccCte/1GlHyCZChE6aSEPwrMEbjf9IWEXQGFZvacdYTPtaBdtWU4Oe
   aiWgrvQNsjRCuUq7j7jyBC7mbSoEatT1/Fb7Hdno6WTry/yY11DVjnGux
   3PpQDZ6UUTY+svOS6peiJ68j5S5IWlXVjmgdAQP8MUnxc49XK4kiUXaN8
   1nl9YqgW9j3mfMXx9/5sTUIMt0aecqE2Twx1fJmEb7OcGG9akDHpR6iF+
   b/EEaBpZ7hnn0jYJO+4nwiVdEM50jeipRvZ0/KSKyCcZ1mrxbrO3bnPUD
   U6zKN+Ig4/QQQcpCWrYeDrbXI6rhk8n3YnTffMzWB01KAHyoBHbCe+aCE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="432417119"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="432417119"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 01:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="836408951"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="836408951"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2023 01:45:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq8sF-000hCW-24;
	Sat, 22 Apr 2023 08:45:39 +0000
Date: Sat, 22 Apr 2023 16:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-doc@vger.kernel.org
Subject: [mgr:v6.3/topic/rk3568-vepu-h264-stateless-bootlin 1/4] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-ctrl-type-h264-encode-params (if the link has no caption the label must
 precede a section header)
Message-ID: <202304221631.JP3Qrgqz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.pengutronix.de/git/mgr/linux v6.3/topic/rk3568-vepu-h264-stateless-bootlin
head:   d0897ac6844c86a8d8d6f90d4116eb068184010c
commit: 17faa1883b0680d2e17b0d56a9e52e60c09e5d13 [1/4] media: Introduce Hantro V4L2 H.264 stateless encoding API
reproduce:
        git remote add mgr https://git.pengutronix.de/git/mgr/linux
        git fetch --no-tags mgr v6.3/topic/rk3568-vepu-h264-stateless-bootlin
        git checkout 17faa1883b0680d2e17b0d56a9e52e60c09e5d13
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221631.JP3Qrgqz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-h264-encode-params (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-h264-encode-rc (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-h264-encode-feedback (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
