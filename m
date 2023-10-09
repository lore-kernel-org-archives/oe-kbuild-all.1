Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA05339BC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5ONMauL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696867474; x=1728403474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xVGqlS7LaCbb3n5Sy3qivv+XPMNzDr8YRZEIm/seggk=;
  b=B5ONMauL9wiOtcro6u0Jnh6tiEGtyIymd+FHN1ciZ5ktrU3HwTvgLynr
   ad/ICOZEnPEBMIVPTvs7qlo/F/Tn6vl3dpBa14ai5d5bzflTuyxpe1e93
   GVcRgcr3XaWJbG5fuQT3Q2K7i3ZokQ0MnlvWjatRdeAq/bXe9tDrV4Eoo
   L4vhSC9U2wxmyvbwP39iff0pAQxZMl16ZLFhEhUTDBO8Ij9gdMGtpfVbf
   zPR4gZ4Xa5kf6iuesMAEwld2vlPz7GgDHYY5NnZutRXueCpBvKHBezJcW
   qF8RfqYdc0z82fD/snUxxmbs/uiOD+9BdqVPrJ+cEOYdPPrFasL64RZDd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363527663"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="363527663"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 09:02:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1084361024"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="1084361024"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 09 Oct 2023 09:02:56 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpsib-0000Ku-2u;
	Mon, 09 Oct 2023 16:02:53 +0000
Date: Tue, 10 Oct 2023 00:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org,
	kvalo@kernel.org, quic_jjohnson@quicinc.com
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	quic_lingbok@quicinc.com
Subject: Re: [PATCH v5 1/4] wifi: ath12k: add TAS capability for WCN7850
Message-ID: <202310092349.fe3kN7bp-lkp@intel.com>
References: <20231009090149.247211-2-quic_lingbok@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009090149.247211-2-quic_lingbok@quicinc.com>

Hi Lingbo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3b961e3a412d9d4b70418f53d07847af0a7ea376]

url:    https://github.com/intel-lab-lkp/linux/commits/Lingbo-Kong/wifi-ath12k-add-TAS-capability-for-WCN7850/20231009-170444
base:   3b961e3a412d9d4b70418f53d07847af0a7ea376
patch link:    https://lore.kernel.org/r/20231009090149.247211-2-quic_lingbok%40quicinc.com
patch subject: [PATCH v5 1/4] wifi: ath12k: add TAS capability for WCN7850
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231009/202310092349.fe3kN7bp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310092349.fe3kN7bp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310092349.fe3kN7bp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/acpi.c:109:6: warning: no previous prototype for 'ath12k_acpi_remove_notify' [-Wmissing-prototypes]
     109 | void ath12k_acpi_remove_notify(struct ath12k_base *ab)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ath12k_acpi_remove_notify +109 drivers/net/wireless/ath/ath12k/acpi.c

   108	
 > 109	void ath12k_acpi_remove_notify(struct ath12k_base *ab)
   110	{
   111		acpi_remove_notify_handler(ACPI_HANDLE(ab->dev),
   112					   ACPI_DEVICE_NOTIFY,
   113					   acpi_dsm_notify);
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
