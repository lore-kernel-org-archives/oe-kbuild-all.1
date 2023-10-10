Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BEA24C62
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 14:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsTNMP8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696946493; x=1728482493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GKUK/yr5ZMkw9igeVAYNpsPHd7tA8dnADIMxCHeU0dQ=;
  b=IsTNMP8unpFBWEHJzcpmH8nrfTraMMq3eKi5ACASkHECfPqXlFXLg/VL
   zY8hMuEWwXMm78cOVyYP7S3ZxYESy52M3wxJWOA9WqvbIXjJTnmQSjVGS
   cMY/mwGk3HE/LWdkEE/tZxmzWwCQHNrD4w9Dscp/mTm6uKHmfyThJ8YfV
   vyy3TnMCZ3igSvMmGtFXoi+pYKRAYnM0QgDE8FAXI/4P6xMyWhbDIVj6T
   P6xnRkt61KMpz36gxTW+Mvu05aaxj5K/01bI6zRtYCTpRkUwRQkurOrWM
   7SNwsSmcr5QTLb4BhxMmpWFp/baiI9VYN+wWCxIYj8+6Ql87Kao0coCrf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="5964710"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="5964710"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 07:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="823791114"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="823791114"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Oct 2023 07:01:31 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqDIf-0000X8-2D;
	Tue, 10 Oct 2023 14:01:29 +0000
Date: Tue, 10 Oct 2023 22:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 25/38] checkpatch: WARNING:
 suspect code indent for conditional statements (8, 15)
Message-ID: <202310102109.z2wIucsI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   224f43124c24326eb21de553984a58d8528a48d0
commit: cc1d3771155dcc8243fdcad6f31585fa699f1f53 [25/38] esp_wifi: rearrange esp_get_packets
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102109.z2wIucsI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102109.z2wIucsI-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#43: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:750:
+	while ((skb = adapter->if_ops->read(adapter)))
+	       process_rx_packet(adapter, skb);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
