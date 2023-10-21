Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E284A02
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 00:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvTispjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697848359; x=1729384359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qoz/YZpniMqD78ggWQEtOtgpA+xuXBYw/SFNdddBDag=;
  b=bvTispjy4j5w0kKnEVE4t3msx9D5V0EJFyoVsaiqrRqbobzFVQa1FRIV
   mF8frBVBuoVg6fLfK4QeEa/5efztw2md/1pvi+xhDaLcv1ZwmNLj/GnJ1
   FY6U7F+Hj+WqNLczfLqcgOex+mzex6v1wr3SN3mnAdggn+BHbtGgmssQ9
   mJi/6n9ln5FR2jh+id5692zOY9Rg6Bdwvp7MfIdBPfGDi3iysOzZ3UEa9
   WLIVdRTLL8hTX5xnb9/k4KkudDSYR6TTyp2x1IkaKwGKEAogabwjZVFL2
   vaqCN691g/cwSmBMgX3eMoQlntD9HLPlpmusjgkRCjHaVv4Kh4q9yaxtp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="383804588"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="383804588"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 17:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5259244"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2023 17:31:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtzut-0004AE-1b;
	Sat, 21 Oct 2023 00:32:35 +0000
Date: Sat, 21 Oct 2023 08:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc6-esp32 28/43] checkpatch: WARNING:
 suspect code indent for conditional statements (8, 15)
Message-ID: <202310210837.RhYloiD6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc6-esp32
head:   7b60fbaf629519456a4de1b76bf9edfb331ffb50
commit: 6dcf24bb77de1b5cb5ccd9264371ced5b405edc6 [28/43] esp_wifi: rearrange esp_get_packets
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210837.RhYloiD6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210837.RhYloiD6-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#43: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:750:
+	while ((skb = adapter->if_ops->read(adapter)))
+	       process_rx_packet(adapter, skb);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
