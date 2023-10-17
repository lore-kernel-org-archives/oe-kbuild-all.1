Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6F31946A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+tR/AfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697545556; x=1729081556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z1dGdgyAZeCNnNj+8MPzS2+PS3CIAxoRw76hPuLWBdo=;
  b=l+tR/AfE1eugjSwrf32fX1UXkLzfkDPkHffgiHSJjwByTj6qaiDyR+ys
   hclsE1E0XsiaAJr/p0LR120HNxXhMzRtce4BovIvkQmSJOEuKmSbyPNdc
   s5FIWGU2rI9n9yCAO6oSo9OB7ahyNyotHosR/q2hvuXHsImTThxarlbBB
   I8KCXypT84OpGui8pDZBrZPkxU68+PYJaeL7dFnKnSoXoFJ4cCXSFggwC
   Ysvf0FK6brYRJ2jOnj/wxg/aW/yYfFB8AuhE5AU2rMnEguhtCer6+BrVn
   GQ1mBEVui0HcyzDUp8ZppWaDr1opYJSQAqM+CtR4cAD7zBjIW59/mF2ra
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="366029408"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="366029408"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 05:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="749669239"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="749669239"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Oct 2023 05:25:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsj8w-0009a7-2A;
	Tue, 17 Oct 2023 12:25:50 +0000
Date: Tue, 17 Oct 2023 20:25:40 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:extron 183/183] checkpatch: ERROR: code indent
 should use tabs where possible
Message-ID: <202310172039.o814mB7g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git extron
head:   9cb1cb3ffe4f4d29073ccb03f33323cf9c1afd2f
commit: 9cb1cb3ffe4f4d29073ccb03f33323cf9c1afd2f [183/183] cec/extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310172039.o814mB7g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310172039.o814mB7g-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:CODE_INDENT: code indent should use tabs where possible
#1078: FILE: drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:873:
+^I^I^I^I^I        extron->data + 6);$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1093: FILE: drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:888:
+^I^I^I^I^I        extron->data + 6);$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1134: FILE: drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:929:
+                             strlen(extron->response)))$

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#2056: FILE: drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h:56:
+	unsigned cmd_error;

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#2109: FILE: drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h:109:
+	unsigned cmd_error;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
