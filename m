Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8809D21E3B4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 21:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729028996; cv=none; b=T0UwyKKxvt852F1lIyZtcYQ7JO8Z0HVKzeadk8ax8enQOpJ2UOx2GFTf5zJcKmh3Duifpr9KuTzOHJG0MmGf9RthF+P82mr1xOb2oR4Qu0Dw+gGs8yrRXVD/sIDAhj2P/c34HhKVeeoukTRMIENRMvBWKhfQpy/cGgDsVLylQIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729028996; c=relaxed/simple;
	bh=t8l2PQQC/6/ox/3K2+V1dY4B9/uKczkWWiR6f/lPBXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hAxUwUVCksp7NXZh5MTTSqY3+/mk4IUsDJ8lwduKROk55N3vsF+KZP6dYtIfpzRJFNV7BF5etApbvxAZ8n07MGKp8sI5oevYYqdsD+doDcaTCwiJry816zrU+0vhgtxMmLYqeeGEYflXvABr7FRlePSO+1nbxTUhHVZs53Shois=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tk3sjicb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tk3sjicb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729028993; x=1760564993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t8l2PQQC/6/ox/3K2+V1dY4B9/uKczkWWiR6f/lPBXQ=;
  b=Tk3sjicbW6YnzEPCtGKddQ1a7lBg6zgMNkJyeX0usSuXcESTh37+XgOp
   qSERFNlomCBWRSDda6xGlvTbthyNAXosNUPyJA9cJCNPnvyctoPMFdhAs
   eO2tuVPqL4lub5wHOHP2jW7YXNCX33mN8EDuhgr5ctXumZPk6woWtt815
   5JN4AOR53EP67mI3xTFFCvHPOcGw00uletbVDrlW5pGC8/AK7nT18Eb2i
   eis0HmdVhYyXB/RDc4BtPPmQi6FWf1LyXIdbVzO35T9CuvQRrCyfrkcBb
   TKAJlEtU2TeDyJPscSOd/ISC7niEjNdS9756G3AcbjlsbaPjXLRL4O9w/
   Q==;
X-CSE-ConnectionGUID: rv0lZccJSk2yDU1kPUohBg==
X-CSE-MsgGUID: 23NFSVbCSvi/8oCvqfIQ2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39085233"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="39085233"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 14:49:53 -0700
X-CSE-ConnectionGUID: rG4bsEmZSV+7X90vHdEI4A==
X-CSE-MsgGUID: 9ltnfMeKQ5i8SyIw1sou+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="82681951"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2024 14:49:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0pQL-000JyN-2i;
	Tue, 15 Oct 2024 21:49:49 +0000
Date: Wed, 16 Oct 2024 05:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>, linux-doc@vger.kernel.org
Subject: [lee-mfd:for-mfd-next 32/32] htmldocs: Warning:
 Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.txt references
 a file that doesn't exist:
 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
Message-ID: <202410160528.7HLubyG3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   f4b00ab2c29960961f9641be8f3e8ba4960fd849
commit: f4b00ab2c29960961f9641be8f3e8ba4960fd849 [32/32] dt-bindings: mfd: Convert zii,rave-sp.txt to yaml format
reproduce: (https://download.01.org/0day-ci/archive/20241016/202410160528.7HLubyG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160528.7HLubyG3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
>> Warning: Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.txt references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
>> Warning: Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
>> Warning: Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
