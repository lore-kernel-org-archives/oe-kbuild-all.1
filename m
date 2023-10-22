Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97512F51
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6yE3L8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697976119; x=1729512119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1+EME6/XrPRU90YrywMkk9/B10YrGiYHUwClKV6ZNkI=;
  b=l6yE3L8ZjDj2BkbEl84ebh2JceMIpXLBl1Q8Hl26ogzlSDcWDmP1Akz+
   s/eF2SnoeB5sYcLs/09GQZVw7XTK2zy7DfmqROULo7fH8NweriwFWfhcW
   DxCotWwxzo/N8x7yzObV5skuLZu7DrwYxHy/KK26oi9i5jV0jGlsUClmU
   R4pN9dgd2XjfS+41iMY5k2Uv6LcrmS1ZNIS9Mpnxnl7wI2NkYIhjkLjfz
   Dr2wi+DUl3Z/bsIlr6DmBOH5F+jGdKJw7oyRhWfMVxmCCHwPE1gmZhqze
   dyXu6TIt460AcVWcn/9fNimNdghLtfGf9GQ3qCCqlF6SwHfwUFUN6C/Rf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="366925418"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="366925418"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 05:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="1089198785"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="1089198785"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Oct 2023 05:01:54 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quX9U-0005wI-1X;
	Sun, 22 Oct 2023 12:01:52 +0000
Date: Sun, 22 Oct 2023 20:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: phy: ralink-usb-phy: convert to dtschema
Message-ID: <202310221955.omy7vvDK-lkp@intel.com>
References: <20231022102901.797030-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231022102901.797030-1-sergio.paracuellos@gmail.com>

Hi Sergio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sergio-Paracuellos/dt-bindings-phy-ralink-usb-phy-convert-to-dtschema/20231022-183119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231022102901.797030-1-sergio.paracuellos%40gmail.com
patch subject: [PATCH] dt-bindings: phy: ralink-usb-phy: convert to dtschema
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221955.omy7vvDK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221955.omy7vvDK-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#51: FILE: Documentation/devicetree/bindings/phy/ralink-usb-phy.yaml:1:
+%YAML 1.2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
