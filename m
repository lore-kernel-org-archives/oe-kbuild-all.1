Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6016FCD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680188936; x=1711724936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9X5RJ4c+ptuUM1bme3S23XjEv8J3KsKmGwReVeUc16w=;
  b=bdVvmipz9u42D9Lt67KQvRjSY9ic0ibPH1htg4Q/nAhNHhFqmQ3YStjD
   GkxwF0W+6WANSpxo/qbSwn1Au6q8btwIdR5px1fUVigiXd+5lzAWPw+qe
   2UWVzHosdJK7Pt0hgMYx2zEz8F5IvDaTBDCeSIvdtyVgH0n86Dty1d3tj
   6Nb1Wup1iI1xenO4k+BCikWgdYLnZQwaX1jqkEUh6memggPOniJljlpVK
   jimOEW6hjazs021iw9hE0slfyWCIhx/l5KTsIU9NI54vAZVKdqc7v0cot
   nvB05AFi167gch3v4Ov0xBlibWpK65+5MsB3XtGA8QsEcike78GoqUj8G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="406183949"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406183949"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 08:06:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="717343222"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="717343222"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Mar 2023 08:05:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phtqf-000Kw0-1g;
	Thu, 30 Mar 2023 15:05:57 +0000
Date: Thu, 30 Mar 2023 23:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hay <joshua.a.hay@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Alan Brady <alan.brady@intel.com>,
	Madhu Chittim <madhu.chittim@intel.com>,
	Phani Burra <phani.r.burra@intel.com>,
	Pavan Kumar Linga <pavan.kumar.linga@intel.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	linux-doc@vger.kernel.org
Subject: [tnguy-next-queue:10GbE 15/15] htmldocs:
 Documentation/networking/device_drivers/ethernet/intel/idpf.rst: WARNING:
 document isn't included in any toctree
Message-ID: <202303302334.b3zIhN9j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git 10GbE
head:   e8a488d38e0a75704e37e952fedd329e977df362
commit: e8a488d38e0a75704e37e952fedd329e977df362 [15/15] idpf: configure SRIOV and add other ndo_ops
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git/commit/?id=e8a488d38e0a75704e37e952fedd329e977df362
        git remote add tnguy-next-queue https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git
        git fetch --no-tags tnguy-next-queue 10GbE
        git checkout e8a488d38e0a75704e37e952fedd329e977df362
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303302334.b3zIhN9j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/networking/device_drivers/ethernet/intel/idpf.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
