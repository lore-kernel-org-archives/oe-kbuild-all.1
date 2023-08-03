Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BE51F16D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 21:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691099633; x=1722635633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F0EnU0XHNIoo4Lv8X9OzvOsM5FmLWlsmXOwCphhKAEk=;
  b=hB7cyG9wPnPFck0ybSvQcpmocPw+XbdOp9F7/vlkOi/WQXMsEdxsDFf0
   clwQwylJV6N+bnGwE96R7EzItQOAlN1c3LUIID1iJSTpP4yQn6EW6Cdzs
   DCoawHRxsNRR5tC5n9bymq5+44YE2VfkwqQtVAVe8OJsvOCVhthyr82ms
   2B4GfmzURioQfo2Y6O/3cB4oSDQcFoEga5BH1TyAmxtMvVuQNlG2FQHgc
   c91yE5T6rpyqzPM48SPzP4qa1LaNx8H2IitZhcYbKEO9fTCv+Tl/s5AJw
   MAMhD9aY5QzeLHrRYvoxMT6ETXs2kdMqobu+lTpKX0xUWxmVSueR9AFM4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="367469744"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="367469744"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 14:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="843781848"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="843781848"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2023 14:53:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRgGU-0002NN-1H;
	Thu, 03 Aug 2023 21:53:50 +0000
Date: Fri, 4 Aug 2023 05:53:17 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [intel-tdx:kvm-upstream-workaround 176/346] htmldocs: Warning:
 Documentation/virt/kvm/api.rst references a file that doesn't exist:
 Documentation/virt/kvm/intel-tdx.rst
Message-ID: <202308040545.Ds02CCWB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   c06084048271278d3508f534479b356f49f619ce
commit: 8afe6d84c0b5a93750cf48feb4b843896f291650 [176/346] Documentation/virt/kvm: Document on Trust Domain Extensions(TDX)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040545.Ds02CCWB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040545.Ds02CCWB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/virt/kvm/intel-tdx.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
