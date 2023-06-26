Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4598F40
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jun 2023 12:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687781830; x=1719317830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UXMN7E+WAM8/nmLl/3dLtBMxB1Qc2wvZCRCzv2jCx6o=;
  b=kOgaFtWK+CMhipLNFQtBRvQMeeYn+aUhT6uwtFfKBhhqrNEC/tdGelfI
   ytPECGzTVdlf9Rf5GEc5hv2KwaCM1YxWD2Ly2OyPkJUmWZ775GTn7TqhX
   lOKdS2L8vPhILjB+EVys/caB5F4FR5Q3W3/2VlBiSdOfMdXTxo4q4tspN
   ZzCLqffOviKqedgoqp3ll92QcjybiC4hFXrOJS00uWXLCAhE49d8fHuBS
   7Izvn92XHKFf2pmHlEClR3bQwLoAMTlpWemHDvH9m2Wt3yJZ85Dvss07M
   IEYN39In7hIK+QY3f096P2JRlTcShDn6w5MMH9n+CyBkzyS+DUYbLoc+q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="341590580"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="341590580"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 05:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="781414288"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="781414288"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jun 2023 05:17:08 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDl9X-000Agv-33;
	Mon, 26 Jun 2023 12:17:07 +0000
Date: Mon, 26 Jun 2023 20:16:33 +0800
From: kernel test robot <lkp@intel.com>
To: Pauli Virtanen <pav@iki.fi>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [linux-next:master 5616/12689] net/bluetooth/hci_conn.c:1884:7-14:
 WARNING opportunity for kmemdup
Message-ID: <202306262024.HUr6WfyW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   60e7c4a25da68cd826719b685babbd23e73b85b0
commit: 723a47d445e00d05087df21818ba8396d0b4c9b1 [5616/12689] Bluetooth: ISO: use hci_sync for setting CIG parameters
config: sparc64-randconfig-r053-20230625 (https://download.01.org/0day-ci/archive/20230626/202306262024.HUr6WfyW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306262024.HUr6WfyW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306262024.HUr6WfyW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/bluetooth/hci_conn.c:1884:7-14: WARNING opportunity for kmemdup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
