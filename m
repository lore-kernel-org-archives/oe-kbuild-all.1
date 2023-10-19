Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C4C16416
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeSbjjdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697706068; x=1729242068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EwwQ4rhlw1i5wzMdlM19JOvWduktVRVCdL3SH62hCgs=;
  b=JeSbjjdJ2HLB8jjLjRDGKVGdT5oc5wgqylzsGAhbthJt0fVCXFZ6KWPB
   8nGrHQ/D1GCcsuzurUMuciZQ06XV7/YHg11gDbYcAdqRdiXywASzYU3qk
   ovBhzx/Mqa3dDNjxHFJRBFN3DoatrGtIfVQoIhy7rl1SnBN2zaFJkL8Om
   6wmRzX3ZA3Jfp+FSl2HqDn7RBYa1kx2YTJQOnhhybDaW/IaIcsZobufnS
   u/5thX5JbqKo3innjkzNQwtKJPfBUN+ddInyOp5RGv/nRu/HBls1gwiRA
   q4W6r2sUIbUTE792t/+LL6idqqTUGQG5UUxRAy2Uyd9ZoRPGcXeY0u6NH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="7761635"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="7761635"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 02:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="873394208"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="873394208"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Oct 2023 02:01:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtOto-0001te-0D;
	Thu, 19 Oct 2023 09:01:00 +0000
Date: Thu, 19 Oct 2023 17:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Yang <yiyang13@huawei.com>, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	u.kleine-koenig@pengutronix.de, tudor.ambarus@linaro.org,
	robh@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] mtd: powernv_flash: check return value of
 devm_kasprintf()
Message-ID: <202310191650.ib8cKENG-lkp@intel.com>
References: <20231019065618.318495-1-yiyang13@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019065618.318495-1-yiyang13@huawei.com>

Hi Yi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/mtd/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-Yang/mtd-powernv_flash-check-return-value-of-devm_kasprintf/20231019-145927
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
patch link:    https://lore.kernel.org/r/20231019065618.318495-1-yiyang13%40huawei.com
patch subject: [PATCH v3] mtd: powernv_flash: check return value of devm_kasprintf()
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310191650.ib8cKENG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191650.ib8cKENG-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#26: FILE: drivers/mtd/devices/powernv_flash.c:212:
+^I$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
