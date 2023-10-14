Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F075710F2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNb/q39J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697297766; x=1728833766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kcTLbnZcCLC1FNfW9SCh8B8K9Jky90M46hZ/Tf9ExU0=;
  b=MNb/q39JSRV2stumW/voH4dFD6lj5mr5/qc83cpEBYJSYyn26d5+Bc/O
   NzefTRIbcsqfHVmQxkkdua+4UaZ8xNDVu4LbIzC+86yuPJCPhB0lf5f5e
   H7HFpndmb6HVQAOp/XEidLXV7CDij8uEkqr5qVsjatiMm3xujqlXhTJ3v
   Gz3Jol3xMJ5i3c9tolCoFrUzHspoyRzW1NERcMwZqg7g0kaOBMKqQpyta
   2L6ccmqpMpQHpngXZbC+9Q7txu71waRGzKnzEYAQcff4DvjmVto4Dm3w1
   nbx/8jJfDDbSEWg6BGouUdNBfAaZoVXcAIi0wFkzvywxI96jct/f/XLjt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="3943242"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="3943242"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 08:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="755058308"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="755058308"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Oct 2023 08:36:03 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrggL-0006JT-1h;
	Sat, 14 Oct 2023 15:36:01 +0000
Date: Sat, 14 Oct 2023 23:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Gouly <joey.gouly@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/feat_lse128 6/6] checkpatch: WARNING: space
 prohibited between function name and open parenthesis '('
Message-ID: <202310142351.ZSbO0lRC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/feat_lse128
head:   72e301956dbb31bd679eff66fbe3da32d2dc2af5
commit: 72e301956dbb31bd679eff66fbe3da32d2dc2af5 [6/6] kselftest/arm64: add FEAT_LSE128 to hwcap test
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310142351.ZSbO0lRC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142351.ZSbO0lRC-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#27: FILE: tools/testing/selftests/arm64/abi/hwcap.c:86:
+	u64 __attribute__ ((aligned (16))) mem[2] = { 10, 20 };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
