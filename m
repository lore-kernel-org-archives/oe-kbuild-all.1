Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8F72A9EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 23:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685143428; x=1716679428;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=vZw7XFb0poPB6g958cKcQC9zcUDzc8KuxqyaWW3o7AU=;
  b=PLtXdiFpgBPKwOhbchw2R1N9TKq7zKH650vh40lYNouPHjYh5SWJzkvx
   qpUBigTx6Hzm+tXVJaaRpZUZLRLctN1IYi/e5/YgVWTQNogGdVSsIUime
   SJ6OgDwH5dSLi16XKPY4Fc5gH1DYEqiYCmmjCzzLg1Hy39hlUtphO9QZq
   o8KCRRASsNQDHwhOK1/8Ks/i2+GNEG33jZlZ0+6OeeNxvjMG3IbtM9FNk
   rf/lsm5x5o+Szd49vswWvPqReoKz8DQ2JF2cN29RX/5i9ouA6zKm/wI2y
   KMWWfFrVmU8+P58ivJVipVaxXBSN+U5Aw7kG+gcKBzv1JV3KvZx+9mEKD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356711763"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="356711763"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 16:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879692378"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="879692378"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 May 2023 16:23:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2gmg-000Jf8-1L;
	Fri, 26 May 2023 23:23:46 +0000
Date: Sat, 27 May 2023 07:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: Hardik Garg <hargar@linux.microsoft.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6.1 5.15 5.10 5.4 4.19 4.14] selftests/memfd: Fix unknown
 type name build failure
Message-ID: <ZHE/avMpv2Sjqwxf@3bef23cc04e9>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526232136.255244-1-hargar@linux.microsoft.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 6.1 5.15 5.10 5.4 4.19 4.14] selftests/memfd: Fix unknown type name build failure
Link: https://lore.kernel.org/stable/20230526232136.255244-1-hargar%40linux.microsoft.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



