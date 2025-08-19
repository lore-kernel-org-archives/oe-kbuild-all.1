Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02ED14AD2B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 03:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755574362; cv=none; b=ESAFeb23gnVhkqyJFdKgg870nQA5t239XaAnwQlI80VgfT702BojWt4Pq38w/G5kYd8N+6rxv9o6fLMr/k7amDF+Z/EwAHvudpRJ+1uLyH9CZBYzIndqgL7kaQEZUdeyS5R1ekbRGMCgQp3IPN/iLqnppEZL2+3kxZw0cg/IBOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755574362; c=relaxed/simple;
	bh=q3526BUAxicDe4mK4TVB0A18N/m1MKyoIMPvQ/IIODA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guOF5yoekSfQmvQKMkkJL0g7KoykxFGIqFtzqBWA2iDOHyaZMvyZ51WBUVdQUHzkETdy3DUXeUfuSfWGDHqKQzh0uOHkmzxACMXDoeu8weiOFRnRY5RofmqGqA38imXHcQSWz6aajRDmZ7D+PaD1nR7VESNR5w4PRMqdLgrwwtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuEX/1Rk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuEX/1Rk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755574361; x=1787110361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q3526BUAxicDe4mK4TVB0A18N/m1MKyoIMPvQ/IIODA=;
  b=SuEX/1RkNy4obxPaXaQhDhOW+iqMGIPq0VAq08qEmvmHTcxAMjrIcxGH
   r9oDrzJbdFg3Q54nJoRsbLyRR6ts4OEHXYId9Nc7Fc2MBI34lJGgeB9l4
   CqC3agshmkjuAQurNM0B1BW0WWYuuG6Hzfi4U+SyCZWr5u7ZyMzfJmwO2
   C/d76vndVrykWmrg4gFZyMLcHTpMIZBrl7ttmrt0fzZ8JEQcxBJWRKLm5
   ItWy+QqA+KJ/GzxEhRHb99Mk+446XzWdLYdVPkIH7JDUIBgw6cwkF0Kss
   MYq7r1KEWQ3Zk6hB2v8HNvs4CfmNnOfY1NgHPKwtoLXpp6lHG6GxTlR3t
   Q==;
X-CSE-ConnectionGUID: SxMQmfUaSuyAA4LJ4rF7VA==
X-CSE-MsgGUID: kGJ21GM2QKeVaIcJ4B/cWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="83236058"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="83236058"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 20:32:40 -0700
X-CSE-ConnectionGUID: Fee4F7f7ToaYhdNs6ihxCA==
X-CSE-MsgGUID: TWhnzNskQCqlPV1RiTRlAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167246268"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 20:32:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoD5O-000GSx-0d;
	Tue, 19 Aug 2025 03:32:34 +0000
Date: Tue, 19 Aug 2025 11:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: Arseniy Velikanov <me@adomerle.pw>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Arseniy Velikanov <me@adomerle.pw>
Subject: Re: [PATCH v1 2/2] phy: mediatek: tphy: Add software role switching
Message-ID: <202508191054.otlyeeg5-lkp@intel.com>
References: <20250814234825.810-2-me@adomerle.pw>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814234825.810-2-me@adomerle.pw>

Hi Arseniy,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.17-rc2 next-20250818]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arseniy-Velikanov/phy-mediatek-tphy-Add-software-role-switching/20250815-075416
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250814234825.810-2-me%40adomerle.pw
patch subject: [PATCH v1 2/2] phy: mediatek: tphy: Add software role switching
config: arm64-randconfig-001-20250819 (https://download.01.org/0day-ci/archive/20250819/202508191054.otlyeeg5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508191054.otlyeeg5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508191054.otlyeeg5-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/phy/mediatek/phy-mtk-tphy.o: in function `u2_phy_software_role_switch_init':
>> phy-mtk-tphy.c:(.text+0x31d4): undefined reference to `usb_get_role_switch_default_mode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
