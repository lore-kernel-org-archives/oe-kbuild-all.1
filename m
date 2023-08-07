Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CD27F7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 01:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691372790; x=1722908790;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=XGM1utmsfHEk4SHuVyr5OomDusaMVmqQC3+5ecQQrmk=;
  b=no5lWuW9Gx98sWRI7hVaNaglMEr455R2fjVMlgGmSNdQJgatDkY/MZyv
   AdH4zFzmDp+So2od3q1ldTRqge3a/h4bNm5/sGT8HsXF50d/MTF59JoVF
   xk67opxRd0sMKmvaJFeUMNPZj5yZl+wrsPQ+9a92HTLGgJ7W4xawWFd8E
   ta6EHWhnwgLnIMO8OH58svVI/WnLtiQq4UrMz9EpLsT4ah+8Ve4jLPe9r
   K8ER3mD3C4eYB0763g88iz702Loa0gZKir2FyGNbhrPZjwpu53RGZHd1g
   Q1ThhJam3mJo0KCSzu+y+I2bBYFdadEZ0vEMKaSJwfGnSKw6QE3XMjKi2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="367889704"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="367889704"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 18:46:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="707675359"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="707675359"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Aug 2023 18:46:27 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSpKE-0004TD-2A;
	Mon, 07 Aug 2023 01:46:26 +0000
Date: Mon, 7 Aug 2023 09:46:00 +0800
From: kernel test robot <lkp@intel.com>
To: max.chou@realtek.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] Bluetooth: btrtl: Load FW v2 otherwise FW v1 for
 RTL8852C
Message-ID: <ZNBM2EBlpkYZycgQ@11d7ca01dc46>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807014415.12358-1-max.chou@realtek.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v3] Bluetooth: btrtl: Load FW v2 otherwise FW v1 for RTL8852C
Link: https://lore.kernel.org/stable/20230807014415.12358-1-max.chou%40realtek.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



