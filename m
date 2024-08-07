Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1069D13AA41
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 16:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723048869; cv=none; b=EjEVcZJMgtDWXlSCafljcXZsYYYEz/djn6KKxb/o2orZOO4yfNHTtfTW3mmAI+TLP8imjrwUgTgaAOZa15zt+f7rksgcH7Ar4G6wYQxBlX09Y/d2qrZTt1yD032F9IU0jHNUKq5gNt/CqgSAVlH1Ct+s+31hYCz9ViukwIB2elw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723048869; c=relaxed/simple;
	bh=e0KnvDWMzc6XT2OnRv/RwXXI53FLJboRr8BRTAWMFug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JEwO+5DhQiDz0NNqTe6MWb6OsoN+JPtSZq/ctlFp/635iIerUNYvH/NAQACGFbyiJSl6d47kXrlgHEh5Lvk5IJjAFAD3mROJvts+THSCw7tjdrDV2JEEzGGeuxyJHFmIxaL22lcVpkRS7YP0E3HVRZLO82vdAST7FTf1B7no4Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHiiz7s/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHiiz7s/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723048866; x=1754584866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e0KnvDWMzc6XT2OnRv/RwXXI53FLJboRr8BRTAWMFug=;
  b=QHiiz7s/uwP8AUNO08CACsjAFVOaRhnUkFOzML/gXf3VSS71Qm9oGKvE
   34UwSaVhDGi6SfGHXsQNKYMk8ZHdwjUUJsSIfpIcsSMfBREhH2XfugFLm
   bNpgR6S53r3cfedpLInMgLZ4NOFFukjpfgHVXn7qICsayqDEayeA17Zi5
   cUC7oS53uMICHBWZzTypOTf+3loZSkkcwm9wq4JpxOCwRoUj3W6ELWfL5
   sQtbGr5c1Q74gzwYnG/gV+5zXuGEX3O0B8HPE+48V5au8xOLwjiThXs4G
   vTqGw+zB/uiVlRzGJoQ2l4RAbtU552YaSjRZFcaA7dAN35S6azyNVZlGY
   w==;
X-CSE-ConnectionGUID: qn5ucTzORniNUhVbrnZqow==
X-CSE-MsgGUID: e9Op/ESBQmW/HAcqyOUScg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20707790"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="20707790"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 09:41:05 -0700
X-CSE-ConnectionGUID: 8XnGeUvSQi6zx239DFJeyg==
X-CSE-MsgGUID: Af0QJr4TT1a/O3ggydP2Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="61561724"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 07 Aug 2024 09:41:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbjif-0005Yc-2U;
	Wed, 07 Aug 2024 16:41:01 +0000
Date: Thu, 8 Aug 2024 00:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>, linux-doc@vger.kernel.org
Subject: [srini-nvmem:for-next 5/6] htmldocs: Warning: MAINTAINERS references
 a file that doesn't exist:
 Documentation/devicetree/bindings/nvmem/u-boot,env.yaml
Message-ID: <202408080021.9oj3n9Ro-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
head:   641d6abbe15f96a4d2cce5dc48940fd22916d15e
commit: 1b3f5b88c541318a95fc74db80083b87c1020e03 [5/6] dt-bindings: nvmem: convert U-Boot env to a layout
reproduce: (https://download.01.org/0day-ci/archive/20240808/202408080021.9oj3n9Ro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080021.9oj3n9Ro-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/nvmem/u-boot,env.yaml
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
