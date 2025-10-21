Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79762134AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761045268; cv=none; b=V8uh6iOf5OjGnNlwP48ckIw/dcw0oOY3YhYKBXXKof5wm5qHj5/ZMXLsT3ukk5Uq3y0TguWqwyZrYK5zoHEcz4IH7CD195v7R9cMqeatUnRQE7NUO/WfBJvJHd9vLTcL1oeRYczGWXPLAZxIIZwejSuk+1ZDVQFppvdFUl/EjmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761045268; c=relaxed/simple;
	bh=g8NXQ6m7u0SZZ3TYOwL19uL629hjA7QJxr4PrVc4Lyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g8fUEC7ahFlv1YZRDqRr8hRqQ+m6YwTa5X/PB3YMoMaOUfgoPMzoOmvjzLUwzGBOF+3GDKtJn/WeuUzoKUqV2y2CrQTnlwrVZC/IoiOTMfUVSPlZn983v9iaI/Dj9IoBEaNrchbLihWw7ivzU8tRXGnU8KQRy2uXimnD5AjjXlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJC3ZCKm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJC3ZCKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761045267; x=1792581267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g8NXQ6m7u0SZZ3TYOwL19uL629hjA7QJxr4PrVc4Lyg=;
  b=DJC3ZCKmjIk5cNermiauM2vMOKTE+fj3JknsESlGX9sgZfYeNIAtH17a
   EMV2NiYzXX9f6/bw1xSERn/qITm2rwA9HOX4oapgq5Z14D0LkW28/EMap
   4IPmvPviqcC0qRi6UnosKN07BY9dlocvQwg/sH7SC3UOJub9RziQkPjos
   fY1dkzvHXCr03Et+9ulgniO+PYQh2Zo4uhf96kdoJdaI04BTcThNWCFLd
   w83+8UeWeXCQXwNHJHMMyDLaELjgWCLwSTBVqi5bxI/9bXHowD2F9CbuV
   WCf2KxyQp2e/UMfmBddRe6ZiOPnkOOgS++EN1jNKZ5lbNNk31zfj6CJE9
   A==;
X-CSE-ConnectionGUID: xSaRZthCQUuBYYrjWqb/KA==
X-CSE-MsgGUID: IPsedGbHQHykU1tVtV5h8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80793324"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="80793324"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 04:14:26 -0700
X-CSE-ConnectionGUID: 8wlk/WniQAuSC9OTjvFuEQ==
X-CSE-MsgGUID: P4j+aVV5R06GEOwFAXdjoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="207241231"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Oct 2025 04:14:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBAJq-000AlV-1N;
	Tue, 21 Oct 2025 11:14:22 +0000
Date: Tue, 21 Oct 2025 19:13:40 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [linux-next:master 2463/3056] arc-linux-ld: clk-acpm.c:undefined
 reference to `devm_acpm_get_by_node'
Message-ID: <202510211905.RgfWkgss-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
commit: 40498a74205371400a5b0088acb886ac47a523aa [2463/3056] clk: samsung: add Exynos ACPM clock driver
config: arc-randconfig-r132-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211905.RgfWkgss-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211905.RgfWkgss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510211905.RgfWkgss-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/clk/samsung/clk-acpm.o: in function `acpm_clk_probe':
   clk-acpm.c:(.text+0x3e): undefined reference to `devm_acpm_get_by_node'
>> arc-linux-ld: clk-acpm.c:(.text+0x3e): undefined reference to `devm_acpm_get_by_node'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
